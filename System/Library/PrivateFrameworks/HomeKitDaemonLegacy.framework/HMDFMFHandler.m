@interface HMDFMFHandler
+ (HMDFMFHandler)sharedHandler;
+ (id)logCategory;
- (BOOL)isThisDesignatedFMFDevice;
- (HMDFMF)fmfStatus;
- (HMDFMFHandler)init;
- (HMDFMFRequest)currentFMFRequest;
- (NSMutableArray)queries;
- (OS_dispatch_queue)workQueue;
- (unint64_t)_computeFMFStatus:(id)a3;
- (void)_initiateFMFRequest;
- (void)_processDevices:(id)a3 error:(id)a4;
- (void)_respondToPendingRequests:(id)a3;
- (void)fmfDevicesChanged;
- (void)homeDataLoaded:(id)a3;
- (void)meDeviceChanged;
- (void)queryFMFStatusWithCompletion:(id)a3;
- (void)queryFMFStatusWithQueue:(id)a3 completion:(id)a4;
- (void)sendNotification;
- (void)setCurrentFMFRequest:(id)a3;
- (void)setFmfStatus:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDFMFHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_currentFMFRequest, 0);
  objc_storeStrong((id *)&self->_fmfStatus, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)queries
{
  return self->_queries;
}

- (void)setCurrentFMFRequest:(id)a3
{
}

- (HMDFMFRequest)currentFMFRequest
{
  return self->_currentFMFRequest;
}

- (BOOL)isThisDesignatedFMFDevice
{
  v2 = [(HMDFMFHandler *)self fmfStatus];
  BOOL v3 = [v2 value] == 2;

  return v3;
}

- (void)sendNotification
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDFMFHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(HMDFMFHandler *)self fmfStatus];
  [v5 addToPayload:v4];

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = [(HMDFMFHandler *)v7 fmfStatus];
    int v13 = 138543618;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending FMF status update notification %@", (uint8_t *)&v13, 0x16u);
  }
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12 = (void *)[v4 copy];
  [v11 postNotificationName:@"HMDFMFStatusUpdateNotification" object:v7 userInfo:v12];
}

- (void)_respondToPendingRequests:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDFMFHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v18 = self;
  id obj = [(HMDFMFHandler *)self queries];
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D9452090]();
        v12 = v18;
        int v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v26 = v14;
          __int16 v27 = 2112;
          v28 = v10;
          __int16 v29 = 2112;
          id v30 = v4;
          _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with status %@", buf, 0x20u);
        }
        __int16 v15 = [v10 responseQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__HMDFMFHandler__respondToPendingRequests___block_invoke;
        block[3] = &unk_1E6A197C8;
        block[4] = v10;
        id v20 = v4;
        dispatch_async(v15, block);
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v7);
  }

  v16 = [(HMDFMFHandler *)v18 queries];
  [v16 removeAllObjects];
}

void __43__HMDFMFHandler__respondToPendingRequests___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completion];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)queryFMFStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDFMFHandler *)self workQueue];
  [(HMDFMFHandler *)self queryFMFStatusWithQueue:v5 completion:v4];
}

- (void)queryFMFStatusWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = v7;
    if (v7)
    {
      v9 = [(HMDFMFHandler *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke;
      block[3] = &unk_1E6A193D0;
      block[4] = self;
      id v14 = v6;
      id v15 = v8;
      id v10 = v8;
      id v11 = v6;
      dispatch_async(v9, block);

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  uint64_t v12 = _HMFPreconditionFailure();
  __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke(v12);
}

void __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) fmfStatus];
  uint64_t v3 = [v2 value];

  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke_68;
    v12[3] = &unk_1E6A19530;
    id v4 = *(NSObject **)(a1 + 40);
    id v5 = (HMDFMFQuery *)*(id *)(a1 + 48);
    v12[4] = *(void *)(a1 + 32);
    int v13 = v5;
    dispatch_async(v4, v12);
    id v6 = v13;
  }
  else
  {
    id v6 = [[HMDFMFQuery alloc] initWithResponseQueue:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@FMF status is still unknown querying FMF, adding query %@", buf, 0x16u);
    }
    id v11 = [*(id *)(a1 + 32) queries];
    [v11 addObject:v6];

    [*(id *)(a1 + 32) _initiateFMFRequest];
  }
}

