@interface HMDAppleMediaAccessorySensorManagerDataStore
- (HMDAppleMediaAccessorySensorManagerDataStore)initWithLocalMOC:(id)a3;
- (id)currentSensorPairingWithMOC:(uint64_t)a3 error:;
- (void)fetchSensorUUIDWithCompletion:(id)a3;
- (void)saveSensorUUID:(id)a3;
- (void)saveSensorUUID:(id)a3 completion:(id)a4;
@end

@implementation HMDAppleMediaAccessorySensorManagerDataStore

- (void).cxx_destruct
{
}

- (void)fetchSensorUUIDWithCompletion:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 8, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__HMDAppleMediaAccessorySensorManagerDataStore_fetchSensorUUIDWithCompletion___block_invoke;
  v10[3] = &unk_264A2EE80;
  v10[4] = self;
  id v11 = v7;
  id v12 = v5;
  id v8 = v5;
  id v9 = v7;
  [v9 performBlock:v10];
}

void __78__HMDAppleMediaAccessorySensorManagerDataStore_fetchSensorUUIDWithCompletion___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  id v8 = 0;
  v4 = -[HMDAppleMediaAccessorySensorManagerDataStore currentSensorPairingWithMOC:error:](v2, v3, (uint64_t)&v8);
  id v5 = v8;
  uint64_t v6 = a1[6];
  id v7 = [v4 pairedSensorUUID];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

- (id)currentSensorPairingWithMOC:(uint64_t)a3 error:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "hmd_assertIsExecuting");
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__18629;
    v16 = __Block_byref_object_dispose__18630;
    id v17 = 0;
    id v7 = +[MKFLocalAppleMediaSensorPairing fetchRequest];
    id v8 = [v6 executeFetchRequest:v7 error:a3];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__HMDAppleMediaAccessorySensorManagerDataStore_currentSensorPairingWithMOC_error___block_invoke;
    v11[3] = &unk_264A17680;
    v11[4] = &v12;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);
    id v9 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __82__HMDAppleMediaAccessorySensorManagerDataStore_currentSensorPairingWithMOC_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v4 = [v7 entity];
  id v5 = +[MKFLocalAppleMediaSensorPairing entity];
  int v6 = [v4 isKindOfEntity:v5];

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

- (void)saveSensorUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 8, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__HMDAppleMediaAccessorySensorManagerDataStore_saveSensorUUID_completion___block_invoke;
  v14[3] = &unk_264A2EE30;
  v14[4] = self;
  id v15 = v10;
  id v16 = v6;
  id v17 = v8;
  id v11 = v6;
  id v12 = v8;
  id v13 = v10;
  [v13 performBlock:v14];
}

void __74__HMDAppleMediaAccessorySensorManagerDataStore_saveSensorUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  v3 = (void *)a1[5];
  id v33 = 0;
  v4 = -[HMDAppleMediaAccessorySensorManagerDataStore currentSensorPairingWithMOC:error:](v2, v3, (uint64_t)&v33);
  id v5 = v33;
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = (id)a1[4];
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch the current the local sensor pairing with error: %@", buf, 0x16u);
    }
    uint64_t v11 = a1[7];
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    }
    goto LABEL_23;
  }
  if (!v4)
  {
    id v12 = (void *)MEMORY[0x263EFF240];
    id v13 = +[MKFLocalAppleMediaSensorPairing entity];
    uint64_t v14 = [v13 name];
    v4 = [v12 insertNewObjectForEntityForName:v14 inManagedObjectContext:a1[5]];

    id v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = (id)a1[4];
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v18;
      __int16 v36 = 2112;
      id v37 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Created new sensor pairing local model: %@", buf, 0x16u);
    }
  }
  [v4 setPairedSensorUUID:a1[6]];
  v19 = (void *)a1[5];
  id v32 = 0;
  int v20 = [v19 save:&v32];
  id v6 = v32;
  v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = (id)a1[4];
  v23 = HMFGetOSLogHandle();
  v24 = v23;
  if (v20 && !v6)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v25 = HMFGetLogIdentifier();
      v26 = (void *)a1[6];
      *(_DWORD *)buf = 138543618;
      v35 = v25;
      __int16 v36 = 2112;
      id v37 = v26;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Saved local pairedSensorUUID: %@", buf, 0x16u);
    }
    uint64_t v27 = a1[7];
    if (v27) {
      (*(void (**)(uint64_t, void))(v27 + 16))(v27, 0);
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v28 = HMFGetLogIdentifier();
    v29 = (void *)a1[6];
    *(_DWORD *)buf = 138543618;
    v35 = v28;
    __int16 v36 = 2112;
    id v37 = v29;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to update the local pairedSensorUUID to %@", buf, 0x16u);
  }
  uint64_t v30 = a1[7];
  if (v30)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, v6);
      goto LABEL_23;
    }
    v31 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    (*(void (**)(uint64_t, void *))(v30 + 16))(v30, v31);

LABEL_22:
    id v6 = 0;
  }
LABEL_23:
}

- (void)saveSensorUUID:(id)a3
{
}

- (HMDAppleMediaAccessorySensorManagerDataStore)initWithLocalMOC:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessorySensorManagerDataStore;
  id v6 = [(HMDAppleMediaAccessorySensorManagerDataStore *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_localMOC, a3);
  }

  return v7;
}

@end