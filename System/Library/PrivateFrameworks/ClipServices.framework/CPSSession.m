@interface CPSSession
- (BOOL)checkAndConsumeShowsAppAttributionBannerLaunchOption;
- (BOOL)isOpeningWebClipFromDaemon;
- (BOOL)isPurgeable;
- (BOOL)registeredForTest;
- (CPSAppInfoFetching)appInfoFetcher;
- (CPSBusinessItemFetching)businessItemFetcher;
- (CPSClipLaunchOptions)launchOptions;
- (CPSClipMetadata)metadata;
- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4;
- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4 configuration:(id)a5;
- (CPSSessionConfiguration)configuration;
- (NSNumber)estimatedProgress;
- (NSString)logID;
- (NSURL)applicationIconFileURL;
- (NSURL)url;
- (id)_availabilityOptions;
- (id)_retrieveInstalledApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4;
- (void)_didDetermineAvailability:(BOOL)a3;
- (void)_didFetchBusinessIconWithURL:(id)a3;
- (void)_didFinishLoadingWithError:(id)a3;
- (void)_didUpdateMetadata:(id)a3;
- (void)_evictFromCache;
- (void)_fetchAppMetadataWithBundleID:(id)a3 url:(id)a4 accountInvocationPolicy:(id)a5;
- (void)_fetchBusinessIconIfNeeded;
- (void)_fetchBusinessMetadata;
- (void)_fetchParentApplicationMetadataWithBundleID:(id)a3;
- (void)_notifyObserversOfMetadataFetchResultUpdates:(id)a3;
- (void)_retrieveApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4;
- (void)_retrieveApplicationIconWithCompletionHandler:(id)a3;
- (void)_retrieveHeroImageWithHeroImageURL:(id)a3;
- (void)_retrieveImageWithURL:(id)a3 didFetchImage:(BOOL *)a4 fileURL:(id *)a5 fetchCompletion:(id)a6 proxyCompletion:(id)a7;
- (void)_updateEntryPointForWebClip:(id)a3;
- (void)_updateLocationConfirmationForRecord:(id)a3 permissionGranted:(id)a4;
- (void)_updateWebClipIcon:(id)a3 metadata:(id)a4;
- (void)addRemoteObjectProxy:(id)a3;
- (void)clearMetadataAndRefetch;
- (void)didCompleteTestSessionAtTime:(double)a3;
- (void)fetchHeroImage;
- (void)fetchMetadataWithCompletion:(id)a3;
- (void)installationController:(id)a3 didFinishWithError:(id)a4;
- (void)installationController:(id)a3 didUpdateProgress:(double)a4;
- (void)installationControllerDidInstallPlaceholder:(id)a3;
- (void)installationControllerWillStartInstall:(id)a3;
- (void)removeRemoteObjectProxy:(id)a3;
- (void)setAppInfoFetcher:(id)a3;
- (void)setBusinessItemFetcher:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setOpeningWebClipFromDaemon:(BOOL)a3;
- (void)setPreloadedMetadata:(id)a3;
- (void)updateClipDataForEntryPointWithWebClip:(id)a3 launchOptions:(id)a4;
@end

@implementation CPSSession

- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4
{
  return [(CPSSession *)self initWithURL:a3 usingQueue:a4 configuration:0];
}

- (CPSSession)initWithURL:(id)a3 usingQueue:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CPSSession;
  v12 = [(CPSSession *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    v14 = objc_alloc_init(CPSClipLaunchOptions);
    launchOptions = v13->_launchOptions;
    v13->_launchOptions = v14;

    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v13->_queue, a4);
    uint64_t v16 = [MEMORY[0x263EFF980] array];
    proxyObjects = v13->_proxyObjects;
    v13->_proxyObjects = (NSMutableArray *)v16;

    v18 = objc_alloc_init(CPSImageLoader);
    imageLoader = v13->_imageLoader;
    v13->_imageLoader = v18;

    objc_storeStrong((id *)&v13->_configuration, a5);
    configuration = v13->_configuration;
    if (!configuration || ![(CPSSessionConfiguration *)configuration useLocalContent]) {
      [(CPSSession *)v13 _fetchBusinessMetadata];
    }
    v21 = v13;
  }

  return v13;
}

- (void)addRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__CPSSession_addRemoteObjectProxy___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void *__35__CPSSession_addRemoteObjectProxy___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 176) isForSwitcherOverlay];
  result = *(void **)(a1 + 32);
  if (result[17]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 0;
  }
  if (!v4 && !result[8])
  {
    v5 = *(void **)(a1 + 40);
    id v6 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 17);
    [v5 didFinishLoadingWithError:v6];

    *(void *)(*(void *)(a1 + 32) + 64) = 2;
    result = *(void **)(a1 + 32);
  }
  uint64_t v7 = result[7];
  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    BOOL v9 = v7 == 1;
    id v10 = [result _availabilityOptions];
    [v8 didDetermineAvailability:v9 options:v10];

    id v11 = *(void **)(a1 + 32);
    if (v11[8] == 2) {
      int v12 = v2;
    }
    else {
      int v12 = 0;
    }
    if (v12 == 1)
    {
      v13 = *(void **)(a1 + 40);
      v14 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 16);
      [v13 didFinishLoadingWithError:v14];

      id v11 = *(void **)(a1 + 32);
    }
    v28[0] = *(void *)(a1 + 40);
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    [v11 _notifyObserversOfMetadataFetchResultUpdates:v15];

    uint64_t v16 = *(void *)(a1 + 32);
    if (*(void *)(v16 + 144))
    {
      objc_msgSend(*(id *)(a1 + 40), "didUpdateInstallProgress:");
      uint64_t v16 = *(void *)(a1 + 32);
    }
    char v23 = 0;
    result = (void *)[*(id *)(v16 + 136) hasUpToDateVersionInstalledOnSystemIsPlaceholder:&v23];
    if (result && v23)
    {
      v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        v19 = *(void **)(*(void *)(a1 + 32) + 136);
        v20 = v17;
        v21 = [v19 clipBundleID];
        *(_DWORD *)buf = 134218243;
        uint64_t v25 = v18;
        __int16 v26 = 2113;
        v27 = v21;
        _os_log_impl(&dword_21559C000, v20, OS_LOG_TYPE_DEFAULT, "CPSSession: placeholder already installed when objectProxy (%p) is added for %{private}@", buf, 0x16u);
      }
      result = (void *)[*(id *)(a1 + 40) didInstallApplicationPlaceholder];
    }
    uint64_t v22 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v22 + 88))
    {
      result = (void *)[*(id *)(a1 + 40) didRetrieveApplicationIcon:*(void *)(v22 + 32)];
      uint64_t v22 = *(void *)(a1 + 32);
    }
    if (*(void *)(v22 + 40))
    {
      result = objc_msgSend(*(id *)(a1 + 40), "didRetrieveHeroImage:");
      uint64_t v22 = *(void *)(a1 + 32);
    }
    if (*(void *)(v22 + 48)) {
      return objc_msgSend(*(id *)(a1 + 40), "didRetrieveBusinessIcon:");
    }
  }
  return result;
}

