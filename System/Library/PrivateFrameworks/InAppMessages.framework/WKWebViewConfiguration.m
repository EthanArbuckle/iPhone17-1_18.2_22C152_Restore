@interface WKWebViewConfiguration
@end

@implementation WKWebViewConfiguration

void __64__WKWebViewConfiguration_IAMShared__sharedMessagesConfiguration__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1FA60]);
  v1 = (void *)sharedMessagesConfiguration_sharedConfiguration;
  sharedMessagesConfiguration_sharedConfiguration = (uint64_t)v0;

  [(id)sharedMessagesConfiguration_sharedConfiguration setAllowsInlineMediaPlayback:1];
  id v3 = [MEMORY[0x263F1FA28] webContentProcessPool];
  [(id)sharedMessagesConfiguration_sharedConfiguration setProcessPool:v3];
  id v2 = objc_alloc_init(MEMORY[0x263F1FA20]);
  [v2 _setAllowFileAccessFromFileURLs:1];
  [(id)sharedMessagesConfiguration_sharedConfiguration setPreferences:v2];
  [(id)sharedMessagesConfiguration_sharedConfiguration _setWaitsForPaintAfterViewDidMoveToWindow:0];
}

@end