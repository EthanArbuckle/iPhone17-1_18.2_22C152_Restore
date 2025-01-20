@interface CPSClipMetadataRequest
- (BOOL)isLikelyAvailable;
- (CPSClipMetadataRequest)initWithURL:(id)a3;
- (CPSClipMetadataRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4;
- (CPSClipMetadataRequest)initWithURLHash:(id)a3;
- (CPSSessionConfiguration)sessionConfiguration;
- (id)getClipMetadataSynchronously;
- (id)getDownloadedIconURLSynchronously;
- (void)_setUpSessionProxyAndPromisesWithURL:(id)a3 fallbackClipBundleID:(id)a4;
- (void)dealloc;
- (void)getClipMetadataSynchronously;
- (void)getDownloadedIconURLSynchronously;
- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4;
- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4;
- (void)proxyDidRetrieveBusinessIcon:(id)a3;
- (void)proxyDidUpdateMetadata:(id)a3;
- (void)proxyRemoteServiceDidCrash:(id)a3;
- (void)requestDownloadedIconWithMetadata:(id)a3 completion:(id)a4;
- (void)requestMetadataWithCompletion:(id)a3;
@end

@implementation CPSClipMetadataRequest

- (CPSClipMetadataRequest)initWithURLHash:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSClipMetadataRequest;
  v5 = [(CPSClipMetadataRequest *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fullHash = v5->_fullHash;
    v5->_fullHash = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (CPSClipMetadataRequest)initWithURL:(id)a3
{
  return [(CPSClipMetadataRequest *)self initWithURL:a3 fallbackClipBundleID:0];
}

- (CPSClipMetadataRequest)initWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPSClipMetadataRequest;
  v8 = [(CPSClipMetadataRequest *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(CPSClipMetadataRequest *)v8 _setUpSessionProxyAndPromisesWithURL:v6 fallbackClipBundleID:v7];
    objc_super v10 = v9;
  }

  return v9;
}

- (void)_setUpSessionProxyAndPromisesWithURL:(id)a3 fallbackClipBundleID:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = +[CPSPromise promise];
  availabilityPromise = self->_availabilityPromise;
  self->_availabilityPromise = v8;

  objc_super v10 = +[CPSPromise promise];
  iconPromise = self->_iconPromise;
  self->_iconPromise = v10;

  objc_super v12 = +[CPSPromise promise];
  metadataPromise = self->_metadataPromise;
  self->_metadataPromise = v12;

  v14 = [[CPSSessionProxy alloc] initWithURL:v6];
  sessionProxy = self->_sessionProxy;
  self->_sessionProxy = v14;

  v16 = +[CPSSessionConfiguration standardConfigurationWithURL:v6 fallbackBundleID:v7];

  [(CPSSessionProxy *)self->_sessionProxy setConfiguration:v16];
  [(CPSSessionProxy *)self->_sessionProxy setDelegate:self];
  [(CPSSessionProxy *)self->_sessionProxy connectToService];
  v17 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    uint64_t v19 = objc_opt_class();
    v20 = self->_sessionProxy;
    int v21 = 138544131;
    uint64_t v22 = v19;
    __int16 v23 = 2048;
    v24 = self;
    __int16 v25 = 2048;
    v26 = v20;
    __int16 v27 = 2117;
    id v28 = v6;
    _os_log_impl(&dword_21559C000, v18, OS_LOG_TYPE_INFO, "%{public}@ (%p): session proxy (%p) set up for URL %{sensitive}@", (uint8_t *)&v21, 0x2Au);
  }
}

- (CPSSessionConfiguration)sessionConfiguration
{
  return [(CPSSessionProxy *)self->_sessionProxy configuration];
}

