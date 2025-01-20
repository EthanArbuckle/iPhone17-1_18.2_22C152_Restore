@interface _ASWebsiteNameProvider
+ (BOOL)_candidateWebsiteNameHasObviousFlaw:(id)a3;
+ (id)_bestTitleFromCandidateTitles:(id)a3;
+ (id)_candidateWebsiteNameForLinkMetadata:(id)a3;
+ (id)_commonTitleDelimiters;
+ (id)_siteNameFromOpenGraphSiteName:(id)a3 withURL:(id)a4;
+ (id)_siteNameFromTitle:(id)a3 withURL:(id)a4;
+ (id)_siteNameFromTitleLikeString:(id)a3 withURL:(id)a4 useHostAndTitlePrefixMatch:(BOOL)a5;
+ (id)_trimErrantLeadingAndTrailingCharacters:(id)a3;
+ (id)_undesirableCharactersCharacterSet;
+ (id)siteNameForDomain:(id)a3 fromBusinessName:(id)a4 title:(id)a5 openGraphSiteName:(id)a6 applicationName:(id)a7;
+ (id)websiteNameForLinkMetadata:(id)a3;
+ (void)fetchWebsiteNameForDomain:(id)a3 completionHandler:(id)a4;
- (BOOL)_openDatabaseIfNeeded;
- (BOOL)isForTesting;
- (WBSSavedAccountStoreWebsiteNameConsumer)websiteNameConsumer;
- (_ASWebsiteNameProvider)init;
- (id)_initWithShouldLoadQuirksList:(BOOL)a3;
- (id)initForPasswordManager;
- (id)knownWebsiteNameForDomain:(id)a3;
- (id)test_initWithWebsiteNameDictionary:(id)a3;
- (void)_cacheDatabaseBackedWebsiteName:(id)a3 forDomain:(id)a4;
- (void)_cacheFetchedAndKeychainBackedWebsiteName:(id)a3 forDomain:(id)a4;
- (void)_processFetchedMetadataEntry:(id)a3 forDomain:(id)a4;
- (void)_suspendOrResumeWebsiteFetchingOperationQueue;
- (void)beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames;
- (void)dealloc;
- (void)debug_deleteAllPersistedData;
- (void)debug_fetchWebsiteNamesForDomains:(id)a3 completionHandler:(id)a4;
- (void)fetchOperation:(id)a3 finishedWithResult:(id)a4 completion:(id)a5;
- (void)prepareForTermination;
- (void)prewarm;
- (void)setIsForTesting:(BOOL)a3;
- (void)setWebsiteNameConsumer:(id)a3;
- (void)test_waitUntilBuiltInAndRemotelyUpdatableWebsiteNamesAreLoaded;
@end

@implementation _ASWebsiteNameProvider

- (void)setWebsiteNameConsumer:(id)a3
{
  objc_storeStrong((id *)&self->_websiteNameConsumer, a3);

  [(_ASWebsiteNameProvider *)self _suspendOrResumeWebsiteFetchingOperationQueue];
}

- (id)initForPasswordManager
{
  return [(_ASWebsiteNameProvider *)self _initWithShouldLoadQuirksList:1];
}