- (void)removeRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CPSSession_removeRemoteObjectProxy___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __38__CPSSession_removeRemoteObjectProxy___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)registeredForTest
{
  return [(CPSSessionConfiguration *)self->_configuration usedByPPT];
}

- (NSString)logID
{
  int v2 = [(CPSSessionConfiguration *)self->_configuration sessionID];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)isPurgeable
{
  return [(NSMutableArray *)self->_proxyObjects count] == 0;
}

- (void)_fetchBusinessMetadata
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 160) && *(void *)(v1 + 72) != 1)
  {
    *(void *)(v1 + 72) = 1;
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_signpost_enabled(v3))
    {
      id v4 = *(void **)(a1 + 32);
      v5 = v3;
      id v6 = [v4 logID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "[begin] fetching ABR metadata";
      _os_signpost_emit_with_name_impl(&dword_21559C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
    }
    uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_signpost_enabled(v7))
    {
      id v8 = *(void **)(a1 + 32);
      BOOL v9 = v7;
      id v10 = [v8 logID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = "[begin] Marking Placeholder request";
      _os_signpost_emit_with_name_impl(&dword_21559C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "OpenButtonBecomeActive", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    uint64_t v18 = __Block_byref_object_dispose__5;
    id v19 = 0;
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = *(void **)(v11 + 160);
    uint64_t v13 = *(void *)(v11 + 128);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_11;
    v15[3] = &unk_26424EED8;
    v15[4] = v11;
    v15[5] = buf;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_13;
    v14[3] = &unk_26424EF50;
    v14[4] = v11;
    v14[5] = buf;
    [v12 fetchBusinessMetadataForURL:v13 availabilityHandler:v15 completion:v14];
    _Block_object_dispose(buf, 8);
  }
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_11(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_2;
  v8[3] = &unk_26424EC48;
  id v9 = v5;
  long long v10 = *(_OWORD *)(a1 + 32);
  char v11 = a2;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __36__CPSSession__fetchBusinessMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    int v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 128);
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v6 = 138740227;
      uint64_t v7 = v3;
      __int16 v8 = 2113;
      uint64_t v9 = v4;
      _os_log_impl(&dword_21559C000, v2, OS_LOG_TYPE_INFO, "Found a pattern match for url %{sensitive}@ with matched bundleID %{private}@", (uint8_t *)&v6, 0x16u);
    }
  }
  return [*(id *)(a1 + 40) _didDetermineAvailability:*(unsigned __int8 *)(a1 + 56)];
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  __int16 v8 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14;
  v12[3] = &unk_26424EF28;
  v12[4] = v7;
  id v13 = v6;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v5;
  uint64_t v15 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 logID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "[end] fetching ABR metadata enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ABRMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  id v6 = (id *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 40) domain];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  __int16 v8 = (id *)getCKErrorDomainSymbolLoc_ptr;
  uint64_t v30 = getCKErrorDomainSymbolLoc_ptr;
  if (!getCKErrorDomainSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCKErrorDomainSymbolLoc_block_invoke;
    v32 = &unk_26424E580;
    v33 = &v27;
    __getCKErrorDomainSymbolLoc_block_invoke((uint64_t)buf);
    __int16 v8 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v8) {
    __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14_cold_1();
  }
  id v9 = *v8;
  if ([v7 isEqualToString:v9])
  {
    if ([*v6 code] == 3)
    {

LABEL_16:
      uint64_t v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14_cold_2((uint64_t *)(a1 + 40), v15, v16);
      }
      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 19);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v17 _didFinishLoadingWithError:v10];
      goto LABEL_26;
    }
    BOOL v14 = [*v6 code] == 4;

    if (v14) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  id v10 = *(id *)(a1 + 48);
  id v11 = [v10 clipBundleID];
  if (!v11)
  {
    id v11 = [*(id *)(*(void *)(a1 + 32) + 176) fallbackClipBundleID];
    if (!v11) {
      id v11 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
  }
  if (*v6 || ![v11 length])
  {
    int v12 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 2);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v12 _didFinishLoadingWithError:v13];
  }
  else
  {
    uint64_t v18 = [v10 clipLaunchURL];
    if (objc_msgSend(v11, "cps_isAMSPlaceholderBundleIdentifier"))
    {
      id v19 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 128);
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = v20;
        _os_log_impl(&dword_21559C000, v19, OS_LOG_TYPE_INFO, "Find a AMS placeholder app clip experience; use ODJ replacement metadata for URL %{private}@",
          buf,
          0xCu);
      }

      id v10 = 0;
    }
    uint64_t v22 = *(void **)(a1 + 32);
    v21 = (id *)(a1 + 32);
    [v22 _didUpdateMetadata:v10];
    [*v21 _fetchBusinessIconIfNeeded];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __36__CPSSession__fetchBusinessMetadata__block_invoke_17;
    v23[3] = &unk_26424EF00;
    v23[4] = *v21;
    id v10 = v10;
    id v24 = v10;
    id v25 = v11;
    id v26 = v18;
    id v13 = v18;
    +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:v23];
  }
LABEL_26:
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 40) setInvocationPolicy:v3];
  if ([v3 isEligible] & 1) != 0 || (objc_msgSend(v3, "isRecoverable"))
  {
    [*(id *)(a1 + 32) _fetchAppMetadataWithBundleID:*(void *)(a1 + 48) url:*(void *)(a1 + 56) accountInvocationPolicy:v3];
    [*(id *)(a1 + 32) _fetchParentApplicationMetadataWithBundleID:*(void *)(a1 + 48)];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 72) = 2;
    [*(id *)(a1 + 32) _didUpdateMetadata:*(void *)(a1 + 40)];
  }
}