- (BOOL)isLikelyAvailable
{
  if (self->_fullHash) {
    return 1;
  }
  v3 = [(CPSSessionProxy *)self->_sessionProxy url];
  id v4 = objc_msgSend(v3, "cps_fallbackBundleIdentifier");

  if (v4) {
    return 1;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  int v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  availabilityPromise = self->_availabilityPromise;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __43__CPSClipMetadataRequest_isLikelyAvailable__block_invoke;
  v14 = &unk_26424F718;
  v16 = &v17;
  v9 = v7;
  v15 = v9;
  [(CPSPromise *)availabilityPromise addCompletionBlock:&v11];
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v9, v10);
  char v5 = objc_msgSend((id)v18[5], "BOOLValue", v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
  return v5;
}

void __43__CPSClipMetadataRequest_isLikelyAvailable__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)getClipMetadataSynchronously
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!self->_sessionProxy)
  {
    uint64_t v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CPSClipMetadataRequest getClipMetadataSynchronously](v12);
    }
    goto LABEL_8;
  }
  if (![(CPSClipMetadataRequest *)self isLikelyAvailable])
  {
LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  metadataPromise = self->_metadataPromise;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __54__CPSClipMetadataRequest_getClipMetadataSynchronously__block_invoke;
  uint64_t v17 = &unk_26424F740;
  uint64_t v19 = &v20;
  char v5 = v3;
  v18 = v5;
  [(CPSPromise *)metadataPromise addCompletionBlock:&v14];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v5, v6);
  id v7 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v21[5];
    dispatch_time_t v10 = [(CPSSessionProxy *)self->_sessionProxy url];
    *(_DWORD *)buf = 138544131;
    uint64_t v27 = v8;
    __int16 v28 = 2048;
    uint64_t v29 = self;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2117;
    v33 = v10;
    _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): requested metadata %p for %{sensitive}@", buf, 0x2Au);
  }
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
LABEL_9:

  return v11;
}

void __54__CPSClipMetadataRequest_getClipMetadataSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)getDownloadedIconURLSynchronously
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (!self->_sessionProxy)
  {
    uint64_t v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CPSClipMetadataRequest getDownloadedIconURLSynchronously](v12);
    }
    goto LABEL_8;
  }
  if (![(CPSClipMetadataRequest *)self isLikelyAvailable])
  {
LABEL_8:
    id v11 = 0;
    goto LABEL_9;
  }
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  iconPromise = self->_iconPromise;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __59__CPSClipMetadataRequest_getDownloadedIconURLSynchronously__block_invoke;
  uint64_t v17 = &unk_26424F768;
  uint64_t v19 = &v20;
  char v5 = v3;
  v18 = v5;
  [(CPSPromise *)iconPromise addCompletionBlock:&v14];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v5, v6);
  id v7 = (id)CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v21[5];
    dispatch_time_t v10 = [(CPSSessionProxy *)self->_sessionProxy url];
    *(_DWORD *)buf = 138544131;
    uint64_t v27 = v8;
    __int16 v28 = 2048;
    uint64_t v29 = self;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2117;
    v33 = v10;
    _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ (%p): requested icon URL %p for %{sensitive}@", buf, 0x2Au);
  }
  id v11 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
LABEL_9:

  return v11;
}

void __59__CPSClipMetadataRequest_getDownloadedIconURLSynchronously__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    uint64_t v5 = objc_opt_class();
    sessionProxy = self->_sessionProxy;
    *(_DWORD *)buf = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2048;
    v13 = sessionProxy;
    _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_INFO, "%{public}@ (%p): Disconnecting session proxy (%p)", buf, 0x20u);
  }
  [(CPSSessionProxy *)self->_sessionProxy disconnect];
  v7.receiver = self;
  v7.super_class = (Class)CPSClipMetadataRequest;
  [(CPSClipMetadataRequest *)&v7 dealloc];
}

