@interface DOCIconService
+ (DOCIconService)shared;
+ (id)DOCLocalProviderIcon;
+ (id)SFSymbolImageProviderIcon:(id)a3;
+ (id)_symbolImageDefaultConfiguration;
- (DOCIconService)init;
- (id)_fetchIconFromDiskCacheForProviderID:(id)a3 size:(int64_t)a4;
- (id)_fetchIconFromIconService:(id)a3 size:(int64_t)a4 triggerDiskUpdate:(BOOL)a5;
- (id)_urlForCacheSize:(int64_t)a3;
- (id)_urlForCacheSize:(int64_t)a3 providerBundleID:(id)a4;
- (id)iconForFileProvider:(id)a3 size:(int64_t)a4;
- (void)_loadIconsFromDiskForSize:(int64_t)a3 fileManager:(id)a4;
- (void)_persistCacheForSize:(int64_t)a3 bundles:(id)a4 fileManager:(id)a5;
- (void)_persistIconsOnDisk;
- (void)_updateFileProvidersIcon:(id)a3 skipSize:(int64_t)a4;
- (void)loadIconsFromDiskIfNeeded;
- (void)updateFileProvidersIcon:(id)a3;
@end

@implementation DOCIconService

- (void)_loadIconsFromDiskForSize:(int64_t)a3 fileManager:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v44 = a4;
  if (a3 >= 2)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DOCIconService.m", 168, @"Invalid cache size provided: %ld", a3);
  }
  int64_t v47 = a3;
  v45 = [(DOCIconService *)self _urlForCacheSize:a3];
  if (v45)
  {
    v7 = [v44 enumeratorAtURL:v45 includingPropertiesForKeys:0 options:1 errorHandler:0];
    v46 = objc_opt_new();
    v8 = self;
    objc_sync_enter(v8);
    id v9 = objc_alloc(MEMORY[0x263EFFA08]);
    documentSourceIconCache = v8->_documentSourceIconCache;
    v11 = [NSNumber numberWithInteger:v47];
    v12 = [(NSDictionary *)documentSourceIconCache objectForKeyedSubscript:v11];
    v13 = [v12 allKeys];
    v14 = (void *)[v9 initWithArray:v13];

    objc_sync_exit(v8);
    v43 = v8;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v7;
    uint64_t v15 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x21668E1E0]();
          v20 = [v18 lastPathComponent];
          if ([v14 containsObject:v20])
          {
            v21 = *MEMORY[0x263F3AC88];
            if (!*MEMORY[0x263F3AC88])
            {
              DOCInitLogging();
              v21 = *MEMORY[0x263F3AC88];
            }
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = NSString;
              v23 = NSNumber;
              v24 = v21;
              v25 = [v23 numberWithInteger:v47];
              id v26 = [v22 stringWithFormat:@"[Load-All-Disk] skipping: (%@, size: %@)", v20, v25];
              uint64_t v27 = [v26 UTF8String];
              *(_DWORD *)buf = 136315138;
              uint64_t v54 = v27;
              _os_log_impl(&dword_21361D000, v24, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
            }
          }
          else
          {
            v28 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v18];
            v29 = *MEMORY[0x263F3AC88];
            if (!*MEMORY[0x263F3AC88])
            {
              DOCInitLogging();
              v29 = *MEMORY[0x263F3AC88];
            }
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = NSString;
              v31 = NSNumber;
              v32 = v29;
              v33 = [v31 numberWithInteger:v47];
              id v34 = [v30 stringWithFormat:@"[Load-All-Disk] loading: (%@, size: %@)", v20, v33];
              uint64_t v35 = [v34 UTF8String];
              *(_DWORD *)buf = 136315138;
              uint64_t v54 = v35;
              _os_log_impl(&dword_21361D000, v32, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
            }
            if (v28 && [v28 length]) {
              [v46 setObject:v28 forKeyedSubscript:v20];
            }
          }
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v15);
    }

    v36 = v43;
    objc_sync_enter(v36);
    v37 = v43->_documentSourceIconCache;
    v38 = [NSNumber numberWithInteger:v47];
    v39 = [(NSDictionary *)v37 objectForKeyedSubscript:v38];
    [v39 addEntriesFromDictionary:v46];

    objc_sync_exit(v36);
  }
  else
  {
    v40 = (NSObject **)MEMORY[0x263F3AC28];
    v41 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      v41 = *v40;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[DOCIconService _loadIconsFromDiskForSize:fileManager:](a3, v41);
    }
  }
}

