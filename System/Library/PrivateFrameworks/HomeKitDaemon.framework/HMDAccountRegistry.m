@interface HMDAccountRegistry
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (HMDAccountRegistry)sharedRegistry;
+ (id)logCategory;
- (BOOL)accountExistsForHandle:(id)a3;
- (BOOL)deviceExistsForDevice:(id)a3;
- (BOOL)started;
- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4;
- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4 context:(id)a5;
- (HMDAppleAccountManager)appleAccountManager;
- (HMDRemoteAccountManager)remoteAccountManager;
- (NSArray)accounts;
- (OS_dispatch_queue)clientQueue;
- (id)accountForHandle:(id)a3;
- (id)accountForHandle:(id)a3 exists:(BOOL *)a4;
- (id)attributeDescriptions;
- (id)deviceForAddress:(id)a3;
- (id)deviceForDevice:(id)a3;
- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4;
- (id)deviceForHandle:(id)a3;
- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForIdentifier:(id)a3;
- (id)deviceForPushToken:(id)a3;
- (id)existingAccountWithMergeIdentifier:(id)a3;
- (id)fetchAccountsWithLocalFlag:(BOOL)a3;
- (id)findBackingModelFromDevice:(id)a3;
- (id)updateDevices:(id)a3 onAccount:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)__handleAddedRemoteAccount:(id)a3;
- (void)__handleAppleAccountDeviceAdded:(id)a3;
- (void)__handleAppleAccountHandlesUpdated:(id)a3;
- (void)__handleAppleAccountUpdate:(id)a3;
- (void)__handleRemovedRemoteAccount:(id)a3;
- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4;
- (void)accountInformationChanged:(id)a3;
- (void)addAccount:(id)a3 isLocal:(BOOL)a4;
- (void)addDevice:(id)a3 toAccount:(id)a4;
- (void)addHandle:(id)a3 toAccount:(id)a4;
- (void)removeAccount:(id)a3;
- (void)removeDevice:(id)a3 fromAccount:(id)a4;
- (void)removeHandle:(id)a3 fromAccount:(id)a4;
- (void)reset;
- (void)start;
- (void)stop;
- (void)updateAccount:(id)a3;
- (void)updateDevice:(id)a3 toVersion:(id)a4;
- (void)updateDevice:(id)a3 withDevice:(id)a4;
@end

@implementation HMDAccountRegistry

- (void)removeHandle:(id)a3 fromAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__HMDAccountRegistry_Roar__removeHandle_fromAccount___block_invoke;
  v10[3] = &unk_264A19250;
  id v11 = v6;
  v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HMCContextProvider *)self performBlock:v10];
}

void __53__HMDAccountRegistry_Roar__removeHandle_fromAccount___block_invoke(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [a1[4] modelIdentifier];
  v5 = +[HMCContext findAccountHandleWithModelID:v4];

  if (v5)
  {
    id v6 = [v5 modelID];
    id v7 = [a1[4] modelIdentifier];
    if ([v6 isEqual:v7])
    {
      id v8 = [v5 account];
      id v9 = [v8 modelID];
      v10 = [a1[6] modelIdentifier];
      int v11 = [v9 isEqual:v10];

      if (v11)
      {
        [v3 deleteObject:v5];
LABEL_12:
        [v3 save];
        goto LABEL_13;
      }
    }
    else
    {
    }
    v17 = (void *)MEMORY[0x230FBD990]();
    id v18 = a1[5];
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v21 = [v5 modelID];
      v22 = [a1[4] modelIdentifier];
      v23 = [v5 account];
      [v23 modelID];
      v24 = v26 = v17;
      v25 = [a1[6] modelIdentifier];
      *(_DWORD *)buf = 138544386;
      v28 = v20;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = v24;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Refusing to remove a handle which doesn't appear attached to the correct account (%@ != %@ || %@ != %@)", buf, 0x34u);

      v17 = v26;
    }

    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = a1[5];
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [a1[6] modelIdentifier];
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account handle with modelID %@ to remove.", buf, 0x16u);
  }
