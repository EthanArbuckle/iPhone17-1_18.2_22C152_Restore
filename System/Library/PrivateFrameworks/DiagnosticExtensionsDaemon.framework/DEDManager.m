@interface DEDManager
+ (id)sharedInstance;
@end

@implementation DEDManager

+ (id)sharedInstance
{
  if (sharedInstance_once_4 != -1) {
    dispatch_once(&sharedInstance_once_4, &__block_literal_global_26);
  }
  v2 = (void *)sharedInstance_shared_3;
  return v2;
}

uint64_t __28__DEDManager_sharedInstance__block_invoke()
{
  sharedInstance_shared_3 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

@end