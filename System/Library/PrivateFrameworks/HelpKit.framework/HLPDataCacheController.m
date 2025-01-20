@interface HLPDataCacheController
+ (id)sharedInstance;
+ (void)setAppGroupIdentifier:(id)a3;
- (BOOL)backgroundOriginUpdate;
- (BOOL)cacheValidForIdentifier:(id)a3 path:(id)a4;
- (BOOL)dataCacheDirty;
- (BOOL)isURLValid:(id)a3;
- (HLPDataCacheController)init;
- (HLPDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6;
- (NSMutableArray)dataCacheArray;
- (NSMutableArray)originFetchItems;
- (NSMutableDictionary)dataCacheMap;
- (NSString)cacheDirectory;
- (NSString)identifier;
- (NSString)languageCode;
- (NSUserDefaults)userDefaults;
- (float)defaultPriority;
- (id)cacheFileURLForDataCache:(id)a3;
- (id)cacheFileURLForIdentifier:(id)a3;
- (id)dataCacheForIdentifier:(id)a3;
- (id)dataCacheForPath:(id)a3;
- (id)formattedDataForPath:(id)a3 identifier:(id)a4 completionHandler:(id)a5;
- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7;
- (unint64_t)cacheSize;
- (unint64_t)maxDataCacheSize;
- (void)addDataCache:(id)a3;
- (void)cancelAllOriginSessionItems;
- (void)commonInit;
- (void)createCacheDirectory;
- (void)dealloc;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
- (void)reloadDataCache;
- (void)removeAllDataCache;
- (void)removeCacheForIdentifier:(id)a3;
- (void)removeDataCache:(id)a3;
- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4;
- (void)setBackgroundOriginUpdate:(BOOL)a3;
- (void)setCacheDirectory:(id)a3;
- (void)setCacheSize:(unint64_t)a3;
- (void)setDataCacheArray:(id)a3;
- (void)setDataCacheDirty:(BOOL)a3;
- (void)setDataCacheMap:(id)a3;
- (void)setDefaultPriority:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMaxDataCacheSize:(unint64_t)a3;
- (void)setOriginFetchItems:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)syncCacheImmediately;
- (void)updateCache;
- (void)updateCacheDelay;
@end

@implementation HLPDataCacheController

+ (void)setAppGroupIdentifier:(id)a3
{
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate != -1) {
    dispatch_once(&sharedInstance_predicate, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_gHLPDataCacheController;
  return v2;
}

uint64_t __40__HLPDataCacheController_sharedInstance__block_invoke()
{
  sharedInstance_gHLPDataCacheController = [[HLPDataCacheController alloc] initWithIdentifier:@"HLPDataCacheIdentifier" directoryName:@"com.apple.helpkit.Data" maxCacheSize:5242880 URLSessionDataType:0];
  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  [(HLPDataCacheController *)self cancelAllOriginSessionItems];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateCacheDelay object:0];
  v3.receiver = self;
  v3.super_class = (Class)HLPDataCacheController;
  [(HLPDataCacheController *)&v3 dealloc];
}

- (void)commonInit
{
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.IPDataCacheControllerSerialQueue", 0);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  self->_dataCacheSerialQueue = v3;

  self->_defaultPriority = *(float *)MEMORY[0x263F085B8];
  self->_cacheSize = 0;
  v5 = [MEMORY[0x263EFF980] array];
  dataCacheArray = self->_dataCacheArray;
  self->_dataCacheArray = v5;

  v7 = [MEMORY[0x263EFF9A0] dictionary];
  dataCacheMap = self->_dataCacheMap;
  self->_dataCacheMap = v7;

  self->_originFetchItems = [MEMORY[0x263EFF980] array];
  MEMORY[0x270F9A758]();
}

- (HLPDataCacheController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HLPDataCacheController;
  v2 = [(HLPDataCacheController *)&v5 init];
  objc_super v3 = v2;
  if (v2) {
    [(HLPDataCacheController *)v2 commonInit];
  }
  return v3;
}