- (id)_urlForCacheSize:(int64_t)a3
{
  if (a3 == 2)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DOCIconService.m", 159, @"[DOCIconServcie _urlForCacheSize:] received invalid or unknown DOCDocumentSourceIconSize value: %d", 2);

    v6 = 0;
  }
  else
  {
    v4 = @"small";
    if (a3) {
      v4 = 0;
    }
    if (a3 == 1) {
      v5 = @"large";
    }
    else {
      v5 = v4;
    }
    v6 = [(NSURL *)self->_cacheFolderURL URLByAppendingPathComponent:v5];
  }
  return v6;
}

void __43__DOCIconService_loadIconsFromDiskIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v2 = (unsigned __int8 *)WeakRetained;
    objc_sync_enter(v2);
    int v3 = v2[48];
    v2[48] = 1;
    objc_sync_exit(v2);

    id WeakRetained = v5;
    if (!v3)
    {
      v4 = objc_opt_new();
      [v2 _loadIconsFromDiskForSize:0 fileManager:v4];
      [v2 _loadIconsFromDiskForSize:1 fileManager:v4];

      id WeakRetained = v5;
    }
  }
}

uint64_t __24__DOCIconService_shared__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = shared__shared;
  shared__shared = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (DOCIconService)init
{
  v23.receiver = self;
  v23.super_class = (Class)DOCIconService;
  v2 = [(DOCIconService *)&v23 init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.DocumentManager.DOCIconService.ioQueue", v4);
    ioQueue = v2->_ioQueue;
    v2->_ioQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [v7 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.DocumentManager"];
    uint64_t v9 = [v8 URLByAppendingPathComponent:@"IconService"];
    cacheFolderURL = v2->_cacheFolderURL;
    v2->_cacheFolderURL = (NSURL *)v9;

    v11 = (NSDictionary *)objc_opt_new();
    v12 = objc_opt_new();
    v13 = [NSNumber numberWithInt:0];
    [(NSDictionary *)v11 setObject:v12 forKeyedSubscript:v13];

    v14 = objc_opt_new();
    uint64_t v15 = [NSNumber numberWithInt:1];
    [(NSDictionary *)v11 setObject:v14 forKeyedSubscript:v15];

    documentSourceIconCache = v2->_documentSourceIconCache;
    v2->_documentSourceIconCache = v11;
    v17 = v11;

    uint64_t v18 = objc_opt_new();
    updatedProviderDomains = v2->_updatedProviderDomains;
    v2->_updatedProviderDomains = (NSMutableSet *)v18;

    uint64_t v20 = objc_opt_new();
    providersToPersist = v2->_providersToPersist;
    v2->_providersToPersist = (NSMutableSet *)v20;
  }
  return v2;
}

+ (DOCIconService)shared
{
  if (shared_onceToken_1 != -1) {
    dispatch_once(&shared_onceToken_1, &__block_literal_global_10);
  }
  v2 = (void *)shared__shared;
  return (DOCIconService *)v2;
}

- (void)loadIconsFromDiskIfNeeded
{
  objc_initWeak(&location, self);
  ioQueue = self->_ioQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__DOCIconService_loadIconsFromDiskIfNeeded__block_invoke;
  v4[3] = &unk_2641B18E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(ioQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (id)_symbolImageDefaultConfiguration
{
  return (id)[MEMORY[0x263F82818] configurationWithScale:3];
}

+ (id)DOCLocalProviderIcon
{
  v2 = [a1 _symbolImageDefaultConfiguration];
  int v3 = (void *)MEMORY[0x263F827E8];
  v4 = [MEMORY[0x263F82670] currentDevice];
  id v5 = objc_msgSend(v4, "doc_symbolName");
  v6 = [v3 _systemImageNamed:v5 withConfiguration:v2];

  return v6;
}

+ (id)SFSymbolImageProviderIcon:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  if (SFSymbolImageProviderIcon__onceToken != -1) {
    dispatch_once(&SFSymbolImageProviderIcon__onceToken, &__block_literal_global_14);
  }
  id v5 = (id)SFSymbolImageProviderIcon__cachedImageByDomainID;
  objc_sync_enter(v5);
  v6 = [(id)SFSymbolImageProviderIcon__cachedImageByDomainID objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  if (!v6)
  {
    v7 = [v3 extensionBundleURL];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithURL:v7];
    uint64_t v9 = [v7 URLByAppendingPathComponent:@"Info.plist"];
    v10 = [NSDictionary dictionaryWithContentsOfURL:v9];
    v11 = [v10 valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleSymbolName"];
    uint64_t v16 = (void *)v8;
    if (v11)
    {
      v6 = [MEMORY[0x263F827E8] imageNamed:v11 inBundle:v8];
      if (!v6)
      {
        v6 = [MEMORY[0x263F827E8] systemImageNamed:v11];
      }
    }
    else
    {
      v6 = 0;
    }
    id v12 = (id)SFSymbolImageProviderIcon__cachedImageByDomainID;
    objc_sync_enter(v12);
    v13 = v6;
    if (!v6)
    {
      v13 = [MEMORY[0x263EFF9D0] null];
    }
    [(id)SFSymbolImageProviderIcon__cachedImageByDomainID setObject:v13 forKeyedSubscript:v4];
    if (!v6) {

    }
    objc_sync_exit(v12);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v6;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

uint64_t __44__DOCIconService_SFSymbolImageProviderIcon___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = SFSymbolImageProviderIcon__cachedImageByDomainID;
  SFSymbolImageProviderIcon__cachedImageByDomainID = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_urlForCacheSize:(int64_t)a3 providerBundleID:(id)a4
{
  id v6 = a4;
  v7 = [(DOCIconService *)self _urlForCacheSize:a3];
  uint64_t v8 = [v7 URLByAppendingPathComponent:v6];

  return v8;
}

- (void)_persistCacheForSize:(int64_t)a3 bundles:(id)a4 fileManager:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v41 = a4;
  id v42 = a5;
  if (a3 >= 2)
  {
    v40 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DOCIconService.m", 233, @"Invalid cache size provided: %ld", a3);
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  documentSourceIconCache = v9->_documentSourceIconCache;
  uint64_t v11 = [NSNumber numberWithInteger:a3];
  id v12 = [(NSDictionary *)documentSourceIconCache objectForKeyedSubscript:v11];
  v45 = (void *)[v12 copy];

  objc_sync_exit(v9);
  int64_t v43 = a3;
  v46 = [(DOCIconService *)v9 _urlForCacheSize:a3];
  id v53 = 0;
  LOBYTE(v11) = [v42 createDirectoryAtURL:v46 withIntermediateDirectories:1 attributes:0 error:&v53];
  id v13 = v53;
  if (v11)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v41;
    uint64_t v14 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (!v14) {
      goto LABEL_33;
    }
    uint64_t v15 = *(void *)v50;
    while (1)
    {
      uint64_t v16 = 0;
      v17 = v13;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8 * v16);
        v19 = (void *)MEMORY[0x21668E1E0]();
        uint64_t v20 = *MEMORY[0x263F3AC88];
        if (!*MEMORY[0x263F3AC88])
        {
          DOCInitLogging();
          uint64_t v20 = *MEMORY[0x263F3AC88];
        }
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = NSString;
          v22 = NSNumber;
          objc_super v23 = v20;
          v24 = [v22 numberWithInteger:v43];
          id v25 = [v21 stringWithFormat:@"[SaveToDisk] saving (%@, size: %@)", v18, v24];
          uint64_t v26 = [v25 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v55 = v26;
          _os_log_impl(&dword_21361D000, v23, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
        }
        uint64_t v27 = [v45 objectForKeyedSubscript:v18];
        v28 = [v46 URLByAppendingPathComponent:v18];
        if ([v27 length])
        {
          id v48 = v17;
          char v29 = [v27 writeToURL:v28 options:0 error:&v48];
          id v13 = v48;

          if (v29)
          {
            uint64_t v47 = 66565;
            int v30 = fsctl((const char *)[v28 fileSystemRepresentation], 0xC0084A44uLL, &v47, 0);
            if (v30)
            {
              v31 = *MEMORY[0x263F3AC28];
              if (!*MEMORY[0x263F3AC28])
              {
                DOCInitLogging();
                v31 = *MEMORY[0x263F3AC28];
              }
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v55 = (uint64_t)v46;
                __int16 v56 = 1024;
                LODWORD(v57) = v30;
                v32 = v31;
                v33 = "Unable to make '%@' purgeable: %d";
                uint32_t v34 = 18;
LABEL_31:
                _os_log_error_impl(&dword_21361D000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
              }
            }
          }
          else
          {
            v36 = *MEMORY[0x263F3AC28];
            if (!*MEMORY[0x263F3AC28])
            {
              DOCInitLogging();
              v36 = *MEMORY[0x263F3AC28];
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v55 = (uint64_t)v28;
              __int16 v56 = 2112;
              id v57 = v13;
              v32 = v36;
              v33 = "Unable to cache '%@': %@";
              uint32_t v34 = 22;
              goto LABEL_31;
            }
          }
        }
        else
        {
          uint64_t v35 = *MEMORY[0x263F3AC28];
          if (!*MEMORY[0x263F3AC28])
          {
            DOCInitLogging();
            uint64_t v35 = *MEMORY[0x263F3AC28];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v55 = (uint64_t)v28;
            __int16 v56 = 2112;
            id v57 = v17;
            _os_log_error_impl(&dword_21361D000, v35, OS_LOG_TYPE_ERROR, "Skipping (data length is 0) write to disk cache '%@': %@", buf, 0x16u);
          }
          id v13 = v17;
        }

        ++v16;
        v17 = v13;
      }
      while (v14 != v16);
      uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
      uint64_t v14 = v37;
      if (!v37)
      {
LABEL_33:

        goto LABEL_38;
      }
    }
  }
  v38 = (NSObject **)MEMORY[0x263F3AC28];
  v39 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    v39 = *v38;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    -[DOCIconService _persistCacheForSize:bundles:fileManager:]((uint64_t)v46, (uint64_t)v13, v39);
  }
LABEL_38:
}

- (void)_persistIconsOnDisk
{
  objc_initWeak(&location, self);
  ioQueue = self->_ioQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__DOCIconService__persistIconsOnDisk__block_invoke;
  v4[3] = &unk_2641B18E8;
  objc_copyWeak(&v5, &location);
  dispatch_async(ioQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__DOCIconService__persistIconsOnDisk__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    v2 = (id *)WeakRetained;
    objc_sync_enter(v2);
    id v3 = (void *)[v2[7] copy];
    [v2[7] removeAllObjects];
    objc_sync_exit(v2);

    v4 = objc_opt_new();
    id v5 = (void *)MEMORY[0x21668E1E0]();
    [v2 _persistCacheForSize:0 bundles:v3 fileManager:v4];
    id v6 = (void *)MEMORY[0x21668E1E0]();
    [v2 _persistCacheForSize:1 bundles:v3 fileManager:v4];

    id WeakRetained = v7;
  }
}

- (id)_fetchIconFromDiskCacheForProviderID:(id)a3 size:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(DOCIconService *)self _urlForCacheSize:a4 providerBundleID:v6];
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7];
  uint64_t v9 = v8;
  if (!v8)
  {
    v21 = (NSObject **)MEMORY[0x263F3AC88];
    v22 = *MEMORY[0x263F3AC88];
    if (!*MEMORY[0x263F3AC88])
    {
      DOCInitLogging();
      v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v23 = NSString;
      v24 = NSNumber;
      id v25 = v22;
      uint64_t v26 = [v24 numberWithInteger:a4];
      id v27 = [v23 stringWithFormat:@"[Load-One-DISK] did not find in disk cache: (%@, size: %@)", v6, v26];
      *(_DWORD *)buf = 136315138;
      uint64_t v33 = [v27 UTF8String];
      _os_log_impl(&dword_21361D000, v25, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (![v8 length])
  {

    v28 = (NSObject **)MEMORY[0x263F3AC88];
    char v29 = *MEMORY[0x263F3AC88];
    if (!*MEMORY[0x263F3AC88])
    {
      DOCInitLogging();
      char v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[DOCIconService _fetchIconFromDiskCacheForProviderID:size:](v29, a4, (uint64_t)v6);
    }
    int v30 = [MEMORY[0x263F08850] defaultManager];
    [v30 removeItemAtURL:v7 error:0];

LABEL_17:
    uint64_t v9 = 0;
    goto LABEL_18;
  }
  v10 = (NSObject **)MEMORY[0x263F3AC88];
  uint64_t v11 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    uint64_t v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSString;
    id v13 = NSNumber;
    uint64_t v14 = v11;
    uint64_t v15 = [v13 numberWithInteger:a4];
    id v16 = [v12 stringWithFormat:@"[Load-One-DISK] loaded from disk cache: (%@, size: %@)", v6, v15];
    *(_DWORD *)buf = 136315138;
    uint64_t v33 = [v16 UTF8String];
    _os_log_impl(&dword_21361D000, v14, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
  }
  v17 = self;
  objc_sync_enter(v17);
  documentSourceIconCache = v17->_documentSourceIconCache;
  v19 = [NSNumber numberWithInteger:a4];
  uint64_t v20 = [(NSDictionary *)documentSourceIconCache objectForKeyedSubscript:v19];
  [v20 setObject:v9 forKeyedSubscript:v6];

  objc_sync_exit(v17);
LABEL_18:

  return v9;
}

- (id)_fetchIconFromIconService:(id)a3 size:(int64_t)a4 triggerDiskUpdate:(BOOL)a5
{
  BOOL v32 = a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a4 >= 2)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DOCIconService.m", 322, @"Invalid cache size provided: %ld", a4);
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:v8];
  if (v9)
  {
    if (a4) {
      goto LABEL_5;
    }
LABEL_9:
    uint64_t v11 = (void *)MEMORY[0x263F4B5A0];
    goto LABEL_10;
  }
  uint64_t v9 = [MEMORY[0x263F4B540] genericApplicationIcon];
  if (!a4) {
    goto LABEL_9;
  }
LABEL_5:
  v10 = 0;
  if (a4 == 2)
  {
    id v34 = 0;
    goto LABEL_21;
  }
  if (a4 == 1)
  {
    uint64_t v11 = (void *)MEMORY[0x263F4B578];
LABEL_10:
    v10 = [MEMORY[0x263F4B558] imageDescriptorNamed:*v11];
  }
  [v10 setDrawBorder:1];
  uint64_t v33 = [v9 prepareImageForDescriptor:v10];
  id v34 = [v33 bitmapData];
  id v12 = (NSObject **)MEMORY[0x263F3AC88];
  id v13 = *MEMORY[0x263F3AC88];
  if (!*MEMORY[0x263F3AC88])
  {
    DOCInitLogging();
    id v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSString;
    uint64_t v15 = NSNumber;
    id v16 = v13;
    v17 = [v15 numberWithInteger:a4];
    id v18 = [v14 stringWithFormat:@"[Load-One-XPC] loading: (%@, size: %@)", v8, v17];
    *(_DWORD *)buf = 136315138;
    uint64_t v38 = [v18 UTF8String];
    _os_log_impl(&dword_21361D000, v16, OS_LOG_TYPE_DEFAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
  }
  v19 = self;
  objc_sync_enter(v19);
  documentSourceIconCache = v19->_documentSourceIconCache;
  v21 = [NSNumber numberWithInteger:a4];
  v22 = [(NSDictionary *)documentSourceIconCache objectForKeyedSubscript:v21];
  [v22 setObject:v34 forKeyedSubscript:v8];

  objc_sync_exit(v19);
  if (v32)
  {
    dispatch_time_t v23 = dispatch_time(0, 60000000000);
    v24 = v19;
    objc_sync_enter(v24);
    ioTimer = v24->_ioTimer;
    if (ioTimer)
    {
      dispatch_source_cancel(ioTimer);
      uint64_t v26 = v24->_ioTimer;
      v24->_ioTimer = 0;
    }
    [(NSMutableSet *)v24->_providersToPersist addObject:v8];
    dispatch_source_t v27 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v24->_ioQueue);
    v28 = v24->_ioTimer;
    v24->_ioTimer = (OS_dispatch_source *)v27;

    objc_sync_exit(v24);
    objc_initWeak((id *)buf, v24);
    char v29 = v24->_ioTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __67__DOCIconService__fetchIconFromIconService_size_triggerDiskUpdate___block_invoke;
    handler[3] = &unk_2641B18E8;
    objc_copyWeak(&v36, (id *)buf);
    dispatch_source_set_event_handler(v29, handler);
    dispatch_source_set_timer((dispatch_source_t)v24->_ioTimer, v23, 0xFFFFFFFFFFFFFFFFLL, 0xDF8475800uLL);
    dispatch_resume((dispatch_object_t)v24->_ioTimer);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
  }

LABEL_21:
  return v34;
}

