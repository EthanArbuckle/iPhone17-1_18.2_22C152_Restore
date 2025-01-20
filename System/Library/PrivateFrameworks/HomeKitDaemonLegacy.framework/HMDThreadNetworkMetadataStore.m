@interface HMDThreadNetworkMetadataStore
+ (HMDThreadNetworkMetadataStore)_testOnlyStore;
+ (HMDThreadNetworkMetadataStore)defaultStore;
+ (id)logCategory;
+ (id)new;
- (HMDThreadNetworkMetadataStore)init;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_queue)workQueueNetworkChanged;
- (id)initInternal;
- (unint64_t)networkChangedHandlingLastUpdatedTime;
- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3;
- (void)_removePreferredNetworkWithCompletion:(id)a3;
- (void)_retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3;
- (void)_retrieveMetadataOnController:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5;
- (void)_retrieveMetadataOnThreadCapableController:(id)a3 threadClient:(id)a4 homeHasResident:(BOOL)a5 completion:(id)a6;
- (void)_retrievePreferredNetwork:(id)a3 completion:(id)a4;
- (void)_retrievePreferredNetworkOnThreadCapableController:(id)a3 threadClient:(id)a4 completion:(id)a5;
- (void)_scheduleTriggerPreferredNetworkUpdateWithCompletion:(id)a3;
- (void)_triggerPreferredNetworkUpdateWithCompletion:(id)a3;
- (void)_validateOperationalDatasetWithTHClient:(id)a3 operationalDataset:(id)a4 storeCachedAOD:(BOOL)a5 completion:(id)a6;
- (void)checkIfThreadNetworkIsRunningWithCompletion:(id)a3;
- (void)removePreferredNetworkWithCompletion:(id)a3;
- (void)retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3;
- (void)retrieveMetadata:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5;
- (void)retrievePreferredNetwork:(id)a3 completion:(id)a4;
- (void)setNetworkChangedHandlingLastUpdatedTime:(unint64_t)a3;
- (void)triggerPreferredNetworkUpdateWithCompletion:(id)a3;
@end

@implementation HMDThreadNetworkMetadataStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueueNetworkChanged, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setNetworkChangedHandlingLastUpdatedTime:(unint64_t)a3
{
  self->_networkChangedHandlingLastUpdatedTime = a3;
}

- (unint64_t)networkChangedHandlingLastUpdatedTime
{
  return self->_networkChangedHandlingLastUpdatedTime;
}

- (OS_dispatch_queue)workQueueNetworkChanged
{
  return self->_workQueueNetworkChanged;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__134147;
  v15 = __Block_byref_object_dispose__134148;
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
  v6 = (void *)v12[5];
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__HMDThreadNetworkMetadataStore__checkIfThreadNetworkIsRunningWithCompletion___block_invoke;
    v8[3] = &unk_1E6A11A00;
    id v9 = v4;
    v10 = &v11;
    [v6 retrievePreferredCredentialsInternally:v8];
    v7 = v9;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }

  _Block_object_dispose(&v11, 8);
}

uint64_t __78__HMDThreadNetworkMetadataStore__checkIfThreadNetworkIsRunningWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (!a3 || a4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a4;
  }
  else
  {
    uint64_t v6 = 1;
    uint64_t v7 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, v6, v7);
  v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v8 invalidate];
}

- (void)checkIfThreadNetworkIsRunningWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HMDThreadNetworkMetadataStore_checkIfThreadNetworkIsRunningWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __77__HMDThreadNetworkMetadataStore_checkIfThreadNetworkIsRunningWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfThreadNetworkIsRunningWithCompletion:*(void *)(a1 + 40)];
}

- (void)_removePreferredNetworkWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__134147;
  v19 = __Block_byref_object_dispose__134148;
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
  id v6 = (void *)v16[5];
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__HMDThreadNetworkMetadataStore__removePreferredNetworkWithCompletion___block_invoke;
    v12[3] = &unk_1E6A119D8;
    v12[4] = self;
    id v13 = v4;
    v14 = &v15;
    [v6 ctcsDeletePreferredNetworkWithCompletion:v12];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    HMFGetOSLogHandle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable - cannot clear preferred thread credentials", buf, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }
  _Block_object_dispose(&v15, 8);
}

