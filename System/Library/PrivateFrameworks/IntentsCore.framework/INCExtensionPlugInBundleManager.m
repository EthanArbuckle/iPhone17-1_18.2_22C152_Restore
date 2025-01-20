@interface INCExtensionPlugInBundleManager
+ (id)sharedManager;
- (BOOL)_registerBundle:(id)a3 bundleIdentifier:(id)a4;
- (BOOL)loadBundleForBundleIdentifier:(id)a3 wasPrewarmed:(BOOL *)a4;
- (INCExtensionPlugInBundleManager)init;
- (id)_extensionPlugInBundleForIntent:(id)a3 bundleIdentifier:(id)a4;
- (id)extensionForIntent:(id)a3;
- (void)_setExtensionPlugInBundle:(id)a3 forIntent:(id)a4 bundleIdentifier:(id)a5;
@end

@implementation INCExtensionPlugInBundleManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__INCExtensionPlugInBundleManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_224 != -1) {
    dispatch_once(&sharedManager_onceToken_224, block);
  }
  v2 = (void *)sharedManager_sharedManager_225;
  return v2;
}

- (id)extensionForIntent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 extensionBundleId];
  v6 = [v4 _className];
  if (v5
    || (objc_msgSend(v4, "_intents_launchIdForCurrentPlatform"),
        v7 = objc_claimAutoreleasedReturnValue(),
        INExtractAppInfoFromSiriLaunchId(),
        id v5 = 0,
        v7,
        v5))
  {
    buf[0] = 0;
    v8 = [(INCExtensionPlugInBundleManager *)self _extensionPlugInBundleForIntent:v6 bundleIdentifier:v5];
    if (v8)
    {
    }
    else if (![(INCExtensionPlugInBundleManager *)self loadBundleForBundleIdentifier:v5 wasPrewarmed:buf])
    {
      id v10 = 0;
LABEL_9:

      goto LABEL_10;
    }
    v9 = [(INCExtensionPlugInBundleManager *)self _extensionPlugInBundleForIntent:v6 bundleIdentifier:v5];
    id v10 = objc_alloc_init((Class)[v9 principalClass]);
    if ((_INExtensionValidateClass() & 1) == 0)
    {

      id v10 = 0;
    }

    goto LABEL_9;
  }
  v12 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[INCExtensionPlugInBundleManager extensionForIntent:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get bundleIdentifier from %@", buf, 0x16u);
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

- (id)_extensionPlugInBundleForIntent:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__214;
  v21 = __Block_byref_object_dispose__215;
  id v22 = 0;
  intentsSupportedQueue = self->_intentsSupportedQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__INCExtensionPlugInBundleManager__extensionPlugInBundleForIntent_bundleIdentifier___block_invoke;
  v13[3] = &unk_1E62BB170;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(intentsSupportedQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __84__INCExtensionPlugInBundleManager__extensionPlugInBundleForIntent_bundleIdentifier___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v2 = [v5 objectForKeyedSubscript:a1[6]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)loadBundleForBundleIdentifier:(id)a3 wasPrewarmed:(BOOL *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_pluginsPlistDictionary objectForKeyedSubscript:v6];
  if (v7)
  {
    v8 = INCExtensionPlugInBundleManagerPath();
    id v9 = [v8 stringByAppendingPathComponent:v7];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v9];
    *a4 = [v10 isLoaded];
    id v11 = *MEMORY[0x1E4F30240];
    v12 = *MEMORY[0x1E4F30240];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        id v16 = "-[INCExtensionPlugInBundleManager loadBundleForBundleIdentifier:wasPrewarmed:]";
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_INFO, "%s Successfully loaded bundle at path \"%@\"", (uint8_t *)&v15, 0x16u);
      }
      BOOL v13 = [(INCExtensionPlugInBundleManager *)self _registerBundle:v10 bundleIdentifier:v6];
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        id v16 = "-[INCExtensionPlugInBundleManager loadBundleForBundleIdentifier:wasPrewarmed:]";
        __int16 v17 = 2112;
        v18 = v9;
        _os_log_error_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_ERROR, "%s Error loading bundle at path \"%@\"", (uint8_t *)&v15, 0x16u);
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginsPlistDictionary, 0);
  objc_storeStrong((id *)&self->_intentsSupportedQueue, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
}