- (void)_fetchAppMetadataWithBundleID:(id)a3 url:(id)a4 accountInvocationPolicy:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  id v11 = a4;
  dispatch_assert_queue_V2(queue);
  int v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v12))
  {
    id v13 = v12;
    BOOL v14 = [(CPSSession *)self logID];
    *(_DWORD *)buf = 138543618;
    id v24 = v14;
    __int16 v25 = 2082;
    id v26 = "[begin] Fetching App metadata";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  appInfoFetcher = self->_appInfoFetcher;
  uint64_t v16 = [(CPSSessionConfiguration *)self->_configuration sourceBundleID];
  BOOL v17 = [(CPSSession *)self registeredForTest];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke;
  v20[3] = &unk_26424EFA0;
  v20[4] = self;
  id v21 = v9;
  id v22 = v8;
  id v18 = v8;
  id v19 = v9;
  [(CPSAppInfoFetching *)appInfoFetcher lookUpClipMetadataByBundleID:v18 sourceBundleID:v16 URL:v11 downloadIconIfNeeded:0 skipCaching:v17 completionHandler:v20];
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2;
  block[3] = &unk_26424EF78;
  block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v2 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v2))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    id v5 = [v3 logID];
    *(_DWORD *)v31 = 138543618;
    *(void *)&v31[4] = v5;
    __int16 v32 = 2082;
    v33 = "[end] Fetching App metadata enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AppMetaData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", v31, 0x16u);
  }
  if (*(void *)(a1 + 40) || (id v9 = (id *)(a1 + 48), !*(void *)(a1 + 48)))
  {
    id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_1(a1, v6, (id *)(a1 + 40));
    }
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 10);
    [v7 _didFinishLoadingWithError:v8];

    [*(id *)(a1 + 32) _retrieveApplicationIconWithAppIconURL:0 clipBundleID:0];
  }
  else
  {
    id v10 = (id *)(a1 + 32);
    id v11 = *(void **)(*(void *)(a1 + 32) + 136);
    if (v11)
    {
      id v12 = [v11 clipBundleID];
      id v13 = [*v9 clipBundleID];
      char v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        id v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_2(a1 + 32, v15, (id *)(a1 + 48));
        }
      }
    }
    else
    {
      uint64_t v16 = objc_alloc_init(CPSClipMetadata);
      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(v17 + 136);
      *(void *)(v17 + 136) = v16;

      [*(id *)(*(void *)(a1 + 32) + 136) setInvocationPolicy:*(void *)(a1 + 56)];
      id v19 = [*(id *)(a1 + 48) clipBundleID];
      [*(id *)(*(void *)(a1 + 32) + 136) setClipBundleID:v19];

      [*(id *)(*(void *)(a1 + 32) + 136) setClipRequestURL:*(void *)(*(void *)(a1 + 32) + 128)];
    }
    [*((id *)*v10 + 17) _updateWithAMSMetadata:*v9];
    *((void *)*v10 + 9) = 2;
    [*v10 _didUpdateMetadata:*((void *)*v10 + 17)];
    uint64_t v20 = [*((id *)*v10 + 17) invocationPolicy];
    int v21 = [v20 isEligible];

    if (v21)
    {
      v31[0] = 0;
      id v22 = +[CPSAnalyticsLogger sharedLogger];
      uint64_t v23 = *(void *)(a1 + 64);
      id v24 = [*(id *)(*(void *)(a1 + 32) + 176) launchReason];
      objc_msgSend(v22, "didDiscoverClip:event:alreadyInstalled:", v23, v24, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "hasUpToDateVersionInstalledOnSystemIsPlaceholder:", v31));
    }
    __int16 v25 = [*((id *)*v10 + 17) invocationPolicy];
    if ([v25 isEligible])
    {

LABEL_19:
      id v28 = *v10;
      uint64_t v29 = [*((id *)*v10 + 17) fullAppIconURL];
      uint64_t v30 = [*((id *)*v10 + 17) clipBundleID];
      [v28 _retrieveApplicationIconWithAppIconURL:v29 clipBundleID:v30];

      return;
    }
    id v26 = [*((id *)*v10 + 17) invocationPolicy];
    int v27 = [v26 isRecoverable];

    if (v27) {
      goto LABEL_19;
    }
  }
}

- (void)_fetchBusinessIconIfNeeded
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(CPSClipMetadata *)self->_metadata clipBusinessIconURL];
  uint64_t v4 = [(CPSClipMetadata *)self->_metadata clipMapItemMUID];
  id v5 = [(CPSClipMetadata *)self->_metadata clipBusinessIconStyleAttributes];
  id v6 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = v6;
    id v8 = [(CPSSession *)self logID];
    *(_DWORD *)buf = 138543618;
    id v19 = v8;
    __int16 v20 = 2082;
    int v21 = "[begin] Fetching business icon data";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BusinessIconData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke;
  v17[3] = &unk_26424EFC8;
  v17[4] = self;
  id v9 = (void *)MEMORY[0x2166BE5C0](v17);
  if (v3)
  {
    id v10 = +[CPSPromise promise];
    businessIconFetchingPromise = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v10;

    [(CPSImageLoader *)self->_imageLoader loadImageWithURL:v3 completionHandler:v9];
  }
  else if (v4)
  {
    id v12 = +[CPSPromise promise];
    id v13 = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v12;

    -[CPSImageLoader loadImageForMapItemMUID:completionHandler:](self->_imageLoader, "loadImageForMapItemMUID:completionHandler:", [v4 unsignedLongLongValue], v9);
  }
  else if (v5)
  {
    char v14 = +[CPSPromise promise];
    id v15 = self->_businessIconFetchingPromise;
    self->_businessIconFetchingPromise = v14;

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F41C18]) initWithDictionary:v5];
    [(CPSImageLoader *)self->_imageLoader loadImageForGEOStyleAttributes:v16 completionHandler:v9];
  }
}

void __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v8 logID];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v10;
    __int16 v21 = 2082;
    uint64_t v22 = "[end] Fetching business icon data";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BusinessIconData", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(NSObject **)(v11 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_26;
  block[3] = &unk_26424EA90;
  id v16 = v6;
  uint64_t v17 = v11;
  id v18 = v5;
  id v13 = v5;
  id v14 = v6;
  dispatch_async(v12, block);
}

uint64_t __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_26(uint64_t a1)
{
  int v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_26_cold_1(v2, v3, v4);
    }
    [*(id *)(*(void *)(a1 + 40) + 112) finishWithError:*(void *)(a1 + 32)];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 112) finishWithResult:*(void *)(a1 + 48)];
  }
  return [*(id *)(a1 + 40) _didFetchBusinessIconWithURL:*(void *)(a1 + 48)];
}

- (void)_fetchParentApplicationMetadataWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = +[CPSClipDataSQLiteStore defaultStore];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke;
  v6[3] = &unk_26424EFF0;
  v6[4] = self;
  [v5 getAppClipRecordWithBundleID:v4 completion:v6];
}

