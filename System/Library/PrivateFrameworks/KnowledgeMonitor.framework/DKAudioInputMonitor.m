@interface DKAudioInputMonitor
@end

@implementation DKAudioInputMonitor

void __55___DKAudioInputMonitor_onAudioRouteChangeNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v7 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) portType];
  char v8 = [v7 isEqualToString:*MEMORY[0x263EF91E0]];

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end