@interface HMDCameraProfileSettingsCoreDataAdapter
+ (id)logCategory;
- (HMDCameraProfileSettingsCoreDataAdapter)initWithHAPAccessory:(id)a3 cameraProfileSettingsModelID:(id)a4 derivedPropertiesModelID:(id)a5;
- (NSUUID)cameraProfileSettingsModelID;
- (NSUUID)derivedPropertiesModelID;
- (NSUUID)hapAccessoryUUID;
- (NSUUID)homeUUID;
- (id)fetchCameraProfileSettingsModelWithError:(id *)a3;
- (id)fetchDerivedPropertiesModelWithError:(id *)a3;
- (id)logIdentifier;
- (void)updateCameraProfileSettingsModel:(id)a3 completion:(id)a4;
- (void)updateDerivedPropertiesModel:(id)a3 completion:(id)a4;
@end

@implementation HMDCameraProfileSettingsCoreDataAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivedPropertiesModelID, 0);
  objc_storeStrong((id *)&self->_cameraProfileSettingsModelID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_hapAccessoryUUID, 0);
}

- (NSUUID)derivedPropertiesModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)cameraProfileSettingsModelID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)hapAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDCameraProfileSettingsCoreDataAdapter *)self hapAccessoryUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)updateDerivedPropertiesModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDCoreData sharedInstance];
  v9 = [(HMDCameraProfileSettingsCoreDataAdapter *)self homeUUID];
  v10 = [v8 contextWithHomeUUID:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__HMDCameraProfileSettingsCoreDataAdapter_updateDerivedPropertiesModel_completion___block_invoke;
  v14[3] = &unk_264A2EE30;
  v14[4] = self;
  id v15 = v6;
  id v16 = v10;
  id v17 = v7;
  id v11 = v10;
  id v12 = v6;
  id v13 = v7;
  [v11 performBlock:v14];
}

void __83__HMDCameraProfileSettingsCoreDataAdapter_updateDerivedPropertiesModel_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) hapAccessoryUUID];
  v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (!v3)
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      v14 = [*(id *)(a1 + 32) hapAccessoryUUID];
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    goto LABEL_19;
  }
  int v4 = [*(id *)(a1 + 40) hmbPropertyWasSet:@"currentAccessModeField"];
  char v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "currentAccessMode"));
    [v3 setCameraCurrentAccessMode:v6];
  }
  char v7 = [*(id *)(a1 + 40) hmbPropertyWasSet:@"currentAccessModeChangeDate"];
  v8 = *(void **)(a1 + 40);
  if (v7)
  {
    v9 = [v8 currentAccessModeChangeDate];
    [v3 setCameraCurrentAccessModeChangeDate:v9];

    if (![*(id *)(a1 + 40) hmbPropertyWasSet:@"currentAccessModeChangeReasonField"])
    {
LABEL_12:
      id v17 = *(void **)(a1 + 48);
      id v34 = 0;
      char v18 = [v17 save:&v34];
      id v15 = v34;
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      v21 = HMFGetOSLogHandle();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v36 = v23;
          v24 = "%{public}@Successfully updated Core Data with derived properties model";
          v25 = v22;
          os_log_type_t v26 = OS_LOG_TYPE_INFO;
          uint32_t v27 = 12;
LABEL_17:
          _os_log_impl(&dword_22F52A000, v25, v26, v24, buf, v27);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        __int16 v37 = 2112;
        id v38 = v15;
        v24 = "%{public}@Failed to update Core Data with derived properties model, error: %@";
        v25 = v22;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        uint32_t v27 = 22;
        goto LABEL_17;
      }

LABEL_19:
      uint64_t v28 = *(void *)(a1 + 56);
      if (v28) {
        (*(void (**)(uint64_t, id))(v28 + 16))(v28, v15);
      }

      goto LABEL_22;
    }
LABEL_11:
    id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "currentAccessModeChangeReason"));
    [v3 setCameraCurrentAccessModeChangeReason:v16];

    goto LABEL_12;
  }
  if ([v8 hmbPropertyWasSet:@"currentAccessModeChangeReasonField"]) {
    goto LABEL_11;
  }
  if (v5) {
    goto LABEL_12;
  }
  v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = *(id *)(a1 + 32);
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v32;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Not updating Core Data with derived properties model because nothing changed", buf, 0xCu);
  }
  uint64_t v33 = *(void *)(a1 + 56);
  if (v33) {
    (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
  }
LABEL_22:
}

- (void)updateCameraProfileSettingsModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDCoreData sharedInstance];
  v9 = [(HMDCameraProfileSettingsCoreDataAdapter *)self homeUUID];
  v10 = [v8 contextWithHomeUUID:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __87__HMDCameraProfileSettingsCoreDataAdapter_updateCameraProfileSettingsModel_completion___block_invoke;
  v14[3] = &unk_264A2EE30;
  v14[4] = self;
  id v15 = v6;
  id v16 = v10;
  id v17 = v7;
  id v11 = v10;
  id v12 = v6;
  id v13 = v7;
  [v11 performBlock:v14];
}

