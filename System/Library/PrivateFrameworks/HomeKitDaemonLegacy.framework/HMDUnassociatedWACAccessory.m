@interface HMDUnassociatedWACAccessory
+ (id)logCategory;
- (HMDUnassociatedWACAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6 wacDevice:(id)a7;
- (HMDWACAccessoryConfigurationDelegate)delegate;
- (HMDWACDevice)wacDevice;
- (NSString)wacDeviceID;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)transportTypes;
- (void)_abort:(id)a3;
- (void)_configureDevice;
- (void)_configureDeviceCompleted:(id)a3;
- (void)_postWACMatchTimeout;
- (void)_postWACMatchingAccessoryFound:(id)a3;
- (void)_requestUserPermission;
- (void)_userPermissionResponse:(BOOL)a3;
- (void)_waitForPostWACMatch;
- (void)cancelConfigurationWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3 withQueue:(id)a4;
- (void)setWACDevice:(id)a3;
- (void)startConfigurationWithCompletionHandler:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateWithMatchingUnassociatedAccessory:(id)a3;
@end

@implementation HMDUnassociatedWACAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->wacDeviceID, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_postWACAccessory, 0);
  objc_storeStrong((id *)&self->_handoffExpirationTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_wacDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)timerDidFire:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__HMDUnassociatedWACAccessory_timerDidFire___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__HMDUnassociatedWACAccessory_timerDidFire___block_invoke(uint64_t a1)
{
}

- (void)_postWACMatchingAccessoryFound:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMFGetLogIdentifier();
    int v20 = 138543618;
    v21 = v9;
    __int16 v22 = 2112;
    int64_t v23 = (int64_t)v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Post-WAC matching accessory found: %@", (uint8_t *)&v20, 0x16u);
  }
  int64_t state = v7->_state;
  if (state == 4)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = v7;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Post-WAC accessory found, but WAC hasn't completed.  Holding on to accessory until completion", (uint8_t *)&v20, 0xCu);
    }
    objc_storeStrong(v12 + 20, a3);
  }
  else if (state == 6)
  {
    __callCompletion(v7, 0, v5, (uint64_t)"-[HMDUnassociatedWACAccessory _postWACMatchingAccessoryFound:]");
    v7->_int64_t state = 8;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int64_t v19 = v7->_state;
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2048;
      int64_t v23 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid state (%ld) for postWACMatchingAccessoryFound call", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)_abort:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    wacDevice = v6->_wacDevice;
    *(_DWORD *)buf = 138543618;
    v50 = v8;
    __int16 v51 = 2112;
    v52 = wacDevice;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling WAC assocciation for %@", buf, 0x16u);
  }
  switch(v6->_state)
  {
    case 0:
    case 7:
    case 8:
      v10 = (void *)MEMORY[0x1D9452090]();
      v11 = v6;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v13;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: no action required", buf, 0xCu);
      }
      v4[2](v4);
      v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
      __callCompletion(v11, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");
      goto LABEL_26;
    case 1:
    case 2:
      v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
      v15 = (void *)MEMORY[0x1D9452090]();
      v16 = v6;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v18;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: notify delegate of cancellation", buf, 0xCu);
      }
      int64_t v19 = [(HMDUnassociatedWACAccessory *)v16 delegate];
      if (v19)
      {
        int v20 = (void *)MEMORY[0x1D9452090]();
        v21 = v16;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v50 = v23;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);
        }
        [v19 unassociatedWACAccessoryDidFinishAssociation:v21 withError:v14];
      }
      v6->_int64_t state = 0;
      v4[2](v4);
      __callCompletion(v16, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");

      goto LABEL_26;
    case 3:
    case 4:
      v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      v25 = v6;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v27;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Cancel: cancel WAC and notify delegate", buf, 0xCu);
      }
      v28 = [(HMDUnassociatedWACAccessory *)v25 delegate];
      if (v28)
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = v25;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v50 = v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);
        }
        [v28 unassociatedWACAccessoryDidFinishAssociation:v30 withError:v14];
      }
      id inited = objc_initWeak(&location, v25);
      v34 = (void *)MEMORY[0x1D9452090](inited);
      v35 = v25;
      HMFGetOSLogHandle();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = HMFGetLogIdentifier();
        v38 = v35->_wacDevice;
        *(_DWORD *)buf = 138543618;
        v50 = v37;
        __int16 v51 = 2112;
        v52 = v38;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling WAC operation for %@", buf, 0x16u);
      }
      v39 = v35->_wacDevice;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __38__HMDUnassociatedWACAccessory__abort___block_invoke;
      v45[3] = &unk_1E6A15DB8;
      objc_copyWeak(&v47, &location);
      v46 = v4;
      [(HMDWACDevice *)v39 cancelConfigurationWithCompletionHandler:v45];

      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);

      goto LABEL_26;
    case 5:
    case 6:
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = v6;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v43;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Notifying delegate that WAC was cancelled", buf, 0xCu);
      }
      v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
      id WeakRetained = objc_loadWeakRetained(v41 + 21);
      [WeakRetained unassociatedWACAccessoryDidFinishAssociation:v41 withError:v14];

      v4[2](v4);
      __callCompletion(v41, v14, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]");
      v6->_int64_t state = 7;
