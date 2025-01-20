@interface HMDSiriEndpointSettingsSyncManager
+ (NSArray)siriEndPointHomeKitBackedKeyPaths;
+ (id)logCategory;
- (HMDSiriEndpointSettingsSyncManager)initWithDataSource:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6;
- (HMDSiriEndpointSettingsSyncManagerDataSource)dataSource;
- (HMESubscriptionProviding)subscriptionProvider;
- (NSMutableSet)homeUUIDsManagedByCurrentDevice;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)readValueValueForAccessoryUUID:(id)a3 homeUUID:(id)a4 forKeyPath:(id)a5;
- (int64_t)siriEndpointCertificationReasonForAccessoryUUID:(id)a3 homeUUID:(id)a4 error:(id *)a5;
- (void)_beginManagingAccessory:(id)a3 forHome:(id)a4;
- (void)_beginManagingHome:(id)a3;
- (void)_matchingHomeforUUID:(id)a3 accessoryUUID:(id)a4 home:(id *)a5 accessory:(id *)a6;
- (void)_stopManagingAccessory:(id)a3 forHome:(id)a4;
- (void)_stopManagingHome:(id)a3;
- (void)_synchronizeSettingsForAccessoryUUID:(id)a3 homeUUID:(id)a4;
- (void)_updateManagedHomes;
- (void)_writeSetting:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5;
- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5;
- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5 completionHandler:(id)a6;
- (void)configure;
- (void)didReceiveEvent:(id)a3 topic:(id)a4;
- (void)handleAccessoryIsReachableNotification:(id)a3;
- (void)handleCompositeSettingsControllerDidConfigureNotification:(id)a3;
- (void)handleHAPMediaProfileAddedNotification:(id)a3;
- (void)handleHomeAddedNotification:(id)a3;
- (void)handleHomeRemovedNotification:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleSiriEndPointAddedNotification:(id)a3;
- (void)registerForAccessoryNotificationsOnHapAccessory:(id)a3;
- (void)unregisterFromAccessoryNotificationsOnHapAccessory:(id)a3;
- (void)writeSettingValue:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 forKeyPath:(id)a6 completionHandler:(id)a7;
@end

@implementation HMDSiriEndpointSettingsSyncManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_homeUUIDsManagedByCurrentDevice, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableSet)homeUUIDsManagedByCurrentDevice
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 24, 1);
}

- (HMDSiriEndpointSettingsSyncManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDSiriEndpointSettingsSyncManagerDataSource *)WeakRetained;
}

- (int64_t)siriEndpointCertificationReasonForAccessoryUUID:(id)a3 homeUUID:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v19 = 0;
  id v20 = 0;
  [(HMDSiriEndpointSettingsSyncManager *)self _matchingHomeforUUID:v9 accessoryUUID:v8 home:&v20 accessory:&v19];
  id v10 = v20;
  id v11 = v19;
  v12 = v11;
  if (v11)
  {
    int64_t v13 = [v11 computeSiriEndpointCertification];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);
    }
    if (a5)
    {
      [MEMORY[0x263F087E8] hmErrorWithCode:3];
      int64_t v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int64_t v13 = 0;
    }
  }

  return v13;
}

- (id)readValueValueForAccessoryUUID:(id)a3 homeUUID:(id)a4 forKeyPath:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v32 = v14;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Writing endpoint settings for accessoryUUID: %@, homeUUID: %@, keyPath: %@", buf, 0x2Au);
  }
  id v29 = 0;
  id v30 = 0;
  [(HMDSiriEndpointSettingsSyncManager *)v12 _matchingHomeforUUID:v9 accessoryUUID:v8 home:&v30 accessory:&v29];
  id v15 = v30;
  id v16 = v29;
  if (!v16)
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v12;
    v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v23 = "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings";
    id v24 = v21;
    uint32_t v25 = 32;
LABEL_17:
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);

    goto LABEL_18;
  }
  if ([v10 isEqualToString:@"root.siri.allowHeySiri"])
  {
    v17 = [v16 siriEndpointProfile];
    uint64_t v18 = [v17 siriListening];

    if (v18 == -1)
    {
      id v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = v12;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
LABEL_12:
    uint64_t v27 = (void *)[objc_alloc(MEMORY[0x263F0E728]) initWithBoolValue:v18 == 1];
    goto LABEL_19;
  }
  if (![v10 isEqualToString:@"root.siri.tapToAccess"])
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v12;
    v21 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v23 = "%{public}@Invalid or unrecongnized keyPath: %@";
    id v24 = v21;
    uint32_t v25 = 22;
    goto LABEL_17;
  }
  id v26 = [v16 siriEndpointProfile];
  uint64_t v18 = [v26 siriTouchToUse];

  if (v18 != -1) {
    goto LABEL_12;
  }
  id v19 = (void *)MEMORY[0x230FBD990]();
  id v20 = v12;
  v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
LABEL_16:
    v22 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v32 = v22;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v10;
    __int16 v23 = "%{public}@Unknown value for home:%@, accessory:%@, keyPath:%@";
    id v24 = v21;
    uint32_t v25 = 42;
    goto LABEL_17;
  }
LABEL_18:

  uint64_t v27 = 0;
LABEL_19:

  return v27;
}

- (void)_matchingHomeforUUID:(id)a3 accessoryUUID:(id)a4 home:(id *)a5 accessory:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [(HMDSiriEndpointSettingsSyncManager *)self dataSource];
  int64_t v13 = v12;
  if (a5)
  {
    v14 = [v12 homesForSiriEndpointSettingsSyncManager:self];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke;
    v28[3] = &unk_264A2B2D0;
    id v29 = v10;
    id v15 = objc_msgSend(v14, "na_firstObjectPassingTest:", v28);

    if (a6)
    {
      id v16 = v15;
      *a5 = v16;
      v17 = [v16 hapAccessories];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke_76;
      v26[3] = &unk_264A28A10;
      id v27 = v11;
      objc_msgSend(v17, "na_firstObjectPassingTest:", v26);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      __int16 v23 = self;
      id v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint32_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v31 = v25;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Nil out hap accessory passed", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v31 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil out parameter home passed", buf, 0xCu);
    }
  }
}