- (BOOL)_registerBundle:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v32 = *MEMORY[0x1E4F30240];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
LABEL_21:
      BOOL v31 = 0;
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315650;
    v45 = "-[INCExtensionPlugInBundleManager _registerBundle:bundleIdentifier:]";
    __int16 v46 = 2112;
    id v47 = v6;
    __int16 v48 = 2112;
    v49 = v8;
    v33 = "%s Unable to register '%@' bundle for '%@' bundleIdentifier";
    v34 = v32;
    uint32_t v35 = 32;
LABEL_24:
    _os_log_error_impl(&dword_1BC57D000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_21;
  }
  uint64_t v9 = [v6 principalClass];
  if (!v9)
  {
    v36 = *MEMORY[0x1E4F30240];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315394;
    v45 = "-[INCExtensionPlugInBundleManager _registerBundle:bundleIdentifier:]";
    __int16 v46 = 2112;
    id v47 = v6;
    v33 = "%s SiriKit extension plugin does not specify an NSPrincipalClass, unable to load: %@";
    v34 = v36;
    uint32_t v35 = 22;
    goto LABEL_24;
  }
  uint64_t v10 = v9;
  id v11 = [v6 infoDictionary];
  v12 = [v11 objectForKey:@"NSExtension"];

  v38 = v12;
  BOOL v13 = [v12 objectForKey:@"NSExtensionAttributes"];
  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"IntentsSupported"];
  id v16 = (void *)v15;
  uint64_t v17 = MEMORY[0x1E4F1CBF0];
  if (v15) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
  }
  uint64_t v19 = [v14 setWithArray:v18];

  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = [v13 objectForKeyedSubscript:@"IntentsRestrictedWhileLocked"];
  id v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v17;
  }
  v24 = [v20 setWithArray:v23];

  v25 = [[INCExtensionPlugInBundle alloc] initWithPrincipalClass:v10 intentsSupported:v19 intentsRestrictedWhileLocked:v24];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v26 = v19;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        [(INCExtensionPlugInBundleManager *)self _setExtensionPlugInBundle:v25 forIntent:*(void *)(*((void *)&v39 + 1) + 8 * i) bundleIdentifier:v8];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v28);
  }

  BOOL v31 = 1;
LABEL_22:

  return v31;
}

- (void)_setExtensionPlugInBundle:(id)a3 forIntent:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  intentsSupportedQueue = self->_intentsSupportedQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__INCExtensionPlugInBundleManager__setExtensionPlugInBundle_forIntent_bundleIdentifier___block_invoke;
  v15[3] = &unk_1E62BB198;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_sync(intentsSupportedQueue, v15);
}

void __88__INCExtensionPlugInBundleManager__setExtensionPlugInBundle_forIntent_bundleIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:");
  }

  [v4 setObject:a1[7] forKeyedSubscript:a1[6]];
}

- (INCExtensionPlugInBundleManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)INCExtensionPlugInBundleManager;
  uint64_t v2 = [(INCExtensionPlugInBundleManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    intentsSupported = v2->_intentsSupported;
    v2->_intentsSupported = v3;

    dispatch_queue_t v5 = dispatch_queue_create("INCIntentsSupportedQueue", 0);
    intentsSupportedQueue = v2->_intentsSupportedQueue;
    v2->_intentsSupportedQueue = (OS_dispatch_queue *)v5;

    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = [v8 pathForResource:@"SiriKitPlugins" ofType:@"plist"];
    uint64_t v10 = [v7 dictionaryWithContentsOfFile:v9];
    pluginsPlistDictionary = v2->_pluginsPlistDictionary;
    v2->_pluginsPlistDictionary = (NSDictionary *)v10;
  }
  return v2;
}

uint64_t __48__INCExtensionPlugInBundleManager_sharedManager__block_invoke()
{
  sharedManager_sharedManager_225 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

@end