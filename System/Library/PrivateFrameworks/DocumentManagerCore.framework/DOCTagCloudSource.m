@interface DOCTagCloudSource
- (DOCTagCloudSource)initWithTagRegistry:(id)a3;
- (DOCTagRegistryProtocol)tagRegistry;
- (NSObject)iCloudToken;
- (NSUbiquitousKeyValueStore)store;
- (OS_dispatch_queue)workingQueue;
- (id)iCloudTags;
- (id)iCloudTagsDictionary;
- (int64_t)iCloudTagSerialNumber;
- (int64_t)iCloudTagVersion;
- (void)dealloc;
- (void)iCloudTokenWithCompletionBlock:(id)a3;
- (void)isICloudAvailableWithCompletionBlock:(id)a3;
- (void)kvsStoreDidChange:(id)a3;
- (void)readTagsFromCloud:(BOOL)a3;
- (void)setICloudToken:(id)a3;
- (void)setStore:(id)a3;
- (void)setTagRegistry:(id)a3;
- (void)syncTagsWithCloud:(BOOL)a3;
- (void)syncTagsWithCloud:(BOOL)a3 isICloudAvailable:(BOOL)a4;
- (void)ubiquityIdentityDidChange;
- (void)writeTagsToCloud;
@end

@implementation DOCTagCloudSource

- (void)syncTagsWithCloud:(BOOL)a3 isICloudAvailable:(BOOL)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    v6 = [(DOCTagCloudSource *)self iCloudTagsDictionary];

    if (v6)
    {
      [(DOCTagCloudSource *)self readTagsFromCloud:v4];
    }
    else
    {
      [(DOCTagCloudSource *)self writeTagsToCloud];
    }
  }
}

- (int64_t)iCloudTagSerialNumber
{
  v2 = [(DOCTagCloudSource *)self iCloudTagsDictionary];
  v3 = [v2 objectForKeyedSubscript:@"FinderTagSerialNumber"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)readTagsFromCloud:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(DOCTagCloudSource *)self iCloudTagsDictionary];
  if (v5)
  {
    v6 = (void *)v5;
    int64_t v7 = [(DOCTagCloudSource *)self iCloudTagVersion];

    if (v7 == 2)
    {
      int64_t v8 = [(DOCTagCloudSource *)self iCloudTagSerialNumber];
      p_tagRegistry = &self->_tagRegistry;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
      uint64_t v11 = [WeakRetained tagSerialNumber];

      if (v8 > v11 || v3)
      {
        v12 = [(DOCTagCloudSource *)self iCloudTags];
        if (v12)
        {
          v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v12, "count"));
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          v23 = v12;
          id v14 = v12;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v28;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v28 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = [[DOCTag alloc] initWithICloudTagAttributes:*(void *)(*((void *)&v27 + 1) + 8 * v18)];
                [v13 addObject:v19];

                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
            }
            while (v16);
          }

          id v20 = objc_loadWeakRetained((id *)p_tagRegistry);
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __39__DOCTagCloudSource_readTagsFromCloud___block_invoke;
          v24[3] = &unk_2641B5678;
          BOOL v26 = v3;
          id v25 = v13;
          id v21 = v13;
          [v20 performBatchUpdate:v24];

          id v22 = objc_loadWeakRetained((id *)p_tagRegistry);
          [v22 setTagSerialNumber:v8];

          v12 = v23;
        }
      }
    }
  }
}

- (int64_t)iCloudTagVersion
{
  v2 = [(DOCTagCloudSource *)self iCloudTagsDictionary];
  BOOL v3 = [v2 objectForKeyedSubscript:@"FinderTagDictVersion"];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)iCloudTagsDictionary
{
  uint64_t v7 = 0;
  int64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  BOOL v3 = +[DOCManagedPermission defaultPermission];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__DOCTagCloudSource_iCloudTagsDictionary__block_invoke;
  v6[3] = &unk_2641B5718;
  v6[4] = self;
  v6[5] = &v7;
  [v3 adoptPersonaliCloudPersonaAndPerformBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__DOCTagCloudSource_iCloudTagsDictionary__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) store];
  uint64_t v2 = [v5 objectForKey:@"FinderTagDict"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSUbiquitousKeyValueStore)store
{
  return self->_store;
}

void __41__DOCTagCloudSource_initWithTagRegistry___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08C40] additionalStoreWithIdentifier:@"com.apple.finder"];
  [*(id *)(a1 + 32) setStore:v2];
}

- (void)setStore:(id)a3
{
}