uint64_t __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __88__HMDSiriEndpointSettingsSyncManager__matchingHomeforUUID_accessoryUUID_home_accessory___block_invoke_76(uint64_t a1, void *a2)
{
  v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

- (void)writeSettingValue:(id)a3 accessoryUUID:(id)a4 homeUUID:(id)a5 forKeyPath:(id)a6 completionHandler:(id)a7
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (void *)MEMORY[0x230FBD990]();
  uint64_t v18 = self;
  id v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544386;
    id v38 = v20;
    __int16 v39 = 2112;
    id v40 = v13;
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v15;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Writing endpoint settings for accessoryUUID: %@, homeUUID: %@, settingValue: %@, keyPath: %@", buf, 0x34u);
  }
  id v35 = 0;
  id v36 = 0;
  [(HMDSiriEndpointSettingsSyncManager *)v18 _matchingHomeforUUID:v14 accessoryUUID:v13 home:&v36 accessory:&v35];
  id v21 = v36;
  id v22 = v35;
  if (v22)
  {
    __int16 v23 = [(HMDSiriEndpointSettingsSyncManager *)v18 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __108__HMDSiriEndpointSettingsSyncManager_writeSettingValue_accessoryUUID_homeUUID_forKeyPath_completionHandler___block_invoke;
    block[3] = &unk_264A2DDC0;
    block[4] = v18;
    id v31 = v12;
    id v32 = v22;
    id v33 = v15;
    id v34 = v16;
    dispatch_async(v23, block);
  }
  else
  {
    id v24 = (void *)MEMORY[0x230FBD990]();
    uint32_t v25 = v18;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v27 = v29 = v24;
      *(_DWORD *)buf = 138543874;
      id v38 = v27;
      __int16 v39 = 2112;
      id v40 = v21;
      __int16 v41 = 2112;
      id v42 = v13;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);

      id v24 = v29;
    }

    if (v16)
    {
      v28 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      (*((void (**)(id, void *))v16 + 2))(v16, v28);
    }
  }
}

uint64_t __108__HMDSiriEndpointSettingsSyncManager_writeSettingValue_accessoryUUID_homeUUID_forKeyPath_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeSettingValue:*(void *)(a1 + 40) toAccessory:*(void *)(a1 + 48) forKeyPath:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5 completionHandler:(id)a6
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v18;
    __int16 v98 = 2112;
    id v99 = v10;
    __int16 v100 = 2112;
    id v101 = v11;
    __int16 v102 = 2112;
    id v103 = v12;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Writing setting value: %@ to siri endpoint accessory: %@ for keypath: %@", buf, 0x2Au);
  }
  if ([v12 isEqualToString:@"root.siri.allowHeySiri"])
  {
    id v19 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    id v21 = v20;

    if (v21)
    {
      uint64_t v22 = [v21 BOOLValue];
      __int16 v23 = [v11 siriEndpointProfile];
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke;
      v92[3] = &unk_264A2F6E8;
      v92[4] = v16;
      id v93 = v11;
      id v24 = v21;
      id v94 = v24;
      id v95 = v13;
      [v23 setListening:v22 completionHandler:v92];

      uint32_t v25 = v93;
LABEL_29:

LABEL_70:
      goto LABEL_71;
    }
    id v36 = (void *)MEMORY[0x230FBD990]();
    __int16 v37 = v16;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    __int16 v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    __int16 v98 = 2112;
    id v99 = v19;
    __int16 v100 = 2112;
    id v101 = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    id v40 = "%{public}@heySiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if ([v12 isEqualToString:@"root.siri.tapToAccess"])
  {
    id v26 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v28 = v27;

    if (v28)
    {
      uint64_t v29 = [v28 BOOLValue];
      id v30 = [v11 siriEndpointProfile];
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_70;
      v88[3] = &unk_264A2F6E8;
      v88[4] = v16;
      id v89 = v11;
      id v24 = v28;
      id v90 = v24;
      id v91 = v13;
      [v30 setTouchToUse:v29 completionHandler:v88];

      uint32_t v25 = v89;
      goto LABEL_29;
    }
    id v36 = (void *)MEMORY[0x230FBD990]();
    __int16 v37 = v16;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    __int16 v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    __int16 v98 = 2112;
    id v99 = v26;
    __int16 v100 = 2112;
    id v101 = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    id v40 = "%{public}@tapToAccessSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if ([v12 isEqualToString:@"root.siri.lightWhenUsingSiri"])
  {
    id v31 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v32 = v31;
    }
    else {
      id v32 = 0;
    }
    id v33 = v32;

    if (v33)
    {
      uint64_t v34 = [v33 BOOLValue];
      id v35 = [v11 siriEndpointProfile];
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_71;
      v84[3] = &unk_264A2F6E8;
      v84[4] = v16;
      id v85 = v11;
      id v24 = v33;
      id v86 = v24;
      id v87 = v13;
      [v35 setLightOnUse:v34 completionHandler:v84];

      uint32_t v25 = v85;
      goto LABEL_29;
    }
    id v36 = (void *)MEMORY[0x230FBD990]();
    __int16 v37 = v16;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    __int16 v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    __int16 v98 = 2112;
    id v99 = v31;
    __int16 v100 = 2112;
    id v101 = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    id v40 = "%{public}@lightWhenUsingSiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if ([v12 isEqualToString:@"root.siri.soundAlert"])
  {
    id v41 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v42 = v41;
    }
    else {
      id v42 = 0;
    }
    id v43 = v42;

    if (v43)
    {
      uint64_t v44 = [v43 BOOLValue];
      __int16 v45 = [v11 siriEndpointProfile];
      v80[0] = MEMORY[0x263EF8330];
      v80[1] = 3221225472;
      v80[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_72;
      v80[3] = &unk_264A2F6E8;
      v80[4] = v16;
      id v81 = v11;
      id v24 = v43;
      id v82 = v24;
      id v83 = v13;
      [v45 setSoundOnUse:v44 completionHandler:v80];

      uint32_t v25 = v81;
      goto LABEL_29;
    }
    id v36 = (void *)MEMORY[0x230FBD990]();
    __int16 v37 = v16;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    __int16 v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    __int16 v98 = 2112;
    id v99 = v41;
    __int16 v100 = 2112;
    id v101 = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    id v40 = "%{public}@soundWhenUsingSiriSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
    goto LABEL_66;
  }
  if ([v12 isEqualToString:@"root.airPlay.airPlayEnabled"])
  {
    id v46 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v47 = v46;
    }
    else {
      uint64_t v47 = 0;
    }
    id v24 = v47;

    if (v24)
    {
      v48 = [v11 mediaProfile];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v49 = v48;
      }
      else {
        v49 = 0;
      }
      id v50 = v49;

      if (v50)
      {
        uint64_t v51 = [v24 BOOLValue];
        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_74;
        v76[3] = &unk_264A2F6E8;
        v76[4] = v16;
        id v77 = v11;
        id v78 = v24;
        id v79 = v13;
        [v50 setEnable:v51 completionHandler:v76];
      }
      else
      {
        v65 = (void *)MEMORY[0x230FBD990]();
        v66 = v16;
        v67 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = v71 = v65;
          *(_DWORD *)buf = 138544130;
          v97 = v68;
          __int16 v98 = 2112;
          id v99 = v46;
          __int16 v100 = 2112;
          id v101 = v12;
          __int16 v102 = 2112;
          id v103 = v11;
          _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize airplayEnabledSettingValue (%@) for keypath %@, accessory: %@, as accessory does not have a hapMediaProfile", buf, 0x2Au);

          v65 = v71;
        }

        id v50 = 0;
      }
    }
    else
    {
      v61 = (void *)MEMORY[0x230FBD990]();
      v62 = v16;
      v63 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = v70 = v61;
        *(_DWORD *)buf = 138544130;
        v97 = v64;
        __int16 v98 = 2112;
        id v99 = v46;
        __int16 v100 = 2112;
        id v101 = v12;
        __int16 v102 = 2112;
        id v103 = v11;
        _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@airplayEnabledSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type", buf, 0x2Au);

        v61 = v70;
      }

      if (!v13) {
        goto LABEL_69;
      }
      id v50 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      (*((void (**)(id, id))v13 + 2))(v13, v50);
    }

    goto LABEL_70;
  }
  if ([v12 isEqualToString:@"root.siri.siriEnabled"])
  {
    id v52 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v53 = v52;
    }
    else {
      v53 = 0;
    }
    id v54 = v53;

    if (v54)
    {
      uint64_t v55 = [v54 BOOLValue];
      v56 = [v11 siriEndpointProfile];
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_75;
      v72[3] = &unk_264A2F6E8;
      v72[4] = v16;
      id v73 = v11;
      id v24 = v54;
      id v74 = v24;
      id v75 = v13;
      [v56 setEnable:v55 completionHandler:v72];

      uint32_t v25 = v73;
      goto LABEL_29;
    }
    id v36 = (void *)MEMORY[0x230FBD990]();
    __int16 v37 = v16;
    id v38 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      goto LABEL_67;
    }
    __int16 v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v39;
    __int16 v98 = 2112;
    id v99 = v52;
    __int16 v100 = 2112;
    id v101 = v12;
    __int16 v102 = 2112;
    id v103 = v11;
    id v40 = "%{public}@siriEnabledSettingValue (%@) for keypath %@, accessory: %@, is not of BOOL setting type";