- (HLPDataCacheController)initWithIdentifier:(id)a3 directoryName:(id)a4 maxCacheSize:(unint64_t)a5 URLSessionDataType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v30.receiver = self;
  v30.super_class = (Class)HLPDataCacheController;
  v13 = [(HLPDataCacheController *)&v30 init];
  v14 = v13;
  if (v13)
  {
    [(HLPDataCacheController *)v13 commonInit];
    objc_storeStrong((id *)&v14->_identifier, a3);
    v14->_dataType = a6;
    v14->_maxDataCacheSize = a5;
    v15 = [MEMORY[0x263F08850] defaultManager];
    v16 = v15;
    if (!v14->_cacheDirectory)
    {
      if (!kHLPDataCacheAppGroupIdentifier) {
        goto LABEL_6;
      }
      v17 = objc_msgSend(v15, "containerURLForSecurityApplicationGroupIdentifier:");
      if (!v17) {
        goto LABEL_6;
      }
      v18 = v17;
      v19 = [v17 URLByAppendingPathComponent:@"Library/Caches"];

      v20 = [v19 path];
      id v21 = objc_alloc(MEMORY[0x263EFFA40]);
      uint64_t v22 = [v21 initWithSuiteName:kHLPDataCacheAppGroupIdentifier];
      userDefaults = v14->_userDefaults;
      v14->_userDefaults = (NSUserDefaults *)v22;

      if (!v20)
      {
LABEL_6:
        v24 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
        v20 = [v24 objectAtIndex:0];
        uint64_t v25 = [MEMORY[0x263EFFA40] standardUserDefaults];
        v26 = v14->_userDefaults;
        v14->_userDefaults = (NSUserDefaults *)v25;
      }
      uint64_t v27 = [v20 stringByAppendingPathComponent:v12];
      cacheDirectory = v14->_cacheDirectory;
      v14->_cacheDirectory = (NSString *)v27;
    }
    [(HLPDataCacheController *)v14 reloadDataCache];
  }
  return v14;
}

- (void)syncCacheImmediately
{
  [(HLPDataCacheController *)self updateCacheDelay];
  [(HLPDataCacheController *)self cancelAllOriginSessionItems];
}

- (id)dataCacheForPath:(id)a3
{
  v4 = [a3 lastPathComponent];
  objc_super v5 = [(HLPDataCacheController *)self dataCacheForIdentifier:v4];

  return v5;
}

- (id)dataCacheForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HLPDataCacheController_dataCacheForIdentifier___block_invoke;
  v9[3] = &unk_264579170;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  id v11 = &v14;
  id v6 = v4;
  dispatch_sync(dataCacheSerialQueue, v9);
  id v7 = (id)v15[5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __49__HLPDataCacheController_dataCacheForIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained dataCacheMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)createCacheDirectory
{
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  if (([v3 fileExistsAtPath:self->_cacheDirectory] & 1) == 0)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__1;
    v17 = __Block_byref_object_dispose__1;
    id v18 = 0;
    uint64_t v4 = [NSURL URLWithString:self->_cacheDirectory];
    id v5 = objc_alloc_init(MEMORY[0x263F08830]);
    objc_initWeak(&location, self);
    id v6 = (id *)(v14 + 5);
    id obj = (id)v14[5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__HLPDataCacheController_createCacheDirectory__block_invoke;
    v7[3] = &unk_264579198;
    id v8 = v3;
    v9 = &v13;
    objc_copyWeak(&v10, &location);
    [v5 coordinateWritingItemAtURL:v4 options:8 error:&obj byAccessor:v7];
    objc_storeStrong(v6, obj);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v13, 8);
  }
}

void __46__HLPDataCacheController_createCacheDirectory__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 path];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v5 + 40);
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = HLPLogForCategory(2uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      id v8 = [WeakRetained cacheDirectory];
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_220BD8000, v6, OS_LOG_TYPE_DEFAULT, "Unable to create path %@", buf, 0xCu);
    }
  }
}