void __87__HMDCameraProfileSettingsCoreDataAdapter_updateCameraProfileSettingsModel_completion___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) hapAccessoryUUID];
  v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (!v3)
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 32);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      v14 = [*(id *)(a1 + 32) hapAccessoryUUID];
      *(_DWORD *)buf = 138543618;
      v36 = v13;
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", buf, 0x16u);
    }
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    goto LABEL_23;
  }
  int v4 = [*(id *)(a1 + 40) hmbPropertyWasSet:@"accessModeAtHomeField"];
  char v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "accessModeAtHome"));
    [v3 setCameraAccessModeAtHome:v6];
  }
  if ([*(id *)(a1 + 40) hmbPropertyWasSet:@"accessModeNotAtHomeField"])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "accessModeNotAtHome"));
    [v3 setCameraAccessModeNotAtHome:v7];

    char v5 = 1;
  }
  if ([*(id *)(a1 + 40) hmbPropertyWasSet:@"recordingEventTriggersField"])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "recordingEventTriggers"));
    [v3 setCameraRecordingEventTriggers:v8];

    char v5 = 1;
  }
  if ([*(id *)(a1 + 40) hmbPropertyWasSet:@"activityZonesIncludedForSignificantEventDetectionField"])
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "activityZonesIncludedForSignificantEventDetection"));
    [v3 setCameraActivityZonesIncludedForSignificantEventDetection:v9];

    if (![*(id *)(a1 + 40) hmbPropertyWasSet:@"activityZonesField"])
    {
LABEL_16:
      id v17 = *(void **)(a1 + 48);
      id v34 = 0;
      char v18 = [v17 save:&v34];
      id v15 = v34;
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = *(id *)(a1 + 32);
      v21 = HMFGetOSLogHandle();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v23 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v36 = v23;
          v24 = "%{public}@Successfully updated Core Data with settings model";
          v25 = v22;
          os_log_type_t v26 = OS_LOG_TYPE_INFO;
          uint32_t v27 = 12;
LABEL_21:
          _os_log_impl(&dword_22F52A000, v25, v26, v24, buf, v27);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        __int16 v37 = 2112;
        id v38 = v15;
        v24 = "%{public}@Failed to update Core Data with settings model, error: %@";
        v25 = v22;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        uint32_t v27 = 22;
        goto LABEL_21;
      }

LABEL_23:
      uint64_t v28 = *(void *)(a1 + 56);
      if (v28) {
        (*(void (**)(uint64_t, id))(v28 + 16))(v28, v15);
      }

      goto LABEL_26;
    }
LABEL_15:
    id v16 = [*(id *)(a1 + 40) activityZones];
    [v3 setCameraActivityZones:v16];

    goto LABEL_16;
  }
  if ([*(id *)(a1 + 40) hmbPropertyWasSet:@"activityZonesField"]) {
    goto LABEL_15;
  }
  if (v5) {
    goto LABEL_16;
  }
  v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = *(id *)(a1 + 32);
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v32;
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Not updating Core Data with settings model because nothing changed", buf, 0xCu);
  }
  uint64_t v33 = *(void *)(a1 + 56);
  if (v33) {
    (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
  }
LABEL_26:
}

- (id)fetchDerivedPropertiesModelWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__220325;
  v22 = __Block_byref_object_dispose__220326;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__220325;
  id v16 = __Block_byref_object_dispose__220326;
  id v17 = 0;
  char v5 = +[HMDCoreData sharedInstance];
  id v6 = [(HMDCameraProfileSettingsCoreDataAdapter *)self homeUUID];
  id v7 = [v5 contextWithHomeUUID:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__HMDCameraProfileSettingsCoreDataAdapter_fetchDerivedPropertiesModelWithError___block_invoke;
  v11[3] = &unk_264A28028;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  [v7 unsafeSynchronousBlock:v11];
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __80__HMDCameraProfileSettingsCoreDataAdapter_fetchDerivedPropertiesModelWithError___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) hapAccessoryUUID];
  v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (v3)
  {
    int v4 = [v3 cameraCurrentAccessMode];
    if (v4
      || ([v3 cameraCurrentAccessModeChangeReason],
          (int v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      char v5 = [HMDCameraProfileSettingsDerivedPropertiesModel alloc];
      id v6 = [*(id *)(a1 + 32) derivedPropertiesModelID];
      id v7 = [*(id *)(a1 + 32) hapAccessoryUUID];
      uint64_t v8 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v7];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v11 = [v3 cameraCurrentAccessMode];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setCurrentAccessMode:", objc_msgSend(v11, "unsignedIntegerValue"));

      uint64_t v12 = [v3 cameraCurrentAccessModeChangeReason];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setCurrentAccessModeChangeReason:", objc_msgSend(v12, "unsignedIntegerValue"));

      id v13 = [v3 cameraCurrentAccessModeChangeDate];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCurrentAccessModeChangeDate:v13];

      goto LABEL_9;
    }
    v22 = [v3 cameraCurrentAccessModeChangeDate];

    if (v22) {
      goto LABEL_5;
    }
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 32);
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      os_log_type_t v26 = HMFGetLogIdentifier();
      int v27 = 138543362;
      uint64_t v28 = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Derived properties do not exist yet on accessory", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 32);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = [*(id *)(a1 + 32) hapAccessoryUUID];
      int v27 = 138543618;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Did not find the accessory with model id: %@", (uint8_t *)&v27, 0x16u);
    }
    uint64_t v19 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_9:
}

