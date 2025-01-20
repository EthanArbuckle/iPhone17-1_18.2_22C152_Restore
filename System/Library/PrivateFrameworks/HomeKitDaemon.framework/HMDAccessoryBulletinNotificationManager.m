@interface HMDAccessoryBulletinNotificationManager
+ (id)_characteristicBulletinRegistrationsForSource:(id)a3 context:(id)a4;
+ (id)logCategory;
+ (id)matterBulletinRegistrationsForSource:(id)a3 context:(id)a4;
- (BOOL)currentPrimary;
- (HMDAccessoryBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 accountManager:(id)a5 evaluator:(id)a6 notificationCenter:(id)a7;
- (HMDAppleAccountManager)accountManager;
- (HMDBulletinNotificationRegistrationSource)source;
- (HMDHome)home;
- (HMDNotificationConditionEvaluator)evaluator;
- (HMFTimer)synchronizeWithPrimaryDebounceTimer;
- (NSArray)accessoryRegistrations;
- (NSArray)accessoryRegistrationsForCurrentDevice;
- (NSArray)matterRegistrations;
- (NSArray)serviceRegistrationsForCurrentDevice;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (id)_accessoryRegistrationFromMKFRegistrationSafe:(id)a3;
- (id)_characteristicsRegistrationsFromBulletinRegistrations:(id)a3;
- (id)_characteristicsWithPassingLocalRegistrationForCharacteristics:(id)a3;
- (id)_devicesToNotifyForCharacteristic:(id)a3;
- (id)_matterRegistrationsFromBulletinRegistrations:(id)a3;
- (id)_mkfLocalCharacteristicRegistrationsWithManagedObjectContext:(id)a3;
- (id)_mkfLocalServiceRegistrationsWithManagedObjectContext:(id)a3;
- (id)_updateReasonsByCharacteristicFromMessage:(id)a3;
- (id)accessoryBulletinNotificationRegistrationsForCharacteristic:(id)a3;
- (id)bulletinBoardNotificationForAccessory:(id)a3 endpointID:(id)a4;
- (id)bulletinBoardNotificationForService:(id)a3;
- (id)bulletinCharacteristicsFromChangedCharacteristics:(id)a3 message:(id)a4;
- (id)characteristicsByDestinationForCharacteristics:(id)a3;
- (id)conditionsFromPredicate:(id)a3;
- (id)currentHomeAccessoryUUIDs;
- (id)devicesToNotifyForMatterPath:(id)a3;
- (id)logIdentifier;
- (id)matterBulletinNotificationRegistrationsForMatterPath:(id)a3;
- (id)matterRegistrationFromMKFRegistrationSafe:(id)a3;
- (id)mkfLocalMatterRegistrationsWithManagedObjectContext:(id)a3;
- (id)synchronizeWithPrimaryDebounceTimerFactory;
- (void)_handleAccessoryBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4;
- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3;
- (void)_handleDeviceBecameNotPrimary;
- (void)_handleDeviceBecamePrimary;
- (void)_handlePrimaryResidentUpdateNotification:(id)a3;
- (void)_synchronizeLocalRegistrationsWithPrimaryResident;
- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4;
- (void)configureWithDeviceIsResidentCapable:(BOOL)a3;
- (void)disableBulletinForAccessory:(id)a3 endpointID:(id)a4 completion:(id)a5;
- (void)disableBulletinForService:(id)a3 completion:(id)a4;
- (void)enableBulletinForAccessory:(id)a3 endpointID:(id)a4 conditions:(id)a5 completion:(id)a6;
- (void)enableBulletinForService:(id)a3 conditions:(id)a4 completion:(id)a5;
- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3;
- (void)handleDisabledRegistrations:(id)a3;
- (void)handleEnabledRegistrations:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleRemovedAccessory:(id)a3;
- (void)handleRemovedEndpoint:(id)a3 fromAccessory:(id)a4;
- (void)handleRemovedService:(id)a3;
- (void)requestSynchronizeRegistrations;
- (void)setCurrentPrimary:(BOOL)a3;
- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3;
- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateEndpointRegistrationsForAccessory:(id)a3 endpoints:(id)a4;
- (void)updateRegistrationsWithEnabledCharacteristics:(id)a3 disabledCharacteristics:(id)a4 conditions:(id)a5 completion:(id)a6;
- (void)updateRegistrationsWithEnabledMatterPaths:(id)a3 disabledMatterPaths:(id)a4 conditions:(id)a5 completion:(id)a6;
- (void)updateServiceGroup:(id)a3 completion:(id)a4;
@end

@implementation HMDAccessoryBulletinNotificationManager

- (id)matterRegistrationFromMKFRegistrationSafe:(id)a3
{
  id v4 = a3;
  v5 = [v4 matterPaths];
  char v6 = objc_msgSend(v5, "hmf_isEmpty");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = [(HMDAccessoryBulletinNotificationManager *)self home];
    v7 = +[HMDBulletinNotificationRegistrationUtilities matterRegistrationFromMKFRegistration:v4 home:v8];
  }
  return v7;
}

- (id)mkfLocalMatterRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessoryBulletinNotificationManager *)self currentHomeAccessoryUUIDs];
  char v6 = +[MKFLocalBulletinMatterRegistration fetchRequest];
  id v17 = 0;
  v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __103__HMDAccessoryBulletinNotificationManager_Matter__mkfLocalMatterRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A209E8;
    id v16 = v5;
    v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local Matter registrations, error: %@", buf, 0x16u);
    }
    v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __103__HMDAccessoryBulletinNotificationManager_Matter__mkfLocalMatterRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)updateEndpointRegistrationsForAccessory:(id)a3 endpoints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 home];
  v9 = [v8 backingStore];
  v10 = [v9 context];

  v11 = [v10 managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__HMDAccessoryBulletinNotificationManager_Matter__updateEndpointRegistrationsForAccessory_endpoints___block_invoke;
  v15[3] = &unk_264A2E610;
  id v16 = v6;
  id v17 = v11;
  id v18 = v7;
  v19 = self;
  id v12 = v7;
  id v13 = v11;
  id v14 = v6;
  [v13 performBlock:v15];
}

void __101__HMDAccessoryBulletinNotificationManager_Matter__updateEndpointRegistrationsForAccessory_endpoints___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  v3 = +[MKFLocalBulletinEndpointRegistration fetchAllEndpointRegistrationsForAccessoryUUID:v2 managedObjectContext:*(void *)(a1 + 40)];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __101__HMDAccessoryBulletinNotificationManager_Matter__updateEndpointRegistrationsForAccessory_endpoints___block_invoke_2;
  v6[3] = &unk_264A209C0;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v6);
}

void __101__HMDAccessoryBulletinNotificationManager_Matter__updateEndpointRegistrationsForAccessory_endpoints___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 endpointID];
  if (([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138544130;
      v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      v15 = v4;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Received attribute report for parts list that has the following endpoints=%@ which does not contain endpointID=%@ that we have registration=%@ for, unregistering for notifications with this endpointID.", (uint8_t *)&v10, 0x2Au);
    }
    [*(id *)(a1 + 40) handleRemovedEndpoint:v4 fromAccessory:*(void *)(a1 + 48)];
  }
}

- (id)devicesToNotifyForMatterPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [(HMDAccessoryBulletinNotificationManager *)self matterBulletinNotificationRegistrationsForMatterPath:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__HMDAccessoryBulletinNotificationManager_Matter__devicesToNotifyForMatterPath___block_invoke;
  v11[3] = &unk_264A20998;
  v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend(v6, "na_each:", v11);
  uint64_t v9 = (void *)[v7 copy];

  return v9;
}

void __80__HMDAccessoryBulletinNotificationManager_Matter__devicesToNotifyForMatterPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 registration];
  uint64_t v5 = [v3 source];
  id v6 = [*(id *)(a1 + 32) home];
  id v7 = [v5 userUUID];
  id v8 = [v6 userWithUUID:v7];

  if (!v8)
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v34 = v27;
      __int16 v35 = 2112;
      v36 = v4;
      __int16 v37 = 2112;
      id v38 = v5;
      v28 = "%{public}@Unable to evaluate registration: %@, no matching user for source: %@";
      v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      uint32_t v31 = 32;
LABEL_13:
      _os_log_impl(&dword_22F52A000, v29, v30, v28, buf, v31);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (([v8 isAccessCurrentlyAllowedBySchedule] & 1) == 0)
  {
    v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v34 = v27;
      v28 = "%{public}@Cannot send the notification as the user is outside schedule";
      v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      uint32_t v31 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v9 = [*(id *)(a1 + 32) evaluator];
  int v10 = [v4 conditions];
  int v11 = [v9 conditionsPass:v10 registrationUser:v8];

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  __int16 v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = v32 = v4;
    __int16 v16 = HMFBooleanToString();
    *(_DWORD *)buf = 138543874;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 2112;
    id v38 = v3;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Condition(s) passed: %@ for registration: %@", buf, 0x20u);

    id v4 = v32;
  }

  if (v11)
  {
    id v17 = [v3 source];
    uint64_t v18 = [v17 device];

    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v34 = v22;
      __int16 v35 = 2112;
      v36 = v18;
      __int16 v37 = 2112;
      id v38 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding remote device: %@ to notify for updated Matter path: %@ ", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v18];
  }
LABEL_15:
}

- (void)handleRemovedEndpoint:(id)a3 fromAccessory:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v26 = v11;
    __int16 v27 = 2112;
    id v28 = v6;
    __int16 v29 = 2112;
    id v30 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling removed endpointID=%@ from accessory: %@", buf, 0x20u);
  }
  id v12 = [v7 uuid];
  id v13 = [(HMDAccessoryBulletinNotificationManager *)v9 home];
  __int16 v14 = [v13 backingStore];
  v15 = [v14 context];

  __int16 v16 = [v15 managedObjectContext];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__HMDAccessoryBulletinNotificationManager_Matter__handleRemovedEndpoint_fromAccessory___block_invoke;
  v20[3] = &unk_264A2E610;
  id v21 = v12;
  id v22 = v6;
  id v23 = v16;
  v24 = v9;
  id v17 = v16;
  id v18 = v6;
  id v19 = v12;
  [v17 performBlock:v20];
}

void __87__HMDAccessoryBulletinNotificationManager_Matter__handleRemovedEndpoint_fromAccessory___block_invoke(id *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = +[MKFLocalBulletinEndpointRegistration fetchEndpointRegistrationForAccessoryUUID:a1[4] endpointID:a1[5] managedObjectContext:a1[6]];
  if (v2)
  {
    id v3 = +[MKFLocalBulletinMatterRegistration fetchAllMatterRegistrationsForEndpointID:a1[5] accessoryModelID:a1[4] managedObjectContext:a1[6]];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __87__HMDAccessoryBulletinNotificationManager_Matter__handleRemovedEndpoint_fromAccessory___block_invoke_53;
    v22[3] = &unk_264A20970;
    v22[4] = a1[7];
    id v23 = a1[5];
    id v24 = a1[4];
    id v25 = a1[6];
    objc_msgSend(v3, "na_each:", v22);
    [a1[6] deleteObject:v2];
    id v4 = a1[6];
    id v21 = 0;
    [v4 save:&v21];
    id v5 = v21;
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[7];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      id v20 = v5;
      int v10 = v6;
      int v11 = v3;
      id v12 = a1[4];
      id v13 = a1[5];
      __int16 v14 = HMFBooleanToString();
      *(_DWORD *)buf = 138544642;
      __int16 v27 = v9;
      __int16 v28 = 2112;
      __int16 v29 = v2;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      id v33 = v12;
      id v3 = v11;
      id v6 = v10;
      id v5 = v20;
      __int16 v34 = 2112;
      __int16 v35 = v14;
      __int16 v36 = 2112;
      id v37 = v20;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing local endpoint registration: %@ for removed endpointID=%@ on accessory with uuid=%@, was successful: %@ error: %@", buf, 0x3Eu);
    }
    [a1[6] reset];
  }
  else
  {
    v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = a1[7];
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = a1[5];
      *(_DWORD *)buf = 138543618;
      __int16 v27 = v18;
      __int16 v28 = 2112;
      __int16 v29 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local endpoint registration to match removed endpointID=%@", buf, 0x16u);
    }
  }
}

void __87__HMDAccessoryBulletinNotificationManager_Matter__handleRemovedEndpoint_fromAccessory___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    int v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing local Matter registration: %@ for removed endpointID=%@ on accessory with uuid=%@", (uint8_t *)&v10, 0x2Au);
  }
  [*(id *)(a1 + 56) deleteObject:v3];
}

- (id)matterBulletinNotificationRegistrationsForMatterPath:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__131992;
  id v19 = __Block_byref_object_dispose__131993;
  id v20 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke;
  v11[3] = &unk_264A2F698;
  id v8 = v4;
  id v12 = v8;
  id v13 = self;
  __int16 v14 = &v15;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 uuid];
  id v4 = +[HMCContext findHAPAccessoryWithModelID:v3];

  if (v4)
  {
    id v5 = [v4 matterPaths];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke_50;
    v34[3] = &unk_264A20948;
    id v35 = *(id *)(a1 + 32);
    id v6 = objc_msgSend(v5, "na_firstObjectPassingTest:", v34);

    if (v6)
    {
      id v7 = [v6 matterBulletinRegistrations];
      id v8 = v7;
      if (v7)
      {
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke_52;
        v33[3] = &unk_264A208A8;
        v33[4] = *(void *)(a1 + 40);
        uint64_t v9 = objc_msgSend(v7, "na_map:", v33);
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        int v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      else
      {
        __int16 v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = *(id *)(a1 + 40);
        __int16 v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          __int16 v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v37 = v30;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@mkfRegistrations is nil", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = *(id *)(a1 + 40);
      id v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = HMFGetLogIdentifier();
        id v31 = [*(id *)(a1 + 32) accessory];
        id v22 = [v31 uuid];
        id v23 = [*(id *)(a1 + 32) endpointID];
        [*(id *)(a1 + 32) clusterID];
        id v24 = v32 = v18;
        id v25 = [*(id *)(a1 + 32) attributeID];
        v26 = [*(id *)(a1 + 32) eventID];
        *(_DWORD *)buf = 138544642;
        id v37 = v21;
        __int16 v38 = 2112;
        uint64_t v39 = v22;
        __int16 v40 = 2112;
        v41 = v23;
        __int16 v42 = 2112;
        v43 = v24;
        __int16 v44 = 2112;
        v45 = v25;
        __int16 v46 = 2112;
        v47 = v26;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to find MKFMatterPath with accessoryUUID=%@ endpoint=%@ cluster=%@ attribute=%@ event=%@", buf, 0x3Eu);

        uint64_t v18 = v32;
      }
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 40);
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      __int16 v16 = [*(id *)(a1 + 32) accessory];
      uint64_t v17 = [v16 uuid];
      *(_DWORD *)buf = 138543618;
      id v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFHAPAccessory with uuid=%@", buf, 0x16u);
    }
  }
}