- (BOOL)cacheValidForIdentifier:(id)a3 path:(id)a4
{
  uint64_t v5 = -[HLPDataCacheController dataCacheForIdentifier:](self, "dataCacheForIdentifier:", a3, a4);
  id v6 = [(HLPDataCacheController *)self cacheFileURLForDataCache:v5];
  id v7 = [v6 path];
  if (v7)
  {
    id v8 = [MEMORY[0x263F08850] defaultManager];
    v9 = [v6 path];
    if ([v8 fileExistsAtPath:v9]) {
      int v10 = [v5 expired] ^ 1;
    }
    else {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)cacheFileURLForDataCache:(id)a3
{
  uint64_t v4 = [a3 identifier];
  uint64_t v5 = [(HLPDataCacheController *)self cacheFileURLForIdentifier:v4];

  return v5;
}

- (id)cacheFileURLForIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[NSString stringByAppendingPathComponent:](self->_cacheDirectory, "stringByAppendingPathComponent:");
    if (v3)
    {
      uint64_t v4 = [NSURL fileURLWithPath:v3];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setLanguageCode:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSString *)self->_languageCode isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_languageCode, a3);
    objc_initWeak(&location, self);
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    id v24 = 0;
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__HLPDataCacheController_setLanguageCode___block_invoke;
    block[3] = &unk_2645791C0;
    block[4] = &v19;
    objc_copyWeak(&v18, &location);
    dispatch_sync(dataCacheSerialQueue, block);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = (id)v20[5];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "languageCode", (void)v13);
          char v12 = [v11 isEqualToString:v5];

          if ((v12 & 1) == 0)
          {

            [(HLPDataCacheController *)self removeAllDataCache];
            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v26 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

LABEL_12:
    objc_destroyWeak(&v18);
    _Block_object_dispose(&v19, 8);

    objc_destroyWeak(&location);
  }
}

void __42__HLPDataCacheController_setLanguageCode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataCacheArray];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)reloadDataCache
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_220BD8000, log, OS_LOG_TYPE_ERROR, "Unable to unarchive %@, error: %@", (uint8_t *)&v4, 0x16u);
}

void __41__HLPDataCacheController_reloadDataCache__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained dataCacheArray];
  [v3 removeAllObjects];

  id v5 = objc_loadWeakRetained(v1);
  int v4 = [v5 dataCacheMap];
  [v4 removeAllObjects];
}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained cacheDirectory];
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [WeakRetained dataCacheMap];
  [v5 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];

  id v7 = objc_loadWeakRetained(v3);
  __int16 v6 = [v7 dataCacheArray];
  [v6 addObject:*(void *)(a1 + 40)];
}

void __41__HLPDataCacheController_reloadDataCache__block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

- (void)updateCache
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__HLPDataCacheController_updateCache__block_invoke;
  block[3] = &unk_264578F78;
  objc_copyWeak(&v4, &location);
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __37__HLPDataCacheController_updateCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDataCacheDirty:1];

  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_updateCacheDelay object:0];
  id v4 = objc_loadWeakRetained(v2);
  [v4 performSelector:sel_updateCacheDelay withObject:0 afterDelay:2.0];
}

- (void)updateCacheDelay
{
  objc_initWeak(&location, self);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__1;
  v8[4] = __Block_byref_object_dispose__1;
  id v9 = 0;
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HLPDataCacheController_updateCacheDelay__block_invoke;
  block[3] = &unk_2645791C0;
  block[4] = v8;
  objc_copyWeak(&v7, &location);
  dispatch_sync(dataCacheSerialQueue, block);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__HLPDataCacheController_updateCacheDelay__block_invoke_2;
  v4[3] = &unk_264579288;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  v4[5] = v8;
  dispatch_async(MEMORY[0x263EF83A0], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);

  objc_destroyWeak(&location);
}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataCacheArray];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained dataCacheDirty];

  if (v4)
  {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel_updateCacheDelay object:0];
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v15 = 0;
    __int16 v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v15];
    id v7 = v15;
    if (v7)
    {
      uint64_t v8 = HLPLogForCategory(2uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __42__HLPDataCacheController_updateCacheDelay__block_invoke_2_cold_1(v2, (uint64_t)v7, v8);
      }
    }
    else
    {
      id v9 = objc_loadWeakRetained(v2);
      uint64_t v10 = [v9 userDefaults];
      id v11 = objc_loadWeakRetained(v2);
      char v12 = [v11 identifier];
      [v10 setObject:v6 forKey:v12];

      uint64_t v8 = objc_loadWeakRetained(v2);
      long long v13 = [v8 userDefaults];
      [v13 synchronize];
    }
    id v14 = objc_loadWeakRetained(v2);
    [v14 setDataCacheDirty:0];
  }
}