- (DOCTagCloudSource)initWithTagRegistry:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)DOCTagCloudSource;
  id v3 = a3;
  id v4 = [(DOCTagCloudSource *)&v24 init];
  [(DOCTagCloudSource *)v4 setTagRegistry:v3];

  id v5 = +[DOCManagedPermission defaultPermission];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke;
  v22[3] = &unk_2641B55D8;
  v6 = v4;
  v23 = v6;
  [v5 adoptPersonaliCloudPersonaAndPerformBlock:v22];

  uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v9 = dispatch_queue_create("com.apple.DocumentManager.TagICloudDataSource.workingQueue", v8);
  workingQueue = v6->_workingQueue;
  v6->_workingQueue = (OS_dispatch_queue *)v9;

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_2;
  id v20 = &unk_2641B5628;
  uint64_t v11 = v6;
  id v21 = v11;
  [(DOCTagCloudSource *)v11 iCloudTokenWithCompletionBlock:&v17];
  if (v11->_store)
  {
    id v12 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17, v18, v19, v20);
    [v12 addObserver:v11 selector:sel_kvsStoreDidChange_ name:*MEMORY[0x263F085E8] object:v11->_store];
  }
  v13 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v17, v18, v19, v20);
  [v13 addObserver:v11 selector:sel_ubiquityIdentityDidChange name:*MEMORY[0x263F085F0] object:0];

  id v14 = v21;
  uint64_t v15 = v11;

  return v15;
}

- (void)setTagRegistry:(id)a3
{
}

- (void)iCloudTokenWithCompletionBlock:(id)a3
{
  id v4 = a3;
  workingQueue = self->_workingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke;
  block[3] = &unk_2641B56C8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workingQueue, block);
}

void __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setICloudToken:v3];
  id v4 = +[DOCPostLaunchBuffer shared];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_3;
  v6[3] = &unk_2641B5600;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  [v4 performAfterLaunchAlwaysAsync:1 block:v6];
}

- (void)setICloudToken:(id)a3
{
}

uint64_t __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __41__DOCTagCloudSource_initWithTagRegistry___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncTagsWithCloud:0 isICloudAvailable:*(void *)(a1 + 40) != 0];
}

void __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v2 ubiquityIdentityToken];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__DOCTagCloudSource_iCloudTokenWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_2641B56A0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

- (void)dealloc
{
  if (self->_store)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F085E8] object:self->_store];
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F085F0] object:0];

  v5.receiver = self;
  v5.super_class = (Class)DOCTagCloudSource;
  [(DOCTagCloudSource *)&v5 dealloc];
}

- (void)ubiquityIdentityDidChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __46__DOCTagCloudSource_ubiquityIdentityDidChange__block_invoke;
  v2[3] = &unk_2641B5628;
  v2[4] = self;
  [(DOCTagCloudSource *)self iCloudTokenWithCompletionBlock:v2];
}

void __46__DOCTagCloudSource_ubiquityIdentityDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(a1 + 32) iCloudToken];
  char v4 = [v6 isEqual:v3];

  objc_super v5 = v6;
  if (v6 && (v4 & 1) == 0)
  {
    [*(id *)(a1 + 32) setICloudToken:v6];
    [*(id *)(a1 + 32) syncTagsWithCloud:1];
    objc_super v5 = v6;
  }
}

- (void)kvsStoreDidChange:(id)a3
{
  objc_super v5 = [a3 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263F085D8]];
  uint64_t v7 = [v6 intValue];

  switch((int)v7)
  {
    case 0:
      id v8 = self;
      uint64_t v9 = 0;
      goto LABEL_7;
    case 1:
      v10 = +[DOCTag tagsLoadedFromUserDefaults];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
      id v12 = [WeakRetained userTags];
      uint64_t v13 = [v10 isEqualToOrderedSet:v12] ^ 1;

      id v8 = self;
      uint64_t v9 = v13;
LABEL_7:
      [(DOCTagCloudSource *)v8 syncTagsWithCloud:v9];
      break;
    case 2:
      id v14 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        id v14 = docLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DOCTagCloudSource kvsStoreDidChange:](v14);
      }
      break;
    case 3:
      [(DOCTagCloudSource *)self ubiquityIdentityDidChange];
      break;
    default:
      id v15 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DOCTagCloudSource.m", 119, @"Unknown kvs store change reason %d", v7);

      break;
  }
}