void __67__DOCIconService__fetchIconFromIconService_size_triggerDiskUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = (dispatch_source_t *)WeakRetained;
    objc_sync_enter(v2);
    dispatch_source_cancel(v2[4]);
    dispatch_source_t v3 = v2[4];
    v2[4] = 0;

    objc_sync_exit(v2);
    [(dispatch_source_t *)v2 _persistIconsOnDisk];
    id WeakRetained = v4;
  }
}

- (void)_updateFileProvidersIcon:(id)a3 skipSize:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = *MEMORY[0x263F3AB38];
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v7) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = [v10 identifier];
      char v12 = [v11 isEqualToString:v8];

      if (v12) {
        break;
      }
      objc_initWeak(&location, self);
      ioQueue = self->_ioQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__DOCIconService__updateFileProvidersIcon_skipSize___block_invoke;
      block[3] = &unk_2641B2560;
      objc_copyWeak(v17, &location);
      v17[1] = (id)a4;
      block[4] = v10;
      dispatch_async(ioQueue, block);
      objc_destroyWeak(v17);
      objc_destroyWeak(&location);
      if (v6 == ++v9)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void __52__DOCIconService__updateFileProvidersIcon_skipSize___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = 0;
    char v3 = 1;
    do
    {
      char v4 = v3;
      if (*(void *)(a1 + 48) != v2)
      {
        uint64_t v5 = [*(id *)(a1 + 32) extensionBundleIdentifier];
        id v6 = (id)[WeakRetained _fetchIconFromIconService:v5 size:v2 triggerDiskUpdate:1];
      }
      char v3 = 0;
      uint64_t v2 = 1;
    }
    while ((v4 & 1) != 0);
    uint64_t v7 = WeakRetained;
    objc_sync_enter(v7);
    uint64_t v8 = (void *)v7[5];
    uint64_t v9 = [*(id *)(a1 + 32) extensionBundleIdentifier];
    [v8 addObject:v9];

    objc_sync_exit(v7);
  }
}