- (void)addDataCache:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  uint64_t v5 = [v4 identifier];
  __int16 v6 = [(HLPDataCacheController *)self dataCacheForIdentifier:v5];
  if (!v6)
  {
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__HLPDataCacheController_addDataCache___block_invoke;
    block[3] = &unk_264579238;
    objc_copyWeak(&v30, location);
    id v28 = v5;
    id v8 = v4;
    id v29 = v8;
    dispatch_sync(dataCacheSerialQueue, block);
    uint64_t v9 = [v8 fileSize];
    unint64_t maxDataCacheSize = self->_maxDataCacheSize;
    unint64_t v11 = self->_cacheSize + v9;
    self->_cacheSize = v11;
    if (v11 > maxDataCacheSize && [v8 fileSize] < self->_maxDataCacheSize)
    {
      char v12 = 0;
      uint64_t v18 = MEMORY[0x263EF8330];
      do
      {
        uint64_t v21 = 0;
        uint64_t v22 = &v21;
        uint64_t v23 = 0x3032000000;
        id v24 = __Block_byref_object_copy__1;
        uint64_t v25 = __Block_byref_object_dispose__1;
        id v26 = 0;
        long long v13 = self->_dataCacheSerialQueue;
        v19[0] = v18;
        v19[1] = 3221225472;
        v19[2] = __39__HLPDataCacheController_addDataCache___block_invoke_2;
        v19[3] = &unk_2645791C0;
        v19[4] = &v21;
        objc_copyWeak(&v20, location);
        dispatch_sync(v13, v19);
        [(HLPDataCacheController *)self removeDataCache:v22[5] updateCache:0];
        id v14 = (id)v22[5];

        objc_destroyWeak(&v20);
        _Block_object_dispose(&v21, 8);

        unint64_t v15 = [(HLPDataCacheController *)self cacheSize];
        if (v15 <= [(HLPDataCacheController *)self maxDataCacheSize]) {
          break;
        }
        long long v16 = [(HLPDataCacheController *)self dataCacheArray];
        unint64_t v17 = [v16 count];

        if (v17 < 2) {
          break;
        }
        char v12 = v14;
      }
      while (v14 != v8);
    }
    objc_destroyWeak(&v30);
  }
  [(HLPDataCacheController *)self updateCache];

  objc_destroyWeak(location);
}

void __39__HLPDataCacheController_addDataCache___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = [WeakRetained dataCacheMap];
  [v5 setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];

  id v7 = objc_loadWeakRetained(v3);
  __int16 v6 = [v7 dataCacheArray];
  [v6 addObject:*(void *)(a1 + 40)];
}

void __39__HLPDataCacheController_addDataCache___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataCacheArray];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)cancelAllOriginSessionItems
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_originFetchItems copy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = +[HLPURLSessionManager defaultManager];
        [v10 cancelSessionItem:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__HLPDataCacheController_cancelAllOriginSessionItems__block_invoke;
  v12[3] = &unk_2645791E8;
  objc_copyWeak(&v13, &location);
  dispatch_sync(dataCacheSerialQueue, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__HLPDataCacheController_cancelAllOriginSessionItems__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained originFetchItems];
  [v1 removeAllObjects];
}