- (id)_initWithShouldLoadQuirksList:(BOOL)a3
{
  BOOL v3 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_ASWebsiteNameProvider;
  v4 = [(_ASWebsiteNameProvider *)&v42 init];
  if (!v4) {
    goto LABEL_17;
  }
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x263F086E0], "as_authenticationServicesBundle");
    v6 = [v5 URLForResource:@"WebsiteNamesForPasswordManager" withExtension:@"json"];

    id v7 = objc_alloc(MEMORY[0x263F66360]);
    v8 = [MEMORY[0x263F08850] defaultManager];
    v9 = objc_msgSend(v8, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v7 initWithDataFormat:1 builtInListURL:v6 downloadsDirectoryURL:v9 resourceName:@"WebsiteNamesForPasswordManager" resourceVersion:@"1" updateDateDefaultsKey:@"WebsiteNameProviderLastUpdateTime" updateInterval:86400.0 snapshotClass:v10 snapshotTransformerClass:objc_opt_class()];
    remotelyUpdatableDataController = v4->_remotelyUpdatableDataController;
    v4->_remotelyUpdatableDataController = (WBSRemotelyUpdatableDataController *)v11;

    [(WBSRemotelyUpdatableDataController *)v4->_remotelyUpdatableDataController setDelegate:v4];
    [(WBSRemotelyUpdatableDataController *)v4->_remotelyUpdatableDataController setShouldAttemptToUpdateConfiguration:1];
    v13 = objc_msgSend(MEMORY[0x263F086E0], "as_authenticationServicesBundle");
    v14 = [v13 URLForResource:@"WebsiteNamesForPasswordManager" withExtension:@"sqlite"];

    v15 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("com.apple.AuthenticationServices._ASWebsiteNameProvider._databaseQueue", 0, v15);
    databaseQueue = v4->_databaseQueue;
    v4->_databaseQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F66368]) initWithURL:v14 queue:v4->_databaseQueue];
    database = v4->_database;
    v4->_database = (WBSSQLiteDatabase *)v18;
  }
  uint64_t v20 = objc_opt_new();
  websiteFetchingQueue = v4->_websiteFetchingQueue;
  v4->_websiteFetchingQueue = (NSOperationQueue *)v20;

  [(NSOperationQueue *)v4->_websiteFetchingQueue setQualityOfService:17];
  v22 = [NSString stringWithFormat:@"com.apple.%@.%p.websiteFetchingQueue", objc_opt_class(), v4];
  [(NSOperationQueue *)v4->_websiteFetchingQueue setName:v22];

  [(NSOperationQueue *)v4->_websiteFetchingQueue setMaxConcurrentOperationCount:3];
  uint64_t v23 = [objc_alloc(MEMORY[0x263F66308]) initWithMetadataEntryClass:objc_opt_class()];
  websiteMetadataStore = v4->_websiteMetadataStore;
  v4->_websiteMetadataStore = (WBSPasswordManagerWebsiteMetadataStore *)v23;

  v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  cachedWebsiteNamesFromDatabase = v4->_cachedWebsiteNamesFromDatabase;
  v4->_cachedWebsiteNamesFromDatabase = v25;

  v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  cachedWebsiteNamesFromKeychain = v4->_cachedWebsiteNamesFromKeychain;
  v4->_cachedWebsiteNamesFromKeychain = v27;

  if (isProcessAllowedToFetchWebsiteNames(void)::onceToken != -1) {
    dispatch_once(&isProcessAllowedToFetchWebsiteNames(void)::onceToken, &__block_literal_global_272);
  }
  if (!isProcessAllowedToFetchWebsiteNames(void)::isProcessAllowedToFetchWebsiteNames)
  {
LABEL_16:
    [(_ASWebsiteNameProvider *)v4 _suspendOrResumeWebsiteFetchingOperationQueue];
    dispatch_queue_t v36 = dispatch_queue_create("com.apple.AuthenticationServices._ASWebsiteNameProvider", 0);
    internalQueueForCachedWebsiteNames = v4->_internalQueueForCachedWebsiteNames;
    v4->_internalQueueForCachedWebsiteNames = (OS_dispatch_queue *)v36;

    v38 = v4;
LABEL_17:

    return v4;
  }
  getWBSPrivacyProxyAvailabilityManagerClass();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v29 = [getWBSPrivacyProxyAvailabilityManagerClass() sharedManager];
    availabilityManager = v4->_availabilityManager;
    v4->_availabilityManager = (WBSPrivacyProxyAvailabilityManager *)v29;
  }
  else
  {
    availabilityManager = v4->_availabilityManager;
    v4->_availabilityManager = 0;
  }

  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  v31 = (id *)getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr;
  uint64_t v51 = getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr;
  if (!getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr)
  {
    uint64_t v43 = MEMORY[0x263EF8330];
    uint64_t v44 = 3221225472;
    v45 = ___ZL45getWBSPrivacyProxyChangeNotificationSymbolLocv_block_invoke;
    v46 = &unk_2643960E8;
    v47 = &v48;
    v32 = SafariSharedUILibrary();
    v33 = dlsym(v32, "WBSPrivacyProxyChangeNotification");
    *(void *)(v47[1] + 24) = v33;
    getWBSPrivacyProxyChangeNotificationSymbolLoc(void)::ptr = *(void *)(v47[1] + 24);
    v31 = (id *)v49[3];
  }
  _Block_object_dispose(&v48, 8);
  if (v31)
  {
    id v34 = *v31;
    if (v34)
    {
      v35 = [MEMORY[0x263F08A00] defaultCenter];
      [v35 addObserver:v4 selector:sel__privacyProxyDidChange_ name:v34 object:v4->_availabilityManager];
    }
    goto LABEL_16;
  }
  v40 = [MEMORY[0x263F08690] currentHandler];
  v41 = [NSString stringWithUTF8String:"NSNotificationName getWBSPrivacyProxyChangeNotification()"];
  objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, @"_ASSafariSharedUISoftLinking.h", 24, @"%s", dlerror());

  __break(1u);
  return result;
}

