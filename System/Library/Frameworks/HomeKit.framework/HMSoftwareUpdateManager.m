@interface HMSoftwareUpdateManager
+ (id)logCategory;
- (BOOL)isStarted;
- (HMSoftwareUpdate)availableUpdate;
- (HMSoftwareUpdateManager)init;
- (HMSoftwareUpdateManager)initWithContext:(id)a3;
- (HMSoftwareUpdateManagerDelegate)delegate;
- (NSUUID)identifier;
- (_HMContext)context;
- (id)messageDestination;
- (void)__registerForMessages;
- (void)_handleFetch:(id)a3;
- (void)_handleStartUpdate:(id)a3;
- (void)_handleUpdatedAvailableUpdate:(id)a3;
- (void)_reallyStartWithCompletionHandler:(id)a3;
- (void)reconnect;
- (void)setAvailableUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStarted:(BOOL)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
- (void)updateAvailableUpdate:(id)a3 completionHandler:(id)a4;
@end

@implementation HMSoftwareUpdateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_availableUpdate, 0);
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setDelegate:(id)a3
{
}

- (HMSoftwareUpdateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMSoftwareUpdateManagerDelegate *)WeakRetained;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMSoftwareUpdateManager *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)_handleStartUpdate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received start update request", buf, 0xCu);
  }
  v9 = [(HMSoftwareUpdateManager *)v6 delegate];
  if (v9)
  {
    v10 = [v4 dataForKey:@"update"];
    if (v10)
    {
      id v35 = 0;
      v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v35];
      id v12 = v35;
      if (v11)
      {
        objc_initWeak((id *)buf, v6);
        v13 = [(HMSoftwareUpdateManager *)v6 context];
        v14 = [v13 delegateCaller];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke;
        v29[3] = &unk_1E59400D0;
        id v30 = v9;
        v31 = v6;
        id v32 = v11;
        objc_copyWeak(&v34, (id *)buf);
        id v33 = v4;
        [v14 invokeBlock:v29];

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v24 = (void *)MEMORY[0x19F3A64A0]();
        v25 = v6;
        v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from update data: %@", buf, 0x16u);
        }
        v28 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        [v4 respondWithError:v28];
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x19F3A64A0]();
      v20 = v6;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        __int16 v38 = 2112;
        id v39 = v23;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing update from message payload: %@", buf, 0x16u);
      }
      id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
      [v4 respondWithError:v12];
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    v16 = v6;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v37 = v18;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate", buf, 0xCu);
    }
    v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    [v4 respondWithError:v10];
  }
}

void __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke_2;
  v5[3] = &unk_1E59400A8;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 56);
  [v2 softwareUpdateManager:v3 didReceiveRequestToInstallUpdate:v4 completionHandler:v5];

  objc_destroyWeak(&v7);
}

void __46__HMSoftwareUpdateManager__handleStartUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received response to install update request with error: %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = [*(id *)(a1 + 32) responseHandler];

  if (v9)
  {
    v10 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v10)[2](v10, v3, 0);
  }
}

- (void)_handleFetch:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Received fetch request", (uint8_t *)&buf, 0xCu);
  }
  v9 = [(HMSoftwareUpdateManager *)v6 delegate];
  if (v9)
  {
    objc_initWeak(&location, v6);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__HMSoftwareUpdateManager__handleFetch___block_invoke;
    v23[3] = &unk_1E5940080;
    objc_copyWeak(&v25, &location);
    id v24 = v4;
    v10 = v6;
    id v11 = v9;
    id v12 = v23;
    __int16 v13 = [(HMSoftwareUpdateManager *)v10 context];
    id v14 = [v13 delegateCaller];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v28 = ____requestFetch_block_invoke;
    v29 = &unk_1E5945138;
    id v30 = v11;
    v31 = v10;
    id v32 = v12;
    uint64_t v15 = v12;
    v16 = v10;
    id v17 = v11;
    [v14 invokeBlock:&buf];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = v6;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate", (uint8_t *)&buf, 0xCu);
    }
    v22 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    [v4 respondWithError:v22];
  }
}