void __71__HMDThreadNetworkMetadataStore__removePreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      id v9 = "%{public}@Failed to clear preferred thread network credentials: %@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v15 = 138543362;
    id v16 = v8;
    id v9 = "%{public}@Preferred thread network credentials cleared";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_INFO;
    uint32_t v12 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v13, v14);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
}

- (void)removePreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke_2;
  v3[3] = &unk_1E6A16F80;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 _removePreferredNetworkWithCompletion:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __70__HMDThreadNetworkMetadataStore_removePreferredNetworkWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = _Block_copy(*(const void **)(a1 + 32));
  id v5 = v4;
  if (v4) {
    (*((void (**)(void *, id))v4 + 2))(v4, v6);
  }
}

- (void)_triggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint32_t v12 = __Block_byref_object_copy__134147;
  uint64_t v13 = __Block_byref_object_dispose__134148;
  id v14 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
  id v4 = (void *)v10[5];
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __78__HMDThreadNetworkMetadataStore__triggerPreferredNetworkUpdateWithCompletion___block_invoke;
    v6[3] = &unk_1E6A119B0;
    id v7 = v3;
    id v8 = &v9;
    [v4 updatePreferredCredentialsInternally:v6];
    id v5 = v7;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void *))v3 + 2))(v3, v5);
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __78__HMDThreadNetworkMetadataStore__triggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(void, void))(v3 + 16))(*(void *)(a1 + 32), 0);
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v5 invalidate];
}

- (void)_scheduleTriggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadNetworkMetadataStore *)self workQueueNetworkChanged];
  dispatch_assert_queue_V2(v5);

  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  [(HMDThreadNetworkMetadataStore *)self setNetworkChangedHandlingLastUpdatedTime:v6];
  id v7 = [(HMDThreadNetworkMetadataStore *)self workQueueNetworkChanged];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke;
  block[3] = &unk_1E6A181A0;
  id v10 = v4;
  dispatch_time_t v11 = v6;
  block[4] = self;
  id v8 = v4;
  dispatch_after(v6, v7, block);
}

void __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == [*(id *)(a1 + 32) networkChangedHandlingLastUpdatedTime])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke_2;
    v6[3] = &unk_1E6A19358;
    uint64_t v3 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v3 _triggerPreferredNetworkUpdateWithCompletion:v6];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:15];
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

uint64_t __86__HMDThreadNetworkMetadataStore__scheduleTriggerPreferredNetworkUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)triggerPreferredNetworkUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadNetworkMetadataStore *)self workQueueNetworkChanged];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A17D78;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _scheduleTriggerPreferredNetworkUpdateWithCompletion:v4];
}

void __77__HMDThreadNetworkMetadataStore_triggerPreferredNetworkUpdateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  id v4 = v3;
  if (v3) {
    (*((void (**)(void *, id))v3 + 2))(v3, v5);
  }
}

- (void)_retrievePreferredNetwork:(id)a3 completion:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v8);

  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__134147;
    v34 = __Block_byref_object_dispose__134148;
    id v35 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      uint64_t v9 = +[HMDDeviceCapabilities deviceCapabilities];
      int v10 = [v9 supportsThreadService];

      dispatch_time_t v11 = *(void **)(*((void *)&buf + 1) + 40);
      if (v10)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke;
        v26[3] = &unk_1E6A11938;
        id v27 = v7;
        p_long long buf = &buf;
        [(HMDThreadNetworkMetadataStore *)self _retrievePreferredNetworkOnThreadCapableController:v6 threadClient:v11 completion:v26];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_2;
        v22[3] = &unk_1E6A11988;
        v22[4] = self;
        id v23 = v6;
        v25 = &buf;
        id v24 = v7;
        [v11 retrievePreferredNetworkInternallyOnMdnsAndSig:v22];
      }
    }
    else
    {
      __int16 v17 = (void *)MEMORY[0x1D9452090]();
      id v18 = self;
      HMFGetOSLogHandle();
      uint64_t v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)v29 = 138543362;
        v30 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", v29, 0xCu);
      }
      v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58];
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v21);
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint32_t v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Control flow: Cannot retrieve or generate thread preferred network on this platform", (uint8_t *)&buf, 0xCu);
    }
    id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v16);
  }
}