- (void)syncTagsWithCloud:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__DOCTagCloudSource_syncTagsWithCloud___block_invoke;
  v3[3] = &unk_2641B5650;
  v3[4] = self;
  BOOL v4 = a3;
  [(DOCTagCloudSource *)self isICloudAvailableWithCompletionBlock:v3];
}

uint64_t __39__DOCTagCloudSource_syncTagsWithCloud___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) syncTagsWithCloud:*(unsigned __int8 *)(a1 + 40) isICloudAvailable:a2];
}

void __39__DOCTagCloudSource_readTagsFromCloud___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!*(unsigned char *)(a1 + 40))
  {
    [v3 removeAllTagsOfType:1];
    id v3 = v4;
  }
  [v3 addTags:*(void *)(a1 + 32) options:2];
}

- (void)writeTagsToCloud
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = [(DOCTagCloudSource *)self iCloudTagsDictionary];
  if (v3)
  {
  }
  else
  {
    id v4 = +[DOCTag tagsLoadedFromUserDefaults];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
    id v6 = [WeakRetained userTags];
    char v7 = [v4 isEqualToOrderedSet:v6];

    if (v7) {
      return;
    }
  }
  id v8 = objc_loadWeakRetained((id *)&self->_tagRegistry);
  uint64_t v9 = [v8 userTags];

  uint64_t v10 = [(DOCTagCloudSource *)self iCloudTags];
  uint64_t v11 = (void *)v10;
  id v12 = (void *)MEMORY[0x263EFFA68];
  if (v10) {
    id v12 = (void *)v10;
  }
  id v13 = v12;

  id v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [[DOCTag alloc] initWithICloudTagAttributes:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v17);
  }

  if (!+[DOCTag areTags:v9 equalByNameAndColorTo:v14])
  {
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    int64_t v22 = [(DOCTagCloudSource *)self iCloudTagSerialNumber];
    id v23 = objc_loadWeakRetained((id *)&self->_tagRegistry);
    uint64_t v24 = [v23 tagSerialNumber];

    if (v22 <= v24) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = v22;
    }
    uint64_t v37 = v25 + 1;
    BOOL v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v38 = v9;
    id v27 = v9;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v27);
          }
          uint64_t v32 = [*(id *)(*((void *)&v41 + 1) + 8 * j) iCloudTagAttributes];
          [v26 addObject:v32];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v29);
    }

    [v21 setObject:v26 forKeyedSubscript:@"FinderTags"];
    [v21 setObject:&unk_26C40CB80 forKeyedSubscript:@"FinderTagDictVersion"];
    v33 = [NSNumber numberWithInteger:v37];
    [v21 setObject:v33 forKeyedSubscript:@"FinderTagSerialNumber"];

    id v34 = objc_loadWeakRetained((id *)&self->_tagRegistry);
    [v34 setTagSerialNumber:v37];

    v35 = +[DOCManagedPermission defaultPermission];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __37__DOCTagCloudSource_writeTagsToCloud__block_invoke;
    v39[3] = &unk_2641B5600;
    v39[4] = self;
    id v40 = v21;
    id v36 = v21;
    [v35 adoptPersonaliCloudPersonaAndPerformBlock:v39];

    uint64_t v9 = v38;
  }
}

void __37__DOCTagCloudSource_writeTagsToCloud__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) store];
  [v2 setDictionary:*(void *)(a1 + 40) forKey:@"FinderTagDict"];

  id v3 = [*(id *)(a1 + 32) store];
  [v3 synchronize];
}

- (void)isICloudAvailableWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__DOCTagCloudSource_isICloudAvailableWithCompletionBlock___block_invoke;
  v6[3] = &unk_2641B56F0;
  id v7 = v4;
  id v5 = v4;
  [(DOCTagCloudSource *)self iCloudTokenWithCompletionBlock:v6];
}

uint64_t __58__DOCTagCloudSource_isICloudAvailableWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

- (id)iCloudTags
{
  id v2 = [(DOCTagCloudSource *)self iCloudTagsDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"FinderTags"];

  return v3;
}

- (NSObject)iCloudToken
{
  return self->_iCloudToken;
}

- (OS_dispatch_queue)workingQueue
{
  return self->_workingQueue;
}

- (DOCTagRegistryProtocol)tagRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tagRegistry);
  return (DOCTagRegistryProtocol *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tagRegistry);
  objc_storeStrong((id *)&self->_workingQueue, 0);
  objc_storeStrong((id *)&self->_iCloudToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)kvsStoreDidChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "Received a quota violation change.", v1, 2u);
}

@end