- (id)fetchCameraProfileSettingsModelWithError:(id *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__220325;
  v22 = __Block_byref_object_dispose__220326;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__220325;
  id v16 = __Block_byref_object_dispose__220326;
  id v17 = 0;
  char v5 = +[HMDCoreData sharedInstance];
  id v6 = [(HMDCameraProfileSettingsCoreDataAdapter *)self homeUUID];
  id v7 = [v5 contextWithHomeUUID:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__HMDCameraProfileSettingsCoreDataAdapter_fetchCameraProfileSettingsModelWithError___block_invoke;
  v11[3] = &unk_264A28028;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  [v7 unsafeSynchronousBlock:v11];
  if (a3)
  {
    uint64_t v8 = (void *)v13[5];
    if (v8) {
      *a3 = v8;
    }
  }
  id v9 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __84__HMDCameraProfileSettingsCoreDataAdapter_fetchCameraProfileSettingsModelWithError___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) hapAccessoryUUID];
  v3 = +[HMCContext findHAPAccessoryWithModelID:v2];

  if (v3)
  {
    int v4 = [v3 cameraAccessModeAtHome];
    if (v4)
    {

LABEL_8:
      uint64_t v14 = [HMDCameraProfileSettingsModel alloc];
      id v15 = [*(id *)(a1 + 32) cameraProfileSettingsModelID];
      id v16 = [*(id *)(a1 + 32) hapAccessoryUUID];
      uint64_t v17 = [(HMBModel *)v14 initWithModelID:v15 parentModelID:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setVersion:1];
      uint64_t v20 = [v3 cameraAccessModeAtHome];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAccessModeAtHome:", objc_msgSend(v20, "unsignedIntegerValue"));

      v21 = [v3 cameraAccessModeNotAtHome];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setAccessModeNotAtHome:", objc_msgSend(v21, "unsignedIntegerValue"));

      v22 = [v3 cameraRecordingEventTriggers];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setRecordingEventTriggers:", objc_msgSend(v22, "unsignedIntegerValue"));

      id v23 = [v3 cameraActivityZonesIncludedForSignificantEventDetection];
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setActivityZonesIncludedForSignificantEventDetection:", objc_msgSend(v23, "BOOLValue"));

      id v24 = [v3 cameraActivityZones];
      v25 = v24;
      if (!v24)
      {
        v25 = [MEMORY[0x263EFFA08] set];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActivityZones:v25];
      if (!v24) {

      }
      goto LABEL_13;
    }
    id v13 = [v3 cameraAccessModeNotAtHome];

    if (v13) {
      goto LABEL_8;
    }
    os_log_type_t v26 = (void *)MEMORY[0x230FBD990]();
    id v27 = *(id *)(a1 + 32);
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      __int16 v29 = HMFGetLogIdentifier();
      int v30 = 138543362;
      uint64_t v31 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings do not exist yet on accessory", (uint8_t *)&v30, 0xCu);
    }
  }
  else
  {
    char v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [*(id *)(a1 + 32) hapAccessoryUUID];
      int v30 = 138543618;
      uint64_t v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Did not find the HAP accessory with model id: %@", (uint8_t *)&v30, 0x16u);
    }
    uint64_t v10 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_13:
}

- (HMDCameraProfileSettingsCoreDataAdapter)initWithHAPAccessory:(id)a3 cameraProfileSettingsModelID:(id)a4 derivedPropertiesModelID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDCameraProfileSettingsCoreDataAdapter;
  uint64_t v11 = [(HMDCameraProfileSettingsCoreDataAdapter *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 uuid];
    hapAccessoryUUID = v11->_hapAccessoryUUID;
    v11->_hapAccessoryUUID = (NSUUID *)v12;

    uint64_t v14 = [v8 home];
    uint64_t v15 = [v14 uuid];
    homeUUID = v11->_homeUUID;
    v11->_homeUUID = (NSUUID *)v15;

    objc_storeStrong((id *)&v11->_cameraProfileSettingsModelID, a4);
    objc_storeStrong((id *)&v11->_derivedPropertiesModelID, a5);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t14_220341 != -1) {
    dispatch_once(&logCategory__hmf_once_t14_220341, &__block_literal_global_220342);
  }
  v2 = (void *)logCategory__hmf_once_v15_220343;
  return v2;
}

void __54__HMDCameraProfileSettingsCoreDataAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v15_220343;
  logCategory__hmf_once_v15_220343 = v0;
}

@end