LABEL_13:
}

- (void)addHandle:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 modelIdentifier];
  [v6 setModelParentIdentifier:v8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HMDAccountRegistry_Roar__addHandle_toAccount___block_invoke;
  v12[3] = &unk_264A19228;
  id v13 = v8;
  v14 = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [(HMCContextProvider *)self performBlock:v12];
}

void __48__HMDAccountRegistry_Roar__addHandle_toAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = +[HMCContext findAccountWithModelID:*(void *)(a1 + 32)];
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v16 = 138543874;
      v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding account handle %@ to account %@", (uint8_t *)&v16, 0x20u);
    }
    v12 = [*(id *)(a1 + 48) modelIdentifier];
    id v13 = [v4 materializeOrCreateHandlesRelationWithModelID:v12 createdNew:0];

    [*(id *)(a1 + 48) updateBackingModel:v13 error:0];
    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138543618;
      v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to add handle to.", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)removeDevice:(id)a3 fromAccount:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __53__HMDAccountRegistry_Roar__removeDevice_fromAccount___block_invoke;
    v12[3] = &unk_264A19250;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v7;
    [(HMCContextProvider *)self performBlock:v12];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = 0;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Requested to remove a nil device: %@", buf, 0x16u);
    }
  }
}

void __53__HMDAccountRegistry_Roar__removeDevice_fromAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) findBackingModelFromDevice:*(void *)(a1 + 40)];
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing device model for device %@ from account %@", (uint8_t *)&v14, 0x20u);
    }
    [v3 deleteObject:v4];
    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 40) modelIdentifier];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      __int16 v17 = v13;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device with modelID %@ to remove device", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)addDevice:(id)a3 toAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 account];
  id v9 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  if (([v8 isEqual:v7] & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_4:
    [v6 setAccount:v7];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HMDAccountRegistry_Roar__addDevice_toAccount___block_invoke;
  v12[3] = &unk_264A19250;
  id v13 = v7;
  int v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v7;
  [(HMCContextProvider *)self performBlock:v12];
}

void __48__HMDAccountRegistry_Roar__addDevice_toAccount___block_invoke(id *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [a1[4] modelIdentifier];
  v5 = +[HMCContext findAccountWithModelID:v4];

  if (v5)
  {
    char v25 = 0;
    id v6 = [a1[6] modelIdentifier];
    id v7 = [v5 materializeOrCreateDevicesRelationWithModelID:v6 createdNew:&v25];

    if (!v25)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = a1[5];
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        id v12 = a1[6];
        id v13 = a1[4];
        *(_DWORD *)buf = 138543874;
        v27 = v11;
        __int16 v28 = 2112;
        __int16 v29 = v12;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Requested to add device %@ to account %@, but it appears to already be there.", buf, 0x20u);
      }
    }
    int v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1[5];
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      id v18 = a1[6];
      id v19 = a1[4];
      *(_DWORD *)buf = 138543874;
      v27 = v17;
      __int16 v28 = 2112;
      __int16 v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding created device model for device %@ to account %@", buf, 0x20u);
    }
    [a1[6] updateBackingModel:v7 error:0];
    [v3 save];
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = a1[5];
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [a1[4] modelIdentifier];
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      __int16 v28 = 2112;
      __int16 v29 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to add device to.", buf, 0x16u);
    }
  }
}

