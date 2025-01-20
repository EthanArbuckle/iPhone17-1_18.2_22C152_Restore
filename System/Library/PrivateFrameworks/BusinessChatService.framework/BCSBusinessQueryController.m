@interface BCSBusinessQueryController
- (BCSBusinessQueryController)initWithChatSuggestMegashardFetchTrigger:(id)a3 businessLinkMegashardFetchTrigger:(id)a4 businessCallerMegashardFetchTrigger:(id)a5 businessEmailMegashardFetchTrigger:(id)a6 entitlementVerifier:(id)a7 identityService:(id)a8 chatSuggestController:(id)a9 iconController:(id)a10 cacheClearer:(id)a11 shardCache:(id)a12 configCache:(id)a13 configCacheSkip:(id)a14 shardCacheSkip:(id)a15 chatSuggestConfigResolver:(id)a16 linkConfigResolver:(id)a17 businessCallerConfigResolver:(id)a18 businessEmailConfigResolver:(id)a19 chatSuggestShardResolver:(id)a20 linkShardResolver:(id)a21 businessCallerShardResolver:(id)a22 businessEmailShardResolver:(id)a23 chatSuggestItemResolver:(id)a24 linkItemResolver:(id)a25 businessCallerItemResolver:(id)a26 businessEmailItemResolver:(id)a27 queryChopper:(id)a28 patternController:(id)a29 metricFactory:(id)a30 blastDoorHelper:(id)a31 housekeeper:(id)a32;
- (BCSBusinessQueryController)initWithChatSuggestMegashardFetcher:(id)a3 businessLinkMegashardFetcher:(id)a4 businessCallerMegashardFetcher:(id)a5 businessEmailMegashardFetcher:(id)a6 shardCache:(id)a7 cacheManager:(id)a8 chatSuggestRemoteFetcher:(id)a9 businessLinkRemoteFetcher:(id)a10 businessCallerRemoteFetcher:(id)a11 businessEmailRemoteFetcher:(id)a12 userDefaults:(id)a13 metricFactory:(id)a14;
- (char)_itemResolverForType:(uint64_t)a1;
- (char)_shardResolverForType:(uint64_t)a1;
- (id)_shardIdentifierForQuery:(void *)a1 withItemIdentifier:(void *)a2;
- (uint64_t)_shardStartIndexForItemIdentifier:(uint64_t)a3 shardType:(uint64_t)a4 shardCount:;
- (unint64_t)_isBloomFilterCachedForType:(id *)a1;
- (void)_deleteInMemoryCache;
- (void)_generateSafeImageURLForItemIdentifier:(void *)a3 imageData:(void *)a4 format:(void *)a5 completion:;
- (void)cachedBusinessMetadataForEmail:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4;
- (void)clearCachesForType:(int64_t)a3 completion:(id)a4;
- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4;
- (void)fetchAreBusinessesRegisteredWithQuery:(id)a3 completion:(id)a4;
- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 metadataCallback:(id)a5 logoURLCallback:(id)a6 completion:(id)a7;
- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessItemWithPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessMetadataForEmail:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchBusinessMetadataForEmails:(id)a3 forClientBundleID:(id)a4 requestId:(id)a5 completion:(id)a6;
- (void)fetchConfigForQuery:(id)a3 completion:(id)a4;
- (void)fetchIsBusinessPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchIsBusinessRegisteredWithQuery:(id)a3 completion:(id)a4;
- (void)fetchItemWithQuery:(id)a3 completion:(id)a4;
- (void)fetchItemsWithQuery:(id)a3 perItemCompletion:(id)a4 completion:(id)a5;
- (void)fetchLinkItemModelWithHash:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)fetchLinkItemModelWithURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6;
- (void)fetchShardWithQuery:(id)a3 completion:(id)a4;
- (void)fetchShardsWithQuery:(id)a3 completion:(id)a4;
- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5;
- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6;
- (void)lookupBloomFiltersForURL:(int)a3 chopURL:(void *)a4 forClientBundleID:(void *)a5 registeredMetric:(void *)a6 completion:;
- (void)prefetchMegashardsWithCompletion:(id)a3;
- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3 forClientBundleID:(id)a4;
@end

@implementation BCSBusinessQueryController

- (BCSBusinessQueryController)initWithChatSuggestMegashardFetcher:(id)a3 businessLinkMegashardFetcher:(id)a4 businessCallerMegashardFetcher:(id)a5 businessEmailMegashardFetcher:(id)a6 shardCache:(id)a7 cacheManager:(id)a8 chatSuggestRemoteFetcher:(id)a9 businessLinkRemoteFetcher:(id)a10 businessCallerRemoteFetcher:(id)a11 businessEmailRemoteFetcher:(id)a12 userDefaults:(id)a13 metricFactory:(id)a14
{
  id v18 = a14;
  id v69 = a13;
  id v54 = a12;
  id v52 = a11;
  id v50 = a10;
  id v57 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v24, "addFetchTrigger:");

  v26 = objc_alloc_init(BCSManualFetchTrigger);
  [v23 addFetchTrigger:v26];

  v72 = objc_alloc_init(BCSManualFetchTrigger);
  [v22 addFetchTrigger:v72];

  v27 = objc_alloc_init(BCSManualFetchTrigger);
  objc_msgSend(v21, "addFetchTrigger:");

  v68 = objc_alloc_init(BCSIconController);
  v28 = [BCSChatSuggestController alloc];
  v29 = +[BCSIdentityService sharedInstance]();
  v30 = objc_alloc_init(BCSLocaleHelper);
  v63 = -[BCSChatSuggestController initWithUserDefaults:identityService:localeHelper:]((id *)&v28->super.isa, v69, v29, v30);

  v66 = v25;
  v70 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v25, v18);
  v64 = v26;
  v62 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v26, v18);
  v65 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v72, v18);
  v49 = -[BCSConfigResolver initWithConfigCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSConfigResolver alloc], v19, v19, v27, v18);
  v61 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v25, v18);
  v48 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v26, v18);
  v47 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v72, v18);
  v60 = -[BCSShardResolver initWithShardCache:cacheSkipper:megashardFetchTrigger:metricFactory:]((id *)[BCSShardResolver alloc], v20, v19, v27, v18);

  v59 = -[BCSItemResolver initWithItemCache:cacheSkipper:remoteFetcher:metricFactory:]((id *)[BCSItemResolver alloc], v19, v19, v57, v18);
  v58 = -[BCSItemResolver initWithItemCache:cacheSkipper:remoteFetcher:metricFactory:]((id *)[BCSItemResolver alloc], v19, v19, v50, v18);

  v31 = [v52 environment];

  v53 = [v31 pirEnvironmentForServerType:1];

  v46 = -[BCSCallerIdResolver initWithEnvironment:itemCache:cacheSkipper:metricFactory:]((id *)[BCSCallerIdResolver alloc], v53, v19, v19, v18);
  v32 = [v54 environment];
  v51 = [v32 pirEnvironmentForServerType:2];

  v33 = [v54 environment];

  v55 = [v33 pirEnvironmentForServerType:3];

  v45 = -[BCSBusinessEmailResolver initWithMetadataEnvironment:logoEnvironment:itemCache:cacheSkipper:metricFactory:]((id *)[BCSBusinessEmailResolver alloc], v51, v55, v19, v19, v18);
  v44 = -[BCSQueryChopper initWithMetricFactory:]([BCSQueryChopper alloc], v18);
  v43 = [[BCSURLPatternController alloc] initWithCacheManager:v19 metricFactory:v18];
  v34 = +[BCSBlastDoorHelper defaultHelper];
  v35 = [BCSHousekeeper alloc];
  v36 = +[BCSUserDefaults sharedDefaults];
  v37 = [(BCSHousekeeper *)v35 initWithUserDefaults:v36];

  v38 = objc_alloc_init(BCSEntitlementVerifier);
  v39 = +[BCSIdentityService sharedInstance]();
  v40 = -[BCSBusinessQueryController initWithChatSuggestMegashardFetchTrigger:businessLinkMegashardFetchTrigger:businessCallerMegashardFetchTrigger:businessEmailMegashardFetchTrigger:entitlementVerifier:identityService:chatSuggestController:iconController:cacheClearer:shardCache:configCache:configCacheSkip:shardCacheSkip:chatSuggestConfigResolver:linkConfigResolver:businessCallerConfigResolver:businessEmailConfigResolver:chatSuggestShardResolver:linkShardResolver:businessCallerShardResolver:businessEmailShardResolver:chatSuggestItemResolver:linkItemResolver:businessCallerItemResolver:businessEmailItemResolver:queryChopper:patternController:metricFactory:blastDoorHelper:housekeeper:](self, "initWithChatSuggestMegashardFetchTrigger:businessLinkMegashardFetchTrigger:businessCallerMegashardFetchTrigger:businessEmailMegashardFetchTrigger:entitlementVerifier:identityService:chatSuggestController:iconController:cacheClearer:shardCache:configCache:configCacheSkip:shardCacheSkip:chatSuggestConfigResolver:linkConfigResolver:businessCallerConfigResolver:businessEmailConfigResolver:chatSuggestShardResolver:linkShardResolver:businessCallerShardResolver:businessEmailShardResolver:chatSuggestItemResolver:linkItemResolver:businessCallerItemResolver:businessEmailItemResolver:queryChopper:patternController:metricFactory:blastDoorHelper:housekeeper:", v66, v26, v72, v27, v38, v39, v63, v68, v19, v19, v19, v19,
          v19,
          v70,
          v62,
          v65,
          v49,
          v61,
          v48,
          v47,
          v60,
          v59,
          v58,
          v46,
          v45,
          v44,
          v43,
          v18,
          v34,
          v37);

  v41 = v40;
  return v41;
}

- (BCSBusinessQueryController)initWithChatSuggestMegashardFetchTrigger:(id)a3 businessLinkMegashardFetchTrigger:(id)a4 businessCallerMegashardFetchTrigger:(id)a5 businessEmailMegashardFetchTrigger:(id)a6 entitlementVerifier:(id)a7 identityService:(id)a8 chatSuggestController:(id)a9 iconController:(id)a10 cacheClearer:(id)a11 shardCache:(id)a12 configCache:(id)a13 configCacheSkip:(id)a14 shardCacheSkip:(id)a15 chatSuggestConfigResolver:(id)a16 linkConfigResolver:(id)a17 businessCallerConfigResolver:(id)a18 businessEmailConfigResolver:(id)a19 chatSuggestShardResolver:(id)a20 linkShardResolver:(id)a21 businessCallerShardResolver:(id)a22 businessEmailShardResolver:(id)a23 chatSuggestItemResolver:(id)a24 linkItemResolver:(id)a25 businessCallerItemResolver:(id)a26 businessEmailItemResolver:(id)a27 queryChopper:(id)a28 patternController:(id)a29 metricFactory:(id)a30 blastDoorHelper:(id)a31 housekeeper:(id)a32
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v77 = a3;
  id v50 = a4;
  id v76 = a4;
  id v51 = a5;
  id v75 = a5;
  id v74 = a6;
  id v52 = a7;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  id v70 = a10;
  id v69 = a11;
  id v68 = a12;
  id v67 = a13;
  id v66 = a14;
  id v65 = a15;
  id v64 = a16;
  id v63 = a17;
  id v62 = a18;
  id v61 = a19;
  id v60 = a20;
  id v59 = a21;
  id v58 = a22;
  id v57 = a23;
  id v56 = a24;
  id v37 = a25;
  id v38 = a26;
  id v39 = a27;
  id v40 = a28;
  id v41 = a29;
  id v42 = a30;
  id v55 = a31;
  id v43 = a32;
  v78.receiver = self;
  v78.super_class = (Class)BCSBusinessQueryController;
  v44 = [(BCSBusinessQueryController *)&v78 init];
  v45 = v44;
  if (v44)
  {
    id v54 = v42;
    objc_storeStrong((id *)&v44->_chatSuggestMegashardFetchTrigger, a3);
    objc_storeStrong((id *)&v45->_businessLinkMegashardFetchTrigger, v50);
    objc_storeStrong((id *)&v45->_businessCallerMegashardFetchTrigger, v51);
    objc_storeStrong((id *)&v45->_businessEmailMegashardFetchTrigger, a6);
    objc_storeStrong((id *)&v45->_entitlementVerifier, v52);
    objc_storeStrong((id *)&v45->_identityService, a8);
    objc_storeStrong((id *)&v45->_chatSuggestController, a9);
    objc_storeStrong((id *)&v45->_iconController, a10);
    objc_storeStrong((id *)&v45->_cacheClearer, a11);
    objc_storeStrong((id *)&v45->_shardCache, a12);
    objc_storeStrong((id *)&v45->_configCache, a13);
    objc_storeStrong((id *)&v45->_configCacheSkip, a14);
    objc_storeStrong((id *)&v45->_shardCacheSkip, a15);
    objc_storeStrong((id *)&v45->_chatSuggestConfigResolver, a16);
    objc_storeStrong((id *)&v45->_linkConfigResolver, a17);
    objc_storeStrong((id *)&v45->_businessCallerConfigResolver, a18);
    objc_storeStrong((id *)&v45->_businessEmailConfigResolver, a19);
    objc_storeStrong((id *)&v45->_chatSuggestShardResolver, a20);
    objc_storeStrong((id *)&v45->_linkShardResolver, a21);
    objc_storeStrong((id *)&v45->_businessCallerShardResolver, a22);
    objc_storeStrong((id *)&v45->_businessEmailShardResolver, a23);
    objc_storeStrong((id *)&v45->_chatSuggestItemResolver, a24);
    objc_storeStrong((id *)&v45->_linkItemResolver, a25);
    objc_storeStrong((id *)&v45->_businessCallerItemResolver, a26);
    objc_storeStrong((id *)&v45->_businessEmailItemResolver, a27);
    objc_storeStrong((id *)&v45->_queryChopper, a28);
    objc_storeStrong((id *)&v45->_patternController, a29);
    objc_storeStrong((id *)&v45->_metricFactory, a30);
    objc_storeStrong((id *)&v45->_blastDoorHelper, a31);
    objc_storeStrong((id *)&v45->_housekeeper, a32);
    v45->_blastDoorWarmedUp = 0;
    v46 = ABSLogCommon();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[BCSBusinessQueryController startUpTasks]";
      _os_log_impl(&dword_2154F4000, v46, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
    }

    v47 = dispatch_get_global_queue(0, 0);
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v80 = __42__BCSBusinessQueryController_startUpTasks__block_invoke;
    v81 = &unk_264248CD8;
    v82 = v45;
    dispatch_async(v47, &buf);

    id v42 = v54;
  }

  return v45;
}

