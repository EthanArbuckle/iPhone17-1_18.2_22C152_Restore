@interface LSDefaultsGetSharedInstance
@end

@implementation LSDefaultsGetSharedInstance

void ____LSDefaultsGetSharedInstance_block_invoke()
{
  v0 = objc_alloc_init(_LSDefaults);
  v1 = (void *)__LSDefaultsGetSharedInstance_sharedInstance;
  __LSDefaultsGetSharedInstance_sharedInstance = (uint64_t)v0;
}

@end