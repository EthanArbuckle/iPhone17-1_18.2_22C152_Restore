@interface _MDIndexExtensionManager
+ (id)sharedManager;
+ (void)setMemoryPressureStatus:(unint64_t)a3;
- (_MDIndexExtensionManager)init;
- (void)loadExtensions;
@end

@implementation _MDIndexExtensionManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)sharedManager__sharedManager;

  return v2;
}

- (void)loadExtensions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___MDIndexExtensionManager_loadExtensions__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  if (loadExtensions_onceToken != -1) {
    dispatch_once(&loadExtensions_onceToken, block);
  }
}

+ (void)setMemoryPressureStatus:(unint64_t)a3
{
  sUnderMemoryPressure = a3 == 1;
}

- (_MDIndexExtensionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MDIndexExtensionManager;
  v2 = [(_MDExtensionManager *)&v5 initWithQueueName:"com.apple.corespotlight.IndexExtensionManager"];
  if (v2)
  {
    v3 = objc_alloc_init(_MDIndexExtensionLoader);
    [(_MDExtensionManager *)v2 setExtensionLoader:v3];
  }
  return v2;
}

@end