void __42__BCSBusinessQueryController_startUpTasks__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    v2 = ABSLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2154F4000, v2, OS_LOG_TYPE_DEFAULT, "BlastDoor already warm", v4, 2u);
    }
  }
  else
  {
    [*(id *)(v1 + 256) warmUpBlastDoor];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
}

- (void)warmCacheIfNecessaryForPhoneNumbers:(id)a3 forClientBundleID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v20 = "-[BCSBusinessQueryController warmCacheIfNecessaryForPhoneNumbers:forClientBundleID:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[BCSBusinessQueryController fetchIsBusinessPhoneNumber:forClientBundleID:completion:](self, "fetchIsBusinessPhoneNumber:forClientBundleID:completion:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), v7, &__block_literal_global_6, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)fetchBusinessItemWithDetailsForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v15 = "-[BCSBusinessQueryController fetchBusinessItemWithDetailsForPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __102__BCSBusinessQueryController_fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke;
    v12[3] = &unk_264249260;
    v12[4] = self;
    id v13 = v10;
    [(BCSBusinessQueryController *)self fetchBusinessItemWithPhoneNumber:v8 forClientBundleID:v9 completion:v12];
  }
}

void __102__BCSBusinessQueryController_fetchBusinessItemWithDetailsForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(void **)(v5 + 40);
  }
  else {
    id v6 = 0;
  }
  id v7 = a3;
  id v8 = a2;
  [v6 chatSuggestVisibilityForBusinessItem:v8];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchIsBusinessPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v26 = "-[BCSBusinessQueryController fetchIsBusinessPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    uint64_t v12 = +[BCSBusinessItemIdentifier identifierWithPhoneNumber:]((uint64_t)BCSBusinessItemIdentifier, v8);
    if (self) {
      metricFactory = self->_metricFactory;
    }
    else {
      metricFactory = 0;
    }
    long long v14 = metricFactory;
    long long v15 = [(BCSMetricFactoryProtocol *)v14 chatSuggestRegisteredMetricForItemIdentifier:v12];

    if (self) {
      uint64_t v16 = self->_metricFactory;
    }
    else {
      uint64_t v16 = 0;
    }
    long long v17 = v16;
    id v18 = [(BCSMetricFactoryProtocol *)v17 measurementFactory];
    id v19 = [v18 itemIsRegisteredTimingMeasurementForItemIdentifier:v12];
    [v15 setTimingMeasurement:v19];

    id v20 = [v15 timingMeasurement];
    [v20 begin];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __86__BCSBusinessQueryController_fetchIsBusinessPhoneNumber_forClientBundleID_completion___block_invoke;
    v22[3] = &unk_264249260;
    id v23 = v15;
    id v24 = v10;
    id v21 = v15;
    [(BCSBusinessQueryController *)self fetchBusinessItemWithPhoneNumber:v8 forClientBundleID:v9 completion:v22];
  }
}

void __86__BCSBusinessQueryController_fetchIsBusinessPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v5 = [v4 timingMeasurement];
  [v5 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v15 = "-[BCSBusinessQueryController fetchSquareIconDataForBusinessItem:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    if (self) {
      self = (BCSBusinessQueryController *)self->_iconController;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __94__BCSBusinessQueryController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
    v12[3] = &unk_264248F70;
    id v13 = v10;
    [(BCSBusinessQueryController *)self fetchSquareIconDataForBusinessItem:v8 forClientBundleID:v9 completion:v12];
  }
}

uint64_t __94__BCSBusinessQueryController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchBusinessItemWithPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v27 = "-[BCSBusinessQueryController fetchBusinessItemWithPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    uint64_t v12 = +[BCSBusinessItemIdentifier identifierWithPhoneNumber:]((uint64_t)BCSBusinessItemIdentifier, v8);
    if (self) {
      metricFactory = self->_metricFactory;
    }
    else {
      metricFactory = 0;
    }
    long long v14 = metricFactory;
    long long v15 = [(BCSMetricFactoryProtocol *)v14 chatSuggestFetchMetricForItemIdentifier:v12];

    if (self) {
      uint64_t v16 = self->_metricFactory;
    }
    else {
      uint64_t v16 = 0;
    }
    long long v17 = v16;
    id v18 = [(BCSMetricFactoryProtocol *)v17 measurementFactory];
    id v19 = [v18 itemFetchTimingMeasurementForItemIdentifier:v12];
    [v15 setTimingMeasurement:v19];

    id v20 = [v15 timingMeasurement];
    [v20 begin];

    id v21 = [[BCSQuery alloc] initWithItemIdentifier:v12 clientBundleId:v9 shardType:1];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __92__BCSBusinessQueryController_fetchBusinessItemWithPhoneNumber_forClientBundleID_completion___block_invoke;
    v23[3] = &unk_264249288;
    id v24 = v15;
    id v25 = v10;
    id v22 = v15;
    [(BCSBusinessQueryController *)self fetchItemWithQuery:v21 completion:v23];
  }
}

void __92__BCSBusinessQueryController_fetchBusinessItemWithPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = a2;
  id v7 = [v5 timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchLinkItemModelWithURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v36 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    long long v14 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v10);
    if (v14)
    {
      if (self) {
        metricFactory = self->_metricFactory;
      }
      else {
        metricFactory = 0;
      }
      uint64_t v16 = metricFactory;
      long long v17 = [(BCSMetricFactoryProtocol *)v16 businessLinkFetchMetricForItemIdentifier:v14];

      [v17 setChoppingEnabled:v8];
      if (self)
      {
        id v18 = self->_metricFactory;
        id v19 = [(BCSMetricFactoryProtocol *)v18 measurementFactory];
        id v20 = [v19 itemFetchTimingMeasurementForItemIdentifier:v14];
        [v17 setTimingMeasurement:v20];

        id v21 = [v17 timingMeasurement];
        [v21 begin];

        patternController = self->_patternController;
      }
      else
      {
        id v25 = [0 measurementFactory];
        v26 = [v25 itemFetchTimingMeasurementForItemIdentifier:v14];
        [v17 setTimingMeasurement:v26];

        uint64_t v27 = [v17 timingMeasurement];
        [v27 begin];

        patternController = 0;
      }
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke;
      v28[3] = &unk_264249350;
      BOOL v34 = v8;
      v28[4] = self;
      id v29 = v10;
      id v30 = v14;
      id v31 = v11;
      id v32 = v17;
      id v33 = v12;
      id v23 = v17;
      [(BCSURLPatternControllerProtocol *)patternController matchPatternForURL:v29 forClientBundleID:v31 completion:v28];
    }
    else
    {
      id v24 = ABSLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v36 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]";
        _os_log_impl(&dword_2154F4000, v24, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given URL", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = ABSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromBOOL();
    *(_DWORD *)long long buf = 136315394;
    uint64_t v27 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    __int16 v28 = 2114;
    id v29 = v7;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s - Found extracted URL? : %{public}@", buf, 0x16u);
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_27;
  v19[3] = &unk_2642492D8;
  char v25 = *(unsigned char *)(a1 + 80);
  BOOL v8 = *(void **)(a1 + 40);
  v19[4] = *(void *)(a1 + 32);
  id v20 = v8;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v24 = *(id *)(a1 + 72);
  uint64_t v9 = MEMORY[0x2166BDB40](v19);
  id v10 = (void *)v9;
  if (v5)
  {
    id v11 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v5);
    id v12 = [[BCSQuery alloc] initWithItemIdentifier:v11 clientBundleId:*(void *)(a1 + 56) shardType:2 skipRegistrationCheck:1];
    id v13 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_30;
    v14[3] = &unk_264249300;
    id v15 = *(id *)(a1 + 64);
    id v16 = v5;
    id v17 = *(id *)(a1 + 72);
    id v18 = v10;
    [v13 fetchItemWithQuery:v12 completion:v14];
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_27(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      v3 = *(void **)(v2 + 184);
    }
    else {
      v3 = 0;
    }
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    id v6 = v3;
    unint64_t v7 = -[BCSBusinessQueryController _isBloomFilterCachedForType:]((id *)v2, [v5 type]);
    uint64_t v9 = *(void *)(a1 + 56);
    BOOL v8 = *(void **)(a1 + 64);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_2;
    v15[3] = &unk_2642492B0;
    id v16 = v8;
    id v17 = *(id *)(a1 + 72);
    [v6 queryChopperDelegate:v2 fetchLinkItemModelWithURL:v4 isBloomFilterCached:v7 forClientBundleID:v9 metric:v16 completion:v15];

    id v10 = v16;
  }
  else
  {
    id v10 = [[BCSQuery alloc] initWithItemIdentifier:*(void *)(a1 + 48) clientBundleId:*(void *)(a1 + 56) shardType:2];
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_29;
    v12[3] = &unk_264249288;
    id v13 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    [v11 fetchItemWithQuery:v10 completion:v12];
  }
}

- (unint64_t)_isBloomFilterCachedForType:(id *)a1
{
  unint64_t v2 = (unint64_t)a1;
  if (a1)
  {
    id v4 = a1[28];
    if ([v4 shouldSkipCacheForConfigItemOfType:a2]) {
      goto LABEL_3;
    }
    char v5 = [*(id *)(v2 + 232) shouldSkipCacheForShardItemOfType:a2];

    if ((v5 & 1) == 0)
    {
      id v4 = [*(id *)(v2 + 216) configItemForType:a2];
      if (v4)
      {
        if ((unint64_t)(a2 - 2) > 2) {
          uint64_t v6 = 1;
        }
        else {
          uint64_t v6 = qword_215570B00[a2 - 2];
        }
        uint64_t v7 = [*(id *)(v2 + 208) countOfShardsOfType:v6];
        unint64_t v2 = v7 == [v4 filterShardCount];
        goto LABEL_11;
      }
LABEL_3:
      unint64_t v2 = 0;
LABEL_11:

      return v2;
    }
    return 0;
  }
  return v2;
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  BOOL v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 model];
    id v10 = NSStringFromBOOL();
    int v13 = 136315650;
    id v14 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke_2";
    __int16 v15 = 2114;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - found item: %{public}@ - error:%@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [v5 model];
  (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v6);
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  BOOL v8 = [v6 timingMeasurement];
  [v8 end];

  if (v7) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = -1;
  }
  [*(id *)(a1 + 32) setSuccessfulChop:v9];
  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v5, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  id v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = NSStringFromBOOL();
    int v14 = 136315650;
    __int16 v15 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    __int16 v16 = 2114;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - found item: %{public}@ - error:%@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = [v7 model];

  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v5);
}

void __93__BCSBusinessQueryController_fetchLinkItemModelWithURL_chopURL_forClientBundleID_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = NSStringFromBOOL();
    *(_DWORD *)long long buf = 136315650;
    __int16 v17 = "-[BCSBusinessQueryController fetchLinkItemModelWithURL:chopURL:forClientBundleID:completion:]_block_invoke";
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s - Using extracted URL. Found link item? : %{public}@ - error:%@", buf, 0x20u);
  }
  if (v5)
  {
    uint64_t v9 = [*(id *)(a1 + 32) timingMeasurement];
    [v9 end];

    [*(id *)(a1 + 32) setSuccessfulChop:6];
    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
    [*(id *)(a1 + 32) submitForPostProcessing];
    id v10 = objc_msgSend(*(id *)(a1 + 40), "absoluteString", @"BCSBusinessQueryServicePatternMatchingExtractedURL");
    __int16 v15 = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v5 setDebugInfo:v11];

    uint64_t v12 = *(void *)(a1 + 48);
    int v13 = [v5 model];
    (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v6);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)isBusinessRegisteredForURL:(id)a3 chopURL:(BOOL)a4 forClientBundleID:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = ABSLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v35 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v12)
  {
    uint64_t v14 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v10);
    if (v14)
    {
      if (self) {
        metricFactory = self->_metricFactory;
      }
      else {
        metricFactory = 0;
      }
      __int16 v16 = metricFactory;
      __int16 v17 = [(BCSMetricFactoryProtocol *)v16 businessLinkRegisteredMetricForItemIdentifier:v14];

      [v17 setChoppingEnabled:v8];
      if (self) {
        __int16 v18 = self->_metricFactory;
      }
      else {
        __int16 v18 = 0;
      }
      id v19 = v18;
      __int16 v20 = [(BCSMetricFactoryProtocol *)v19 measurementFactory];
      id v21 = [v20 itemIsRegisteredTimingMeasurementForItemIdentifier:v14];
      [v17 setTimingMeasurement:v21];

      uint64_t v22 = [v17 timingMeasurement];
      [v22 begin];

      id v23 = [[BCSQuery alloc] initWithItemIdentifier:v14 clientBundleId:v11 shardType:3];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke;
      v26[3] = &unk_264249378;
      id v27 = v14;
      __int16 v28 = self;
      id v29 = v10;
      id v30 = v11;
      id v31 = v17;
      id v32 = v12;
      BOOL v33 = v8;
      id v24 = v17;
      [(BCSBusinessQueryController *)self fetchShardWithQuery:v23 completion:v26];
    }
    else
    {
      char v25 = ABSLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v35 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]";
        _os_log_impl(&dword_2154F4000, v25, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given URL", buf, 0xCu);
      }

      (*((void (**)(id, void, void, void, void))v12 + 2))(v12, 0, 0, 0, 0);
    }
  }
}

