@interface HMDSoftwareUpdateManager
+ (BOOL)isSupported;
- (HMDAppleMediaAccessory)accessory;
- (HMDSoftwareUpdateManager)init;
- (NSHashTable)activeClients;
- (NSUUID)identifier;
- (OS_dispatch_queue)clientQueue;
- (id)messageDestination;
- (id)messageDispatcher;
- (void)_handleStart:(id)a3;
- (void)_handleStop:(id)a3;
- (void)_handleUpdateAvailableUpdate:(id)a3;
- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3;
- (void)registerForMessages;
- (void)setAccessory:(id)a3;
- (void)startUpdate:(id)a3 completionHandler:(id)a4;
- (void)updateAvailableUpdate:(id)a3;
@end

@implementation HMDSoftwareUpdateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

- (NSHashTable)activeClients
{
  return self->_activeClients;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  v4 = [(HMDSoftwareUpdateManager *)self messageTargetUUID];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (void)startUpdate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDSoftwareUpdateManager *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E6A193D0;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke(id *a1)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] activeClients];
  id v3 = [v2 anyObject];

  if (v3)
  {
    uint64_t v28 = *MEMORY[0x1E4F2E0F8];
    v4 = encodeRootObjectForIncomingXPCMessage(a1[5], 0);
    v29[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

    id v6 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2E0D8] messagePayload:v5];
    id v7 = (void *)[v6 mutableCopy];

    v8 = [a1[4] messageDestination];
    [v7 setDestination:v8];

    [v7 setTransport:v3];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_32;
    v22[3] = &unk_1E6A17178;
    p_long long buf = &buf;
    id v23 = a1[6];
    [v7 setResponseHandler:v22];
    id v9 = [a1[4] messageDispatcher];
    id v10 = (void *)[v7 copy];
    [v9 sendMessage:v10 completionHandler:0];

    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    id v12 = [a1[4] clientQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6A17150;
    v21 = &buf;
    v18[4] = a1[4];
    id v19 = v7;
    id v20 = a1[6];
    id v13 = v7;
    dispatch_after(v11, v12, v18);

    _Block_object_dispose(&buf, 8);
LABEL_7:

    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = a1[4];
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle start update, no active clients", (uint8_t *)&buf, 0xCu);
  }
  if (a1[6])
  {
    v5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
LABEL_8:
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v6 + 24) && *(void *)(a1 + 32))
  {
    id v7 = v10;
    v8 = v7;
    if (v7 && ([v7 isHMError] & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:0 reason:0 suggestion:0 underlyingError:v8];

      v8 = (void *)v9;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v6 + 24) = 1;
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);
    }
    if (*(void *)(a1 + 48))
    {
      id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6A19530;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) activeClients];
  id v3 = [v2 anyObject];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F654B0] entitledMessageWithName:*MEMORY[0x1E4F2E0C0] messagePayload:0];
    id v5 = (void *)[v4 mutableCopy];

    id v6 = [*(id *)(a1 + 32) messageDestination];
    [v5 setDestination:v6];

    [v5 setTransport:v3];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_25;
    v23[3] = &unk_1E6A17128;
    p_long long buf = &buf;
    id v7 = *(id *)(a1 + 40);
    v23[4] = *(void *)(a1 + 32);
    id v24 = v7;
    objc_copyWeak(&v26, &location);
    [v5 setResponseHandler:v23];
    id v8 = [*(id *)(a1 + 32) messageDispatcher];
    uint64_t v9 = (void *)[v5 copy];
    [v8 sendMessage:v9 completionHandler:0];

    dispatch_time_t v10 = dispatch_time(0, 30000000000);
    uint64_t v11 = [*(id *)(a1 + 32) clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_31;
    block[3] = &unk_1E6A17150;
    v22 = &buf;
    uint64_t v12 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v20 = v5;
    id v21 = v12;
    id v13 = v5;
    dispatch_after(v10, v11, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = *(id *)(a1 + 32);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle fetch, no active clients", (uint8_t *)&buf, 0xCu);
    }
    if (*(void *)(a1 + 40))
    {
      v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) || !*(void *)(a1 + 40)) {
    goto LABEL_2;
  }
  if (v5)
  {
    id v8 = v5;
    if (([v8 isHMError] & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23 description:0 reason:0 suggestion:0 underlyingError:v8];

      id v8 = (id)v9;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_2;
  }
  dispatch_time_t v10 = objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x1E4F2E0F8]);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28DC0] deserializeObjectWithData:v10 allowedClass:objc_opt_class() frameworkClasses:&unk_1F2DC7060];
    uint64_t v12 = v11;
    if (!v11 || [v11 downloadSize]) {
      goto LABEL_15;
    }
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v32 = v16;
      __int16 v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Fetch returned invalid update with download size 0: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = 0;