uint64_t __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

void __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  uint32_t v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v39 = v27;
      __int16 v40 = 2112;
      id v41 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Control flow: Failed to retrieve preferred thread network credentials record : %@", buf, 0x16u);
    }
    uint64_t v28 = *(void *)(a1 + 40);
    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_29;
      v34[3] = &unk_1E6A11960;
      id v36 = *(id *)(a1 + 48);
      id v31 = *(id *)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 56);
      id v35 = v31;
      uint64_t v37 = v32;
      [v29 _validateOperationalDatasetWithTHClient:v30 operationalDataset:v28 storeCachedAOD:0 completion:v34];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      v39 = v14;
      __int16 v40 = 2112;
      id v41 = v7;
      __int16 v42 = 2112;
      id v43 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Control flow: retrievePreferredNetworkInternallyOnMdnsAndSig returned THCredential:%@, uuid %@", buf, 0x20u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F2EB88]);
    id v16 = [v7 networkName];
    uint64_t v17 = [v7 channel];
    id v18 = [v7 panID];
    [v7 extendedPANID];
    uint64_t v19 = v33 = v8;
    id v20 = [v7 networkKey];
    v21 = [v7 PSKC];
    v22 = [v7 activeOperationalDataSet];
    id v23 = (void *)[v15 initWithName:v16 channel:v17 PANID:v18 extendedPANID:v19 masterKey:v20 passPhrase:0 PSKc:v21 operationalDataset:v22];

    id v8 = v33;
    uint64_t v24 = *(void *)(a1 + 48);
    v25 = [v33 UUIDString];
    v26 = [v7 activeOperationalDataSet];
    (*(void (**)(uint64_t, void *, void *, void *, void))(v24 + 16))(v24, v23, v25, v26, 0);

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
    id v9 = 0;
  }
}

uint64_t __70__HMDThreadNetworkMetadataStore__retrievePreferredNetwork_completion___block_invoke_29(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  return [v2 invalidate];
}

- (void)_retrievePreferredNetworkOnThreadCapableController:(id)a3 threadClient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v11);

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke;
  v15[3] = &unk_1E6A11910;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v13 retrievePreferredNetworkWithNoScan:v15];
}

void __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  id v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v36 = v27;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Control flow: retrievePreferredNetworkWithNoScan failed : %@", buf, 0x16u);
    }
    uint64_t v28 = *(void *)(a1 + 40);
    if (v28)
    {
      v29 = *(void **)(a1 + 32);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke_28;
      v32[3] = &unk_1E6A12FA8;
      uint64_t v30 = *(void *)(a1 + 48);
      id v34 = *(id *)(a1 + 56);
      id v33 = *(id *)(a1 + 40);
      [v29 _validateOperationalDatasetWithTHClient:v30 operationalDataset:v28 storeCachedAOD:0 completion:v32];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v36 = v14;
      __int16 v37 = 2112;
      id v38 = v7;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Control flow: retrievePreferredNetworkWithNoScan returned THCredential:%@, uuid %@", buf, 0x20u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F2EB88]);
    id v16 = [v7 networkName];
    uint64_t v17 = [v7 channel];
    id v18 = [v7 panID];
    [v7 extendedPANID];
    uint64_t v19 = v31 = v8;
    id v20 = [v7 networkKey];
    v21 = [v7 PSKC];
    v22 = [v7 activeOperationalDataSet];
    id v23 = (void *)[v15 initWithName:v16 channel:v17 PANID:v18 extendedPANID:v19 masterKey:v20 passPhrase:0 PSKc:v21 operationalDataset:v22];

    id v8 = v31;
    uint64_t v24 = *(void *)(a1 + 56);
    v25 = [v31 UUIDString];
    v26 = [v7 activeOperationalDataSet];
    (*(void (**)(uint64_t, void *, void *, void *, void))(v24 + 16))(v24, v23, v25, v26, 0);

    id v9 = 0;
  }
}