void __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = ABSLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromBOOL();
    *(_DWORD *)long long buf = 136315394;
    id v30 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v7;
    _os_log_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEFAULT, "%s Domain shard lookup returned :%@", buf, 0x16u);
  }
  BOOL v8 = *(void **)(a1 + 40);
  if (v5)
  {
    if (v8) {
      BOOL v8 = (void *)v8[30];
    }
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_33;
    v21[3] = &unk_264249350;
    id v11 = &v22;
    id v22 = *(id *)(a1 + 64);
    id v23 = v4;
    id v12 = *(id *)(a1 + 72);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void **)(a1 + 48);
    id v27 = v12;
    uint64_t v24 = v13;
    id v25 = v14;
    char v28 = *(unsigned char *)(a1 + 80);
    id v26 = *(id *)(a1 + 56);
    [v8 matchPatternForURL:v9 forClientBundleID:v10 completion:v21];
  }
  else
  {
    int v15 = *(unsigned __int8 *)(a1 + 80);
    __int16 v16 = *(void **)(a1 + 48);
    __int16 v17 = *(void **)(a1 + 56);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_2;
    v19[3] = &unk_264249328;
    id v11 = &v20;
    __int16 v18 = *(void **)(a1 + 64);
    id v20 = *(id *)(a1 + 72);
    -[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]((id *)v8, v16, v15, v17, v18, v19);
  }
}

void __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_33(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromBOOL();
    *(_DWORD *)long long buf = 136315650;
    id v21 = "-[BCSBusinessQueryController isBusinessRegisteredForURL:chopURL:forClientBundleID:completion:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s Pattern matcher returned matchFound: %@, matchingBundleID: %@", buf, 0x20u);
  }
  if (a2)
  {
    id v12 = [*(id *)(a1 + 32) timingMeasurement];
    [v12 end];

    [*(id *)(a1 + 32) setSuccessfulChop:6];
    objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(*(id *)(a1 + 40), "code"));
    [*(id *)(a1 + 32) submitForPostProcessing];
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v13 = *(id **)(a1 + 48);
    uint64_t v14 = *(void **)(a1 + 56);
    int v15 = *(unsigned __int8 *)(a1 + 80);
    __int16 v16 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_34;
    v18[3] = &unk_264249328;
    __int16 v17 = *(void **)(a1 + 64);
    id v19 = *(id *)(a1 + 72);
    -[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:](v13, v14, v15, v17, v16, v18);
  }
}

uint64_t __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)lookupBloomFiltersForURL:(int)a3 chopURL:(void *)a4 forClientBundleID:(void *)a5 registeredMetric:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    int v15 = +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v11);
    if (a3)
    {
      id v16 = a1[23];
      unint64_t v17 = -[BCSBusinessQueryController _isBloomFilterCachedForType:](a1, [v15 type]);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke;
      v23[3] = &unk_2642493A0;
      __int16 v24 = (BCSQuery *)v13;
      id v25 = v14;
      [v16 queryChopperDelegate:a1 isBusinessRegisteredForURL:v11 isBloomFilterCached:v17 forClientBundleID:v12 metric:v24 completion:v23];

      __int16 v18 = v24;
    }
    else
    {
      __int16 v18 = [[BCSQuery alloc] initWithItemIdentifier:v15 clientBundleId:v12 shardType:2];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke_37;
      v19[3] = &unk_2642493C8;
      id v20 = v13;
      char v22 = 0;
      id v21 = v14;
      [a1 fetchIsBusinessRegisteredWithQuery:v18 completion:v19];
    }
  }
}

uint64_t __94__BCSBusinessQueryController_isBusinessRegisteredForURL_chopURL_forClientBundleID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = [v7 timingMeasurement];
  [v9 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  uint64_t v10 = ABSLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromBOOL();
    int v12 = 136315650;
    id v13 = "-[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]_block_invoke";
    __int16 v14 = 2114;
    int v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEFAULT, "%s - returned %{public}@ - error:%@", (uint8_t *)&v12, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __109__BCSBusinessQueryController_lookupBloomFiltersForURL_chopURL_forClientBundleID_registeredMetric_completion___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  if ([v5 hasBusiness]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  [*(id *)(a1 + 32) setSuccessfulChop:v8];
  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  id v9 = ABSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v5 hasBusiness];
    uint64_t v10 = NSStringFromBOOL();
    int v11 = 136315650;
    int v12 = "-[BCSBusinessQueryController lookupBloomFiltersForURL:chopURL:forClientBundleID:registeredMetric:completion:]_block_invoke";
    __int16 v13 = 2114;
    __int16 v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s - returned %{public}@ - error:%@", (uint8_t *)&v11, 0x20u);
  }
  if (([v5 hasBusiness] & 1) != 0 || !*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void, uint64_t, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v5 hasBusiness], 0, v6);
  }
}

- (void)fetchLinkItemModelWithHash:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v38 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    int v12 = +[BCSLinkItemIdentifier identifierWithHash:]((uint64_t)BCSLinkItemIdentifier, v8);
    if (v12)
    {
      if (self) {
        metricFactory = self->_metricFactory;
      }
      else {
        metricFactory = 0;
      }
      __int16 v14 = metricFactory;
      __int16 v15 = [(BCSMetricFactoryProtocol *)v14 businessLinkHashFetchMetricForItemIdentifier:v12];

      if (self) {
        id v16 = self->_metricFactory;
      }
      else {
        id v16 = 0;
      }
      uint64_t v17 = v16;
      uint64_t v18 = [(BCSMetricFactoryProtocol *)v17 measurementFactory];
      id v19 = [v18 businessLinkFetchByHashTimingMeasurementForItemIdentifier:v12];
      [v15 setTimingMeasurement:v19];

      id v20 = [v15 timingMeasurement];
      [v20 begin];

      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke;
      v34[3] = &unk_2642492B0;
      id v21 = v15;
      id v35 = v21;
      id v36 = v10;
      char v22 = (void (**)(void, void, void))MEMORY[0x2166BDB40](v34);
      if (self) {
        id v23 = self->_metricFactory;
      }
      else {
        id v23 = 0;
      }
      __int16 v24 = [(BCSMetricFactoryProtocol *)v23 measurementFactory];
      id v25 = [v24 itemCacheHitMeasurementForItemIdentifier:v12];

      uint64_t v26 = -[BCSBusinessQueryController _itemResolverForType:]((uint64_t)self, (char *)[v12 type]);
      id v27 = [v26 cachedItemMatching:v12];

      if (v27)
      {
        char v28 = ABSLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = NSStringFromBCSType([v12 type]);
          *(_DWORD *)long long buf = 136315394;
          id v38 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
          __int16 v39 = 2112;
          id v40 = v29;
          _os_log_impl(&dword_2154F4000, v28, OS_LOG_TYPE_DEFAULT, "%s - Returned cached item - type: %@", buf, 0x16u);
        }
        [v25 setFlag:1];
        ((void (**)(void, void *, void))v22)[2](v22, v27, 0);
      }
      else
      {
        [v25 setFlag:0];
        __int16 v31 = [[BCSQuery alloc] initWithItemIdentifier:v12 clientBundleId:v9 shardType:2 skipRegistrationCheck:1];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke_39;
        v32[3] = &unk_2642493F0;
        uint64_t v33 = v22;
        [(BCSBusinessQueryController *)self fetchItemWithQuery:v31 completion:v32];
      }
    }
    else
    {
      id v30 = ABSLogCommon();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        id v38 = "-[BCSBusinessQueryController fetchLinkItemModelWithHash:forClientBundleID:completion:]";
        _os_log_impl(&dword_2154F4000, v30, OS_LOG_TYPE_DEFAULT, "%s can't generate a BCSLinkItemIdentifier with the given hash", buf, 0xCu);
      }

      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
}

void __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 timingMeasurement];
  [v8 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [v7 model];

  (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v6);
}

- (char)_itemResolverForType:(uint64_t)a1
{
  if (a1)
  {
    if ((unint64_t)(a2 - 1) <= 3) {
      a2 = (char *)*(id *)(a1 + 24 * (void)(a2 - 1) + 48);
    }
  }
  else
  {
    a2 = 0;
  }
  return a2;
}

uint64_t __86__BCSBusinessQueryController_fetchLinkItemModelWithHash_forClientBundleID_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchConfigForQuery:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v33 = "-[BCSBusinessQueryController fetchConfigForQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v9 = [v6 config];

  if (v9)
  {
    id v10 = ABSLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_2154F4000, v10, OS_LOG_TYPE_DEBUG, "Returning config cached in query", buf, 2u);
    }

    id v11 = [v6 config];
    v7[2](v7, v11, 0);
  }
  else
  {
    if (self) {
      metricFactory = self->_metricFactory;
    }
    else {
      metricFactory = 0;
    }
    __int16 v13 = metricFactory;
    __int16 v14 = [v6 itemIdentifier];
    __int16 v15 = -[BCSMetricFactoryProtocol configResolutionMetricForConfigType:](v13, "configResolutionMetricForConfigType:", [v14 type]);

    if (self) {
      id v16 = self->_metricFactory;
    }
    else {
      id v16 = 0;
    }
    uint64_t v17 = v16;
    id v18 = [(BCSMetricFactoryProtocol *)v17 measurementFactory];
    id v19 = [v6 itemIdentifier];
    id v20 = objc_msgSend(v18, "configResolutionTimingMeasurementForConfigType:", objc_msgSend(v19, "type"));
    [v15 setTimingMeasurement:v20];

    id v21 = [v15 timingMeasurement];
    [v21 begin];

    char v22 = [v6 itemIdentifier];
    uint64_t v23 = [v22 type];
    if (self)
    {
      if ((unint64_t)(v23 - 1) <= 3) {
        id v18 = *((id *)&self->_cacheClearer + 3 * v23);
      }
    }
    else
    {
      id v18 = 0;
    }
    __int16 v24 = [v6 itemIdentifier];
    uint64_t v25 = [v24 type];
    uint64_t v26 = [v6 clientBundleId];
    uint64_t v27 = [v6 cacheOnly];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __61__BCSBusinessQueryController_fetchConfigForQuery_completion___block_invoke;
    v28[3] = &unk_264249418;
    id v29 = v15;
    id v30 = v6;
    __int16 v31 = v7;
    id v11 = v15;
    [v18 configItemWithType:v25 clientBundleID:v26 cacheOnly:v27 metric:v11 completion:v28];
  }
}

void __61__BCSBusinessQueryController_fetchConfigForQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  if (!v5 || v6)
  {
    id v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) itemIdentifier];
      id v10 = NSStringFromBCSType([v9 type]);
      *(_DWORD *)long long buf = 136315394;
      id v16 = "-[BCSBusinessQueryController fetchConfigForQuery:completion:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - Fetch config failed - type: %@", buf, 0x16u);
    }
    if (!v6)
    {
      id v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08320];
      __int16 v14 = @"Nil configItem & nil fetchConfigError";
      int v12 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v6 = [v11 errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v12];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) updateConfig:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)fetchShardWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke;
  v11[3] = &unk_264249468;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [(BCSBusinessQueryController *)self fetchConfigForQuery:v9 completion:v11];
}

void __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  if (v5 | a3)
  {
    if ([*(id *)(a1 + 32) shardType] == 3) {
      uint64_t v8 = [(id)v5 domainShardCount];
    }
    else {
      uint64_t v8 = [(id)v5 filterShardCount];
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) itemIdentifier];
    int64_t v12 = -[BCSBusinessQueryController _shardStartIndexForItemIdentifier:shardType:shardCount:](v10, v11, [*(id *)(a1 + 32) shardType], v9);

    id v7 = +[BCSShardIdentifier identifierWithType:startIndex:shardCount:]((uint64_t)BCSShardIdentifier, [*(id *)(a1 + 32) shardType], v12, v9);
    uint64_t v13 = ABSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [*(id *)(a1 + 32) shardType];
      *(_DWORD *)long long buf = 136316162;
      uint64_t v33 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]_block_invoke";
      __int16 v34 = 2112;
      id v35 = v7;
      __int16 v36 = 2112;
      unint64_t v37 = v5;
      __int16 v38 = 2048;
      uint64_t v39 = v14;
      __int16 v40 = 2048;
      uint64_t v41 = v9;
      _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "%s Shard Identifier: %@ ConfigItem %@ type %ld Shard Count %lld", buf, 0x34u);
    }

    __int16 v15 = *(void **)(a1 + 40);
    if (v15) {
      __int16 v15 = (void *)v15[25];
    }
    id v16 = v15;
    uint64_t v17 = [v16 shardResolutionMetricForShardIdentifier:v7];

    id v18 = *(void **)(a1 + 40);
    if (v18) {
      id v18 = (void *)v18[25];
    }
    uint64_t v19 = v18;
    id v20 = [v19 measurementFactory];
    id v21 = [v20 shardResolutionTimingMeasurementForShardIdentifier:v7];
    [v17 setTimingMeasurement:v21];

    char v22 = [v17 timingMeasurement];
    [v22 begin];

    uint64_t v23 = *(void *)(a1 + 40);
    __int16 v24 = [*(id *)(a1 + 32) itemIdentifier];
    uint64_t v25 = -[BCSBusinessQueryController _shardResolverForType:](v23, (char *)[v24 type]);
    uint64_t v26 = [*(id *)(a1 + 32) clientBundleId];
    uint64_t v27 = [*(id *)(a1 + 32) cacheOnly];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke_50;
    v29[3] = &unk_264249440;
    id v30 = v17;
    id v31 = *(id *)(a1 + 48);
    id v28 = v17;
    [v25 shardItemMatching:v7 clientBundleID:v26 cacheOnly:v27 metric:v28 completion:v29];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"Config not found"];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

