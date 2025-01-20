@interface SOExtensionManager
+ (BOOL)_isMatchedExtension:(id)a3 forBundleIdentifier:(id)a4;
+ (BOOL)isAppleConnectExtensionBundleIdentifier:(id)a3;
+ (BOOL)isInternalExtensionBundleIdentifier:(id)a3;
+ (BOOL)isTiburonExtensionBundleIdentifier:(id)a3;
+ (id)internalExtensionBundleIdentifier;
+ (id)internalExtensionsBundleIdentifiers;
+ (id)sharedInstance;
+ (void)_sendNotificationsLoadedExtensions:(id)a3 new:(id)a4 removed:(id)a5;
- (BOOL)isLoadedExtensionWithBundleIdentifer:(id)a3;
- (NSArray)loadedExtensions;
- (SOExtensionManager)init;
- (id)_doLoadExtensions;
- (id)loadExtensionWithBundleIdentifier:(id)a3;
- (id)loadInternalExtension;
- (id)loadedExtensionWithBundleIdentifer:(id)a3;
- (id)loadedInternalExtension;
- (void)_doBeginMatchingExtensions;
- (void)_doEndMatchingExtensions;
- (void)beginMatchingExtensions;
- (void)dealloc;
- (void)endMatchingExtensions;
- (void)loadExtensionWithBundleIdentifer:(id)a3 completion:(id)a4;
- (void)loadExtensions;
- (void)unloadExtensions;
@end

@implementation SOExtensionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_defaultManager;
  return v2;
}

uint64_t __36__SOExtensionManager_sharedInstance__block_invoke()
{
  sharedInstance_defaultManager = objc_alloc_init(SOExtensionManager);
  return MEMORY[0x270F9A758]();
}

- (SOExtensionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SOExtensionManager;
  v2 = [(SOExtensionManager *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SOExtensionFinder);
    extensionFinder = v2->_extensionFinder;
    v2->_extensionFinder = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.AppSSO.extension-manager-queue", 0);
    extensionManagerQueue = v2->_extensionManagerQueue;
    v2->_extensionManagerQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)dealloc
{
  [(SOExtensionManager *)self unloadExtensions];
  v3.receiver = self;
  v3.super_class = (Class)SOExtensionManager;
  [(SOExtensionManager *)&v3 dealloc];
}

- (void)loadExtensionWithBundleIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SOExtensionManager loadExtensionWithBundleIdentifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s bundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  extensionFinder = self->_extensionFinder;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__SOExtensionManager_loadExtensionWithBundleIdentifer_completion___block_invoke;
  v12[3] = &unk_26432A8D8;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [(SOExtensionFinder *)extensionFinder findExtensionWithBundleIdentifier:v10 completion:v12];
}

void __66__SOExtensionManager_loadExtensionWithBundleIdentifer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v7 = [(id)objc_opt_class() _isMatchedExtension:v5 forBundleIdentifier:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v7)
    {
      (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v5, 0);
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = &v13;
      uint64_t v15 = 0x2050000000;
      v9 = (void *)getSOErrorHelperClass_softClass_2;
      uint64_t v16 = getSOErrorHelperClass_softClass_2;
      if (!getSOErrorHelperClass_softClass_2)
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __getSOErrorHelperClass_block_invoke_2;
        v12[3] = &unk_26432A2A8;
        v12[4] = &v13;
        __getSOErrorHelperClass_block_invoke_2((uint64_t)v12);
        v9 = (void *)v14[3];
      }
      id v10 = v9;
      _Block_object_dispose(&v13, 8);
      id v11 = [v10 internalErrorWithMessage:@"No AppSSO IdP extension found (internal error)"];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
    }
  }
}

