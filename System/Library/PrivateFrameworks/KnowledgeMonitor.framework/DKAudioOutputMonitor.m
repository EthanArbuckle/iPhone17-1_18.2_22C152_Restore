@interface DKAudioOutputMonitor
@end

@implementation DKAudioOutputMonitor

uint64_t __29___DKAudioOutputMonitor_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 primaryValue];
  v7 = [v5 primaryValue];
  int v8 = [v6 isEqual:v7];

  if (!v8) {
    goto LABEL_4;
  }
  v9 = [v4 metadata];
  v10 = [MEMORY[0x263F35030] identifier];
  v11 = [v9 objectForKeyedSubscript:v10];

  uint64_t v12 = [v5 metadata];
  v13 = [MEMORY[0x263F35030] identifier];
  v14 = [(id)v12 objectForKeyedSubscript:v13];

  LOBYTE(v12) = [v11 isEqual:v14];
  if (v12) {
    uint64_t v15 = 0;
  }
  else {
LABEL_4:
  }
    uint64_t v15 = -1;

  return v15;
}

void __56___DKAudioOutputMonitor_onAudioRouteChangeNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) portType];
  if ([v7 isEqualToString:*MEMORY[0x263EF91E8]])
  {
  }
  else
  {
    int v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) portType];
    char v9 = [v8 isEqualToString:*MEMORY[0x263EF91F0]];

    if ((v9 & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

@end