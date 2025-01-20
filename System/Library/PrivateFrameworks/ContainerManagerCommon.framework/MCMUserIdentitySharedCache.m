@interface MCMUserIdentitySharedCache
+ (id)sharedInstance;
@end

@implementation MCMUserIdentitySharedCache

+ (id)sharedInstance
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MCMUserIdentitySharedCache_sharedInstance__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  if (sharedInstance_onceToken_9465 != -1) {
    dispatch_once(&sharedInstance_onceToken_9465, v4);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __44__MCMUserIdentitySharedCache_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end