uint64_t __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke_50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 endpointID];
  id v5 = [*(id *)(a1 + 32) endpointID];
  if ([v4 isEqual:v5])
  {
    id v6 = [v3 clusterID];
    id v7 = [*(id *)(a1 + 32) clusterID];
    if (![v6 isEqual:v7])
    {
      uint64_t v11 = 0;
LABEL_16:

      goto LABEL_17;
    }
    id v8 = [*(id *)(a1 + 32) attributeID];
    if (v8)
    {
      uint64_t v9 = [v3 attributeID];
      uint64_t v10 = [*(id *)(a1 + 32) attributeID];
      if ([v9 isEqual:v10])
      {
        uint64_t v11 = 1;
LABEL_14:

LABEL_15:
        goto LABEL_16;
      }
      uint64_t v17 = v10;
      id v19 = v9;
    }
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "eventID", v17, v19);
    if (v12)
    {
      id v13 = (void *)v12;
      __int16 v14 = [v3 eventID];
      uint64_t v15 = [*(id *)(a1 + 32) eventID];
      uint64_t v11 = [v14 isEqual:v15];
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v10 = v18;
    uint64_t v9 = v20;
    if (!v8) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v11 = 0;
LABEL_17:

  return v11;
}

id __104__HMDAccessoryBulletinNotificationManager_Matter__matterBulletinNotificationRegistrationsForMatterPath___block_invoke_52(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) matterRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (void)updateRegistrationsWithEnabledMatterPaths:(id)a3 disabledMatterPaths:(id)a4 conditions:(id)a5 completion:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(HMDAccessoryBulletinNotificationManager *)self home];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke;
  v42[3] = &unk_264A208D0;
  id v15 = v14;
  id v43 = v15;
  id v16 = v12;
  id v44 = v16;
  __int16 v32 = v10;
  uint64_t v17 = objc_msgSend(v10, "na_map:", v42);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_2;
  v40[3] = &unk_264A208F8;
  id v18 = v15;
  id v41 = v18;
  id v19 = objc_msgSend(v11, "na_map:", v40);
  id v20 = (void *)MEMORY[0x230FBD990]();
  id v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    __int16 v46 = v23;
    __int16 v47 = 2112;
    uint64_t v48 = v17;
    __int16 v49 = 2112;
    v50 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating Matter registrations enable: %@ disable: %@", buf, 0x20u);
  }
  id v24 = [v18 backingStore];
  id v25 = [v24 context];

  v26 = [v25 managedObjectContext];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_43;
  v33[3] = &unk_264A2DF78;
  id v34 = v17;
  id v35 = v26;
  __int16 v36 = v21;
  id v37 = v19;
  id v38 = v25;
  id v39 = v13;
  id v27 = v25;
  id v28 = v13;
  id v29 = v19;
  id v30 = v26;
  id v31 = v17;
  [v27 performBlock:v33];
}

HMDMatterBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessory];
  uint64_t v5 = [v4 uuid];
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v6 = (void *)v5;
  if (!v5)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  id v7 = [v3 endpointID];

  if (!v7)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v8 = [v3 clusterID];

  if (!v8)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  uint64_t v9 = [v3 attributeID];
  if (v9)
  {
  }
  else
  {
    id v10 = [v3 eventID];

    if (!v10)
    {
      uint64_t v19 = _HMFPreconditionFailure();
      return (HMDMatterBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_2(v19);
    }
  }
  id v11 = [v4 home];
  id v12 = [v11 uuid];
  id v13 = [*(id *)(a1 + 32) uuid];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0) {
LABEL_16:
  }
    _HMFPreconditionFailure();
  id v15 = [HMDMatterBulletinNotificationRegistration alloc];
  v20[0] = v3;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v17 = [(HMDMatterBulletinNotificationRegistration *)v15 initWithMatterPaths:v16 conditions:*(void *)(a1 + 40)];

  return v17;
}

HMDMatterBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessory];
  uint64_t v5 = [v4 uuid];
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v6 = (void *)v5;
  if (!v5)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  id v7 = [v3 endpointID];

  if (!v7)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  id v8 = [v3 clusterID];

  if (!v8)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  uint64_t v9 = [v3 attributeID];
  if (v9)
  {
  }
  else
  {
    id v10 = [v3 eventID];

    if (!v10)
    {
      uint64_t v20 = _HMFPreconditionFailure();
      return (HMDMatterBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_43(v20);
    }
  }
  id v11 = [v4 home];
  id v12 = [v11 uuid];
  id v13 = [*(id *)(a1 + 32) uuid];
  char v14 = [v12 isEqual:v13];

  if ((v14 & 1) == 0) {
LABEL_16:
  }
    _HMFPreconditionFailure();
  id v15 = [HMDMatterBulletinNotificationRegistration alloc];
  v21[0] = v3;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  uint64_t v17 = [MEMORY[0x263EFFA08] set];
  id v18 = [(HMDMatterBulletinNotificationRegistration *)v15 initWithMatterPaths:v16 conditions:v17];

  return v18;
}

void __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_43(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = [MEMORY[0x263EFF9C0] set];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_2_45;
  v43[3] = &unk_264A20920;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v44 = v5;
  uint64_t v45 = v6;
  id v7 = v2;
  id v46 = v7;
  [v4 enumerateObjectsUsingBlock:v43];
  id v8 = *(void **)(a1 + 56);
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_48;
  v39[3] = &unk_264A20920;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  id v40 = v9;
  uint64_t v41 = v10;
  id v11 = v3;
  id v42 = v11;
  [v8 enumerateObjectsUsingBlock:v39];
  if (objc_msgSend(v7, "hmf_isEmpty") && objc_msgSend(v11, "hmf_isEmpty"))
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 48);
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v48 = v15;
      __int16 v49 = 2112;
      uint64_t v50 = v16;
      __int16 v51 = 2112;
      uint64_t v52 = v17;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating Matter registrations enable: %@ disable: %@ resulted in no changes to local store, not saving and not messaging primary", buf, 0x20u);
    }
    id v18 = _Block_copy(*(const void **)(a1 + 72));
    id v19 = v18;
    if (v18) {
      (*((void (**)(void *, void))v18 + 2))(v18, 0);
    }
  }
  else
  {
    uint64_t v20 = *(void **)(a1 + 64);
    id v38 = 0;
    int v21 = [v20 save:&v38];
    id v19 = v38;
    id v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = *(id *)(a1 + 48);
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = HMFGetLogIdentifier();
      id v34 = v19;
      id v35 = v7;
      v26 = v22;
      id v27 = v11;
      uint64_t v28 = *(void *)(a1 + 32);
      uint64_t v29 = *(void *)(a1 + 56);
      HMFBooleanToString();
      id v30 = v36 = v21;
      *(_DWORD *)buf = 138544386;
      uint64_t v48 = v25;
      __int16 v49 = 2112;
      uint64_t v50 = v28;
      id v11 = v27;
      id v22 = v26;
      __int16 v51 = 2112;
      uint64_t v52 = v29;
      id v19 = v34;
      id v7 = v35;
      __int16 v53 = 2112;
      v54 = v30;
      __int16 v55 = 2112;
      id v56 = v34;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Updating local Matter registrations enable: %@ disable: %@ was successful: %@ error: %@", buf, 0x34u);

      int v21 = v36;
    }

    if (v21)
    {
      id v31 = [*(id *)(a1 + 48) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_49;
      block[3] = &unk_264A2F7F8;
      block[4] = *(void *)(a1 + 48);
      dispatch_async(v31, block);
    }
    [*(id *)(a1 + 64) reset];
    __int16 v32 = _Block_copy(*(const void **)(a1 + 72));
    id v33 = v32;
    if (v32) {
      (*((void (**)(void *, id))v32 + 2))(v32, v19);
    }
  }
}

void __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_2_45(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 matterPaths];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 accessory];
  uint64_t v7 = [v6 uuid];

  id v8 = [v5 endpointID];
  id v9 = [v5 clusterID];
  uint64_t v10 = [v5 attributeID];
  id v11 = [v5 eventID];
  id v33 = (void *)v7;
  id v12 = +[MKFLocalBulletinMatterRegistration fetchMatterRegistrationForEndpointID:v8 clusterID:v9 attributeID:v10 eventID:v11 accessoryModelID:v7 managedObjectContext:*(void *)(a1 + 32)];

  BOOL v13 = v12 == 0;
  if (!v12)
  {
    char v14 = (void *)MEMORY[0x263EFF240];
    id v15 = +[MKFLocalBulletinMatterRegistration entity];
    uint64_t v16 = [v15 name];
    id v12 = [v14 insertNewObjectForEntityForName:v16 inManagedObjectContext:*(void *)(a1 + 32)];

    uint64_t v17 = [v5 endpointID];
    [v12 setEndpointID:v17];

    id v18 = [v5 clusterID];
    [v12 setClusterID:v18];

    id v19 = [v5 attributeID];
    [v12 setAttributeID:v19];

    uint64_t v20 = [v5 eventID];
    [v12 setEventID:v20];

    int v21 = (void *)MEMORY[0x230FBD990]([v12 setAccessoryModelID:v33]);
    id v22 = *(id *)(a1 + 40);
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v35 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Saved new local Matter registration", buf, 0xCu);
    }
  }
  if (([v12 enabled] & 1) == 0)
  {
    BOOL v13 = 1;
    [v12 setEnabled:1];
  }
  id v25 = [v12 conditions];
  v26 = [MEMORY[0x263EFFA08] set];
  if (v25)
  {
    uint64_t v27 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v25];

    v26 = (void *)v27;
  }
  uint64_t v28 = [v3 conditions];
  char v29 = [v26 isEqualToSet:v28];

  if (v29)
  {
    if (!v13) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v25) {
      [v12 removeConditions:v25];
    }
    uint64_t v30 = *(void *)(a1 + 32);
    id v31 = [v3 conditions];
    id v32 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v12 moc:v30 conditions:v31];
  }
  [*(id *)(a1 + 48) addObject:v3];
LABEL_16:
}

void __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_48(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 matterPaths];
  id v5 = [v4 firstObject];

  uint64_t v6 = [v5 endpointID];
  uint64_t v7 = [v5 clusterID];
  id v8 = [v5 attributeID];
  id v9 = [v5 eventID];
  uint64_t v10 = [v5 accessory];
  id v11 = [v10 uuid];
  id v12 = +[MKFLocalBulletinMatterRegistration fetchMatterRegistrationForEndpointID:v6 clusterID:v7 attributeID:v8 eventID:v9 accessoryModelID:v11 managedObjectContext:a1[4]];

  if (v12)
  {
    BOOL v13 = [v12 conditions];
    if (v13) {
      [v12 removeConditions:v13];
    }
    [a1[4] deleteObject:v12];
    [a1[6] addObject:v3];
  }
  else
  {
    char v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = a1[5];
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = 138543618;
      id v19 = v17;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Did not find local registration to disable matching registration: %@, skipping", (uint8_t *)&v18, 0x16u);
    }
  }
}

uint64_t __135__HMDAccessoryBulletinNotificationManager_Matter__updateRegistrationsWithEnabledMatterPaths_disabledMatterPaths_conditions_completion___block_invoke_49(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestSynchronizeRegistrations];
}

- (void)disableBulletinForAccessory:(id)a3 endpointID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v12 = [v8 home];
  BOOL v13 = [v12 uuid];
  char v14 = [v11 uuid];
  char v15 = [v13 isEqual:v14];

  if (v15)
  {
    uint64_t v16 = [v11 backingStore];
    uint64_t v17 = [v16 context];

    int v18 = [v17 managedObjectContext];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __101__HMDAccessoryBulletinNotificationManager_Matter__disableBulletinForAccessory_endpointID_completion___block_invoke;
    v24[3] = &unk_264A2DDC0;
    id v25 = v8;
    id v26 = v9;
    id v27 = v18;
    uint64_t v28 = self;
    id v29 = v10;
    id v19 = v10;
    id v20 = v18;
    id v21 = v9;
    id v22 = v8;
    [v20 performBlock:v24];
  }
  else
  {
    uint64_t v23 = _HMFPreconditionFailure();
    __101__HMDAccessoryBulletinNotificationManager_Matter__disableBulletinForAccessory_endpointID_completion___block_invoke(v23);
  }
}

void __101__HMDAccessoryBulletinNotificationManager_Matter__disableBulletinForAccessory_endpointID_completion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[MKFLocalBulletinEndpointRegistration fetchEndpointRegistrationForAccessoryUUID:v2 endpointID:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)];

  if (v3)
  {
    if ([v3 enabled])
    {
      [v3 setEnabled:0];
      id v4 = *(void **)(a1 + 48);
      id v26 = 0;
      [v4 save:&v26];
      id v5 = (void (**)(id, void *))v26;
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 56);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = HMFGetLogIdentifier();
        id v10 = +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
        id v11 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        uint64_t v28 = v9;
        __int16 v29 = 2112;
        uint64_t v30 = v10;
        __int16 v31 = 2112;
        id v32 = v11;
        __int16 v33 = 2112;
        id v34 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Disabling local endpoint registration: %@ was successful: %@ error: %@", buf, 0x2Au);
      }
      [*(id *)(a1 + 48) reset];
      id v12 = _Block_copy(*(const void **)(a1 + 64));
      BOOL v13 = v12;
      if (v12) {
        (*((void (**)(void *, id))v12 + 2))(v12, v5);
      }
      goto LABEL_11;
    }
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 56);
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      id v24 = +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = v24;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Disabling local endpoint registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);
    }
    id v25 = (void (**)(id, void *))_Block_copy(*(const void **)(a1 + 64));
    id v5 = v25;
    if (v25) {
      v25[2](v25, 0);
    }
  }
  else
  {
    char v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 56);
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v18 = [*(id *)(a1 + 32) uuid];
      id v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      id v32 = v19;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local endpoint registration to enable matching accessoryUUID: %@ endpointID: %@", buf, 0x20u);
    }
    id v5 = (void (**)(id, void *))_Block_copy(*(const void **)(a1 + 64));
    if (v5)
    {
      BOOL v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      v5[2](v5, v13);
LABEL_11:
    }
  }
}

- (void)enableBulletinForAccessory:(id)a3 endpointID:(id)a4 conditions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v15 = [v10 home];
  uint64_t v16 = [v15 uuid];
  uint64_t v17 = [v14 uuid];
  char v18 = [v16 isEqual:v17];

  if (v18)
  {
    id v19 = [v14 backingStore];
    id v20 = [v19 context];

    id v21 = [v20 managedObjectContext];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __111__HMDAccessoryBulletinNotificationManager_Matter__enableBulletinForAccessory_endpointID_conditions_completion___block_invoke;
    v28[3] = &unk_264A2DF78;
    id v29 = v10;
    id v30 = v11;
    id v31 = v21;
    id v32 = self;
    id v33 = v12;
    id v34 = v13;
    id v22 = v12;
    id v23 = v13;
    id v24 = v21;
    id v25 = v11;
    id v26 = v10;
    [v24 performBlock:v28];
  }
  else
  {
    uint64_t v27 = _HMFPreconditionFailure();
    __111__HMDAccessoryBulletinNotificationManager_Matter__enableBulletinForAccessory_endpointID_conditions_completion___block_invoke(v27);
  }
}