void __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fullApplicationName];
  if (v4)
  {

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(NSObject **)(v6 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke_2;
    v8[3] = &unk_26424E7D8;
    void v8[4] = v6;
    id v9 = v3;
    dispatch_async(v7, v8);

    goto LABEL_5;
  }
  id v5 = [v3 fullApplicationCaption];

  if (v5) {
    goto LABEL_4;
  }
LABEL_5:
}

void __58__CPSSession__fetchParentApplicationMetadataWithBundleID___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 136) fullAppName];
  uint64_t v3 = [v2 length];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 40) fullApplicationName];
    [*(id *)(*(void *)(a1 + 32) + 136) setFullAppName:v4];
  }
  id v5 = [*(id *)(*(void *)(a1 + 32) + 136) fullAppCaption];

  if (v5)
  {
    if (v3) {
      return;
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 40) fullApplicationCaption];
    [*(id *)(*(void *)(a1 + 32) + 136) setFullAppCaption:v6];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[17];

  [v7 _didUpdateMetadata:v8];
}

- (NSURL)applicationIconFileURL
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__CPSSession_applicationIconFileURL__block_invoke;
  v5[3] = &unk_26424EC20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __36__CPSSession_applicationIconFileURL__block_invoke(uint64_t a1)
{
}

- (void)_didDetermineAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int64_t v5 = 1;
  if (!v3) {
    int64_t v5 = 2;
  }
  self->_clipAvailabilityState = v5;
  uint64_t v6 = [(CPSSession *)self _availabilityOptions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = self->_proxyObjects;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "didDetermineAvailability:options:", v3, v6, (void)v13);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if (!v3)
  {
    id v12 = [(CPSSessionConfiguration *)self->_configuration fallbackClipBundleID];

    if (!v12) {
      [(CPSSession *)self _evictFromCache];
    }
  }
}

- (id)_availabilityOptions
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CPSSession registeredForTest](self, "registeredForTest"));
  [v3 setObject:v4 forKeyedSubscript:@"RegisteredForTest"];

  int64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CPSSessionConfiguration originIsControlCenter](self->_configuration, "originIsControlCenter"));
  [v3 setObject:v5 forKeyedSubscript:@"OriginIsControlCenter"];

  uint64_t v6 = [(CPSSessionConfiguration *)self->_configuration launchReason];
  [v3 setObject:v6 forKeyedSubscript:@"LaunchReason"];

  uint64_t v7 = [(CPSSessionConfiguration *)self->_configuration sourceBundleID];
  [v3 setObject:v7 forKeyedSubscript:@"SourceBundleID"];

  uint64_t v8 = [(CPSSessionConfiguration *)self->_configuration referrerBundleID];
  [v3 setObject:v8 forKeyedSubscript:@"ReferrerBundleID"];

  return v3;
}

- (void)_didUpdateMetadata:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_metadata, a3);
  if (self->_metadataFetchState == 2)
  {
    metadataCompletion = (void (**)(id, CPSClipMetadata *))self->_metadataCompletion;
    if (metadataCompletion)
    {
      if (self->_metadataFetchError) {
        metadata = 0;
      }
      else {
        metadata = self->_metadata;
      }
      metadataCompletion[2](metadataCompletion, metadata);
      id v7 = self->_metadataCompletion;
      self->_metadataCompletion = 0;
    }
  }
  [(CPSSession *)self _notifyObserversOfMetadataFetchResultUpdates:self->_proxyObjects];
}

- (void)_notifyObserversOfMetadataFetchResultUpdates:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = v4;
  if (self->_metadataFetchError)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) didFinishLoadingWithError:self->_metadataFetchError];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    int64_t metadataFetchState = self->_metadataFetchState;
    if (metadataFetchState == 2 || metadataFetchState == 1 && self->_metadata)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v11 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t j = 0; j != v12; ++j)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v15 + 1) + 8 * j) didUpdateMetadata:self->_metadata];
          }
          uint64_t v12 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_didFinishLoadingWithError:(id)a3
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_int64_t metadataFetchState = 2;
  objc_storeStrong((id *)&self->_metadataFetchError, a3);
  if (self->_metadataFetchState == 2)
  {
    metadataCompletion = (void (**)(id, CPSClipMetadata *))self->_metadataCompletion;
    if (metadataCompletion)
    {
      if (self->_metadataFetchError) {
        metadata = 0;
      }
      else {
        metadata = self->_metadata;
      }
      metadataCompletion[2](metadataCompletion, metadata);
      id v7 = self->_metadataCompletion;
      self->_metadataCompletion = 0;
    }
  }
  [(CPSSession *)self _notifyObserversOfMetadataFetchResultUpdates:self->_proxyObjects];
  if (v8) {
    [(CPSSession *)self _evictFromCache];
  }
}

- (void)_didFetchBusinessIconWithURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_businessIconFileURL, a3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_proxyObjects;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "didRetrieveBusinessIcon:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_evictFromCache
{
  id v3 = +[CPSSessionManager sharedManager];
  [v3 clearSessionWithURL:self->_url];
}

- (void)setPreloadedMetadata:(id)a3
{
  id v8 = a3;
  self->_clipAvailabilityState = 1;
  self->_int64_t metadataFetchState = 2;
  objc_storeStrong((id *)&self->_metadata, a3);
  id v5 = +[CPSClipInvocationPolicy eligiblePolicy];
  [(CPSClipMetadata *)self->_metadata setInvocationPolicy:v5];

  if ([(CPSClipMetadata *)self->_metadata isDeveloperOverride])
  {
    uint64_t v6 = [(CPSClipMetadata *)self->_metadata fullAppIconURL];
    uint64_t v7 = [(CPSClipMetadata *)self->_metadata clipBundleID];
    [(CPSSession *)self _retrieveApplicationIconWithAppIconURL:v6 clipBundleID:v7];

    [(CPSSession *)self fetchHeroImage];
  }
}

- (void)clearMetadataAndRefetch
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__CPSSession_clearMetadataAndRefetch__block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__CPSSession_clearMetadataAndRefetch__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 72) != 1)
  {
    uint64_t v2 = result;
    *(void *)(v1 + 56) = 0;
    *(void *)(*(void *)(result + 32) + 72) = 0;
    uint64_t v3 = *(void *)(result + 32);
    id v4 = *(void **)(v3 + 80);
    *(void *)(v3 + 80) = 0;

    id v5 = *(void **)(v2 + 32);
    return [v5 _fetchBusinessMetadata];
  }
  return result;
}

- (void)didCompleteTestSessionAtTime:(double)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__CPSSession_didCompleteTestSessionAtTime___block_invoke;
  v4[3] = &unk_26424EBD0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

