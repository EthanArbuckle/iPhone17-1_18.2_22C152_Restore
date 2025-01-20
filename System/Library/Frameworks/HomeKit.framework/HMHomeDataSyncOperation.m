@interface HMHomeDataSyncOperation
@end

@implementation HMHomeDataSyncOperation

void __33____HMHomeDataSyncOperation_main__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to process sync response: %@", (uint8_t *)&v11, 0x16u);
    }
    [v6 cancelWithError:v3];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19D1A8000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully processed sync response", (uint8_t *)&v11, 0xCu);
    }
    [v6 finish];
  }
}

void __33____HMHomeDataSyncOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v9)
    {
      v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = WeakRetained;
      v12 = HMFGetOSLogHandle();
      __int16 v13 = v12;
      if (v6)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v26 = v14;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Processing sync response", buf, 0xCu);
        }
        uint64_t v15 = [v11 isRefresh];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __33____HMHomeDataSyncOperation_main__block_invoke_6;
        v23[3] = &unk_1E5945338;
        objc_copyWeak(&v24, v7);
        objc_msgSend(v9, "__processSyncResponse:refreshRequested:completionHandler:", v6, v15, v23);
        objc_destroyWeak(&v24);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v26 = v21;
          __int16 v27 = 2112;
          id v28 = v5;
          _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Sync operation failed: %@", buf, 0x16u);
        }
        if ([v5 isHMError] && objc_msgSend(v5, "code") == 77)
        {
          v22 = [v5 userInfo];
          [v9 _updateStatusWithPayload:v22];
        }
        [v11 cancelWithError:v5];
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x19F3A64A0]();
      id v17 = WeakRetained;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_INFO, "%{public}@Manager was deallocated before fetch response was handled", buf, 0xCu);
      }
      v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v17 cancelWithError:v20];
    }
  }
}

uint64_t __40____HMHomeDataSyncOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v8_50039;
  logCategory__hmf_once_v8_50039 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end