LABEL_26:

      break;
    default:
      break;
  }
}

void __38__HMDUnassociatedWACAccessory__abort___block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[15];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__HMDUnassociatedWACAccessory__abort___block_invoke_2;
    v5[3] = &unk_1E6A19530;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);
  }
}

void __38__HMDUnassociatedWACAccessory__abort___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = 0;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
  __callCompletion(v2, v3, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _abort:]_block_invoke_2");
}

- (void)_postWACMatchTimeout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Timeout waiting to find device post-WAC", (uint8_t *)&v10, 0xCu);
  }
  v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
  v8 = [(HMDUnassociatedWACAccessory *)v4 delegate];
  v9 = v8;
  if (v8) {
    [v8 unassociatedWACAccessoryDidFinishAssociation:v4 withError:v7];
  }
  __callCompletion(v4, v7, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _postWACMatchTimeout]");
  v4->_int64_t state = 7;
}

- (void)_waitForPostWACMatch
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_postWACAccessory)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Post WAC accessory already located, handoff", (uint8_t *)&v19, 0xCu);
    }
    __callCompletion(v4, 0, self->_postWACAccessory, (uint64_t)"-[HMDUnassociatedWACAccessory _waitForPostWACMatch]");
    v4->_int64_t state = 8;
  }
  else
  {
    v7 = [MEMORY[0x1E4F65530] sharedPreferences];
    v8 = [v7 preferenceForKey:@"wacAccessoryPostConfigMatchTimeout"];
    uint64_t v9 = [v8 numberValue];

    if (v9) {
      int v10 = (void *)v9;
    }
    else {
      int v10 = &unk_1F2DC7FD8;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F65580]);
    [v10 doubleValue];
    uint64_t v12 = (HMFTimer *)objc_msgSend(v11, "initWithTimeInterval:options:", 1);
    handoffExpirationTimer = self->_handoffExpirationTimer;
    self->_handoffExpirationTimer = v12;

    uint64_t v14 = [(HMFTimer *)self->_handoffExpirationTimer setDelegate:self];
    self->_int64_t state = 6;
    v15 = (void *)MEMORY[0x1D9452090](v14);
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      int v20 = v18;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting Post-WAC match timeout for %@ seconds", (uint8_t *)&v19, 0x16u);
    }
    [(HMFTimer *)self->_handoffExpirationTimer resume];
  }
}

- (void)_configureDeviceCompleted:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v19 = 138543618;
    int v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@WAC completed with %@", (uint8_t *)&v19, 0x16u);
  }
  uint64_t v9 = [(HMDUnassociatedWACAccessory *)v6 delegate];
  int v10 = v9;
  if (v9)
  {
    [v9 unassociatedWACAccessoryDidFinishAssociation:v6 withError:v4];
    if (!v4)
    {
      v6->_int64_t state = 5;
      __run(v6);
      goto LABEL_13;
    }
    __callCompletion(v6, v4, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDeviceCompleted:]");
    id v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v6;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      int v20 = v14;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@WAC Failed with %@, device should still be WAC-able", (uint8_t *)&v19, 0x16u);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v6;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      int v20 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", (uint8_t *)&v19, 0xCu);
    }
    v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
    __callCompletion(v12, v18, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDeviceCompleted:]");
  }
  v12->_int64_t state = 0;
LABEL_13:
}

- (void)_configureDevice
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUnassociatedWACAccessory *)self delegate];
  id v4 = v3;
  if (v3)
  {
    [v3 unassociatedWACAccessoryDidStartAssociation:self];
    id inited = objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1D9452090](inited);
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      wacDevice = v7->_wacDevice;
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = wacDevice;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Starting WAC process for %@", buf, 0x16u);
    }
    v7->_int64_t state = 4;
    id v11 = v7->_wacDevice;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke;
    v17[3] = &unk_1E6A18528;
    objc_copyWeak(&v18, &location);
    [(HMDWACDevice *)v11 startConfigurationWithCompletionHandler:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v21 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", buf, 0xCu);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
    __callCompletion(v13, v16, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _configureDevice]");

    v13->_int64_t state = 0;
  }
}

void __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[15];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke_2;
    v7[3] = &unk_1E6A197C8;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __47__HMDUnassociatedWACAccessory__configureDevice__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureDeviceCompleted:*(void *)(a1 + 40)];
}