- (void)_suspendOrResumeWebsiteFetchingOperationQueue
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!self->_isForTesting)
  {
    if (objc_opt_respondsToSelector()) {
      int v3 = [(WBSPrivacyProxyAvailabilityManager *)self->_availabilityManager shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy];
    }
    else {
      int v3 = 0;
    }
    v4 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      BOOL v10 = v3;
      _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider shouldFetchPasswordManagerWebsiteDataUsingPrivacyProxy: %d", (uint8_t *)&v9, 8u);
    }
    websiteNameConsumer = self->_websiteNameConsumer;
    v6 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      BOOL v10 = websiteNameConsumer != 0;
      _os_log_impl(&dword_21918F000, v6, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider consumerExists: %d", (uint8_t *)&v9, 8u);
    }
    if (websiteNameConsumer) {
      BOOL v7 = v3;
    }
    else {
      BOOL v7 = 0;
    }
    v8 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 67109120;
      BOOL v10 = v7;
      _os_log_impl(&dword_21918F000, v8, OS_LOG_TYPE_INFO, "_ASWebsiteNameProvider allowing fetching: %d", (uint8_t *)&v9, 8u);
    }
    [(NSOperationQueue *)self->_websiteFetchingQueue setSuspended:!v7];
  }
}

- (void)prewarm
{
  websiteMetadataStore = self->_websiteMetadataStore;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33___ASWebsiteNameProvider_prewarm__block_invoke;
  v3[3] = &unk_264395E38;
  v3[4] = self;
  [(WBSPasswordManagerWebsiteMetadataStore *)websiteMetadataStore allMetadataWithCompletionHandler:v3];
}

- (void)beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames
{
  remotelyUpdatableDataController = self->_remotelyUpdatableDataController;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77___ASWebsiteNameProvider_beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames__block_invoke;
  v3[3] = &unk_264395E88;
  v3[4] = self;
  [(WBSRemotelyUpdatableDataController *)remotelyUpdatableDataController accessSnapshotLoadingItIfNeeded:v3];
}

- (_ASWebsiteNameProvider)init
{
  return (_ASWebsiteNameProvider *)[(_ASWebsiteNameProvider *)self _initWithShouldLoadQuirksList:0];
}