- (uint64_t)_shardStartIndexForItemIdentifier:(uint64_t)a3 shardType:(uint64_t)a4 shardCount:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (a1)
  {
    if (a4)
    {
      if (0x7FFFFFFFFFFFFFFFLL / a4 <= 25000) {
        uint64_t v8 = 25000;
      }
      else {
        uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL / a4;
      }
      if (a3 == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v7)
        {
          int64_t v9 = *((void *)v7 + 3);
          if (!v9)
          {
            int64_t v9 = -[BCSLinkItemIdentifier _truncatedDomainHashForNormalizedURL:]((int64_t)v7, *((void **)v7 + 2));
            *((void *)v7 + 3) = v9;
          }
        }
        else
        {
          int64_t v9 = 0;
        }
      }
      else
      {
        int64_t v9 = [v7 truncatedHash];
      }
      uint64_t v10 = v9 / v8;
    }
    else
    {
      id v11 = ABSLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[BCSBusinessQueryController _shardStartIndexForItemIdentifier:shardType:shardCount:]";
        _os_log_error_impl(&dword_2154F4000, v11, OS_LOG_TYPE_ERROR, "%s - Shard value should not be 0", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (char)_shardResolverForType:(uint64_t)a1
{
  if (a1)
  {
    if ((unint64_t)(a2 - 1) <= 3) {
      a2 = (char *)*(id *)(a1 + 24 * (void)(a2 - 1) + 64);
    }
  }
  else
  {
    a2 = 0;
  }
  return a2;
}

void __61__BCSBusinessQueryController_fetchShardWithQuery_completion___block_invoke_50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  if (!v5 || v6)
  {
    uint64_t v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      uint64_t v14 = "-[BCSBusinessQueryController fetchShardWithQuery:completion:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = @"Fetch shard item failed";
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    if (!v6)
    {
      int64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08320];
      int64_t v12 = @"Nil shardItem & nil fetchShardError";
      uint64_t v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v6 = [v9 errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v10];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchShardsWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[BCSBusinessQueryController fetchShardsWithQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__BCSBusinessQueryController_fetchShardsWithQuery_completion___block_invoke;
  v11[3] = &unk_264249468;
  int v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [(BCSBusinessQueryController *)self fetchConfigForQuery:v9 completion:v11];
}

void __62__BCSBusinessQueryController_fetchShardsWithQuery_completion___block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  if (v5 | a3)
  {
    id v8 = objc_alloc(MEMORY[0x263EFF9C0]);
    id v9 = [a1[4] itemIdentifiers];
    id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v11 = [a1[4] itemIdentifiers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v50;
      while (1)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = -[BCSBusinessQueryController _shardIdentifierForQuery:withItemIdentifier:](a1[5], a1[4]);
        [v10 addObject:v15];

        if (!--v13)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v49 objects:v63 count:16];
          if (!v13) {
            break;
          }
        }
      }
    }

    uint64_t v16 = [a1[4] shardType];
    uint64_t v17 = [a1[4] config];
    id v18 = v17;
    if (v16 == 3) {
      uint64_t v19 = [v17 domainShardCount];
    }
    else {
      uint64_t v19 = [v17 filterShardCount];
    }
    uint64_t v20 = v19;

    id v21 = [v10 allObjects];
    char v22 = [v21 firstObject];

    id v23 = a1[4];
    __int16 v24 = [v10 allObjects];
    [v23 setShardIdentifiers:v24];

    uint64_t v25 = ABSLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v10 count];
      uint64_t v27 = [a1[4] shardType];
      *(_DWORD *)long long buf = 136316162;
      id v54 = "-[BCSBusinessQueryController fetchShardsWithQuery:completion:]_block_invoke";
      __int16 v55 = 2048;
      uint64_t v56 = v26;
      __int16 v57 = 2112;
      unint64_t v58 = v5;
      __int16 v59 = 2048;
      uint64_t v60 = v27;
      __int16 v61 = 2048;
      uint64_t v62 = v20;
      _os_log_impl(&dword_2154F4000, v25, OS_LOG_TYPE_DEFAULT, "%s Shard Identifiers: %ld ConfigItem %@ type %ld Shard Count %lld", buf, 0x34u);
    }

    id v28 = a1[5];
    if (v28) {
      id v28 = (void *)v28[25];
    }
    id v29 = v28;
    id v30 = [v29 shardResolutionMetricForShardIdentifier:v22];

    id v31 = a1[5];
    if (v31) {
      id v31 = (void *)v31[25];
    }
    id v32 = v31;
    uint64_t v33 = [v32 measurementFactory];
    __int16 v34 = [v33 shardResolutionTimingMeasurementForShardIdentifier:v22];
    [v30 setTimingMeasurement:v34];

    id v35 = [v30 timingMeasurement];
    [v35 begin];

    uint64_t v36 = (uint64_t)a1[5];
    unint64_t v37 = [a1[4] itemIdentifiers];
    __int16 v38 = [v37 firstObject];
    uint64_t v39 = -[BCSBusinessQueryController _shardResolverForType:](v36, (char *)[v38 type]);
    id v40 = a1[4];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __62__BCSBusinessQueryController_fetchShardsWithQuery_completion___block_invoke_59;
    v44[3] = &unk_264249490;
    id v45 = v30;
    id v48 = a1[6];
    id v41 = a1[4];
    id v42 = a1[5];
    id v46 = v41;
    id v47 = v42;
    id v43 = v30;
    [v39 shardItemsMatching:v40 metric:v43 completion:v44];
  }
  else
  {
    id v6 = (void (**)(id, void, void *))a1[6];
    id v7 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"Config not found"];
    v6[2](v6, 0, v7);
  }
}

- (id)_shardIdentifierForQuery:(void *)a1 withItemIdentifier:(void *)a2
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 shardType];
    id v6 = [v4 config];
    id v7 = v6;
    if (v5 == 3) {
      uint64_t v8 = [v6 domainShardCount];
    }
    else {
      uint64_t v8 = [v6 filterShardCount];
    }
    uint64_t v9 = v8;

    id v10 = [v4 itemIdentifier];
    int64_t v11 = -[BCSBusinessQueryController _shardStartIndexForItemIdentifier:shardType:shardCount:]((uint64_t)a1, v10, [v4 shardType], v9);

    a1 = +[BCSShardIdentifier identifierWithType:startIndex:shardCount:]((uint64_t)BCSShardIdentifier, [v4 shardType], v11, v9);
  }

  return a1;
}

void __62__BCSBusinessQueryController_fetchShardsWithQuery_completion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  uint64_t v8 = [v5 count];
  if (v6 || !v8)
  {
    uint64_t v19 = ABSLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v30 = "-[BCSBusinessQueryController fetchShardsWithQuery:completion:]_block_invoke";
      __int16 v31 = 2112;
      id v32 = @"Fetch shard item failed";
      _os_log_impl(&dword_2154F4000, v19, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    if (!v6)
    {
      uint64_t v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      id v28 = @"Nil results & nil fetchShardError";
      id v21 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v6 = [v20 errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v21];
    }
    id v18 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "itemIdentifiers", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          __int16 v15 = -[BCSBusinessQueryController _shardIdentifierForQuery:withItemIdentifier:](*(void **)(a1 + 48), *(void **)(a1 + 40));
          uint64_t v16 = [v5 objectForKeyedSubscript:v15];
          [v6 setObject:v16 forKeyedSubscript:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v17 = ABSLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = (const char *)v6;
      _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "Fetched shards: %@", buf, 0xCu);
    }

    id v18 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  }
  v18();
}

- (void)fetchIsBusinessRegisteredWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke;
  v11[3] = &unk_264249468;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [(BCSBusinessQueryController *)self fetchConfigForQuery:v9 completion:v11];
}

void __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
    uint64_t v8 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:0];
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"Config not found"];
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, void *))(v9 + 16))(v9, v8, v10);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v8 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) skipRegistrationCheck])
  {
    uint64_t v11 = ABSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "Skipping registration check", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = [BCSBusinessLookupResult alloc];
    id v14 = [*(id *)(a1 + 32) itemIdentifier];
    __int16 v15 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:](v13, "initWithHasBusiness:matchingTruncatedHash:config:", 1, [v14 truncatedHash], v5);
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, void))(v12 + 16))(v12, v15, 0);
  }
  else
  {
    [*(id *)(a1 + 32) updateConfig:v5];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke_66;
    v18[3] = &unk_2642494B8;
    id v19 = (id)v5;
    id v21 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 32);
    [v16 fetchShardWithQuery:v17 completion:v18];
  }
LABEL_6:
}

void __76__BCSBusinessQueryController_fetchIsBusinessRegisteredWithQuery_completion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v11 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:*(void *)(a1 + 32)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_9:

    goto LABEL_10;
  }
  if (([v5 conformsToProtocol:&unk_26C62D518] & 1) == 0)
  {
    uint64_t v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v20 = "-[BCSBusinessQueryController fetchIsBusinessRegisteredWithQuery:completion:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "%s Expected shardItem that confirms to BCSFilterShardItemProtocol protocol but got %@", buf, 0x16u);
    }

    uint64_t v11 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    id v18 = @"Unexpected shard item";
    __int16 v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"com.apple.businessservices" code:100 userInfo:v15];
    (*(void (**)(uint64_t, BCSBusinessLookupResult *, void *))(v13 + 16))(v13, v11, v16);

    goto LABEL_9;
  }
  uint64_t v8 = [*(id *)(a1 + 40) itemIdentifier];
  uint64_t v9 = [v5 containsItemMatching:v8];

  id v10 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", [v9 hasMatch], objc_msgSend(v9, "matchingTruncatedHash"), *(void *)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_10:
}

- (void)fetchAreBusinessesRegisteredWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v16 = "-[BCSBusinessQueryController fetchAreBusinessesRegisteredWithQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BCSBusinessQueryController_fetchAreBusinessesRegisteredWithQuery_completion___block_invoke;
  v11[3] = &unk_264249468;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [(BCSBusinessQueryController *)self fetchConfigForQuery:v9 completion:v11];
}

void __79__BCSBusinessQueryController_fetchAreBusinessesRegisteredWithQuery_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v36[1] = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
    uint64_t v8 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:0];
    uint64_t v9 = *(void *)(a1 + 48);
    v36[0] = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
    uint64_t v11 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"Config not found"];
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    uint64_t v8 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:v5];
    uint64_t v12 = *(void *)(a1 + 48);
    id v35 = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v10, v7);
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) skipRegistrationCheck])
  {
    uint64_t v13 = ABSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2154F4000, v13, OS_LOG_TYPE_DEFAULT, "Skipping registration check", buf, 2u);
    }

    id v14 = objc_alloc(MEMORY[0x263EFF980]);
    __int16 v15 = [*(id *)(a1 + 32) itemIdentifiers];
    uint64_t v8 = (BCSBusinessLookupResult *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v24 = a1;
    uint64_t v16 = [*(id *)(a1 + 32) itemIdentifiers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = -[BCSBusinessLookupResult initWithHasBusiness:matchingTruncatedHash:config:]([BCSBusinessLookupResult alloc], "initWithHasBusiness:matchingTruncatedHash:config:", 1, [*(id *)(*((void *)&v29 + 1) + 8 * i) truncatedHash], v5);
          [(BCSBusinessLookupResult *)v8 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v18);
    }

    (*(void (**)(void))(*(void *)(v24 + 48) + 16))();
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 32);
    id v22 = *(void **)(a1 + 40);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __79__BCSBusinessQueryController_fetchAreBusinessesRegisteredWithQuery_completion___block_invoke_138;
    v25[3] = &unk_2642494E0;
    uint64_t v26 = (BCSBusinessLookupResult *)(id)v5;
    id v28 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 32);
    [v22 fetchShardsWithQuery:v23 completion:v25];

    uint64_t v8 = v26;
  }
LABEL_6:
}

void __79__BCSBusinessQueryController_fetchAreBusinessesRegisteredWithQuery_completion___block_invoke_138(uint64_t a1, void *a2, void *a3)
{
  v42[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v10 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:*(void *)(a1 + 32)];
    uint64_t v19 = *(void *)(a1 + 48);
    v42[0] = v10;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
    (*(void (**)(uint64_t, void *, void *))(v19 + 16))(v19, v20, v7);
  }
  else
  {
    id v28 = 0;
    id v8 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v9 = [*(id *)(a1 + 40) itemIdentifiers];
    id v10 = (BCSBusinessLookupResult *)objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [*(id *)(a1 + 40) itemIdentifiers];
    uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v5, "objectForKeyedSubscript:", v15, v28);
          if (([v16 conformsToProtocol:&unk_26C62D518] & 1) == 0)
          {
            __int16 v21 = ABSLogCommon();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315394;
              __int16 v38 = "-[BCSBusinessQueryController fetchAreBusinessesRegisteredWithQuery:completion:]_block_invoke";
              __int16 v39 = 2112;
              id v40 = v16;
              _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "%s Expected shardItem that confirms to BCSFilterShardItemProtocol protocol but got %@", buf, 0x16u);
            }

            id v22 = [[BCSBusinessLookupResult alloc] initWithHasBusiness:0 matchingTruncatedHash:0 config:*(void *)(a1 + 32)];
            uint64_t v23 = *(void *)(a1 + 48);
            uint64_t v36 = v22;
            uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
            long long v25 = (void *)MEMORY[0x263F087E8];
            uint64_t v34 = *MEMORY[0x263F08320];
            id v35 = @"Unexpected shard item";
            uint64_t v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            id v27 = [v25 errorWithDomain:@"com.apple.businessservices" code:100 userInfo:v26];
            (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v24, v27);

            goto LABEL_16;
          }
          uint64_t v17 = [v16 containsItemMatching:v15];
          uint64_t v18 = [[BCSBusinessLookupResult alloc] initWithFilterMatchResult:v17 config:*(void *)(a1 + 32)];
          [(BCSBusinessLookupResult *)v10 addObject:v18];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
    id v7 = v28;
  }
}

- (void)fetchItemWithQuery:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v26 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self) {
    metricFactory = self->_metricFactory;
  }
  else {
    metricFactory = 0;
  }
  id v10 = metricFactory;
  uint64_t v11 = [(BCSMetricFactoryProtocol *)v10 measurementFactory];
  uint64_t v12 = [v6 itemIdentifier];

  uint64_t v13 = [v11 itemCacheHitMeasurementForItemIdentifier:v12];

  id v14 = [v6 itemIdentifier];
  uint64_t v15 = -[BCSBusinessQueryController _itemResolverForType:]((uint64_t)self, (char *)[v14 type]);
  uint64_t v16 = [v6 itemIdentifier];
  uint64_t v17 = [v15 cachedItemMatching:v16];

  if (v17)
  {
    uint64_t v18 = ABSLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [v6 itemIdentifier];
      id v20 = NSStringFromBCSType([v19 type]);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v26 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]";
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEFAULT, "%s - Returned cached item - type: %@", buf, 0x16u);
    }
    [v13 setFlag:1];
    v7[2](v7, v17, 0);
  }
  else
  {
    [v13 setFlag:0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke;
    v21[3] = &unk_264249508;
    uint64_t v24 = v7;
    id v22 = v6;
    uint64_t v23 = self;
    [(BCSBusinessQueryController *)self fetchIsBusinessRegisteredWithQuery:v22 completion:v21];
  }
}