- (void)updateDevice:(id)a3 withDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 account];
  id v9 = [v6 account];
  if (!v8) {
    goto LABEL_4;
  }
  if (([v8 isEqual:v9] & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_4:
    [v7 setAccount:v9];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__HMDAccountRegistry_Roar__updateDevice_withDevice___block_invoke;
  v12[3] = &unk_264A19250;
  id v13 = v6;
  int v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [(HMCContextProvider *)self performBlock:v12];
}

void __52__HMDAccountRegistry_Roar__updateDevice_withDevice___block_invoke(id *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [a1[4] modelIdentifier];
  v5 = +[HMCContext findDeviceWithModelID:v4];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = a1[5];
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = a1[4];
      id v12 = a1[6];
      int v15 = 138543874;
      __int16 v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating device model from device %@ to device %@", (uint8_t *)&v15, 0x20u);
    }
    [a1[6] updateBackingModel:v5 error:0];
    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = [a1[4] modelIdentifier];
      int v15 = 138543618;
      __int16 v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device with modelID %@ to update device", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (id)findBackingModelFromDevice:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 modelIdentifier];

  if (v5)
  {
    id v6 = [v4 modelIdentifier];
    v5 = +[HMCContext findDeviceWithModelID:v6];

    if (!v5)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device %@", (uint8_t *)&v12, 0x16u);
      }
      v5 = 0;
    }
  }

  return v5;
}

- (void)updateDevice:(id)a3 toVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HMDAccountRegistry_Roar__updateDevice_toVersion___block_invoke;
  v10[3] = &unk_264A19250;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(HMCContextProvider *)self performBlock:v10];
}

void __51__HMDAccountRegistry_Roar__updateDevice_toVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) findBackingModelFromDevice:*(void *)(a1 + 40)];
  v5 = v4;
  if (v4)
  {
    [v4 setVersion:*(void *)(a1 + 48)];
    [v3 save];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = 138543874;
      id v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch device %@ to update device version: %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (id)updateDevices:(id)a3 onAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  id v8 = [MEMORY[0x263F42538] futureWithPromise:&v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke;
  v18[3] = &unk_264A19200;
  id v9 = v7;
  id v19 = v9;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_2;
  v13[3] = &unk_264A19228;
  id v14 = v9;
  uint64_t v15 = self;
  id v16 = v6;
  id v17 = v20;
  id v10 = v6;
  id v11 = v9;
  [(HMCContextProvider *)self performBlock:v13];

  return v8;
}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 account];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3)
  {
    if ([v3 isEqual:v5]) {
      goto LABEL_5;
    }
    _HMFPreconditionFailure();
  }
  [v6 setAccount:v5];
LABEL_5:
}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_2(id *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [a1[4] modelIdentifier];
  id v22 = 0;
  uint64_t v5 = +[HMCContext findAccountWithModelID:v4 error:&v22];
  id v6 = v22;

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [a1[4] updateBackingModel:v5 error:0];
    id v13 = [a1[6] allObjects];
    [v5 synchronizeDevicesRelationWith:v13];

    id v14 = [v5 devices];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_22;
    v21[3] = &unk_264A1D8C8;
    v21[4] = a1[5];
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1[5];
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      id v19 = a1[4];
      id v20 = a1[6];
      *(_DWORD *)buf = 138543874;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      __int16 v27 = 2112;
      id v28 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating account %@ with devices: %@.", buf, 0x20u);
    }
    [v3 save];
    [a1[7] fulfillWithNoValue];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1[5];
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = [a1[4] modelIdentifier];
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v12;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ to update devices on account: %@", buf, 0x20u);
    }
  }
}

void __52__HMDAccountRegistry_Roar__updateDevices_onAccount___block_invoke_22(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 mediaRouteID];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) context];
    uint64_t v5 = [v4 backingStore];
    id v6 = [v5 homeManager];
    BOOL v7 = [v9 identifier];
    id v8 = (id)[v6 updateMediaRouteIDOfDeviceWithIdentifier:v7];
  }
}

- (void)updateAccount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__HMDAccountRegistry_Roar__updateAccount___block_invoke;
  v6[3] = &unk_264A191D8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(HMCContextProvider *)self performBlock:v6];
}

