@interface LTTextSessionRequest
@end

@implementation LTTextSessionRequest

uint64_t __95___LTTextSessionRequest_initForDownloadRequestWithSourceLocale_targetLocale_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:13 userInfo:0];
    v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke_cold_1((uint64_t)v2, v3);
    }
    [WeakRetained didReceiveError:v2 forInput:0];
  }
}

void __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
    (uint8_t *)&v2,
    0xCu);
}

@end