- (void)removeAllDataCache
{
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [v3 enumeratorAtPath:self->_cacheDirectory];
  id v5 = objc_alloc_init(MEMORY[0x263F08830]);
  uint64_t v6 = [v4 nextObject];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSString *)self->_cacheDirectory stringByAppendingPathComponent:v7];
      if (v9)
      {
        uint64_t v10 = [NSURL URLWithString:v9];
        id v22 = v8;
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __44__HLPDataCacheController_removeAllDataCache__block_invoke;
        v20[3] = &unk_264579260;
        id v21 = v3;
        [v5 coordinateWritingItemAtURL:v10 options:1 error:&v22 byAccessor:v20];
        id v11 = v22;

        uint64_t v8 = v11;
      }

      uint64_t v12 = [v4 nextObject];

      uint64_t v7 = (void *)v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_initWeak(&location, self);
  dataCacheSerialQueue = self->_dataCacheSerialQueue;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  long long v16 = __44__HLPDataCacheController_removeAllDataCache__block_invoke_2;
  long long v17 = &unk_2645791E8;
  objc_copyWeak(&v18, &location);
  dispatch_sync(dataCacheSerialQueue, &v14);
  self->_cacheSize = 0;
  [(HLPDataCacheController *)self updateCacheDelay];
  [(NSUserDefaults *)self->_userDefaults removeObjectForKey:self->_identifier];
  [(NSUserDefaults *)self->_userDefaults synchronize];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __44__HLPDataCacheController_removeAllDataCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

void __44__HLPDataCacheController_removeAllDataCache__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained dataCacheMap];
  [v3 removeAllObjects];

  id v5 = objc_loadWeakRetained(v1);
  id v4 = [v5 dataCacheArray];
  [v4 removeAllObjects];
}

- (void)removeCacheForIdentifier:(id)a3
{
  id v4 = [(HLPDataCacheController *)self dataCacheForIdentifier:a3];
  [(HLPDataCacheController *)self removeDataCache:v4];
}

- (void)removeDataCache:(id)a3
{
}

- (void)removeDataCache:(id)a3 updateCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 identifier];
    objc_initWeak(location, self);
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__1;
    v37 = __Block_byref_object_dispose__1;
    id v38 = 0;
    dataCacheSerialQueue = self->_dataCacheSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke;
    block[3] = &unk_2645792B0;
    v31 = &v33;
    objc_copyWeak(&v32, location);
    id v10 = v8;
    id v30 = v10;
    dispatch_sync(dataCacheSerialQueue, block);
    if (v34[5])
    {
      id v11 = [(HLPDataCacheController *)self cacheFileURLForDataCache:v7];
      uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
      id v13 = [v11 path];
      if (v13)
      {
        uint64_t v14 = [v11 path];
        int v15 = [v12 fileExistsAtPath:v14];

        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x263F08830]);
          id v28 = 0;
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_2;
          v26[3] = &unk_264579260;
          id v27 = v12;
          [v16 coordinateWritingItemAtURL:v11 options:1 error:&v28 byAccessor:v26];
          id v17 = v28;
        }
      }
      id v18 = self->_dataCacheSerialQueue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_3;
      v23[3] = &unk_264578F78;
      objc_copyWeak(&v25, location);
      id v24 = v10;
      dispatch_sync(v18, v23);

      objc_destroyWeak(&v25);
    }
    self->_cacheSize -= [v7 fileSize];
    uint64_t v19 = self->_dataCacheSerialQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_4;
    v20[3] = &unk_264578F78;
    objc_copyWeak(&v22, location);
    id v21 = v7;
    dispatch_sync(v19, v20);
    if (v4) {
      [(HLPDataCacheController *)self updateCache];
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v32);
    _Block_object_dispose(&v33, 8);

    objc_destroyWeak(location);
  }
}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained dataCacheMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 path];
  [v2 removeItemAtPath:v3 error:0];
}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataCacheMap];
  [v2 removeObjectForKey:*(void *)(a1 + 32)];
}

void __54__HLPDataCacheController_removeDataCache_updateCache___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained dataCacheArray];
  [v2 removeObject:*(void *)(a1 + 32)];
}

- (id)newDataCache
{
  uint64_t v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:0];
  [(HLPDataCache *)v2 setMaxAge:259200];
  return v2;
}

