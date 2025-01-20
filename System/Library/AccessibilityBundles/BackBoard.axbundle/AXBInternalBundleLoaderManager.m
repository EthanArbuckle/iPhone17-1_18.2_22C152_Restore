@interface AXBInternalBundleLoaderManager
+ (void)initializeMonitor;
- (AXBInternalBundleLoaderManager)init;
- (void)_loadInternalBundle;
@end

@implementation AXBInternalBundleLoaderManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_1 != -1) {
    dispatch_once(&initializeMonitor_onceToken_1, &__block_literal_global_5);
  }
}

uint64_t __51__AXBInternalBundleLoaderManager_initializeMonitor__block_invoke()
{
  _SharedInternalBundleLoaderManager = objc_alloc_init(AXBInternalBundleLoaderManager);

  return MEMORY[0x270F9A758]();
}

- (AXBInternalBundleLoaderManager)init
{
  if (AXIsInternalInstall())
  {
    v7.receiver = self;
    v7.super_class = (Class)AXBInternalBundleLoaderManager;
    v3 = [(AXBInternalBundleLoaderManager *)&v7 init];
    v4 = v3;
    if (v3) {
      [(AXBInternalBundleLoaderManager *)v3 _loadInternalBundle];
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_loadInternalBundle
{
}

void __53__AXBInternalBundleLoaderManager__loadInternalBundle__block_invoke()
{
  id v1 = [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/AccessibilityUIServices/AXBInternalBundleLoader.bundle"];
  v0 = (objc_class *)[v1 principalClass];
  if (v0) {
}
  }

@end