void __111__HMDAccessoryBulletinNotificationManager_Matter__enableBulletinForAccessory_endpointID_conditions_completion___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[MKFLocalBulletinEndpointRegistration fetchEndpointRegistrationForAccessoryUUID:v2 endpointID:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)];

  if (v3)
  {
    int v4 = [v3 enabled];
    if ((v4 & 1) == 0) {
      [v3 setEnabled:1];
    }
    id v5 = [v3 conditions];
    uint64_t v6 = [MEMORY[0x263EFFA08] set];
    id v7 = v6;
    if (v5)
    {
      id v8 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v5];

      if ([v8 isEqualToSet:*(void *)(a1 + 64)])
      {
        id v7 = v8;
        goto LABEL_12;
      }
      [v3 removeConditions:v5];
      id v7 = v8;
    }
    else if ([v6 isEqualToSet:*(void *)(a1 + 64)])
    {
LABEL_12:
      if (v4)
      {
        id v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = *(id *)(a1 + 56);
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          char v18 = HMFGetLogIdentifier();
          id v19 = +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
          *(_DWORD *)buf = 138543618;
          uint64_t v35 = v18;
          __int16 v36 = 2112;
          id v37 = v19;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Enabling local endpoint registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);
        }
        id v20 = _Block_copy(*(const void **)(a1 + 72));
        id v21 = v20;
        if (v20) {
          (*((void (**)(void *, void))v20 + 2))(v20, 0);
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_19:
      id v23 = *(void **)(a1 + 48);
      id v33 = 0;
      [v23 save:&v33];
      id v21 = v33;
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = *(id *)(a1 + 56);
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
        uint64_t v28 = v32 = v24;
        id v29 = HMFBooleanToString();
        *(_DWORD *)buf = 138544130;
        uint64_t v35 = v27;
        __int16 v36 = 2112;
        id v37 = v28;
        __int16 v38 = 2112;
        id v39 = v29;
        __int16 v40 = 2112;
        id v41 = v21;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Enabling local endpoint registration: %@ was successful: %@ error: %@", buf, 0x2Au);

        id v24 = v32;
      }

      [*(id *)(a1 + 48) reset];
      id v30 = _Block_copy(*(const void **)(a1 + 72));
      id v31 = v30;
      if (v30) {
        (*((void (**)(void *, id))v30 + 2))(v30, v21);
      }

      goto LABEL_24;
    }
    id v22 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v3 moc:*(void *)(a1 + 48) conditions:*(void *)(a1 + 64)];
    goto LABEL_19;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = *(id *)(a1 + 56);
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = HMFGetLogIdentifier();
    id v13 = [*(id *)(a1 + 32) uuid];
    char v14 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v12;
    __int16 v36 = 2112;
    id v37 = v13;
    __int16 v38 = 2112;
    id v39 = v14;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local endpoint registration to enable matching accessoryUUID: %@ and endpointID: %@", buf, 0x20u);
  }
  id v5 = (void (**)(void, void))_Block_copy(*(const void **)(a1 + 72));
  if (v5)
  {
    id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    ((void (**)(void, void *))v5)[2](v5, v7);
LABEL_25:
  }
}

- (id)bulletinBoardNotificationForAccessory:(id)a3 endpointID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v9 = [v6 home];
  id v10 = [v9 uuid];
  id v11 = [v8 uuid];
  char v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
    id v24 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);
    _Unwind_Resume(v24);
  }
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v35 = 0;
  __int16 v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__131992;
  id v39 = __Block_byref_object_dispose__131993;
  id v40 = 0;
  id v13 = [v8 backingStore];
  char v14 = [v13 context];

  id v15 = [v14 managedObjectContext];
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __100__HMDAccessoryBulletinNotificationManager_Matter__bulletinBoardNotificationForAccessory_endpointID___block_invoke;
  uint64_t v28 = &unk_264A25410;
  id v16 = v6;
  id v29 = v16;
  id v17 = v7;
  id v30 = v17;
  id v18 = v15;
  id v33 = &v41;
  id v34 = &v35;
  id v31 = v18;
  id v32 = self;
  [v18 performBlockAndWait:&v25];
  id v19 = [HMDMatterBulletinBoardNotification alloc];
  id v20 = -[HMDMatterBulletinBoardNotification initWithAccessory:endpointID:enabled:condition:](v19, "initWithAccessory:endpointID:enabled:condition:", v16, v17, *((unsigned __int8 *)v42 + 24), v36[5], v25, v26, v27, v28);
  id v21 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  id v22 = [v16 msgDispatcher];
  [(HMDMatterBulletinBoardNotification *)v20 configureWithWorkQueue:v21 messageDispatcher:v22];

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v20;
}

void __100__HMDAccessoryBulletinNotificationManager_Matter__bulletinBoardNotificationForAccessory_endpointID___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[MKFLocalBulletinEndpointRegistration fetchEndpointRegistrationForAccessoryUUID:v2 endpointID:*(void *)(a1 + 40) managedObjectContext:*(void *)(a1 + 48)];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 enabled];
    int v4 = +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
    uint64_t v5 = [v4 predicate];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 56);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      char v12 = +[HMDBulletinNotificationRegistrationUtilities endpointRegistrationFromLocalRegistration:v3];
      __int16 v36 = v3;
      id v13 = v8;
      id v15 = *(void **)(a1 + 32);
      char v14 = *(void **)(a1 + 40);
      id v16 = HMFBooleanToString();
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138544642;
      id v39 = v11;
      __int16 v40 = 2112;
      uint64_t v41 = v12;
      __int16 v42 = 2112;
      uint64_t v43 = v15;
      __int16 v44 = 2112;
      id v45 = v14;
      id v8 = v13;
      id v3 = v36;
      __int16 v46 = 2112;
      __int16 v47 = v16;
      __int16 v48 = 2112;
      uint64_t v49 = v17;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Found local registration: %@ for accessory=%@/endpointID=%@, setting enabled: %@ condition: %@", buf, 0x3Eu);
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 56);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      id v22 = *(void **)(a1 + 32);
      id v23 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      id v39 = v21;
      __int16 v40 = 2112;
      uint64_t v41 = v22;
      __int16 v42 = 2112;
      uint64_t v43 = v23;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not find any local registrations matching accessory=%@/endpointID=%@ for bulletin board notification, creating initial registration now", buf, 0x20u);
    }
    id v24 = (void *)MEMORY[0x263EFF240];
    uint64_t v25 = +[MKFLocalBulletinEndpointRegistration entity];
    uint64_t v26 = [v25 name];
    int v4 = [v24 insertNewObjectForEntityForName:v26 inManagedObjectContext:*(void *)(a1 + 48)];

    uint64_t v27 = [*(id *)(a1 + 32) uuid];
    [v4 setAccessoryModelID:v27];

    [v4 setEndpointID:*(void *)(a1 + 40)];
    uint64_t v28 = [MEMORY[0x263EFFA08] set];
    [v4 setConditions:v28];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    [v4 setEnabled:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    id v29 = *(void **)(a1 + 48);
    id v37 = 0;
    [v29 save:&v37];
    id v30 = v37;
    id v31 = (void *)MEMORY[0x230FBD990]();
    id v32 = *(id *)(a1 + 56);
    id v33 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = HMFGetLogIdentifier();
      uint64_t v35 = HMFBooleanToString();
      *(_DWORD *)buf = 138544130;
      id v39 = v34;
      __int16 v40 = 2112;
      uint64_t v41 = v4;
      __int16 v42 = 2112;
      uint64_t v43 = v35;
      __int16 v44 = 2112;
      id v45 = v30;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Saving initial local registration: %@ for bulletin board notification was successful: %@ error: %@", buf, 0x2Au);
    }
    [*(id *)(a1 + 48) reset];
  }
}

- (NSArray)matterRegistrations
{
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__131992;
  uint64_t v17 = __Block_byref_object_dispose__131993;
  id v18 = (id)MEMORY[0x263EFFA68];
  id v3 = [(HMDAccessoryBulletinNotificationManager *)self home];
  int v4 = [v3 backingStore];
  uint64_t v5 = [v4 context];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke;
  v9[3] = &unk_264A2F698;
  id v6 = v3;
  id v10 = v6;
  id v11 = self;
  char v12 = &v13;
  [v5 unsafeSynchronousBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v7;
}

void __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = [*(id *)(a1 + 32) uuid];
  int v4 = +[HMCContext findHomeWithModelID:v3];

  uint64_t v5 = [v4 users];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_2;
  v18[3] = &unk_264A24B30;
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v19 = v6;
  uint64_t v20 = v7;
  objc_msgSend(v5, "na_each:", v18);

  id v8 = [v4 guests];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_3;
  v15[3] = &unk_264A24B58;
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = v6;
  uint64_t v17 = v9;
  id v10 = v6;
  objc_msgSend(v8, "na_each:", v15);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_4;
  v14[3] = &unk_264A208A8;
  v14[4] = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend(v10, "na_map:", v14);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = [a2 bulletinRegistrations];
  int v4 = [v3 _matterRegistrationsFromBulletinRegistrations:v5];
  [v2 addObjectsFromArray:v4];
}

void __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = [a2 bulletinRegistrations];
  int v4 = [v3 _matterRegistrationsFromBulletinRegistrations:v5];
  [v2 addObjectsFromArray:v4];
}

id __70__HMDAccessoryBulletinNotificationManager_Matter__matterRegistrations__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) matterRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)_matterRegistrationsFromBulletinRegistrations:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __97__HMDAccessoryBulletinNotificationManager_Matter___matterRegistrationsFromBulletinRegistrations___block_invoke;
  v8[3] = &unk_264A24B08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "na_each:", v8);

  return v6;
}

void __97__HMDAccessoryBulletinNotificationManager_Matter___matterRegistrationsFromBulletinRegistrations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 castIfMatterBulletinRegistration];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

+ (id)matterBulletinRegistrationsForSource:(id)a3 context:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  id v6 = +[_MKFMatterBulletinRegistration fetchRequest];
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [v5 userUUID];
  id v9 = [v5 deviceAddress];
  id v10 = [v9 idsIdentifier];
  uint64_t v11 = [v5 deviceAddress];
  int v12 = [v11 idsDestination];
  uint64_t v13 = [v7 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v8, @"deviceIdsIdentifier", v10, @"deviceIdsDestination", v12];

  [v6 setPredicate:v13];
  __int16 v14 = (void *)MEMORY[0x263F08A98];
  id v15 = [v5 userUUID];
  uint64_t v16 = [v5 deviceAddress];
  uint64_t v17 = [v16 idsIdentifier];
  id v18 = [v5 deviceAddress];
  id v19 = [v18 idsDestination];
  uint64_t v20 = [v14 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"guest.modelID", v15, @"deviceIdsIdentifier", v17, @"deviceIdsDestination", v19];

  id v21 = (void *)v20;
  id v22 = (void *)MEMORY[0x263F08730];
  v41[0] = v13;
  v41[1] = v20;
  id v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  id v24 = [v22 orPredicateWithSubpredicates:v23];
  [v6 setPredicate:v24];

  id v36 = 0;
  uint64_t v25 = [v35 executeFetchRequest:v6 error:&v36];
  id v26 = v36;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v33 = v21;
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = a1;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v38 = v31;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Matter bulletin registrations for source: %@", buf, 0x16u);
    }
    id v27 = (id)MEMORY[0x263EFFA68];
    id v21 = v33;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentPrimary:(BOOL)a3
{
  self->_currentPrimary = a3;
}

- (BOOL)currentPrimary
{
  return self->_currentPrimary;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v3 = [v2 uuid];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];

  if (v6 == v4)
  {
    uint64_t v11 = [(HMDAccessoryBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
    [v11 suspend];

    [(HMDAccessoryBulletinNotificationManager *)self _synchronizeLocalRegistrationsWithPrimaryResident];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__HMDAccessoryBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __91__HMDAccessoryBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCurrentDeviceOrAccountUpdatedNotification:*(void *)(a1 + 40)];
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __83__HMDAccessoryBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __83__HMDAccessoryBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePrimaryResidentUpdateNotification:*(void *)(a1 + 40)];
}

- (id)_accessoryRegistrationFromMKFRegistrationSafe:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 characteristic];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 service];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 accessory];
      if (v9)
      {
        id v10 = [v6 instanceID];
        if (v10)
        {
          uint64_t v11 = [v8 instanceID];
          if (v11)
          {
            int v12 = [v9 modelID];
            if (v12)
            {
              uint64_t v13 = +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromMKFRegistration:v4];
            }
            else
            {
              id v34 = (void *)MEMORY[0x230FBD990]();
              id v35 = self;
              id v36 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                HMFGetLogIdentifier();
                id v37 = v39 = v34;
                *(_DWORD *)buf = 138543618;
                uint64_t v41 = v37;
                __int16 v42 = 2112;
                id v43 = v4;
                _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_FAULT, "%{public}@Nil accessoryUUID for working store registration: %@", buf, 0x16u);

                id v34 = v39;
              }

              uint64_t v13 = 0;
            }
          }
          else
          {
            id v30 = (void *)MEMORY[0x230FBD990]();
            id v31 = self;
            id v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              id v33 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              uint64_t v41 = v33;
              __int16 v42 = 2112;
              id v43 = v4;
              _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_FAULT, "%{public}@Nil serviceInstanceID for working store registration: %@", buf, 0x16u);
            }
            uint64_t v13 = 0;
          }
        }
        else
        {
          id v26 = (void *)MEMORY[0x230FBD990]();
          id v27 = self;
          uint64_t v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          {
            id v29 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v29;
            __int16 v42 = 2112;
            id v43 = v4;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_FAULT, "%{public}@Nil characteristicInstanceID for working store registration: %@", buf, 0x16u);
          }
          uint64_t v13 = 0;
        }
      }
      else
      {
        id v22 = (void *)MEMORY[0x230FBD990]();
        id v23 = self;
        id v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          uint64_t v25 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v41 = v25;
          __int16 v42 = 2112;
          id v43 = v4;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfHAPAccessory for working store registration: %@", buf, 0x16u);
        }
        uint64_t v13 = 0;
      }
    }
    else
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
      id v19 = self;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v21;
        __int16 v42 = 2112;
        id v43 = v4;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfService for working store registration: %@", buf, 0x16u);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = self;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v17;
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_FAULT, "%{public}@Nil mkfCharacteristic for working store registration: %@", buf, 0x16u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_mkfLocalServiceRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self currentHomeAccessoryUUIDs];
  id v6 = +[MKFLocalBulletinServiceRegistration fetchRequest];
  id v17 = 0;
  uint64_t v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97__HMDAccessoryBulletinNotificationManager__mkfLocalServiceRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A24F08;
    id v16 = v5;
    id v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service registrations, error: %@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __97__HMDAccessoryBulletinNotificationManager__mkfLocalServiceRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_mkfLocalCharacteristicRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self currentHomeAccessoryUUIDs];
  id v6 = +[MKFLocalBulletinCharacteristicRegistration fetchRequest];
  id v17 = 0;
  uint64_t v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __104__HMDAccessoryBulletinNotificationManager__mkfLocalCharacteristicRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A24EE0;
    id v16 = v5;
    id v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    uint64_t v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local characteristic registrations, error: %@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __104__HMDAccessoryBulletinNotificationManager__mkfLocalCharacteristicRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)currentHomeAccessoryUUIDs
{
  v2 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v3 = [v2 accessories];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_99_187298);

  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

id __68__HMDAccessoryBulletinNotificationManager_currentHomeAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 uuid];

  return v5;
}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);
  }
  uint64_t v13 = [(HMDAccessoryBulletinNotificationManager *)v10 home];
  if ([v13 bulletinNotificationsSupported])
  {
    uint64_t v14 = [(HMDAccessoryBulletinNotificationManager *)v10 source];
    id v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __119__HMDAccessoryBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_264A28C88;
      void v24[4] = v10;
      id v25 = v14;
      id v26 = v6;
      id v27 = v7;
      [v13 updateBulletinRegistrationOnPrimaryResidentWithSource:v25 enableRegistrations:v26 disableRegistration:v27 completionHandler:v24];
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v10;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v29 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v10;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v29 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);
    }
  }
}

