@interface ISCustomIconManager
+ (id)sharedInstance;
- (id)_init;
- (id)overrideIconForURL:(id)a3;
- (id)overrideResourceForBundleIdentifier:(id)a3;
- (id)specialFolderTypeForURL:(id)a3;
@end

@implementation ISCustomIconManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_24);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return v2;
}

uint64_t __37__ISCustomIconManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3 = [[ISCustomIconManager alloc] _init];
  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ISCustomIconManager;
  return [(ISCustomIconManager *)&v3 init];
}

- (id)overrideIconForURL:(id)a3
{
  return 0;
}

- (id)overrideResourceForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)specialFolderTypeForURL:(id)a3
{
  return 0;
}

@end