void __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_19;
  }
  if (([v5 hasBusiness] & 1) == 0)
  {
    id v28 = ABSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = [*(id *)(a1 + 32) itemIdentifier];
      id v35 = NSStringFromBCSType([v34 type]);
      *(_DWORD *)long long buf = 136315394;
      id v42 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      __int16 v43 = 2112;
      v44 = v35;
      _os_log_error_impl(&dword_2154F4000, v28, OS_LOG_TYPE_ERROR, "%s - Hash is not in bloom filter - type: %@", buf, 0x16u);
    }
    uint64_t v29 = *(void *)(a1 + 48);
    long long v30 = @"Item not found";
    uint64_t v31 = 42;
    goto LABEL_18;
  }
  id v7 = [v6 config];

  if (!v7)
  {
    long long v32 = ABSLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v36 = [*(id *)(a1 + 32) itemIdentifier];
      unint64_t v37 = NSStringFromBCSType([v36 type]);
      *(_DWORD *)long long buf = 136315394;
      id v42 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      __int16 v43 = 2112;
      v44 = v37;
      _os_log_error_impl(&dword_2154F4000, v32, OS_LOG_TYPE_ERROR, "%s - Failed fetching config of type: %@", buf, 0x16u);
    }
    uint64_t v29 = *(void *)(a1 + 48);
    long long v30 = @"Config not found";
    uint64_t v31 = 100;
LABEL_18:
    long long v33 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:v31 errorDescription:v30];
    (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v33);

    goto LABEL_19;
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 config];
  [v8 updateConfig:v9];

  id v10 = [*(id *)(a1 + 32) itemIdentifier];
  LODWORD(v9) = [v10 conformsToProtocol:&unk_26C62ECA0];

  if (v9)
  {
    uint64_t v11 = [*(id *)(a1 + 32) itemIdentifier];
    objc_msgSend(v11, "setMatchingTruncatedHash:", objc_msgSend(v6, "matchingTruncatedHash"));
  }
  uint64_t v12 = *(void **)(a1 + 40);
  if (v12) {
    uint64_t v12 = (void *)v12[25];
  }
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = v12;
  uint64_t v15 = [v13 itemIdentifier];
  uint64_t v16 = [v14 itemResolutionMetricForItemIdentifier:v15];

  uint64_t v17 = *(void **)(a1 + 40);
  if (v17) {
    uint64_t v17 = (void *)v17[25];
  }
  uint64_t v18 = v17;
  uint64_t v19 = [v18 measurementFactory];
  id v20 = [*(id *)(a1 + 32) itemIdentifier];
  __int16 v21 = [v19 itemResolutionTimingMeasurementForItemIdentifier:v20];
  [v16 setTimingMeasurement:v21];

  id v22 = [v16 timingMeasurement];
  [v22 begin];

  uint64_t v23 = *(void *)(a1 + 40);
  uint64_t v24 = [*(id *)(a1 + 32) itemIdentifier];
  long long v25 = -[BCSBusinessQueryController _itemResolverForType:](v23, (char *)[v24 type]);
  uint64_t v26 = *(void *)(a1 + 32);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke_161;
  v38[3] = &unk_264249288;
  id v39 = v16;
  id v40 = *(id *)(a1 + 48);
  id v27 = v16;
  [v25 itemMatching:v26 metric:v27 completion:v38];

LABEL_19:
}

void __60__BCSBusinessQueryController_fetchItemWithQuery_completion___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  if (!v5 || v6)
  {
    id v8 = ABSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v14 = "-[BCSBusinessQueryController fetchItemWithQuery:completion:]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = @"Fetch item failed";
      _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
    }

    if (!v6)
    {
      uint64_t v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08320];
      uint64_t v12 = @"Nil item & nil fetchItemError";
      id v10 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v6 = [v9 errorWithDomain:@"com.apple.businessservices" code:40 userInfo:v10];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)fetchItemsWithQuery:(id)a3 perItemCompletion:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v39 = (void (**)(id, void *, void *, void))a4;
  id v36 = a5;
  uint64_t v9 = ABSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v51 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]";
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v10 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v11 = [v8 itemIdentifiers];
  uint64_t v12 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v37 = v8;
  uint64_t v13 = v8;
  id v14 = (void *)v12;
  __int16 v15 = [v13 itemIdentifiers];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v46 objects:v54 count:16];
  __int16 v38 = (void *)v12;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v47 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        __int16 v21 = -[BCSBusinessQueryController _itemResolverForType:]((uint64_t)self, (char *)objc_msgSend(v20, "type", v36));
        id v22 = [v21 cachedItemMatching:v20];

        if (v22)
        {
          uint64_t v23 = ABSLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = NSStringFromBCSType([v20 type]);
            *(_DWORD *)long long buf = 136315394;
            long long v51 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]";
            __int16 v52 = 2112;
            v53 = v24;
            _os_log_impl(&dword_2154F4000, v23, OS_LOG_TYPE_DEFAULT, "%s - Found cached item - type: %@", buf, 0x16u);

            id v14 = v38;
          }

          v39[2](v39, v20, v22, 0);
        }
        else
        {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    long long v25 = [BCSBatchQuery alloc];
    uint64_t v26 = [v14 allObjects];
    id v27 = v37;
    id v28 = [v37 config];
    uint64_t v29 = [v37 clientBundleId];
    long long v30 = -[BCSBatchQuery initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:](v25, "initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:", v26, v28, v29, [v37 shardType], objc_msgSend(v37, "skipRegistrationCheck"));

    id v14 = v38;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke;
    v40[3] = &unk_2642495D0;
    id v41 = v37;
    uint64_t v31 = v36;
    id v44 = v36;
    long long v32 = v39;
    uint64_t v45 = v39;
    id v42 = v38;
    __int16 v43 = self;
    [(BCSBusinessQueryController *)self fetchAreBusinessesRegisteredWithQuery:v30 completion:v40];
  }
  else
  {
    long long v33 = ABSLogCommon();
    id v27 = v37;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v34 = [v37 itemIdentifier];
      id v35 = NSStringFromBCSType([v34 type]);
      *(_DWORD *)long long buf = 136315394;
      long long v51 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]";
      __int16 v52 = 2112;
      v53 = v35;
      _os_log_impl(&dword_2154F4000, v33, OS_LOG_TYPE_DEFAULT, "%s - No more items to fetch - type: %@", buf, 0x16u);

      id v14 = v38;
    }

    uint64_t v31 = v36;
    (*((void (**)(id, void))v36 + 2))(v36, 0);
    long long v32 = v39;
  }
}

void __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v71 = [*(id *)(a1 + 32) itemIdentifier];
      id v72 = NSStringFromBCSType([v71 type]);
      *(_DWORD *)long long buf = 136315394;
      v100 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]_block_invoke";
      __int16 v101 = 2112;
      v102 = v72;
      _os_log_error_impl(&dword_2154F4000, v7, OS_LOG_TYPE_ERROR, "%s - Error fetching business registration - type: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    uint64_t v8 = [v5 countByEnumeratingWithState:&v93 objects:v98 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v94;
      do
      {
        uint64_t v11 = v5;
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v94 != v10) {
            objc_enumerationMutation(v11);
          }
          uint64_t v13 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          if (([v13 hasBusiness] & 1) == 0)
          {
            id v14 = ABSLogCommon();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = [v13 itemIdentifier];
              uint64_t v24 = NSStringFromBCSType([v23 type]);
              *(_DWORD *)long long buf = 136315394;
              v100 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]_block_invoke";
              __int16 v101 = 2112;
              v102 = v24;
              _os_log_error_impl(&dword_2154F4000, v14, OS_LOG_TYPE_ERROR, "%s - Hash is not in bloom filter - type: %@", buf, 0x16u);
            }
            uint64_t v15 = *(void *)(a1 + 64);
            uint64_t v16 = [v13 itemIdentifier];
            uint64_t v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"Item not found"];
            (*(void (**)(uint64_t, void *, void, void *))(v15 + 16))(v15, v16, 0, v17);

            uint64_t v18 = *(void **)(a1 + 40);
            uint64_t v19 = [v13 itemIdentifier];
            [v18 removeObject:v19];
          }
          id v20 = [v13 itemIdentifier];
          int v21 = [v20 conformsToProtocol:&unk_26C62ECA0];

          if (v21)
          {
            id v22 = [v13 itemIdentifier];
            objc_msgSend(v22, "setMatchingTruncatedHash:", objc_msgSend(v13, "matchingTruncatedHash"));
          }
        }
        id v5 = v11;
        uint64_t v9 = [v11 countByEnumeratingWithState:&v93 objects:v98 count:16];
      }
      while (v9);
    }
    if ([*(id *)(a1 + 40) count])
    {
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = [*(id *)(a1 + 32) itemIdentifier];
      id v27 = -[BCSBusinessQueryController _itemResolverForType:](v25, (char *)[v26 type]);

      id v76 = v27;
      if (([v27 conformsToProtocol:&unk_26C62F388] & 1) == 0)
      {
        id v73 = v5;
        id v28 = dispatch_group_create();
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id obj = *(id *)(a1 + 40);
        uint64_t v29 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v75 = *(void *)v90;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v90 != v75) {
                objc_enumerationMutation(obj);
              }
              uint64_t v32 = *(void *)(*((void *)&v89 + 1) + 8 * j);
              dispatch_group_enter(v28);
              long long v33 = *(void **)(a1 + 48);
              if (v33) {
                long long v33 = (void *)v33[25];
              }
              uint64_t v34 = *(void **)(a1 + 32);
              id v35 = v33;
              id v36 = [v34 itemIdentifier];
              unint64_t v37 = [v35 itemResolutionMetricForItemIdentifier:v36];

              __int16 v38 = *(void **)(a1 + 48);
              if (v38) {
                __int16 v38 = (void *)v38[25];
              }
              id v39 = v38;
              id v40 = [v39 measurementFactory];
              id v41 = [*(id *)(a1 + 32) itemIdentifier];
              id v42 = [v40 itemResolutionTimingMeasurementForItemIdentifier:v41];
              [v37 setTimingMeasurement:v42];

              __int16 v43 = [v37 timingMeasurement];
              [v43 begin];

              id v44 = [BCSQuery alloc];
              uint64_t v45 = [*(id *)(a1 + 32) config];
              long long v46 = [*(id *)(a1 + 32) clientBundleId];
              long long v47 = -[BCSQuery initWithItemIdentifier:config:clientBundleId:shardType:skipRegistrationCheck:](v44, "initWithItemIdentifier:config:clientBundleId:shardType:skipRegistrationCheck:", v32, v45, v46, [*(id *)(a1 + 32) shardType], objc_msgSend(*(id *)(a1 + 32), "skipRegistrationCheck"));

              v84[0] = MEMORY[0x263EF8330];
              v84[1] = 3221225472;
              v84[2] = __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_173;
              v84[3] = &unk_264249530;
              id v85 = v37;
              id v88 = *(id *)(a1 + 64);
              uint64_t v86 = v32;
              v87 = v28;
              id v48 = v37;
              [v76 itemMatching:v47 metric:v48 completion:v84];
            }
            uint64_t v30 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
          }
          while (v30);
        }

        uint64_t v49 = *(void *)(a1 + 48);
        if (v49) {
          long long v50 = *(NSObject **)(v49 + 192);
        }
        else {
          long long v50 = 0;
        }
        id v5 = v73;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_2;
        block[3] = &unk_264249558;
        id v83 = *(id *)(a1 + 56);
        dispatch_group_notify(v28, v50, block);
      }
      long long v51 = *(void **)(a1 + 48);
      if (v51) {
        long long v51 = (void *)v51[25];
      }
      __int16 v52 = *(void **)(a1 + 32);
      v53 = v51;
      id v54 = [v52 itemIdentifier];
      uint64_t v55 = [v53 itemResolutionMetricForItemIdentifier:v54];

      uint64_t v56 = *(void **)(a1 + 48);
      if (v56) {
        uint64_t v56 = (void *)v56[25];
      }
      __int16 v57 = v56;
      unint64_t v58 = [v57 measurementFactory];
      __int16 v59 = [*(id *)(a1 + 32) itemIdentifier];
      uint64_t v60 = [v58 itemResolutionTimingMeasurementForItemIdentifier:v59];
      [v55 setTimingMeasurement:v60];

      __int16 v61 = [v55 timingMeasurement];
      [v61 begin];

      uint64_t v62 = [BCSBatchQuery alloc];
      id v63 = [*(id *)(a1 + 40) allObjects];
      uint64_t v64 = [*(id *)(a1 + 32) config];
      id v65 = [*(id *)(a1 + 32) clientBundleId];
      id v66 = -[BCSBatchQuery initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:](v62, "initWithItemIdentifiers:config:clientBundleId:shardType:skipRegistrationCheck:", v63, v64, v65, [*(id *)(a1 + 32) shardType], objc_msgSend(*(id *)(a1 + 32), "skipRegistrationCheck"));

      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_3;
      v80[3] = &unk_264249580;
      id v81 = *(id *)(a1 + 64);
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_4;
      v77[3] = &unk_2642495A8;
      id v78 = v55;
      id v79 = *(id *)(a1 + 56);
      id v67 = v55;
      [v76 itemsMatching:v66 metric:v67 perItemBlock:v80 completion:v77];
    }
    else
    {
      id v68 = ABSLogCommon();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        id v69 = [*(id *)(a1 + 32) itemIdentifier];
        id v70 = NSStringFromBCSType([v69 type]);
        *(_DWORD *)long long buf = 136315394;
        v100 = "-[BCSBusinessQueryController fetchItemsWithQuery:perItemCompletion:completion:]_block_invoke";
        __int16 v101 = 2112;
        v102 = v70;
        _os_log_impl(&dword_2154F4000, v68, OS_LOG_TYPE_DEFAULT, "%s - No more items to fetch - type: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id v6 = 0;
  }
}

void __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_173(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 timingMeasurement];
  [v8 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  uint64_t v9 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v9);
}

