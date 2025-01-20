@interface ACCFeaturePluginManager
+ (id)sharedManager;
- (ACCFeaturePluginManager)init;
- (OS_dispatch_queue)queue;
- (unint64_t)addFeaturePlugInBundleSearchPaths;
- (unint64_t)initAllPlugIns;
- (unint64_t)loadAllBundles;
- (unint64_t)startAllPlugIns;
- (unint64_t)stopAllPlugIns;
- (void)initAllPlugIns;
- (void)loadAllBundles;
- (void)setQueue:(id)a3;
@end

@implementation ACCFeaturePluginManager

- (ACCFeaturePluginManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACCFeaturePluginManager;
  v2 = [(ACCPluginManager *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    [(ACCFeaturePluginManager *)v2 addFeaturePlugInBundleSearchPaths];
  }
  return v2;
}

- (unint64_t)addFeaturePlugInBundleSearchPaths
{
  v8.receiver = self;
  v8.super_class = (Class)ACCFeaturePluginManager;
  id v3 = [(ACCPluginManager *)&v8 addBundleSearchPath:@"/System/Library/CoreAccessories/PlugIns/Features" recursive:0];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager addTransportPlugInBundleSearchPaths](self);
  }

  return (unint64_t)v3;
}

- (unint64_t)loadAllBundles
{
  v11.receiver = self;
  v11.super_class = (Class)ACCFeaturePluginManager;
  id v3 = [(ACCPluginManager *)&v11 loadBundlesWithExtension:@"feature"];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Loaded %lu feature plugin bundle(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v7 = *(id *)(gLogObjects + 24);
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
    [(ACCFeaturePluginManager *)self loadAllBundles];
  }

  return (unint64_t)v3;
}

- (unint64_t)initAllPlugIns
{
  v11.receiver = self;
  v11.super_class = (Class)ACCFeaturePluginManager;
  id v3 = [(ACCPluginManager *)&v11 initAllPlugIns];
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized %lu feature plugin(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    v7 = *(id *)(gLogObjects + 24);
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
    [(ACCFeaturePluginManager *)self initAllPlugIns];
  }

  return (unint64_t)v3;
}

- (unint64_t)startAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)ACCFeaturePluginManager;
  id v2 = [(ACCPluginManager *)&v7 startAllPlugIns];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
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
    id v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started %lu feature plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (unint64_t)stopAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)ACCFeaturePluginManager;
  id v2 = [(ACCPluginManager *)&v7 stopAllPlugIns];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
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
    id v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopped %lu feature plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__ACCFeaturePluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_4 != -1) {
    dispatch_once(&sharedManager_once_4, block);
  }
  id v2 = (void *)sharedManager_sharedInstance_4;

  return v2;
}

uint64_t __40__ACCFeaturePluginManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_4 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)loadAllBundles
{
  a2->receiver = a1;
  a2->super_class = (Class)ACCFeaturePluginManager;
  id v2 = [(objc_super *)a2 pluginBundles];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v3, v4, "ACCFeaturePluginManager.pluginBundles: %@", v5, v6, v7, v8, 2u);
}

- (void)initAllPlugIns
{
  a2->receiver = a1;
  a2->super_class = (Class)ACCFeaturePluginManager;
  id v2 = [(objc_super *)a2 pluginInstances];
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v3, v4, "ACCFeaturePluginManager.pluginInstances: %@", v5, v6, v7, v8, 2u);
}

@end