void __42__HMDAccountRegistry_Roar__updateAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 findHomeManagerWithError:0];
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) modelIdentifier];
  id v7 = [v5 materializeOrCreateAccountsRelationWithModelID:v6 createdNew:0];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 40);
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = HMFGetLogIdentifier();
      id v13 = *(void **)(a1 + 32);
      int v16 = 138543618;
      id v17 = v12;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating account %@ in database.", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) updateBackingModel:v7 error:0];
    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [*(id *)(a1 + 32) modelIdentifier];
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine existance of account %@ in database.", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)removeAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 modelIdentifier], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__HMDAccountRegistry_Roar__removeAccount___block_invoke;
    v11[3] = &unk_264A191D8;
    id v12 = v5;
    id v13 = self;
    [(HMCContextProvider *)self performBlock:v11];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Requested to remove a nil account or an account without an identifier: %@", buf, 0x16u);
    }
  }
}

void __42__HMDAccountRegistry_Roar__removeAccount___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) modelIdentifier];
  id v5 = +[HMCContext findAccountWithModelID:v4];

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 40);
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      id v11 = *(void **)(a1 + 32);
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing account %@ from database.", (uint8_t *)&v14, 0x16u);
    }
    [v3 deleteObject:v5];
    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) modelIdentifier];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch account with modelID %@ for removal.", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)addAccount:(id)a3 isLocal:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __47__HMDAccountRegistry_Roar__addAccount_isLocal___block_invoke;
  v8[3] = &unk_264A191B0;
  id v9 = v6;
  id v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  [(HMCContextProvider *)self performBlock:v8];
}

void __47__HMDAccountRegistry_Roar__addAccount_isLocal___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 findHomeManagerWithError:0];
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) modelIdentifier];
  id v7 = [v5 materializeOrCreateAccountsRelationWithModelID:v6 createdNew:0];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 40);
  id v10 = HMFGetOSLogHandle();
  BOOL v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      id v13 = *(void **)(a1 + 32);
      int v17 = 138543618;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      uint64_t v20 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding account %@ to database.", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) updateBackingModel:v7 error:0];
    int v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v7 setLocal:v14];

    [v3 save];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      __int16 v16 = [*(id *)(a1 + 32) modelIdentifier];
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine existence of account %@ in database.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (id)fetchAccountsWithLocalFlag:(BOOL)a3
{
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__38294;
  void v13[4] = __Block_byref_object_dispose__38295;
  id v14 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__38294;
  BOOL v11 = __Block_byref_object_dispose__38295;
  id v12 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke;
  v5[3] = &unk_264A19188;
  BOOL v6 = a3;
  v5[4] = self;
  v5[5] = v13;
  v5[6] = &v7;
  [(HMCContextProvider *)self unsafeSynchronousBlock:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v3;
}

void __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke(uint64_t a1, void *a2)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v24 = 0;
    id v5 = [v3 findLocalAccountWithError:&v24];
    id v6 = v24;
    if (v5)
    {
      v31[0] = v5;
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
  }
  else
  {
    id v23 = 0;
    uint64_t v10 = [v3 findRemoteAccountsWithError:&v23];
    id v6 = v23;
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_12;
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v15 = HMFGetLogIdentifier();
    int v16 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v26 = v15;
    if (v16) {
      int v17 = @"the local account";
    }
    else {
      int v17 = @"remote accounts";
    }
    __int16 v27 = 2112;
    id v28 = v17;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch %@: %@", buf, 0x20u);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
LABEL_12:
    uint64_t v18 = [MEMORY[0x263EFF980] array];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke_8;
    v22[3] = &unk_264A19160;
    v22[4] = *(void *)(a1 + 48);
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);
  }
}

void __55__HMDAccountRegistry_Roar__fetchAccountsWithLocalFlag___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HMDAccount alloc] initWithBackingModel:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    uint64_t v4 = v5;
  }
}