LABEL_15:

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v18 = [WeakRetained accessory];
  id v26 = [v18 softwareUpdate];
  if (v12 && v18)
  {
    char v19 = [v12 isEqual:v26];
    context = (void *)MEMORY[0x1D9452090]();
    id v20 = WeakRetained;
    id v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v22)
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        v32 = v23;
        __int16 v33 = 2112;
        v34 = v12;
        __int16 v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch returned update, %@, matching existing update: %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (v22)
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        v32 = v24;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with software update: %@", buf, 0x16u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_29;
      v27[3] = &unk_1E6A18500;
      objc_copyWeak(&v30, (id *)(a1 + 56));
      id v28 = v12;
      id v29 = *(id *)(a1 + 40);
      [v18 updateSoftwareUpdate:v28 completionHandler:v27];

      objc_destroyWeak(&v30);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_2:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_31(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = HMFGetLogIdentifier();
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);
    }
    if (*(void *)(a1 + 48))
    {
      id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543874;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated software update, %@, with error: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)(a1 + 32);
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10, v3);
}

- (void)updateAvailableUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateManager *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__HMDSoftwareUpdateManager_updateAvailableUpdate___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__HMDSoftwareUpdateManager_updateAvailableUpdate___block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F654B0];
  uint64_t v3 = *MEMORY[0x1E4F2E0F0];
  uint64_t v11 = *MEMORY[0x1E4F2E0F8];
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    encodeRootObjectForIncomingXPCMessage(v4, 0);
  }
  else {
  id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v7 = [v2 entitledMessageWithName:v3 messagePayload:v6];

  id v8 = [*(id *)(a1 + 40) messageDestination];
  [v7 setDestination:v8];

  uint64_t v9 = [*(id *)(a1 + 40) messageDispatcher];
  uint64_t v10 = (void *)[v7 copy];
  [v9 sendMessage:v10 completionHandler:0];
}

- (void)_handleUpdateAvailableUpdate:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDSoftwareUpdateManager *)self accessory];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F2E0F8];
    id v7 = [v4 nullForKey:*MEMORY[0x1E4F2E0F8]];

    if (v7)
    {
      id v8 = 0;
LABEL_4:
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __57__HMDSoftwareUpdateManager__handleUpdateAvailableUpdate___block_invoke;
      v34[3] = &unk_1E6A196E0;
      id v35 = v4;
      id v8 = v8;
      id v36 = v8;
      [v5 updateSoftwareUpdate:v8 completionHandler:v34];

      uint64_t v9 = (void (**)(void, void, void))v35;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v9 = [v4 dataForKey:v6];
    if (v9)
    {
      __int16 v15 = [MEMORY[0x1E4F28DC0] deserializeObjectWithData:v9 allowedClass:objc_opt_class() frameworkClasses:&unk_1F2DC7048];
      if (v15)
      {
        id v8 = v15;
        if ([v15 downloadSize])
        {

          goto LABEL_4;
        }
        id v29 = (void *)MEMORY[0x1D9452090]();
        id v30 = self;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v38 = v32;
          __int16 v39 = 2112;
          id v40 = v8;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Invalid software update with download size 0 in message payload, %@", buf, 0x16u);
        }
        __int16 v33 = [v4 responseHandler];

        if (!v33) {
          goto LABEL_28;
        }
        char v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        id v28 = [v4 responseHandler];
        ((void (**)(void, void *, void))v28)[2](v28, v27, 0);
LABEL_22:

        goto LABEL_28;
      }
      id v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = self;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v38 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Invalid software update in message payload", buf, 0xCu);
      }
      id v8 = [v4 responseHandler];

      if (!v8) {
        goto LABEL_28;
      }
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 22;
    }
    else
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        char v19 = HMFGetLogIdentifier();
        id v20 = [v4 messagePayload];
        *(_DWORD *)long long buf = 138543618;
        v38 = v19;
        __int16 v39 = 2112;
        id v40 = v20;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized software update from message payload: %@", buf, 0x16u);
      }
      id v8 = [v4 responseHandler];

      if (!v8)
      {
        uint64_t v9 = 0;
        goto LABEL_28;
      }
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = 3;
    }
    char v27 = [v21 hmErrorWithCode:v22];
    id v28 = [v4 responseHandler];
    ((void (**)(void, void *, void))v28)[2](v28, v27, 0);
    id v8 = 0;
    goto LABEL_22;
  }
  uint64_t v10 = (void *)MEMORY[0x1D9452090]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    v38 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not configured, Missing current accessory", buf, 0xCu);
  }
  uint64_t v14 = [v4 responseHandler];

  if (v14)
  {
    id v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
    uint64_t v9 = [v4 responseHandler];
    ((void (**)(void, id, void))v9)[2](v9, v8, 0);
    goto LABEL_28;
  }