void __119__HMDAccessoryBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v19 = 138544386;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      int v12 = "%{public}@Unable to update characteristic registrations on primary resident: source: %@, [enabled : %@], [di"
            "sabled : %@], error: %@";
      uint64_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 52;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v19, v15);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    int v19 = 138544130;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    int v12 = "%{public}@Updating characteristic registrations with primary resident was successful, source: %@, [enabled: %@"
          "], [disabled: %@]";
    uint64_t v13 = v7;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 42;
    goto LABEL_6;
  }
}

- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v10, 0xCu);
  }
  [(HMDAccessoryBulletinNotificationManager *)v7 requestSynchronizeRegistrations];
}

- (void)_handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification", (uint8_t *)&v17, 0xCu);
  }
  [(HMDAccessoryBulletinNotificationManager *)v7 requestSynchronizeRegistrations];
  int v10 = [(HMDAccessoryBulletinNotificationManager *)v7 home];
  int v11 = [v10 isCurrentDeviceConfirmedPrimaryResident];

  BOOL v12 = [(HMDAccessoryBulletinNotificationManager *)v7 currentPrimary];
  if (v11)
  {
    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v14 = v7;
      uint32_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@We are already the primary", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      [(HMDAccessoryBulletinNotificationManager *)v7 _handleDeviceBecamePrimary];
    }
  }
  else if (v12)
  {
    [(HMDAccessoryBulletinNotificationManager *)v7 _handleDeviceBecameNotPrimary];
  }
}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);
  }
  id v8 = [(HMDAccessoryBulletinNotificationManager *)v5 source];
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v92 = 0x3032000000;
    v93 = __Block_byref_object_copy__187312;
    v94 = __Block_byref_object_dispose__187313;
    id v95 = [MEMORY[0x263EFF9C0] set];
    __int16 v48 = [(HMDAccessoryBulletinNotificationManager *)v5 home];
    uint64_t v9 = [v48 backingStore];
    int v10 = [v9 context];

    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v77[3] = &unk_264A2F000;
    v77[4] = v5;
    id v11 = v8;
    id v78 = v11;
    id v12 = v10;
    id v79 = v12;
    p_long long buf = &buf;
    [v12 unsafeSynchronousBlock:v77];
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__187312;
    v75 = __Block_byref_object_dispose__187313;
    id v76 = [MEMORY[0x263EFF9C0] set];
    uint64_t v13 = [v12 managedObjectContext];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_81;
    v68[3] = &unk_264A2F698;
    v68[4] = v5;
    id v14 = v13;
    id v69 = v14;
    v70 = &v71;
    uint32_t v15 = (void *)MEMORY[0x230FBD990]([v14 performBlockAndWait:v68]);
    uint64_t v16 = v5;
    HMFGetOSLogHandle();
    int v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = v72[5];
      __int16 v20 = *(uint64_t (**)(uint64_t, uint64_t))(*((void *)&buf + 1) + 40);
      *(_DWORD *)v87 = 138543874;
      *(void *)&v87[4] = v18;
      *(_WORD *)&v87[12] = 2112;
      *(void *)&v87[14] = v19;
      *(_WORD *)&v87[22] = 2112;
      v88 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Enabled local characteristic registrations: %@ remote characteristic registrations: %@", v87, 0x20u);
    }
    *(void *)v87 = 0;
    *(void *)&v87[8] = v87;
    *(void *)&v87[16] = 0x3032000000;
    v88 = __Block_byref_object_copy__187312;
    v89 = __Block_byref_object_dispose__187313;
    id v90 = [MEMORY[0x263EFF9C0] set];
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__187312;
    v66 = __Block_byref_object_dispose__187313;
    id v67 = [MEMORY[0x263EFF9C0] set];
    __int16 v21 = +[HMDCoreData featuresDataSource];
    int v22 = [v21 isRVCEnabled];

    if (v22)
    {
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_85;
      v58[3] = &unk_264A2F000;
      v58[4] = v16;
      id v59 = v11;
      id v60 = v12;
      v61 = v87;
      [v60 unsafeSynchronousBlock:v58];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_88;
      v55[3] = &unk_264A2F698;
      v55[4] = v16;
      id v56 = v14;
      uint64_t v57 = &v62;
      __int16 v23 = (void *)MEMORY[0x230FBD990]([v56 performBlockAndWait:v55]);
      uint64_t v24 = v16;
      HMFGetOSLogHandle();
      __int16 v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = v63[5];
        uint64_t v28 = *(void *)(*(void *)&v87[8] + 40);
        *(_DWORD *)v81 = 138543874;
        v82 = v26;
        __int16 v83 = 2112;
        uint64_t v84 = v27;
        __int16 v85 = 2112;
        uint64_t v86 = v28;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Enabled local Matter registrations: %@ remote Matter registrations: %@", v81, 0x20u);
      }
    }
    uint64_t v29 = [MEMORY[0x263EFF9C0] set];
    __int16 v30 = (void *)v72[5];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_91;
    v52[3] = &unk_264A24E48;
    v54 = &buf;
    id v31 = v29;
    id v53 = v31;
    objc_msgSend(v30, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);
    __int16 v32 = +[HMDCoreData featuresDataSource];
    int v33 = [v32 isRVCEnabled];

    if (v33)
    {
      uint64_t v34 = (void *)v63[5];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3;
      v49[3] = &unk_264A24E98;
      __int16 v51 = v87;
      id v50 = v31;
      objc_msgSend(v34, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v49);
    }
    id v35 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(*((void *)&buf + 1) + 40)];
    id v36 = +[HMDCoreData featuresDataSource];
    int v37 = [v36 isRVCEnabled];

    if (v37)
    {
      uint64_t v38 = [v35 setByAddingObjectsFromSet:*(void *)(*(void *)&v87[8] + 40)];

      id v35 = (void *)v38;
    }
    if (objc_msgSend(v31, "hmf_isEmpty") && objc_msgSend(v35, "hmf_isEmpty"))
    {
      __int16 v39 = (void *)MEMORY[0x230FBD990]();
      id v40 = v16;
      HMFGetOSLogHandle();
      uint64_t v41 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        __int16 v42 = HMFGetLogIdentifier();
        *(_DWORD *)v81 = 138543362;
        v82 = v42;
        _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v81, 0xCu);
      }
    }
    else
    {
      id v43 = (void *)[v31 copy];
      [(HMDAccessoryBulletinNotificationManager *)v16 _updateRegistrationsOnPrimaryWithEnabledRegistrations:v43 disabledRegistrations:v35];
    }
    _Block_object_dispose(&v62, 8);

    _Block_object_dispose(v87, 8);
    _Block_object_dispose(&v71, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v44 = (void *)MEMORY[0x230FBD990]();
    id v45 = v5;
    __int16 v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      __int16 v47 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v47;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  id v5 = [v2 _characteristicBulletinRegistrationsForSource:v3 context:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v7[3] = &unk_264A24D80;
  uint64_t v6 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v6;
  objc_msgSend(v5, "na_each:", v7);
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_81(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _mkfLocalCharacteristicRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_82;
  v3[3] = &unk_264A24DA8;
  v3[4] = *(void *)(a1 + 48);
  objc_msgSend(v2, "na_each:", v3);
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_85(uint64_t a1)
{
  id v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  id v5 = [v2 matterBulletinRegistrationsForSource:v3 context:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_86;
  v7[3] = &unk_264A24DD0;
  uint64_t v6 = *(void *)(a1 + 56);
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v6;
  objc_msgSend(v5, "na_each:", v7);
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mkfLocalMatterRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_89;
  v4[3] = &unk_264A24DF8;
  uint64_t v3 = *(void *)(a1 + 48);
  v4[4] = *(void *)(a1 + 32);
  v4[5] = v3;
  objc_msgSend(v2, "na_each:", v4);
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_91(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_92;
  v7[3] = &unk_264A24E20;
  id v5 = v3;
  id v8 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6)
  {
    if (([v5 isEqual:v6] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4;
  v7[3] = &unk_264A24E70;
  id v5 = v3;
  id v8 = v5;
  uint64_t v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6)
  {
    if (([v5 isEqual:v6] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 matterPaths];
  id v4 = [*(id *)(a1 + 32) matterPaths];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v3 containsObject:v5];

  return v6;
}

uint64_t __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_92(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessoryUUID];
  id v5 = [*(id *)(a1 + 32) accessoryUUID];
  if ([v4 isEqual:v5])
  {
    uint64_t v6 = [v3 serviceInstanceID];
    id v7 = [*(id *)(a1 + 32) serviceInstanceID];
    if ([v6 isEqual:v7])
    {
      id v8 = [v3 characteristicInstanceID];
      uint64_t v9 = [*(id *)(a1 + 32) characteristicInstanceID];
      uint64_t v10 = [v8 isEqual:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_89(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 enabled])
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = +[HMDBulletinNotificationRegistrationUtilities matterRegistrationFromLocalRegistration:v5 home:v3];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_86(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) matterRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v4 registration];
    [v6 addObject:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store Matter registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_82(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 enabled])
  {
    id v3 = +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromLocalRegistration:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __92__HMDAccessoryBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _accessoryRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v4 registration];
    [v6 addObject:v7];
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store characteristic registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)requestSynchronizeRegistrations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = [(HMDAccessoryBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
    [v7 isRunning];
    id v8 = HMFBooleanToString();
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = [(HMDAccessoryBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
  [v9 resume];
}

- (void)_handleDeviceBecameNotPrimary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became non-primary resident", buf, 0xCu);
  }
  [(HMDAccessoryBulletinNotificationManager *)v5 setCurrentPrimary:0];
  id v8 = [(HMDAccessoryBulletinNotificationManager *)v5 accessoryRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__HMDAccessoryBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke;
  v9[3] = &unk_264A24CE0;
  void v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);
}

uint64_t __72__HMDAccessoryBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAccessoryBulletinNotificationRegistration:a2 removed:1];
}

- (void)_handleDeviceBecamePrimary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became primary resident", buf, 0xCu);
  }
  [(HMDAccessoryBulletinNotificationManager *)v5 setCurrentPrimary:1];
  id v8 = [(HMDAccessoryBulletinNotificationManager *)v5 accessoryRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HMDAccessoryBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke;
  v9[3] = &unk_264A24CE0;
  void v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);
}

uint64_t __69__HMDAccessoryBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAccessoryBulletinNotificationRegistration:a2 removed:0];
}

- (void)_handleAccessoryBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 registration];
  id v8 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v9 = [v8 hapAccessories];
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  id v31 = __100__HMDAccessoryBulletinNotificationManager__handleAccessoryBulletinNotificationRegistration_removed___block_invoke;
  __int16 v32 = &unk_264A28A10;
  id v10 = v7;
  id v33 = v10;
  id v11 = objc_msgSend(v9, "na_firstObjectPassingTest:", &v29);

  if (v11)
  {
    uint64_t v16 = objc_msgSend(v10, "characteristicInstanceID", v29, v30, v31, v32);
    int v17 = [v11 hmdCharacteristicForInstanceId:v16];

    if (v17)
    {
      BOOL v18 = !v4;
      uint64_t v34 = v17;
      uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
      [v11 setNotificationsEnabled:v18 forCharacteristics:v19 clientIdentifier:@"com.apple.HomeKitDaemon.bulletinNotificationManager"];
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      __int16 v25 = self;
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        uint64_t v28 = [v10 characteristicInstanceID];
        *(_DWORD *)long long buf = 138544130;
        id v36 = v27;
        __int16 v37 = 2112;
        id v38 = v28;
        __int16 v39 = 2112;
        id v40 = v11;
        __int16 v41 = 2112;
        id v42 = v10;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to find characteristic with instance ID: %@ on accessory: %@ and registration: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    __int16 v20 = (void *)MEMORY[0x230FBD990](v12, v13, v14, v15);
    __int16 v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v36 = v23;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP Accessory from registration: %@", buf, 0x16u);
    }
  }
}

uint64_t __100__HMDAccessoryBulletinNotificationManager__handleAccessoryBulletinNotificationRegistration_removed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  BOOL v4 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (id)_updateReasonsByCharacteristicFromMessage:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v45 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  __int16 v32 = v3;
  [v3 dictionaryForKey:@"kCharacteristicNotificationsKey"];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v56;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v4;
        uint64_t v5 = *(void *)(*((void *)&v55 + 1) + 8 * v4);
        uint64_t v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
        id v7 = [(HMDAccessoryBulletinNotificationManager *)self home];
        __int16 v37 = (void *)v6;
        id v8 = [v7 accessoryWithUUID:v6];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }
        id v10 = v9;

        __int16 v46 = v10;
        if (v10)
        {
          id v11 = objc_msgSend(obj, "hmf_dictionaryForKey:", v5);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v52;
            uint64_t v39 = *(void *)v52;
            id v40 = v11;
            do
            {
              uint64_t v15 = 0;
              uint64_t v41 = v13;
              do
              {
                if (*(void *)v52 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = objc_msgSend(v11, "hmf_dictionaryForKey:", *(void *)(*((void *)&v51 + 1) + 8 * v15));
                int v17 = HAPInstanceIDFromValue();
                BOOL v18 = [v46 findService:v17];
                if (v16) {
                  BOOL v19 = v18 == 0;
                }
                else {
                  BOOL v19 = 1;
                }
                if (!v19)
                {
                  id v42 = v18;
                  uint64_t v43 = v16;
                  uint64_t v44 = v15;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v47 = 0u;
                  long long v48 = 0u;
                  id v20 = v16;
                  uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v59 count:16];
                  if (v21)
                  {
                    uint64_t v22 = v21;
                    uint64_t v23 = *(void *)v48;
                    do
                    {
                      for (uint64_t i = 0; i != v22; ++i)
                      {
                        if (*(void *)v48 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        uint64_t v25 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                        uint64_t v26 = HAPInstanceIDFromValue();
                        uint64_t v27 = [v46 findCharacteristic:v26 forService:v17];
                        if (v27)
                        {
                          uint64_t v28 = objc_msgSend(v20, "hmf_dictionaryForKey:", v25);
                          uint64_t v29 = [v28 objectForKey:@"kCharacteristicValueUpdateReasonKey"];

                          if (v29)
                          {
                            uint64_t v30 = objc_msgSend(v28, "hmf_numberForKey:", @"kCharacteristicValueUpdateReasonKey");
                            [v45 setObject:v30 forKey:v27];
                          }
                        }
                      }
                      uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v59 count:16];
                    }
                    while (v22);
                  }

                  uint64_t v14 = v39;
                  id v11 = v40;
                  uint64_t v13 = v41;
                  BOOL v18 = v42;
                  uint64_t v16 = v43;
                  uint64_t v15 = v44;
                }

                ++v15;
              }
              while (v15 != v13);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v51 objects:v60 count:16];
            }
            while (v13);
          }
        }
        uint64_t v4 = v38 + 1;
      }
      while (v38 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v35);
  }

  return v45;
}

- (id)_characteristicsWithPassingLocalRegistrationForCharacteristics:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __106__HMDAccessoryBulletinNotificationManager__characteristicsWithPassingLocalRegistrationForCharacteristics___block_invoke;
  uint64_t v13 = &unk_264A28320;
  uint64_t v14 = self;
  id v15 = v6;
  id v7 = v6;
  objc_msgSend(v5, "na_each:", &v10);

  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __106__HMDAccessoryBulletinNotificationManager__characteristicsWithPassingLocalRegistrationForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [v11 service];
  uint64_t v4 = [v3 bulletinBoardNotification];

  if ([v4 isEnabled])
  {
    id v5 = [v4 condition];
    uint64_t v6 = +[HMDNotificationConditionConverter conditionsFromPredicate:v5];

    id v7 = [*(id *)(a1 + 32) evaluator];
    id v8 = [*(id *)(a1 + 32) home];
    id v9 = [v8 currentUser];
    int v10 = [v7 conditionsPass:v6 registrationUser:v9];

    if (v10) {
      [*(id *)(a1 + 40) addObject:v11];
    }
  }
}

