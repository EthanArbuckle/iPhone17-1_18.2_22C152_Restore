@interface LoadWiFiDEAsync
@end

@implementation LoadWiFiDEAsync

void ___LoadWiFiDEAsync_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x230F48DA0]();
  v3 = (void *)[MEMORY[0x263F3A090] sharedInstance];
  [v3 loadExtensions];
  uint64_t v4 = [v3 extensionForIdentifier:@"com.apple.DiagnosticExtensions.WiFi"];
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(*(void *)(v5 + 8) + 88);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = ___LoadWiFiDEAsync_block_invoke_2;
  v7[3] = &unk_2648960F0;
  v7[4] = v5;
  v7[5] = v4;
  dispatch_sync(v6, v7);
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 8));
}

void ___LoadWiFiDEAsync_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(v1 + 56);
  id v3 = v2;
  *(void *)(v1 + 56) = v2;
}

@end