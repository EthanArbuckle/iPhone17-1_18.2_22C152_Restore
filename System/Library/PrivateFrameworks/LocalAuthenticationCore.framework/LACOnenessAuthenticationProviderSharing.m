@interface LACOnenessAuthenticationProviderSharing
- (BOOL)isAvailable;
- (LACOnenessAuthenticationProviderDelegate)delegate;
- (LACOnenessAuthenticationProviderSharing)initWithReplyQueue:(id)a3;
- (id)_domainStateDictionaryForJoinedIDs:(id)a3;
- (id)authenticateClient:(id)a3 withAcmContext:(id)a4;
- (id)authenticationBackgroundTaskForClient:(id)a3 withAcmContext:(id)a4;
- (id)domainStateBackgroundTask;
- (void)_authenticateClient:(id)a3 withAcmContext:(id)a4 completion:(id)a5;
- (void)_domainStateWithCompletion:(id)a3;
- (void)_failAuthenticationWithID:(id)a3 error:(id)a4;
- (void)_runDomainStateBackgroundTaskWithCompletion:(id)a3;
- (void)cancelAuthenticationWithID:(id)a3;
- (void)domainStateForRequest:(id)a3 completion:(id)a4;
- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACOnenessAuthenticationProviderSharing

- (BOOL)isAvailable
{
  return 1;
}

- (LACOnenessAuthenticationProviderSharing)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LACOnenessAuthenticationProviderSharing;
  v6 = [(LACOnenessAuthenticationProviderSharing *)&v15 init];
  if (v6)
  {
    if (getSFAuthenticationManagerClass())
    {
      uint64_t v7 = [objc_alloc((Class)getSFAuthenticationManagerClass()) initWithQueue:v5];
      sharingManager = v6->_sharingManager;
      v6->_sharingManager = (SFAuthenticationManager *)v7;

      [(SFAuthenticationManager *)v6->_sharingManager setDelegate:v6];
    }
    else
    {
      v9 = v6->_sharingManager;
      v6->_sharingManager = 0;
    }
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:v11];
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v6->_replyQueue, a3);
  }

  return v6;
}

- (id)authenticateClient:(id)a3 withAcmContext:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = LACLogABM();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 bundleId];
    v10 = [v6 displayName];
    int v22 = 138543618;
    v23 = v9;
    __int16 v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_254F14000, v8, OS_LOG_TYPE_DEFAULT, "Initiating companion authentication for bundleID: %{public}@ app name: %{public}@", (uint8_t *)&v22, 0x16u);
  }
  v11 = [(LACOnenessAuthenticationProviderSharing *)self authenticationBackgroundTaskForClient:v6 withAcmContext:v7];

  uint64_t v12 = [v11 runSynchronouslyWithTimeout:1.0];
  v13 = LACLogABM();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v6 bundleId];
    objc_super v15 = [v6 displayName];
    int v22 = 138543874;
    v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_254F14000, v13, OS_LOG_TYPE_DEFAULT, "Authentication for bundleID: %{public}@ app name: %{public}@ returned: %{public}@", (uint8_t *)&v22, 0x20u);
  }
  v16 = [v12 value];
  v17 = [v12 error];

  if (v17 || !v16)
  {
    id v18 = (id)objc_opt_new();
    v19 = [v12 error];
    v20 = +[LACError errorWithCode:-1 underlyingError:v19];

    [(LACOnenessAuthenticationProviderSharing *)self _failAuthenticationWithID:v18 error:v20];
  }
  else
  {
    id v18 = v16;
  }

  return v18;
}

- (void)cancelAuthenticationWithID:(id)a3
{
  id v4 = a3;
  if (self->_sharingManager)
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__LACOnenessAuthenticationProviderSharing_cancelAuthenticationWithID___block_invoke;
    block[3] = &unk_2653B5A88;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(workQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = +[LACError errorWithCode:-4];
    [(LACOnenessAuthenticationProviderSharing *)self _failAuthenticationWithID:v4 error:v6];
  }
}

void __70__LACOnenessAuthenticationProviderSharing_cancelAuthenticationWithID___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] cancelAuthenticationSessionWithID:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)domainStateForRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = LACLogABM();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_254F14000, v6, OS_LOG_TYPE_DEFAULT, "Fetching Oneness domain state", buf, 2u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__LACOnenessAuthenticationProviderSharing_domainStateForRequest_completion___block_invoke;
  v8[3] = &unk_2653B58B0;
  id v9 = v5;
  id v7 = v5;
  [(LACOnenessAuthenticationProviderSharing *)self _runDomainStateBackgroundTaskWithCompletion:v8];
}