- (id)test_initWithWebsiteNameDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(_ASWebsiteNameProvider *)self _initWithShouldLoadQuirksList:0];
  v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (void)dealloc
{
  [(WBSRemotelyUpdatableDataController *)self->_remotelyUpdatableDataController prepareForTermination];
  int v3 = self->_database;
  id v4 = v3;
  if (v3)
  {
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33___ASWebsiteNameProvider_dealloc__block_invoke;
    block[3] = &unk_264395E60;
    v8 = v3;
    dispatch_async(databaseQueue, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)_ASWebsiteNameProvider;
  [(_ASWebsiteNameProvider *)&v6 dealloc];
}

- (void)prepareForTermination
{
}

- (void)test_waitUntilBuiltInAndRemotelyUpdatableWebsiteNamesAreLoaded
{
}

- (void)debug_fetchWebsiteNamesForDomains:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(NSOperationQueue *)self->_websiteFetchingQueue setSuspended:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = [[_ASWebsiteNameFetchOperation alloc] initWithDomain:*(void *)(*((void *)&v19 + 1) + 8 * v11) metadataEntry:0 provider:self];
        [(NSOperationQueue *)self->_websiteFetchingQueue addOperation:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  objc_initWeak(&location, self);
  websiteFetchingQueue = self->_websiteFetchingQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78___ASWebsiteNameProvider_debug_fetchWebsiteNamesForDomains_completionHandler___block_invoke;
  v15[3] = &unk_264395ED0;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  [(NSOperationQueue *)websiteFetchingQueue addBarrierBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)setIsForTesting:(BOOL)a3
{
  if (self->_isForTesting != a3)
  {
    self->_isForTesting = a3;
    if (a3) {
      [(NSOperationQueue *)self->_websiteFetchingQueue setSuspended:0];
    }
  }
}

- (void)debug_deleteAllPersistedData
{
}

+ (id)_undesirableCharactersCharacterSet
{
  {
    v2 = (void *)+[_ASWebsiteNameProvider _undesirableCharactersCharacterSet]::undesirableCharactersCharacterSet;
  }
  else
  {
    v2 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"©®™℠"];
    +[_ASWebsiteNameProvider _undesirableCharactersCharacterSet]::undesirableCharactersCharacterSet = (uint64_t)v2;
  }

  return v2;
}

+ (id)_bestTitleFromCandidateTitles:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke;
  v11[3] = &__block_descriptor_40_e18_q16__0__NSString_8l;
  v11[4] = a1;
  v5 = (void *)MEMORY[0x21D484070](v11);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56___ASWebsiteNameProvider__bestTitleFromCandidateTitles___block_invoke_2;
  v9[3] = &unk_264395F38;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(v4, "safari_maximumUsingComparator:", v9);

  return v7;
}

+ (id)siteNameForDomain:(id)a3 fromBusinessName:(id)a4 title:(id)a5 openGraphSiteName:(id)a6 applicationName:(id)a7
{
  id v12 = a4;
  id v29 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = NSURL;
  v28 = v12;
  id v16 = [@"https://" stringByAppendingString:a3];
  id v17 = [v15 URLWithString:v16];

  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = [a1 _siteNameFromTitle:v12 withURL:v17];
  if (([a1 _candidateWebsiteNameHasObviousFlaw:v19] & 1) == 0)
  {
    long long v20 = [a1 _trimErrantLeadingAndTrailingCharacters:v19];
    [v18 addObject:v20];
  }
  id v21 = objc_alloc_init(MEMORY[0x263F103D8]);
  [v21 setOriginalURL:v17];
  [v21 setTitle:v29];
  [v21 setSiteName:v13];
  long long v22 = [a1 _candidateWebsiteNameForLinkMetadata:v21];
  if (([a1 _candidateWebsiteNameHasObviousFlaw:v22] & 1) == 0)
  {
    uint64_t v23 = [a1 _trimErrantLeadingAndTrailingCharacters:v22];
    [v18 addObject:v23];
  }
  uint64_t v24 = [a1 _siteNameFromTitle:v14 withURL:v17];
  if (([a1 _candidateWebsiteNameHasObviousFlaw:v24] & 1) == 0)
  {
    v25 = [a1 _trimErrantLeadingAndTrailingCharacters:v24];
    [v18 addObject:v25];
  }
  v26 = [a1 _bestTitleFromCandidateTitles:v18];

  return v26;
}

+ (void)fetchWebsiteNameForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F103F0]);
  [v8 setTimeout:5.0];
  [v8 setShouldFetchSubresources:0];
  if (objc_opt_respondsToSelector()) {
    [v8 setRequirePrivateRelayForAllNetworkTraffic:1];
  }
  uint64_t v9 = NSURL;
  id v10 = [@"https://" stringByAppendingString:v6];
  uint64_t v11 = [v9 URLWithString:v10];

  id v12 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    +[_ASWebsiteNameProvider fetchWebsiteNameForDomain:completionHandler:]((uint64_t)v6, v12);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70___ASWebsiteNameProvider_fetchWebsiteNameForDomain_completionHandler___block_invoke;
  v15[3] = &unk_264395F60;
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  id v18 = a1;
  [v8 startFetchingMetadataForURL:v11 completionHandler:v15];
}

