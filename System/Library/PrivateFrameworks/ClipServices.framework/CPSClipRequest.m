@interface CPSClipRequest
+ (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5;
+ (void)deleteClipsWithBundleIDs:(id)a3 completion:(id)a4;
+ (void)getLocationConfirmationConsentForBundleID:(id)a3 completion:(id)a4;
+ (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4;
- (BOOL)shouldReturnErrorOnUserCancellation;
- (CPSClipRequest)initWithURL:(id)a3;
- (CPSClipRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4;
- (id)_errorIgnoringUserCancelledErrorIfNeeded:(id)a3;
- (id)sessionProxy;
- (void)_openClipWithInvocationUI;
- (void)cancel;
- (void)dealloc;
- (void)installClipWithBundleID:(id)a3 completion:(id)a4;
- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4;
- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)proxyAppDidLaunchForTesting:(id)a3;
- (void)proxyDidUpdateMetadata:(id)a3;
- (void)proxyRemoteServiceDidCrash:(id)a3;
- (void)requestClipWithCompletion:(id)a3;
- (void)setShouldReturnErrorOnUserCancellation:(BOOL)a3;
@end

@implementation CPSClipRequest

- (CPSClipRequest)initWithURL:(id)a3
{
  return [(CPSClipRequest *)self initWithURL:a3 fallbackClipBundleID:0];
}

- (CPSClipRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)CPSClipRequest,
        (self = [(CPSClipRequest *)&v13 init]) != 0))
  {
    v8 = [[CPSSessionProxy alloc] initWithURL:v6];
    sessionProxy = self->_sessionProxy;
    self->_sessionProxy = v8;

    v10 = +[CPSSessionConfiguration standardConfigurationWithURL:v6 fallbackBundleID:v7];
    [(CPSSessionProxy *)self->_sessionProxy setConfiguration:v10];

    [(CPSSessionProxy *)self->_sessionProxy setDelegate:self];
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)requestClipWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __44__CPSClipRequest_requestClipWithCompletion___block_invoke;
  v11 = &unk_26424F860;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x2166BE5C0](&v8);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  [(CPSSessionProxy *)self->_sessionProxy connectToService];
}

void __44__CPSClipRequest_requestClipWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (id)sessionProxy
{
  return self->_sessionProxy;
}

- (void)cancel
{
  [(CPSSessionProxy *)self->_sessionProxy disconnect];
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = 0;
}

- (void)dealloc
{
  [(CPSSessionProxy *)self->_sessionProxy disconnect];
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = 0;

  v4.receiver = self;
  v4.super_class = (Class)CPSClipRequest;
  [(CPSClipRequest *)&v4 dealloc];
}

+ (void)deleteClipsWithBundleIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[CPSDaemonConnection sharedConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke;
  v11[3] = &unk_26424F888;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 uninstallClipsWithBundleIDs:v10 completionHandler:v11];
}

void __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_cold_1(a1, v5, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218243;
    uint64_t v14 = v6;
    __int16 v15 = 2113;
    uint64_t v16 = v7;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Deleted clip with bundleIDs %{private}@", buf, 0x16u);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_6;
  v10[3] = &unk_26424ECC0;
  id v8 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSDaemonConnection sharedConnection];
  [v7 getUserNotificationConsentForBundleID:v6 completion:v5];
}

+ (void)getLocationConfirmationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[CPSDaemonConnection sharedConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __71__CPSClipRequest_getLocationConfirmationConsentForBundleID_completion___block_invoke;
  v9[3] = &unk_26424F8B0;
  id v10 = v5;
  id v8 = v5;
  [v7 getLastLaunchOptionsWithBundleID:v6 completion:v9];
}