void __76__LACOnenessAuthenticationProviderSharing_domainStateForRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogABM();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      id v8 = v5;
    }
    else {
      id v8 = v6;
    }
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Oneness domain state returned: %@", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  p_delegate = &self->delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authenticationProvider:self didStartAuthenticationWithID:v6];
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  p_delegate = &self->delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authenticationProvider:self didCompleteAuthenticationWithID:v6];
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  p_delegate = &self->delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained authenticationProvider:self didFailAuthenticationWithID:v9 error:v8];
}

- (void)_failAuthenticationWithID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  replyQueue = self->_replyQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__LACOnenessAuthenticationProviderSharing__failAuthenticationWithID_error___block_invoke;
  v11[3] = &unk_2653B5AB0;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(replyQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __75__LACOnenessAuthenticationProviderSharing__failAuthenticationWithID_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained delegate];
    [v3 authenticationProvider:v4 didFailAuthenticationWithID:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (id)domainStateBackgroundTask
{
  domainStateBackgroundTask = self->_domainStateBackgroundTask;
  if (!domainStateBackgroundTask)
  {
    objc_initWeak(&location, self);
    id v4 = [LACBackgroundTask alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke;
    v8[3] = &unk_2653B5A38;
    objc_copyWeak(&v9, &location);
    id v5 = [(LACBackgroundTask *)v4 initWithIdentifier:@"OnenessDomainStateQuery" worker:v8];
    id v6 = self->_domainStateBackgroundTask;
    self->_domainStateBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    domainStateBackgroundTask = self->_domainStateBackgroundTask;
  }
  return domainStateBackgroundTask;
}

void __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = +[LACOnenessSignpostEvent eligibleDevicesRequestWillStart];
    [v5 send];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke_2;
    v6[3] = &unk_2653B58B0;
    id v7 = v3;
    [WeakRetained _domainStateWithCompletion:v6];
  }
}

void __68__LACOnenessAuthenticationProviderSharing_domainStateBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = +[LACOnenessSignpostEvent eligibleDevicesRequestDidFinish];
  [v6 send];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [LACBackgroundTaskResult alloc];
  if (v5) {
    uint64_t v9 = [(LACBackgroundTaskResult *)v8 initWithError:v5];
  }
  else {
    uint64_t v9 = [(LACBackgroundTaskResult *)v8 initWithValue:v11];
  }
  id v10 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);
}

- (void)_runDomainStateBackgroundTaskWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = LACLogDTOLocation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = self;
    __int16 v15 = 2048;
    uint64_t v16 = 0x3FC999999999999ALL;
    _os_log_impl(&dword_254F14000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform query with %.2f sec timeout", buf, 0x16u);
  }

  id v6 = [(LACOnenessAuthenticationProviderSharing *)self domainStateBackgroundTask];
  replyQueue = self->_replyQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__LACOnenessAuthenticationProviderSharing__runDomainStateBackgroundTaskWithCompletion___block_invoke;
  v9[3] = &unk_2653B5A60;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v6 runWithTimeout:replyQueue queue:v9 completion:0.2];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __87__LACOnenessAuthenticationProviderSharing__runDomainStateBackgroundTaskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v7 value];
    id v6 = [v7 error];
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v6);
  }
}