void __43__CPSSession_didCompleteTestSessionAtTime___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) registeredForTest])
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "didFinishTestingAtTime:", *(double *)(a1 + 40), (void)v7);
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)checkAndConsumeShowsAppAttributionBannerLaunchOption
{
  BOOL v3 = [(CPSClipLaunchOptions *)self->_launchOptions showsAppAttributionBanner];
  [(CPSClipLaunchOptions *)self->_launchOptions setShowsAppAttributionBanner:0];
  return v3;
}

- (void)fetchMetadataWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke;
  v7[3] = &unk_26424E6F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __42__CPSSession_fetchMetadataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 72);
  if (!v3)
  {
    [(id)v2 _fetchBusinessMetadata];
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 72);
  }
  if (v3 == 2)
  {
    id v4 = [*(id *)(v2 + 136) invocationPolicy];
    if ([v4 isEligible])
    {

LABEL_7:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke_2;
      v16[3] = &unk_26424EE50;
      long long v7 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v7;
      +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:v16];

      return;
    }
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 136) invocationPolicy];
    char v6 = [v5 isRecoverable];

    if (v6) {
      goto LABEL_7;
    }
    [*(id *)(a1 + 32) clearMetadataAndRefetch];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v8 = (void *)MEMORY[0x2166BE5C0](*(void *)(v2 + 96));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__CPSSession_fetchMetadataWithCompletion___block_invoke_3;
  v13[3] = &unk_26424F018;
  id v14 = *(id *)(a1 + 40);
  id v15 = v8;
  id v9 = v8;
  uint64_t v10 = MEMORY[0x2166BE5C0](v13);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 96);
  *(void *)(v11 + 96) = v10;
}

uint64_t __42__CPSSession_fetchMetadataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  dispatch_assert_queue_V2(v3);
  [*(id *)(*(void *)(a1 + 32) + 136) setInvocationPolicy:v4];
  LODWORD(v3) = [v4 isEligible];

  if (v3)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 136) amsDictionary];
    char v6 = +[CPSClipInvocationPolicy invocationPolicyWithAMSDict:v5];

    [*(id *)(*(void *)(a1 + 32) + 136) setInvocationPolicy:v6];
  }
  [*(id *)(a1 + 32) _didUpdateMetadata:*(void *)(*(void *)(a1 + 32) + 136)];
  long long v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v7();
}

void __42__CPSSession_fetchMetadataWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)fetchHeroImage
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__CPSSession_fetchHeroImage__block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __28__CPSSession_fetchHeroImage__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 40))
  {
    id v2 = [*(id *)(v1 + 136) clipHeroImageURL];
    [(id)v1 _retrieveHeroImageWithHeroImageURL:v2];
  }
}

- (void)_updateLocationConfirmationForRecord:(id)a3 permissionGranted:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CPSClipMetadata *)self->_metadata clipRequestsLocationConfirmationPermission])
  {
    [v9 setLocationConfirmationGranted:v6];
    if ([v6 BOOLValue])
    {
      uint64_t v7 = [(CPSSessionConfiguration *)self->_configuration launchReason];
      if ([v7 isEqualToString:@"NFC"])
      {
        uint64_t v8 = 2;
      }
      else if ([v7 isEqualToString:@"QR"])
      {
        uint64_t v8 = 1;
      }
      else if ([v7 isEqualToString:@"DeveloperTools"])
      {
        uint64_t v8 = 4;
      }
      else if ([v7 isEqualToString:@"AppclipCode"])
      {
        uint64_t v8 = 3;
      }
      else
      {
        uint64_t v8 = 0;
      }
      [v9 setLocationConfirmationState:v8];
    }
    else
    {
      [v9 setLocationConfirmationState:0];
    }
  }
  else
  {
    [v9 setLocationConfirmationGranted:0];
  }
}

- (void)updateClipDataForEntryPointWithWebClip:(id)a3 launchOptions:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (CPSClipLaunchOptions *)a4;
  uint64_t v8 = (void *)os_transaction_create();
  if (!v7) {
    uint64_t v7 = objc_alloc_init(CPSClipLaunchOptions);
  }
  BOOL v9 = [(CPSClipLaunchOptions *)v7 skipsLaunching];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke;
  block[3] = &unk_26424F0B8;
  BOOL v19 = !v9;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v7;
  id v18 = v6;
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  dispatch_async(queue, block);
}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = [*(id *)(a1 + 48) copy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(v3 + 168);
    *(void *)(v3 + 168) = v2;
  }
  id v5 = +[CPSClipDataSQLiteStore defaultStore];
  id v6 = [*(id *)(*(void *)(a1 + 40) + 136) clipBundleID];
  char v7 = [*(id *)(*(void *)(a1 + 40) + 136) clipRequestsNotificationPermission];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 136) fullAppName];
  BOOL v9 = [*(id *)(*(void *)(a1 + 40) + 136) fullAppCaption];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 40) + 136) fullAppStoreURL];
  uint64_t v11 = [*(id *)(*(void *)(a1 + 40) + 136) clipVersionIdentifier];
  uint64_t v12 = [*(id *)(a1 + 56) bundleIdentifier];
  [*(id *)(*(void *)(a1 + 40) + 136) setWebClipID:v12];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_2;
  v20[3] = &unk_26424F090;
  id v21 = *(id *)(a1 + 32);
  id v22 = v6;
  id v23 = v8;
  id v24 = v9;
  uint64_t v30 = v11;
  uint64_t v13 = *(void *)(a1 + 40);
  id v14 = *(void **)(a1 + 48);
  id v25 = v10;
  uint64_t v26 = v13;
  char v31 = *(unsigned char *)(a1 + 64);
  char v32 = v7;
  id v27 = v14;
  id v28 = v5;
  id v29 = *(id *)(a1 + 56);
  id v15 = v5;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = v6;
  [v15 getAppClipRecordWithBundleID:v19 completion:v20];
}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (!v3) {
    uint64_t v3 = [[CPSAppClipRecord alloc] initWithBundleID:*(void *)(a1 + 40)];
  }
  [(CPSAppClipRecord *)v3 setFullApplicationName:*(void *)(a1 + 48)];
  [(CPSAppClipRecord *)v3 setFullApplicationCaption:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 104))
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithURL:*(void *)(a1 + 64) resolvingAgainstBaseURL:0];
    id v5 = (void *)MEMORY[0x263F08BD0];
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", *(void *)(a1 + 104));
    char v7 = [v5 queryItemWithName:@"minExternalVersionId" value:v6];
    objc_msgSend(v4, "cps_addQueryItem:", v7);

    uint64_t v8 = [v4 URL];
    [(CPSAppClipRecord *)v3 setFullApplicationStoreURL:v8];
  }
  else
  {
    [(CPSAppClipRecord *)v3 setFullApplicationStoreURL:*(void *)(a1 + 64)];
  }
  BOOL v9 = *(NSObject **)(*(void *)(a1 + 72) + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_3;
  block[3] = &unk_26424F068;
  __int16 v20 = *(_WORD *)(a1 + 112);
  id v14 = v3;
  id v10 = *(id *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 72);
  id v15 = v10;
  uint64_t v16 = v11;
  id v17 = *(id *)(a1 + 88);
  id v18 = *(id *)(a1 + 32);
  id v19 = *(id *)(a1 + 96);
  uint64_t v12 = v3;
  dispatch_async(v9, block);
}