void __71__CPSClipRequest_getLocationConfirmationConsentForBundleID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 locationConfirmationGranted];
  (*(void (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, [v3 BOOLValue], 0);
}

+ (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[CPSDaemonConnection sharedConnection];
  [v10 confirmLocationWithURL:v9 inRegion:v8 completion:v7];
}

- (void)installClipWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  sessionProxy = self->_sessionProxy;
  id v8 = a3;
  id v9 = [(CPSSessionProxy *)sessionProxy configuration];
  uint64_t v10 = [v9 usedByPPT];

  if (v10)
  {
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __53__CPSClipRequest_installClipWithBundleID_completion___block_invoke;
    v23 = &unk_26424F860;
    v24 = self;
    id v25 = v6;
    id v11 = (void *)MEMORY[0x2166BE5C0](&v20);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v11;
  }
  else
  {
    id v13 = +[CPSSessionConfiguration localConfiguration];
    [(CPSSessionProxy *)self->_sessionProxy setConfiguration:v13];
  }
  [(CPSSessionProxy *)self->_sessionProxy connectToService];
  uint64_t v14 = objc_alloc_init(CPSClipLaunchOptions);
  [(CPSClipLaunchOptions *)v14 setPredefinedBundleID:v8];

  [(CPSClipLaunchOptions *)v14 setSkipsLaunching:v10];
  __int16 v15 = [(CPSSessionProxy *)self->_sessionProxy configuration];
  uint64_t v16 = [v15 launchReason];
  int v17 = [v16 isEqualToString:@"DeveloperTools"];

  if (v17)
  {
    uint64_t v18 = MEMORY[0x263EFFA88];
    [(CPSClipLaunchOptions *)v14 setLocationConfirmationGranted:MEMORY[0x263EFFA88]];
    [(CPSClipLaunchOptions *)v14 setUserNotificationGranted:v18];
  }
  if (v10) {
    id v19 = 0;
  }
  else {
    id v19 = v6;
  }
  [(CPSSessionProxy *)self->_sessionProxy openClipWithLaunchOptions:v14 completion:v19];
}

void __53__CPSClipRequest_installClipWithBundleID_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (id)_errorIgnoringUserCancelledErrorIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(CPSClipRequest *)self shouldReturnErrorOnUserCancellation]
    || (objc_msgSend(v4, "cps_isUserCanceledError") & 1) == 0)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_openClipWithInvocationUI
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    sessionProxy = self->_sessionProxy;
    id v5 = v3;
    id v6 = [(CPSSessionProxy *)sessionProxy url];
    *(_DWORD *)buf = 134218243;
    id v11 = self;
    __int16 v12 = 2117;
    id v13 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Showing invocation UI for %{sensitive}@", buf, 0x16u);
  }
  id v7 = +[CPSDaemonConnection sharedConnection];
  id v8 = [(CPSSessionProxy *)self->_sessionProxy url];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__CPSClipRequest__openClipWithInvocationUI__block_invoke;
  v9[3] = &unk_26424E840;
  void v9[4] = self;
  [v7 openClipWithInvocationUIIfNeededWithURL:v8 completionHandler:v9];
}

void __43__CPSClipRequest__openClipWithInvocationUI__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__CPSClipRequest__openClipWithInvocationUI__block_invoke_2;
  v5[3] = &unk_26424E7D8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __43__CPSClipRequest__openClipWithInvocationUI__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _errorIgnoringUserCancelledErrorIfNeeded:*(void *)(a1 + 40)];
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 8);
    id v7 = v3;
    id v8 = [v6 url];
    id v9 = objc_msgSend(v2, "cps_privacyPreservingDescription");
    int v14 = 134218499;
    uint64_t v15 = v5;
    __int16 v16 = 2117;
    int v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Failed to show invocation UI for %{sensitive}@: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 8);
    __int16 v12 = v3;
    id v8 = [v11 url];
    int v14 = 134218243;
    uint64_t v15 = v10;
    __int16 v16 = 2117;
    int v17 = v8;
    _os_log_impl(&dword_21559C000, v12, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Finished showing invocation UI for %{sensitive}@", (uint8_t *)&v14, 0x16u);
  }
LABEL_7:
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v13) {
    (*(void (**)(uint64_t, BOOL, void *))(v13 + 16))(v13, [v2 code] != 11, v2);
  }
}

- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    self->_shouldOpenClipWhenMetadataIsUpdated = 0;
    id v7 = [(CPSSessionProxy *)self->_sessionProxy configuration];
    char v8 = [v7 useLocalContent];

    if ((v8 & 1) == 0) {
      [(CPSClipRequest *)self _openClipWithInvocationUI];
    }
  }
  else
  {
    id v9 = [(CPSSessionProxy *)self->_sessionProxy configuration];
    uint64_t v10 = [v9 fallbackClipBundleID];

    if (v10)
    {
      self->_shouldOpenClipWhenMetadataIsUpdated = 1;
    }
    else
    {
      self->_shouldOpenClipWhenMetadataIsUpdated = 0;
      id v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        sessionProxy = self->_sessionProxy;
        uint64_t v13 = v11;
        int v14 = [(CPSSessionProxy *)sessionProxy url];
        int v20 = 134218243;
        uint64_t v21 = self;
        __int16 v22 = 2117;
        v23 = v14;
        _os_log_impl(&dword_21559C000, v13, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Clip is not available for %{sensitive}@", (uint8_t *)&v20, 0x16u);
      }
      uint64_t v15 = +[CPSAnalyticsLogger sharedLogger];
      __int16 v16 = [(CPSSessionProxy *)self->_sessionProxy configuration];
      int v17 = [v16 launchReason];
      [v15 recordClientClipRequestWithBundleID:0 launchReason:v17];

      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      if (completionHandler)
      {
        id v19 = objc_msgSend(MEMORY[0x263F087E8], "cps_errorWithCode:", 2);
        completionHandler[2](completionHandler, 0, v19);
      }
      [(CPSSessionProxy *)self->_sessionProxy disconnect];
    }
  }
}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v11 = a3;
  BOOL v4 = [v11 metadata];
  int v5 = [v4 hasAppMetadata];

  if (v5)
  {
    id v6 = +[CPSAnalyticsLogger sharedLogger];
    id v7 = [v11 metadata];
    char v8 = [v7 clipBundleID];
    id v9 = [(CPSSessionProxy *)self->_sessionProxy configuration];
    uint64_t v10 = [v9 launchReason];
    [v6 recordClientClipRequestWithBundleID:v8 launchReason:v10];
  }
  if (self->_shouldOpenClipWhenMetadataIsUpdated)
  {
    self->_shouldOpenClipWhenMetadataIsUpdated = 0;
    [(CPSClipRequest *)self _openClipWithInvocationUI];
  }
}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (self->_completionHandler)
  {
    id v9 = [(CPSClipRequest *)self _errorIgnoringUserCancelledErrorIfNeeded:v7];

    uint64_t v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
    id v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sessionProxy = self->_sessionProxy;
        uint64_t v13 = v11;
        int v14 = [(CPSSessionProxy *)sessionProxy url];
        uint64_t v15 = objc_msgSend(v9, "cps_privacyPreservingDescription");
        int v18 = 134218755;
        id v19 = self;
        __int16 v20 = 2117;
        uint64_t v21 = v14;
        __int16 v22 = 2114;
        id v23 = v15;
        __int16 v24 = 2048;
        id v25 = v6;
        _os_log_error_impl(&dword_21559C000, v13, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Failed to show invocation UI for %{sensitive}@: %{public}@, proxy: %p", (uint8_t *)&v18, 0x2Au);

LABEL_8:
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v16 = self->_sessionProxy;
      int v17 = v11;
      int v14 = [(CPSSessionProxy *)v16 url];
      int v18 = 134218499;
      id v19 = self;
      __int16 v20 = 2117;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      id v23 = v6;
      _os_log_impl(&dword_21559C000, v17, OS_LOG_TYPE_INFO, "CPSClipRequest (%p): Finished showing invocation UI for %{sensitive}@, proxy: %p", (uint8_t *)&v18, 0x20u);

      goto LABEL_8;
    }
    (*((void (**)(void))self->_completionHandler + 2))();
    goto LABEL_10;
  }
  id v9 = v7;
LABEL_10:
}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4 = a3;
  int v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(CPSClipRequest *)(uint64_t)self proxyRemoteServiceDidCrash:v5];
  }
}

- (void)proxyAppDidLaunchForTesting:(id)a3
{
  if ([a3 usedByPPT])
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"com.apple.ClipServices.Notification.TestComplete" object:0];
  }
}

- (BOOL)shouldReturnErrorOnUserCancellation
{
  return self->_shouldReturnErrorOnUserCancellation;
}

- (void)setShouldReturnErrorOnUserCancellation:(BOOL)a3
{
  self->_shouldReturnErrorOnUserCancellation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_sessionProxy, 0);
}

void __54__CPSClipRequest_deleteClipsWithBundleIDs_completion___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a2;
  id v7 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v8 = 134218499;
  uint64_t v9 = v4;
  __int16 v10 = 2113;
  uint64_t v11 = v5;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_21559C000, v6, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Failed to delete clip with bundleIDs %{private}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

- (void)proxyRemoteServiceDidCrash:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "CPSClipRequest (%p): Remote service crashed for proxy: %p", (uint8_t *)&v3, 0x16u);
}

@end