- (id)_devicesToNotifyForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = [(HMDAccessoryBulletinNotificationManager *)self accessoryBulletinNotificationRegistrationsForCharacteristic:v4];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__HMDAccessoryBulletinNotificationManager__devicesToNotifyForCharacteristic___block_invoke;
  v11[3] = &unk_264A24D58;
  void v11[4] = self;
  id v12 = v4;
  id v13 = v5;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend(v6, "na_each:", v11);
  id v9 = (void *)[v7 copy];

  return v9;
}

void __77__HMDAccessoryBulletinNotificationManager__devicesToNotifyForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 registration];
  id v5 = [v3 source];
  uint64_t v6 = [*(id *)(a1 + 32) home];
  id v7 = [v5 userUUID];
  id v8 = [v6 userWithUUID:v7];

  if (!v8)
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      uint64_t v34 = v27;
      __int16 v35 = 2112;
      id v36 = v4;
      __int16 v37 = 2112;
      id v38 = v5;
      uint64_t v28 = "%{public}@Unable to evaluate registration: %@, no matching user for source: %@";
      uint64_t v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      uint32_t v31 = 32;
LABEL_13:
      _os_log_impl(&dword_22F52A000, v29, v30, v28, buf, v31);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (([v8 isAccessCurrentlyAllowedBySchedule] & 1) == 0)
  {
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    uint64_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      uint64_t v34 = v27;
      uint64_t v28 = "%{public}@Cannot send the notification as the user is outside schedule";
      uint64_t v29 = v26;
      os_log_type_t v30 = OS_LOG_TYPE_INFO;
      uint32_t v31 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v9 = [*(id *)(a1 + 32) evaluator];
  int v10 = [v4 conditions];
  int v11 = [v9 conditionsPass:v10 registrationUser:v8];

  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = __int16 v32 = v4;
    uint64_t v16 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v34 = v15;
    __int16 v35 = 2112;
    id v36 = v16;
    __int16 v37 = 2112;
    id v38 = v3;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Condition(s) passed: %@ for registration: %@", buf, 0x20u);

    id v4 = v32;
  }

  if (v11)
  {
    int v17 = [v3 source];
    BOOL v18 = [v17 device];

    BOOL v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 32);
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      uint64_t v23 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v34 = v22;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2112;
      id v38 = v23;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Adding remote device: %@ to notify for updated characteristic: %@ ", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v18];
  }
LABEL_15:
}

- (void)handleRemovedAccessory:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed accessory: %@", buf, 0x16u);
  }
  id v9 = [v4 uuid];
  int v10 = [(HMDAccessoryBulletinNotificationManager *)v6 home];
  int v11 = [v10 backingStore];
  id v12 = [v11 context];

  id v13 = [v12 managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke;
  v18[3] = &unk_264A2E908;
  id v19 = v9;
  id v20 = v13;
  uint64_t v21 = v6;
  id v22 = v4;
  id v23 = v12;
  id v14 = v12;
  id v15 = v4;
  id v16 = v13;
  id v17 = v9;
  [v14 unsafeSynchronousBlock:v18];
}

void __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v2 = +[MKFLocalBulletinAccessoryRegistration fetchRequest];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"accessoryModelID", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];
  id v4 = [*(id *)(a1 + 40) executeFetchRequest:v2 error:0];
  if (v4)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke_56;
    v24[3] = &unk_264A24D30;
    id v5 = *(void **)(a1 + 56);
    void v24[4] = *(void *)(a1 + 48);
    id v25 = v5;
    id v26 = *(id *)(a1 + 40);
    objc_msgSend(v4, "na_each:", v24);
    uint64_t v6 = *(void **)(a1 + 64);
    id v23 = 0;
    [v6 save:&v23];
    id v7 = v23;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 48);
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      id v12 = v7;
      id v13 = v2;
      id v14 = v8;
      id v15 = v3;
      uint64_t v16 = *(void *)(a1 + 56);
      id v17 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138544130;
      uint64_t v28 = v11;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      id v3 = v15;
      id v8 = v14;
      id v2 = v13;
      id v7 = v12;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing local registrations for removed accessory: %@ was successful: %@ error: %@", buf, 0x2Au);
    }
  }
  else
  {
    BOOL v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 48);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = *(void *)(a1 + 56);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Did not find any local registrations to remove for removed accessory: %@", buf, 0x16u);
    }
  }
}

void __66__HMDAccessoryBulletinNotificationManager_handleRemovedAccessory___block_invoke_56(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    int v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing local registration: %@ for removed accessory: %@", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 48) deleteObject:v3];
}

- (void)handleRemovedService:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed service: %@", buf, 0x16u);
  }
  int v9 = [v4 accessory];
  int v10 = [v9 uuid];

  __int16 v11 = [(HMDAccessoryBulletinNotificationManager *)v6 home];
  id v12 = [v11 backingStore];
  __int16 v13 = [v12 context];

  uint64_t v14 = [v13 managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke;
  v18[3] = &unk_264A2E610;
  id v19 = v10;
  id v20 = v4;
  id v21 = v14;
  uint64_t v22 = v6;
  id v15 = v14;
  id v16 = v4;
  id v17 = v10;
  [v15 performBlock:v18];
}

void __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  id v3 = [a1[5] instanceID];
  id v4 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v2 serviceInstanceID:v3 managedObjectContext:a1[6]];

  if (v4)
  {
    id v5 = [a1[5] characteristics];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke_46;
    v22[3] = &unk_264A24D08;
    id v23 = a1[4];
    id v24 = a1[5];
    id v6 = a1[6];
    id v7 = a1[7];
    id v25 = v6;
    id v26 = v7;
    objc_msgSend(v5, "na_each:", v22);

    [a1[6] deleteObject:v4];
    id v8 = a1[6];
    id v21 = 0;
    [v8 save:&v21];
    id v9 = v21;
    int v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1[7];
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = HMFGetLogIdentifier();
      id v14 = a1[5];
      id v15 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138544386;
      uint64_t v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v4;
      __int16 v31 = 2112;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v15;
      __int16 v35 = 2112;
      id v36 = v9;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing local service registration: %@ for removed service: %@ was successful: %@ error: %@", buf, 0x34u);
    }
    [a1[6] reset];
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1[7];
    BOOL v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      id v20 = a1[5];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      uint64_t v30 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to match removed service: %@", buf, 0x16u);
    }
  }
}

void __64__HMDAccessoryBulletinNotificationManager_handleRemovedService___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) instanceID];
  id v6 = [v3 instanceID];
  id v7 = +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:v4 serviceInstanceID:v5 characteristicInstanceID:v6 managedObjectContext:*(void *)(a1 + 48)];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 56);
  int v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      id v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v15 = 138544130;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v3;
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing local characteristic registration: %@ for characteristic: %@ on removed service: %@", (uint8_t *)&v15, 0x2Au);
    }
    [*(id *)(a1 + 48) deleteObject:v7];
  }
  else
  {
    if (v11)
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      id v16 = v14;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Did not find local characteristic registration to remove for characteristic: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)handleEnabledRegistrations:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke_2;
  v3[3] = &unk_264A24CE0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __70__HMDAccessoryBulletinNotificationManager_handleEnabledRegistrations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAccessoryBulletinNotificationRegistration:a2 removed:0];
}

- (void)handleDisabledRegistrations:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke_2;
  v3[3] = &unk_264A24CE0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return objc_msgSend(v1, "na_each:", v3);
}

uint64_t __71__HMDAccessoryBulletinNotificationManager_handleDisabledRegistrations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleAccessoryBulletinNotificationRegistration:a2 removed:1];
}

- (id)conditionsFromPredicate:(id)a3
{
  return +[HMDNotificationConditionConverter conditionsFromPredicate:a3];
}

- (id)bulletinCharacteristicsFromChangedCharacteristics:(id)a3 message:(id)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    BOOL v11 = HMFGetLogIdentifier();
    id v12 = [v7 shortDescription];
    *(_DWORD *)long long buf = 138543874;
    v91 = v11;
    __int16 v92 = 2112;
    id v93 = v6;
    __int16 v94 = 2112;
    id v95 = v12;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Filtering bulletin characteristics from changed characteristics: %@ message: %@", buf, 0x20u);
  }
  if (![v6 count])
  {
    id v24 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_56;
  }
  uint64_t v13 = [(HMDAccessoryBulletinNotificationManager *)v9 home];
  if ([v13 isCurrentDeviceConfirmedPrimaryResident])
  {
    id v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = v9;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v91 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@We are the primary, evaluating registrations directly", buf, 0xCu);
    }
    id v18 = [(HMDAccessoryBulletinNotificationManager *)v15 _characteristicsWithPassingLocalRegistrationForCharacteristics:v6];
LABEL_8:
    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = v9;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v91 = v22;
      __int16 v92 = 2112;
      id v93 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Characteristics to show bulletins for: %@", buf, 0x16u);
    }
    id v23 = v18;
    id v24 = v23;
    goto LABEL_55;
  }
  if (!v7)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v47 = v6;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v81;
      while (2)
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v81 != v50) {
            objc_enumerationMutation(v47);
          }
          long long v52 = [*(id *)(*((void *)&v80 + 1) + 8 * i) accessory];
          if ([v52 isSecuritySessionOpen])
          {
            v61 = (void *)MEMORY[0x230FBD990]();
            uint64_t v62 = v9;
            v63 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              uint64_t v64 = HMFGetLogIdentifier();
              v65 = [v52 shortDescription];
              *(_DWORD *)long long buf = 138543618;
              v91 = v64;
              __int16 v92 = 2112;
              id v93 = v65;
              _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_INFO, "%{public}@Nil message & not primary, directly connected to accessory: %@, should fall back to legacy evaluation", buf, 0x16u);
            }

            goto LABEL_54;
          }
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v80 objects:v88 count:16];
        if (v49) {
          continue;
        }
        break;
      }
    }

    long long v53 = (void *)MEMORY[0x230FBD990]();
    long long v54 = v9;
    long long v55 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      long long v56 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v91 = v56;
      _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Nil message & not primary, should not show bulletins", buf, 0xCu);
    }
    id v23 = (id)MEMORY[0x263EFFA68];
    id v24 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_55;
  }
  id v25 = [v7 name];
  char v26 = [v25 isEqual:@"kCharacterisiticsChangedInternalNotificationKey"];

  if (v26)
  {
    uint64_t v27 = [(HMDAccessoryBulletinNotificationManager *)v9 _updateReasonsByCharacteristicFromMessage:v7];
    if ([v27 count])
    {
      uint64_t v71 = v13;
      id v72 = v7;
      [MEMORY[0x263EFF980] array];
      v74 = id v73 = v6;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      id obj = v6;
      uint64_t v79 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (v79)
      {
        uint64_t v28 = *(void *)v85;
        v75 = v27;
        id v76 = v9;
        uint64_t v77 = *(void *)v85;
        do
        {
          for (uint64_t j = 0; j != v79; ++j)
          {
            if (*(void *)v85 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v30 = *(void **)(*((void *)&v84 + 1) + 8 * j);
            __int16 v31 = [v27 objectForKey:v30];
            char v32 = [v31 unsignedIntegerValue];
            __int16 v33 = [v30 service];
            id v34 = [v33 bulletinBoardNotification];
            int v35 = [v34 isEnabled];

            if (v35)
            {
              id v36 = (void *)MEMORY[0x230FBD990]();
              uint64_t v37 = v9;
              id v38 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                uint64_t v39 = HMFGetLogIdentifier();
                id v40 = [v30 shortDescription];
                *(_DWORD *)long long buf = 138543618;
                v91 = v39;
                __int16 v92 = 2112;
                id v93 = v40;
                _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Notification is enabled for characteristic %@", buf, 0x16u);

                uint64_t v27 = v75;
                id v9 = v76;
              }

              uint64_t v41 = [v30 accessory];
              if ([v41 isSecuritySessionOpen]
                && [v30 isNotificationEnabled])
              {
                id v42 = (void *)MEMORY[0x230FBD990]();
                uint64_t v43 = v37;
                uint64_t v44 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  id v45 = HMFGetLogIdentifier();
                  __int16 v46 = [v41 shortDescription];
                  *(_DWORD *)long long buf = 138543618;
                  v91 = v45;
                  __int16 v92 = 2112;
                  id v93 = v46;
                  _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Directly connected to accessory: %@ and notification enabled, ignoring remote characteristic change", buf, 0x16u);

                  id v9 = v76;
                  uint64_t v27 = v75;
                }
              }
              else if (v32)
              {
                [v74 addObject:v30];
              }

              uint64_t v28 = v77;
            }
          }
          uint64_t v79 = [obj countByEnumeratingWithState:&v84 objects:v89 count:16];
        }
        while (v79);
      }

      id v18 = (void *)[v74 copy];
      id v7 = v72;
      id v6 = v73;
      uint64_t v13 = v71;
      goto LABEL_8;
    }
    v66 = (void *)MEMORY[0x230FBD990]();
    id v67 = v9;
    v68 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      id v69 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v91 = v69;
      _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_INFO, "%{public}@Message missing update reasons change, should fall back to legacy evaluation", buf, 0xCu);
    }
  }
  else
  {
    long long v57 = (void *)MEMORY[0x230FBD990]();
    long long v58 = v9;
    id v59 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      id v60 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v91 = v60;
      _os_log_impl(&dword_22F52A000, v59, OS_LOG_TYPE_INFO, "%{public}@Message is not characteristics changed, should fall back to legacy evaluation", buf, 0xCu);
    }
  }
LABEL_54:
  id v24 = 0;
  id v23 = (id)MEMORY[0x263EFFA68];
LABEL_55:

LABEL_56:
  return v24;
}

- (id)characteristicsByDestinationForCharacteristics:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke;
  v10[3] = &unk_264A24CB8;
  v10[4] = self;
  id v7 = objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);

  id v8 = (void *)[v7 copy];
  return v8;
}

id __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) _devicesToNotifyForCharacteristic:v5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke_2;
  v13[3] = &unk_264A24C90;
  id v8 = v6;
  id v14 = v8;
  id v15 = v5;
  id v9 = v5;
  objc_msgSend(v7, "na_each:", v13);
  int v10 = v15;
  id v11 = v8;

  return v11;
}

void __90__HMDAccessoryBulletinNotificationManager_characteristicsByDestinationForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = [a2 remoteDestinationString];
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (!v3)
  {
    id v3 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
  [v3 addObject:*(void *)(a1 + 40)];
}

- (id)accessoryBulletinNotificationRegistrationsForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__187312;
  __int16 v19 = __Block_byref_object_dispose__187313;
  id v20 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke;
  v11[3] = &unk_264A2F698;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = self;
  id v14 = &v15;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) service];
  id v3 = [v2 uuid];

  id v4 = +[HMCContext findServiceWithModelID:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) instanceID];
    id v6 = +[HMCContext findCharacteristicWithInstanceID:v5 service:v4];

    if (v6)
    {
      id v7 = [v6 bulletinRegistrations];
      id v8 = v7;
      if (v7)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke_40;
        v22[3] = &unk_264A24B80;
        void v22[4] = *(void *)(a1 + 40);
        uint64_t v9 = objc_msgSend(v7, "na_map:", v22);
        uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = *(id *)(a1 + 40);
      __int16 v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        id v24 = v20;
        __int16 v25 = 2112;
        uint64_t v26 = v21;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 40);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      id v24 = v15;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch service for characteristic: %@", buf, 0x16u);
    }
  }
}