void __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    if (*(unsigned char *)(a1 + 81))
    {
      uint64_t v2 = [*(id *)(a1 + 40) userNotificationGranted];
      [*(id *)(a1 + 32) setUserNotificationGranted:v2];
    }
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    [v3 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 32), "setLastProxCardLaunchTime:");

    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) locationConfirmationGranted];
    [v4 _updateLocationConfirmationForRecord:v5 permissionGranted:v6];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CPSSession_updateClipDataForEntryPointWithWebClip_launchOptions___block_invoke_4;
  v9[3] = &unk_26424F040;
  uint64_t v8 = *(void **)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v8 saveAppClipRecord:v7 completion:v9];
  [*(id *)(a1 + 48) _updateEntryPointForWebClip:*(void *)(a1 + 72)];
}

- (void)_retrieveApplicationIconWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_didFetchApplicationIcon)
  {
    (*((void (**)(id, NSURL *))v4 + 2))(v4, self->_applicationIconFileURL);
  }
  else
  {
    id v6 = (void *)MEMORY[0x2166BE5C0](self->_applicationIconFetchCompletion);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__CPSSession__retrieveApplicationIconWithCompletionHandler___block_invoke;
    v10[3] = &unk_26424F0E0;
    id v11 = v5;
    id v12 = v6;
    id v7 = v6;
    uint64_t v8 = (void *)MEMORY[0x2166BE5C0](v10);
    id applicationIconFetchCompletion = self->_applicationIconFetchCompletion;
    self->_id applicationIconFetchCompletion = v8;
  }
}

void __60__CPSSession__retrieveApplicationIconWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)_retrieveInstalledApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v25 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v25];
  id v8 = v25;
  if (!v7)
  {
    id v15 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = v15;
      id v17 = objc_msgSend(v8, "cps_privacyPreservingDescription");
      *(_DWORD *)buf = 138478083;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v17;
      _os_log_impl(&dword_21559C000, v16, OS_LOG_TYPE_INFO, "Unable to find local application record, clip %{private}@ not installed: %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  BOOL v9 = _CPSCreateUnmaskedIconDataForBundle(v6);
  if (!v9)
  {
LABEL_9:
    id v14 = 0;
    goto LABEL_17;
  }
  id v10 = v9;
  id v24 = 0;
  id v11 = +[CPSImageStore keyForImageURL:v5 error:&v24];
  id v12 = v24;
  if (v12)
  {
    uint64_t v13 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CPSSession _retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:](v13, v12);
    }
    id v14 = 0;
  }
  else
  {
    id v18 = objc_alloc_init(CPSImageStore);
    id v23 = 0;
    id v19 = [(CPSImageStore *)v18 storeImageData:v10 forKey:v11 error:&v23];
    id v20 = v23;

    if (v20)
    {
      id v21 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CPSSession _retrieveInstalledApplicationIconWithAppIconURL:clipBundleID:](v21, v20);
      }
      id v14 = 0;
    }
    else
    {
      id v14 = v19;
    }
  }
LABEL_17:

  return v14;
}

- (void)_retrieveApplicationIconWithAppIconURL:(id)a3 clipBundleID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(CPSSession *)self _retrieveInstalledApplicationIconWithAppIconURL:v6 clipBundleID:a4];
  id v9 = (id)v7;
  if (v7) {
    id v8 = (id)v7;
  }
  else {
    id v8 = v6;
  }
  [(CPSSession *)self _retrieveImageWithURL:v8 didFetchImage:&self->_didFetchApplicationIcon fileURL:&self->_applicationIconFileURL fetchCompletion:self->_applicationIconFetchCompletion proxyCompletion:&__block_literal_global_5];
}

uint64_t __66__CPSSession__retrieveApplicationIconWithAppIconURL_clipBundleID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didRetrieveApplicationIcon:");
}

- (void)_retrieveHeroImageWithHeroImageURL:(id)a3
{
}

uint64_t __49__CPSSession__retrieveHeroImageWithHeroImageURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didRetrieveHeroImage:");
}

- (void)_retrieveImageWithURL:(id)a3 didFetchImage:(BOOL *)a4 fileURL:(id *)a5 fetchCompletion:(id)a6 proxyCompletion:(id)a7
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (a4) {
    *a4 = 0;
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke;
  v32[3] = &unk_26424F128;
  v32[4] = self;
  v35 = a5;
  v36 = a4;
  id v15 = v13;
  id v33 = v15;
  id v16 = v14;
  id v34 = v16;
  id v17 = (void (**)(void, void))MEMORY[0x2166BE5C0](v32);
  if (objc_msgSend(v12, "cps_isFileURL")
    && ![(CPSClipMetadata *)self->_metadata isDeveloperOverride])
  {
    ((void (**)(void, id))v17)[2](v17, v12);
    goto LABEL_16;
  }
  if (v12)
  {
    id v18 = (void *)os_transaction_create();
    id v19 = [(CPSClipMetadata *)self->_metadata clipHeroImageURL];
    int v20 = [v12 isEqual:v19];

    id v21 = CPS_LOG_CHANNEL_PREFIXClipServices();
    BOOL v22 = os_signpost_enabled(v21);
    if (v20)
    {
      if (v22)
      {
        id v23 = v21;
        id v24 = [(CPSSession *)self logID];
        *(_DWORD *)buf = 138543618;
        v38 = v24;
        __int16 v39 = 2082;
        v40 = "[begin] Fetching header image data";
        id v25 = "HeaderImage";
LABEL_14:
        _os_signpost_emit_with_name_impl(&dword_21559C000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v25, " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
      }
    }
    else if (v22)
    {
      id v23 = v21;
      id v24 = [(CPSSession *)self logID];
      *(_DWORD *)buf = 138543618;
      v38 = v24;
      __int16 v39 = 2082;
      v40 = "[begin] Fetching application icon data";
      id v25 = "AppIcon";
      goto LABEL_14;
    }
    imageLoader = self->_imageLoader;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    void v28[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_57;
    v28[3] = &unk_26424F178;
    v28[4] = self;
    id v29 = v18;
    uint64_t v30 = v17;
    char v31 = v20;
    id v27 = v18;
    [(CPSImageLoader *)imageLoader loadImageWithURL:v12 completionHandler:v28];

    goto LABEL_16;
  }
  v17[2](v17, 0);
LABEL_16:
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = (id *)a1[7];
  if (v5) {
    objc_storeStrong(v5, a2);
  }
  id v6 = (unsigned char *)a1[8];
  if (v6) {
    *id v6 = 1;
  }
  uint64_t v7 = a1[5];
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1[4] + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(a1[6] + 16))(a1[6]);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2;
  v12[3] = &unk_26424F150;
  id v17 = *(id *)(a1 + 48);
  id v13 = v5;
  id v8 = *(id *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  int v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  BOOL v4 = os_signpost_enabled(v3);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = *(void **)(a1 + 48);
    id v6 = v3;
    uint64_t v7 = [v5 logID];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2082;
    id v14 = "[end] Fetching header image data enableTelemetry=YES ";
    id v8 = "HeaderImage";
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v9 = *(void **)(a1 + 48);
    id v6 = v3;
    uint64_t v7 = [v9 logID];
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2082;
    id v14 = "[end] Fetching application icon data enableTelemetry=YES ";
    id v8 = "AppIcon";
  }
  _os_signpost_emit_with_name_impl(&dword_21559C000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v8, " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", (uint8_t *)&v11, 0x16u);

LABEL_7:
  if (*(void *)(a1 + 56))
  {
    id v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2_cold_1(a1, v10, (id *)(a1 + 56));
    }
  }
}

