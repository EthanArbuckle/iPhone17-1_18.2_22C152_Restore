@interface _ASPasswordManagerIconController
+ (CGSize)_minimumIconSize;
+ (CGSize)_preferredIconSize;
+ (CGSize)tableViewIconSize;
- (_ASPasswordManagerIconController)init;
- (_ASPasswordManagerIconController)initWithMetadataManager:(id)a3;
- (_ASPasswordManagerIconControllerDelegate)delegate;
- (id)_mobileSafariContainerPath;
- (id)appIconForBundleID:(id)a3;
- (id)backgroundColorForDomain:(id)a3;
- (id)cachedIconForDomain:(id)a3 resizedToSize:(CGSize)a4;
- (id)iconForDomain:(id)a3;
- (id)iconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5;
- (void)_checkForLocalVisitToDomain:(id)a3 withCompletion:(id)a4;
- (void)_fetchAppIconForDomain:(id)a3 responseHandler:(id)a4;
- (void)_fetchHistory;
- (void)_fetchIconInHistoryWithBlock:(id)a3;
- (void)_fetchTouchIconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5;
- (void)_handleIconFetchFailureWithDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 response:(id)a6 responseHandler:(id)a7;
- (void)_iconDidUpdateForDomain:(id)a3;
- (void)_populateDomainToAppIDWithCompletion:(id)a3;
- (void)_privacyProxyStateInitialized;
- (void)_requestTouchIconForDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 responseHandler:(id)a6;
- (void)cancelRequest:(id)a3;
- (void)clearIconFetchingState;
- (void)dealloc;
- (void)init;
- (void)performMaintenanceWork;
- (void)prepareForApplicationTermination;
- (void)setDelegate:(id)a3;
@end

@implementation _ASPasswordManagerIconController

- (_ASPasswordManagerIconController)init
{
  v2 = self;
  v3 = [(_ASPasswordManagerIconController *)self _mobileSafariContainerPath];
  v4 = [v3 stringByAppendingPathComponent:@"Library/Image Cache"];

  if ([v4 length])
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v5 = (void *)get_SFSiteMetadataManagerClass_softClass;
    uint64_t v18 = get_SFSiteMetadataManagerClass_softClass;
    if (!get_SFSiteMetadataManagerClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __get_SFSiteMetadataManagerClass_block_invoke;
      v14[3] = &unk_2643956C0;
      v14[4] = &v15;
      __get_SFSiteMetadataManagerClass_block_invoke((uint64_t)v14);
      v5 = (void *)v16[3];
    }
    v6 = v5;
    _Block_object_dispose(&v15, 8);
    id v7 = [v6 alloc];
    v8 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariInjectedBundleURL");
    v9 = [NSURL fileURLWithPath:v4 isDirectory:1];
    v10 = (void *)[v7 initWithInjectedBundleURL:v8 imageCacheDirectoryURL:v9 cacheIsReadOnly:1 metadataType:4];

    v2 = [(_ASPasswordManagerIconController *)v2 initWithMetadataManager:v10];
    v11 = v2;
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_ASPasswordManagerIconController init](v12);
    }
    v11 = 0;
  }

  return v11;
}