id __103__HMDAccessoryBulletinNotificationManager_accessoryBulletinNotificationRegistrationsForCharacteristic___block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _accessoryRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (void)updateRegistrationsWithEnabledCharacteristics:(id)a3 disabledCharacteristics:(id)a4 conditions:(id)a5 completion:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(HMDAccessoryBulletinNotificationManager *)self home];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke;
  v40[3] = &unk_264A24BF0;
  id v15 = v14;
  id v41 = v15;
  id v16 = v12;
  id v42 = v16;
  __int16 v31 = v10;
  uint64_t v17 = objc_msgSend(v10, "na_map:", v40);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2;
  v38[3] = &unk_264A24C18;
  id v18 = v15;
  id v39 = v18;
  __int16 v19 = objc_msgSend(v11, "na_map:", v38);
  id v20 = (void *)MEMORY[0x230FBD990]();
  uint64_t v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    id v23 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543874;
    uint64_t v44 = v23;
    __int16 v45 = 2112;
    __int16 v46 = v17;
    __int16 v47 = 2112;
    uint64_t v48 = v19;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic registrations enable: %@ disable: %@", buf, 0x20u);
  }
  id v24 = [v18 backingStore];
  __int16 v25 = [v24 context];

  uint64_t v26 = [v25 managedObjectContext];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_34;
  v32[3] = &unk_264A2DDC0;
  id v33 = v17;
  id v34 = v26;
  id v35 = v19;
  id v36 = v21;
  id v37 = v13;
  id v27 = v13;
  id v28 = v19;
  id v29 = v26;
  id v30 = v17;
  [v29 performBlock:v32];
}

HMDAccessoryBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessory];
  id v5 = [v4 home];
  id v6 = [v5 uuid];
  id v7 = [*(id *)(a1 + 32) uuid];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v4 uuid];
    id v10 = [v3 service];
    id v11 = [v10 instanceID];

    id v12 = [v3 instanceID];
    id v13 = [[HMDAccessoryBulletinNotificationRegistration alloc] initWithAccessoryUUID:v9 serviceInstanceID:v11 characteristicInstanceID:v12 conditions:*(void *)(a1 + 40)];

    return v13;
  }
  else
  {
    uint64_t v15 = _HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2(v15);
  }
}

HMDAccessoryBulletinNotificationRegistration *__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 accessory];
  id v5 = [v4 home];
  id v6 = [v5 uuid];
  id v7 = [*(id *)(a1 + 32) uuid];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v4 uuid];
    id v10 = [v3 service];
    id v11 = [v10 instanceID];

    id v12 = [v3 instanceID];
    id v13 = [HMDAccessoryBulletinNotificationRegistration alloc];
    __int16 v14 = [MEMORY[0x263EFFA08] set];
    uint64_t v15 = [(HMDAccessoryBulletinNotificationRegistration *)v13 initWithAccessoryUUID:v9 serviceInstanceID:v11 characteristicInstanceID:v12 conditions:v14];

    return v15;
  }
  else
  {
    uint64_t v17 = _HMFPreconditionFailure();
    return (HMDAccessoryBulletinNotificationRegistration *)__135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_34(v17);
  }
}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_34(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = [MEMORY[0x263EFF9C0] set];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2_36;
  v38[3] = &unk_264A24C40;
  id v4 = *(void **)(a1 + 32);
  id v39 = *(id *)(a1 + 40);
  id v5 = v2;
  id v40 = v5;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_3;
  v34[3] = &unk_264A24C68;
  id v6 = *(void **)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v35 = v7;
  uint64_t v36 = v8;
  id v9 = v3;
  id v37 = v9;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v34);
  if (objc_msgSend(v5, "hmf_isEmpty") && objc_msgSend(v9, "hmf_isEmpty"))
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 56);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      id v42 = v13;
      __int16 v43 = 2112;
      uint64_t v44 = v14;
      __int16 v45 = 2112;
      uint64_t v46 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating characteristic registrations enable: %@ disable: %@ resulted in no changes to local store, not saving and not messaging primary", buf, 0x20u);
    }
    uint64_t v16 = *(void *)(a1 + 64);
    if (v16) {
      (*(void (**)(uint64_t, void))(v16 + 16))(v16, 0);
    }
  }
  else
  {
    uint64_t v17 = *(void **)(a1 + 40);
    id v33 = 0;
    int v18 = [v17 save:&v33];
    id v19 = v33;
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 56);
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = id v30 = v5;
      id v24 = v9;
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(a1 + 48);
      HMFBooleanToString();
      v27 = int v31 = v18;
      *(_DWORD *)long long buf = 138544386;
      id v42 = v23;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      id v9 = v24;
      __int16 v45 = 2112;
      uint64_t v46 = v26;
      __int16 v47 = 2112;
      uint64_t v48 = v27;
      __int16 v49 = 2112;
      id v50 = v19;
      id v5 = v30;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating local characteristic registrations enable: %@ disable: %@ was successful: %@ error: %@", buf, 0x34u);

      int v18 = v31;
    }

    [*(id *)(a1 + 40) reset];
    if (v18)
    {
      id v28 = [*(id *)(a1 + 56) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_39;
      block[3] = &unk_264A2F7F8;
      block[4] = *(void *)(a1 + 56);
      dispatch_async(v28, block);
    }
    uint64_t v29 = *(void *)(a1 + 64);
    if (v29) {
      (*(void (**)(uint64_t, id))(v29 + 16))(v29, v19);
    }
  }
}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_2_36(uint64_t a1, void *a2)
{
  id v22 = a2;
  id v3 = [v22 accessoryUUID];
  id v4 = [v22 serviceInstanceID];
  id v5 = [v22 characteristicInstanceID];
  id v6 = +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:v3 serviceInstanceID:v4 characteristicInstanceID:v5 managedObjectContext:*(void *)(a1 + 32)];

  BOOL v7 = v6 == 0;
  if (!v6)
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF240];
    id v9 = +[MKFLocalBulletinCharacteristicRegistration entity];
    id v10 = [v9 name];
    id v6 = [v8 insertNewObjectForEntityForName:v10 inManagedObjectContext:*(void *)(a1 + 32)];

    id v11 = [v22 accessoryUUID];
    [v6 setAccessoryModelID:v11];

    id v12 = [v22 serviceInstanceID];
    objc_msgSend(v6, "setServiceInstanceID:", objc_msgSend(v12, "unsignedLongLongValue"));

    id v13 = [v22 characteristicInstanceID];
    objc_msgSend(v6, "setCharacteristicInstanceID:", objc_msgSend(v13, "unsignedLongLongValue"));
  }
  if (([v6 enabled] & 1) == 0)
  {
    BOOL v7 = 1;
    [v6 setEnabled:1];
  }
  uint64_t v14 = [v6 conditions];
  uint64_t v15 = [MEMORY[0x263EFFA08] set];
  if (v14)
  {
    uint64_t v16 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v14];

    uint64_t v15 = (void *)v16;
  }
  uint64_t v17 = [v22 conditions];
  char v18 = [v15 isEqualToSet:v17];

  if ((v18 & 1) == 0)
  {
    if (v14) {
      [v6 removeConditions:v14];
    }
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = [v22 conditions];
    id v21 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v6 moc:v19 conditions:v20];

    goto LABEL_13;
  }
  if (v7) {
LABEL_13:
  }
    [*(id *)(a1 + 40) addObject:v22];
}

void __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_3(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 accessoryUUID];
  id v5 = [v3 serviceInstanceID];
  id v6 = [v3 characteristicInstanceID];
  BOOL v7 = +[MKFLocalBulletinCharacteristicRegistration fetchCharacteristicRegistrationForAccessoryUUID:v4 serviceInstanceID:v5 characteristicInstanceID:v6 managedObjectContext:a1[4]];

  if (v7)
  {
    uint64_t v8 = [v7 conditions];
    if (v8) {
      [v7 removeConditions:v8];
    }
    [a1[4] deleteObject:v7];
    [a1[6] addObject:v3];
  }
  else
  {
    id v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = a1[5];
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Did not find local registration to disable matching registration: %@, skipping", (uint8_t *)&v13, 0x16u);
    }
  }
}

uint64_t __135__HMDAccessoryBulletinNotificationManager_updateRegistrationsWithEnabledCharacteristics_disabledCharacteristics_conditions_completion___block_invoke_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestSynchronizeRegistrations];
}

- (void)updateServiceGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v9 = [v6 bulletinBoardNotification];
  id v10 = [v9 service];

  id v11 = [v10 accessory];
  id v12 = [v11 home];
  int v13 = [v12 uuid];
  uint64_t v14 = [v8 uuid];
  char v15 = [v13 isEqual:v14];

  if (v15)
  {
    id v16 = [v8 backingStore];
    uint64_t v17 = [v16 context];

    char v18 = [v17 managedObjectContext];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __73__HMDAccessoryBulletinNotificationManager_updateServiceGroup_completion___block_invoke;
    v21[3] = &unk_264A2DDC0;
    id v22 = v10;
    id v23 = v18;
    id v24 = self;
    id v25 = v6;
    id v26 = v7;
    id v19 = v18;
    [v19 performBlock:v21];
  }
  else
  {
    id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v20);
    }
  }
}

void __73__HMDAccessoryBulletinNotificationManager_updateServiceGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 uuid];
  id v4 = [*(id *)(a1 + 32) instanceID];
  id v5 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v3 serviceInstanceID:v4 managedObjectContext:*(void *)(a1 + 40)];

  if (v5)
  {
    id v6 = [v5 bulletinServiceGroup];
    if (!v6)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 48);
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = HMFGetLogIdentifier();
        id v11 = *(void **)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        id v38 = v10;
        __int16 v39 = 2112;
        id v40 = v11;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Creating service group for existing service: %@ registration", buf, 0x16u);
      }
      id v12 = (void *)MEMORY[0x263EFF240];
      int v13 = +[MKFLocalBulletinServiceGroup entity];
      uint64_t v14 = [v13 name];
      id v6 = [v12 insertNewObjectForEntityForName:v14 inManagedObjectContext:*(void *)(a1 + 40)];

      [v5 setBulletinServiceGroup:v6];
      [v6 setBulletinServiceRegistration:v5];
    }
    char v15 = [*(id *)(a1 + 56) associatedServiceUUIDs];
    [v6 setAssociatedServiceUUIDs:v15];

    id v16 = [*(id *)(a1 + 56) cameraProfileUUIDs];
    [v6 setCameraProfileUUIDs:v16];

    uint64_t v17 = *(void **)(a1 + 40);
    id v36 = 0;
    [v17 save:&v36];
    id v18 = v36;
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = *(id *)(a1 + 48);
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      id v23 = [*(id *)(a1 + 56) shortDescription];
      [*(id *)(a1 + 56) associatedServiceUUIDs];
      v24 = id v35 = v5;
      [*(id *)(a1 + 56) cameraProfileUUIDs];
      id v25 = v34 = v19;
      id v26 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138544642;
      id v38 = v22;
      __int16 v39 = 2112;
      id v40 = v23;
      __int16 v41 = 2112;
      id v42 = v24;
      __int16 v43 = 2112;
      uint64_t v44 = v25;
      __int16 v45 = 2112;
      uint64_t v46 = v26;
      __int16 v47 = 2112;
      id v48 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating local service group %@ with associated service UUIDs: %@ camera profile UUIDs: %@ was successful: %@ error: %@", buf, 0x3Eu);

      id v19 = v34;
      id v5 = v35;
    }
    [*(id *)(a1 + 40) reset];
    uint64_t v27 = *(void *)(a1 + 64);
    if (v27) {
      (*(void (**)(uint64_t, id))(v27 + 16))(v27, v18);
    }
  }
  else
  {
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 48);
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v31 = HMFGetLogIdentifier();
      char v32 = *(void **)(a1 + 56);
      *(_DWORD *)long long buf = 138543618;
      id v38 = v31;
      __int16 v39 = 2112;
      id v40 = v32;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration matching service group: %@", buf, 0x16u);
    }
    uint64_t v33 = *(void *)(a1 + 64);
    id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    if (v33) {
      (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v6);
    }
  }
}

- (void)disableBulletinForService:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v9 = [v6 accessory];
  id v10 = [v9 home];
  id v11 = [v10 uuid];
  id v12 = [v8 uuid];
  char v13 = [v11 isEqual:v12];

  if (v13)
  {
    uint64_t v14 = [v8 backingStore];
    char v15 = [v14 context];

    id v16 = [v15 managedObjectContext];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __80__HMDAccessoryBulletinNotificationManager_disableBulletinForService_completion___block_invoke;
    v21[3] = &unk_264A2EE30;
    id v22 = v6;
    id v23 = v16;
    id v24 = self;
    id v25 = v7;
    id v17 = v7;
    id v18 = v16;
    id v19 = v6;
    [v18 performBlock:v21];
  }
  else
  {
    uint64_t v20 = _HMFPreconditionFailure();
    __80__HMDAccessoryBulletinNotificationManager_disableBulletinForService_completion___block_invoke(v20);
  }
}

void __80__HMDAccessoryBulletinNotificationManager_disableBulletinForService_completion___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) accessory];
  id v3 = [v2 uuid];
  id v4 = [*(id *)(a1 + 32) instanceID];
  id v5 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v3 serviceInstanceID:v4 managedObjectContext:*(void *)(a1 + 40)];

  if (!v5)
  {
    char v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 48);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      id v19 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138543618;
      id v29 = v18;
      __int16 v30 = 2112;
      int v31 = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to disable matching service: %@", buf, 0x16u);
    }
    uint64_t v20 = *(void *)(a1 + 56);
    id v7 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    if (v20) {
      (*(void (**)(uint64_t, id))(v20 + 16))(v20, v7);
    }
    goto LABEL_11;
  }
  if ([v5 enabled])
  {
    [v5 setEnabled:0];
    id v6 = *(void **)(a1 + 40);
    id v27 = 0;
    [v6 save:&v27];
    id v7 = v27;
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 48);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v5];
      char v13 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138544130;
      id v29 = v11;
      __int16 v30 = 2112;
      int v31 = v12;
      __int16 v32 = 2112;
      uint64_t v33 = v13;
      __int16 v34 = 2112;
      id v35 = v7;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Disabling local service registration: %@ was successful: %@ error: %@", buf, 0x2Au);
    }
    [*(id *)(a1 + 40) reset];
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v7);
    }
LABEL_11:

    goto LABEL_16;
  }
  id v21 = (void *)MEMORY[0x230FBD990]();
  id v22 = *(id *)(a1 + 48);
  id v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    id v24 = HMFGetLogIdentifier();
    id v25 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v5];
    *(_DWORD *)long long buf = 138543618;
    id v29 = v24;
    __int16 v30 = 2112;
    int v31 = v25;
    _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Disabling local service registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);
  }
  uint64_t v26 = *(void *)(a1 + 56);
  if (v26) {
    (*(void (**)(uint64_t, void))(v26 + 16))(v26, 0);
  }
LABEL_16:
}

