@interface _CRKBundleManager
+ (Class)bundleClass;
+ (id)bundleDirectoryPath;
+ (id)sharedInstance;
- (NSSet)bundles;
- (_CRKBundleManager)init;
- (void)loadBundles;
- (void)registerBundle:(id)a3;
@end

@implementation _CRKBundleManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35___CRKBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sBundleManager;

  return v2;
}

- (_CRKBundleManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CRKBundleManager;
  v2 = [(_CRKBundleManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    bundles = v2->_bundles;
    v2->_bundles = v3;
  }
  return v2;
}

+ (id)bundleDirectoryPath
{
  if (bundleDirectoryPath_onceToken != -1) {
    dispatch_once(&bundleDirectoryPath_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)bundleDirectoryPath_sBundleDirectoryPath;

  return v2;
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)loadBundles
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(id)objc_opt_class() bundleDirectoryPath];
  v5 = (os_log_t *)MEMORY[0x263F31630];
  objc_super v6 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_224F73000, v6, OS_LOG_TYPE_INFO, "Looking for plugins in %@", buf, 0xCu);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v28 = 0;
  v24 = v3;
  id obj = [v3 contentsOfDirectoryAtPath:v4 error:&v28];
  id v26 = v28;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        v11 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          _os_log_impl(&dword_224F73000, v11, OS_LOG_TYPE_INFO, "Found plugin: %@", buf, 0xCu);
        }
        v12 = v4;
        v13 = [v4 stringByAppendingPathComponent:v10];
        v14 = (void *)[(id)objc_opt_class() bundleClass];
        int v15 = [v14 isSubclassOfClass:objc_opt_class()];
        os_log_t v16 = *v5;
        BOOL v17 = os_log_type_enabled(*v5, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            v18 = v16;
            v19 = NSStringFromClass((Class)v14);
            *(_DWORD *)buf = 138412546;
            v34 = v19;
            __int16 v35 = 2112;
            id v36 = v10;
            _os_log_impl(&dword_224F73000, v18, OS_LOG_TYPE_INFO, "Initializing a bundle of type %@ for plugin %@", buf, 0x16u);
          }
        }
        else
        {
          if (v17)
          {
            v20 = v16;
            v21 = NSStringFromClass((Class)v14);
            *(_DWORD *)buf = 138412546;
            v34 = v21;
            __int16 v35 = 2112;
            id v36 = v10;
            _os_log_impl(&dword_224F73000, v20, OS_LOG_TYPE_INFO, "Defaulting to bundle of type %@ for plugin %@", buf, 0x16u);
          }
          v14 = (void *)MEMORY[0x263F086E0];
        }
        v4 = v12;
        v22 = (void *)[objc_alloc((Class)v14) initWithPath:v13];
        if (!v22 || v26)
        {
          v23 = *v5;
          if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v34 = v13;
            __int16 v35 = 2112;
            id v36 = v26;
            _os_log_error_impl(&dword_224F73000, v23, OS_LOG_TYPE_ERROR, "Error loading bundle at path \"%@\":%@", buf, 0x16u);
          }
        }
        else
        {
          [(_CRKBundleManager *)self registerBundle:v22];
        }

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }
}

- (void)registerBundle:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_224F73000, v5, OS_LOG_TYPE_INFO, "Registering bundle: %@", (uint8_t *)&v6, 0xCu);
    }
    [(NSMutableSet *)self->_bundles addObject:v4];
  }
}

- (NSSet)bundles
{
  v2 = (void *)[(NSMutableSet *)self->_bundles copy];

  return (NSSet *)v2;
}

- (void).cxx_destruct
{
}

@end