@interface WKProcessPool
@end

@implementation WKProcessPool

void __51__WKProcessPool_IAMMessages__webContentProcessPool__block_invoke()
{
  id v5 = objc_alloc_init(MEMORY[0x263F1FAB0]);
  v0 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.InAppMessages"];
  v1 = [v0 builtInPlugInsURL];
  v2 = [v1 URLByAppendingPathComponent:@"InAppMessagesWebProcessBundle.bundle" isDirectory:1];

  [v5 setInjectedBundleURL:v2];
  [v5 setAlwaysRunsAtBackgroundPriority:1];
  uint64_t v3 = [objc_alloc(MEMORY[0x263F1FA28]) _initWithConfiguration:v5];
  v4 = (void *)webContentProcessPool_contentProcessPool;
  webContentProcessPool_contentProcessPool = v3;
}

@end