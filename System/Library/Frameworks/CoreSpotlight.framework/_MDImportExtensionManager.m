@interface _MDImportExtensionManager
+ (id)sharedManager;
- (_MDImportExtensionManager)init;
- (void)loadExtensions;
@end

@implementation _MDImportExtensionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_16 != -1) {
    dispatch_once(&sharedManager_onceToken_16, &__block_literal_global_18);
  }
  v2 = (void *)sharedManager__sharedManager_15;

  return v2;
}

- (_MDImportExtensionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MDImportExtensionManager;
  v2 = [(_MDExtensionManager *)&v5 initWithQueueName:"com.apple.corespotlight.ImportExtensionManager"];
  if (v2)
  {
    v3 = objc_alloc_init(_MDImportExtensionLoader);
    [(_MDExtensionManager *)v2 setExtensionLoader:v3];
  }
  return v2;
}

- (void)loadExtensions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___MDImportExtensionManager_loadExtensions__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  if (loadExtensions_onceToken_23 != -1) {
    dispatch_once(&loadExtensions_onceToken_23, block);
  }
}

@end