- (void)accountInformationChanged:(id)a3
{
  id v4 = a3;
  [v4 dumpForLoggingWithPrefix:@"Account Registry" logType:0];
  id v5 = [v4 updates];
  __sendChangeNotifications(self, v5, 4);

  id v6 = [v4 inserts];
  __sendChangeNotifications(self, v6, 1);

  id v7 = [v4 deletes];

  __sendChangeNotifications(self, v7, 2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28_60783 != -1) {
    dispatch_once(&logCategory__hmf_once_t28_60783, &__block_literal_global_35_60784);
  }
  v2 = (void *)logCategory__hmf_once_v29_60785;
  return v2;
}

void __33__HMDAccountRegistry_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v29_60785;
  logCategory__hmf_once_v29_60785 = v0;
}

+ (HMDAccountRegistry)sharedRegistry
{
  if (sharedRegistry__hmf_once_t0 != -1) {
    dispatch_once(&sharedRegistry__hmf_once_t0, &__block_literal_global_60790);
  }
  v2 = (void *)sharedRegistry__hmf_once_v1;
  return (HMDAccountRegistry *)v2;
}

void __36__HMDAccountRegistry_sharedRegistry__block_invoke()
{
  uint64_t v0 = [HMDAccountRegistry alloc];
  id v4 = +[HMDAppleAccountManager sharedManager];
  v1 = +[HMDRemoteAccountManager sharedManager];
  uint64_t v2 = [(HMDAccountRegistry *)v0 initWithAppleAccountManager:v4 remoteAccountManager:v1];
  id v3 = (void *)sharedRegistry__hmf_once_v1;
  sharedRegistry__hmf_once_v1 = v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteAccountManager);
  objc_destroyWeak((id *)&self->_appleAccountManager);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (HMDRemoteAccountManager)remoteAccountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAccountManager);
  return (HMDRemoteAccountManager *)WeakRetained;
}

- (HMDAppleAccountManager)appleAccountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appleAccountManager);
  return (HMDAppleAccountManager *)WeakRetained;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = [(HMDAccountRegistry *)self accounts];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)_resolveAccountForHandle:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (v6)
  {
    uint64_t v8 = [(HMDAccountRegistry *)self appleAccountManager];
    unint64_t v9 = [v8 account];

    uint64_t v10 = [v9 handles];
    int v11 = [v10 containsObject:v6];

    if (v11)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v16 = [v6 shortDescription];
        int v17 = 138543618;
        uint64_t v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Not resolving handle, %@, on our account", (uint8_t *)&v17, 0x16u);
      }
      if (v7) {
        v7[2](v7, v9, 0);
      }
    }
    else
    {

      unint64_t v9 = [(HMDAccountRegistry *)self remoteAccountManager];
      [v9 _resolveAccountForHandle:v6 completionHandler:v7];
    }
  }
}

- (void)__handleRemovedRemoteAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HMDAccountRegistry___handleRemovedRemoteAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  if (v8)
  {
    id v5 = [*(id *)(a1 + 40) appleAccountManager];
    id v6 = [v5 account];
    char v7 = [v8 isRelatedToAccount:v6];

    if ((v7 & 1) == 0) {
      __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v8);
    }
  }
}

- (void)__handleAddedRemoteAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDAccountRegistry___handleAddedRemoteAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v8 = v4;

  if (v8)
  {
    id v5 = [*(id *)(a1 + 40) appleAccountManager];
    id v6 = [v5 account];
    char v7 = [v8 isRelatedToAccount:v6];

    if ((v7 & 1) == 0) {
      __notifyDelegateAccountAdded(*(void **)(a1 + 40), v8);
    }
  }
}

