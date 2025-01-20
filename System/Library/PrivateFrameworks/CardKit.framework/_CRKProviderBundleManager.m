@interface _CRKProviderBundleManager
+ (Class)bundleClass;
+ (id)bundleDirectoryName;
+ (id)sharedInstance;
- (void)getProviderBundlesWithCompletion:(id)a3;
@end

@implementation _CRKProviderBundleManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43___CRKProviderBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sProviderBundleManager;

  return v2;
}

+ (id)bundleDirectoryName
{
  return @"CardKit";
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)getProviderBundlesWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62___CRKProviderBundleManager_getProviderBundlesWithCompletion___block_invoke;
  v7[3] = &unk_26470EB18;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)_CRKProviderBundleManager;
  id v5 = v4;
  [(CRBundleManager *)&v6 getBundlesWithCompletion:v7];
}

- (void).cxx_destruct
{
}

@end