uint64_t __108__HMDThreadNetworkMetadataStore__retrievePreferredNetworkOnThreadCapableController_threadClient_completion___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, 0, *(void *)(a1 + 32), a3);
}

- (void)retrievePreferredNetwork:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke;
  block[3] = &unk_1E6A193D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke_2;
  v5[3] = &unk_1E6A118E8;
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 _retrievePreferredNetwork:v3 completion:v5];
}

uint64_t __69__HMDThreadNetworkMetadataStore_retrievePreferredNetwork_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_validateOperationalDatasetWithTHClient:(id)a3 operationalDataset:(id)a4 storeCachedAOD:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke;
  v16[3] = &unk_1E6A118C0;
  BOOL v20 = a5;
  v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [v14 validateAODInternally:v13 completion:v16];
}

void __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      v29 = v24;
      __int16 v30 = 2112;
      id v31 = v6;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, operational dataset validation failed. Error: %@, credentials: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138543874;
      v29 = v11;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Operational dataset validation passed, store cached AOD: %@, THCredential:%@", buf, 0x20u);
    }
    id v13 = objc_alloc(MEMORY[0x1E4F2EB88]);
    id v14 = [v5 networkName];
    uint64_t v15 = [v5 channel];
    id v16 = [v5 panID];
    id v17 = [v5 extendedPANID];
    id v18 = [v5 networkKey];
    id v19 = [v5 PSKC];
    BOOL v20 = [v5 activeOperationalDataSet];
    v21 = (void *)[v13 initWithName:v14 channel:v15 PANID:v16 extendedPANID:v17 masterKey:v18 passPhrase:0 PSKc:v19 operationalDataset:v20];

    if (*(unsigned char *)(a1 + 64))
    {
      v22 = *(void **)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 48);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke_24;
      v25[3] = &unk_1E6A18F68;
      v25[4] = *(void *)(a1 + 32);
      id v27 = *(id *)(a1 + 56);
      id v26 = v21;
      [v22 storeCachedAODasPreferredNetwork:v23 completion:v25];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id v6 = 0;
  }
}

void __118__HMDThreadNetworkMetadataStore__validateOperationalDatasetWithTHClient_operationalDataset_storeCachedAOD_completion___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      id v9 = "%{public}@Failed to store cached AOD: %@, proceeding";
      id v10 = v6;
      uint32_t v11 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    id v8 = HMFGetLogIdentifier();
    int v13 = 138543362;
    id v14 = v8;
    id v9 = "%{public}@THClient storeCachedAODasPreferredNetwork successful";
    id v10 = v6;
    uint32_t v11 = 12;
    goto LABEL_6;
  }

  (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0, v12);
}

- (void)_retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__134147;
  id v19 = __Block_byref_object_dispose__134148;
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
  id v6 = (void *)v16[5];
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__HMDThreadNetworkMetadataStore__retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke;
    v12[3] = &unk_1E6A11898;
    v12[4] = self;
    id v13 = v4;
    id v14 = &v15;
    [v6 retrievePreferredCredentialsInternally:v12];
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    HMFGetOSLogHandle();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", buf, 0xCu);
    }
    uint32_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v11);
  }
  _Block_object_dispose(&v15, 8);
}

void __85__HMDThreadNetworkMetadataStore__retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve preferred thread network credentials record : %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F2EB88]);
    v22 = [v7 networkName];
    unsigned int v23 = [v7 channel];
    uint32_t v11 = [v7 panID];
    uint64_t v12 = [v7 extendedPANID];
    id v13 = [v7 networkKey];
    [v7 PSKC];
    uint64_t v15 = v14 = v8;
    id v16 = [v7 activeOperationalDataSet];
    uint64_t v17 = (void *)[v24 initWithName:v22 channel:v23 PANID:v11 extendedPANID:v12 masterKey:v13 passPhrase:0 PSKc:v15 operationalDataset:v16];

    id v8 = v14;
    id v10 = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  }
}

- (void)retrieveBorderRouterPreferredNetworkWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke_2;
  v4[3] = &unk_1E6A12FA8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _retrieveBorderRouterPreferredNetworkWithCompletion:v4];
}