- (_ASPasswordManagerIconController)initWithMetadataManager:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_ASPasswordManagerIconController;
  v6 = [(_ASPasswordManagerIconController *)&v43 init];
  if (v6)
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    id v7 = (void *)getWBSCacheClass_softClass;
    uint64_t v52 = getWBSCacheClass_softClass;
    if (!getWBSCacheClass_softClass)
    {
      uint64_t v44 = MEMORY[0x263EF8330];
      uint64_t v45 = 3221225472;
      v46 = __getWBSCacheClass_block_invoke;
      v47 = &unk_2643956C0;
      v48 = &v49;
      __getWBSCacheClass_block_invoke((uint64_t)&v44);
      id v7 = (void *)v50[3];
    }
    v8 = v7;
    _Block_object_dispose(&v49, 8);
    v9 = (WBSCache *)objc_alloc_init(v8);
    iconCache = v6->_iconCache;
    v6->_iconCache = v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    domainsToExtractedBackgroundColors = v6->_domainsToExtractedBackgroundColors;
    v6->_domainsToExtractedBackgroundColors = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    activeRequestIDToRequestToken = v6->_activeRequestIDToRequestToken;
    v6->_activeRequestIDToRequestToken = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x263EFF9C0] set];
    touchIconRequests = v6->_touchIconRequests;
    v6->_touchIconRequests = (NSMutableSet *)v15;

    uint64_t v17 = [MEMORY[0x263EFF9C0] set];
    domainsThatHaveRequestedIcon = v6->_domainsThatHaveRequestedIcon;
    v6->_domainsThatHaveRequestedIcon = (NSMutableSet *)v17;

    v19 = NSString;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    id v22 = [v19 stringWithFormat:@"com.apple.SafariServices.%@.%p", v21, v6];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v6->_metadataManager, a3);
    id v25 = objc_alloc(MEMORY[0x263F66278]);
    v26 = objc_msgSend(MEMORY[0x263F086E0], "safari_safariCoreBundle");
    v27 = [v26 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    v28 = [MEMORY[0x263F08850] defaultManager];
    v29 = objc_msgSend(v28, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v30 = [v25 initWithBuiltInQuirksURL:v27 downloadsDirectoryURL:v29 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:*MEMORY[0x263F66508] updateInterval:0.0];
    autoFillQuirksManager = v6->_autoFillQuirksManager;
    v6->_autoFillQuirksManager = (WBSAutoFillQuirksManager *)v30;

    [(WBSAutoFillQuirksManager *)v6->_autoFillQuirksManager beginLoadingQuirksFromDisk];
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    v32 = (void *)getWBSPrivacyProxyAvailabilityManagerClass_softClass;
    uint64_t v52 = getWBSPrivacyProxyAvailabilityManagerClass_softClass;
    if (!getWBSPrivacyProxyAvailabilityManagerClass_softClass)
    {
      uint64_t v44 = MEMORY[0x263EF8330];
      uint64_t v45 = 3221225472;
      v46 = __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke;
      v47 = &unk_2643956C0;
      v48 = &v49;
      __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke((uint64_t)&v44);
      v32 = (void *)v50[3];
    }
    v33 = v32;
    _Block_object_dispose(&v49, 8);
    v34 = (WBSPrivacyProxyAvailabilityManager *)objc_alloc_init(v33);
    availabilityManager = v6->_availabilityManager;
    v6->_availabilityManager = v34;

    v36 = getWBSPrivacyProxyChangeNotification();

    if (v36)
    {
      v37 = [MEMORY[0x263F08A00] defaultCenter];
      v38 = getWBSPrivacyProxyChangeNotification();
      [v37 addObserver:v6 selector:sel__privacyProxyStateInitialized name:v38 object:v6->_availabilityManager];
    }
    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    domainToNextIconDownloadRetryDate = v6->_domainToNextIconDownloadRetryDate;
    v6->_domainToNextIconDownloadRetryDate = v39;

    v41 = v6;
  }

  return v6;
}

- (void)_privacyProxyStateInitialized
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = getWBSPrivacyProxyChangeNotification();
  if (v3)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:v3 object:0];
  }
  id v5 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    availabilityManager = self->_availabilityManager;
    id v7 = v5;
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [(WBSPrivacyProxyAvailabilityManager *)availabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy];
    _os_log_impl(&dword_21918F000, v7, OS_LOG_TYPE_DEFAULT, "Starting to fetch touch icon; enablePrivateRelay=%{BOOL}d",
      (uint8_t *)&buf,
      8u);
  }
  objc_initWeak(&buf, self);
  if ([(WBSPrivacyProxyAvailabilityManager *)self->_availabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy])
  {
    self->_canEnableIconDownload = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke;
    block[3] = &unk_264395360;
    objc_copyWeak(&v12, &buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v12);
  }
  else
  {
    v9 = self->_queue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __65___ASPasswordManagerIconController__privacyProxyStateInitialized__block_invoke_2;
    v10[3] = &unk_264395388;
    v10[4] = self;
    dispatch_sync(v9, v10);
    [(_ASPasswordManagerIconController *)self _fetchHistory];
  }
  objc_destroyWeak(&buf);
}