+ (id)_candidateWebsiteNameForLinkMetadata:(id)a3
{
  id v4 = a3;
  v5 = [v4 siteName];
  if (v5)
  {
    id v6 = [v4 originalURL];
    id v7 = [a1 _siteNameFromOpenGraphSiteName:v5 withURL:v6];

    if (v7) {
      id v8 = v7;
    }
    else {
      id v8 = v5;
    }
    id v9 = v8;
  }
  else
  {
    id v7 = [v4 originalTitle];
    if (!v7 && ([v4 title], (id v7 = objc_claimAutoreleasedReturnValue()) == 0)
      || ([v4 originalURL],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [a1 _siteNameFromTitle:v7 withURL:v10],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v10,
          !v9))
    {
      id v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)_candidateWebsiteNameHasObviousFlaw:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 - 33 >= 0xFFFFFFFFFFFFFFE0)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [&unk_26CAA5448 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v7)
    {
      BOOL v5 = 0;
      goto LABEL_3;
    }
    uint64_t v8 = *(void *)v16;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(&unk_26CAA5448);
      }
      id v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      unint64_t v11 = [v10 length];
      if (v4 >= v11)
      {
        id v12 = [v3 substringToIndex:v11];
        id v13 = [v12 lowercaseString];
        char v14 = [v10 isEqualToString:v13];

        if (v14) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [&unk_26CAA5448 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v5 = 0;
        if (v7) {
          goto LABEL_6;
        }
        goto LABEL_3;
      }
    }
  }
  BOOL v5 = 1;
LABEL_3:

  return v5;
}