uint64_t __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__BCSBusinessQueryController_fetchItemsWithQuery_perItemCompletion_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 timingMeasurement];
  [v4 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v5, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)isBusinessCallerRegisteredForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController isBusinessCallerRegisteredForPhoneNumber:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)long long buf = 0u;
    long long v26 = 0u;
    uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 auditToken];
    }
    else
    {
      *(_OWORD *)long long buf = 0u;
      long long v26 = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      uint64_t v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v24 = 0;
        _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v24,
          2u);
      }
    }
    if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController isBusinessCallerRegisteredForPhoneNumber:forClientBundleID:completion:]"))
    {
      uint64_t v16 = +[BCSUserDefaults sharedDefaults];
      uint64_t v17 = [(BCSBusinessCallerItemIdentifier *)v16 dictionaryForKey:@"BCSBusinessCallerStubEntry"];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = [(BCSQuery *)v17 objectForKeyedSubscript:@"phone"];
        int v20 = [v8 isEqualToString:v19];

        if (v20)
        {
          int v21 = ABSLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v24 = 0;
            _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "BusinessCaller: Returning YES for business caller matching STUB DATA", v24, 2u);
          }

          v10[2](v10, 1, 0);
          goto LABEL_21;
        }
      }
    }
    uint64_t v16 = [[BCSBusinessCallerItemIdentifier alloc] initWithPhoneNumber:v8];
    uint64_t v18 = [[BCSQuery alloc] initWithItemIdentifier:v16 clientBundleId:v9 shardType:4];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __100__BCSBusinessQueryController_isBusinessCallerRegisteredForPhoneNumber_forClientBundleID_completion___block_invoke;
    v22[3] = &unk_2642495F8;
    uint64_t v23 = v10;
    [(BCSBusinessQueryController *)self fetchIsBusinessRegisteredWithQuery:v18 completion:v22];

LABEL_21:
  }
}

void __100__BCSBusinessQueryController_isBusinessCallerRegisteredForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 hasBusiness], v5);
}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBund"
                                    "leID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 auditToken];
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:&v21 hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      uint64_t v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          (uint8_t *)&buf,
          2u);
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__3;
    long long v26 = __Block_byref_object_dispose__3;
    id v27 = 0;
    void v19[4] = &buf;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke;
    v20[3] = &unk_264249620;
    v20[4] = &buf;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_2;
    v19[3] = &unk_264249648;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_3;
    v16[3] = &unk_264249670;
    id v17 = v10;
    p_long long buf = &buf;
    [(BCSBusinessQueryController *)self fetchBusinessCallerMetadataForPhoneNumber:v8 forClientBundleID:v9 metadataCallback:v20 logoURLCallback:v19 completion:v16];

    _Block_object_dispose(&buf, 8);
  }
}

void __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setLogoURL:a2];
}

uint64_t __101__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (void)fetchBusinessCallerMetadataForPhoneNumber:(id)a3 forClientBundleID:(id)a4 metadataCallback:(id)a5 logoURLCallback:(id)a6 completion:(id)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(void, void *))a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = ABSLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBund"
                                    "leID:metadataCallback:logoURLCallback:completion:]";
    _os_log_impl(&dword_2154F4000, v17, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v16)
  {
    long long buf = 0u;
    long long v65 = 0u;
    uint64_t v18 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v19 = v18;
    if (v18)
    {
      [v18 auditToken];
    }
    else
    {
      long long buf = 0u;
      long long v65 = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:&buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      long long v21 = ABSLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v63 = 0;
        _os_log_error_impl(&dword_2154F4000, v21, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v63,
          2u);
      }
    }
    long long v22 = [[BCSBusinessCallerItemIdentifier alloc] initWithPhoneNumber:v12];
    long long v50 = v15;
    id v51 = v13;
    if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController fetchBusinessCallerMetadataForPhoneNumber:forClientBundleID:metadataCallback:logoURLCallback:completion:]"))
    {
      uint64_t v23 = v16;
      uint64_t v24 = +[BCSUserDefaults sharedDefaults];
      uint64_t v25 = [(BCSQuery *)v24 dictionaryForKey:@"BCSBusinessCallerStubEntry"];
      long long v26 = v25;
      if (v25)
      {
        id v27 = [(BCSBusinessCallerItem *)v25 objectForKeyedSubscript:@"phone"];
        int v28 = [v12 isEqualToString:v27];

        id v13 = v51;
        if (v28)
        {
          id v48 = v12;
          uint64_t v29 = v14;
          uint64_t v30 = ABSLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v63 = 0;
            _os_log_impl(&dword_2154F4000, v30, OS_LOG_TYPE_DEFAULT, "BusinessCaller: Returning metadata for business caller matching STUB DATA", v63, 2u);
          }

          uint64_t v31 = [BCSBusinessCallerItem alloc];
          uint64_t v32 = [(BCSBusinessCallerItem *)v26 objectForKeyedSubscript:@"phone"];
          long long v33 = [(BCSBusinessCallerItem *)v26 objectForKeyedSubscript:@"name"];
          uint64_t v34 = [(BCSBusinessCallerItem *)v26 objectForKeyedSubscript:@"department"];
          LOBYTE(v47) = 1;
          id v35 = [(BCSBusinessCallerItem *)v31 initWithPhoneNumber:v32 name:v33 department:v34 logoURL:0 logo:0 logoFormat:0 verified:v47];

          id v14 = v29;
          if (v29) {
            v29[2](v29, v35);
          }
          id v36 = [(BCSBusinessCallerItem *)v26 objectForKeyedSubscript:@"logo"];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke;
          v60[3] = &unk_264249698;
          id v15 = v50;
          id v61 = v50;
          id v62 = v23;
          -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v22, v36, @"heic", v60);

          id v16 = v23;
          id v12 = v48;
          goto LABEL_27;
        }
      }

      id v16 = v23;
    }
    uint64_t v49 = v16;
    if (self) {
      metricFactory = self->_metricFactory;
    }
    else {
      metricFactory = 0;
    }
    __int16 v38 = v12;
    id v39 = metricFactory;
    id v40 = [(BCSMetricFactoryProtocol *)v39 businessCallerFetchMetricForItemIdentifier:v22];

    id v41 = v14;
    if (self) {
      id v42 = self->_metricFactory;
    }
    else {
      id v42 = 0;
    }
    __int16 v43 = v42;
    id v44 = [(BCSMetricFactoryProtocol *)v43 measurementFactory];
    uint64_t v45 = [v44 itemFetchTimingMeasurementForItemIdentifier:v22];
    [(BCSBusinessCallerItem *)v40 setTimingMeasurement:v45];

    long long v46 = [(BCSBusinessCallerItem *)v40 timingMeasurement];
    [v46 begin];

    uint64_t v24 = [[BCSQuery alloc] initWithItemIdentifier:v22 clientBundleId:v13 shardType:4];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_2;
    v52[3] = &unk_2642496E8;
    v53 = v40;
    id v16 = v49;
    id v57 = v49;
    id v54 = v38;
    id v14 = v41;
    id v12 = v38;
    unint64_t v58 = v14;
    uint64_t v55 = self;
    uint64_t v56 = v22;
    id v15 = v50;
    id v59 = v50;
    long long v26 = v40;
    [(BCSBusinessQueryController *)self fetchItemWithQuery:v24 completion:v52];

    id v35 = v53;
LABEL_27:

    id v13 = v51;
  }
}

void __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_generateSafeImageURLForItemIdentifier:(void *)a3 imageData:(void *)a4 format:(void *)a5 completion:
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v9 = a5;
  if (a1)
  {
    id v10 = *(void **)(a1 + 200);
    id v11 = a4;
    id v12 = a3;
    id v13 = a2;
    id v14 = [v10 measurementFactory];
    id v15 = [v14 blastDoorTimingMeasurementForItemIdentifier:v13];

    [v15 begin];
    id v16 = *(void **)(a1 + 256);
    id v23 = 0;
    id v17 = v16;
    uint64_t v18 = [v17 safeImageURLFromImage:v12 imageFormat:v11 error:&v23];

    id v19 = v23;
    [v15 end];
    if (v18)
    {
      v9[2](v9, v18, 0);
    }
    else
    {
      int v20 = ABSLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v19;
        _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "Error getting safe image from BlastDoor: %@", buf, 0xCu);
      }

      if (!v19)
      {
        long long v21 = (void *)MEMORY[0x263F087E8];
        uint64_t v24 = *MEMORY[0x263F08320];
        uint64_t v25 = @"Unexpected BlastDoor failure";
        long long v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v19 = [v21 errorWithDomain:@"com.apple.businessservices" code:100 userInfo:v22];
      }
      ((void (**)(id, void *, id))v9)[2](v9, 0, v19);
    }
  }
}

void __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) timingMeasurement];
  [v7 end];

  objc_msgSend(*(id *)(a1 + 32), "setErrorCode:", objc_msgSend(v6, "code"));
  [*(id *)(a1 + 32) submitForPostProcessing];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    [v8 setPhoneNumber:*(void *)(a1 + 40)];
    id v9 = [v8 logo];
    id v10 = (void *)[v9 copy];

    id v11 = [v8 logoFormat];
    id v12 = (void *)[v11 copy];

    uint64_t v13 = *(void *)(a1 + 72);
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v8);
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = *(void **)(a1 + 56);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_201;
    v17[3] = &unk_2642496C0;
    id v19 = *(id *)(a1 + 80);
    id v20 = *(id *)(a1 + 64);
    id v18 = v6;
    -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:](v14, v15, v10, v12, v17);
  }
  else
  {
    id v16 = ABSLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v5;
      _os_log_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessCallerItem): %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __134__BCSBusinessQueryController_fetchBusinessCallerMetadataForPhoneNumber_forClientBundleID_metadataCallback_logoURLCallback_completion___block_invoke_201(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

- (void)fetchBusinessMetadataForEmail:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController fetchBusinessMetadataForEmail:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)long long buf = 0u;
    long long v38 = 0u;
    id v12 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 auditToken];
    }
    else
    {
      *(_OWORD *)long long buf = 0u;
      long long v38 = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      id v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v36 = 0;
        _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v36,
          2u);
      }
    }
    if (!v8)
    {
      id v16 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"nil email key"];
      v10[2](v10, 0, v16);
LABEL_24:

      goto LABEL_25;
    }
    id v16 = -[BCSBusinessEmailItemIdentifier initWithEmail:]([BCSBusinessEmailItemIdentifier alloc], v8);
    if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController fetchBusinessMetadataForEmail:forClientBundleID:completion:]"))
    {
      id v17 = +[BCSUserDefaults sharedDefaults];
      id v18 = [(BCSQuery *)v17 dictionaryForKey:@"BCSBusinessEmailStubEntry"];
      id v19 = v18;
      if (v18)
      {
        id v20 = [v18 objectForKeyedSubscript:@"email"];
        int v21 = [v8 isEqualToString:v20];

        if (v21)
        {
          id v22 = ABSLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v36 = 0;
            _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v36, 2u);
          }

          uint64_t v23 = objc_alloc_init(BCSEmailLocalizedString);
          [(BCSEmailLocalizedString *)v23 setLocale:@"en-US"];
          uint64_t v24 = [v19 objectForKeyedSubscript:@"name"];
          [(BCSEmailLocalizedString *)v23 setText:v24];

          [(BCSEmailLocalizedString *)v23 setIsDefault:1];
          uint64_t v25 = [v19 objectForKeyedSubscript:@"logo"];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke;
          v30[3] = &unk_264249710;
          id v35 = v10;
          id v31 = v8;
          uint64_t v32 = v23;
          id v33 = v19;
          id v34 = v16;
          id v27 = v19;
          long long v26 = v23;
          -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v34, v25, @"heic", v30);

          goto LABEL_23;
        }
      }
    }
    id v17 = [[BCSQuery alloc] initWithItemIdentifier:v16 clientBundleId:v9 shardType:5];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke_223;
    v28[3] = &unk_2642493F0;
    uint64_t v29 = v10;
    [(BCSBusinessQueryController *)self fetchItemWithQuery:v17 completion:v28];
    long long v26 = v29;
LABEL_23:

    goto LABEL_24;
  }
LABEL_25:
}

void __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v23[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = a3;
    id v5 = [BCSBusinessEmailItem alloc];
    uint64_t v6 = *(void *)(a1 + 32);
    v23[0] = *(void *)(a1 + 40);
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v22 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"businessId"];
    id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"companyId"];
    id v11 = [(BCSBusinessEmailItem *)v5 initWithEmail:v6 localizedNames:v7 localizedDisplayNames:v8 businessId:v9 companyId:v10];

    id v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 56);
      if (v13) {
        uint64_t v13 = (void *)v13[3];
      }
      uint64_t v14 = v13;
      id v15 = [(BCSBusinessEmailItem *)v11 name];
      int v18 = 138412546;
      id v19 = v14;
      __int16 v20 = 2112;
      int v21 = v15;
      _os_log_impl(&dword_2154F4000, v12, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning item { Email: %@, Name: %@ }", (uint8_t *)&v18, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 64);
    id v17 = *(void (**)(uint64_t, void, BCSBusinessEmailItem *))(v16 + 16);
    id v11 = a3;
    v17(v16, 0, v11);
  }
}

void __89__BCSBusinessQueryController_fetchBusinessMetadataForEmail_forClientBundleID_completion___block_invoke_223(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        unint64_t v11 = v5;
        _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
  }
  else
  {
    id v8 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"No match found"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)fetchBusinessMetadataForEmailIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void, void *))a5;
  unint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController fetchBusinessMetadataForEmailIdentifier:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    *(_OWORD *)long long buf = 0u;
    long long v36 = 0u;
    uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 auditToken];
    }
    else
    {
      *(_OWORD *)long long buf = 0u;
      long long v36 = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      id v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v31 = 0;
        _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v31,
          2u);
      }
    }
    uint64_t v16 = [v8 email];

    if (!v16)
    {
      id v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"nil email key"];
      v10[2](v10, 0, v17);