- (void)_fetchHistory
{
  v3 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21918F000, v3, OS_LOG_TYPE_DEFAULT, "Starting to fetch history", (uint8_t *)buf, 2u);
  }
  v4 = [getWBUHistoryClass() existingSharedHistory];
  if (!v4)
  {
    v4 = (void *)[objc_alloc((Class)getWBUHistoryClass()) initWithDatabaseID:0];
    [v4 setShouldScheduleMaintenance:0];
    self->_initializedHistory = 1;
  }
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49___ASPasswordManagerIconController__fetchHistory__block_invoke;
  v6[3] = &unk_264395400;
  id v5 = v4;
  id v7 = v5;
  v8 = self;
  objc_copyWeak(&v9, buf);
  [v5 performBlockAfterHistoryHasLoaded:v6];
  objc_destroyWeak(&v9);

  objc_destroyWeak(buf);
}

+ (CGSize)tableViewIconSize
{
  [get_SFAccountManagerAppearanceValuesClass() chicletSize];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

+ (CGSize)_preferredIconSize
{
  double v2 = 64.0;
  double v3 = 64.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)_minimumIconSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)clearIconFetchingState
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___ASPasswordManagerIconController_clearIconFetchingState__block_invoke;
  block[3] = &unk_264395388;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50___ASPasswordManagerIconController_cancelRequest___block_invoke;
  v7[3] = &unk_264395428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)iconForDomain:(id)a3
{
  return [(_ASPasswordManagerIconController *)self iconForDomain:a3 requestID:0 responseHandler:&__block_literal_global];
}

- (id)iconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a5;
  if (![v8 length])
  {
    v10[2](v10, 0);
    id v15 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = [(WBSCache *)self->_iconCache objectForKey:v8];
  id v12 = [MEMORY[0x263EFF9D0] null];
  char v13 = [v11 isEqual:v12];

  if (v13) {
    goto LABEL_8;
  }
  if (!v11)
  {
    *(void *)id buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v29 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76___ASPasswordManagerIconController_iconForDomain_requestID_responseHandler___block_invoke;
    block[3] = &unk_264395470;
    dispatch_queue_t v23 = buf;
    void block[4] = self;
    id v18 = v8;
    id v22 = v18;
    dispatch_sync(queue, block);
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 141558275;
        uint64_t v25 = 1752392040;
        __int16 v26 = 2117;
        id v27 = v18;
        _os_log_impl(&dword_21918F000, v19, OS_LOG_TYPE_DEFAULT, "Touch icon already requested; domain=%{sensitive, mask.hash}@",
          v24,
          0x16u);
      }
    }
    [(_ASPasswordManagerIconController *)self _fetchTouchIconForDomain:v18 requestID:v9 responseHandler:v10];
    id v15 = [(WBSCache *)self->_iconCache objectForKey:v18];

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    v16 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 141558275;
      *(void *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2117;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_21918F000, v16, OS_LOG_TYPE_DEFAULT, "Icon is nil or not an UIImage; domain=%{sensitive, mask.hash}@",
        buf,
        0x16u);
    }
    v10[2](v10, 0);
    id v15 = 0;
  }
  else
  {
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 141558275;
      *(void *)&buf[4] = 1752392040;
      *(_WORD *)&buf[12] = 2117;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_21918F000, v14, OS_LOG_TYPE_DEFAULT, "Account icon found in _ASPasswordManagerIconController's in-memory cache; domain=%{sensitive, mask.hash}@",
        buf,
        0x16u);
    }
    ((void (**)(id, void *))v10)[2](v10, v11);
    id v15 = v11;
  }
LABEL_16:

LABEL_17:

  return v15;
}

- (id)cachedIconForDomain:(id)a3 resizedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = [(WBSCache *)self->_iconCache objectForKey:a3];
  if (v6)
  {
    id v7 = objc_msgSend(getWBSImageUtilitiesClass(), "resizedImage:withSize:", v6, width, height);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)backgroundColorForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___ASPasswordManagerIconController_backgroundColorForDomain___block_invoke;
  block[3] = &unk_264395470;
  char v13 = &v14;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(queue, block);
  id v7 = (void *)v15[5];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [get_SFAccountManagerAppearanceValuesClass() defaultMonogramBackgroundColor];
  }
  id v9 = v8;

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)_iconDidUpdateForDomain:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained iconDidUpdateForDomain:v5 iconController:self];
  }
}