+ (id)_trimErrantLeadingAndTrailingCharacters:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v4 = objc_msgSend(a3, "safari_stringByTrimmingWhitespace");
  BOOL v5 = [a1 _commonTitleDelimiters];
  id v6 = v5;
  uint64_t v7 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
  if (!+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove)
  {
    uint64_t v8 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_144);
    uint64_t v9 = [v8 arrayByAddingObjectsFromArray:v6];
    id v10 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
    +[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove = v9;

    uint64_t v7 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::prefixesToRemove;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = objc_msgSend(v4, "safari_substringFromPrefix:", *(void *)(*((void *)&v36 + 1) + 8 * i));
        if (v15)
        {

          unint64_t v4 = (void *)v15;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  if (!+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove)
  {
    long long v16 = [a1 _commonTitleDelimiters];
    long long v17 = objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_146);
    uint64_t v18 = [v17 arrayByAddingObjectsFromArray:v6];
    long long v19 = (void *)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove;
    +[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove = v18;
  }
  unint64_t v20 = [v4 length];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v21 = (id)+[_ASWebsiteNameProvider _trimErrantLeadingAndTrailingCharacters:]::suffixesToRemove;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        unint64_t v26 = [v25 length];
        unint64_t v27 = v20 - v26;
        if (v20 > v26)
        {
          v28 = [v4 substringFromIndex:v27];
          int v29 = [v25 isEqualToString:v28];

          if (v29)
          {
            uint64_t v30 = objc_msgSend(v4, "substringWithRange:", 0, v27);

            unint64_t v4 = (void *)v30;
            goto LABEL_26;
          }
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  return v4;
}

+ (id)websiteNameForLinkMetadata:(id)a3
{
  unint64_t v4 = [a1 _candidateWebsiteNameForLinkMetadata:a3];
  if ([a1 _candidateWebsiteNameHasObviousFlaw:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [a1 _trimErrantLeadingAndTrailingCharacters:v4];
  }

  return v5;
}

+ (id)_siteNameFromOpenGraphSiteName:(id)a3 withURL:(id)a4
{
  unint64_t v4 = [a1 _siteNameFromTitleLikeString:a3 withURL:a4 useHostAndTitlePrefixMatch:0];

  return v4;
}

+ (id)_siteNameFromTitle:(id)a3 withURL:(id)a4
{
  unint64_t v4 = [a1 _siteNameFromTitleLikeString:a3 withURL:a4 useHostAndTitlePrefixMatch:1];

  return v4;
}

+ (id)_siteNameFromTitleLikeString:(id)a3 withURL:(id)a4 useHostAndTitlePrefixMatch:(BOOL)a5
{
  BOOL v61 = a5;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v67 = a3;
  id v7 = a4;
  v62 = v7;
  uint64_t v8 = objc_msgSend(v7, "_lp_highLevelDomain");
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = objc_msgSend(v7, "_lp_simplifiedStringForDisplayOnly:", 0);
  }
  v65 = [v9 lowercaseString];
  if (!v8) {

  }
  id v10 = objc_msgSend(v65, "_lp_hostByStrippingTopLevelDomain");
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v11 = [a1 _commonTitleDelimiters];
  obuint64_t j = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (!v12)
  {

    v63 = 0;
    goto LABEL_40;
  }
  v63 = 0;
  uint64_t v66 = *(void *)v69;
  float v13 = 0.0;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v69 != v66) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = [v67 componentsSeparatedByString:*(void *)(*((void *)&v68 + 1) + 8 * i)];
      unint64_t v16 = [v15 count];
      if (v16 >= 3)
      {
        long long v17 = [v15 objectAtIndexedSubscript:0];
        uint64_t v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        long long v19 = [v17 stringByTrimmingCharactersInSet:v18];

        unint64_t v20 = [v19 lowercaseString];
        LOBYTE(v18) = [v20 isEqualToString:v10];

        if (v18)
        {
          v49 = 0;
        }
        else
        {
          id v21 = [v15 objectAtIndexedSubscript:v16 - 1];
          uint64_t v22 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          uint64_t v23 = [v21 stringByTrimmingCharactersInSet:v22];

          uint64_t v24 = [v23 lowercaseString];
          int v25 = [v24 isEqualToString:v10];

          if (v25) {
            unint64_t v26 = 0;
          }
          else {
            unint64_t v26 = v23;
          }

          if ((v25 & 1) == 0)
          {

            goto LABEL_17;
          }
          v49 = v19;
          long long v19 = v23;
        }

        goto LABEL_46;
      }
LABEL_17:
      if ([v15 count] == 2)
      {
        unint64_t v27 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        v28 = [v15 objectAtIndexedSubscript:0];
        int v29 = [v28 stringByTrimmingCharactersInSet:v27];

        uint64_t v30 = [v15 objectAtIndexedSubscript:1];
        v31 = [v30 stringByTrimmingCharactersInSet:v27];

        long long v32 = [v29 lowercaseString];
        long long v33 = [v31 lowercaseString];
        objc_msgSend(v32, "_lp_similarityToString:", v65);
        float v35 = v34;
        objc_msgSend(v32, "_lp_similarityToString:", v10);
        if (v35 <= v36) {
          long long v37 = v10;
        }
        else {
          long long v37 = v65;
        }
        objc_msgSend(v32, "_lp_similarityToString:", v37);
        float v39 = v38;
        objc_msgSend(v33, "_lp_similarityToString:", v65);
        float v41 = v40;
        objc_msgSend(v33, "_lp_similarityToString:", v10);
        if (v41 <= v42) {
          uint64_t v43 = v10;
        }
        else {
          uint64_t v43 = v65;
        }
        objc_msgSend(v33, "_lp_similarityToString:", v43);
        if (v39 <= v44) {
          float v45 = v44;
        }
        else {
          float v45 = v39;
        }
        if (v45 <= v13)
        {
          float v45 = v13;
        }
        else
        {
          if (v39 <= v44) {
            v46 = v31;
          }
          else {
            v46 = v29;
          }
          id v47 = v46;

          v63 = v47;
        }

        float v13 = v45;
      }
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v12) {
      continue;
    }
    break;
  }

  if (v63 && v13 >= 0.6)
  {
    long long v19 = v63;
    goto LABEL_49;
  }