uint64_t __84__HMDThreadNetworkMetadataStore_retrieveBorderRouterPreferredNetworkWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_retrieveMetadataOnController:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__134147;
  __int16 v30 = __Block_byref_object_dispose__134148;
  id v31 = (id)[objc_alloc(MEMORY[0x1E4F42198]) initWithKeychainAccessGroup:@"com.apple.thread.network"];
  if (v27[5])
  {
    if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
      && (+[HMDDeviceCapabilities deviceCapabilities],
          uint32_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 supportsThreadService],
          v11,
          v12))
    {
      uint64_t v13 = v27[5];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke;
      v23[3] = &unk_1E6A11870;
      id v24 = v9;
      v25 = &v26;
      [(HMDThreadNetworkMetadataStore *)self _retrieveMetadataOnThreadCapableController:v8 threadClient:v13 homeHasResident:v6 completion:v23];
    }
    else
    {
      id v14 = (void *)v27[5];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke_2;
      v20[3] = &unk_1E6A11898;
      v20[4] = self;
      id v21 = v9;
      v22 = &v26;
      [v14 retrievePreferredCredentialsInternally:v20];
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = self;
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v33 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@CoreThreadCommissionerService is not reachable.", buf, 0xCu);
    }
    id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:58];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v19);
  }
  _Block_object_dispose(&v26, 8);
}

uint64_t __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

void __90__HMDThreadNetworkMetadataStore__retrieveMetadataOnController_homeHasResident_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = *(id *)(a1 + 32);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Pairing flow: retrievePreferredCredentialsInternally failed : %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F2EB88]);
    v22 = [v7 networkName];
    unsigned int v23 = [v7 channel];
    uint32_t v11 = [v7 panID];
    int v12 = [v7 extendedPANID];
    uint64_t v13 = [v7 networkKey];
    [v7 PSKC];
    uint64_t v15 = v14 = v8;
    id v16 = [v7 activeOperationalDataSet];
    uint64_t v17 = (void *)[v24 initWithName:v22 channel:v23 PANID:v11 extendedPANID:v12 masterKey:v13 passPhrase:0 PSKc:v15 operationalDataset:v16];

    id v8 = v14;
    id v10 = 0;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) invalidate];
  }
}

- (void)_retrieveMetadataOnThreadCapableController:(id)a3 threadClient:(id)a4 homeHasResident:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  dispatch_assert_queue_V2(v13);

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke;
  v17[3] = &unk_1E6A11848;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v15 retrievePreferredNetworkWithNoScan:v17];
}

void __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = *(id *)(a1 + 32);
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unsigned int v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v43 = v23;
      __int16 v44 = 2112;
      v45 = v10;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Pairing flow: retrievePreferredNetworkWithNoScan failed : %@", buf, 0x16u);
    }
    uint64_t v24 = *(void *)(a1 + 40);
    v25 = (void *)MEMORY[0x1D9452090]();
    id v26 = *(id *)(a1 + 32);
    __int16 v27 = HMFGetOSLogHandle();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v28)
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v43 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Pairing flow: Using cached AOD, validating operational dataset", buf, 0xCu);
      }
      uint64_t v31 = *(void *)(a1 + 40);
      uint64_t v30 = *(void *)(a1 + 48);
      __int16 v32 = *(void **)(a1 + 32);
      BOOL v33 = *(unsigned char *)(a1 + 64) == 0;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_20;
      v38[3] = &unk_1E6A11820;
      id v39 = *(id *)(a1 + 56);
      [v32 _validateOperationalDatasetWithTHClient:v30 operationalDataset:v31 storeCachedAOD:v33 completion:v38];
      uint64_t v34 = v39;
    }
    else
    {
      if (v28)
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        id v43 = v35;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Pairing flow: No cached AOD, calling retrieveOrGeneratePreferredNetworkInternally", buf, 0xCu);
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_17;
      v40[3] = &unk_1E6A117F8;
      v40[4] = *(void *)(a1 + 32);
      id v36 = *(void **)(a1 + 48);
      id v41 = *(id *)(a1 + 56);
      [v36 retrieveOrGeneratePreferredNetworkInternally:v40];
      uint64_t v34 = v41;
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2EB88]);
    id v12 = [v7 networkName];
    uint64_t v13 = [v7 channel];
    id v14 = [v7 panID];
    [v7 extendedPANID];
    id v15 = v37 = v8;
    id v16 = [v7 networkKey];
    uint64_t v17 = [v7 PSKC];
    id v18 = [v7 activeOperationalDataSet];
    id v19 = (void *)[v11 initWithName:v12 channel:v13 PANID:v14 extendedPANID:v15 masterKey:v16 passPhrase:0 PSKc:v17 operationalDataset:v18];

    id v10 = 0;
    id v8 = v37;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      BOOL v28 = v25;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Pairing flow: retrieveOrGeneratePreferredNetworkInternally failed : %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v26 = a1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      BOOL v28 = v14;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Pairing flow: retrieveOrGeneratePreferredNetworkInternally returned THCredential:%@, uuid %@", buf, 0x20u);
    }
    id v15 = objc_alloc(MEMORY[0x1E4F2EB88]);
    id v16 = [v7 networkName];
    uint64_t v17 = [v7 channel];
    id v18 = [v7 panID];
    id v19 = [v7 extendedPANID];
    id v20 = [v7 networkKey];
    id v21 = [v7 PSKC];
    [v7 activeOperationalDataSet];
    unsigned int v23 = v22 = v8;
    uint64_t v24 = (void *)[v15 initWithName:v16 channel:v17 PANID:v18 extendedPANID:v19 masterKey:v20 passPhrase:0 PSKc:v21 operationalDataset:v23];

    id v8 = v22;
    (*(void (**)(void))(*(void *)(v26 + 40) + 16))();

    id v9 = 0;
  }
}