- (void)__handleAppleAccountDeviceAdded:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__HMDAccountRegistry___handleAppleAccountDeviceAdded___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  id v5 = [*(id *)(a1 + 40) appleAccountManager];
  id v6 = [v5 account];
  int v7 = [v4 isEqualToAccount:v6];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) userInfo];
    unint64_t v9 = [v8 objectForKeyedSubscript:@"HMDDeviceNotificationKey"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v11 = v10;

    if (v11)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = *(id *)(a1 + 40);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v16 = [v11 shortDescription];
        int v21 = 138543618;
        id v22 = v15;
        __int16 v23 = 2112;
        id v24 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that device was added to our account: %@", (uint8_t *)&v21, 0x16u);
      }
      int v17 = *(void **)(a1 + 40);
      uint64_t v18 = (void *)MEMORY[0x263EFFA08];
      __int16 v19 = [v11 handles];
      uint64_t v20 = [v18 setWithArray:v19];
      __cleanupRemoteDevicesWithHandles(v17, v20);
    }
  }
}

- (void)__handleAppleAccountHandlesUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __57__HMDAccountRegistry___handleAppleAccountHandlesUpdated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v7 = v3;

  id v4 = [*(id *)(a1 + 40) appleAccountManager];
  id v5 = [v4 account];
  int v6 = [v7 isEqualToAccount:v5];

  if (v6) {
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v7);
  }
}

- (void)__handleAppleAccountUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccountRegistry *)self clientQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  unint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__HMDAccountRegistry___handleAppleAccountUpdate___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"HMDAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"HMDPreviousAccountNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (v5)
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Received notification current account added", buf, 0xCu);
    }
    __registerForAccountUpdates(*(void **)(a1 + 40), v5);
    __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 40), v5);
    id v14 = [v5 devices];
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", 2 * objc_msgSend(v14, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v14;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v20), "handles", (void)v26);
          [v15 addObjectsFromArray:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 40), v15);
    __notifyDelegateAccountAdded(*(void **)(a1 + 40), v5);
  }
  else if (v9)
  {
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 40);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Received notification current account removed", buf, 0xCu);
    }
    __registerForAccountUpdates(*(void **)(a1 + 40), 0);
    __notifyDelegateAccountRemoved(*(void **)(a1 + 40), v9);
  }
}

- (id)deviceForIDSIdentifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self;
  uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    id v24 = v5;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = [v10 devices];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          uint64_t v23 = v7;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              uint64_t v17 = [v16 idsIdentifier];
              if ([v17 isEqual:v4])
              {

LABEL_20:
                id v20 = v16;

                id v5 = v24;
                goto LABEL_21;
              }
              uint64_t v18 = [v16 sharedUserIDSIdentifier];
              char v19 = [v18 isEqual:v4];

              if (v19) {
                goto LABEL_20;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            uint64_t v7 = v23;
            id v5 = v24;
            uint64_t v8 = v22;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v20 = 0;
    }
    while (v7);
  }
  else
  {
    id v20 = 0;
  }
LABEL_21:

  return v20;
}

- (id)deviceForPushToken:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v5 = self;
  uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v36;
    long long v26 = v5;
    uint64_t v23 = *(void *)v36;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * v8);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
          uint64_t v25 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              id v16 = objc_msgSend(v15, "globalHandles", v23);
              uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v28;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v28 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    if ([*(id *)(*((void *)&v27 + 1) + 8 * j) matchesPushToken:v4])
                    {
                      id v21 = v15;

                      id v5 = v26;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v39 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v13 = v25;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v40 count:16];
            id v5 = v26;
            uint64_t v7 = v23;
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v24);
      uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v35 objects:v41 count:16];
      id v21 = 0;
    }
    while (v6);
  }
  else
  {
    id v21 = 0;
  }
LABEL_26:

  return v21;
}

- (id)deviceForDevice:(id)a3 exists:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __deviceForDevice(self, v6);
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = v7;
    }
    if (v8 && a4)
    {
      *a4 = 1;
      id v10 = (void *)v8;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)deviceForDevice:(id)a3
{
  return [(HMDAccountRegistry *)self deviceForDevice:a3 exists:0];
}