- (id)_mobileSafariContainerPath
{
  if (_mobileSafariContainerPath_onceToken != -1) {
    dispatch_once(&_mobileSafariContainerPath_onceToken, &__block_literal_global_33);
  }
  double v2 = (void *)_mobileSafariContainerPath_mobileSafariContainerPath;

  return v2;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = self->_touchIconRequests;
  id v4 = self->_domainsThatHaveRequestedIcon;
  id v5 = self->_metadataManager;
  if (self->_queue)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)id buf = 134218240;
      id v15 = self;
      __int16 v16 = 1024;
      int v17 = [(NSMutableSet *)v3 count];
      _os_log_impl(&dword_21918F000, v7, OS_LOG_TYPE_DEFAULT, "Deallocating ASPasswordManagerIconController instance %p; cancelling %d pending requests",
        buf,
        0x12u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43___ASPasswordManagerIconController_dealloc__block_invoke;
    block[3] = &unk_2643954B8;
    uint64_t v11 = v5;
    id v12 = v3;
    char v13 = v4;
    dispatch_async(queue, block);
  }
  [(_ASPasswordManagerIconController *)self prepareForApplicationTermination];

  v9.receiver = self;
  v9.super_class = (Class)_ASPasswordManagerIconController;
  [(_ASPasswordManagerIconController *)&v9 dealloc];
}

- (void)performMaintenanceWork
{
}

- (void)prepareForApplicationTermination
{
  [(WBSSiteMetadataManager *)self->_metadataManager savePendingProviderChangesBeforeTermination];
  autoFillQuirksManager = self->_autoFillQuirksManager;

  [(WBSAutoFillQuirksManager *)autoFillQuirksManager prepareForTermination];
}

- (void)_checkForLocalVisitToDomain:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = objc_msgSend(MEMORY[0x263EFFA40], "pm_defaults");
  int v9 = [v8 BOOLForKey:*MEMORY[0x263F66428]];

  if (v9)
  {
    v7[2](v7, 1);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79___ASPasswordManagerIconController__checkForLocalVisitToDomain_withCompletion___block_invoke;
    block[3] = &unk_2643954E0;
    void block[4] = self;
    id v12 = v6;
    char v13 = v7;
    dispatch_async(queue, block);
  }
}

- (void)_fetchTouchIconForDomain:(id)a3 requestID:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke;
  v25[3] = &unk_264395530;
  v25[4] = self;
  id v11 = v8;
  id v26 = v11;
  id v12 = v9;
  id v27 = v12;
  id v13 = v10;
  id v28 = v13;
  uint64_t v14 = (void *)MEMORY[0x21D484070](v25);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87___ASPasswordManagerIconController__fetchTouchIconForDomain_requestID_responseHandler___block_invoke_3;
  block[3] = &unk_264395558;
  void block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(queue, block);
}

- (void)_fetchIconInHistoryWithBlock:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_hasLoadedHistory)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    blocksAwaitingHistoryItems = self->_blocksAwaitingHistoryItems;
    if (blocksAwaitingHistoryItems)
    {
      id v6 = (void *)MEMORY[0x21D484070]();
      [(NSMutableArray *)blocksAwaitingHistoryItems addObject:v6];
    }
    else
    {
      id v7 = (void *)MEMORY[0x263EFF980];
      id v8 = (void *)MEMORY[0x21D484070]();
      id v9 = [v7 arrayWithObject:v8];
      id v10 = self->_blocksAwaitingHistoryItems;
      self->_blocksAwaitingHistoryItems = v9;
    }
  }
}