LABEL_40:
  uint64_t v48 = [v65 uppercaseString];
  if ([v48 isEqualToString:v67] & 1) != 0 || (objc_msgSend(v65, "isEqualToString:", v67))
  {
    long long v19 = 0;
  }
  else
  {
    unint64_t v52 = [v67 length];
    obuint64_t j = v48;
    if (v52 < [v65 length]) {
      goto LABEL_57;
    }
    long long v19 = objc_msgSend(v67, "substringToIndex:", objc_msgSend(v65, "length"));
    v53 = [v19 lowercaseString];
    int v54 = [v53 isEqualToString:v65];

    v55 = v54 ? 0 : v19;
    if ((v54 & 1) == 0)
    {
LABEL_57:
      v56 = [v67 stringByReplacingOccurrencesOfString:@" " withString:&stru_26CA92B70];
      uint64_t v15 = [v56 lowercaseString];

      if ([v15 isEqualToString:v10])
      {
        id v50 = 0;
        long long v19 = v67;
      }
      else
      {
        if (!v61) {
          goto LABEL_65;
        }
        unint64_t v57 = [v67 length];
        if (v57 < [v10 length]) {
          goto LABEL_65;
        }
        long long v19 = objc_msgSend(v67, "substringToIndex:", objc_msgSend(v10, "length"));
        v58 = [v19 lowercaseString];
        int v59 = [v58 isEqualToString:v10];

        v60 = v59 ? 0 : v19;
        if ((v59 & 1) == 0) {
LABEL_65:
        }
          long long v19 = 0;
LABEL_46:
        id v50 = v67;
      }

      id v67 = v50;
      uint64_t v48 = obj;
    }
  }

LABEL_49:

  return v19;
}

+ (id)_commonTitleDelimiters
{
  return &unk_26CAA5460;
}

- (BOOL)_openDatabaseIfNeeded
{
  if (!self->_database) {
    return 0;
  }
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  databaseQueue = self->_databaseQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47___ASWebsiteNameProvider__openDatabaseIfNeeded__block_invoke;
  v5[3] = &unk_264395FA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(databaseQueue, v5);
  BOOL v3 = *((unsigned char *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)knownWebsiteNameForDomain:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(_ASWebsiteNameDictionary *)self->_websiteNameDictionary websiteNameForDomain:v4];
    if (v5) {
      goto LABEL_21;
    }
    uint64_t v35 = 0;
    float v36 = &v35;
    uint64_t v37 = 0x3032000000;
    float v38 = __Block_byref_object_copy__0;
    float v39 = __Block_byref_object_dispose__0;
    id v40 = 0;
    internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke;
    block[3] = &unk_264395FD0;
    float v34 = &v35;
    void block[4] = self;
    id v7 = v4;
    id v33 = v7;
    dispatch_sync(internalQueueForCachedWebsiteNames, block);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = (id)v36[5];
LABEL_20:

      _Block_object_dispose(&v35, 8);
      goto LABEL_21;
    }
    if ([(_ASWebsiteNameProvider *)self _openDatabaseIfNeeded])
    {
      uint64_t v26 = 0;
      unint64_t v27 = &v26;
      uint64_t v28 = 0x3032000000;
      int v29 = __Block_byref_object_copy__0;
      uint64_t v30 = __Block_byref_object_dispose__0;
      id v31 = 0;
      databaseQueue = self->_databaseQueue;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_2;
      v23[3] = &unk_264395FF8;
      v23[4] = self;
      id v10 = v7;
      id v24 = v10;
      int v25 = &v26;
      dispatch_sync(databaseQueue, v23);
      [(_ASWebsiteNameProvider *)self _cacheDatabaseBackedWebsiteName:v27[5] forDomain:v10];
      id v11 = (void *)v27[5];
      if (v11)
      {
        id v5 = v11;
        id v12 = v24;
LABEL_19:

        _Block_object_dispose(&v26, 8);
        goto LABEL_20;
      }

      _Block_object_dispose(&v26, 8);
    }
    uint64_t v26 = 0;
    unint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    int v29 = __Block_byref_object_copy__0;
    uint64_t v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    float v13 = self->_internalQueueForCachedWebsiteNames;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_3;
    v20[3] = &unk_264395FD0;
    uint64_t v22 = &v26;
    v20[4] = self;
    id v14 = v7;
    id v21 = v14;
    dispatch_sync(v13, v20);
    if (v27[5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = (void *)v27[5];
      }
      else {
        uint64_t v15 = 0;
      }
      id v5 = v15;
    }
    else
    {
      websiteMetadataStore = self->_websiteMetadataStore;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52___ASWebsiteNameProvider_knownWebsiteNameForDomain___block_invoke_4;
      v18[3] = &unk_264396020;
      v18[4] = self;
      id v19 = v14;
      [(WBSPasswordManagerWebsiteMetadataStore *)websiteMetadataStore metadataForDomain:v19 completionHandler:v18];

      id v5 = 0;
    }
    id v12 = v21;
    goto LABEL_19;
  }
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_ASWebsiteNameProvider knownWebsiteNameForDomain:](v8);
  }
  id v5 = 0;