LABEL_66:
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, v40, buf, 0x2Au);

LABEL_67:
    if (v13)
    {
      v69 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
      (*((void (**)(id, void *))v13 + 2))(v13, v69);
    }
LABEL_69:
    id v24 = 0;
    goto LABEL_70;
  }
  v57 = (void *)MEMORY[0x230FBD990]();
  v58 = v16;
  v59 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    v60 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v97 = v60;
    __int16 v98 = 2112;
    id v99 = v12;
    __int16 v100 = 2112;
    id v101 = v10;
    __int16 v102 = 2112;
    id v103 = v11;
    _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_ERROR, "%{public}@Unknown keypath (%@) for homekit backed siri endpoint setting value (%@) accessory: %@", buf, 0x2Au);
  }
  if (v13)
  {
    id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:43];
    (*((void (**)(id, id))v13 + 2))(v13, v24);
    goto LABEL_70;
  }
LABEL_71:
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized hey siri enabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized tap to access on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized light on use on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized sound on use on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_74(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized airplayEnabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

void __98__HMDSiriEndpointSettingsSyncManager__writeSettingValue_toAccessory_forKeyPath_completionHandler___block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) BOOLValue];
    id v9 = HMFBooleanToString();
    id v10 = HMFBooleanToString();
    int v12 = 138544386;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronized siriEnabled on %@ to %@ with success: %@ (%@)", (uint8_t *)&v12, 0x34u);
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (void)_writeSettingValue:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5
{
}

- (void)_writeSetting:(id)a3 toAccessory:(id)a4 forKeyPath:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    __int16 v14 = objc_msgSend(objc_alloc(MEMORY[0x263F0E728]), "initWithBoolValue:", objc_msgSend(v13, "BOOLValue"));
    [(HMDSiriEndpointSettingsSyncManager *)self _writeSettingValue:v14 toAccessory:v9 forKeyPath:v10];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      __int16 v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type received.", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)_synchronizeSettingsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v37 = v12;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    id v41 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Synchronizing homekit backed siri endpoint settings for accessoryUUID: %@, homeUUID: %@", buf, 0x20u);
  }
  id v13 = [(HMDSiriEndpointSettingsSyncManager *)v10 dataSource];
  __int16 v14 = [v13 homesForSiriEndpointSettingsSyncManager:v10];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke;
  v34[3] = &unk_264A2B2D0;
  id v15 = v7;
  id v35 = v15;
  __int16 v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v34);

  v17 = [v16 hapAccessories];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_2;
  v32[3] = &unk_264A28A10;
  id v18 = v6;
  id v33 = v18;
  int v19 = objc_msgSend(v17, "na_firstObjectPassingTest:", v32);

  if (v19)
  {
    __int16 v20 = [v13 compositeSettingsControllerManagerForSiriEndpointSettingsSyncManager:v10];
    if (v20)
    {
      uint64_t v21 = +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_65;
      v30[3] = &unk_264A22798;
      v30[4] = v10;
      id v31 = v19;
      [v20 localFetchSettingsForUUID:v18 homeUUID:v15 withKeyPaths:v21 completion:v30];
    }
    else
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = v10;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        __int16 v37 = v29;
        __int16 v38 = 2112;
        id v39 = v16;
        __int16 v40 = 2112;
        id v41 = v18;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unable to data source settings manager to sync settings for home: %@, accessory: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    __int16 v23 = v10;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint32_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v37 = v25;
      __int16 v38 = 2112;
      id v39 = v16;
      __int16 v40 = 2112;
      id v41 = v18;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching accessory with UUID: %@ in home (%@) to sync settings", buf, 0x20u);
    }
  }
}