- (id)saveFileURL:(id)a3 identifier:(id)a4 fileSize:(unint64_t)a5 lastModified:(id)a6 dataCache:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = v15;
  id v17 = 0;
  if (v12 && v13)
  {
    unint64_t v40 = a5;
    id v18 = v15;
    uint64_t v19 = [v18 lastModified];
    int v20 = [v19 isEqualToString:v14];

    id v21 = [MEMORY[0x263F08850] defaultManager];
    id v22 = [(HLPDataCacheController *)self cacheFileURLForIdentifier:v13];
    uint64_t v23 = [v22 path];
    v43 = v21;
    if (v23)
    {
      id v24 = (void *)v23;
      [v22 path];
      int v41 = v20;
      id v25 = v18;
      id v26 = self;
      id v27 = v13;
      id v28 = v12;
      id v29 = v14;
      id v30 = v16;
      id v32 = v31 = v22;
      int v33 = [v21 fileExistsAtPath:v32];

      id v22 = v31;
      id v16 = v30;
      id v14 = v29;
      id v12 = v28;
      id v13 = v27;
      self = v26;
      id v18 = v25;

      if (v41 & v33)
      {
        id v17 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      LOBYTE(v33) = 0;
    }
    id v34 = v22;
    [(HLPDataCacheController *)self createCacheDirectory];
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__1;
    v56 = __Block_byref_object_dispose__1;
    id v57 = 0;
    id v42 = objc_alloc_init(MEMORY[0x263F08830]);
    uint64_t v35 = (id *)(v53 + 5);
    id obj = (id)v53[5];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __81__HLPDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke;
    v44[3] = &unk_2645792D8;
    char v50 = v33;
    id v45 = v43;
    v48 = &v52;
    id v17 = v34;
    id v46 = v17;
    id v47 = v12;
    v49 = &v58;
    [v42 coordinateWritingItemAtURL:v17 options:1 writingItemAtURL:v17 options:2 error:&obj byAccessor:v44];
    objc_storeStrong(v35, obj);
    if (v18)
    {
      if (*((unsigned char *)v59 + 24))
      {
        -[HLPDataCacheController setCacheSize:](self, "setCacheSize:", -[HLPDataCacheController cacheSize](self, "cacheSize") - [v18 fileSize]);
        [(HLPDataCacheController *)self setCacheSize:[(HLPDataCacheController *)self cacheSize] + v40];
LABEL_14:
        objc_msgSend(v18, "setLastModified:", v14, v22);
        v37 = [MEMORY[0x263EFF910] date];
        [v18 setUpdatedDate:v37];

        [v18 setFileSize:v40];
        if (v18) {
          [(HLPDataCacheController *)self addDataCache:v18];
        }

        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v58, 8);
        id v22 = v39;
        goto LABEL_17;
      }
      [(HLPDataCacheController *)self removeDataCache:v18];
    }
    else if (*((unsigned char *)v59 + 24))
    {
      id v18 = [(HLPDataCacheController *)self newDataCache];
      v36 = [(HLPDataCacheController *)self languageCode];
      [v18 setLanguageCode:v36];

      [v18 setIdentifier:v13];
      goto LABEL_14;
    }
    id v18 = 0;
    goto LABEL_14;
  }
LABEL_18:

  return v17;
}

void __81__HLPDataCacheController_saveFileURL_identifier_fileSize_lastModified_dataCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    [v7 removeItemAtURL:v5 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v9 = HLPLogForCategory(2uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v11;
        _os_log_impl(&dword_220BD8000, v9, OS_LOG_TYPE_DEFAULT, "Unable to delete %@. Error: %@", buf, 0x16u);
      }
    }
  }
  id v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  id v18 = *(id *)(v14 + 40);
  int v15 = [v12 moveItemAtURL:v13 toURL:v6 error:&v18];
  objc_storeStrong((id *)(v14 + 40), v18);
  if (v15 && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    id v16 = HLPLogForCategory(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v17;
      _os_log_impl(&dword_220BD8000, v16, OS_LOG_TYPE_DEFAULT, "Unable to save cache image %@", buf, 0xCu);
    }
  }
}