void __40__HMSoftwareUpdateManager__handleFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = v6;
  v9 = (void *)MEMORY[0x19F3A64A0]();
  id v10 = WeakRetained;
  id v11 = HMFGetOSLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v12)
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v27 = v13;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Failed fetch request with error: %{public}@", buf, 0x16u);
    }
    id v14 = 0;
    uint64_t v15 = v8;
    goto LABEL_15;
  }
  if (v12)
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    v27 = v16;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_INFO, "%{public}@Received response to fetch request: %@", buf, 0x16u);
  }
  if (!v5)
  {
    id v14 = 0;
    goto LABEL_11;
  }
  if ([v5 downloadSize])
  {
    id v24 = @"update";
    id v17 = encodeRootObject(v5);
    id v25 = v17;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_15;
  }
  v18 = (void *)MEMORY[0x19F3A64A0]();
  id v19 = v10;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    v27 = v21;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot accept fetched update of download size 0 : %@", buf, 0x16u);
  }
  uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  id v14 = 0;
LABEL_15:
  v22 = objc_msgSend(*(id *)(a1 + 32), "responseHandler", v24);

  if (v22)
  {
    v23 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void *, void *))v23)[2](v23, v15, v14);
  }
}

- (void)updateAvailableUpdate:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(HMSoftwareUpdateManager *)self context];
  if (!v7)
  {
    uint64_t v22 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateManager updateAvailableUpdate:completionHandler:]", @"completionHandler"];
    v23 = (void *)MEMORY[0x19F3A64A0]();
    id v24 = self;
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      id v35 = (const char *)v22;
      _os_log_impl(&dword_19D1A8000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v27 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v22 userInfo:0];
    objc_exception_throw(v27);
  }
  v9 = (void *)v8;
  if (!v8)
  {
    id v11 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v12 = self;
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v33 = v14;
      __int16 v34 = 2080;
      id v35 = "-[HMSoftwareUpdateManager updateAvailableUpdate:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 12;
    goto LABEL_12;
  }
  if (v6 && ![v6 downloadSize])
  {
    id v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot accept available update of download size 0 : %@", buf, 0x16u);
    }
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = 3;
LABEL_12:
    v21 = [v15 hmErrorWithCode:v16];
    v7[2](v7, v21);

    goto LABEL_13;
  }
  id v10 = [v9 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E5944360;
  block[4] = self;
  id v29 = v6;
  v31 = v7;
  id v30 = v9;
  dispatch_async(v10, block);

LABEL_13:
}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = a1[4];
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = a1[5];
    *(_DWORD *)long long buf = 138543618;
    v37 = v5;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating available update to: %@", buf, 0x16u);
  }
  id v7 = a1[5];
  if (v7)
  {
    __int16 v34 = @"update";
    uint64_t v8 = encodeRootObject(v7);
    id v35 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  }
  else
  {
    id v32 = @"update";
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v33 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  }
  id v10 = (void *)v9;

  id v11 = (void *)MEMORY[0x1E4F654B0];
  BOOL v12 = [a1[4] messageDestination];
  __int16 v13 = [v11 messageWithName:@"HMSUM.ua" destination:v12 payload:v10];

  objc_initWeak((id *)buf, a1[4]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_49;
  aBlock[3] = &unk_1E5944AE0;
  objc_copyWeak(&v31, (id *)buf);
  id v29 = a1[5];
  id v30 = a1[7];
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = [a1[4] context];
  uint64_t v16 = [v15 pendingRequests];

  id v17 = [v13 identifier];
  v18 = _Block_copy(v14);
  [v16 addCompletionBlock:v18 forIdentifier:v17];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_2;
  v23[3] = &unk_1E59441B0;
  id v19 = v16;
  id v24 = v19;
  id v20 = v17;
  id v25 = v20;
  id v26 = a1[5];
  id v21 = v14;
  id v27 = v21;
  [v13 setResponseHandler:v23];
  uint64_t v22 = [a1[6] messageDispatcher];
  [v22 sendMessage:v13 completionHandler:0];

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);
}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v8 = WeakRetained;
  if (!v4)
  {
    [WeakRetained setAvailableUpdate:*(void *)(a1 + 32)];
    id WeakRetained = v8;
  }
  id v6 = [WeakRetained context];
  id v7 = [v6 delegateCaller];
  [v7 callCompletion:*(void *)(a1 + 40) error:v4];
}