- (void)_updateEntryPointForWebClip:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = +[CPSClipDataSQLiteStore defaultStore];
  uint64_t v7 = [v4 bundleIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke;
  v11[3] = &unk_26424F1A0;
  id v12 = v4;
  id v13 = v6;
  id v14 = v5;
  uint64_t v15 = self;
  id v8 = v5;
  id v9 = v6;
  id v10 = v4;
  [v9 getEntryPointRecordWithWebClipIdentifier:v7 completion:v11];
}

void __42__CPSSession__updateEntryPointForWebClip___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (!v3)
  {
    uint64_t v3 = objc_alloc_init(CPSClipEntryPointRecord);
    id v4 = [*(id *)(a1 + 32) bundleIdentifier];
    [(CPSClipEntryPointRecord *)v3 setWebClipIdentifier:v4];
  }
  id v5 = [*(id *)(a1 + 32) applicationBundleIdentifier];
  id v6 = [(CPSClipEntryPointRecord *)v3 appClipBundleID];
  char v7 = [v6 isEqualToString:v5];

  [(CPSClipEntryPointRecord *)v3 setAppClipBundleID:v5];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v9 = v8;
  [(CPSClipEntryPointRecord *)v3 lastABRFetchTime];
  if (v9 - v10 >= 604800.0) {
    char v7 = 0;
  }
  if ((v7 & 1) == 0) {
    [(CPSClipEntryPointRecord *)v3 setLastABRFetchTime:v9];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_2;
  v18[3] = &unk_26424F040;
  int v11 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  [v11 saveClipEntryPointRecord:v3 completion:v18];
  if ((v7 & 1) == 0 && ([*(id *)(a1 + 56) registeredForTest] & 1) == 0)
  {
    id v12 = [*(id *)(a1 + 56) configuration];
    char v13 = [v12 useLocalContent];

    if ((v13 & 1) == 0)
    {
      id v14 = *(void **)(a1 + 56);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_3;
      v15[3] = &unk_26424EFA0;
      v15[4] = v14;
      id v16 = *(id *)(a1 + 32);
      id v17 = *(id *)(a1 + 48);
      [v14 fetchMetadataWithCompletion:v15];
    }
  }
}

void __42__CPSSession__updateEntryPointForWebClip___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(NSObject **)(v7 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CPSSession__updateEntryPointForWebClip___block_invoke_4;
  block[3] = &unk_26424EF78;
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __42__CPSSession__updateEntryPointForWebClip___block_invoke_4(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return [*(id *)(result + 40) _updateWebClipIcon:*(void *)(result + 48) metadata:*(void *)(result + 56)];
  }
  return result;
}

- (void)_updateWebClipIcon:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = [v6 iconImagePath];
  id v10 = [MEMORY[0x263F08850] defaultManager];
  char v11 = [v10 fileExistsAtPath:v9];

  if ((v11 & 1) == 0)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__5;
    v34[4] = __Block_byref_object_dispose__5;
    id v35 = 0;
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke;
    v31[3] = &unk_26424F1F0;
    v31[4] = self;
    id v12 = v8;
    char v32 = v12;
    id v33 = v34;
    uint64_t v13 = (void (**)(void))MEMORY[0x2166BE5C0](v31);
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__5;
    v29[4] = __Block_byref_object_dispose__5;
    id v30 = 0;
    if ([v7 isPoweredByThirdParty])
    {
      if (!self->_businessIconFetchingPromise) {
        [(CPSSession *)self _fetchBusinessIconIfNeeded];
      }
      dispatch_group_enter(v12);
      objc_initWeak(&location, self);
      businessIconFetchingPromise = self->_businessIconFetchingPromise;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_3;
      v23[3] = &unk_26424F240;
      objc_copyWeak(&v27, &location);
      uint64_t v26 = v29;
      id v25 = v13;
      id v24 = v12;
      [(CPSPromise *)businessIconFetchingPromise addCompletionBlock:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    else
    {
      v13[2](v13);
    }
    id v15 = (void *)os_transaction_create();
    queue = self->_queue;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_5;
    v18[3] = &unk_26424F268;
    id v19 = v15;
    id v21 = v29;
    BOOL v22 = v34;
    id v20 = v6;
    id v17 = v15;
    dispatch_group_notify(v12, queue, v18);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v34, 8);
  }
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  int v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_2;
  v5[3] = &unk_26424F1C8;
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 _retrieveApplicationIconWithCompletionHandler:v5];
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    long long v6 = WeakRetained[1];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_4;
    v7[3] = &unk_26424F218;
    uint64_t v11 = *(void *)(a1 + 48);
    id v8 = v3;
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);
  }
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  int v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __42__CPSSession__updateWebClipIcon_metadata___block_invoke_5(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v3) {
      return;
    }
  }
  id v4 = +[CPSWebClipStore sharedStore];
  id v5 = [*(id *)(a1 + 40) identifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CPSSession__updateWebClipIcon_metadata___block_invoke_6;
  v6[3] = &unk_26424E840;
  id v7 = *(id *)(a1 + 32);
  [v4 updateAppClipIcon:v3 forWebClipWithIdentifier:v5 completionHandler:v6];
}