- (void)enableBulletinForService:(id)a3 conditions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v12 = [v8 accessory];
  char v13 = [v12 home];
  uint64_t v14 = [v13 uuid];
  char v15 = [v11 uuid];
  char v16 = [v14 isEqual:v15];

  if (v16)
  {
    id v17 = [v11 backingStore];
    id v18 = [v17 context];

    id v19 = [v18 managedObjectContext];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __90__HMDAccessoryBulletinNotificationManager_enableBulletinForService_conditions_completion___block_invoke;
    v26[3] = &unk_264A2DF78;
    id v27 = v12;
    id v28 = v8;
    id v29 = v19;
    __int16 v30 = self;
    id v31 = v9;
    id v32 = v10;
    id v20 = v9;
    id v21 = v10;
    id v22 = v19;
    id v23 = v8;
    id v24 = v12;
    [v22 performBlock:v26];
  }
  else
  {
    uint64_t v25 = _HMFPreconditionFailure();
    __90__HMDAccessoryBulletinNotificationManager_enableBulletinForService_conditions_completion___block_invoke(v25);
  }
}

void __90__HMDAccessoryBulletinNotificationManager_enableBulletinForService_conditions_completion___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [*(id *)(a1 + 40) instanceID];
  id v4 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v2 serviceInstanceID:v3 managedObjectContext:*(void *)(a1 + 48)];

  if (v4)
  {
    int v5 = [v4 enabled];
    if ((v5 & 1) == 0) {
      [v4 setEnabled:1];
    }
    id v6 = [v4 conditions];
    id v7 = [MEMORY[0x263EFFA08] set];
    id v8 = v7;
    if (v6)
    {
      id v9 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v6];

      if ([v9 isEqualToSet:*(void *)(a1 + 64)])
      {
        id v8 = v9;
        goto LABEL_12;
      }
      [v4 removeConditions:v6];
      id v8 = v9;
    }
    else if ([v7 isEqualToSet:*(void *)(a1 + 64)])
    {
LABEL_12:
      if (v5)
      {
        char v16 = (void *)MEMORY[0x230FBD990]();
        id v17 = *(id *)(a1 + 56);
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          id v20 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v4];
          *(_DWORD *)long long buf = 138543618;
          id v35 = v19;
          __int16 v36 = 2112;
          id v37 = v20;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Enabling local service registration: %@, resulted in no changes to local store, not saving", buf, 0x16u);
        }
        uint64_t v21 = *(void *)(a1 + 72);
        if (v21) {
          (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_19:
      id v23 = *(void **)(a1 + 48);
      id v33 = 0;
      [v23 save:&v33];
      id v24 = v33;
      uint64_t v25 = (void *)MEMORY[0x230FBD990]();
      id v26 = *(id *)(a1 + 56);
      id v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v28 = v32 = v8;
        id v29 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v4];
        __int16 v30 = HMFBooleanToString();
        *(_DWORD *)long long buf = 138544130;
        id v35 = v28;
        __int16 v36 = 2112;
        id v37 = v29;
        __int16 v38 = 2112;
        __int16 v39 = v30;
        __int16 v40 = 2112;
        id v41 = v24;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Enabling local service registration: %@ was successful: %@ error: %@", buf, 0x2Au);

        id v8 = v32;
      }

      [*(id *)(a1 + 48) reset];
      uint64_t v31 = *(void *)(a1 + 72);
      if (v31) {
        (*(void (**)(uint64_t, id))(v31 + 16))(v31, v24);
      }

      goto LABEL_24;
    }
    id v22 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v4 moc:*(void *)(a1 + 48) conditions:*(void *)(a1 + 64)];
    goto LABEL_19;
  }
  id v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = *(id *)(a1 + 56);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    char v13 = HMFGetLogIdentifier();
    uint64_t v14 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local service registration to enable matching service: %@", buf, 0x16u);
  }
  uint64_t v15 = *(void *)(a1 + 72);
  id v6 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
  if (v15) {
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
  }
LABEL_25:
}

- (id)bulletinBoardNotificationForService:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v6 = [v4 accessory];
  id v7 = [v6 home];
  id v8 = [v7 uuid];
  id v9 = [v5 uuid];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    id v23 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v54, 8);
    _Unwind_Resume(v23);
  }
  uint64_t v54 = 0;
  long long v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy__187312;
  long long v52 = __Block_byref_object_dispose__187313;
  id v53 = 0;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x3032000000;
  __int16 v45 = __Block_byref_object_copy__187312;
  uint64_t v46 = __Block_byref_object_dispose__187313;
  id v47 = [MEMORY[0x263EFFA08] set];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  __int16 v39 = __Block_byref_object_copy__187312;
  __int16 v40 = __Block_byref_object_dispose__187313;
  id v41 = [MEMORY[0x263EFFA08] set];
  id v11 = [v5 backingStore];
  id v12 = [v11 context];

  char v13 = [v12 managedObjectContext];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  id v26 = __79__HMDAccessoryBulletinNotificationManager_bulletinBoardNotificationForService___block_invoke;
  id v27 = &unk_264A24BC8;
  id v14 = v6;
  id v28 = v14;
  id v15 = v4;
  id v29 = v15;
  id v16 = v13;
  id v30 = v16;
  uint64_t v31 = self;
  id v32 = &v54;
  id v33 = &v48;
  __int16 v34 = &v42;
  id v35 = &v36;
  [v16 performBlockAndWait:&v24];
  id v17 = [HMDBulletinBoardNotification alloc];
  id v18 = -[HMDBulletinBoardNotification initWithService:enabled:condition:](v17, "initWithService:enabled:condition:", v15, *((unsigned __int8 *)v55 + 24), v49[5], v24, v25, v26, v27);
  id v19 = [v15 type];
  BOOL v20 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v19];

  if (v20)
  {
    uint64_t v21 = [[HMDBulletinBoardNotificationServiceGroup alloc] initWithBulletinBoardNotification:v18];
    [(HMDBulletinBoardNotification *)v18 setNotificationServiceGroup:v21];
    [(HMDBulletinBoardNotificationServiceGroup *)v21 setAssociatedServiceUUIDs:v37[5]];
    [(HMDBulletinBoardNotificationServiceGroup *)v21 setCameraProfileUUIDs:v43[5]];
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  return v18;
}

void __79__HMDAccessoryBulletinNotificationManager_bulletinBoardNotificationForService___block_invoke(uint64_t a1)
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [*(id *)(a1 + 40) instanceID];
  id v4 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v2 serviceInstanceID:v3 managedObjectContext:*(void *)(a1 + 48)];

  if (isHomePod() && v4)
  {
    if (![v4 enabled])
    {
LABEL_10:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 enabled];
      id v20 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v4];
      uint64_t v21 = [v20 predicate];
      uint64_t v22 = *(void *)(*(void *)(a1 + 72) + 8);
      id v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = *(id *)(a1 + 56);
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = HMFGetLogIdentifier();
        id v28 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v4];
        id v29 = *(void **)(a1 + 40);
        id v30 = HMFBooleanToString();
        uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        *(_DWORD *)long long buf = 138544386;
        id v73 = v27;
        __int16 v74 = 2112;
        v75 = v28;
        __int16 v76 = 2112;
        uint64_t v77 = v29;
        __int16 v78 = 2112;
        id v79 = v30;
        __int16 v80 = 2112;
        uint64_t v81 = v31;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_INFO, "%{public}@Found local registration: %@ for service: %@, setting enabled: %@ condition: %@", buf, 0x34u);
      }
      id v32 = [*(id *)(a1 + 40) type];
      BOOL v33 = +[HMDBulletinBoardNotification supportsBulletinNotificationGroup:v32];

      if (v33)
      {
        __int16 v34 = [v4 bulletinServiceGroup];
        id v35 = v34;
        if (v34)
        {
          uint64_t v36 = [v34 cameraProfileUUIDs];
          uint64_t v37 = *(void *)(*(void *)(a1 + 80) + 8);
          uint64_t v38 = *(void **)(v37 + 40);
          *(void *)(v37 + 40) = v36;

          uint64_t v39 = [v35 associatedServiceUUIDs];
          uint64_t v40 = *(void *)(*(void *)(a1 + 88) + 8);
          id v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;

          uint64_t v42 = (void *)MEMORY[0x230FBD990]();
          id v43 = *(id *)(a1 + 56);
          uint64_t v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            __int16 v45 = HMFGetLogIdentifier();
            uint64_t v46 = *(void **)(a1 + 40);
            id v47 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
            uint64_t v48 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            *(_DWORD *)long long buf = 138544386;
            id v73 = v45;
            __int16 v74 = 2112;
            v75 = v35;
            __int16 v76 = 2112;
            uint64_t v77 = v46;
            __int16 v78 = 2112;
            id v79 = v47;
            __int16 v80 = 2112;
            uint64_t v81 = v48;
            _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Found local service group: %@ for service: %@ with associatedServiceUUIDs: %@ cameraProfileUUIDs: %@", buf, 0x34u);
          }
        }
      }
      goto LABEL_29;
    }
    int v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 56);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      id v73 = v8;
      __int16 v74 = 2112;
      v75 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Forcing bulletin board notification enabled to NO on HomePod for service: %@", buf, 0x16u);
    }
    [v4 setEnabled:0];
    char v10 = *(void **)(a1 + 48);
    id v71 = 0;
    [v10 save:&v71];
    id v11 = v71;
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 56);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = HMFBooleanToString();
      *(_DWORD *)long long buf = 138544130;
      id v73 = v15;
      __int16 v74 = 2112;
      v75 = v4;
      __int16 v76 = 2112;
      uint64_t v77 = v16;
      __int16 v78 = 2112;
      id v79 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Saving cleaned up local registration: %@ for service was successful: %@ error: %@", buf, 0x2Au);
    }
    [*(id *)(a1 + 48) reset];
    id v17 = [*(id *)(a1 + 32) uuid];
    id v18 = [*(id *)(a1 + 40) instanceID];
    uint64_t v19 = +[MKFLocalBulletinServiceRegistration fetchServiceRegistrationForAccessoryUUID:v17 serviceInstanceID:v18 managedObjectContext:*(void *)(a1 + 48)];

    id v4 = (void *)v19;
  }
  if (v4) {
    goto LABEL_10;
  }
  uint64_t v49 = (void *)MEMORY[0x230FBD990]();
  id v50 = *(id *)(a1 + 56);
  uint64_t v51 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
  {
    long long v52 = HMFGetLogIdentifier();
    id v53 = *(void **)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    id v73 = v52;
    __int16 v74 = 2112;
    v75 = v53;
    _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Did not find any local registrations matching service: %@ for bulletin board notification, creating initial registration now", buf, 0x16u);
  }
  uint64_t v54 = (void *)MEMORY[0x263EFF240];
  long long v55 = +[MKFLocalBulletinServiceRegistration entity];
  uint64_t v56 = [v55 name];
  id v4 = [v54 insertNewObjectForEntityForName:v56 inManagedObjectContext:*(void *)(a1 + 48)];

  char v57 = [*(id *)(a1 + 32) uuid];
  [v4 setAccessoryModelID:v57];

  long long v58 = [*(id *)(a1 + 40) instanceID];
  objc_msgSend(v4, "setServiceInstanceID:", objc_msgSend(v58, "unsignedLongLongValue"));

  id v59 = [MEMORY[0x263EFFA08] set];
  [v4 setConditions:v59];

  if (isHomePod()) {
    goto LABEL_23;
  }
  id v60 = [*(id *)(a1 + 40) type];
  if (!+[HMDBulletinBoard isBulletinSupportedForNonSecureCharacteristicType:0 serviceType:v60])
  {

    goto LABEL_25;
  }
  v61 = [*(id *)(a1 + 40) type];
  BOOL v62 = +[HMDBulletinBoard isCriticalNonSecureServiceType:v61];

  if (v62)
  {
LABEL_25:
    char v63 = 1;
    goto LABEL_26;
  }
LABEL_23:
  char v63 = 0;
LABEL_26:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v63;
  [v4 setEnabled:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  uint64_t v64 = *(void **)(a1 + 48);
  id v70 = 0;
  [v64 save:&v70];
  id v20 = v70;
  v65 = (void *)MEMORY[0x230FBD990]();
  id v66 = *(id *)(a1 + 56);
  id v67 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    v68 = HMFGetLogIdentifier();
    id v69 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138544130;
    id v73 = v68;
    __int16 v74 = 2112;
    v75 = v4;
    __int16 v76 = 2112;
    uint64_t v77 = v69;
    __int16 v78 = 2112;
    id v79 = v20;
    _os_log_impl(&dword_22F52A000, v67, OS_LOG_TYPE_INFO, "%{public}@Saving initial local registration: %@ for bulletin board notification was successful: %@ error: %@", buf, 0x2Au);
  }
  [*(id *)(a1 + 48) reset];
LABEL_29:
}

