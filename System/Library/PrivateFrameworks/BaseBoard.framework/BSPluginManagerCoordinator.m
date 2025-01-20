@interface BSPluginManagerCoordinator
+ (id)sharedInstance;
- (id)mainPluginManager;
- (id)pluginManagerForBundle:(id)a3;
- (void)registerPlugins;
- (void)registerPluginsFromBundle:(id)a3;
@end

@implementation BSPluginManagerCoordinator

+ (id)sharedInstance
{
  if (qword_1EB21B100 != -1) {
    dispatch_once(&qword_1EB21B100, &__block_literal_global_10);
  }
  v2 = (void *)_MergedGlobals_12;
  return v2;
}

void __44__BSPluginManagerCoordinator_sharedInstance__block_invoke()
{
  v0 = [BSPluginManagerCoordinator alloc];
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)BSPluginManagerCoordinator;
    v1 = objc_msgSendSuper2(&v5, sel_init);
    if (v1)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v3 = (void *)v1[1];
      v1[1] = v2;
    }
  }
  else
  {
    v1 = 0;
  }
  v4 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = (uint64_t)v1;
}

- (void)registerPlugins
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  -[BSPluginManagerCoordinator registerPluginsFromBundle:](self, "registerPluginsFromBundle:");
}

- (void)registerPluginsFromBundle:(id)a3
{
  id v7 = a3;
  v4 = [v7 bundleIdentifier];
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    v6 = [(NSMutableDictionary *)v5->_managersByBundleID objectForKey:v4];
    if (!v6)
    {
      v6 = +[BSPluginManager managerForBundle:]((uint64_t)BSPluginManager, v7);
      if (v6) {
        [(NSMutableDictionary *)v5->_managersByBundleID setObject:v6 forKey:v4];
      }
    }

    objc_sync_exit(v5);
  }
}

- (id)mainPluginManager
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [(BSPluginManagerCoordinator *)self pluginManagerForBundle:v3];

  return v4;
}

- (id)pluginManagerForBundle:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    v6 = [v4 bundleIdentifier];
    if (v6)
    {
      id v7 = self;
      objc_sync_enter(v7);
      [(BSPluginManagerCoordinator *)v7 registerPluginsFromBundle:v5];
      v8 = [(NSMutableDictionary *)v7->_managersByBundleID objectForKey:v6];
      objc_sync_exit(v7);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end