LABEL_27:

      goto LABEL_28;
    }
    if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController fetchBusinessMetadataForEmailIdentifier:forClientBundleID:completion:]"))
    {
      id v17 = +[BCSUserDefaults sharedDefaults];
      int v18 = [v17 dictionaryForKey:@"BCSBusinessEmailStubEntry"];
      if (v18)
      {
        id v19 = [[BCSBusinessEmailIdentifier alloc] initWithDefaultsDictionary:v18];
        if ([v8 matchesIdentifier:v19])
        {
          __int16 v20 = ABSLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v31 = 0;
            _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v31, 2u);
          }

          int v21 = [[BCSBusinessEmailItem alloc] initWithIdentifier:v8 defaultsDictionary:v18];
          uint64_t v22 = ABSLogCommon();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = [(BCSBusinessEmailItem *)v21 email];
            uint64_t v24 = [(BCSBusinessEmailItem *)v21 name];
            *(_DWORD *)id v31 = 138412546;
            uint64_t v32 = v23;
            __int16 v33 = 2112;
            id v34 = v24;
            _os_log_impl(&dword_2154F4000, v22, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning item { Email: %@, Name: %@ }", v31, 0x16u);
          }
          ((void (**)(id, BCSBusinessEmailItem *, void *))v10)[2](v10, v21, 0);

          goto LABEL_26;
        }
      }
    }
    uint64_t v25 = [BCSBusinessEmailItemIdentifier alloc];
    long long v26 = [v8 email];
    id v27 = [v8 fullDomain];
    uint64_t v28 = [v8 topLevelDomain];
    id v17 = -[BCSBusinessEmailItemIdentifier initWithEmail:fullDomain:topLevelDomain:](v25, v26);

    int v18 = [[BCSQuery alloc] initWithItemIdentifier:v17 clientBundleId:v9 shardType:5];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __99__BCSBusinessQueryController_fetchBusinessMetadataForEmailIdentifier_forClientBundleID_completion___block_invoke;
    v29[3] = &unk_2642493F0;
    uint64_t v30 = v10;
    [(BCSBusinessQueryController *)self fetchItemWithQuery:v18 completion:v29];

LABEL_26:
    goto LABEL_27;
  }
LABEL_28:
}

void __99__BCSBusinessQueryController_fetchBusinessMetadataForEmailIdentifier_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        unint64_t v11 = v5;
        _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
  }
  else
  {
    id v8 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"No match found"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)fetchBusinessLogoForBusinessIdentifier:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController fetchBusinessLogoForBusinessIdentifier:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    long long v37 = 0u;
    *(_OWORD *)long long buf = 0u;
    uint64_t v12 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v13 = v12;
    if (v12)
    {
      [v12 auditToken];
    }
    else
    {
      long long v37 = 0u;
      *(_OWORD *)long long buf = 0u;
    }

    if (self) {
      entitlementVerifier = self->_entitlementVerifier;
    }
    else {
      entitlementVerifier = 0;
    }
    if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
    {
      id v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v35 = 0;
        _os_log_error_impl(&dword_2154F4000, v15, OS_LOG_TYPE_ERROR, "Required entitlement missing; please add 'com.apple.businessservicesd.businessmetadata' to your process entitl"
          "ement. This will be a fatal error in the future.",
          v35,
          2u);
      }
    }
    uint64_t v16 = [v8 businessId];

    if (v16)
    {
      id v17 = [BCSBusinessLogoItemIdentifier alloc];
      int v18 = [v8 businessId];
      id v19 = -[BCSBusinessLogoItemIdentifier initWithBusinessId:](v17, v18);

      if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController fetchBusinessLogoForBusinessIdentifier:forClientBundleID:completion:]"))
      {
        __int16 v20 = +[BCSUserDefaults sharedDefaults];
        int v21 = [(BCSQuery *)v20 dictionaryForKey:@"BCSBusinessLogoStubEntry"];
        if (v21)
        {
          uint64_t v22 = [v8 businessId];
          uint64_t v23 = [v21 objectForKeyedSubscript:@"businessId"];
          int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            uint64_t v25 = ABSLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)id v35 = 0;
              _os_log_impl(&dword_2154F4000, v25, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning logo for business email matching STUB DATA", v35, 2u);
            }

            long long v26 = [v21 objectForKeyedSubscript:@"logo"];
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke;
            v32[3] = &unk_264249738;
            id v33 = v19;
            id v34 = v10;
            id v27 = v19;
            -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:]((uint64_t)self, v27, v26, @"heic", v32);

            goto LABEL_23;
          }
        }
      }
      __int16 v20 = [[BCSQuery alloc] initWithItemIdentifier:v19 clientBundleId:v9 shardType:5 skipRegistrationCheck:1];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_236;
      v29[3] = &unk_264249788;
      id v30 = v19;
      id v31 = v10;
      void v29[4] = self;
      uint64_t v28 = v19;
      [(BCSBusinessQueryController *)self fetchItemWithQuery:v20 completion:v29];
    }
    else
    {
      __int16 v20 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"Invalid email identifier - missing businessId"];
      (*((void (**)(id, void, BCSQuery *))v10 + 2))(v10, 0, v20);
    }
LABEL_23:
  }
}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [BCSBusinessLogo alloc];
  id v8 = *(void **)(a1 + 32);
  if (v8) {
    id v8 = (void *)v8[1];
  }
  id v9 = v8;
  id v10 = [(BCSBusinessLogo *)v7 initWithBusinessId:v9 logoURL:v5 logoFormat:@"heic"];

  unint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      uint64_t v12 = (void *)v12[1];
    }
    uint64_t v13 = v12;
    int v14 = 138412546;
    id v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning logo { BusinessId: %@, LogoURL: %@ }", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_236(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (id)v5;
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      id v10 = [v7 logo];
      unint64_t v11 = [v7 logoFormat];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_237;
      v15[3] = &unk_264249760;
      id v16 = *(id *)(a1 + 40);
      id v17 = v7;
      id v18 = *(id *)(a1 + 48);
      id v12 = v7;
      -[BCSBusinessQueryController _generateSafeImageURLForItemIdentifier:imageData:format:completion:](v8, v9, v10, v11, v15);
    }
    else
    {
      int v14 = ABSLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v20 = v5;
        _os_log_impl(&dword_2154F4000, v14, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessLogo): %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v13 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"No match found"];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __98__BCSBusinessQueryController_fetchBusinessLogoForBusinessIdentifier_forClientBundleID_completion___block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [BCSBusinessLogo alloc];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8) {
    uint64_t v8 = (void *)v8[1];
  }
  id v9 = v8;
  id v10 = [*(id *)(a1 + 40) logoFormat];
  unint64_t v11 = [(BCSBusinessLogo *)v7 initWithBusinessId:v9 logoURL:v6 logoFormat:v10];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)fetchBusinessMetadataForEmails:(id)a3 forClientBundleID:(id)a4 requestId:(id)a5 completion:(id)a6
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v46 = a4;
  id v49 = a5;
  id v50 = a6;
  id v9 = ABSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[BCSBusinessQueryController fetchBusinessMetadataForEmails:forClientBundleID:reques"
                                    "tId:completion:]";
    _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v50)
  {
    uint64_t v45 = [MEMORY[0x263F08D68] currentConnection];
    uint64_t v47 = [v45 remoteObjectProxy];
    if ([v48 count])
    {
      long long v87 = 0u;
      long long v88 = 0u;
      id v10 = [MEMORY[0x263F08D68] currentConnection];
      unint64_t v11 = v10;
      if (v10)
      {
        [v10 auditToken];
      }
      else
      {
        long long v87 = 0u;
        long long v88 = 0u;
      }

      if (self) {
        entitlementVerifier = self->_entitlementVerifier;
      }
      else {
        entitlementVerifier = 0;
      }
      if ([(BCSEntitlementVerifying *)entitlementVerifier auditToken:&v87 hasEntitlement:@"com.apple.businessservicesd.businessmetadata"])
      {
        id v51 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v48];
        if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController fetchBusinessMetadataForEmails:forClientBundleID:requestId:completion:]"))
        {
          id v15 = +[BCSUserDefaults sharedDefaults];
          __int16 v43 = [v15 dictionaryForKey:@"BCSBusinessEmailStubEntry"];
          if (v43)
          {
            id v16 = [[BCSBusinessEmailIdentifier alloc] initWithDefaultsDictionary:v43];
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v93 = 0x2020000000;
            LOBYTE(v94) = 1;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id obj = v48;
            uint64_t v17 = [obj countByEnumeratingWithState:&v77 objects:v98 count:16];
            if (v17)
            {
              uint64_t v18 = *(void *)v78;
              while (2)
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v78 != v18) {
                    objc_enumerationMutation(obj);
                  }
                  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
                  {
                    id v40 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:45 errorDescription:@"Client cancelled request"];
                    v74[0] = MEMORY[0x263EF8330];
                    v74[1] = 3221225472;
                    v74[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_3;
                    v74[3] = &unk_2642497B0;
                    id v76 = v50;
                    id v41 = v40;
                    id v75 = v41;
                    [v47 didFetchBusinessMetadataForEmailsForRequestId:v49 error:v41 reply:v74];

                    _Block_object_dispose(&buf, 8);
                    goto LABEL_37;
                  }
                  unint64_t v20 = *(void **)(*((void *)&v77 + 1) + 8 * i);
                  if ([v20 matchesIdentifier:v16])
                  {
                    uint64_t v21 = ABSLogCommon();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)long long v65 = 0;
                      _os_log_impl(&dword_2154F4000, v21, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v65, 2u);
                    }

                    uint64_t v22 = [[BCSBusinessEmailItem alloc] initWithIdentifier:v20 defaultsDictionary:v43];
                    v73[0] = MEMORY[0x263EF8330];
                    v73[1] = 3221225472;
                    v73[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_247;
                    v73[3] = &unk_2642497D8;
                    v73[4] = &buf;
                    [v47 didFetchBusinessMetadata:v22 forEmailIdentifier:v20 requestId:v49 error:0 reply:v73];
                    [v51 removeObject:v20];
                    BOOL v23 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

                    if (v23) {
                      goto LABEL_26;
                    }
                  }
                }
                uint64_t v17 = [obj countByEnumeratingWithState:&v77 objects:v98 count:16];
                if (v17) {
                  continue;
                }
                break;
              }
            }
LABEL_26:

            _Block_object_dispose(&buf, 8);
          }
        }
        int v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v51, "count"));
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v51 = v51;
        uint64_t v25 = [v51 countByEnumeratingWithState:&v69 objects:v97 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v70;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v70 != v26) {
                objc_enumerationMutation(v51);
              }
              uint64_t v28 = *(void **)(*((void *)&v69 + 1) + 8 * j);
              uint64_t v29 = [BCSBusinessEmailItemIdentifier alloc];
              id v30 = [v28 email];
              id v31 = [v28 fullDomain];
              uint64_t v32 = [v28 topLevelDomain];
              id v33 = -[BCSBusinessEmailItemIdentifier initWithEmail:fullDomain:topLevelDomain:](v29, v30);

              [v24 setObject:v28 forKeyedSubscript:v33];
            }
            uint64_t v25 = [v51 countByEnumeratingWithState:&v69 objects:v97 count:16];
          }
          while (v25);
        }

        *(void *)long long v65 = 0;
        uint64_t v66 = v65;
        uint64_t v67 = 0x2020000000;
        char v68 = 1;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v93 = 0x3032000000;
        long long v94 = __Block_byref_object_copy__3;
        long long v95 = __Block_byref_object_dispose__3;
        id v96 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v34 = objc_alloc_init(MEMORY[0x263F08958]);
        id v35 = [BCSBatchQuery alloc];
        long long v36 = [v24 allKeys];
        long long v37 = [(BCSBatchQuery *)v35 initWithItemIdentifiers:v36 config:0 clientBundleId:v46 shardType:5 skipRegistrationCheck:0];

        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_250;
        v58[3] = &unk_264249800;
        id v63 = v65;
        id v59 = v34;
        p_long long buf = &buf;
        id v15 = v24;
        id v60 = v15;
        id v61 = v47;
        id v62 = v49;
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_259;
        v52[3] = &unk_264249828;
        id v57 = &buf;
        id v38 = v59;
        id v53 = v38;
        id v54 = v61;
        id v55 = v62;
        id v56 = v50;
        [(BCSBusinessQueryController *)self fetchItemsWithQuery:v37 perItemCompletion:v58 completion:v52];

        _Block_object_dispose(&buf, 8);
        _Block_object_dispose(v65, 8);
      }
      else
      {
        uint64_t v39 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"Missing business metadata entitlement"];
        uint64_t v81 = MEMORY[0x263EF8330];
        uint64_t v82 = 3221225472;
        id v83 = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2;
        v84 = &unk_2642497B0;
        id v86 = v50;
        id v85 = v39;
        id v51 = v39;
        objc_msgSend(v47, "didFetchBusinessMetadataForEmailsForRequestId:error:reply:", v49);

        id v15 = v86;
      }
LABEL_37:
    }
    else
    {
      id v12 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"Must request at least one identifier"];
      v89[0] = MEMORY[0x263EF8330];
      v89[1] = 3221225472;
      v89[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke;
      v89[3] = &unk_2642497B0;
      id v91 = v50;
      id v90 = v12;
      id v13 = v12;
      [v47 didFetchBusinessMetadataForEmailsForRequestId:v49 error:v13 reply:v89];
    }
  }
}

