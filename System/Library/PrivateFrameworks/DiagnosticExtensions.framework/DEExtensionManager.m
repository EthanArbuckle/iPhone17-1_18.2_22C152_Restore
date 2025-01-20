@interface DEExtensionManager
+ (id)sharedInstance;
- (BOOL)extendedLoaded;
- (DEExtensionManager)init;
- (NSArray)extensions;
- (OS_dispatch_queue)initialLoadQueue;
- (id)afterExtendedBlock;
- (id)extensionForIdentifier:(id)a3;
- (id)extensionsWithFilter:(id)a3;
- (void)loadExtensions;
- (void)setAfterExtendedBlock:(id)a3;
- (void)setExtendedLoaded:(BOOL)a3;
- (void)setExtensions:(id)a3;
- (void)setInitialLoadQueue:(id)a3;
@end

@implementation DEExtensionManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__manager;
  return v2;
}

uint64_t __36__DEExtensionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DEExtensionManager);
  v1 = (void *)sharedInstance__manager;
  sharedInstance__manager = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("initialLoadQueue", 0);
  [(id)sharedInstance__manager setInitialLoadQueue:v2];

  dispatch_queue_t v3 = dispatch_queue_create("extendedQueue", MEMORY[0x1E4F14430]);
  v4 = (void *)extendedQueue;
  extendedQueue = (uint64_t)v3;

  [(id)sharedInstance__manager setAfterExtendedBlock:0];
  v5 = (void *)sharedInstance__manager;
  return [v5 setExtendedLoaded:0];
}

- (id)extensionForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(DEExtensionManager *)self extensions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (DEExtensionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)DEExtensionManager;
  return [(DEExtensionManager *)&v3 init];
}

- (void)loadExtensions
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[DELogging fwHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7E51000, v3, OS_LOG_TYPE_DEFAULT, "Start loading extension initial info", buf, 2u);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v11 = *MEMORY[0x1E4F282B0];
  v12[0] = @"com.apple.diagnosticextensions-service";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v6 = (void *)MEMORY[0x1E4F28C70];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__DEExtensionManager_loadExtensions__block_invoke;
  v8[3] = &unk_1E5D30520;
  v8[4] = self;
  dispatch_semaphore_t v9 = v4;
  uint64_t v7 = v4;
  [v6 extensionsWithMatchingAttributes:v5 completion:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

void __36__DEExtensionManager_loadExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[DELogging fwHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1A7E51000, v7, OS_LOG_TYPE_DEFAULT, "Error discovering extensions: %@", buf, 0xCu);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        long long v15 = [DEExtension alloc];
        long long v16 = -[DEExtension initWithNSExtension:](v15, "initWithNSExtension:", v14, (void)v19);
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v17 = (id)[v8 sortedArrayUsingComparator:&__block_literal_global_21];
  uint64_t v18 = +[DELogging fwHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7E51000, v18, OS_LOG_TYPE_INFO, "Finished loading extension initial info", buf, 2u);
  }

  [*(id *)(a1 + 32) setExtensions:v8];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __36__DEExtensionManager_loadExtensions__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 attachmentsName];
  id v6 = [v4 attachmentsName];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (id)extensionsWithFilter:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__1;
  id v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v5 = [(DEExtensionManager *)self initialLoadQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DEExtensionManager_extensionsWithFilter___block_invoke;
  block[3] = &unk_1E5D30548;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __43__DEExtensionManager_extensionsWithFilter___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = [*(id *)(a1 + 40) extensions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v11 = *(void **)(a1 + 32);
          uint64_t v12 = [v10 identifier];
          LODWORD(v11) = [v11 containsObject:v12];

          if (v11) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) extensions];
    uint64_t v13 = [v16 mutableCopy];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

- (OS_dispatch_queue)initialLoadQueue
{
  return self->_initialLoadQueue;
}

- (void)setInitialLoadQueue:(id)a3
{
}

- (NSArray)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
}

- (id)afterExtendedBlock
{
  return self->_afterExtendedBlock;
}

- (void)setAfterExtendedBlock:(id)a3
{
}

- (BOOL)extendedLoaded
{
  return self->_extendedLoaded;
}

- (void)setExtendedLoaded:(BOOL)a3
{
  self->_extendedLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_afterExtendedBlock, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_initialLoadQueue, 0);
}

@end