void __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fmfStatus];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (unint64_t)_computeFMFStatus:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31 = self;
  id v5 = [(HMDFMFHandler *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v27 = v4;
      int v9 = 0;
      uint64_t v10 = *(void *)v33;
      uint64_t v28 = *(void *)v33;
      id v29 = v6;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v30 = v8;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
          int v13 = (void *)MEMORY[0x1D9452090]();
          id v14 = v31;
          id v15 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v16 = HMFGetLogIdentifier();
            [v12 isThisDevice];
            uint64_t v17 = HMFBooleanToString();
            [v12 isCompanionDevice];
            uint64_t v18 = HMFBooleanToString();
            [v12 isActiveDevice];
            v19 = HMFBooleanToString();
            *(_DWORD *)buf = 138544386;
            v37 = v16;
            __int16 v38 = 2112;
            v39 = v12;
            __int16 v40 = 2112;
            v41 = v17;
            __int16 v42 = 2112;
            v43 = v18;
            __int16 v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@device: %@, isThisDevice: %@, isCompanionDevice: %@, isActiveDevice: %@", buf, 0x34u);

            uint64_t v8 = v30;
            uint64_t v10 = v28;

            id v6 = v29;
          }

          if [v12 isThisDevice] && (objc_msgSend(v12, "isActiveDevice"))
          {

            unint64_t v20 = 2;
            goto LABEL_20;
          }
          v9 |= [v12 isActiveDevice];
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v32 objects:v46 count:16];
        if (v8) {
          continue;
        }
        break;
      }

      if (v9) {
        unint64_t v20 = 3;
      }
      else {
        unint64_t v20 = 1;
      }
LABEL_20:
      id v4 = v27;
    }
    else
    {

      unint64_t v20 = 1;
    }
  }
  else
  {
    long long v21 = (void *)MEMORY[0x1D9452090]();
    long long v22 = v31;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = id v24 = v4;
      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@FMF is reporting no devices", buf, 0xCu);

      id v4 = v24;
    }

    unint64_t v20 = 0;
  }

  return v20;
}

- (void)_processDevices:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDFMFHandler *)self workQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    int v13 = [(HMDFMFHandler *)v10 currentFMFRequest];
    int v30 = 138543618;
    v31 = v12;
    __int16 v32 = 2112;
    id v33 = v13;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Resetting the current %@", (uint8_t *)&v30, 0x16u);
  }
  uint64_t v14 = [(HMDFMFHandler *)v10 setCurrentFMFRequest:0];
  if (v6)
  {
    id v15 = +[HMDFMF fmfStatusWithValue:[(HMDFMFHandler *)v10 _computeFMFStatus:v6]];
    [(HMDFMFHandler *)v10 _respondToPendingRequests:v15];
    __int16 v16 = [(HMDFMFHandler *)v10 fmfStatus];
    char v17 = HMFEqualObjects();

    uint64_t v18 = (void *)MEMORY[0x1D9452090]();
    v19 = v10;
    unint64_t v20 = HMFGetOSLogHandle();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v17)
    {
      if (v21)
      {
        long long v22 = HMFGetLogIdentifier();
        long long v23 = [(HMDFMFHandler *)v19 fmfStatus];
        int v30 = 138543618;
        v31 = v22;
        __int16 v32 = 2112;
        id v33 = v23;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@FMF status is not changing from %@", (uint8_t *)&v30, 0x16u);
      }
    }
    else
    {
      if (v21)
      {
        uint64_t v28 = HMFGetLogIdentifier();
        id v29 = [(HMDFMFHandler *)v19 fmfStatus];
        int v30 = 138543874;
        v31 = v28;
        __int16 v32 = 2112;
        id v33 = v29;
        __int16 v34 = 2112;
        long long v35 = v15;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@FMF status is changing from %@ to %@", (uint8_t *)&v30, 0x20u);
      }
      [(HMDFMFHandler *)v19 setFmfStatus:v15];
      [(HMDFMFHandler *)v19 sendNotification];
    }
  }
  else
  {
    id v24 = (void *)MEMORY[0x1D9452090](v14);
    v25 = v10;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      int v30 = 138543618;
      v31 = v27;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Process request failed: %@", (uint8_t *)&v30, 0x16u);
    }
    id v15 = [(HMDFMFHandler *)v25 fmfStatus];
    [(HMDFMFHandler *)v25 _respondToPendingRequests:v15];
  }
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDFMFHandler *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__HMDFMFHandler_timerDidFire___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __30__HMDFMFHandler_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentFMFRequest];
  uint64_t v3 = [v2 fmfSessionResponseTimer];
  id v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    int v9 = *(void **)(a1 + 32);
    id v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
    objc_msgSend(v9, "_processDevices:error:", 0);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@FMFRequest timer doesnt match, ignorning", buf, 0xCu);
    }
  }
}