- (void)_userPermissionResponse:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1D9452090](self, a2);
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = (void *)v8;
    int v10 = @"Allowed";
    if (v3) {
      int v10 = @"Denied";
    }
    int v16 = 138543618;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    int v19 = v10;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Permission to share network: %@", (uint8_t *)&v16, 0x16u);
  }
  if (v3)
  {
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
    __callCompletion(v6, v11, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _userPermissionResponse:]");

    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v6;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = (uint64_t)v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@User permission denied, return to ready state", (uint8_t *)&v16, 0xCu);
    }
    v13->_int64_t state = 0;
  }
  else
  {
    v6->_int64_t state = 3;
    __run(v6);
  }
}

- (void)_requestUserPermission
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDUnassociatedWACAccessory *)self delegate];
  if (v3)
  {
    self->_int64_t state = 2;
    id inited = objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1D9452090](inited);
    id v6 = self;
    HMFGetOSLogHandle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Request user permission to share network", buf, 0xCu);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke;
    v14[3] = &unk_1E6A10BF8;
    objc_copyWeak(&v15, &location);
    [v3 requestPermissionToAssociateWACAccessory:v6 completionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    int v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@No delegate assigned, cannot continue WAC association", buf, 0xCu);
    }
    v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
    __callCompletion(v10, v13, 0, (uint64_t)"-[HMDUnassociatedWACAccessory _requestUserPermission]");

    v10->_int64_t state = 0;
  }
}

void __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[15];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke_2;
    v6[3] = &unk_1E6A19B58;
    v6[4] = v4;
    char v7 = a2;
    dispatch_async(v5, v6);
  }
}

uint64_t __53__HMDUnassociatedWACAccessory__requestUserPermission__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userPermissionResponse:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateWithMatchingUnassociatedAccessory:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUnassociatedWACAccessory_updateWithMatchingUnassociatedAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __71__HMDUnassociatedWACAccessory_updateWithMatchingUnassociatedAccessory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postWACMatchingAccessoryFound:*(void *)(a1 + 40)];
}

- (void)cancelConfigurationWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  char v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Cancellation requested, aborting association", buf, 0xCu);
  }
  queue = v6->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__HMDUnassociatedWACAccessory_cancelConfigurationWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E6A19530;
  v11[4] = v6;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(queue, v11);
}

uint64_t __72__HMDUnassociatedWACAccessory_cancelConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _abort:*(void *)(a1 + 40)];
}

- (void)startConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMDUnassociatedWACAccessory_startConfigurationWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __71__HMDUnassociatedWACAccessory_startConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 152);
  BOOL v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      char v7 = HMFGetLogIdentifier();
      int v15 = 138543362;
      int v16 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@WAC association already in progress", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:79];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    if (v6)
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 128);
      int v15 = 138543618;
      int v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Kicking off WAC association for %@", (uint8_t *)&v15, 0x16u);
    }
    id v12 = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v13 + 136);
    *(void *)(v13 + 136) = v12;

    __run(*(void **)(a1 + 32));
  }
}

- (NSString)wacDeviceID
{
  uint64_t v2 = [(HMDUnassociatedWACAccessory *)self wacDevice];
  BOOL v3 = [v2 deviceID];

  return (NSString *)v3;
}

- (HMDWACDevice)wacDevice
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_wacDevice;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setWACDevice:(id)a3
{
  id v5 = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (!self->_state) {
    objc_storeStrong((id *)&self->_wacDevice, a3);
  }
  os_unfair_recursive_lock_unlock();
}

- (HMDUnassociatedWACAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6 wacDevice:(id)a7
{
  id v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDUnassociatedWACAccessory;
  uint64_t v14 = [(HMDUnassociatedAccessory *)&v21 initWithIdentifier:a3 name:a4 category:a5 messageDispatcher:a6];
  if (v14)
  {
    HMDispatchQueueNameString();
    id v15 = objc_claimAutoreleasedReturnValue();
    int v16 = (const char *)[v15 UTF8String];
    __int16 v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v16, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v14->_wacDevice, a7);
    v14->_int64_t state = 0;
  }

  return v14;
}

- (OS_dispatch_queue)delegateQueue
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = self->_delegateQueue;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (HMDWACAccessoryConfigurationDelegate)delegate
{
  os_unfair_recursive_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_recursive_lock_unlock();
  return (HMDWACAccessoryConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3 withQueue:(id)a4
{
  BOOL v6 = (OS_dispatch_queue *)a4;
  id v7 = a3;
  os_unfair_recursive_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v7);

  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;

  os_unfair_recursive_lock_unlock();
}

- (unint64_t)transportTypes
{
  return 8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_68582 != -1) {
    dispatch_once(&logCategory__hmf_once_t32_68582, &__block_literal_global_68583);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v33_68584;
  return v2;
}

uint64_t __42__HMDUnassociatedWACAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v33_68584;
  logCategory__hmf_once_v33_68584 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end