- (void)_requestTouchIconForDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 length])
  {
    if (objc_msgSend(v10, "safari_looksLikeIPAddress")) {
      id v13 = (void *)(a4 & 0xFFFFFFFFFFFFFFF5);
    }
    else {
      id v13 = (void *)a4;
    }
    objc_initWeak(&location, self);
    queue = self->_queue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97___ASPasswordManagerIconController__requestTouchIconForDomain_options_requestID_responseHandler___block_invoke;
    v15[3] = &unk_264395620;
    objc_copyWeak(v19, &location);
    id v16 = v10;
    v19[1] = v13;
    id v17 = v11;
    id v18 = v12;
    dispatch_async(queue, v15);

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

- (void)_handleIconFetchFailureWithDomain:(id)a3 options:(unint64_t)a4 requestID:(id)a5 response:(id)a6 responseHandler:(id)a7
{
  id v10 = a3;
  id v11 = a6;
  [(_ASPasswordManagerIconController *)self _fetchAppIconForDomain:v10 responseHandler:a7];
  if ([v11 isGenerated])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __113___ASPasswordManagerIconController__handleIconFetchFailureWithDomain_options_requestID_response_responseHandler___block_invoke;
    block[3] = &unk_2643954B8;
    void block[4] = self;
    id v14 = v11;
    id v15 = v10;
    dispatch_async(queue, block);
  }
}

- (void)_populateDomainToAppIDWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_domainToAppID)
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v6 = [v4 copy];

    blocksAwaitingSharedWebCredentialsInformation = self->_blocksAwaitingSharedWebCredentialsInformation;
    if (blocksAwaitingSharedWebCredentialsInformation)
    {
      id v8 = (void *)MEMORY[0x21D484070](v6);
      [(NSMutableArray *)blocksAwaitingSharedWebCredentialsInformation addObject:v8];
    }
    else
    {
      objc_initWeak(&location, self);
      id v9 = objc_alloc(MEMORY[0x263EFF980]);
      id v10 = (void *)MEMORY[0x21D484070](v6);
      id v11 = (NSMutableArray *)objc_msgSend(v9, "initWithObjects:", v10, 0);
      id v12 = self->_blocksAwaitingSharedWebCredentialsInformation;
      self->_blocksAwaitingSharedWebCredentialsInformation = v11;

      id v13 = (void *)MEMORY[0x263F665A0];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73___ASPasswordManagerIconController__populateDomainToAppIDWithCompletion___block_invoke;
      v14[3] = &unk_264395648;
      objc_copyWeak(&v15, &location);
      [v13 getAllApprovedSharedWebCredentialsEntries:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    id v5 = (void *)v6;
  }
}

- (void)_fetchAppIconForDomain:(id)a3 responseHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = WBS_LOG_CHANNEL_PREFIXPasswordsIcons();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 141558275;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2117;
    id v20 = v6;
    _os_log_impl(&dword_21918F000, v8, OS_LOG_TYPE_DEFAULT, "Fetching app icon; domain=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___ASPasswordManagerIconController__fetchAppIconForDomain_responseHandler___block_invoke;
  block[3] = &unk_264395698;
  void block[4] = self;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)appIconForBundleID:(id)a3
{
  double v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  id v4 = [v3 appState];
  int v5 = [v4 isValid];

  if (v5)
  {
    id WBSImageUtilitiesClass = getWBSImageUtilitiesClass();
    id v7 = iconForApplicationProxy(v3);
    +[_ASPasswordManagerIconController _preferredIconSize];
    id v8 = objc_msgSend(WBSImageUtilitiesClass, "resizedImage:withSize:", v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_ASPasswordManagerIconControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_ASPasswordManagerIconControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_domainToNextIconDownloadRetryDate, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingSharedWebCredentialsInformation, 0);
  objc_storeStrong((id *)&self->_domainToAppID, 0);
  objc_storeStrong((id *)&self->_metadataManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingHistoryItems, 0);
  objc_storeStrong((id *)&self->_domainsThatHaveRequestedIcon, 0);
  objc_storeStrong((id *)&self->_domainToItems, 0);
  objc_storeStrong((id *)&self->_touchIconRequests, 0);
  objc_storeStrong((id *)&self->_activeRequestIDToRequestToken, 0);
  objc_storeStrong((id *)&self->_domainsToExtractedBackgroundColors, 0);

  objc_storeStrong((id *)&self->_iconCache, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "IconController cannot access MobileSafari's container", v1, 2u);
}

@end