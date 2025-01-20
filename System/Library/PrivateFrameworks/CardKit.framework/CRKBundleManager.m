@interface CRKBundleManager
@end

@implementation CRKBundleManager

uint64_t __35___CRKBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sBundleManager;
  sharedInstance_sBundleManager = (uint64_t)v1;

  return MEMORY[0x270F9A758](v1, v2);
}

void __40___CRKBundleManager_bundleDirectoryPath__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = NSString;
  id v1 = CPSystemRootDirectory();
  v5[0] = v1;
  v5[1] = @"System";
  v5[2] = @"/Library/CardKit/Plugins";
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 pathWithComponents:v2];
  v4 = (void *)bundleDirectoryPath_sBundleDirectoryPath;
  bundleDirectoryPath_sBundleDirectoryPath = v3;
}

@end