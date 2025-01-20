@interface SFDownloadDispatcher
@end

@implementation SFDownloadDispatcher

void __49___SFDownloadDispatcher_sharedDownloadDispatcher__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDownloadDispatcher_instance;
  sharedDownloadDispatcher_instance = (uint64_t)v1;
}

uint64_t __54___SFDownloadDispatcher_startDownloadFromWebView_URL___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) downloadDidStart:a2];
}

uint64_t __63___SFDownloadDispatcher_startDownloadForCurrentURLFromWebView___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) downloadDidStart:a2];
}

void __42___SFDownloadDispatcher_downloadDidStart___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F289A0];
  id v6 = a2;
  id v7 = [v4 errorWithDomain:v5 code:-999 userInfo:0];
  [v2 download:v3 didFailWithError:v7 resumeData:v6];
}

@end