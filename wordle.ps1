$words = Get-Content ".\words.txt"
$numTentativas = 6

[string]$escolhida = $words | Get-Random
$won = $false
#[System.Collections.ArrayList]$tentativas = @()
function PrintarTentativa { param ([string]$tentativa )

    [char[]]$a = $escolhida.ToCharArray()

    [char[]]$t = $tentativa.ToCharArray()

    for ($i = 0; $i -lt $a.Count; $i++) {
        
        if($a[$i] -eq $t[$i])
        {
            Write-Host $t[$i] -NoNewline -BackgroundColor Green
        }
        elseif ($escolhida.Contains($t[$i])) {
            Write-Host $t[$i] -NoNewline -BackgroundColor Yellow
        }
        else {
            Write-Host $t[$i] -NoNewline
        }
    }
    
    Write-Host ""
        
}

Write-Host $escolhida

while ($numTentativas -gt 0 -or !$won) {
    
    $t = Read-Host "Your guess"
    #$tentativas.Add($t)
    PrintarTentativa -tentativa $t
    $numTentativas--
    if($t -eq $escolhida)
    {
        $won = $true
        break
    }
}
if($won) {Write-Host "Unfortunately, you won. :("}
else {Write-Host "Congratulations, you lose!"}