- (void)installationControllerWillStartInstall:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CPSSession_installationControllerWillStartInstall___block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __53__CPSSession_installationControllerWillStartInstall___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(void **)(v1 + 144);
  *(void *)(v1 + 144) = &unk_26C632BA0;
}

- (void)installationControllerDidInstallPlaceholder:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPSSession_installationControllerDidInstallPlaceholder___block_invoke;
  block[3] = &unk_26424E7B0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __58__CPSSession_installationControllerDidInstallPlaceholder___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 64) = 1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v6++), "didInstallApplicationPlaceholder", (void)v11);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v4);
  }

  id v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_signpost_enabled(v7))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v8 logID];
    *(_DWORD *)buf = 138543618;
    id v16 = v10;
    __int16 v17 = 2082;
    char v18 = "[end] Marking Placeholder request enableTelemetry=YES ";
    _os_signpost_emit_with_name_impl(&dword_21559C000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "OpenButtonBecomeActive", " ID=[%{public, signpost.description:logID}@]  Message=%{public}s ", buf, 0x16u);
  }
}

- (void)installationController:(id)a3 didUpdateProgress:(double)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__CPSSession_installationController_didUpdateProgress___block_invoke;
  v5[3] = &unk_26424EBD0;
  void v5[4] = self;
  *(double *)&v5[5] = a4;
  dispatch_async(queue, v5);
}

void __55__CPSSession_installationController_didUpdateProgress___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 144);
  *(void *)(v3 + 144) = v2;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "didUpdateInstallProgress:", *(void *)(*(void *)(a1 + 32) + 144), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)installationController:(id)a3 didFinishWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__CPSSession_installationController_didFinishWithError___block_invoke;
  v8[3] = &unk_26424E7D8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __56__CPSSession_installationController_didFinishWithError___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    int v3 = objc_msgSend(v2, "cps_isUserCanceledError");
    uint64_t v4 = 2;
    if (v3) {
      uint64_t v4 = 3;
    }
  }
  else
  {
    uint64_t v4 = 3;
  }
  *(void *)(*(void *)(a1 + 32) + 64) = v4;
  id v5 = +[CPSAnalyticsLogger sharedLogger];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 136) clipBundleID];
  [v5 recordDidInstallWithBundleID:v6 succeeded:*(void *)(*(void *)(a1 + 32) + 64) == 3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "didFinishLoadingWithError:", *(void *)(a1 + 40), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NSURL)url
{
  return self->_url;
}

- (CPSClipMetadata)metadata
{
  return self->_metadata;
}

- (NSNumber)estimatedProgress
{
  return self->_estimatedProgress;
}

- (CPSAppInfoFetching)appInfoFetcher
{
  return self->_appInfoFetcher;
}

- (void)setAppInfoFetcher:(id)a3
{
}

- (CPSBusinessItemFetching)businessItemFetcher
{
  return self->_businessItemFetcher;
}

- (void)setBusinessItemFetcher:(id)a3
{
}

- (CPSClipLaunchOptions)launchOptions
{
  return self->_launchOptions;
}

- (CPSSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)isOpeningWebClipFromDaemon
{
  return self->_openingWebClipFromDaemon;
}

- (void)setOpeningWebClipFromDaemon:(BOOL)a3
{
  self->_openingWebClipFromDaemon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_businessItemFetcher, 0);
  objc_storeStrong((id *)&self->_appInfoFetcher, 0);
  objc_storeStrong((id *)&self->_estimatedProgress, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_businessIconFetchingPromise, 0);
  objc_storeStrong(&self->_applicationIconFetchCompletion, 0);
  objc_storeStrong(&self->_metadataCompletion, 0);
  objc_storeStrong((id *)&self->_metadataFetchError, 0);
  objc_storeStrong((id *)&self->_businessIconFileURL, 0);
  objc_storeStrong((id *)&self->_heroImageFileURL, 0);
  objc_storeStrong((id *)&self->_applicationIconFileURL, 0);
  objc_storeStrong((id *)&self->_imageLoader, 0);
  objc_storeStrong((id *)&self->_proxyObjects, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"NSString *getCKErrorDomain(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSSession.m", 36, @"%s", dlerror());

  __break(1u);
}

void __36__CPSSession__fetchBusinessMetadata__block_invoke_2_14_cold_2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_21559C000, a2, a3, "-_fetchBusinessMetadata: Calling _didFinishLoadingWithError with CPSErrorNetworkUnavailable. Original error is: %@", (uint8_t *)&v4);
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 logID];
  long long v13 = objc_msgSend(*a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21559C000, v7, v8, "Fail to fetch AppMetadata. ID = [%@] Error: %@", v9, v10, v11, v12, 2u);
}

void __72__CPSSession__fetchAppMetadataWithBundleID_url_accountInvocationPolicy___block_invoke_2_cold_2(uint64_t a1, void *a2, id *a3)
{
  int v4 = *(void **)(*(void *)a1 + 136);
  id v5 = a2;
  uint64_t v6 = [v4 clipBundleID];
  long long v13 = [*a3 clipBundleID];
  OUTLINED_FUNCTION_0_2(&dword_21559C000, v7, v8, "ABR BundleID: %{private}@ and AMP BundleID: %{private}@ do not match.", v9, v10, v11, v12, 3u);
}

void __40__CPSSession__fetchBusinessIconIfNeeded__block_invoke_26_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138477827;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_2(&dword_21559C000, a2, a3, "Business icon fetching failed: %{private}@", (uint8_t *)&v4);
}

- (void)_retrieveInstalledApplicationIconWithAppIconURL:(void *)a1 clipBundleID:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  int v6 = 138543362;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_21559C000, v3, v5, "Unable to write app icon to disk: %{public}@", (uint8_t *)&v6);
}

- (void)_retrieveInstalledApplicationIconWithAppIconURL:(void *)a1 clipBundleID:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = objc_msgSend(a2, "cps_privacyPreservingDescription");
  int v6 = 138543362;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_21559C000, v3, v5, "Unable to get image store key for app icon url: %{public}@", (uint8_t *)&v6);
}

void __90__CPSSession__retrieveImageWithURL_didFetchImage_fileURL_fetchCompletion_proxyCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  int v4 = *(void **)(a1 + 48);
  id v5 = a2;
  int v6 = [v4 logID];
  long long v13 = objc_msgSend(*a3, "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21559C000, v7, v8, "Fail to fetch image or icon data. ID = [%{public}@] Error: %{public}@", v9, v10, v11, v12, 2u);
}

@end