LABEL_29:
}

void __57__HMDSoftwareUpdateManager__handleUpdateAvailableUpdate___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) responseHandler];

  if (v4)
  {
    if (v3)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [*(id *)(a1 + 40) identifier];

      if (v5)
      {
        uint64_t v9 = *MEMORY[0x1E4F2E0C8];
        uint64_t v6 = [*(id *)(a1 + 40) identifier];
        id v7 = [v6 UUIDString];
        v10[0] = v7;
        id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      }
    }
    id v8 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void *))v8)[2](v8, v3, v5);
  }
}

- (void)_handleStop:(id)a3
{
  id v8 = a3;
  id v4 = [v8 transport];
  if (v4)
  {
    id v5 = [(HMDSoftwareUpdateManager *)self activeClients];
    [v5 removeObject:v4];
  }
  uint64_t v6 = [v8 responseHandler];

  if (v6)
  {
    id v7 = [v8 responseHandler];
    v7[2](v7, 0, 0);
  }
}

- (void)_handleStart:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 transport];
  if (v5)
  {
    uint64_t v6 = [(HMDSoftwareUpdateManager *)self activeClients];
    [v6 addObject:v5];
  }
  id v7 = [v4 responseHandler];

  if (v7)
  {
    id v8 = [(HMDSoftwareUpdateManager *)self accessory];
    uint64_t v9 = [v8 softwareUpdate];

    if (v9)
    {
      uint64_t v13 = *MEMORY[0x1E4F2E0F8];
      uint64_t v10 = encodeRootObjectForIncomingXPCMessage(v9, 0);
      v14[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v4 responseHandler];
    ((void (**)(void, void, void *))v12)[2](v12, 0, v11);
  }
}

- (void)registerForMessages
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDSoftwareUpdateManager *)self messageDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:5];
  uint64_t v5 = *MEMORY[0x1E4F2E0D0];
  v14[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v3 registerForMessage:v5 receiver:self policies:v6 selector:sel__handleStart_];

  uint64_t v7 = *MEMORY[0x1E4F2E0E0];
  uint64_t v13 = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v3 registerForMessage:v7 receiver:self policies:v8 selector:sel__handleStop_];

  uint64_t v9 = *MEMORY[0x1E4F2E0F0];
  v12[0] = v4;
  uint64_t v10 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
  v12[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 registerForMessage:v9 receiver:self policies:v11 selector:sel__handleUpdateAvailableUpdate_];
}

- (id)messageDispatcher
{
  return +[HMDMessageDispatcher defaultDispatcher];
}

- (HMDSoftwareUpdateManager)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (+[HMDSoftwareUpdateManager isSupported])
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDSoftwareUpdateManager;
    id v3 = [(HMDSoftwareUpdateManager *)&v19 init];
    if (v3)
    {
      HMDispatchQueueNameString();
      id v4 = objc_claimAutoreleasedReturnValue();
      uint64_t v5 = (const char *)[v4 UTF8String];
      uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
      clientQueue = v3->_clientQueue;
      v3->_clientQueue = (OS_dispatch_queue *)v7;

      id v9 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v10 = [v9 initWithUUIDString:*MEMORY[0x1E4F2E0E8]];
      identifier = v3->_identifier;
      v3->_identifier = (NSUUID *)v10;

      uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      activeClients = v3->_activeClients;
      v3->_activeClients = (NSHashTable *)v12;

      [(HMDSoftwareUpdateManager *)v3 registerForMessages];
    }
    self = v3;
    uint64_t v14 = self;
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v21 = v17;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Software updates are not valid on this target", buf, 0xCu);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F65548] productInfo];
  BOOL v3 = [v2 productClass] == 6;

  return v3;
}

@end