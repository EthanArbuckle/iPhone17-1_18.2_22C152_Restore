@interface CRBundleManager
+ (Class)bundleClass;
+ (id)bundleDirectoryName;
+ (id)bundleDirectoryPath;
+ (id)sharedInstance;
- (CRBundleManager)init;
- (void)_getBundlesOnCurrentQueueWithCompletion:(id)a3;
- (void)getBundlesWithCompletion:(id)a3;
@end

@implementation CRBundleManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CRBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sBundleManager;
  return v2;
}

uint64_t __33__CRBundleManager_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sBundleManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CRBundleManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRBundleManager;
  v2 = [(CRBundleManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cards.CRBundleManager.serial-queue", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)bundleDirectoryPath
{
  v11[3] = *MEMORY[0x263EF8340];
  v3 = NSString;
  dispatch_queue_t v4 = CPSystemRootDirectory();
  v11[0] = v4;
  v11[1] = @"System";
  v5 = NSString;
  v6 = [a1 bundleDirectoryName];
  objc_super v7 = [v5 stringWithFormat:@"/Library/%@/Plugins", v6];
  v11[2] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:3];
  v9 = [v3 pathWithComponents:v8];

  return v9;
}

+ (id)bundleDirectoryName
{
  return @"CardKit";
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)getBundlesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CRBundleManager_getBundlesWithCompletion___block_invoke;
  block[3] = &unk_2647EEF20;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__CRBundleManager_getBundlesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _getBundlesOnCurrentQueueWithCompletion:v3];
  }
  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    id v4 = 0;
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
  }
  id WeakRetained = v4;
LABEL_6:
}

- (void)_getBundlesOnCurrentQueueWithCompletion:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  if (!self->_bundles)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    bundles = self->_bundles;
    self->_bundles = v6;

    id v8 = [MEMORY[0x263F08850] defaultManager];
    id v9 = [(id)objc_opt_class() bundleDirectoryPath];
    v10 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_impl(&dword_226EA8000, v10, OS_LOG_TYPE_INFO, "Looking for plugins in %@", buf, 0xCu);
    }
    if ([v8 fileExistsAtPath:v9])
    {
      v43 = v5;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v47 = 0;
      v41 = v8;
      v11 = [v8 contentsOfDirectoryAtPath:v9 error:&v47];
      id v42 = v47;
      id obj = v11;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v49;
        v15 = @"bundle";
        do
        {
          uint64_t v16 = 0;
          uint64_t v44 = v13;
          do
          {
            if (*(void *)v49 != v14) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v48 + 1) + 8 * v16);
            v18 = [v9 stringByAppendingPathComponent:v17];
            v19 = [v18 pathExtension];
            char v20 = [v19 isEqualToString:v15];

            v21 = CRLogContextCards;
            BOOL v22 = os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO);
            if (v20)
            {
              v23 = v15;
              v24 = v9;
              if (v22)
              {
                *(_DWORD *)buf = 138412290;
                v53 = v17;
                _os_log_impl(&dword_226EA8000, v21, OS_LOG_TYPE_INFO, "Found bundle: %@", buf, 0xCu);
              }
              v25 = self;
              v26 = (void *)[(id)objc_opt_class() bundleClass];
              int v27 = [v26 isSubclassOfClass:objc_opt_class()];
              v28 = (void *)CRLogContextCards;
              BOOL v29 = os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO);
              if (v27)
              {
                if (v29)
                {
                  v30 = v28;
                  v31 = NSStringFromClass((Class)v26);
                  *(_DWORD *)buf = 138412546;
                  v53 = v31;
                  __int16 v54 = 2112;
                  v55 = v17;
                  _os_log_impl(&dword_226EA8000, v30, OS_LOG_TYPE_INFO, "Initializing a bundle of type %@ for plugin %@", buf, 0x16u);
                }
              }
              else
              {
                if (v29)
                {
                  v32 = v28;
                  v33 = NSStringFromClass((Class)v26);
                  *(_DWORD *)buf = 138412546;
                  v53 = v33;
                  __int16 v54 = 2112;
                  v55 = v17;
                  _os_log_impl(&dword_226EA8000, v32, OS_LOG_TYPE_INFO, "Defaulting to bundle of type %@ for plugin %@", buf, 0x16u);
                }
                v26 = (void *)MEMORY[0x263F086E0];
              }
              self = v25;
              v34 = (void *)[objc_alloc((Class)v26) initWithPath:v18];
              id v46 = 0;
              [v34 loadAndReturnError:&v46];
              id v35 = v46;
              v36 = v35;
              v37 = CRLogContextCards;
              id v9 = v24;
              if (!v34 || v35)
              {
                v15 = v23;
                uint64_t v13 = v44;
                if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v53 = v18;
                  __int16 v54 = 2112;
                  v55 = v36;
                  _os_log_error_impl(&dword_226EA8000, v37, OS_LOG_TYPE_ERROR, "Error loading bundle at path \"%@\": %@", buf, 0x16u);
                }
              }
              else
              {
                v15 = v23;
                if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v53 = v34;
                  _os_log_impl(&dword_226EA8000, v37, OS_LOG_TYPE_INFO, "Registering bundle: %@", buf, 0xCu);
                }
                [(NSMutableSet *)self->_bundles addObject:v34];
                uint64_t v13 = v44;
              }
            }
            else if (v22)
            {
              *(_DWORD *)buf = 138412290;
              v53 = v17;
              _os_log_impl(&dword_226EA8000, v21, OS_LOG_TYPE_INFO, "File is not a bundle, continuing: %@", buf, 0xCu);
            }

            ++v16;
          }
          while (v13 != v16);
          uint64_t v13 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v13);
      }

      v38 = v42;
      if (v42)
      {
        v39 = CRLogContextCards;
        v5 = v43;
        if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR)) {
          [(CRBundleManager *)(uint64_t)v9 _getBundlesOnCurrentQueueWithCompletion:v39];
        }
      }
      else
      {
        v5 = v43;
      }
      id v8 = v41;
      if (!v5) {
        goto LABEL_43;
      }
    }
    else
    {
      v40 = CRLogContextCards;
      if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v9;
        _os_log_impl(&dword_226EA8000, v40, OS_LOG_TYPE_INFO, "Bundle directory doesn't exist at path \"%@\"", buf, 0xCu);
      }
      v38 = 0;
      if (!v5) {
        goto LABEL_43;
      }
    }
    ((void (**)(void, NSMutableSet *, void *))v5)[2](v5, self->_bundles, v38);
LABEL_43:

    goto LABEL_44;
  }
  if (v4) {
    (*((void (**)(id))v4 + 2))(v4);
  }
LABEL_44:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

- (void)_getBundlesOnCurrentQueueWithCompletion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226EA8000, log, OS_LOG_TYPE_ERROR, "Error loading bundles at path \"%@\": %@", (uint8_t *)&v3, 0x16u);
}

@end