- (void)requestMetadataWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke;
  v17[3] = &unk_26424F7B8;
  v17[4] = self;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = MEMORY[0x2166BE5C0](v17);
  objc_super v7 = (void *)v6;
  if (self->_sessionProxy)
  {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
  else
  {
    uint64_t v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      uint64_t v10 = objc_opt_class();
      fullHash = self->_fullHash;
      *(_DWORD *)buf = 138543875;
      uint64_t v20 = v10;
      __int16 v21 = 2048;
      uint64_t v22 = self;
      __int16 v23 = 2117;
      v24 = fullHash;
      _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting url for %{sensitive}@", buf, 0x20u);
    }
    __int16 v12 = +[CPSDaemonConnection sharedConnection];
    v13 = self->_fullHash;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_15;
    v14[3] = &unk_26424F7E0;
    v14[4] = self;
    id v15 = v5;
    id v16 = v7;
    [v12 fetchClipURLWithURLHash:v13 completionHandler:v14];
  }
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting metadata asynchronously", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__7;
  id v15 = __Block_byref_object_dispose__7;
  id v16 = *(id *)(a1 + 32);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_11;
  v9[3] = &unk_26424F790;
  id v11 = buf;
  char v12 = a2;
  id v10 = *(id *)(a1 + 40);
  [v8 addCompletionBlock:v9];

  _Block_object_dispose(buf, 8);
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_11_cold_1(a1, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v20 = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): got metadata asynchronously", (uint8_t *)&v20, 0x16u);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    char v12 = +[CPSAnalyticsLogger sharedLogger];
    v13 = [v5 clipBundleID];
    [v12 recordClientMetadataRequestWithBundleID:v13 launchReason:@"LocationBased"];

    uint64_t v14 = [v5 invocationPolicy];
    if ([v14 isEligible])
    {
    }
    else
    {
      id v15 = [v5 invocationPolicy];
      int v16 = [v15 isRecoverable];

      if (!v16)
      {
        uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_12;
      }
    }
  }
  uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_12:
  v17();
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0;
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_15_cold_1(a1, v8, v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 8);
      int v13 = 138543875;
      uint64_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v11;
      __int16 v17 = 2117;
      uint64_t v18 = v12;
      _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): finished requesting url for %{sensitive}@", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 32) _setUpSessionProxyAndPromisesWithURL:v5 fallbackClipBundleID:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)requestDownloadedIconWithMetadata:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (!self->_sessionProxy)
  {
    uint64_t v8 = [v6 clipURL];

    if (!v8)
    {
      v7[2](v7, 0);
      goto LABEL_7;
    }
    uint64_t v9 = [v6 clipURL];
    [(CPSClipMetadataRequest *)self _setUpSessionProxyAndPromisesWithURL:v9 fallbackClipBundleID:0];
  }
  uint64_t v10 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_21559C000, v11, OS_LOG_TYPE_INFO, "%{public}@ (%p): requesting icon asynchronously", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  uint64_t v19 = self;
  iconPromise = v19->_iconPromise;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke;
  v13[3] = &unk_26424F808;
  __int16 v15 = buf;
  uint64_t v14 = v7;
  [(CPSPromise *)iconPromise addCompletionBlock:v13];

  _Block_object_dispose(buf, 8);
LABEL_7:
}

void __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v8 = v7;
  if (!a2 || v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke_cold_1(a1, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v14 = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_21559C000, v9, OS_LOG_TYPE_INFO, "%{public}@ (%p): got icon asynchronously", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

- (void)proxy:(id)a3 didDetermineAvailability:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4)
  {
    id v6 = +[CPSAnalyticsLogger sharedLogger];
    uint64_t v7 = [(CPSSessionProxy *)self->_sessionProxy configuration];
    uint64_t v8 = [v7 launchReason];
    [v6 recordClientMetadataRequestWithBundleID:0 launchReason:v8];
  }
  availabilityPromise = self->_availabilityPromise;
  id v10 = [NSNumber numberWithBool:v4];
  [(CPSPromise *)availabilityPromise finishWithResult:v10];
}

- (void)proxy:(id)a3 didRetrieveApplicationIcon:(id)a4
{
  id v9 = a3;
  id v5 = [v9 metadata];
  char v6 = [v5 isPoweredByThirdParty];

  if ((v6 & 1) == 0)
  {
    iconPromise = self->_iconPromise;
    uint64_t v8 = [v9 applicationIconFileURL];
    [(CPSPromise *)iconPromise finishWithResult:v8];
  }
}

