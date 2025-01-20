@interface HMAccessoryCollectionSettingItemClassManager
@end

@implementation HMAccessoryCollectionSettingItemClassManager

uint64_t __62___HMAccessoryCollectionSettingItemClassManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(_HMAccessoryCollectionSettingItemClassManager);
  uint64_t v1 = sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end