uint64_t __116__HMDThreadNetworkMetadataStore__retrieveMetadataOnThreadCapableController_threadClient_homeHasResident_completion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)retrieveMetadata:(id)a3 homeHasResident:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HMDThreadNetworkMetadataStore *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke;
  v13[3] = &unk_1E6A16328;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke_2;
  v6[3] = &unk_1E6A12FA8;
  id v5 = *(id *)(a1 + 48);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 _retrieveMetadataOnController:v3 homeHasResident:v4 completion:v6];
}

uint64_t __77__HMDThreadNetworkMetadataStore_retrieveMetadata_homeHasResident_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)initInternal
{
  v14.receiver = self;
  v14.super_class = (Class)HMDThreadNetworkMetadataStore;
  uint64_t v2 = [(HMDThreadNetworkMetadataStore *)&v14 init];
  if (v2)
  {
    uint64_t v3 = (const char *)HMFDispatchQueueName();
    uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_get_global_queue(17, 0);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2(v3, v4, v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    id v8 = (const char *)HMFDispatchQueueName();
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_get_global_queue(9, 0);
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2(v8, v9, v10);
    workQueueNetworkChanged = v2->_workQueueNetworkChanged;
    v2->_workQueueNetworkChanged = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (HMDThreadNetworkMetadataStore)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  dispatch_queue_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (HMDThreadNetworkMetadataStore)_testOnlyStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained(&_testOnlyStore_weakStore);
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    dispatch_queue_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing store", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new store", (uint8_t *)&v11, 0xCu);
    }
    id WeakRetained = [[HMDThreadNetworkMetadataStore alloc] initInternal];
    objc_storeWeak(&_testOnlyStore_weakStore, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_testOnlyStore_lock);
  return (HMDThreadNetworkMetadataStore *)WeakRetained;
}

+ (HMDThreadNetworkMetadataStore)defaultStore
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained(&defaultStore_weakStore);
  uint64_t v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    dispatch_queue_t v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing store", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    HMFGetOSLogHandle();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new store", (uint8_t *)&v11, 0xCu);
    }
    id WeakRetained = [[HMDThreadNetworkMetadataStore alloc] initInternal];
    objc_storeWeak(&defaultStore_weakStore, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&defaultStore_lock);
  return (HMDThreadNetworkMetadataStore *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_134211 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_134211, &__block_literal_global_134212);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_134213;
  return v2;
}

uint64_t __44__HMDThreadNetworkMetadataStore_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_134213;
  logCategory__hmf_once_v1_134213 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  dispatch_queue_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end