- (BOOL)deviceExistsForDevice:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = __deviceForDevice(self, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)deviceForHandle:(id)a3 exists:(BOOL *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __deviceForHandle(self, v6);
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = 1;
      }
      id v10 = v8;
    }
    else
    {
      id v11 = [HMDDevice alloc];
      uint64_t v12 = [v7 identifier];
      v15[0] = v7;
      uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      id v10 = [(HMDDevice *)v11 initWithIdentifier:v12 handles:v13 name:0 productInfo:0 version:0 capabilities:0];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)deviceForHandle:(id)a3
{
  return [(HMDAccountRegistry *)self deviceForHandle:a3 exists:0];
}

- (id)deviceForAddress:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_18;
  }
  id v6 = [v4 idsIdentifier];
  uint64_t v7 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v6];

  uint64_t v8 = __deviceForHandle(self, v7);
  if (!v8)
  {
    id v11 = [v5 idsDestination];
    uint64_t v12 = +[HMDDeviceHandle deviceHandleForDestination:v11];

    __deviceForHandle(self, v12);
    uint64_t v13 = (HMDDevice *)objc_claimAutoreleasedReturnValue();
    id v9 = v13;
    if (!v13)
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        int v28 = 138543618;
        long long v29 = v25;
        __int16 v30 = 2112;
        uint64_t v31 = (uint64_t)v5;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Synthesizing HMDDevice for %@", (uint8_t *)&v28, 0x16u);
      }
      long long v26 = [[HMDDevice alloc] initWithDeviceAddress:v5];
      goto LABEL_16;
    }
    uint64_t v14 = [(HMDDevice *)v13 idsIdentifier];

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    uint64_t v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = HMFGetLogIdentifier();
        id v20 = [(HMDDevice *)v9 idsIdentifier];
        id v21 = [v5 idsIdentifier];
        int v28 = 138544386;
        long long v29 = v19;
        __int16 v30 = 2160;
        uint64_t v31 = 1752392040;
        __int16 v32 = 2112;
        long long v33 = v20;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2112;
        long long v37 = v21;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_FAULT, "%{public}@IDS identifier mismatch %{mask.hash}@ != %{mask.hash}@", (uint8_t *)&v28, 0x34u);

LABEL_14:
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      int v28 = 138543874;
      long long v29 = v19;
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v7;
      __int16 v32 = 2112;
      long long v33 = v9;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Adding local handle %@ to %@", (uint8_t *)&v28, 0x20u);
      goto LABEL_14;
    }

    [(HMDDevice *)v9 addHandle:v7];
    long long v26 = v9;
LABEL_16:
    id v10 = v26;

    goto LABEL_17;
  }
  id v9 = v8;
  id v10 = v9;
LABEL_17:

LABEL_18:
  return v10;
}

- (id)deviceForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self;
    uint64_t v6 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "deviceForIdentifier:", v4, (void)v13);
          if (v10)
          {
            id v11 = (void *)v10;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [(HMDAccountRegistry *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)existingAccountWithMergeIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(HMDAccountRegistry *)self accounts];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v10 = [v9 senderCorrelationIdentifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)accountForHandle:(id)a3 exists:(BOOL *)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  if (v6)
  {
    uint64_t v8 = __accountForHandle(self, v6);
    id v9 = v8;
    if (v8)
    {
      if (a4) {
        *a4 = 1;
      }
      uint64_t v10 = v8;
    }
    else
    {
      char v11 = [HMDAccount alloc];
      uint64_t v12 = +[HMDAccountIdentifier accountIdentifierForAccountHandle:v7];
      v15[0] = v7;
      long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
      uint64_t v10 = [(HMDAccount *)v11 initWithIdentifier:v12 handles:v13 devices:MEMORY[0x263EFFA68]];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)accountForHandle:(id)a3
{
  return [(HMDAccountRegistry *)self accountForHandle:a3 exists:0];
}

- (BOOL)accountExistsForHandle:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = __accountForHandle(self, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSArray)accounts
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  BOOL v4 = [(HMDAccountRegistry *)self appleAccountManager];
  id v5 = [v4 account];

  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [(HMDAccountRegistry *)self remoteAccountManager];
  uint64_t v7 = [v6 accounts];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = (void *)[v3 copy];
  return (NSArray *)v8;
}

- (void)reset
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = [(HMDAccountRegistry *)v4 remoteAccountManager];
  [v7 reset];
}

