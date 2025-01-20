@interface ACCPlatformPluginManager
+ (id)sharedManager;
- (ACCPlatformPluginManager)init;
- (id)initClass:(Class)a3;
- (id)pluginInstanceWithProtocol:(id)a3 fallbackToTransportPlugins:(BOOL)a4;
- (id)pluginInstancesWithProtocol:(id)a3 includeTransportPlugins:(BOOL)a4;
- (unint64_t)addPlatformPlugInBundleSearchPaths;
- (unint64_t)initAllPlugIns;
- (unint64_t)loadAllBundles;
- (unint64_t)startAllPlugIns;
- (unint64_t)stopAllPlugIns;
- (void)addPlatformPlugInBundleSearchPaths;
- (void)initAllPlugIns;
- (void)loadAllBundles;
@end

@implementation ACCPlatformPluginManager

- (ACCPlatformPluginManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACCPlatformPluginManager;
  v2 = [(ACCPluginManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ACCPlatformPluginManager *)v2 addPlatformPlugInBundleSearchPaths];
  }
  return v3;
}

- (unint64_t)addPlatformPlugInBundleSearchPaths
{
  v8.receiver = self;
  v8.super_class = (Class)ACCPlatformPluginManager;
  id v3 = [(ACCPluginManager *)&v8 addBundleSearchPath:@"/System/Library/CoreAccessories/PlugIns/Platform" recursive:0];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCPlatformPluginManager addPlatformPlugInBundleSearchPaths](self);
  }

  return (unint64_t)v3;
}

- (unint64_t)loadAllBundles
{
  v11.receiver = self;
  v11.super_class = (Class)ACCPlatformPluginManager;
  id v3 = [(ACCPluginManager *)&v11 loadBundlesWithExtension:@"platform"];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Loaded %lu platform plugin bundle(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 6)
  {
    v7 = *(id *)(gLogObjects + 40);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCPlatformPluginManager *)self loadAllBundles];
  }

  return (unint64_t)v3;
}

- (unint64_t)initAllPlugIns
{
  v11.receiver = self;
  v11.super_class = (Class)ACCPlatformPluginManager;
  id v3 = [(ACCPluginManager *)&v11 initAllPlugIns];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    v6 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized %lu platform plugin(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 6)
  {
    v7 = *(id *)(gLogObjects + 40);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCPlatformPluginManager *)self initAllPlugIns];
  }

  return (unint64_t)v3;
}

- (unint64_t)startAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)ACCPlatformPluginManager;
  id v2 = [(ACCPluginManager *)&v7 startAllPlugIns];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started %lu platform plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (unint64_t)stopAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)ACCPlatformPluginManager;
  id v2 = [(ACCPluginManager *)&v7 stopAllPlugIns];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopped %lu platform plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (id)pluginInstanceWithProtocol:(id)a3 fallbackToTransportPlugins:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (Protocol *)a3;
  v29 = v6;
  objc_super v7 = +[NSArray arrayWithObjects:&v29 count:1];
  id v8 = [(ACCPluginManager *)self pluginInstancesWithProtocols:v7 matchAny:0];

  if (v8 && [v8 count])
  {
    if ((unint64_t)[v8 count] < 2) {
      goto LABEL_37;
    }
    if (gLogObjects && gNumLogObjects >= 6)
    {
      id v9 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = &_os_log_default;
      id v15 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:].cold.6(v6);
    }
    goto LABEL_36;
  }
  if (v4)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      objc_super v10 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v10 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:].cold.4(v6);
    }

    v12 = +[ACCTransportPluginManager sharedManager];
    v28 = v6;
    id v13 = +[NSArray arrayWithObjects:&v28 count:1];
    v14 = [v12 pluginInstancesWithProtocols:v13 matchAny:0];

    if (v14)
    {
      if ([v14 count])
      {
        if ((unint64_t)[v14 count] < 2)
        {
          id v8 = v14;
          goto LABEL_37;
        }
        if (gLogObjects && gNumLogObjects >= 6)
        {
          id v9 = *(id *)(gLogObjects + 40);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          id v9 = &_os_log_default;
          id v16 = &_os_log_default;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:](v6);
        }
        id v8 = v14;
LABEL_36:

LABEL_37:
        v17 = [v8 anyObject];
        if (v17) {
          goto LABEL_49;
        }
        goto LABEL_38;
      }
      id v8 = v14;
    }
    else
    {
      id v8 = 0;
    }
  }