uint64_t __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

void __84__HMDSiriEndpointSettingsSyncManager__synchronizeSettingsForAccessoryUUID_homeUUID___block_invoke_65(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v54 = a3;
  id v53 = a4;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v56 objects:v70 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v55 = *(void *)v57;
    id v52 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v57 != v55) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
        id v13 = +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths];
        __int16 v14 = [v12 keyPath];
        char v15 = [v13 containsObject:v14];

        if ((v15 & 1) == 0)
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 32);
          int v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = HMFGetLogIdentifier();
            uint64_t v21 = [v12 keyPath];
            *(_DWORD *)buf = 138544130;
            v61 = v20;
            __int16 v62 = 2112;
            v63 = v21;
            __int16 v64 = 2112;
            id v65 = v54;
            __int16 v66 = 2112;
            id v67 = v53;
            __int16 v23 = v19;
            os_log_type_t v24 = OS_LOG_TYPE_INFO;
            uint32_t v25 = "%{public}@Did fetch settings value event for an unexpected keypath %@, uuid: %@, homeUUID: %@";
            uint32_t v26 = 42;
            goto LABEL_12;
          }
LABEL_14:

          goto LABEL_15;
        }
        __int16 v16 = [v12 error];

        if (v16)
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 32);
          int v19 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          __int16 v20 = HMFGetLogIdentifier();
          uint64_t v21 = [v12 keyPath];
          uint64_t v22 = [v12 error];
          *(_DWORD *)buf = 138544386;
          v61 = v20;
          __int16 v62 = 2112;
          v63 = v21;
          __int16 v64 = 2112;
          id v65 = v54;
          __int16 v66 = 2112;
          id v67 = v53;
          __int16 v68 = 2112;
          v69 = v22;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching settings value event for keypath %@, uuid: %@, homeUUID: %@ error: %@", buf, 0x34u);

          id v8 = v52;
LABEL_13:

          goto LABEL_14;
        }
        id v27 = [v12 setting];

        if (!v27)
        {
          v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 32);
          int v19 = HMFGetOSLogHandle();
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            goto LABEL_14;
          }
          __int16 v20 = HMFGetLogIdentifier();
          uint64_t v21 = [v12 keyPath];
          *(_DWORD *)buf = 138544386;
          v61 = v20;
          __int16 v62 = 2112;
          v63 = v21;
          __int16 v64 = 2112;
          id v65 = v54;
          __int16 v66 = 2112;
          id v67 = v53;
          __int16 v68 = 2112;
          v69 = v12;
          __int16 v23 = v19;
          os_log_type_t v24 = OS_LOG_TYPE_ERROR;
          uint32_t v25 = "%{public}@Error fetching settings value event for keypath %@, uuid: %@, homeUUID: %@ no setting returned in result: %@";
          uint32_t v26 = 52;
LABEL_12:
          _os_log_impl(&dword_22F52A000, v23, v24, v25, buf, v26);
          goto LABEL_13;
        }
        id v28 = [v12 setting];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v29 = v28;
        }
        else {
          uint64_t v29 = 0;
        }
        id v30 = v29;
        if (v30)
        {
          id v31 = objc_msgSend(objc_alloc(MEMORY[0x263F0E728]), "initWithBoolValue:", objc_msgSend(v30, "BOOLValue"));
        }
        else
        {
          id v32 = v28;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v33 = v32;
          }
          else {
            id v33 = 0;
          }
          id v34 = v33;

          if (v34)
          {
            id v35 = objc_alloc(MEMORY[0x263F0E748]);
            id v36 = [v34 stringValue];
            id v31 = (void *)[v35 initWithStringValue:v36];
          }
          else
          {
            id v37 = v32;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              __int16 v38 = v37;
            }
            else {
              __int16 v38 = 0;
            }
            id v36 = v38;

            if (v36)
            {
              id v39 = objc_alloc(MEMORY[0x263F0E738]);
              id v40 = [v36 numberValue];
              id v31 = objc_msgSend(v39, "initWithIntegerValue:", objc_msgSend(v40, "integerValue"));
            }
            else
            {
              id v41 = v37;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v42 = v41;
              }
              else {
                uint64_t v42 = 0;
              }
              id v40 = v42;

              if (v40)
              {
                id v49 = objc_alloc(MEMORY[0x263F0E740]);
                uint64_t v51 = [v40 inputLanguageCode];
                id v50 = [v40 outputVoiceLanguageCode];
                v48 = [v40 outputVoiceGenderCode];
                uint64_t v47 = [v40 voiceName];
                id v31 = (void *)[v49 initWithInputLanguageCode:v51 outputVoiceLanguageCode:v50 outputVoiceGenderCode:v48 voiceName:v47];
              }
              else
              {
                id v31 = 0;
              }
            }
          }
          id v8 = v52;
        }

        id v43 = *(void **)(a1 + 32);
        uint64_t v44 = *(void *)(a1 + 40);
        __int16 v45 = [v12 keyPath];
        [v43 _writeSettingValue:v31 toAccessory:v44 forKeyPath:v45];

LABEL_15:
        ++v11;
      }
      while (v10 != v11);
      uint64_t v46 = [v8 countByEnumeratingWithState:&v56 objects:v70 count:16];
      uint64_t v10 = v46;
    }
    while (v46);
  }
}

- (void)handleAccessoryIsReachableNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 home];
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      uint64_t v10 = [(HMDSiriEndpointSettingsSyncManager *)self homeUUIDsManagedByCurrentDevice];
      uint64_t v11 = [v8 uuid];
      char v12 = [v10 containsObject:v11];

      if (v12)
      {
        os_unfair_lock_unlock(&self->_lock);
        id v13 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__HMDSiriEndpointSettingsSyncManager_handleAccessoryIsReachableNotification___block_invoke;
        block[3] = &unk_264A2F2F8;
        block[4] = self;
        id v27 = v7;
        id v28 = v8;
        dispatch_async(v13, block);
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x230FBD990]();
        __int16 v23 = self;
        HMFGetOSLogHandle();
        os_log_type_t v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint32_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v30 = v25;
          __int16 v31 = 2112;
          id v32 = v8;
          __int16 v33 = 2112;
          id v34 = v7;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received accessory reachability notification for unmanaged home %@ accessory %@", buf, 0x20u);
        }
        os_unfair_lock_unlock(p_lock);
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      int v19 = self;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v30 = v21;
        __int16 v31 = 2112;
        id v32 = v7;
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint reachable notification with no home for HAP accessory: %@. %@", buf, 0x20u);
      }
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    char v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v17;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint reachable notification with no HAP accessory. %@", buf, 0x16u);
    }
  }
}

void __77__HMDSiriEndpointSettingsSyncManager_handleAccessoryIsReachableNotification___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  id v3 = [*(id *)(a1 + 48) uuid];
  [v2 _synchronizeSettingsForAccessoryUUID:v4 homeUUID:v3];
}

- (void)handleHAPMediaProfileAddedNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 home];
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      uint64_t v10 = [(HMDSiriEndpointSettingsSyncManager *)self homeUUIDsManagedByCurrentDevice];
      uint64_t v11 = [v8 uuid];
      char v12 = [v10 containsObject:v11];

      if (v12)
      {
        os_unfair_lock_unlock(&self->_lock);
        id v13 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__HMDSiriEndpointSettingsSyncManager_handleHAPMediaProfileAddedNotification___block_invoke;
        block[3] = &unk_264A2F2F8;
        block[4] = self;
        id v27 = v7;
        id v28 = v8;
        dispatch_async(v13, block);
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x230FBD990]();
        __int16 v23 = self;
        HMFGetOSLogHandle();
        os_log_type_t v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          uint32_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          id v30 = v25;
          __int16 v31 = 2112;
          id v32 = v8;
          __int16 v33 = 2112;
          id v34 = v7;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received HAPMediaProfileAdded notification for unmanaged home %@ accessory %@", buf, 0x20u);
        }
        os_unfair_lock_unlock(p_lock);
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      int v19 = self;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v30 = v21;
        __int16 v31 = 2112;
        id v32 = v7;
        __int16 v33 = 2112;
        id v34 = v4;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving HAPMediaProfile notification with no home for HAP accessory: %@. %@", buf, 0x20u);
      }
    }
  }
  else
  {
    __int16 v14 = (void *)MEMORY[0x230FBD990]();
    char v15 = self;
    __int16 v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v30 = v17;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving HAPMediaProfile added notification with no HAP accessory. %@", buf, 0x16u);
    }
  }
}

void __77__HMDSiriEndpointSettingsSyncManager_handleHAPMediaProfileAddedNotification___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) uuid];
  id v3 = [*(id *)(a1 + 48) uuid];
  [v2 _synchronizeSettingsForAccessoryUUID:v4 homeUUID:v3];
}

- (void)handleCompositeSettingsControllerDidConfigureNotification:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v31 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Did handle CompositeSettingsControllerDidConfigure notification", buf, 0xCu);
  }
  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"HMDHomeUUIDOwnerUUIDKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  id v13 = objc_msgSend(v12, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerHomeUUIDNotificationKey");
  __int16 v14 = objc_msgSend(v12, "hmf_UUIDForKey:", @"HMDCompositeSettingControllerOwnerUUIDNotificationKey");
  if (v14 && v13)
  {
    p_lock = &v6->_lock;
    os_unfair_lock_lock_with_options();
    __int16 v16 = [(HMDSiriEndpointSettingsSyncManager *)v6 homeUUIDsManagedByCurrentDevice];
    char v17 = [v16 containsObject:v13];

    if (v17)
    {
      os_unfair_lock_unlock(&v6->_lock);
      id v18 = [(HMDSiriEndpointSettingsSyncManager *)v6 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __96__HMDSiriEndpointSettingsSyncManager_handleCompositeSettingsControllerDidConfigureNotification___block_invoke;
      block[3] = &unk_264A2F2F8;
      block[4] = v6;
      id v28 = v14;
      id v29 = v13;
      dispatch_async(v18, block);
    }
    else
    {
      __int16 v23 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v24 = v6;
      HMFGetOSLogHandle();
      uint32_t v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint32_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v31 = v26;
        __int16 v32 = 2112;
        __int16 v33 = v13;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Home:%@ not managed", buf, 0x16u);
      }
      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = v6;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v31 = v22;
      __int16 v32 = 2112;
      __int16 v33 = v14;
      __int16 v34 = 2112;
      uint64_t v35 = v13;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil hapAccessoryUUID:%@ or homeUUID:%@", buf, 0x20u);
    }
  }
}

uint64_t __96__HMDSiriEndpointSettingsSyncManager_handleCompositeSettingsControllerDidConfigureNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronizeSettingsForAccessoryUUID:*(void *)(a1 + 40) homeUUID:*(void *)(a1 + 48)];
}