- (void)updateFileProvidersIcon:(id)a3
{
}

- (id)iconForFileProvider:(id)a3 size:(int64_t)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(DOCIconService *)self loadIconsFromDiskIfNeeded];
  uint64_t v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F3AB38]];

  if (v8)
  {
    id v9 = +[DOCIconService DOCLocalProviderIcon];
  }
  else
  {
    v10 = +[DOCIconService SFSymbolImageProviderIcon:v6];
    uint64_t v11 = [(id)objc_opt_class() _symbolImageDefaultConfiguration];
    id v9 = [v10 imageWithConfiguration:v11];

    if (!v9)
    {
      if (a4 < 2)
      {
        uint64_t v14 = [v6 extensionBundleIdentifier];
        uint64_t v15 = self;
        objc_sync_enter(v15);
        documentSourceIconCache = v15->_documentSourceIconCache;
        v17 = [NSNumber numberWithInteger:a4];
        id v18 = [(NSDictionary *)documentSourceIconCache objectForKeyedSubscript:v17];
        long long v19 = [v18 objectForKeyedSubscript:v14];

        int v20 = [(NSMutableSet *)v15->_updatedProviderDomains containsObject:v14];
        if ((v20 & 1) == 0) {
          [(NSMutableSet *)v15->_updatedProviderDomains addObject:v14];
        }
        objc_sync_exit(v15);

        if (v19
          || ([(DOCIconService *)v15 _fetchIconFromDiskCacheForProviderID:v14 size:a4], (long long v19 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          int v21 = 0;
          a4 = 2;
        }
        else
        {
          long long v19 = [(DOCIconService *)v15 _fetchIconFromIconService:v14 size:a4 triggerDiskUpdate:0];
          int v21 = 1;
        }
        long long v22 = (void *)[objc_alloc(MEMORY[0x263F4B528]) initWithData:v19 uuid:0];
        dispatch_time_t v23 = [MEMORY[0x263F82B60] mainScreen];
        uint64_t v24 = [v23 traitCollection];
        [v24 displayScale];
        double v26 = v25;

        dispatch_source_t v27 = objc_msgSend(MEMORY[0x263F827E8], "imageWithCGImage:scale:orientation:", objc_msgSend(v22, "CGImage"), 0, v26);
        if ((v21 | v20 ^ 1) == 1)
        {
          v30[0] = v6;
          v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
          [(DOCIconService *)v15 _updateFileProvidersIcon:v28 skipSize:a4];
        }
        id v9 = v27;
      }
      else
      {
        char v12 = (NSObject **)MEMORY[0x263F3AC28];
        id v13 = *MEMORY[0x263F3AC28];
        if (!*MEMORY[0x263F3AC28])
        {
          DOCInitLogging();
          id v13 = *v12;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[DOCIconService iconForFileProvider:size:](a4, v13);
        }
        id v9 = 0;
      }
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providersToPersist, 0);
  objc_storeStrong((id *)&self->_updatedProviderDomains, 0);
  objc_storeStrong((id *)&self->_ioTimer, 0);
  objc_storeStrong((id *)&self->_ioQueue, 0);
  objc_storeStrong((id *)&self->_cacheFolderURL, 0);
  objc_storeStrong((id *)&self->_documentSourceIconCache, 0);
}

- (void)_loadIconsFromDiskForSize:(uint64_t)a1 fileManager:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Could not get url for cache size: %ld", (uint8_t *)&v2, 0xCu);
}

- (void)_persistCacheForSize:(uint64_t)a1 bundles:(uint64_t)a2 fileManager:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21361D000, log, OS_LOG_TYPE_ERROR, "Unable to create cache folder '%@': %@", (uint8_t *)&v3, 0x16u);
}

- (void)_fetchIconFromDiskCacheForProviderID:(uint64_t)a3 size:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __int16 v5 = NSString;
  uint64_t v6 = NSNumber;
  uint64_t v7 = a1;
  int v8 = [v6 numberWithInteger:a2];
  [v5 stringWithFormat:@"[Load-One-DISK] encountered bad disk cache data (length = 0), deleting... (%@, size: %@)", a3, v8];
  id v9 = objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136315138;
  uint64_t v11 = [v9 UTF8String];
  _os_log_fault_impl(&dword_21361D000, v7, OS_LOG_TYPE_FAULT, "[DOCIconServiceLog] %s\n", buf, 0xCu);
}

- (void)iconForFileProvider:(uint64_t)a1 size:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21361D000, a2, OS_LOG_TYPE_ERROR, "Invalid size was requested for icon: %ld", (uint8_t *)&v2, 0xCu);
}

@end