- (id)formattedDataForRequest:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 URL];
  id v38 = [v11 path];
  if (!v38)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Empty data path" code:-1 userInfo:0];
    (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v13);

    uint64_t v14 = 0;
    goto LABEL_28;
  }
  if (!v9)
  {
    id v9 = [v38 lastPathComponent];
  }
  uint64_t v60 = 0;
  char v61 = &v60;
  uint64_t v62 = 0x2020000000;
  char v63 = 1;
  v37 = v10;
  if ([v8 cachePolicy] == 1)
  {
    char v12 = 0;
  }
  else
  {
    int v15 = [(HLPDataCacheController *)self dataCacheForIdentifier:v9];
    id v16 = [(HLPDataCacheController *)self cacheFileURLForDataCache:v15];
    uint64_t v17 = [v16 path];
    if (!v17) {
      goto LABEL_12;
    }
    id v18 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v19 = [v16 path];
    int v20 = [v18 fileExistsAtPath:v19];

    if (v20)
    {
      uint64_t v21 = [v15 identifier];
      __int16 v22 = [(HLPDataCacheController *)self cacheFileURLForIdentifier:v21];

      if (v22 && [(HLPDataCacheController *)self isURLValid:v22])
      {
        v54[0] = MEMORY[0x263EF8330];
        v54[1] = 3221225472;
        v54[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke;
        v54[3] = &unk_264579300;
        id v58 = v37;
        id v55 = v15;
        v59 = &v60;
        id v56 = v38;
        id v57 = self;
        [(HLPDataCacheController *)self formattedDataWithFileURL:v22 completionHandler:v54];

        char v12 = 1;
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
LABEL_12:
      if (v15) {
        [(HLPDataCacheController *)self removeDataCache:v15];
      }
      char v12 = 0;
      __int16 v22 = v16;
    }

    id v10 = v37;
  }
  if (!*((unsigned char *)v61 + 24) && ![(HLPDataCacheController *)self backgroundOriginUpdate]) {
    goto LABEL_21;
  }
  if (![v11 isFileURL])
  {
    uint64_t v23 = +[HLPURLSessionManager defaultManager];
    if (v12)
    {
      uint64_t v44 = 0;
      id v45 = &v44;
      uint64_t v46 = 0x3032000000;
      id v47 = __Block_byref_object_copy__1;
      v48 = __Block_byref_object_dispose__1;
      id v49 = 0;
      objc_initWeak(&location, self);
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_3;
      v41[3] = &unk_264579378;
      objc_copyWeak(&v42, &location);
      v41[4] = &v44;
      uint64_t v24 = [v23 newURLSessionItemWithRequest:v8 identifier:v9 completionHandler:v41];
      id v25 = (void *)v45[5];
      v45[5] = v24;

      int64_t dataType = self->_dataType;
      id v27 = [(id)v45[5] sessionTask];
      [v27 setDataType:dataType];

      id v28 = [(id)v45[5] sessionTask];
      LODWORD(v29) = *MEMORY[0x263F085C8];
      [v28 setPriority:v29];

      [v23 resumeSessionItem:v45[5]];
      dataCacheSerialQueue = self->_dataCacheSerialQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_4;
      block[3] = &unk_2645793A0;
      objc_copyWeak(&v40, &location);
      void block[4] = &v44;
      dispatch_sync(dataCacheSerialQueue, block);
      objc_destroyWeak(&v40);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v44, 8);

      uint64_t v14 = 0;
    }
    else
    {
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_2;
      v50[3] = &unk_264579350;
      id v51 = v37;
      uint64_t v14 = (void *)[v23 newURLSessionItemWithRequest:v8 identifier:v9 completionHandler:v50];
      int64_t v31 = self->_dataType;
      id v32 = [v14 sessionTask];
      [v32 setDataType:v31];

      float defaultPriority = self->_defaultPriority;
      id v34 = [v14 sessionTask];
      *(float *)&double v35 = defaultPriority;
      [v34 setPriority:v35];

      [v23 resumeSessionItem:v14];
    }
    goto LABEL_26;
  }
  if ((v12 & 1) == 0)
  {
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_36;
    v52[3] = &unk_264579328;
    id v53 = v10;
    [(HLPDataCacheController *)self formattedDataWithFileURL:v11 completionHandler:v52];
    uint64_t v14 = 0;
    uint64_t v23 = v53;
LABEL_26:

    goto LABEL_27;
  }
LABEL_21:
  uint64_t v14 = 0;
LABEL_27:
  _Block_object_dispose(&v60, 8);
  id v10 = v37;
LABEL_28:

  return v14;
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = [*(id *)(a1 + 32) lastModified];
    (*(void (**)(uint64_t, id, id, uint64_t, void *, void))(v7 + 16))(v7, v5, v6, 1, v8, 0);

    id v9 = HLPLogForCategory(2uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_220BD8000, v9, OS_LOG_TYPE_DEFAULT, "Data cache exists for %@", (uint8_t *)&v14, 0xCu);
    }

    if ([*(id *)(a1 + 32) expired])
    {
      uint64_t v11 = HLPLogForCategory(2uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_cold_1(a1, (id *)(a1 + 32), v11);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 48) removeDataCache:*(void *)(a1 + 32)];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"Invalid data cache" code:-1 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v12 + 16))(v12, 0, 0, 0, 0, v13);
  }
}