- (void)configureWithDeviceIsResidentCapable:(BOOL)a3
{
  BOOL v3 = a3;
  v54[7] = *MEMORY[0x263EF8340];
  if (self)
  {
    int v5 = [(HMDAccessoryBulletinNotificationManager *)self home];
    if (![v5 bulletinBoardNotificationsMigrationFileExistsOnDisk])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v6 = [v5 loadMigrationBulletinBoardNotificationsFromDisk];
    id v7 = (void *)MEMORY[0x230FBD990]();
    if (v6)
    {
      id v8 = v6;
      id v9 = (void *)MEMORY[0x263EFFA08];
      v54[0] = objc_opt_class();
      v54[1] = objc_opt_class();
      v54[2] = objc_opt_class();
      v54[3] = objc_opt_class();
      v54[4] = objc_opt_class();
      v54[5] = objc_opt_class();
      v54[6] = objc_opt_class();
      char v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:7];
      id v11 = [v9 setWithArray:v10];

      id v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      uint64_t v48 = __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke;
      uint64_t v49 = &unk_264A24F30;
      id v50 = self;
      id v13 = (HMDAccessoryBulletinNotificationManager *)v8;
      uint64_t v51 = v13;
      id v14 = v11;
      long long v52 = v14;
      id v15 = v12;
      id v53 = v15;
      [(HMDAccessoryBulletinNotificationManager *)v13 hmf_enumerateWithAutoreleasePoolUsingBlock:&buf];
      if ([v15 count])
      {
        id v16 = [(HMDAccessoryBulletinNotificationManager *)self home];
        id v17 = [v16 backingStore];
        [v17 context];
        BOOL v42 = v3;
        v19 = id v18 = v7;

        id v20 = [v19 managedObjectContext];
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_112;
        v44[3] = &unk_264A2F2F8;
        v44[4] = self;
        id v45 = v15;
        id v46 = v20;
        id v21 = v20;
        [v21 performBlockAndWait:v44];

        id v7 = v18;
        BOOL v3 = v42;
      }
    }
    else
    {
      id v13 = self;
      id v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      HMFGetLogIdentifier();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to load bulletin board notifications from migration file", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_10;
  }
LABEL_12:
  uint64_t v22 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v23 = [(HMDAccessoryBulletinNotificationManager *)self notificationCenter];
  uint64_t v24 = [v22 residentDeviceManager];
  [v23 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v24];

  id v25 = [(HMDAccessoryBulletinNotificationManager *)self notificationCenter];
  id v26 = [(HMDAccessoryBulletinNotificationManager *)self accountManager];
  [v25 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v26];

  id v27 = [(HMDAccessoryBulletinNotificationManager *)self notificationCenter];
  id v28 = [(HMDAccessoryBulletinNotificationManager *)self accountManager];
  [v27 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v28];

  id v29 = [(HMDAccessoryBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimerFactory];
  id v30 = v29[2](v29, 28, 5.0);
  [(HMDAccessoryBulletinNotificationManager *)self setSynchronizeWithPrimaryDebounceTimer:v30];

  uint64_t v31 = [(HMDAccessoryBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
  [v31 setDelegate:self];

  id v32 = [(HMDAccessoryBulletinNotificationManager *)self workQueue];
  BOOL v33 = [(HMDAccessoryBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
  [v33 setDelegateQueue:v32];

  if (v3)
  {
    [(HMDAccessoryBulletinNotificationManager *)self setCurrentPrimary:0];
    int v34 = [v22 isCurrentDeviceConfirmedPrimaryResident];
    id v35 = (void *)MEMORY[0x230FBD990]();
    uint64_t v36 = self;
    uint64_t v37 = HMFGetOSLogHandle();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v34)
    {
      if (v38)
      {
        uint64_t v39 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Configuring as primary resident", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v40 = [(HMDAccessoryBulletinNotificationManager *)v36 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __80__HMDAccessoryBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke;
      block[3] = &unk_264A2F7F8;
      block[4] = v36;
      dispatch_async(v40, block);
    }
    else
    {
      if (v38)
      {
        id v41 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Configuring as non-primary resident", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

uint64_t __80__HMDAccessoryBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDeviceBecamePrimary];
}

void __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  int v5 = v4;

  if (v5)
  {
    id v6 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.BBN.A"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (!v8)
    {
      uint64_t v22 = (void *)MEMORY[0x230FBD990]();
      id v23 = *(id *)(a1 + 32);
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v51 = v25;
        __int16 v52 = 2112;
        id v53 = @"HMD.BBN.A";
        __int16 v54 = 2112;
        long long v55 = v3;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);
      }
      goto LABEL_44;
    }
    id v9 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.BBN.S"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v10 = v9;
    }
    else {
      char v10 = 0;
    }
    id v11 = v10;

    if (!v11)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = *(id *)(a1 + 32);
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v51 = v29;
        __int16 v52 = 2112;
        id v53 = @"HMD.BBN.S";
        __int16 v54 = 2112;
        long long v55 = v3;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);
      }
      goto LABEL_43;
    }
    id v12 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.BBN.E"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (!v14)
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 32);
      id v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        BOOL v33 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        uint64_t v51 = v33;
        __int16 v52 = 2112;
        id v53 = @"HMD.BBN.E";
        __int16 v54 = 2112;
        long long v55 = v3;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);
      }
      goto LABEL_42;
    }
    id v15 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.BBN.P"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = 0;
    }
    else
    {
      id v16 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v34 = v16;
      }
      else {
        int v34 = 0;
      }
      id v35 = v34;

      if (!v35)
      {
        context = (void *)MEMORY[0x230FBD990]();
        id v47 = *(id *)(a1 + 32);
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v44 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          uint64_t v51 = v44;
          __int16 v52 = 2112;
          id v53 = @"HMD.BBN.P";
          __int16 v54 = 2112;
          long long v55 = v3;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", buf, 0x20u);
        }
      }
      uint64_t v37 = *(void *)(a1 + 48);
      id v49 = 0;
      uint64_t v38 = objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClasses:fromData:error:", v37, v35, &v49, v44);
      id v39 = v49;
      if (!v38)
      {
        uint64_t v48 = v39;
        uint64_t v40 = (void *)MEMORY[0x230FBD990]();
        id v41 = *(id *)(a1 + 32);
        BOOL v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          id v43 = contexta = v40;
          *(_DWORD *)long long buf = 138544130;
          uint64_t v51 = v43;
          __int16 v52 = 2112;
          id v53 = @"HMD.BBN.P";
          __int16 v54 = 2112;
          long long v55 = v3;
          __int16 v56 = 2112;
          char v57 = v48;
          _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive %@: %@, %@", buf, 0x2Au);

          uint64_t v40 = contexta;
        }

        goto LABEL_41;
      }

      id v16 = (id)v38;
    }

    id v35 = (id)objc_opt_new();
    [v35 setAccessoryUUID:v8];
    objc_msgSend(v35, "setServiceInstanceID:", objc_msgSend(v11, "unsignedLongLongValue"));
    [v35 setPredicate:v16];
    objc_msgSend(v35, "setEnabled:", objc_msgSend(v14, "BOOLValue"));
    [*(id *)(a1 + 56) addObject:v35];
LABEL_41:

LABEL_42:
LABEL_43:

LABEL_44:
    goto LABEL_45;
  }
  id v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v20 = HMFGetLogIdentifier();
    id v21 = *(__CFString **)(a1 + 40);
    *(_DWORD *)long long buf = 138543874;
    uint64_t v51 = v20;
    __int16 v52 = 2112;
    id v53 = v3;
    __int16 v54 = 2112;
    long long v55 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object type: %@, %@", buf, 0x20u);
  }
LABEL_45:
}

void __77__HMDAccessoryBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_112(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)[*(id *)(a1 + 40) copy];
  id v4 = *(void **)(a1 + 48);
  id v21 = v3;
  id v5 = v4;
  id v6 = v5;
  if (v2)
  {
    id v7 = (void *)MEMORY[0x230FBD990](objc_msgSend(v5, "hmd_assertIsExecuting"));
    id v8 = v2;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      char v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating bulletin registrations: %@", buf, 0x16u);
    }
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __72__HMDAccessoryBulletinNotificationManager_migrateRegistrations_context___block_invoke;
    id v28 = &unk_264A24F58;
    id v29 = v8;
    id v11 = v6;
    id v30 = v11;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    if ([v11 hasChanges])
    {
      id v22 = 0;
      char v12 = objc_msgSend(v11, "hmd_saveWithTransactionAuthor:error:", 7, &v22);
      id v13 = v22;
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = v8;
      id v16 = HMFGetOSLogHandle();
      id v17 = v16;
      if (v12)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)id v23 = 138543362;
          uint64_t v24 = v18;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated bulletin registrations", v23, 0xCu);
        }
        uint64_t v19 = [v15 home];
        [v19 removeBulletinBoardNotificationsMigrationFileFromDisk];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)id v23 = 138543618;
          uint64_t v24 = v20;
          __int16 v25 = 2112;
          id v26 = v21;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate bulletin registrations: %@", v23, 0x16u);
        }
        [v11 rollback];
      }
    }
  }
}

void __72__HMDAccessoryBulletinNotificationManager_migrateRegistrations_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BOOL v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = v2;
  id v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "hmd_assertIsExecuting");
    id v7 = +[MKFLocalBulletinServiceRegistration fetchRequest];
    id v8 = (void *)MEMORY[0x263F08A98];
    id v9 = [(MKFLocalBulletinServiceRegistration *)v4 accessoryUUID];
    char v10 = [v8 predicateWithFormat:@"(%K == %@) AND (%K == %lld)", @"accessoryModelID", v9, @"serviceInstanceID", -[MKFLocalBulletinServiceRegistration serviceInstanceID](v4, "serviceInstanceID")];
    [v7 setPredicate:v10];

    [v7 setResultType:1];
    id v32 = 0;
    id v11 = [v6 executeFetchRequest:v7 error:&v32];
    char v12 = (MKFLocalBulletinServiceRegistration *)v32;
    if (!v11)
    {
      id v13 = (void *)MEMORY[0x230FBD990]();
      id v14 = v3;
      id v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        int v34 = v16;
        __int16 v35 = 2112;
        uint64_t v36 = v12;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch existing registrations: %@", buf, 0x16u);
      }
    }
    if ([v11 count])
    {
      id v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = v3;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        int v34 = v20;
        __int16 v35 = 2112;
        uint64_t v36 = v4;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Already have a registration: %@", buf, 0x16u);
      }
    }
    else
    {
      id v21 = [[MKFLocalBulletinServiceRegistration alloc] initWithContext:v6];
      id v22 = [(MKFLocalBulletinServiceRegistration *)v4 accessoryUUID];
      [(MKFLocalBulletinServiceRegistration *)v21 setAccessoryModelID:v22];

      [(MKFLocalBulletinServiceRegistration *)v21 setServiceInstanceID:[(MKFLocalBulletinServiceRegistration *)v4 serviceInstanceID]];
      if (isHomePod()) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = [(MKFLocalBulletinServiceRegistration *)v4 enabled];
      }
      [(MKFLocalBulletinServiceRegistration *)v21 setEnabled:v23];
      uint64_t v24 = [(MKFLocalBulletinServiceRegistration *)v4 predicate];
      __int16 v25 = [v3 conditionsFromPredicate:v24];

      id v26 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v21 moc:v6 conditions:v25];
      [(MKFLocalBulletinServiceRegistration *)v21 setConditions:v26];

      id v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v3;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v30 = v31 = v12;
        *(_DWORD *)long long buf = 138543618;
        int v34 = v30;
        __int16 v35 = 2112;
        uint64_t v36 = v21;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Created new registration: %@", buf, 0x16u);

        char v12 = v31;
      }
    }
  }
}

- (HMDBulletinNotificationRegistrationSource)source
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDAccessoryBulletinNotificationManager *)self accountManager];
  id v4 = [v3 account];
  id v5 = [v4 currentDevice];
  id v6 = [v5 deviceAddress];

  if (v6)
  {
    id v7 = [(HMDAccessoryBulletinNotificationManager *)self home];
    id v8 = [v7 currentUser];
    id v9 = [v8 uuid];

    if (v9)
    {
      char v10 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v9 deviceAddress:v6];
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      id v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        id v21 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);
      }
      char v10 = 0;
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      id v21 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);
    }
    char v10 = 0;
  }

  return v10;
}

- (NSArray)accessoryRegistrationsForCurrentDevice
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__187312;
  id v17 = __Block_byref_object_dispose__187313;
  id v18 = (id)MEMORY[0x263EFFA68];
  BOOL v3 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_264A2F698;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  char v12 = &v13;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

void __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _mkfLocalCharacteristicRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "na_map:", &__block_literal_global_15_187486);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __81__HMDAccessoryBulletinNotificationManager_accessoryRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 enabled])
  {
    uint64_t v3 = +[HMDBulletinNotificationRegistrationUtilities accessoryRegistrationFromLocalRegistration:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)accessoryRegistrations
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__187312;
  id v17 = __Block_byref_object_dispose__187313;
  id v18 = (id)MEMORY[0x263EFFA68];
  uint64_t v3 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke;
  v9[3] = &unk_264A2F698;
  id v6 = v3;
  id v10 = v6;
  id v11 = self;
  char v12 = &v13;
  [v5 unsafeSynchronousBlock:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v7;
}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 users];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_2;
  v18[3] = &unk_264A24B30;
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 40);
  id v19 = v6;
  uint64_t v20 = v7;
  objc_msgSend(v5, "na_each:", v18);

  id v8 = [v4 guests];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_3;
  v15[3] = &unk_264A24B58;
  uint64_t v9 = *(void *)(a1 + 40);
  id v16 = v6;
  uint64_t v17 = v9;
  id v10 = v6;
  objc_msgSend(v8, "na_each:", v15);

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_4;
  v14[3] = &unk_264A24B80;
  v14[4] = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend(v10, "na_map:", v14);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = [a2 bulletinRegistrations];
  id v4 = [v3 _characteristicsRegistrationsFromBulletinRegistrations:v5];
  [v2 addObjectsFromArray:v4];
}

void __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = [a2 bulletinRegistrations];
  id v4 = [v3 _characteristicsRegistrationsFromBulletinRegistrations:v5];
  [v2 addObjectsFromArray:v4];
}

id __65__HMDAccessoryBulletinNotificationManager_accessoryRegistrations__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _accessoryRegistrationFromMKFRegistrationSafe:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping invalid working store registration: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5;
}

- (id)_characteristicsRegistrationsFromBulletinRegistrations:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __98__HMDAccessoryBulletinNotificationManager__characteristicsRegistrationsFromBulletinRegistrations___block_invoke;
  v8[3] = &unk_264A24B08;
  id v6 = v5;
  id v9 = v6;
  objc_msgSend(v4, "na_each:", v8);

  return v6;
}

void __98__HMDAccessoryBulletinNotificationManager__characteristicsRegistrationsFromBulletinRegistrations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 castIfCharacteristicBulletinRegistration];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (NSArray)serviceRegistrationsForCurrentDevice
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__187312;
  uint64_t v17 = __Block_byref_object_dispose__187313;
  id v18 = (id)MEMORY[0x263EFFA68];
  id v3 = [(HMDAccessoryBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_264A2F698;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  int v12 = &v13;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

void __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _mkfLocalServiceRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "na_map:", &__block_literal_global_4_187490);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __79__HMDAccessoryBulletinNotificationManager_serviceRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 enabled])
  {
    uint64_t v3 = +[HMDBulletinNotificationRegistrationUtilities serviceRegistrationFromLocalRegistration:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (HMDAccessoryBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 accountManager:(id)a5 evaluator:(id)a6 notificationCenter:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessoryBulletinNotificationManager;
  uint64_t v17 = [(HMDAccessoryBulletinNotificationManager *)&v21 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_home, v12);
    objc_storeStrong((id *)&v18->_workQueue, a4);
    objc_storeStrong((id *)&v18->_accountManager, a5);
    objc_storeStrong((id *)&v18->_evaluator, a6);
    objc_storeStrong((id *)&v18->_notificationCenter, a7);
    id synchronizeWithPrimaryDebounceTimerFactory = v18->_synchronizeWithPrimaryDebounceTimerFactory;
    v18->_id synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_187495;
  }
  return v18;
}

id __110__HMDAccessoryBulletinNotificationManager_initWithHome_workQueue_accountManager_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t99 != -1) {
    dispatch_once(&logCategory__hmf_once_t99, &__block_literal_global_121_187503);
  }
  id v2 = (void *)logCategory__hmf_once_v100;
  return v2;
}

void __54__HMDAccessoryBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v100;
  logCategory__hmf_once_v100 = v0;
}

+ (id)_characteristicBulletinRegistrationsForSource:(id)a3 context:(id)a4
{
  v41[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v35 = a4;
  id v6 = +[_MKFCharacteristicBulletinRegistration fetchRequest];
  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [v5 userUUID];
  id v9 = [v5 deviceAddress];
  id v10 = [v9 idsIdentifier];
  id v11 = [v5 deviceAddress];
  id v12 = [v11 idsDestination];
  id v13 = [v7 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v8, @"deviceIdsIdentifier", v10, @"deviceIdsDestination", v12];

  [v6 setPredicate:v13];
  id v14 = (void *)MEMORY[0x263F08A98];
  id v15 = [v5 userUUID];
  id v16 = [v5 deviceAddress];
  uint64_t v17 = [v16 idsIdentifier];
  id v18 = [v5 deviceAddress];
  id v19 = [v18 idsDestination];
  uint64_t v20 = [v14 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"guest.modelID", v15, @"deviceIdsIdentifier", v17, @"deviceIdsDestination", v19];

  objc_super v21 = (void *)v20;
  uint64_t v22 = (void *)MEMORY[0x263F08730];
  v41[0] = v13;
  v41[1] = v20;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  uint64_t v24 = [v22 orPredicateWithSubpredicates:v23];
  [v6 setPredicate:v24];

  id v36 = 0;
  __int16 v25 = [v35 executeFetchRequest:v6 error:&v36];
  id v26 = v36;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    BOOL v33 = v21;
    id v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = a1;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      id v40 = v5;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch characteristic bulletin registrations for source: %@", buf, 0x16u);
    }
    id v27 = (id)MEMORY[0x263EFFA68];
    objc_super v21 = v33;
  }

  return v27;
}

@end