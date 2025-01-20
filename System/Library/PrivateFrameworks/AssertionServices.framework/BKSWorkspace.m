@interface BKSWorkspace
+ (id)sharedInstance;
- (BKSWorkspace)init;
@end

@implementation BKSWorkspace

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __30__BKSWorkspace_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_alloc_init(BKSWorkspace);
  return MEMORY[0x1F41817F8]();
}

- (BKSWorkspace)init
{
  v5.receiver = self;
  v5.super_class = (Class)BKSWorkspace;
  v2 = [(BKSWorkspace *)&v5 init];
  if (v2) {
    id v3 = (id)RBSServiceInitialize();
  }
  return v2;
}

@end