- (void)handleSiriEndPointAddedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 home];
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      uint64_t v9 = [(HMDSiriEndpointSettingsSyncManager *)self homeUUIDsManagedByCurrentDevice];
      uint64_t v10 = [v8 uuid];
      char v11 = [v9 containsObject:v10];

      os_unfair_lock_unlock(&self->_lock);
      if (v11)
      {
        id v12 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __74__HMDSiriEndpointSettingsSyncManager_handleSiriEndPointAddedNotification___block_invoke;
        block[3] = &unk_264A2F2F8;
        block[4] = self;
        id v22 = v7;
        id v23 = v8;
        dispatch_async(v12, block);
      }
    }
    else
    {
      char v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint32_t v25 = v20;
        __int16 v26 = 2112;
        id v27 = v7;
        __int16 v28 = 2112;
        id v29 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint added notification with no home for HAP accessory: %@. %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    __int16 v14 = self;
    char v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint32_t v25 = v16;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to synchronize settings after receiving endpoint added notification with no HAP accessory. %@", buf, 0x16u);
    }
  }
}

uint64_t __74__HMDSiriEndpointSettingsSyncManager_handleSiriEndPointAddedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginManagingAccessory:*(void *)(a1 + 40) forHome:*(void *)(a1 + 48)];
}

- (void)handleHomeAddedNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Settings sync manager received home added notification: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HMDSiriEndpointSettingsSyncManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__HMDSiriEndpointSettingsSyncManager_handleHomeAddedNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v9, block);
}

uint64_t __66__HMDSiriEndpointSettingsSyncManager_handleHomeAddedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateManagedHomes];
}

- (void)handleHomeRemovedNotification:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Settings sync manager received home removed notification: %@", buf, 0x16u);
  }
  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKey:@"HMDHomeNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    os_unfair_lock_lock_with_options();
    __int16 v13 = [(HMDSiriEndpointSettingsSyncManager *)v6 homeUUIDsManagedByCurrentDevice];
    id v14 = [v12 uuid];
    int v15 = [v13 containsObject:v14];

    if (v15)
    {
      __int16 v16 = [(HMDSiriEndpointSettingsSyncManager *)v6 homeUUIDsManagedByCurrentDevice];
      char v17 = [v12 uuid];
      [v16 removeObject:v17];

      os_unfair_lock_unlock(&v6->_lock);
      id v18 = [(HMDSiriEndpointSettingsSyncManager *)v6 workQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __68__HMDSiriEndpointSettingsSyncManager_handleHomeRemovedNotification___block_invoke;
      v23[3] = &unk_264A2F820;
      v23[4] = v6;
      id v24 = v12;
      dispatch_async(v18, v23);
    }
    else
    {
      os_unfair_lock_unlock(&v6->_lock);
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x230FBD990]();
    __int16 v20 = v6;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@No home found for home removed notification: %@", buf, 0x16u);
    }
  }
}

uint64_t __68__HMDSiriEndpointSettingsSyncManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopManagingHome:*(void *)(a1 + 40)];
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 name];
    *(_DWORD *)buf = 138543618;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    int v15 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling %@ notification", buf, 0x16u);
  }
  uint64_t v10 = [(HMDSiriEndpointSettingsSyncManager *)v6 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDSiriEndpointSettingsSyncManager_handlePrimaryResidentUpdateNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = v6;
  dispatch_async(v10, block);
}

uint64_t __78__HMDSiriEndpointSettingsSyncManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateManagedHomes];
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F0E300] decodeTopic:v7];
  uint64_t v9 = [v8 asAccessorySettingTopic];

  if (v9)
  {
    uint64_t v10 = [v9 accessorySettingKeyPath];

    if (v10)
    {
      char v11 = [v9 homeUUID];

      if (v11)
      {
        id v12 = [v9 accessoryUUID];

        if (v12)
        {
          id v59 = 0;
          __int16 v13 = [MEMORY[0x263F0E3F8] decodeSettingFromEvent:v6 error:&v59];
          id v50 = v59;
          if (v13)
          {
            __int16 v14 = +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths];
            int v15 = [v9 accessorySettingKeyPath];
            char v16 = [v14 containsObject:v15];

            if (v16)
            {
              char v17 = [(HMDSiriEndpointSettingsSyncManager *)self dataSource];
              id v18 = [v17 homesForSiriEndpointSettingsSyncManager:self];
              v57[0] = MEMORY[0x263EF8330];
              v57[1] = 3221225472;
              v57[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke;
              v57[3] = &unk_264A2B2D0;
              id v19 = v9;
              id v58 = v19;
              id v49 = objc_msgSend(v18, "na_firstObjectPassingTest:", v57);

              p_lock = &self->_lock;
              os_unfair_lock_lock_with_options();
              uint64_t v21 = [(HMDSiriEndpointSettingsSyncManager *)self homeUUIDsManagedByCurrentDevice];
              id v22 = [v49 uuid];
              char v23 = [v21 containsObject:v22];

              if (v23)
              {
                os_unfair_lock_unlock(&self->_lock);
                id v24 = [v49 hapAccessories];
                v55[0] = MEMORY[0x263EF8330];
                v55[1] = 3221225472;
                v55[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_59;
                v55[3] = &unk_264A28A10;
                id v25 = v19;
                id v56 = v25;
                __int16 v26 = objc_msgSend(v24, "na_firstObjectPassingTest:", v55);

                if (!v26
                  || ([v26 siriEndpointProfile],
                      __int16 v27 = objc_claimAutoreleasedReturnValue(),
                      BOOL v28 = v27 == 0,
                      v27,
                      v28))
                {
                  __int16 v45 = (void *)MEMORY[0x230FBD990]();
                  uint64_t v46 = self;
                  uint64_t v47 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                  {
                    v48 = HMFGetLogIdentifier();
                    *(_DWORD *)buf = 138544130;
                    v61 = v48;
                    __int16 v62 = 2112;
                    id v63 = v49;
                    __int16 v64 = 2112;
                    id v65 = v6;
                    __int16 v66 = 2112;
                    id v67 = v7;
                    _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Unable to find matching siri endpoint enabled accessory in home (%@) for settings update event: %@ topic: %@", buf, 0x2Au);
                  }
                }
                else
                {
                  uint64_t v29 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
                  block[0] = MEMORY[0x263EF8330];
                  block[1] = 3221225472;
                  block[2] = __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_61;
                  block[3] = &unk_264A2E610;
                  block[4] = self;
                  id v52 = v13;
                  id v53 = v26;
                  id v54 = v25;
                  dispatch_async(v29, block);
                }
              }
              else
              {
                id v41 = (void *)MEMORY[0x230FBD990]();
                uint64_t v42 = self;
                HMFGetOSLogHandle();
                id v43 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  uint64_t v44 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543874;
                  v61 = v44;
                  __int16 v62 = 2112;
                  id v63 = v6;
                  __int16 v64 = 2112;
                  id v65 = v7;
                  _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Received settings update event: %@ topic: %@ for unmanaged home", buf, 0x20u);
                }
                os_unfair_lock_unlock(p_lock);
              }

              goto LABEL_34;
            }
            uint64_t v36 = (void *)MEMORY[0x230FBD990]();
            id v37 = self;
            __int16 v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              id v40 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v61 = v40;
              __int16 v62 = 2112;
              id v63 = v6;
              __int16 v64 = 2112;
              id v65 = v7;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Did recieve settings value event for an unwatched keypath. Event: %@ Topic: %@", buf, 0x20u);
            }
          }
          else
          {
            uint64_t v36 = (void *)MEMORY[0x230FBD990]();
            id v37 = self;
            __int16 v38 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              id v39 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v61 = v39;
              __int16 v62 = 2112;
              id v63 = v6;
              __int16 v64 = 2112;
              id v65 = v7;
              _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);
            }
          }

LABEL_34:

          goto LABEL_35;
        }
        uint64_t v30 = (void *)MEMORY[0x230FBD990]();
        __int16 v31 = self;
        __int16 v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v61 = v35;
          __int16 v62 = 2112;
          id v63 = v6;
          __int16 v64 = 2112;
          id v65 = v7;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil accessoryUUID for settings update event: %@ topic: %@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v30 = (void *)MEMORY[0x230FBD990]();
        __int16 v31 = self;
        __int16 v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v61 = v34;
          __int16 v62 = 2112;
          id v63 = v6;
          __int16 v64 = 2112;
          id v65 = v7;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil homeUUID for settings update event: %@ topic: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v30 = (void *)MEMORY[0x230FBD990]();
      __int16 v31 = self;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        __int16 v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v61 = v33;
        __int16 v62 = 2112;
        id v63 = v6;
        __int16 v64 = 2112;
        id v65 = v7;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Nil Keypath for settings update event: %@ topic: %@", buf, 0x20u);
      }
    }
  }