LABEL_21:

  return v5;
}

- (void)fetchOperation:(id)a3 finishedWithResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71___ASWebsiteNameProvider_fetchOperation_finishedWithResult_completion___block_invoke;
  v14[3] = &unk_264396070;
  id v15 = v8;
  id v16 = v9;
  long long v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

- (void)_processFetchedMetadataEntry:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 websiteName];
  [(_ASWebsiteNameProvider *)self _cacheFetchedAndKeychainBackedWebsiteName:v8 forDomain:v7];

  if (isProcessAllowedToFetchWebsiteNames(void)::onceToken != -1) {
    dispatch_once(&isProcessAllowedToFetchWebsiteNames(void)::onceToken, &__block_literal_global_272);
  }
  if (isProcessAllowedToFetchWebsiteNames(void)::isProcessAllowedToFetchWebsiteNames)
  {
    id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    id v10 = [MEMORY[0x263EFF910] now];
    id v11 = [v9 dateByAddingUnit:16 value:-7 toDate:v10 options:0];

    id v12 = [v6 websiteNameDateLastRefreshed];
    id v13 = v12;
    if (!v12 || (objc_msgSend(v12, "safari_isEarlierThanDate:", v11) & 1) != 0)
    {
      id v14 = [(NSOperationQueue *)self->_websiteFetchingQueue operations];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __65___ASWebsiteNameProvider__processFetchedMetadataEntry_forDomain___block_invoke;
      v18[3] = &unk_264396098;
      id v15 = v7;
      id v19 = v15;
      char v16 = objc_msgSend(v14, "safari_containsObjectPassingTest:", v18);

      if ((v16 & 1) == 0 && (objc_msgSend(v15, "safari_looksLikeIPAddress") & 1) == 0)
      {
        long long v17 = [[_ASWebsiteNameFetchOperation alloc] initWithDomain:v15 metadataEntry:v6 provider:self];
        [(NSOperationQueue *)self->_websiteFetchingQueue addOperation:v17];
      }
    }
  }
}

- (void)_cacheDatabaseBackedWebsiteName:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___ASWebsiteNameProvider__cacheDatabaseBackedWebsiteName_forDomain___block_invoke;
  block[3] = &unk_2643960C0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueueForCachedWebsiteNames, block);
}

- (void)_cacheFetchedAndKeychainBackedWebsiteName:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueueForCachedWebsiteNames = self->_internalQueueForCachedWebsiteNames;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78___ASWebsiteNameProvider__cacheFetchedAndKeychainBackedWebsiteName_forDomain___block_invoke;
  block[3] = &unk_2643960C0;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueueForCachedWebsiteNames, block);
}

- (WBSSavedAccountStoreWebsiteNameConsumer)websiteNameConsumer
{
  return self->_websiteNameConsumer;
}

- (BOOL)isForTesting
{
  return self->_isForTesting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteNameConsumer, 0);
  objc_storeStrong((id *)&self->_cachedWebsiteNamesFromDatabase, 0);
  objc_storeStrong((id *)&self->_cachedWebsiteNamesFromKeychain, 0);
  objc_storeStrong((id *)&self->_internalQueueForCachedWebsiteNames, 0);
  objc_storeStrong((id *)&self->_availabilityManager, 0);
  objc_storeStrong((id *)&self->_websiteMetadataStore, 0);
  objc_storeStrong((id *)&self->_websiteFetchingQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_websiteNameDictionary, 0);

  objc_storeStrong((id *)&self->_remotelyUpdatableDataController, 0);
}

+ (void)fetchWebsiteNameForDomain:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21918F000, a2, OS_LOG_TYPE_DEBUG, "Starting fetch for %{sensitive}@\n", (uint8_t *)&v2, 0xCu);
}

- (void)knownWebsiteNameForDomain:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21918F000, log, OS_LOG_TYPE_ERROR, "Asked by client to look up the domain for a nil or empty string", v1, 2u);
}

@end