void __67__HMSoftwareUpdateManager_updateAvailableUpdate_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) removeCompletionBlockForIdentifier:*(void *)(a1 + 40)];
  if (v6)
  {
    if (!v8)
    {
      id v7 = objc_msgSend(v5, "hmf_UUIDForKey:", @"identifier");
      if (v7) {
        [*(id *)(a1 + 48) setIdentifier:v7];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_handleUpdatedAvailableUpdate:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdateManager *)self context];
  id v6 = [v5 pendingRequests];
  id v7 = [v4 identifier];
  id v8 = [v6 retrieveCompletionBlockForIdentifier:v7];

  if (v8)
  {
LABEL_9:
    [v4 respondWithPayload:0];
    goto LABEL_10;
  }
  uint64_t v9 = [v4 nullForKey:@"update"];

  if (v9)
  {
    id v10 = 0;
LABEL_4:
    id v11 = [(HMSoftwareUpdateManager *)self availableUpdate];
    char v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      __int16 v13 = (void *)MEMORY[0x19F3A64A0]();
      id v14 = self;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        __int16 v34 = v16;
        __int16 v35 = 2112;
        uint64_t v36 = v10;
        _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating available software update to: %@", buf, 0x16u);
      }
      [(HMSoftwareUpdateManager *)v14 setAvailableUpdate:v10];
    }

    goto LABEL_9;
  }
  uint64_t v17 = [v4 dataForKey:@"update"];
  if (v17)
  {
    v18 = (void *)v17;
    id v32 = 0;
    id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v32];
    id v19 = v32;
    id v20 = v19;
    if (v10)
    {

      goto LABEL_4;
    }
    id v27 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v34 = v30;
      __int16 v35 = 2112;
      uint64_t v36 = v20;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from update data: %@", buf, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v31];
  }
  else
  {
    id v21 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      id v25 = [v4 messagePayload];
      *(_DWORD *)long long buf = 138543618;
      __int16 v34 = v24;
      __int16 v35 = 2112;
      uint64_t v36 = v25;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Missing update from message payload: %@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    [v4 respondWithError:v26];
  }
LABEL_10:
}

- (void)setAvailableUpdate:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)&self->_availableUpdate, a3);
  id v5 = [(HMSoftwareUpdateManager *)self context];
  [v6 configureWithContext:v5];

  os_unfair_lock_unlock(&self->_lock);
}

- (HMSoftwareUpdate)availableUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_availableUpdate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMSoftwareUpdateManager *)self context];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__HMSoftwareUpdateManager_stop__block_invoke;
    v10[3] = &unk_1E5945628;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v5, v10);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "-[HMSoftwareUpdateManager stop]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __31__HMSoftwareUpdateManager_stop__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    __int16 v13 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Stopping", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setStarted:0];
  id v6 = (void *)MEMORY[0x1E4F654B0];
  id v7 = [*(id *)(a1 + 32) messageDestination];
  id v8 = [v6 messageWithName:@"HMSUM.cl" destination:v7 payload:0];

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__HMSoftwareUpdateManager_stop__block_invoke_46;
  v10[3] = &unk_1E5943F78;
  objc_copyWeak(&v11, (id *)buf);
  [v8 setResponseHandler:v10];
  uint64_t v9 = [*(id *)(a1 + 40) messageDispatcher];
  [v9 sendMessage:v8 completionHandler:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __31__HMSoftwareUpdateManager_stop__block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      char v12 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v13 = "%{public}@Failed to stop with error: %@";
      uint64_t v14 = v10;
      uint32_t v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
    }
  }
  else if (v11)
  {
    char v12 = HMFGetLogIdentifier();
    int v16 = 138543362;
    uint64_t v17 = v12;
    __int16 v13 = "%{public}@Stopped";
    uint64_t v14 = v10;
    uint32_t v15 = 12;
    goto LABEL_6;
  }
}

- (void)_reallyStartWithCompletionHandler:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdateManager *)self context];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F654B0];
    id v7 = [(HMSoftwareUpdateManager *)self messageDestination];
    id v8 = [v6 messageWithName:@"HMSUM.op" destination:v7 payload:0];

    objc_initWeak((id *)location, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __61__HMSoftwareUpdateManager__reallyStartWithCompletionHandler___block_invoke;
    uint64_t v17 = &unk_1E5944188;
    objc_copyWeak(&v19, (id *)location);
    id v18 = v4;
    [v8 setResponseHandler:&v14];
    id v9 = objc_msgSend(v5, "messageDispatcher", v14, v15, v16, v17);
    [v9 sendMessage:v8 completionHandler:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v11 = self;
    char v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = v13;
      __int16 v21 = 2080;
      uint64_t v22 = "-[HMSoftwareUpdateManager _reallyStartWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);
    }
  }
}