uint64_t __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained originFetchItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained originFetchItems];
  [v2 addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)formattedDataForPath:(id)a3 identifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && (uint64_t v11 = (void *)MEMORY[0x263F08BD8],
        [NSURL URLWithString:v8],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v11 requestWithURL:v12],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        v12,
        v13))
  {
    int v14 = [(HLPDataCacheController *)self formattedDataForRequest:v13 identifier:v9 completionHandler:v10];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:@"Invalid request" code:-1 userInfo:0];
    (*((void (**)(id, void, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, 0, v13);
    int v14 = 0;
  }

  return v14;
}

- (BOOL)isURLValid:(id)a3
{
  return a3 != 0;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)formattedDataWithFileURL:(id)a3
{
  id v3 = a3;
  return v3;
}

- (float)defaultPriority
{
  return self->_defaultPriority;
}

- (void)setDefaultPriority:(float)a3
{
  self->_float defaultPriority = a3;
}

- (BOOL)backgroundOriginUpdate
{
  return self->_backgroundOriginUpdate;
}

- (void)setBackgroundOriginUpdate:(BOOL)a3
{
  self->_backgroundOriginUpdate = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSMutableArray)dataCacheArray
{
  return self->_dataCacheArray;
}

- (void)setDataCacheArray:(id)a3
{
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (unint64_t)maxDataCacheSize
{
  return self->_maxDataCacheSize;
}

- (void)setMaxDataCacheSize:(unint64_t)a3
{
  self->_unint64_t maxDataCacheSize = a3;
}

- (BOOL)dataCacheDirty
{
  return self->_dataCacheDirty;
}

- (void)setDataCacheDirty:(BOOL)a3
{
  self->_dataCacheDirty = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSMutableDictionary)dataCacheMap
{
  return self->_dataCacheMap;
}

- (void)setDataCacheMap:(id)a3
{
}

- (NSString)cacheDirectory
{
  return self->_cacheDirectory;
}

- (void)setCacheDirectory:(id)a3
{
}

- (NSMutableArray)originFetchItems
{
  return self->_originFetchItems;
}

- (void)setOriginFetchItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originFetchItems, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
  objc_storeStrong((id *)&self->_dataCacheMap, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dataCacheArray, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_dataCacheSerialQueue, 0);
}

void __42__HLPDataCacheController_updateCacheDelay__block_invoke_2_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1);
  id v6 = [WeakRetained dataCacheArray];
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_220BD8000, a3, OS_LOG_TYPE_ERROR, "Unable to archive %@, error: %@", (uint8_t *)&v7, 0x16u);
}

void __79__HLPDataCacheController_formattedDataForRequest_identifier_completionHandler___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*a2 updatedDate];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_debug_impl(&dword_220BD8000, a3, OS_LOG_TYPE_DEBUG, "Data cache expired for %@.  Last update on %@", (uint8_t *)&v6, 0x16u);
}

@end