uint64_t __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_247(uint64_t a1, char a2)
{
  id v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "BusinessEmail (Client): Received response to didFetchBusinessMetadata:forEmailIdentifier:withError:reply:", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

BOOL __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_250(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v16 = ABSLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v24 = v8;
          _os_log_impl(&dword_2154F4000, v16, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", buf, 0xCu);
        }

        uint64_t v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:100 errorDescription:@"Unexpected item"];
        uint64_t v18 = *(void **)(a1 + 48);
        uint64_t v19 = *(void *)(a1 + 56);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_257;
        v22[3] = &unk_2642497D8;
        void v22[4] = *(void *)(a1 + 64);
        [v18 didFetchBusinessMetadata:0 forEmailIdentifier:v10 requestId:v19 error:v17 reply:v22];
        int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      else
      {
        unint64_t v11 = *(void **)(a1 + 48);
        uint64_t v12 = *(void *)(a1 + 56);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2_258;
        v21[3] = &unk_2642497D8;
        void v21[4] = *(void *)(a1 + 64);
        [v11 didFetchBusinessMetadata:v8 forEmailIdentifier:v10 requestId:v12 error:v9 reply:v21];
        int v13 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      BOOL v14 = v13 != 0;
    }
    else
    {
      id v15 = ABSLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138477827;
        id v24 = v7;
        _os_log_impl(&dword_2154F4000, v15, OS_LOG_TYPE_DEFAULT, "Unexpected item identifier (should be BCSBusinessEmailItemIdentifier, got %{private}@)", buf, 0xCu);
      }

      id v10 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:100 errorDescription:@"Unexpected item identifier (wrong class)"];
      [*(id *)(a1 + 32) lock];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v10];
      [*(id *)(a1 + 32) unlock];
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_257(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2_258(uint64_t a1, char a2)
{
  id v4 = ABSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2154F4000, v4, OS_LOG_TYPE_DEFAULT, "BusinessEmail (Client): Received response to didFetchBusinessMetadata:forEmailIdentifier:withError:reply:", v5, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

void __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_259(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
  {
    [*(id *)(a1 + 32) lock];
    if (v3)
    {
      uint64_t v4 = [v3 code];
      v19[0] = *MEMORY[0x263F08320];
      id v5 = [v3 localizedDescription];
      v19[1] = @"subErrors";
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v20[0] = v5;
      v20[1] = v6;
      id v7 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
      uint64_t v8 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:v4 userInfo:v7];

      id v3 = (id)v8;
    }
    else
    {
      v17[0] = *MEMORY[0x263F08320];
      v17[1] = @"subErrors";
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v18[0] = @"Failed to fetch some items";
      v18[1] = v9;
      id v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
      id v3 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:100 userInfo:v5];
    }

    [*(id *)(a1 + 32) unlock];
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2_266;
  v14[3] = &unk_2642497B0;
  id v12 = *(id *)(a1 + 56);
  id v15 = v3;
  id v16 = v12;
  id v13 = v3;
  [v10 didFetchBusinessMetadataForEmailsForRequestId:v11 error:v13 reply:v14];
}

uint64_t __100__BCSBusinessQueryController_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion___block_invoke_2_266(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)cachedBusinessMetadataForEmail:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  uint64_t v11 = ABSLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController cachedBusinessMetadataForEmail:forClientBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v10)
  {
    id v12 = [v8 email];

    if (v12)
    {
      *(_OWORD *)long long buf = 0u;
      long long v30 = 0u;
      id v13 = [MEMORY[0x263F08D68] currentConnection];
      BOOL v14 = v13;
      if (v13)
      {
        [v13 auditToken];
      }
      else
      {
        *(_OWORD *)long long buf = 0u;
        long long v30 = 0u;
      }

      if (self) {
        entitlementVerifier = self->_entitlementVerifier;
      }
      else {
        entitlementVerifier = 0;
      }
      if (([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.businessmetadata"] & 1) == 0)
      {
        uint64_t v17 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"Missing business metadata entitlement"];
        v10[2](v10, 0, v17);
LABEL_23:

        goto LABEL_24;
      }
      if (MEMORY[0x2166BD6C0]("-[BCSBusinessQueryController cachedBusinessMetadataForEmail:forClientBundleID:completion:]"))
      {
        uint64_t v17 = +[BCSUserDefaults sharedDefaults];
        uint64_t v18 = [v17 dictionaryForKey:@"BCSBusinessEmailStubEntry"];
        if (v18)
        {
          uint64_t v19 = [[BCSBusinessEmailIdentifier alloc] initWithDefaultsDictionary:v18];
          if ([v8 matchesIdentifier:v19])
          {
            unint64_t v20 = ABSLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v28 = 0;
              _os_log_impl(&dword_2154F4000, v20, OS_LOG_TYPE_DEFAULT, "BusinessEmail: Returning metadata for business email matching STUB DATA", v28, 2u);
            }

            uint64_t v21 = [[BCSBusinessEmailItem alloc] initWithIdentifier:v8 defaultsDictionary:v18];
            ((void (**)(id, BCSBusinessEmailItem *, void *))v10)[2](v10, v21, 0);

            goto LABEL_22;
          }
        }
      }
      uint64_t v22 = [BCSBusinessEmailItemIdentifier alloc];
      BOOL v23 = [v8 email];
      id v24 = [v8 fullDomain];
      uint64_t v25 = [v8 topLevelDomain];
      uint64_t v17 = -[BCSBusinessEmailItemIdentifier initWithEmail:fullDomain:topLevelDomain:](v22, v23);

      uint64_t v18 = [[BCSQuery alloc] initWithItemIdentifier:v17 clientBundleId:v9 shardType:5 cacheOnly:1];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __90__BCSBusinessQueryController_cachedBusinessMetadataForEmail_forClientBundleID_completion___block_invoke;
      v26[3] = &unk_2642493F0;
      id v27 = v10;
      [(BCSBusinessQueryController *)self fetchItemWithQuery:v18 completion:v26];

LABEL_22:
      goto LABEL_23;
    }
    id v15 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:44 errorDescription:@"nil email key"];
    v10[2](v10, 0, v15);
  }
LABEL_24:
}

void __90__BCSBusinessQueryController_cachedBusinessMetadataForEmail_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v9 = ABSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        unint64_t v11 = v5;
        _os_log_impl(&dword_2154F4000, v9, OS_LOG_TYPE_DEFAULT, "Invalid item (expected BCSBusinessEmailItem): %@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v7();
  }
  else
  {
    id v8 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:42 errorDescription:@"No match found"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)prefetchMegashardsWithCompletion:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = [MEMORY[0x263F08D68] currentConnection];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = (int)[v6 processIdentifier];
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s Called by process with PID %ld", buf, 0x16u);
  }
  id v7 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  __int16 v43 = __Block_byref_object_copy__3;
  id v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  id v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
  }

  if (self) {
    entitlementVerifier = self->_entitlementVerifier;
  }
  else {
    entitlementVerifier = 0;
  }
  unint64_t v11 = entitlementVerifier;
  int v12 = [(BCSEntitlementVerifying *)v11 auditToken:&v34 hasEntitlement:@"com.apple.businessservicesd.prefetch"];

  if (v12)
  {
    dispatch_group_enter(v7);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke;
    v30[3] = &unk_264249850;
    uint64_t v32 = v36;
    id v33 = buf;
    id v13 = v7;
    uint64_t v31 = v13;
    if (self) {
      [(BCSFetchTrigger *)self->_businessLinkMegashardFetchTrigger triggerFetchForReason:1 completion:v30];
    }
    dispatch_group_enter(v13);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_2;
    v28[3] = &unk_264249878;
    BOOL v14 = v13;
    uint64_t v29 = v14;
    if (self) {
      [(BCSFetchTrigger *)self->_chatSuggestMegashardFetchTrigger triggerFetchForReason:1 completion:v28];
    }
    dispatch_group_enter(v14);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_270;
    v26[3] = &unk_264249878;
    id v15 = v14;
    id v27 = v15;
    if (self) {
      [(BCSFetchTrigger *)self->_businessCallerMegashardFetchTrigger triggerFetchForReason:1 completion:v26];
    }
    dispatch_group_enter(v15);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_271;
    v24[3] = &unk_264249878;
    id v16 = v15;
    uint64_t v25 = v16;
    if (self) {
      [(BCSFetchTrigger *)self->_businessEmailMegashardFetchTrigger triggerFetchForReason:1 completion:v24];
    }
    uint64_t v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_272;
    block[3] = &unk_2642498A0;
    id v21 = v4;
    uint64_t v22 = v36;
    BOOL v23 = buf;
    dispatch_group_notify(v16, v17, block);

    uint64_t v18 = v31;
  }
  else
  {
    uint64_t v19 = ABSLogCommon();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v38 = 136315394;
      uint64_t v39 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]";
      __int16 v40 = 2112;
      id v41 = @"com.apple.businessservicesd.prefetch";
      _os_log_error_impl(&dword_2154F4000, v19, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to trigger a prefetch of Megashards", v38, 0x16u);
    }

    uint64_t v18 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"This call requires an entitlement"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v18);
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v36, 8);
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = NSStringFromBOOL();
    int v7 = 136315650;
    id v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke_2";
    __int16 v9 = 2112;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Chat Suggest megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);
  }
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_270(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = NSStringFromBOOL();
    int v7 = 136315650;
    id v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Business Caller megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);
  }
}

void __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_271(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = NSStringFromBOOL();
    int v7 = 136315650;
    id v8 = "-[BCSBusinessQueryController prefetchMegashardsWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    int v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEFAULT, "%s: Prefetch of Business Email megashard completed with result: %@ and error: %@", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __63__BCSBusinessQueryController_prefetchMegashardsWithCompletion___block_invoke_272(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)clearCachesForType:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v6 = (void (**)(id, void, void *))a4;
  int v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController clearCachesForType:completion:]";
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)long long buf = 0u;
  long long v19 = 0u;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  __int16 v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    *(_OWORD *)long long buf = 0u;
    long long v19 = 0u;
  }

  if (self) {
    entitlementVerifier = self->_entitlementVerifier;
  }
  else {
    entitlementVerifier = 0;
  }
  if ([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.cache"])
  {
    if (self) {
      cacheClearer = self->_cacheClearer;
    }
    else {
      cacheClearer = 0;
    }
    [(BCSCacheClearing *)cacheClearer clearCachesForType:a3 completion:v6];
  }
  else
  {
    id v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[BCSBusinessQueryController clearCachesForType:completion:]";
      __int16 v16 = 2112;
      uint64_t v17 = @"com.apple.businessservicesd.cache";
      _os_log_error_impl(&dword_2154F4000, v12, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v13 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"This call requires an entitlement"];
    v6[2](v6, 0, v13);
  }
}

- (void)clearExpiredCachesForType:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v6 = (void (**)(id, void, void *))a4;
  int v7 = ABSLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController clearExpiredCachesForType:completion:]";
    _os_log_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)long long buf = 0u;
  long long v19 = 0u;
  id v8 = [MEMORY[0x263F08D68] currentConnection];
  __int16 v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    *(_OWORD *)long long buf = 0u;
    long long v19 = 0u;
  }

  if (self) {
    entitlementVerifier = self->_entitlementVerifier;
  }
  else {
    entitlementVerifier = 0;
  }
  if ([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.cache"])
  {
    if (self) {
      cacheClearer = self->_cacheClearer;
    }
    else {
      cacheClearer = 0;
    }
    [(BCSCacheClearing *)cacheClearer clearExpiredCachesForType:a3 completion:v6];
  }
  else
  {
    id v12 = ABSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[BCSBusinessQueryController clearExpiredCachesForType:completion:]";
      __int16 v16 = 2112;
      uint64_t v17 = @"com.apple.businessservicesd.cache";
      _os_log_error_impl(&dword_2154F4000, v12, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v13 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"This call requires an entitlement"];
    v6[2](v6, 0, v13);
  }
}

- (void)clearCachesForLinkItemsAssociatedWithBundleID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  id v8 = ABSLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[BCSBusinessQueryController clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
    _os_log_impl(&dword_2154F4000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_OWORD *)long long buf = 0u;
  long long v20 = 0u;
  __int16 v9 = [MEMORY[0x263F08D68] currentConnection];
  int v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }
  else
  {
    *(_OWORD *)long long buf = 0u;
    long long v20 = 0u;
  }

  if (self) {
    entitlementVerifier = self->_entitlementVerifier;
  }
  else {
    entitlementVerifier = 0;
  }
  if ([(BCSEntitlementVerifying *)entitlementVerifier auditToken:buf hasEntitlement:@"com.apple.businessservicesd.cache"])
  {
    if (self) {
      cacheClearer = self->_cacheClearer;
    }
    else {
      cacheClearer = 0;
    }
    [(BCSCacheClearing *)cacheClearer clearCachesForLinkItemsAssociatedWithBundleID:v6 completion:v7];
  }
  else
  {
    uint64_t v13 = ABSLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315394;
      __int16 v16 = "-[BCSBusinessQueryController clearCachesForLinkItemsAssociatedWithBundleID:completion:]";
      __int16 v17 = 2112;
      uint64_t v18 = @"com.apple.businessservicesd.cache";
      _os_log_error_impl(&dword_2154F4000, v13, OS_LOG_TYPE_ERROR, "%s: The entitlement %@ is required to clear caches", (uint8_t *)&v15, 0x16u);
    }

    int v14 = +[BCSError errorWithDomain:@"com.apple.businessservices" code:99 errorDescription:@"This call requires an entitlement"];
    v7[2](v7, 0, v14);
  }
}

- (void)_deleteInMemoryCache
{
  +[BCSBusinessItemMemoryCache sharedCache]();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[BCSBusinessItemMemoryCache deleteCache]((uint64_t)v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blastDoorHelper, 0);
  objc_storeStrong((id *)&self->_housekeeper, 0);
  objc_storeStrong((id *)&self->_patternController, 0);
  objc_storeStrong((id *)&self->_shardCacheSkip, 0);
  objc_storeStrong((id *)&self->_configCacheSkip, 0);
  objc_storeStrong((id *)&self->_configCache, 0);
  objc_storeStrong((id *)&self->_shardCache, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_queryChopper, 0);
  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
  objc_storeStrong((id *)&self->_businessEmailMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessCallerMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessLinkMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_chatSuggestMegashardFetchTrigger, 0);
  objc_storeStrong((id *)&self->_businessEmailShardResolver, 0);
  objc_storeStrong((id *)&self->_businessEmailConfigResolver, 0);
  objc_storeStrong((id *)&self->_businessEmailItemResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerShardResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerConfigResolver, 0);
  objc_storeStrong((id *)&self->_businessCallerItemResolver, 0);
  objc_storeStrong((id *)&self->_linkShardResolver, 0);
  objc_storeStrong((id *)&self->_linkConfigResolver, 0);
  objc_storeStrong((id *)&self->_linkItemResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestShardResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestConfigResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestItemResolver, 0);
  objc_storeStrong((id *)&self->_chatSuggestController, 0);
  objc_storeStrong((id *)&self->_cacheClearer, 0);
  objc_storeStrong((id *)&self->_iconController, 0);

  objc_storeStrong((id *)&self->_identityService, 0);
}

@end