LABEL_35:
}

uint64_t __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) homeUUID];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_59(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

void __60__HMDSiriEndpointSettingsSyncManager_didReceiveEvent_topic___block_invoke_61(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 56) accessorySettingKeyPath];
  [v1 _writeSetting:v2 toAccessory:v3 forKeyPath:v4];
}

- (void)_updateManagedHomes
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  uint64_t v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v59 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating homes for siri endpoint settings sync", buf, 0xCu);
  }
  id v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v9 = [(HMDSiriEndpointSettingsSyncManager *)v5 dataSource];
  uint64_t v10 = [v9 homesForSiriEndpointSettingsSyncManager:v5];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v11);
        }
        int v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v15 isCurrentDeviceConfirmedPrimaryResident]) {
          [v8 addObject:v15];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v54 objects:v68 count:16];
    }
    while (v12);
  }

  os_unfair_lock_lock_with_options();
  char v16 = [(HMDSiriEndpointSettingsSyncManager *)v5 homeUUIDsManagedByCurrentDevice];
  char v17 = (void *)[v16 copy];

  os_unfair_lock_unlock(&v5->_lock);
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke;
  v52[3] = &unk_264A2B2D0;
  id v18 = v17;
  id v53 = v18;
  id v19 = objc_msgSend(v8, "na_filter:", v52);
  __int16 v20 = objc_msgSend(v19, "na_map:", &__block_literal_global_53);
  uint64_t v21 = (void *)MEMORY[0x263EFFA08];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_3;
  v49[3] = &unk_264A2B278;
  id v22 = v18;
  id v50 = v22;
  id v40 = v8;
  id v51 = v40;
  char v23 = objc_msgSend(v11, "na_filter:", v49);
  id v24 = [v21 setWithArray:v23];

  id v25 = objc_msgSend(v24, "na_map:", &__block_literal_global_56_159354);
  os_unfair_lock_lock_with_options();
  __int16 v26 = [(HMDSiriEndpointSettingsSyncManager *)v5 homeUUIDsManagedByCurrentDevice];
  [v26 unionSet:v20];

  __int16 v27 = [(HMDSiriEndpointSettingsSyncManager *)v5 homeUUIDsManagedByCurrentDevice];
  [v27 minusSet:v25];

  os_unfair_lock_unlock(&v5->_lock);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v28 = v19;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v67 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(v28);
        }
        [(HMDSiriEndpointSettingsSyncManager *)v5 _beginManagingHome:*(void *)(*((void *)&v45 + 1) + 8 * j)];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v67 count:16];
    }
    while (v29);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v32 = v24;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v66 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(v32);
        }
        [(HMDSiriEndpointSettingsSyncManager *)v5 _stopManagingHome:*(void *)(*((void *)&v41 + 1) + 8 * k)];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v66 count:16];
    }
    while (v33);
  }

  uint64_t v36 = (void *)MEMORY[0x230FBD990]();
  id v37 = v5;
  __int16 v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    id v59 = v39;
    __int16 v60 = 2112;
    id v61 = v32;
    __int16 v62 = 2112;
    id v63 = v28;
    __int16 v64 = 2112;
    id v65 = v22;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Updated homes for siri endpoint setting sync by removing: %@ and adding: %@ to existing homes: %@", buf, 0x2Au);
  }
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 uuid];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 uuid];
  if ([v4 containsObject:v5]) {
    uint64_t v6 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __57__HMDSiriEndpointSettingsSyncManager__updateManagedHomes__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)unregisterFromAccessoryNotificationsOnHapAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v5 removeObserver:self name:@"HMDAccessoryIsReachableNotification" object:v4];

  id v6 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v6 removeObserver:self name:@"HMDHAPMediaProfileAddedNotification" object:v4];
}