- (void)stop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v9, 0xCu);
  }
  __registerForAccountUpdates(v4, 0);
  uint64_t v7 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 willChangeValueForKey:v7];

  os_unfair_lock_lock_with_options();
  v4->_started = 0;
  os_unfair_lock_unlock(&v4->_lock);
  int v8 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 didChangeValueForKey:v8];
}

- (void)start
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v20 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);
  }
  [(HMDAccountRegistry *)v4 registerForDatabaseChanges];
  uint64_t v7 = [(HMDAccountRegistry *)v4 appleAccountManager];
  int v8 = [v7 account];
  if (v8)
  {
    __registerForAccountUpdates(v4, v8);
    int v9 = [(HMDAccountRegistry *)v4 clientQueue];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    long long v15 = __27__HMDAccountRegistry_start__block_invoke;
    long long v16 = &unk_264A2F820;
    uint64_t v17 = v4;
    id v18 = v8;
    dispatch_async(v9, &v13);
  }
  objc_msgSend(v7, "start", v13, v14, v15, v16, v17);
  uint64_t v10 = [(HMDAccountRegistry *)v4 remoteAccountManager];
  [v10 start];

  uint64_t v11 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 willChangeValueForKey:v11];

  os_unfair_lock_lock_with_options();
  v4->_started = 1;
  os_unfair_lock_unlock(&v4->_lock);
  uint64_t v12 = NSStringFromSelector(sel_started);
  [(HMDAccountRegistry *)v4 didChangeValueForKey:v12];
}

void __27__HMDAccountRegistry_start__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  __cleanupRemoteAccountsRelatedToAccount(*(void **)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 40) devices];
  id v3 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", 2 * objc_msgSend(v2, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "handles", (void)v10);
        [v3 addObjectsFromArray:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  __cleanupRemoteDevicesWithHandles(*(void **)(a1 + 32), v3);
}

- (BOOL)started
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDAccountRegistry *)self accounts];
  uint64_t v5 = (void *)[v3 initWithName:@"AC" value:v4];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccountRegistry;
  long long v10 = [(HMCContextProvider *)&v21 initWithContext:a5];
  long long v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    HMDispatchQueueNameString();
    id v12 = objc_claimAutoreleasedReturnValue();
    long long v13 = (const char *)[v12 UTF8String];
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    clientQueue = v11->_clientQueue;
    v11->_clientQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v11->_appleAccountManager, v8);
    objc_storeWeak((id *)&v11->_remoteAccountManager, v9);
    uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v11 selector:sel___handleAppleAccountUpdate_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v8];

    id v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v11 selector:sel___handleAddedRemoteAccount_ name:@"HMDRemoteAccountManagerAddedAccountNotification" object:v9];

    uint64_t v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v11 selector:sel___handleRemovedRemoteAccount_ name:@"HMDRemoteAccountManagerRemovedAccountNotification" object:v9];

    [v8 configureWithAccountRegistry:v11];
    [v9 configureWithAccountRegistry:v11];
  }

  return v11;
}

- (HMDAccountRegistry)initWithAppleAccountManager:(id)a3 remoteAccountManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDMainDriver driver];
  id v9 = [v8 coreData];
  long long v10 = [v9 contextWithRootPartition];
  long long v11 = [(HMDAccountRegistry *)self initWithAppleAccountManager:v7 remoteAccountManager:v6 context:v10];

  return v11;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_started);
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___HMDAccountRegistry;
    unsigned __int8 v7 = objc_msgSendSuper2(&v9, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v7;
}

@end