- (void)_domainStateWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_sharingManager) {
    goto LABEL_6;
  }
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v5 = (void *)getSFAuthenticationDeviceClass_softClass;
  uint64_t v19 = getSFAuthenticationDeviceClass_softClass;
  if (!getSFAuthenticationDeviceClass_softClass)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __getSFAuthenticationDeviceClass_block_invoke;
    id v14 = &unk_2653B5600;
    __int16 v15 = &v16;
    SharingLibraryCore();
    v17[3] = (uint64_t)objc_getClass("SFAuthenticationDevice");
    getSFAuthenticationDeviceClass_softClass = *(void *)(v15[1] + 24);
    id v5 = (void *)v17[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v16, 8);
  if (v6)
  {
    sharingManager = self->_sharingManager;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __70__LACOnenessAuthenticationProviderSharing__domainStateWithCompletion___block_invoke;
    v9[3] = &unk_2653B5AD8;
    void v9[4] = self;
    id v10 = v4;
    [(SFAuthenticationManager *)sharingManager listCandidateDevicesForType:7 completionHandler:v9];
    id v8 = v10;
  }
  else
  {
LABEL_6:
    id v8 = +[LACError errorWithCode:-1 debugDescription:@"Authenticator not available"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __70__LACOnenessAuthenticationProviderSharing__domainStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LACLogABM();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = v5;
    }
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Listing eligible devices returned: %@", buf, 0xCu);
  }

  uint64_t v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v15, "enabledAsKey", (void)v20))
        {
          uint64_t v16 = [v15 uniqueID];
          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  if ([v9 count])
  {
    uint64_t v17 = [v9 sortedArrayUsingSelector:sel_compare_];
    uint64_t v18 = [v17 componentsJoinedByString:@","];

    uint64_t v19 = [*(id *)(a1 + 32) _domainStateDictionaryForJoinedIDs:v18];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_domainStateDictionaryForJoinedIDs:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = [a3 dataUsingEncoding:4];
  id v4 = +[LACDomainStateDecorator createHashForDomainState:v3];
  uint64_t v16 = @"kLACDomainStateResultKeyAvailableCompanionTypes";
  id v5 = [NSNumber numberWithInteger:2];
  id v14 = v5;
  uint64_t v15 = MEMORY[0x263EFFA88];
  id v6 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v8 = (void *)[v7 mutableCopy];

  if (v4)
  {
    uint64_t v9 = [NSNumber numberWithInteger:2];
    uint64_t v12 = v9;
    uint64_t v13 = v4;
    id v10 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v8 setObject:v10 forKeyedSubscript:@"kLACDomainStateResultKeyCompanionStateHashes"];
  }
  return v8;
}

- (id)authenticationBackgroundTaskForClient:(id)a3 withAcmContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [LACBackgroundTask alloc];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke;
  v13[3] = &unk_2653B5B28;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  uint64_t v11 = [(LACBackgroundTask *)v8 initWithIdentifier:@"OnenessAuthentication" worker:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = +[LACOnenessSignpostEvent authenticationRequestWillStart];
    [v5 send];

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke_2;
    v8[3] = &unk_2653B5B00;
    id v9 = v3;
    [WeakRetained _authenticateClient:v7 withAcmContext:v6 completion:v8];
  }
}

void __96__LACOnenessAuthenticationProviderSharing_authenticationBackgroundTaskForClient_withAcmContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = +[LACOnenessSignpostEvent authenticationRequestDidFinish];
  [v6 send];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [LACBackgroundTaskResult alloc];
  if (v5) {
    uint64_t v9 = [(LACBackgroundTaskResult *)v8 initWithError:v5];
  }
  else {
    uint64_t v9 = [(LACBackgroundTaskResult *)v8 initWithValue:v11];
  }
  id v10 = (void *)v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v9);
}

- (void)_authenticateClient:(id)a3 withAcmContext:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, void))a5;
  if (self->_sharingManager && getSFAuthenticationOptionsClass())
  {
    id v10 = objc_alloc_init((Class)getSFAuthenticationOptionsClass());
    [v10 setAcmContext:v8];
    uint64_t v11 = [v17 bundleId];
    uint64_t v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (__CFString *)v11;
    }
    else {
      uint64_t v13 = @"<UNKNOWN>";
    }
    [v10 setBundleID:v13];

    id v14 = [v17 displayName];
    if (v14)
    {
      [v10 setAppName:v14];
    }
    else
    {
      id v15 = +[LACMobileGestalt marketingDeviceFamilyName];
      [v10 setAppName:v15];
    }
    id v16 = [(SFAuthenticationManager *)self->_sharingManager authenticateForType:7 withOptions:v10];
    v9[2](v9, v16, 0);
  }
  else
  {
    id v10 = +[LACError errorWithCode:-1020 debugDescription:@"Authenticator not available"];
    ((void (**)(id, void *, id))v9)[2](v9, 0, v10);
  }
}

- (LACOnenessAuthenticationProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (LACOnenessAuthenticationProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);
  objc_storeStrong((id *)&self->_domainStateBackgroundTask, 0);
}

@end