- (void)proxyDidUpdateMetadata:(id)a3
{
  id v16 = a3;
  BOOL v4 = [v16 metadata];
  int v5 = [v4 hasAppMetadata];

  if (v5)
  {
    char v6 = +[CPSAnalyticsLogger sharedLogger];
    uint64_t v7 = [v16 metadata];
    uint64_t v8 = [v7 clipBundleID];
    id v9 = [(CPSSessionProxy *)self->_sessionProxy configuration];
    id v10 = [v9 launchReason];
    [v6 recordClientMetadataRequestWithBundleID:v8 launchReason:v10];

    metadataPromise = self->_metadataPromise;
    uint64_t v12 = [v16 metadata];
    [(CPSPromise *)metadataPromise finishWithResult:v12];
  }
  else
  {
    int v13 = [v16 metadata];
    uint64_t v12 = [v13 invocationPolicy];

    if (v12 && ([v12 isEligible] & 1) == 0 && (objc_msgSend(v12, "isRecoverable") & 1) == 0)
    {
      int v14 = self->_metadataPromise;
      uint64_t v15 = [v16 metadata];
      [(CPSPromise *)v14 finishWithResult:v15];

      [(CPSPromise *)self->_iconPromise finish];
    }
  }
}

- (void)proxyDidRetrieveBusinessIcon:(id)a3
{
  iconPromise = self->_iconPromise;
  id v4 = [a3 businessIconURL];
  [(CPSPromise *)iconPromise finishWithResult:v4];
}

- (void)proxyRemoteServiceDidCrash:(id)a3
{
  id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"CPSErrorDomain" code:3 userInfo:0];
  [(CPSPromise *)self->_metadataPromise finishWithError:v4];
  [(CPSPromise *)self->_iconPromise finishWithError:v4];
}

- (void)proxy:(id)a3 didFinishLoadingWithError:(id)a4
{
  metadataPromise = self->_metadataPromise;
  id v6 = a4;
  [(CPSPromise *)metadataPromise finishWithError:v6];
  [(CPSPromise *)self->_iconPromise finishWithError:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataPromise, 0);
  objc_storeStrong((id *)&self->_iconPromise, 0);
  objc_storeStrong((id *)&self->_availabilityPromise, 0);
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);

  objc_storeStrong((id *)&self->_fullHash, 0);
}

- (void)getClipMetadataSynchronously
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_21559C000, v2, v3, "%{public}@ (%p): synchronous metadata fetching only works with URL based request, please use initWithURL:", v4, v5, v6, v7, v8);
}

- (void)getDownloadedIconURLSynchronously
{
  id v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3(&dword_21559C000, v2, v3, "%{public}@ (%p): synchronous metadata fetching only works with URL based request, please use initWithURL:", v4, v5, v6, v7, v8);
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_11_cold_1(uint64_t a1, void *a2)
{
  id v2 = OUTLINED_FUNCTION_5_0(a1, a2);
  objc_opt_class();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_2(&dword_21559C000, v4, v5, "%{public}@ (%p): failed to get metadata: %{public}@", v6, v7, v8, v9, v10);
}

void __56__CPSClipMetadataRequest_requestMetadataWithCompletion___block_invoke_15_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 8);
  uint64_t v9 = objc_msgSend(a3, "cps_privacyPreservingDescription");
  int v10 = 138544131;
  uint64_t v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  __int16 v14 = 2117;
  uint64_t v15 = v8;
  __int16 v16 = 2114;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_21559C000, v5, OS_LOG_TYPE_ERROR, "%{public}@ (%p): error requesting url for %{sensitive}@: %{public}@", (uint8_t *)&v10, 0x2Au);
}

void __71__CPSClipMetadataRequest_requestDownloadedIconWithMetadata_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = OUTLINED_FUNCTION_5_0(a1, a2);
  objc_opt_class();
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_4(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_2(&dword_21559C000, v4, v5, "%{public}@ (%p): failed to get icon: %{public}@", v6, v7, v8, v9, v10);
}

@end