LABEL_38:
  if (gLogObjects && gNumLogObjects >= 6)
  {
    v18 = *(id *)(gLogObjects + 40);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v18 = &_os_log_default;
    id v19 = &_os_log_default;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = NSStringFromProtocol(v6);
    v21 = (void *)v20;
    v22 = "NO";
    if (v4) {
      v22 = "YES";
    }
    int v24 = 138412546;
    uint64_t v25 = v20;
    __int16 v26 = 2080;
    v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Couldn't find a platform/transport plugin conforming to protocol: %@ (fallbackToTransportPlugins: %s)", (uint8_t *)&v24, 0x16u);
  }
  v17 = 0;
LABEL_49:

  return v17;
}

- (id)pluginInstancesWithProtocol:(id)a3 includeTransportPlugins:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = +[NSMutableSet set];
  id v18 = v6;
  id v8 = +[NSArray arrayWithObjects:&v18 count:1];
  id v9 = [(ACCPluginManager *)self pluginInstancesWithProtocols:v8 matchAny:0];

  if (v9)
  {
    objc_super v10 = [v9 allObjects];
    [v7 addObjectsFromArray:v10];
  }
  if (v4)
  {
    id v11 = +[ACCTransportPluginManager sharedManager];
    id v17 = v6;
    v12 = +[NSArray arrayWithObjects:&v17 count:1];
    id v13 = [v11 pluginInstancesWithProtocols:v12 matchAny:0];

    if (v13)
    {
      v14 = [v13 allObjects];
      [v7 addObjectsFromArray:v14];
    }
  }
  if ([v7 count])
  {
    id v15 = +[NSSet setWithSet:v7];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)initClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __41__ACCPlatformPluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_3 != -1) {
    dispatch_once(&sharedManager_once_3, block);
  }
  id v2 = (void *)sharedManager_sharedInstance_3;

  return v2;
}

uint64_t __41__ACCPlatformPluginManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_3 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (void)addPlatformPlugInBundleSearchPaths
{
  v1 = [a1 pluginBundleSearchPaths];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "Added bundle search paths: %@", v4, v5, v6, v7, v8);
}

- (void)loadAllBundles
{
  a2->receiver = a1;
  a2->super_class = (Class)ACCPlatformPluginManager;
  uint64_t v2 = [(objc_super *)a2 pluginBundles];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v3, v4, "ACCPlatformPluginManager.pluginBundles: %@", v5, v6, v7, v8, v9);
}

- (void)initAllPlugIns
{
  a2->receiver = a1;
  a2->super_class = (Class)ACCPlatformPluginManager;
  uint64_t v2 = [(objc_super *)a2 pluginInstances];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v3, v4, "ACCPlatformPluginManager.pluginInstances: %@", v5, v6, v7, v8, v9);
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.2(Protocol *a1)
{
  v1 = NSStringFromProtocol(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "Multiple transport plugins found with protocol: %@\nChoosing one at random...", v4, v5, v6, v7, v8);
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.4(Protocol *a1)
{
  v1 = NSStringFromProtocol(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v2, v3, "Couldn't find a platform plugin conforming to protocol: %@\nFalling back to searching transport plugins...", v4, v5, v6, v7, v8);
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.6(Protocol *a1)
{
  v1 = NSStringFromProtocol(a1);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0((void *)&_mh_execute_header, v2, v3, "Multiple platform plugins found with protocol: %@\nChoosing one at random...", v4, v5, v6, v7, v8);
}

@end