- (void)_initiateFMFRequest
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDFMFHandler *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDFMFHandler *)self currentFMFRequest];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = [(HMDFMFHandler *)v6 currentFMFRequest];
      *(_DWORD *)buf = 138543618;
      long long v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@FMF query / session in already in place. Not submitting another one. Multiple instances of FMFSession is not recommended : %@", buf, 0x16u);
    }
  }
  else
  {
    id v10 = [[HMDFMFRequest alloc] initWithResponseTimerDelegate:self];
    objc_initWeak((id *)buf, self);
    uint64_t v11 = [(HMDFMFRequest *)v10 fmfSession];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    char v17 = __36__HMDFMFHandler__initiateFMFRequest__block_invoke;
    uint64_t v18 = &unk_1E6A0FFA8;
    objc_copyWeak(&v20, (id *)buf);
    uint64_t v12 = v10;
    v19 = v12;
    [v11 getAllDevices:&v15];

    -[HMDFMFHandler setCurrentFMFRequest:](self, "setCurrentFMFRequest:", v12, v15, v16, v17, v18);
    uint64_t v13 = [(HMDFMFHandler *)self currentFMFRequest];
    uint64_t v14 = [v13 fmfSessionResponseTimer];
    [v14 resume];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __36__HMDFMFHandler__initiateFMFRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = [WeakRetained workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __36__HMDFMFHandler__initiateFMFRequest__block_invoke_2;
    v10[3] = &unk_1E6A18668;
    v10[4] = v8;
    id v11 = *(id *)(a1 + 32);
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v9, v10);
  }
}

void __36__HMDFMFHandler__initiateFMFRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentFMFRequest];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    [v10 _processDevices:v11 error:v12];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = [*(id *)(a1 + 32) currentFMFRequest];
      uint64_t v9 = *(void *)(a1 + 40);
      int v13 = 138543874;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Current FMF request: %@ does not match this request %@, ignoring the response", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)fmfDevicesChanged
{
  uint64_t v3 = [(HMDFMFHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HMDFMFHandler_fmfDevicesChanged__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__HMDFMFHandler_fmfDevicesChanged__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Devices have changed, initiating FMF request", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _initiateFMFRequest];
}

- (void)meDeviceChanged
{
  id v3 = [(HMDFMFHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMDFMFHandler_meDeviceChanged__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__HMDFMFHandler_meDeviceChanged__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Designated device has changed, initiating FMF request", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _initiateFMFRequest];
}

- (void)homeDataLoaded:(id)a3
{
  id v4 = [(HMDFMFHandler *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMDFMFHandler_homeDataLoaded___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __32__HMDFMFHandler_homeDataLoaded___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Home data has been loaded, initiating FMF request", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) _initiateFMFRequest];
}

- (void)setFmfStatus:(id)a3
{
  id v4 = (HMDFMF *)a3;
  os_unfair_lock_lock_with_options();
  fmfStatus = self->_fmfStatus;
  self->_fmfStatus = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMDFMF)fmfStatus
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_fmfStatus;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDFMFHandler)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)HMDFMFHandler;
  id v2 = [(HMDFMFHandler *)&v20 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[HMDFMF fmfStatusWithValue:0];
    fmfStatus = v3->_fmfStatus;
    v3->_fmfStatus = (HMDFMF *)v4;

    id v6 = (const char *)HMFDispatchQueueName();
    int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    queries = v3->_queries;
    v3->_queries = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v3 selector:sel_homeDataLoaded_ name:@"HMDHomeManagerHomeDataLoadedNotification" object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)meDeviceChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E4F615A0], 0, CFNotificationSuspensionBehaviorCoalesce);
    uint64_t v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, 0, (CFNotificationCallback)fmfDevicesChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E4F61598], 0, CFNotificationSuspensionBehaviorCoalesce);
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = v3;
    __int16 v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v22 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Created FMF Handler", buf, 0xCu);
    }
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_117765 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_117765, &__block_literal_global_117766);
  }
  id v2 = (void *)logCategory__hmf_once_v19_117767;
  return v2;
}

uint64_t __28__HMDFMFHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19_117767;
  logCategory__hmf_once_v19_117767 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDFMFHandler)sharedHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__HMDFMFHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken_117772 != -1) {
    dispatch_once(&sharedHandler_onceToken_117772, block);
  }
  id v2 = (void *)sharedHandler_sharedHandler;
  return (HMDFMFHandler *)v2;
}

uint64_t __30__HMDFMFHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end