- (id)loadExtensionWithBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SOExtensionManager loadExtensionWithBundleIdentifier:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v13 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s bundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v13 = (SOExtensionManager *)__Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke;
  v9[3] = &unk_26432A900;
  id v11 = buf;
  id v6 = v4;
  id v10 = v6;
  [(SOExtensionManager *)self loadExtensionWithBundleIdentifer:v6 completion:v9];
  id v7 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v7;
}

void __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = SO_LOG_SOExtensionManager();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(a1, (uint64_t)v7, v8);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (id)loadInternalExtension
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SOExtensionManager loadInternalExtension]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [(id)objc_opt_class() internalExtensionBundleIdentifier];
  id v5 = [(SOExtensionManager *)self loadExtensionWithBundleIdentifier:v4];

  return v5;
}

- (void)beginMatchingExtensions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SOExtensionManager beginMatchingExtensions]";
    __int16 v6 = 2112;
    int v7 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  [(SOExtensionManager *)self _doBeginMatchingExtensions];
}

- (void)endMatchingExtensions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SOExtensionManager endMatchingExtensions]";
    __int16 v6 = 2112;
    int v7 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  [(SOExtensionManager *)self _doEndMatchingExtensions];
}

- (void)loadExtensions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SOExtensionManager loadExtensions]";
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(SOExtensionManager *)v4 _doLoadExtensions];
  loadedExtensions = v4->_loadedExtensions;
  v4->_loadedExtensions = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (id)_doLoadExtensions
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  extensionFinder = self->_extensionFinder;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__SOExtensionManager__doLoadExtensions__block_invoke;
  v5[3] = &unk_26432A928;
  v5[4] = &v6;
  [(SOExtensionFinder *)extensionFinder findExtensionsWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__SOExtensionManager__doLoadExtensions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v6 = v7;
  }
}

- (void)unloadExtensions
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SOExtensionManager unloadExtensions]";
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = v4->_loadedExtensions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "unload", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  loadedExtensions = v4->_loadedExtensions;
  v4->_loadedExtensions = 0;

  objc_sync_exit(v4);
}

- (id)loadedExtensionWithBundleIdentifer:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOExtensionManager loadedExtensionWithBundleIdentifer:]();
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = v6->_loadedExtensions;
  id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend((id)objc_opt_class(), "_isMatchedExtension:forBundleIdentifier:", v11, v4, (void)v15))
        {
          id v8 = v11;
          goto LABEL_13;
        }
      }
      id v8 = (id)[(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v6);
  long long v12 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = [(SOExtensionManager *)v6 loadedExtensions];
    *(_DWORD *)buf = 136316162;
    v20 = "-[SOExtensionManager loadedExtensionWithBundleIdentifer:]";
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 2114;
    v26 = v13;
    __int16 v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_2185C9000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@ => %{public}@ in %{public}@ on %@", buf, 0x34u);
  }
  return v8;
}

- (id)loadedInternalExtension
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SOExtensionManager loadedInternalExtension]";
    __int16 v9 = 2112;
    long long v10 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [(id)objc_opt_class() internalExtensionBundleIdentifier];
  uint64_t v5 = [(SOExtensionManager *)self loadedExtensionWithBundleIdentifer:v4];

  return v5;
}

- (BOOL)isLoadedExtensionWithBundleIdentifer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOExtensionManager isLoadedExtensionWithBundleIdentifer:]();
  }

  uint64_t v6 = [(SOExtensionManager *)self loadedExtensionWithBundleIdentifer:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)_doBeginMatchingExtensions
{
  extensionFinder = self->_extensionFinder;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke;
  v3[3] = &unk_26432A950;
  v3[4] = self;
  [(SOExtensionFinder *)extensionFinder beginMatchingExtensionsWithCompletion:v3];
}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_2;
  block[3] = &unk_26432A3B8;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_2(id *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a1[4];
  id v2 = a1[5];
  if (v3)
  {
    [v2 endMatchingExtensions];
    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    id v5 = *((void *)a1[5] + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3;
    block[3] = &unk_26432A408;
    id v6 = a1[4];
    id v7 = a1[5];
    id v24 = v6;
    id v25 = v7;
    dispatch_after(v4, v5, block);
    id v8 = v24;
  }
  else
  {
    id v9 = [v2 loadedExtensions];
    id v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = a1[6];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v10, "containsObject:", v17, (void)v19)) {
            [v10 removeObject:v17];
          }
          else {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v14);
    }

    id v18 = a1[5];
    id v8 = v10;
    objc_sync_enter(v18);
    objc_storeStrong((id *)a1[5] + 3, a1[6]);
    objc_sync_exit(v18);

    [(id)objc_opt_class() _sendNotificationsLoadedExtensions:a1[6] new:v11 removed:v8];
  }
}