- (void)registerForAccessoryNotificationsOnHapAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v5 addObserver:self selector:sel_handleAccessoryIsReachableNotification_ name:@"HMDAccessoryIsReachableNotification" object:v4];

  id v6 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v6 addObserver:self selector:sel_handleHAPMediaProfileAddedNotification_ name:@"HMDHAPMediaProfileAddedNotification" object:v4];
}

- (void)_stopManagingAccessory:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke;
  v15[3] = &unk_264A26598;
  id v16 = v7;
  id v17 = v6;
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = objc_msgSend(v9, "na_map:", v15);

  uint64_t v13 = [(HMDSiriEndpointSettingsSyncManager *)self subscriptionProvider];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke_2;
  v14[3] = &unk_264A2F3E8;
  v14[4] = self;
  [v13 unregisterConsumer:self topicFilters:v12 completion:v14];

  [(HMDSiriEndpointSettingsSyncManager *)self unregisterFromAccessoryNotificationsOnHapAccessory:v10];
}

id __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 uuid];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = MEMORY[0x230FBBF00](v5, v6, v4);

  return v7;
}

void __69__HMDSiriEndpointSettingsSyncManager__stopManagingAccessory_forHome___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Unsubscribed endpoint setting sync manager with result: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_beginManagingAccessory:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = +[HMDSiriEndpointSettingsSyncManager siriEndPointHomeKitBackedKeyPaths];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke;
  v21[3] = &unk_264A26598;
  id v10 = v7;
  id v22 = v10;
  id v11 = v6;
  id v23 = v11;
  uint64_t v12 = objc_msgSend(v9, "na_map:", v21);

  [(HMDSiriEndpointSettingsSyncManager *)self unregisterFromAccessoryNotificationsOnHapAccessory:v11];
  [(HMDSiriEndpointSettingsSyncManager *)self registerForAccessoryNotificationsOnHapAccessory:v11];
  uint64_t v13 = [(HMDSiriEndpointSettingsSyncManager *)self subscriptionProvider];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke_2;
  v17[3] = &unk_264A2E2D8;
  v17[4] = self;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [v13 registerConsumer:self topicFilters:v16 completion:v17];
}

id __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 uuid];
  id v6 = [*(id *)(a1 + 40) uuid];
  id v7 = MEMORY[0x230FBBF00](v5, v6, v4);

  return v7;
}

void __70__HMDSiriEndpointSettingsSyncManager__beginManagingAccessory_forHome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = HMFBooleanToString();
    int v16 = 138544130;
    id v17 = v10;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Subscribed endpoint setting sync manager for changed topics (%@) with result: %@ (%@)", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 48) uuid];
  id v15 = [*(id *)(a1 + 56) uuid];
  [v13 _synchronizeSettingsForAccessoryUUID:v14 homeUUID:v15];
}

- (void)_stopManagingHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(v4, "hapAccessories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v11 siriEndpointProfile];

        if (v12) {
          [(HMDSiriEndpointSettingsSyncManager *)self _stopManagingAccessory:v11 forHome:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)_beginManagingHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(v4, "hapAccessories", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v11 siriEndpointProfile];

        if (v12) {
          [(HMDSiriEndpointSettingsSyncManager *)self _beginManagingAccessory:v11 forHome:v4];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)configure
{
  id v3 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v3 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:0];

  id v4 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v4 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:0];

  id v5 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v5 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:0];

  id v6 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v6 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:0];

  uint64_t v7 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v7 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  uint64_t v8 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v8 addObserver:self selector:sel_handleSiriEndPointAddedNotification_ name:@"HMDSiriEndpointProfileAddedNotification" object:0];

  uint64_t v9 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v9 addObserver:self selector:sel_handleCompositeSettingsControllerDidConfigureNotification_ name:@"HMDCompositeSettingsControllerDidConfigureNotification" object:0];

  id v10 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v10 addObserver:self selector:sel_handleHomeRemovedNotification_ name:@"HMDHomeRemovedNotification" object:0];

  uint64_t v11 = [(HMDSiriEndpointSettingsSyncManager *)self notificationCenter];
  [v11 addObserver:self selector:sel_handleHomeAddedNotification_ name:@"HMDHomeAddedNotification" object:0];

  uint64_t v12 = [(HMDSiriEndpointSettingsSyncManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__HMDSiriEndpointSettingsSyncManager_configure__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v12, block);
}

uint64_t __47__HMDSiriEndpointSettingsSyncManager_configure__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateManagedHomes];
}

- (HMDSiriEndpointSettingsSyncManager)initWithDataSource:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 workQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDSiriEndpointSettingsSyncManager;
  long long v14 = [(HMDSiriEndpointSettingsSyncManager *)&v19 init];
  long long v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v10);
    objc_storeStrong((id *)&v15->_subscriptionProvider, a4);
    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    homeUUIDsManagedByCurrentDevice = v15->_homeUUIDsManagedByCurrentDevice;
    v15->_homeUUIDsManagedByCurrentDevice = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_notificationCenter, a5);
    objc_storeStrong((id *)&v15->_workQueue, a6);
    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_159377 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_159377, &__block_literal_global_38_159378);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v1_159379;
  return v2;
}

void __49__HMDSiriEndpointSettingsSyncManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_159379;
  logCategory__hmf_once_v1_159379 = v0;
}

+ (NSArray)siriEndPointHomeKitBackedKeyPaths
{
  if (siriEndPointHomeKitBackedKeyPaths_onceToken != -1) {
    dispatch_once(&siriEndPointHomeKitBackedKeyPaths_onceToken, &__block_literal_global_159384);
  }
  uint64_t v2 = (void *)siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths;
  return (NSArray *)v2;
}

void __71__HMDSiriEndpointSettingsSyncManager_siriEndPointHomeKitBackedKeyPaths__block_invoke()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"root.siri.lightWhenUsingSiri";
  v2[1] = @"root.siri.soundAlert";
  v2[2] = @"root.airPlay.airPlayEnabled";
  v2[3] = @"root.siri.siriEnabled";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths;
  siriEndPointHomeKitBackedKeyPaths_siriEndPointHomeKitBackedKeyPaths = v0;
}

@end