@interface BCDiscoverPluginManager
+ (NSSet)discoverPluginBundles;
+ (id)_discoverPluginDirectoryURL;
- (BCDiscoverPluginManager)init;
- (NSArray)discoverPlugins;
- (id)_buildDiscoverPlugins;
- (id)sortedPluginsBySectionForInput:(id)a3;
- (os_unfair_lock_s)discoverPluginsLock;
- (void)setDiscoverPlugins:(id)a3;
@end

@implementation BCDiscoverPluginManager

- (BCDiscoverPluginManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)BCDiscoverPluginManager;
  v2 = [(BCDiscoverPluginManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    discoverPlugins = v2->_discoverPlugins;
    v2->_discoverPlugins = 0;

    v3->_discoverPluginsLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

+ (id)_discoverPluginDirectoryURL
{
  v2 = [NSURL URLWithString:@"/System/Library"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 URLByAppendingPathComponent:@"NanoPreferenceBundles"];
    v5 = [v4 URLByAppendingPathComponent:@"Discover"];
  }
  else
  {
    objc_super v6 = pbb_discover_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22CE99000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't find the system library directory to search for plugins.", v8, 2u);
    }

    v5 = 0;
  }

  return v5;
}

+ (NSSet)discoverPluginBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__BCDiscoverPluginManager_discoverPluginBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (discoverPluginBundles_onceToken != -1) {
    dispatch_once(&discoverPluginBundles_onceToken, block);
  }
  v2 = (void *)discoverPluginBundles_discoverPluginBundles;
  return (NSSet *)v2;
}

void __48__BCDiscoverPluginManager_discoverPluginBundles__block_invoke()
{
  id v2 = [(id)objc_opt_class() _discoverPluginDirectoryURL];
  uint64_t v0 = +[BCPluginLoader loadPluginBundlesAtURL:v2];
  v1 = (void *)discoverPluginBundles_discoverPluginBundles;
  discoverPluginBundles_discoverPluginBundles = v0;
}

- (id)_buildDiscoverPlugins
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addObject:v4];

  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 addObject:v5];

  objc_super v6 = [(id)objc_opt_class() discoverPluginBundles];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__BCDiscoverPluginManager__buildDiscoverPlugins__block_invoke;
  v10[3] = &unk_2649370D8;
  id v11 = v3;
  id v7 = v3;
  [v6 enumerateObjectsUsingBlock:v10];

  v8 = [(BCDiscoverPluginManager *)self sortedPluginsBySectionForInput:v7];

  return v8;
}

void __48__BCDiscoverPluginManager__buildDiscoverPlugins__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v14 = 0;
  char v4 = [v3 loadAndReturnError:&v14];
  id v5 = v14;
  if ((v4 & 1) == 0)
  {
    v8 = pbb_discover_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543618;
    id v16 = v3;
    __int16 v17 = 2112;
    id v18 = v5;
    id v11 = "Failed to load bundle (%{public}@), error: %@";
    v12 = v8;
    uint32_t v13 = 22;
LABEL_10:
    _os_log_impl(&dword_22CE99000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_14;
  }
  objc_super v6 = (void *)[v3 principalClass];
  if (([v6 conformsToProtocol:&unk_26E05D438] & 1) == 0)
  {
    v8 = pbb_discover_log();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543362;
    id v16 = v3;
    id v11 = "Unknown principal class for bundle: %{public}@";
    v12 = v8;
    uint32_t v13 = 12;
    goto LABEL_10;
  }
  id v7 = objc_alloc_init((Class)v6);
  v8 = v7;
  if (!v7)
  {
    v10 = pbb_discover_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_22CE99000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create plugin for bundle: %{public}@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  unint64_t v9 = [v7 displaySectionForPlugin];
  if (v9 <= 1)
  {
    v10 = [*(id *)(a1 + 32) objectAtIndex:v9];
    [v10 addObject:v8];
LABEL_13:
  }
LABEL_14:
}

- (id)sortedPluginsBySectionForInput:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      objc_super v6 = [v3 objectAtIndex:v5];
      id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_0];
      [v4 addObject:v7];

      ++v5;
    }
    while ([v3 count] > v5);
  }

  return v4;
}

uint64_t __58__BCDiscoverPluginManager_sortedPluginsBySectionForInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 displayIndexForPluginInSection];
  uint64_t v6 = [v4 displayIndexForPluginInSection];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (NSArray)discoverPlugins
{
  discoverPlugins = self->_discoverPlugins;
  if (!discoverPlugins)
  {
    os_unfair_lock_lock(&self->_discoverPluginsLock);
    if (!self->_discoverPlugins)
    {
      id v4 = [(BCDiscoverPluginManager *)self _buildDiscoverPlugins];
      uint64_t v5 = self->_discoverPlugins;
      self->_discoverPlugins = v4;
    }
    os_unfair_lock_unlock(&self->_discoverPluginsLock);
    discoverPlugins = self->_discoverPlugins;
  }
  return discoverPlugins;
}

- (void)setDiscoverPlugins:(id)a3
{
}

- (os_unfair_lock_s)discoverPluginsLock
{
  return self->_discoverPluginsLock;
}

- (void).cxx_destruct
{
}

@end