uint64_t __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3(uint64_t a1)
{
  id v2 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 40) beginMatchingExtensions];
}

- (void)_doEndMatchingExtensions
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SOExtensionManager _doEndMatchingExtensions]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

  [(SOExtensionFinder *)self->_extensionFinder endMatchingExtensions];
}

+ (void)_sendNotificationsLoadedExtensions:(id)a3 new:(id)a4 removed:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SO_LOG_SOExtensionManager();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v24 = "+[SOExtensionManager _sendNotificationsLoadedExtensions:new:removed:]";
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v9;
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = a1;
    _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_DEFAULT, "%s extensions: %{public}@, new: %{public}@, removed: %{public}@ on %@", buf, 0x34u);
  }

  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA78];
  }
  uint64_t v17 = @"extensions";
  id v18 = @"new";
  if (v9) {
    id v13 = v9;
  }
  else {
    id v13 = (id)MEMORY[0x263EFFA78];
  }
  id v20 = v12;
  id v21 = v13;
  long long v19 = @"removed";
  if (v10) {
    id v14 = v10;
  }
  else {
    id v14 = (id)MEMORY[0x263EFFA78];
  }
  id v22 = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v17 count:3];
  long long v16 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17, v18, v19, v20, v21);
  [v16 postNotificationName:@"com.apple.AppSSO.SOExtensionManager.ExtensionsChanged" object:a1 userInfo:v15];
}

+ (BOOL)_isMatchedExtension:(id)a3 forBundleIdentifier:(id)a4
{
  id v5 = a4;
  __int16 v6 = [a3 extensionBundleIdentifier];
  char v7 = [v6 isEqualToString:v5];

  return v7;
}

+ (id)internalExtensionBundleIdentifier
{
  return @"com.apple.AuthKitUI.AKAppSSOExtension";
}

+ (id)internalExtensionsBundleIdentifiers
{
  return &unk_26C9B5770;
}

+ (BOOL)isInternalExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 internalExtensionsBundleIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (BOOL)isAppleConnectExtensionBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.ist.ds.appleconnect2.AppSSOExtension"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.ist.AppleConnect.App-SSO"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.ist.AppleConnect.mini.App-SSO"];
  }

  return v4;
}

+ (BOOL)isTiburonExtensionBundleIdentifier:(id)a3
{
  return [a3 isEqualToString:@"com.apple.AuthKitUI.AKAppSSOExtension"];
}

- (NSArray)loadedExtensions
{
  return self->_loadedExtensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedExtensions, 0);
  objc_storeStrong((id *)&self->_extensionFinder, 0);
  objc_storeStrong((id *)&self->_extensionManagerQueue, 0);
}

void __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2185C9000, log, OS_LOG_TYPE_ERROR, "extension not found: %{public}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)loadedExtensionWithBundleIdentifer:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "%s bundleIdentifier=%{public}@ on %@", v2);
}

- (void)isLoadedExtensionWithBundleIdentifer:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "%s bundleIdentifier=%{public}@ on %@", v2);
}

void __48__SOExtensionManager__doBeginMatchingExtensions__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2185C9000, a2, OS_LOG_TYPE_ERROR, "restarting matching extensions because of error: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end