void __61__HMSoftwareUpdateManager__reallyStartWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x19F3A64A0]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      char v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v28 = v12;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to start with error: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v11)
    {
      __int16 v13 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v28 = v13;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started", buf, 0xCu);
    }
    [v9 setStarted:1];
    uint64_t v14 = objc_msgSend(v6, "hmf_dataForKey:", @"update");
    if (v14)
    {
      id v26 = 0;
      uint64_t v15 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v26];
      id v16 = v26;
      uint64_t v17 = (void *)MEMORY[0x19F3A64A0]();
      id v18 = v9;
      id v19 = HMFGetOSLogHandle();
      uint64_t v20 = v19;
      if (v15)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v21 = id v24 = v16;
          *(_DWORD *)long long buf = 138543618;
          __int16 v28 = v21;
          __int16 v29 = 2112;
          id v30 = v15;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_INFO, "%{public}@Initial available software update: %@", buf, 0x16u);

          id v16 = v24;
        }

        [v18 setAvailableUpdate:v15];
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v25 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          __int16 v28 = v25;
          __int16 v29 = 2112;
          id v30 = v16;
          _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive software update from software update data: %@", buf, 0x16u);
        }
      }
    }
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v22 = [v9 context];
    uint64_t v23 = [v22 delegateCaller];
    [v23 callCompletion:*(void *)(a1 + 32) error:v5];
  }
}

- (void)reconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMSoftwareUpdateManager *)self context];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__HMSoftwareUpdateManager_reconnect__block_invoke;
    block[3] = &unk_1E59452E8;
    block[4] = self;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = (void *)MEMORY[0x19F3A64A0]();
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      char v12 = v9;
      __int16 v13 = 2080;
      uint64_t v14 = "-[HMSoftwareUpdateManager reconnect]";
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

uint64_t __36__HMSoftwareUpdateManager_reconnect__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) isStarted];
  if (result)
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_INFO, "%{public}@Restarting on reconnect", (uint8_t *)&v7, 0xCu);
    }
    return [*(id *)(a1 + 32) _reallyStartWithCompletionHandler:0];
  }
  return result;
}

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMSoftwareUpdateManager *)self context];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMSoftwareUpdateManager startWithCompletionHandler:]", @"completionHandler"];
    uint64_t v14 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v22 = v17;
      __int16 v23 = 2112;
      id v24 = (const char *)v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HMSoftwareUpdateManager_startWithCompletionHandler___block_invoke;
    block[3] = &unk_1E59454E8;
    block[4] = self;
    id v20 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v11 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      id v24 = "-[HMSoftwareUpdateManager startWithCompletionHandler:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    char v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v4 + 2))(v4, v12);
  }
}

uint64_t __54__HMSoftwareUpdateManager_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _reallyStartWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)__registerForMessages
{
  id v3 = [(HMSoftwareUpdateManager *)self context];
  id v4 = [v3 messageDispatcher];
  [v4 registerForMessage:@"HMSUM.ua" receiver:self selector:sel__handleUpdatedAvailableUpdate_];

  id v5 = [(HMSoftwareUpdateManager *)self context];
  id v6 = [v5 messageDispatcher];
  [v6 registerForMessage:@"HMSUM.fu" receiver:self selector:sel__handleFetch_];

  id v8 = [(HMSoftwareUpdateManager *)self context];
  int v7 = [v8 messageDispatcher];
  [v7 registerForMessage:@"HMSUM.su" receiver:self selector:sel__handleStartUpdate_];
}

- (HMSoftwareUpdateManager)init
{
  id v3 = [[_HMContext alloc] initWithName:@"com.apple.HomeKit.SUManager"];
  id v4 = [(HMSoftwareUpdateManager *)self initWithContext:v3];

  return v4;
}

- (HMSoftwareUpdateManager)initWithContext:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMSoftwareUpdateManager;
  id v6 = [(HMSoftwareUpdateManager *)&v18 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"08DA0D15-4D5F-4E74-89B6-A4201BC50F72"];
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    objc_initWeak(&location, v7);
    id v10 = [(_HMContext *)v7->_context xpcClient];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __43__HMSoftwareUpdateManager_initWithContext___block_invoke;
    uint64_t v15 = &unk_1E59455B8;
    objc_copyWeak(&v16, &location);
    [v10 registerReconnectionHandler:&v12];

    [(HMSoftwareUpdateManager *)v7 __registerForMessages];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __43__HMSoftwareUpdateManager_initWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reconnect];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_19639 != -1) {
    dispatch_once(&logCategory__hmf_once_t34_19639, &__block_literal_global_19640);
  }
  v2 = (void *)logCategory__hmf_once_v35_19641;

  return v2;
}

uint64_t __38__HMSoftwareUpdateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v35_19641;
  logCategory__hmf_once_v35_19641 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end