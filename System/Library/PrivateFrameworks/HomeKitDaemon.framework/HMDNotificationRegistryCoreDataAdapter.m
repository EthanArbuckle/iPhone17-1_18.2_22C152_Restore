@interface HMDNotificationRegistryCoreDataAdapter
+ (id)logCategory;
- (BOOL)_deleteAllCharacteristicRegistrationsWithContext:(id)a3;
- (BOOL)_deleteAllMKFRegistrationsForActionSetUUID:(id)a3 hmcContext:(id)a4;
- (BOOL)_deleteAllMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 hmcContext:(id)a5;
- (BOOL)_deleteAllRegistrationsForCharacteristicIIDs:(id)a3 withAccessoryUUID:(id)a4 hmcContext:(id)a5;
- (BOOL)_deleteAllRegistrationsWithEntityName:(id)a3 withHomeKeypath:(id)a4 hmcContext:(id)a5;
- (BOOL)_disableRegistration:(id)a3;
- (BOOL)_enableRegistration:(id)a3;
- (BOOL)_insertNotificationRegistrationForCharacteristic:(id)a3 notificationThreshold:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 mkfCharacteristic:(id)a7 context:(id)a8;
- (BOOL)_insertNotificationRegistrationForMKFActionSet:(id)a3 deviceIdsDestination:(id)a4 homeMember:(id)a5 context:(id)a6;
- (BOOL)_insertNotificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 accessory:(id)a7 context:(id)a8;
- (BOOL)_updateThresholdRegistration:(id)a3 threshold:(id)a4;
- (BOOL)disableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5;
- (BOOL)disableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6;
- (BOOL)enableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5;
- (BOOL)enableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6;
- (BOOL)enableNotificationsForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5;
- (BOOL)hasEnabledRegistrationForActionSetUUID:(id)a3;
- (BOOL)removeRegistrationsForActionSetUUID:(id)a3;
- (BOOL)removeRegistrationsForMediaProfile:(id)a3;
- (HMDHome)home;
- (HMDNotificationRegistryCoreDataAdapter)initWithHome:(id)a3;
- (NSSet)actionSetRegistrations;
- (NSSet)characteristicRegistrations;
- (NSSet)enabledCharacteristicRegistrations;
- (NSSet)mediaRegistrations;
- (id)_fetchEnabledMKFRegistrationsForActionSetUUID:(id)a3 context:(id)a4;
- (id)_fetchEnabledMKFRegistrationsForHMDCharacteristics:(id)a3 context:(id)a4;
- (id)_fetchEnabledMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5;
- (id)_fetchHomeMemberWithUUID:(id)a3 context:(id)a4;
- (id)_fetchMKFActionSetWithUUID:(id)a3 context:(id)a4;
- (id)_fetchMKFCharacteristicsFromHMDCharacteristics:(id)a3 context:(id)a4;
- (id)_fetchMKFHAPAccessoryWithUUID:(id)a3 context:(id)a4;
- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 context:(id)a8;
- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9;
- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9;
- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 context:(id)a10;
- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 outHomeMember:(id *)a8 context:(id)a9;
- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10;
- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10;
- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 outHomeMember:(id *)a10 context:(id)a11;
- (id)_fetchRequestForActionSetRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)_fetchRequestForAllActionSetRegistrations;
- (id)_fetchRequestForAllCharacteristicRegistrations;
- (id)_fetchRequestForAllMediaProfileRegistrations;
- (id)_fetchRequestForCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)_fetchRequestForMediaProfileRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)_filterCharacteristicRegistrations:(id)a3 home:(id)a4;
- (id)_processDisableCharacteristicsRequest:(id)a3 registrationsForAccessory:(id)a4 context:(id)a5;
- (id)_processEnableCharacteristicsRequest:(id)a3 homeMember:(id)a4 registrationsForAccessory:(id)a5 context:(id)a6;
- (id)_processGroupedCharacteristicsRequests:(id)a3 user:(id)a4 destination:(id)a5 context:(id)a6;
- (id)_registrationsForCharacteristicIIDs:(id)a3 accessoryUUID:(id)a4 moc:(id)a5 error:(id *)a6;
- (id)_requestToFetchMKFRegistrationsWithActionSetUUID:(id)a3 context:(id)a4;
- (id)_requestToFetchMKFRegistrationsWithMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5;
- (id)destinationsToNotifyForActionSetUUID:(id)a3;
- (id)destinationsToNotifyForCharacteristic:(id)a3;
- (id)destinationsToNotifyForMediaPropertyResponse:(id)a3;
- (id)disableAllActionSetRegistrations;
- (id)disableAllMediaProfileRegistrations;
- (id)disableNotificationForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5;
- (id)homeMemberForRegistrations:(id)a3 userUUID:(id)a4 isRestrictedGuest:(BOOL)a5 context:(id)a6;
- (id)mediaPropertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3;
- (id)processCharacteristicsRequests:(id)a3;
- (id)removeActionSetRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)removeAllActionSetRegistrations;
- (id)removeAllMediaProfileRegistrations;
- (id)removeCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)removeMediaRegistrationsWithoutAllowedDestinations:(id)a3;
- (id)shortDescription;
- (void)disableAllCharacteristicRegistrations;
- (void)removeAllCharacteristicRegistrations;
- (void)removeRegistrationsForCharacteristics:(id)a3;
@end

@implementation HMDNotificationRegistryCoreDataAdapter

- (void).cxx_destruct
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (id)shortDescription
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  v5 = [v4 backingStore];
  v6 = [v5 context];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke;
  v14 = &unk_264A2F820;
  id v15 = v4;
  id v16 = v3;
  id v7 = v3;
  id v8 = v4;
  [v6 unsafeSynchronousBlock:&v11];
  v9 = objc_msgSend(v7, "shortDescription", v11, v12, v13, v14);

  return v9;
}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  v3 = +[HMCContext findHomeWithModelID:v2];

  v4 = [v3 users];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_2;
  v5[3] = &unk_264A2A450;
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "na_each:", v5);
}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 notificationRegistrations];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_3;
  v4[3] = &unk_264A2A428;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __58__HMDNotificationRegistryCoreDataAdapter_shortDescription__block_invoke_3(uint64_t a1, void *a2)
{
  id v25 = a2;
  v3 = [v25 castIfNotificationRegistrationCharacteristic];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 enabled];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = [v4 characteristic];
      id v8 = NSString;
      v9 = [v7 service];
      v10 = [v9 accessory];
      uint64_t v11 = [v10 modelID];
      uint64_t v12 = [v7 instanceID];
      v13 = [v8 stringWithFormat:@"%@:%@", v11, v12];

      v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
      if (!v14)
      {
        v14 = [MEMORY[0x263EFF9C0] set];
        [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v13];
      }
      id v15 = [v4 deviceIdsDestination];
      id v16 = [v4 lastModified];
      v17 = NSString;
LABEL_11:
      v24 = [v17 stringWithFormat:@"%@ - %@", v15, v16];
      [v14 addObject:v24];

      goto LABEL_12;
    }
  }
  v18 = [v25 castIfNotificationRegistrationMediaProperty];
  id v7 = v18;
  if (v18)
  {
    v19 = [v18 enabled];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      v21 = NSString;
      v22 = [v7 mediaProfileIdentifier];
      v23 = [v7 mediaProperty];
      v13 = [v21 stringWithFormat:@"%@:%@", v22, v23];

      v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
      if (!v14)
      {
        v14 = [MEMORY[0x263EFF9C0] set];
        [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v13];
      }
      id v15 = [v7 deviceIdsDestination];
      id v16 = [v7 lastModified];
      v17 = NSString;
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (BOOL)_insertNotificationRegistrationForMKFActionSet:(id)a3 deviceIdsDestination:(id)a4 homeMember:(id)a5 context:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v13 managedObjectContext];
  objc_msgSend(v14, "hmd_assertIsExecuting");

  id v15 = [v12 castIfMemberIsUser];
  if (v15)
  {
    id v16 = [MEMORY[0x263F08C38] UUID];
    v17 = [v15 createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:v16];
  }
  else
  {
    v18 = [v12 castIfMemberIsGuest];
    id v16 = [v18 castIfGuest];

    if (!v16) {
      goto LABEL_7;
    }
    v19 = [MEMORY[0x263F08C38] UUID];
    v17 = [v16 createNotificationRegistrationsRelationOfTypeNotificationRegistrationActionSetWithModelID:v19];
  }
  if (v17)
  {
    [v17 setActionSet:v10];
    [v17 setDeviceIdsDestination:v11];
    int v20 = [MEMORY[0x263EFF910] now];
    [v17 setLastModified:v20];

    BOOL v21 = 1;
    goto LABEL_10;
  }
LABEL_7:
  v22 = (void *)MEMORY[0x230FBD990]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    id v25 = HMFGetLogIdentifier();
    int v27 = 138544130;
    v28 = v25;
    __int16 v29 = 2112;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create notification registration for deviceIdsDestination %@ homeMember %@ mkfActionSet %@", (uint8_t *)&v27, 0x2Au);
  }
  BOOL v21 = 0;
  v17 = 0;
LABEL_10:

  return v21;
}

- (BOOL)_insertNotificationRegistrationForMediaProperty:(id)a3 mediaProfile:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 accessory:(id)a7 context:(id)a8
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v38 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v18 managedObjectContext];
  objc_msgSend(v19, "hmd_assertIsExecuting");

  int v20 = [v16 castIfMemberIsUser];
  BOOL v21 = [v20 castIfUser];

  if (v21)
  {
    v22 = [MEMORY[0x263F08C38] UUID];
    v23 = [v21 createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:v22];
  }
  else
  {
    v24 = [v16 castIfMemberIsGuest];
    v22 = [v24 castIfGuest];

    if (!v22) {
      goto LABEL_7;
    }
    [MEMORY[0x263F08C38] UUID];
    v26 = id v25 = self;
    v23 = [v22 createNotificationRegistrationsRelationOfTypeNotificationRegistrationMediaPropertyWithModelID:v26];

    self = v25;
  }

  if (v23)
  {
    [v23 setMediaProperty:v14];
    [v15 uniqueIdentifier];
    int v27 = v15;
    __int16 v29 = v28 = v14;
    [v23 setMediaProfileIdentifier:v29];

    [v23 setAccessory:v17];
    id v30 = v38;
    [v23 setDeviceIdsDestination:v38];
    __int16 v31 = [MEMORY[0x263EFF910] now];
    [v23 setLastModified:v31];

    BOOL v32 = 1;
    goto LABEL_10;
  }
LABEL_7:
  int v27 = v15;
  v28 = v14;
  __int16 v33 = (void *)MEMORY[0x230FBD990]();
  id v34 = self;
  uint64_t v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544642;
    v40 = v36;
    __int16 v41 = 2112;
    v42 = v28;
    __int16 v43 = 2112;
    v44 = v27;
    __int16 v45 = 2112;
    id v46 = v38;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v17;
    _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create notification registration for media property %@ media profile %@ deviceIdsDestination %@ homeMember %@ mkfAccessory %@", buf, 0x3Eu);
  }
  BOOL v32 = 0;
  v23 = 0;
  id v30 = v38;
LABEL_10:

  return v32;
}

- (BOOL)_insertNotificationRegistrationForCharacteristic:(id)a3 notificationThreshold:(id)a4 deviceIdsDestination:(id)a5 homeMember:(id)a6 mkfCharacteristic:(id)a7 context:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a8 managedObjectContext];
  objc_msgSend(v16, "hmd_assertIsExecuting");

  id v17 = [v14 castIfMemberIsUser];
  id v18 = [v17 castIfUser];

  if (v18)
  {
    v19 = [MEMORY[0x263F08C38] UUID];
    int v20 = [v18 createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:v19];
  }
  else
  {
    BOOL v21 = [v14 castIfMemberIsGuest];
    v19 = [v21 castIfGuest];

    v22 = [MEMORY[0x263F08C38] UUID];
    int v20 = [v19 createNotificationRegistrationsRelationOfTypeNotificationRegistrationCharacteristicWithModelID:v22];
  }
  if (v20)
  {
    [v20 setCharacteristic:v15];
    [v20 setNotificationThreshold:v12];
    [v20 setDeviceIdsDestination:v13];
    v23 = [MEMORY[0x263EFF910] now];
    [v20 setLastModified:v23];

    [v20 setEnabled:MEMORY[0x263EFFA88]];
  }

  return v20 != 0;
}

- (BOOL)_updateThresholdRegistration:(id)a3 threshold:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 notificationThreshold];
  char v8 = HMFEqualObjects();

  if ((v8 & 1) == 0) {
    [v5 setNotificationThreshold:v6];
  }

  return v8 ^ 1;
}

- (BOOL)_disableRegistration:(id)a3
{
  id v3 = a3;
  v4 = [v3 enabled];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    [v3 setEnabled:MEMORY[0x263EFFA80]];
    id v6 = [MEMORY[0x263EFF910] now];
    [v3 setLastModified:v6];
  }
  return v5;
}

- (BOOL)_enableRegistration:(id)a3
{
  id v3 = a3;
  v4 = [v3 enabled];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    [v3 setEnabled:MEMORY[0x263EFFA88]];
    id v6 = [MEMORY[0x263EFF910] now];
    [v3 setLastModified:v6];
  }
  return v5 ^ 1;
}

- (NSSet)actionSetRegistrations
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  char v5 = [v4 backingStore];
  id v6 = [v5 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke;
  v11[3] = &unk_264A2F2F8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 unsafeSynchronousBlock:v11];
  v9 = (void *)[v7 copy];

  return (NSSet *)v9;
}

void __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [a1[4] _fetchRequestForAllActionSetRegistrations];
  id v3 = [a1[5] managedObjectContext];
  id v15 = 0;
  v4 = [v3 executeFetchRequest:v2 error:&v15];
  id v5 = v15;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all action set notification registrations, error: %@", buf, 0x16u);
    }
  }
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke_359;
  id v13 = &unk_264A2A400;
  id v14 = a1[6];
  objc_msgSend(v4, "na_each:", &v10);
  objc_msgSend(a1[5], "reset", v10, v11, v12, v13);
}

void __64__HMDNotificationRegistryCoreDataAdapter_actionSetRegistrations__block_invoke_359(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [v14 user];
  v4 = [v3 modelID];

  if (!v4)
  {
    id v5 = [v14 guest];
    v4 = [v5 modelID];
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [HMDActionSetNotificationRegistration alloc];
  id v8 = [v14 actionSet];
  v9 = [v8 modelID];
  uint64_t v10 = [v14 deviceIdsDestination];
  uint64_t v11 = [v14 lastModified];
  id v12 = [v14 enabled];
  id v13 = -[HMDActionSetNotificationRegistration initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:](v7, "initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:", v9, v10, v4, v11, [v12 BOOLValue]);
  [v6 addObject:v13];
}

- (BOOL)hasEnabledRegistrationForActionSetUUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__HMDNotificationRegistryCoreDataAdapter_hasEnabledRegistrationForActionSetUUID___block_invoke;
  v11[3] = &unk_264A2F000;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  id v9 = v4;
  id v14 = v9;
  id v15 = &v16;
  [v8 unsafeSynchronousBlock:v11];
  LOBYTE(v4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

void __81__HMDNotificationRegistryCoreDataAdapter_hasEnabledRegistrationForActionSetUUID___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchEnabledMKFRegistrationsForActionSetUUID:*(void *)(a1 + 48) context:v2];
  id v4 = v3;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count] != 0;
  }
  else
  {
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for action set uuid %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [*(id *)(a1 + 32) reset];
}

- (id)disableAllActionSetRegistrations
{
  id v3 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__235925;
  BOOL v21 = __Block_byref_object_dispose__235926;
  id v22 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke;
  __int16 v12 = &unk_264A2ADD0;
  id v6 = v5;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  [v6 unsafeSynchronousBlock:&v9];
  if (*((unsigned char *)v24 + 24)) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v18[5], v9, v10, v11, v12);
  }
  else {
  id v7 = objc_msgSend(MEMORY[0x263EFFA08], "set", v9, v10, v11, v12);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

void __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForAllActionSetRegistrations];
  id v22 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v22];
  id v5 = v22;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_358);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *(void *)int v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x2020000000;
    char v28 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_2;
    v21[3] = &unk_264A2A378;
    v21[4] = *(void *)(a1 + 40);
    v21[5] = v27;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
    if (*(unsigned char *)(*(void *)&v27[8] + 24) && [v2 hasChanges])
    {
      uint64_t v9 = *(void **)(a1 + 32);
      id v20 = v5;
      char v10 = [v9 save:&v20];
      id v11 = v20;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        __int16 v12 = (void *)MEMORY[0x230FBD990]();
        id v13 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v24 = v15;
          __int16 v25 = 2112;
          id v26 = v11;
          _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v11 = v5;
    }
    [*(id *)(a1 + 32) reset];
    _Block_object_dispose(v27, 8);
    id v5 = v11;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)int v27 = 138543618;
      *(void *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v5;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", v27, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _disableRegistration:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

id __74__HMDNotificationRegistryCoreDataAdapter_disableAllActionSetRegistrations__block_invoke_356(uint64_t a1, void *a2)
{
  v2 = [a2 actionSet];
  id v3 = [v2 modelID];

  return v3;
}

- (id)removeActionSetRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy__235925;
  id v26 = __Block_byref_object_dispose__235926;
  id v27 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke;
  v12[3] = &unk_264A2D248;
  id v8 = v7;
  id v13 = v8;
  uint64_t v14 = self;
  id v9 = v4;
  id v15 = v9;
  uint64_t v16 = &v22;
  id v17 = &v18;
  [v8 unsafeSynchronousBlock:v12];
  if (*((unsigned char *)v19 + 24)) {
    [MEMORY[0x263EFFA08] setWithArray:v23[5]];
  }
  else {
  char v10 = [MEMORY[0x263EFFA08] set];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForActionSetRegistrationsWithoutAllowedDestinations:*(void *)(a1 + 48)];
  id v26 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v26];
  id v5 = v26;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_355);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_2;
    v23[3] = &unk_264A2A378;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 64);
    id v24 = v9;
    uint64_t v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && [v2 hasChanges])
    {
      id v11 = *(void **)(a1 + 32);
      id v22 = v5;
      char v12 = [v11 save:&v22];
      id v13 = v22;

      if ((v12 & 1) == 0)
      {
        uint64_t v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 40);
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v28 = v17;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all action set registrations, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    else
    {
      id v13 = v5;
    }
    [*(id *)(a1 + 32) reset];

    id v5 = v13;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      char v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v28 = v21;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

HMDActionSetNotificationRegistration *__97__HMDNotificationRegistryCoreDataAdapter_removeActionSetRegistrationsWithoutAllowedDestinations___block_invoke_352(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 user];
  id v4 = [v3 modelID];

  if (!v4)
  {
    id v5 = [v2 guest];
    id v4 = [v5 modelID];
  }
  uint64_t v6 = [HMDActionSetNotificationRegistration alloc];
  uint64_t v7 = [v2 actionSet];
  id v8 = [v7 modelID];
  id v9 = [v2 deviceIdsDestination];
  uint64_t v10 = [v2 lastModified];
  id v11 = [v2 enabled];
  char v12 = -[HMDActionSetNotificationRegistration initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:](v6, "initWithActionSetUUID:deviceIdsDestination:userUUID:lastModified:enabled:", v8, v9, v4, v10, [v11 BOOLValue]);

  return v12;
}

- (id)removeAllActionSetRegistrations
{
  id v3 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__235925;
  char v21 = __Block_byref_object_dispose__235926;
  id v22 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke;
  char v12 = &unk_264A2ADD0;
  id v6 = v5;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = &v17;
  uint64_t v16 = &v23;
  [v6 unsafeSynchronousBlock:&v9];
  if (*((unsigned char *)v24 + 24)) {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v18[5], v9, v10, v11, v12);
  }
  else {
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "set", v9, v10, v11, v12);
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

void __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForAllActionSetRegistrations];
  id v26 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v26];
  id v5 = v26;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_351);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_2;
    v23[3] = &unk_264A2A378;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    id v24 = v9;
    uint64_t v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [v2 hasChanges])
    {
      id v11 = *(void **)(a1 + 32);
      id v22 = v5;
      char v12 = [v11 save:&v22];
      id v13 = v22;

      if ((v12 & 1) == 0)
      {
        uint64_t v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 40);
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v28 = v17;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all action set registrations, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    else
    {
      id v13 = v5;
    }
    [*(id *)(a1 + 32) reset];

    id v5 = v13;
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      char v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      char v28 = v21;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations, error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

id __73__HMDNotificationRegistryCoreDataAdapter_removeAllActionSetRegistrations__block_invoke_348(uint64_t a1, void *a2)
{
  id v2 = [a2 actionSet];
  id v3 = [v2 modelID];

  return v3;
}

- (id)destinationsToNotifyForActionSetUUID:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__235925;
  id v24 = __Block_byref_object_dispose__235926;
  id v25 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke;
  id v15 = &unk_264A2F000;
  id v8 = v7;
  id v16 = v8;
  uint64_t v17 = self;
  id v9 = v4;
  id v18 = v9;
  id v19 = &v20;
  [v8 unsafeSynchronousBlock:&v12];
  uint64_t v10 = objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchEnabledMKFRegistrationsForActionSetUUID:*(void *)(a1 + 48) context:v2];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_347_235939);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for action set: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  [*(id *)(a1 + 32) reset];
}

uint64_t __79__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForActionSetUUID___block_invoke_344(uint64_t a1, void *a2)
{
  return [a2 deviceIdsDestination];
}

- (BOOL)removeRegistrationsForActionSetUUID:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForActionSetUUID___block_invoke;
  v11[3] = &unk_264A2F000;
  id v8 = v7;
  id v12 = v8;
  int v13 = self;
  id v9 = v4;
  id v14 = v9;
  __int16 v15 = &v16;
  [v8 unsafeSynchronousBlock:v11];
  LOBYTE(v4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

void __78__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForActionSetUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  if ([*(id *)(a1 + 40) _deleteAllMKFRegistrationsForActionSetUUID:*(void *)(a1 + 48) hmcContext:*(void *)(a1 + 32)])*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1; {
  if ([v2 hasChanges])
  }
  {
    id v3 = *(void **)(a1 + 32);
    id v10 = 0;
    char v4 = [v3 save:&v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 40);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable action set notification registration changes requested, error: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  [*(id *)(a1 + 32) reset];
}

- (BOOL)disableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v11 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v12 = [v11 backingStore];
  __int16 v13 = [v12 context];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke;
  v19[3] = &unk_264A2F028;
  id v14 = v13;
  id v20 = v14;
  char v21 = self;
  id v15 = v9;
  id v22 = v15;
  id v16 = v8;
  id v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v25 = &v26;
  [v14 unsafeSynchronousBlock:v19];
  LOBYTE(v9) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v9;
}

void __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = *(void **)(a1 + 40);
  char v4 = [*(id *)(a1 + 48) uuid];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = [*(id *)(a1 + 48) isRestrictedGuest];
  id v25 = 0;
  id v8 = [v3 _fetchMKFUserAndRegistrationsWithUserUUID:v4 actionSetUUID:v6 deviceIdsDestination:v5 prefetchPaths:0 isRestrictedGuest:v7 outHomeMember:&v25 context:v2];
  id v9 = v25;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v27 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);
    }
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke_343;
    v24[3] = &unk_264A2A378;
    uint64_t v15 = *(void *)(a1 + 72);
    v24[4] = *(void *)(a1 + 40);
    v24[5] = v15;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);
    if ([v2 hasChanges])
    {
      id v16 = *(void **)(a1 + 32);
      id v23 = 0;
      char v17 = [v16 save:&v23];
      id v18 = v23;
      if ((v17 & 1) == 0)
      {
        char v19 = (void *)MEMORY[0x230FBD990]();
        id v20 = *(id *)(a1 + 40);
        char v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v27 = v22;
          __int16 v28 = 2112;
          id v29 = v18;
          _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable action set notification registration changes requested, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
    }
  }
  [*(id *)(a1 + 32) reset];
}

uint64_t __104__HMDNotificationRegistryCoreDataAdapter_disableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke_343(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _disableRegistration:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)enableNotificationForActionSetUUID:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  id v11 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v12 = [v11 backingStore];
  __int16 v13 = [v12 context];

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__HMDNotificationRegistryCoreDataAdapter_enableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke;
  v19[3] = &unk_264A2F028;
  id v14 = v13;
  id v20 = v14;
  char v21 = self;
  id v15 = v9;
  id v22 = v15;
  id v16 = v8;
  id v23 = v16;
  id v17 = v10;
  id v24 = v17;
  id v25 = &v26;
  [v14 unsafeSynchronousBlock:v19];
  LOBYTE(v9) = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return (char)v9;
}

void __103__HMDNotificationRegistryCoreDataAdapter_enableNotificationForActionSetUUID_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = *(void **)(a1 + 40);
  char v4 = [*(id *)(a1 + 48) uuid];
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v7 = [*(id *)(a1 + 48) isRestrictedGuest];
  id v39 = 0;
  id v8 = [v3 _fetchMKFUserAndRegistrationsWithUserUUID:v4 actionSetUUID:v6 deviceIdsDestination:v5 prefetchPaths:0 isRestrictedGuest:v7 outHomeMember:&v39 context:v2];
  id v9 = v39;

  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 40);
    __int16 v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v41 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);
    }
    goto LABEL_26;
  }
  uint64_t v15 = [v8 count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v16 = v8;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        if ([*(id *)(a1 + 40) _enableRegistration:*(void *)(*((void *)&v35 + 1) + 8 * i)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          goto LABEL_19;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  if (!v15)
  {
    uint64_t v28 = [*(id *)(a1 + 40) _fetchMKFActionSetWithUUID:*(void *)(a1 + 56) context:v2];
    if (v28)
    {
      if ([*(id *)(a1 + 40) _insertNotificationRegistrationForMKFActionSet:v28 deviceIdsDestination:*(void *)(a1 + 64) homeMember:v9 context:*(void *)(a1 + 32)])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;

        goto LABEL_20;
      }
    }
    else
    {
      char v29 = (void *)MEMORY[0x230FBD990]();
      id v30 = *(id *)(a1 + 40);
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        BOOL v32 = HMFGetLogIdentifier();
        __int16 v33 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v32;
        __int16 v42 = 2112;
        id v43 = v33;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch MKFActionSet for UUID %@", buf, 0x16u);
      }
    }
    [*(id *)(a1 + 32) reset];

    goto LABEL_27;
  }
LABEL_20:
  if ([v2 hasChanges])
  {
    char v21 = *(void **)(a1 + 32);
    id v34 = 0;
    char v22 = [v21 save:&v34];
    id v23 = v34;
    if ((v22 & 1) == 0)
    {
      id v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = *(id *)(a1 + 40);
      uint64_t v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        __int16 v41 = v27;
        __int16 v42 = 2112;
        id v43 = v23;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable action set registration changes requested, error: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    }
  }
LABEL_26:
  [*(id *)(a1 + 32) reset];
LABEL_27:
}

- (NSSet)mediaRegistrations
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  char v4 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v5 = [v4 backingStore];
  uint64_t v6 = [v5 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke;
  v11[3] = &unk_264A2F2F8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 unsafeSynchronousBlock:v11];
  id v9 = (void *)[v7 copy];

  return (NSSet *)v9;
}

void __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] _fetchRequestForAllMediaProfileRegistrations];
  id v3 = [a1[5] managedObjectContext];
  id v15 = 0;
  char v4 = [v3 executeFetchRequest:v2 error:&v15];
  id v5 = v15;

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all media property notification registrations, error: %@", buf, 0x16u);
    }
  }
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke_341;
  id v13 = &unk_264A2A350;
  id v14 = a1[6];
  objc_msgSend(v4, "na_each:", &v10);
  objc_msgSend(a1[5], "reset", v10, v11, v12, v13);
}

void __60__HMDNotificationRegistryCoreDataAdapter_mediaRegistrations__block_invoke_341(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 user];
  char v4 = [v3 modelID];

  if (!v4)
  {
    id v5 = [v13 guest];
    char v4 = [v5 modelID];
  }
  uint64_t v6 = [HMDMediaPropertyNotificationRegistration alloc];
  id v7 = [v13 mediaProfileIdentifier];
  id v8 = [v13 mediaProperty];
  id v9 = [v13 deviceIdsDestination];
  uint64_t v10 = [v13 lastModified];
  uint64_t v11 = [v13 enabled];
  id v12 = -[HMDMediaPropertyNotificationRegistration initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:](v6, "initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:", v7, v8, v9, v4, v10, [v11 BOOLValue]);

  [*(id *)(a1 + 32) addObject:v12];
}

- (id)removeMediaRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__235925;
  uint64_t v28 = __Block_byref_object_dispose__235926;
  id v29 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  id v7 = [v6 context];

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke;
  v14[3] = &unk_264A2D248;
  id v8 = v7;
  id v15 = v8;
  id v16 = self;
  id v9 = v4;
  id v17 = v9;
  __int16 v18 = &v24;
  id v19 = &v20;
  [v8 unsafeSynchronousBlock:v14];
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v11 = (void *)[(id)v25[5] copy];
    id v12 = [v10 setWithArray:v11];
  }
  else
  {
    id v12 = [MEMORY[0x263EFFA08] set];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForMediaProfileRegistrationsWithoutAllowedDestinations:*(void *)(a1 + 48)];
  id v26 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v26];
  id v5 = v26;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_340_235951);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_2;
    v23[3] = &unk_264A2A2C0;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 64);
    id v24 = v9;
    uint64_t v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) && [v2 hasChanges])
    {
      uint64_t v11 = *(void **)(a1 + 32);
      id v22 = v5;
      char v12 = [v11 save:&v22];
      id v13 = v22;

      if ((v12 & 1) == 0)
      {
        id v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 40);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v28 = v17;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    else
    {
      id v13 = v5;
    }
    [*(id *)(a1 + 32) reset];

    id v5 = v13;
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      char v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v21;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

HMDMediaPropertyNotificationRegistration *__93__HMDNotificationRegistryCoreDataAdapter_removeMediaRegistrationsWithoutAllowedDestinations___block_invoke_337(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 user];
  id v4 = [v3 modelID];

  if (!v4)
  {
    id v5 = [v2 guest];
    id v4 = [v5 modelID];
  }
  uint64_t v6 = [HMDMediaPropertyNotificationRegistration alloc];
  uint64_t v7 = [v2 mediaProfileIdentifier];
  id v8 = [v2 mediaProperty];
  id v9 = [v2 deviceIdsDestination];
  uint64_t v10 = [v2 lastModified];
  uint64_t v11 = [v2 enabled];
  char v12 = -[HMDMediaPropertyNotificationRegistration initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:](v6, "initWithMediaProfileUniqueIdentifier:mediaProperty:deviceIdsDestination:userUUID:lastModified:enabled:", v7, v8, v9, v4, v10, [v11 BOOLValue]);

  return v12;
}

- (id)disableAllMediaProfileRegistrations
{
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v5 = [v4 backingStore];
  uint64_t v6 = [v5 context];

  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke;
  id v16 = &unk_264A2F000;
  id v7 = v6;
  id v17 = v7;
  __int16 v18 = self;
  id v8 = v3;
  id v19 = v8;
  uint64_t v20 = &v21;
  [v7 unsafeSynchronousBlock:&v13];
  id v9 = (void *)MEMORY[0x263EFFA08];
  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v10 = objc_msgSend(v8, "copy", v13, v14, v15, v16, v17, v18);
    uint64_t v11 = [v9 setWithArray:v10];
  }
  else
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "set", v13, v14, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForAllMediaProfileRegistrations];
  id v22 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v22];
  id v5 = v22;
  if (v4)
  {
    *(void *)id v27 = 0;
    *(void *)&v27[8] = v27;
    *(void *)&v27[16] = 0x2020000000;
    char v28 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke_336;
    v19[3] = &unk_264A2A308;
    uint64_t v6 = *(void **)(a1 + 48);
    void v19[4] = *(void *)(a1 + 40);
    uint64_t v21 = v27;
    id v20 = v6;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
    if (*(unsigned char *)(*(void *)&v27[8] + 24) && [v2 hasChanges])
    {
      id v7 = *(void **)(a1 + 32);
      id v18 = v5;
      char v8 = [v7 save:&v18];
      id v9 = v18;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        uint64_t v10 = (void *)MEMORY[0x230FBD990]();
        id v11 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        char v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          char v24 = v13;
          __int16 v25 = 2112;
          id v26 = v9;
          _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v9 = v5;
    }
    [*(id *)(a1 + 32) reset];

    _Block_object_dispose(v27, 8);
    id v5 = v9;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    id v15 = *(id *)(a1 + 40);
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)id v27 = 138543618;
      *(void *)&v27[4] = v17;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v5;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", v27, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

void __77__HMDNotificationRegistryCoreDataAdapter_disableAllMediaProfileRegistrations__block_invoke_336(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_disableRegistration:"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v3 = *(void **)(a1 + 40);
    id v4 = [v5 mediaProfileIdentifier];
    [v3 addObject:v4];
  }
}

- (id)removeAllMediaProfileRegistrations
{
  uint64_t v23 = 0;
  char v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__235925;
  id v27 = __Block_byref_object_dispose__235926;
  id v28 = (id)MEMORY[0x263EFFA68];
  id v3 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke;
  uint64_t v14 = &unk_264A2ADD0;
  id v6 = v5;
  id v15 = v6;
  id v16 = self;
  id v17 = &v23;
  id v18 = &v19;
  [v6 unsafeSynchronousBlock:&v11];
  id v7 = (void *)MEMORY[0x263EFFA08];
  if (*((unsigned char *)v20 + 24))
  {
    char v8 = objc_msgSend((id)v24[5], "copy", v11, v12, v13, v14);
    id v9 = [v7 setWithArray:v8];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x263EFFA08], "set", v11, v12, v13, v14);
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v9;
}

void __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForAllMediaProfileRegistrations];
  id v26 = 0;
  id v4 = [v2 executeFetchRequest:v3 error:&v26];
  id v5 = v26;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_335);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    char v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_2;
    v23[3] = &unk_264A2A2C0;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 56);
    id v24 = v9;
    uint64_t v25 = v10;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) && [v2 hasChanges])
    {
      uint64_t v11 = *(void **)(a1 + 32);
      id v22 = v5;
      char v12 = [v11 save:&v22];
      id v13 = v22;

      if ((v12 & 1) == 0)
      {
        uint64_t v14 = (void *)MEMORY[0x230FBD990]();
        id v15 = *(id *)(a1 + 40);
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v28 = v17;
          __int16 v29 = 2112;
          id v30 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove all media profile registrations, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }
    }
    else
    {
      id v13 = v5;
    }
    [*(id *)(a1 + 32) reset];

    id v5 = v13;
  }
  else
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = *(id *)(a1 + 40);
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v28 = v21;
      __int16 v29 = 2112;
      id v30 = v5;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations, error: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) reset];
  }
}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_removeAllMediaProfileRegistrations__block_invoke_333(uint64_t a1, void *a2)
{
  return [a2 mediaProfileIdentifier];
}

- (id)mediaPropertiesRegisteredForMediaProfileUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__235925;
  id v24 = __Block_byref_object_dispose__235926;
  id v25 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke;
  id v15 = &unk_264A2F000;
  id v8 = v7;
  id v16 = v8;
  id v17 = self;
  id v9 = v4;
  id v18 = v9;
  id v19 = &v20;
  [v8 unsafeSynchronousBlock:&v12];
  uint64_t v10 = objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchEnabledMKFRegistrationsForMediaProfileUUID:*(void *)(a1 + 48) withMediaProperty:0 context:v2];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_332_235963);
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for media profile uuid %@", (uint8_t *)&v13, 0x16u);
    }
  }
  [*(id *)(a1 + 32) reset];
}

uint64_t __99__HMDNotificationRegistryCoreDataAdapter_mediaPropertiesRegisteredForMediaProfileUniqueIdentifier___block_invoke_330(uint64_t a1, void *a2)
{
  return [a2 mediaProperty];
}

- (id)destinationsToNotifyForMediaPropertyResponse:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__235925;
  id v24 = __Block_byref_object_dispose__235926;
  id v25 = (id)MEMORY[0x263EFFA68];
  uint64_t v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke;
  __int16 v15 = &unk_264A2F000;
  id v8 = v7;
  id v16 = v8;
  id v9 = v4;
  id v17 = v9;
  id v18 = self;
  id v19 = &v20;
  [v8 unsafeSynchronousBlock:&v12];
  uint64_t v10 = objc_msgSend((id)v21[5], "copy", v12, v13, v14, v15);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) request];
  id v4 = [v3 property];
  uint64_t v5 = [v3 mediaProfile];
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v7 = [v5 uniqueIdentifier];
  id v8 = [v6 _fetchEnabledMKFRegistrationsForMediaProfileUUID:v7 withMediaProperty:v4 context:v2];

  if (v8)
  {
    uint64_t v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_329);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 40);
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for media property response: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  [*(id *)(a1 + 32) reset];
}

uint64_t __87__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForMediaPropertyResponse___block_invoke_326(uint64_t a1, void *a2)
{
  return [a2 deviceIdsDestination];
}

- (BOOL)removeRegistrationsForMediaProfile:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v6 = [v5 backingStore];
  uint64_t v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForMediaProfile___block_invoke;
  v11[3] = &unk_264A2F000;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  id v9 = v4;
  id v14 = v9;
  __int16 v15 = &v16;
  [v8 unsafeSynchronousBlock:v11];
  LOBYTE(v4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

void __77__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForMediaProfile___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) uniqueIdentifier];
  LODWORD(v3) = [v3 _deleteAllMKFRegistrationsForMediaProfileUUID:v4 withMediaProperty:0 hmcContext:*(void *)(a1 + 32)];

  if (v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  if ([v2 hasChanges])
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v12 = 0;
    char v6 = [v5 save:&v12];
    id v7 = v12;
    if ((v6 & 1) == 0)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 40);
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v14 = v11;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable media property notification registration changes requested, error: %@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
  [*(id *)(a1 + 32) reset];
}

- (BOOL)disableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v31 = 0;
  BOOL v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v14 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  __int16 v15 = [v14 backingStore];
  id v16 = [v15 context];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke;
  v23[3] = &unk_264A2A298;
  id v17 = v16;
  id v24 = v17;
  id v18 = v10;
  id v25 = v18;
  id v26 = self;
  id v19 = v12;
  id v27 = v19;
  id v20 = v11;
  id v28 = v20;
  id v21 = v13;
  id v29 = v21;
  id v30 = &v31;
  [v17 unsafeSynchronousBlock:v23];
  LOBYTE(v12) = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return (char)v12;
}

void __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) accessory];
  id v4 = [v3 uuid];

  uint64_t v5 = *(void **)(a1 + 48);
  char v6 = [*(id *)(a1 + 56) uuid];
  id v7 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 72);
  char v10 = [*(id *)(a1 + 56) isRestrictedGuest];
  id v28 = 0;
  LOBYTE(v25) = v10;
  id v11 = [v5 _fetchMKFUserAndRegistrationsWithUserUUID:v6 withMediaProfileUUID:v7 withMediaPropertyIn:v9 withDeviceIdsDestination:v8 withAccessoryUUID:v4 withPrefetchPaths:0 isRestrictedGuest:v25 outHomeMember:&v28 context:v2];
  id v12 = v28;

  if (v11 && v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_325;
    v27[3] = &unk_264A2A2C0;
    uint64_t v13 = *(void *)(a1 + 80);
    v27[4] = *(void *)(a1 + 48);
    v27[5] = v13;
    objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v27);
    if ([v2 hasChanges])
    {
      id v14 = *(void **)(a1 + 32);
      id v26 = 0;
      char v15 = [v14 save:&v26];
      id v16 = v26;
      if ((v15 & 1) == 0)
      {
        id v17 = (void *)MEMORY[0x230FBD990]();
        id v18 = *(id *)(a1 + 48);
        id v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v30 = v20;
          __int16 v31 = 2112;
          id v32 = v16;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable media property notification registration changes requested, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      }
    }
  }
  else
  {
    id v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 48);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v30 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) reset];
}

uint64_t __119__HMDNotificationRegistryCoreDataAdapter_disableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_325(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _disableRegistration:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)enableNotificationForMediaProfile:(id)a3 mediaProperties:(id)a4 user:(id)a5 deviceIdsDestination:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v14 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  char v15 = [v14 backingStore];
  id v16 = [v15 context];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke;
  v23[3] = &unk_264A2A298;
  id v17 = v16;
  id v24 = v17;
  id v18 = v10;
  id v25 = v18;
  id v26 = self;
  id v19 = v12;
  id v27 = v19;
  id v20 = v11;
  id v28 = v20;
  id v21 = v13;
  id v29 = v21;
  id v30 = &v31;
  [v17 unsafeSynchronousBlock:v23];
  LOBYTE(v12) = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v31, 8);
  return (char)v12;
}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) accessory];
  id v4 = [v3 uuid];

  uint64_t v5 = *(void **)(a1 + 48);
  char v6 = [*(id *)(a1 + 56) uuid];
  id v7 = [*(id *)(a1 + 40) uniqueIdentifier];
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  char v10 = [*(id *)(a1 + 56) isRestrictedGuest];
  id v41 = 0;
  LOBYTE(v29) = v10;
  id v11 = [v5 _fetchMKFUserAndRegistrationsWithUserUUID:v6 withMediaProfileUUID:v7 withMediaPropertyIn:v8 withDeviceIdsDestination:v9 withAccessoryUUID:v4 withPrefetchPaths:0 isRestrictedGuest:v29 outHomeMember:&v41 context:v2];
  id v12 = v41;

  if (v11 && v12)
  {
    *(void *)&long long v46 = 0;
    *((void *)&v46 + 1) = &v46;
    uint64_t v47 = 0x3032000000;
    id v48 = __Block_byref_object_copy__235925;
    __int16 v49 = __Block_byref_object_dispose__235926;
    id v50 = 0;
    id v13 = *(void **)(a1 + 64);
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_323;
    v32[3] = &unk_264A2A270;
    id v14 = v11;
    uint64_t v15 = *(void *)(a1 + 80);
    id v33 = v14;
    uint64_t v39 = v15;
    v40 = &v46;
    int8x16_t v30 = *(int8x16_t *)(a1 + 40);
    id v16 = (id)v30.i64[0];
    int8x16_t v34 = vextq_s8(v30, v30, 8uLL);
    id v17 = v2;
    id v35 = v17;
    id v36 = *(id *)(a1 + 72);
    id v37 = v12;
    id v38 = *(id *)(a1 + 32);
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
    if ([v17 hasChanges])
    {
      id v18 = *(void **)(a1 + 32);
      id v31 = 0;
      char v19 = [v18 save:&v31];
      id v20 = v31;
      if ((v19 & 1) == 0)
      {
        id v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v24 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v43 = v24;
          __int16 v44 = 2112;
          id v45 = v20;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable media property notification registration changes requested, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      }
    }
    [*(id *)(a1 + 32) reset];

    _Block_object_dispose(&v46, 8);
  }
  else
  {
    id v25 = (void *)MEMORY[0x230FBD990]();
    id v26 = *(id *)(a1 + 48);
    id v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = HMFGetLogIdentifier();
      LODWORD(v46) = 138543362;
      *(void *)((char *)&v46 + 4) = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch user and registrations", (uint8_t *)&v46, 0xCu);
    }
    [*(id *)(a1 + 32) reset];
  }
}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_323(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  char v6 = *(void **)(a1 + 32);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  id v24 = __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_2;
  id v25 = &unk_264A2A248;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 40);
  id v26 = v7;
  uint64_t v27 = v8;
  uint64_t v9 = *(void *)(a1 + 88);
  id v28 = &v30;
  uint64_t v29 = v9;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v22);
  if (*((unsigned char *)v31 + 24)) {
    goto LABEL_10;
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v10) {
    goto LABEL_5;
  }
  id v11 = objc_msgSend(*(id *)(a1 + 48), "accessory", v22, v23, v24, v25);
  id v12 = *(void **)(a1 + 40);
  id v13 = [v11 uuid];
  uint64_t v14 = [v12 _fetchMKFHAPAccessoryWithUUID:v13 context:*(void *)(a1 + 56)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
LABEL_5:
    if (objc_msgSend(*(id *)(a1 + 40), "_insertNotificationRegistrationForMediaProperty:mediaProfile:deviceIdsDestination:homeMember:accessory:context:", v7, *(void *)(a1 + 48), *(void *)(a1 + 64), *(void *)(a1 + 72), v10, *(void *)(a1 + 80), v22, v23, v24, v25))*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1; {
    goto LABEL_10;
    }
  }
  id v17 = (void *)MEMORY[0x230FBD990]();
  id v18 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  char v19 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v11 uuid];
    *(_DWORD *)buf = 138543618;
    id v35 = v20;
    __int16 v36 = 2112;
    id v37 = v21;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch MKFHAPAccessory for UUID %@", buf, 0x16u);
  }
  *a3 = 1;

LABEL_10:
  _Block_object_dispose(&v30, 8);
}

void __118__HMDNotificationRegistryCoreDataAdapter_enableNotificationForMediaProfile_mediaProperties_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  uint64_t v8 = [v6 mediaProperty];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    if ([*(id *)(a1 + 40) _enableRegistration:v9]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

- (NSSet)characteristicRegistrations
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v5 = [v4 backingStore];
  id v6 = [v5 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke;
  v11[3] = &unk_264A2F2F8;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 unsafeSynchronousBlock:v11];
  id v9 = (void *)[v7 copy];

  return (NSSet *)v9;
}

void __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] _fetchRequestForAllCharacteristicRegistrations];
  id v3 = [a1[5] managedObjectContext];
  id v19 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v19];
  id v5 = v19;

  if (!v4)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v5;
      uint64_t v10 = "%{public}@Unable to fetch all characteristic registrations, error: %@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 22;
LABEL_8:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, buf, v13);
    }
LABEL_9:

    [a1[5] reset];
    goto LABEL_10;
  }
  if (![v4 count])
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = a1[4];
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v21 = v9;
      uint64_t v10 = "%{public}@Found no characteristic registrations";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke_322;
  id v17 = &unk_264A2A220;
  id v18 = a1[6];
  objc_msgSend(v4, "na_each:", &v14);
  objc_msgSend(a1[5], "reset", v14, v15, v16, v17);

LABEL_10:
}

void __69__HMDNotificationRegistryCoreDataAdapter_characteristicRegistrations__block_invoke_322(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v2 = [v19 user];
  id v3 = [v2 modelID];

  if (!v3)
  {
    id v4 = [v19 guest];
    id v3 = [v4 modelID];
  }
  uint64_t v15 = [HMDCharacteristicNotificationRegistration alloc];
  id v17 = [v19 characteristic];
  id v16 = [v17 service];
  id v5 = [v16 accessory];
  id v6 = [v5 modelID];
  id v7 = [v19 characteristic];
  id v8 = [v7 instanceID];
  id v9 = [v19 deviceIdsDestination];
  uint64_t v10 = [v19 lastModified];
  id v11 = [v19 enabled];
  uint64_t v12 = [v11 BOOLValue];
  uint32_t v13 = [v19 notificationThreshold];
  uint64_t v14 = [(HMDCharacteristicNotificationRegistration *)v15 initWithAccessoryUUID:v6 characteristicInstanceID:v8 deviceIdsDestination:v9 userUUID:v3 lastModified:v10 enabled:v12 notificationThreshold:v13];

  [*(id *)(a1 + 32) addObject:v14];
}

- (NSSet)enabledCharacteristicRegistrations
{
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = [(HMDNotificationRegistryCoreDataAdapter *)self characteristicRegistrations];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_321);

  return (NSSet *)v5;
}

uint64_t __76__HMDNotificationRegistryCoreDataAdapter_enabledCharacteristicRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 enabled];
}

- (id)removeCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  id v6 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v7 = [v6 backingStore];
  id v8 = [v7 context];

  uint64_t v21 = 0;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke;
  v15[3] = &unk_264A2F078;
  id v9 = v8;
  id v16 = v9;
  id v17 = self;
  id v10 = v4;
  id v18 = v10;
  id v20 = &v21;
  id v11 = v5;
  id v19 = v11;
  [v9 unsafeSynchronousBlock:v15];
  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v12 = [v11 copy];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFFA08] set];
  }
  uint32_t v13 = (void *)v12;

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) _fetchRequestForCharacteristicRegistrationsWithoutAllowedDestinations:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  id v35 = 0;
  id v5 = [v4 executeFetchRequest:v3 error:&v35];
  id v6 = v35;

  if (!v5)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = *(id *)(a1 + 40);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v37 = v10;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all characteristic registrations without allowed destinations, error: %@", buf, 0x16u);
    }
  }
  if ([v5 count])
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_317;
    v33[3] = &unk_264A2A1B0;
    v33[4] = *(void *)(a1 + 40);
    id v34 = *(id *)(a1 + 56);
    objc_msgSend(v5, "na_each:", v33);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_318;
    v30[3] = &unk_264A2A1D8;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 64);
    id v31 = v11;
    uint64_t v32 = v12;
    uint64_t v13 = objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      if ([v2 hasChanges])
      {
        uint64_t v14 = *(void **)(a1 + 32);
        id v29 = v6;
        char v15 = [v14 save:&v29];
        id v16 = v29;

        if ((v15 & 1) == 0)
        {
          id v17 = (void *)MEMORY[0x230FBD990]();
          id v18 = *(id *)(a1 + 40);
          id v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            id v20 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v37 = v20;
            __int16 v38 = 2112;
            id v39 = v16;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after removing characteristic registrations without allowed destinations, error: %@", buf, 0x16u);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        }
        id v6 = v16;
      }
    }
    else
    {
      id v25 = (void *)MEMORY[0x230FBD990](v13);
      id v26 = *(id *)(a1 + 40);
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v37 = v28;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Did not delete characteristic registrations without allowed destinations", buf, 0xCu);
      }
    }
    [*(id *)(a1 + 32) reset];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = *(id *)(a1 + 40);
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      char v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v37 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@No notifications without allowed destinations", buf, 0xCu);
    }
    [*(id *)(a1 + 32) reset];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_317(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 user];
  uint64_t v4 = [v3 modelID];

  if (!v4)
  {
    id v5 = [v2 guest];
    uint64_t v4 = [v5 modelID];
  }
  char v24 = [HMDCharacteristicNotificationRegistration alloc];
  id v22 = [v2 characteristic];
  uint64_t v21 = [v22 service];
  id v20 = [v21 accessory];
  id v6 = [v20 modelID];
  id v7 = [v2 characteristic];
  id v8 = [v7 instanceID];
  id v9 = [v2 deviceIdsDestination];
  id v10 = [v2 lastModified];
  id v11 = [v2 enabled];
  uint64_t v12 = [v11 BOOLValue];
  uint64_t v13 = [v2 notificationThreshold];
  uint64_t v14 = v24;
  id v25 = (void *)v4;
  char v15 = [(HMDCharacteristicNotificationRegistration *)v14 initWithAccessoryUUID:v6 characteristicInstanceID:v8 deviceIdsDestination:v9 userUUID:v4 lastModified:v10 enabled:v12 notificationThreshold:v13];

  id v16 = (void *)MEMORY[0x230FBD990]();
  id v17 = *(id *)(a1 + 32);
  id v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v19;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Removing registration: %@ that is not in set of allowed destinations", buf, 0x16u);
  }
  [*(id *)(a1 + 40) addObject:v15];
}

uint64_t __102__HMDNotificationRegistryCoreDataAdapter_removeCharacteristicRegistrationsWithoutAllowedDestinations___block_invoke_318(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

- (void)disableAllCharacteristicRegistrations
{
  id v3 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v4 = [v3 backingStore];
  id v5 = [v4 context];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [v6 unsafeSynchronousBlock:v7];
}

void __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _fetchRequestForAllCharacteristicRegistrations];
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v22 = 0;
  uint64_t v4 = [v3 executeFetchRequest:v2 error:&v22];
  id v5 = v22;

  if (!v4)
  {
    char v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v27 = 138543618;
      *(void *)&v27[4] = v18;
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v5;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch all characteristic registrations to disable, error: %@", v27, 0x16u);
    }
    goto LABEL_16;
  }
  if (![v4 count])
  {
    char v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = *(id *)(a1 + 32);
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v27 = 138543362;
      *(void *)&v27[4] = v19;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Found no characteristic registrations to disable", v27, 0xCu);
    }
LABEL_16:

    goto LABEL_17;
  }
  *(void *)uint64_t v27 = 0;
  *(void *)&v27[8] = v27;
  *(void *)&v27[16] = 0x2020000000;
  char v28 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke_315;
  v21[3] = &unk_264A2A188;
  v21[4] = *(void *)(a1 + 32);
  v21[5] = v27;
  objc_msgSend(v4, "na_each:", v21);
  id v6 = [*(id *)(a1 + 40) managedObjectContext];
  id v7 = v6;
  if (*(unsigned char *)(*(void *)&v27[8] + 24) && [v6 hasChanges])
  {
    id v8 = *(void **)(a1 + 40);
    id v20 = 0;
    char v9 = [v8 save:&v20];
    id v10 = v20;
    if ((v9 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x230FBD990]();
      id v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      uint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        char v24 = v14;
        __int16 v25 = 2112;
        id v26 = v10;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after disabling all characteristic registrations, error: %@", buf, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 40) reset];

  _Block_object_dispose(v27, 8);
LABEL_17:
}

uint64_t __79__HMDNotificationRegistryCoreDataAdapter_disableAllCharacteristicRegistrations__block_invoke_315(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _disableRegistration:a2];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)removeAllCharacteristicRegistrations
{
  id v3 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v4 = [v3 backingStore];
  id v5 = [v4 context];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HMDNotificationRegistryCoreDataAdapter_removeAllCharacteristicRegistrations__block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v5;
  char v9 = self;
  id v6 = v5;
  [v6 unsafeSynchronousBlock:v7];
}

void __78__HMDNotificationRegistryCoreDataAdapter_removeAllCharacteristicRegistrations__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  if ([*(id *)(a1 + 40) _deleteAllCharacteristicRegistrationsWithContext:*(void *)(a1 + 32)]&& objc_msgSend(v2, "hasChanges"))
  {
    id v3 = *(void **)(a1 + 32);
    id v10 = 0;
    char v4 = [v3 save:&v10];
    id v5 = v10;
    if ((v4 & 1) == 0)
    {
      id v6 = (void *)MEMORY[0x230FBD990]();
      id v7 = *(id *)(a1 + 40);
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        char v9 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v12 = v9;
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to save context after removing all characteristic registrations, error: %@", buf, 0x16u);
      }
    }
  }
  [*(id *)(a1 + 32) reset];
}

- (id)_filterCharacteristicRegistrations:(id)a3 home:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__HMDNotificationRegistryCoreDataAdapter__filterCharacteristicRegistrations_home___block_invoke;
  v9[3] = &unk_264A2A160;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "na_map:", v9);

  return v7;
}

id __82__HMDNotificationRegistryCoreDataAdapter__filterCharacteristicRegistrations_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 user];

  if (v4)
  {
    id v5 = [v3 deviceIdsDestination];
  }
  else
  {
    id v5 = [v3 guest];

    if (v5)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = [v3 guest];
      char v9 = [v8 modelID];
      id v10 = [v7 userWithUUID:v9];

      if ([v10 isAccessCurrentlyAllowedBySchedule])
      {
        id v5 = [v3 deviceIdsDestination];
      }
      else
      {

        id v5 = 0;
      }
    }
  }

  return v5;
}

- (id)destinationsToNotifyForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__235925;
  uint64_t v23 = __Block_byref_object_dispose__235926;
  id v24 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke;
  v13[3] = &unk_264A2F078;
  id v8 = v7;
  id v14 = v8;
  uint64_t v15 = self;
  id v9 = v4;
  id v16 = v9;
  id v18 = &v19;
  id v10 = v5;
  id v17 = v10;
  [v8 unsafeSynchronousBlock:v13];
  id v11 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = *(void **)(a1 + 40);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObject:*(void *)(a1 + 48)];
  id v5 = [v3 _fetchEnabledMKFRegistrationsForHMDCharacteristics:v4 context:v2];

  if (v5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke_313;
    v15[3] = &unk_264A2A078;
    id v16 = *(id *)(a1 + 48);
    id v6 = objc_msgSend(v5, "na_filter:", v15);

    uint64_t v7 = [*(id *)(a1 + 40) _filterCharacteristicRegistrations:v6 home:*(void *)(a1 + 56)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = HMFGetLogIdentifier();
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for characteristic %@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 32) reset];
}

BOOL __80__HMDNotificationRegistryCoreDataAdapter_destinationsToNotifyForCharacteristic___block_invoke_313(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 notificationThreshold];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) previousValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    [v7 doubleValue];
    double v9 = v8;

    id v10 = [v3 notificationThreshold];
    [v10 doubleValue];
    if (fabs(v11) >= 2.22044605e-16) {
      double v9 = round(v9 / v11) * v11;
    }

    id v12 = [*(id *)(a1 + 32) value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v13 = v12;
    }
    else {
      __int16 v13 = 0;
    }
    id v14 = v13;

    [v14 doubleValue];
    double v16 = v15;

    id v17 = [v3 notificationThreshold];
    [v17 doubleValue];
    if (fabs(v18) >= 2.22044605e-16) {
      double v16 = round(v16 / v18) * v18;
    }

    BOOL v19 = vabdd_f64(v9, v16) >= 2.22044605e-16;
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (void)removeRegistrationsForCharacteristics:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
    id v6 = [v5 backingStore];
    id v7 = [v6 context];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke;
    v9[3] = &unk_264A2F2F8;
    id v10 = v7;
    id v11 = v4;
    id v12 = self;
    id v8 = v7;
    [v8 unsafeSynchronousBlock:v9];
  }
}

void __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] managedObjectContext];
  id v3 = [a1[5] objectAtIndexedSubscript:0];
  id v4 = [v3 service];
  id v5 = [v4 accessory];
  id v6 = [v5 uuid];

  id v7 = objc_msgSend(a1[5], "na_map:", &__block_literal_global_306);
  id v8 = updatedCharacteristicIIDs(v7);

  if ([a1[6] _deleteAllRegistrationsForCharacteristicIIDs:v8 withAccessoryUUID:v6 hmcContext:a1[4]]&& objc_msgSend(v2, "hasChanges"))
  {
    id v9 = a1[4];
    id v16 = 0;
    char v10 = [v9 save:&v16];
    id v11 = v16;
    if ((v10 & 1) == 0)
    {
      id v12 = (void *)MEMORY[0x230FBD990]();
      id v13 = a1[6];
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        double v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        double v18 = v15;
        __int16 v19 = 2112;
        uint64_t v20 = @"YES";
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the remove characteristic notification registration changes requested, deleteResult %@, error: %@", buf, 0x20u);
      }
    }
  }
  [a1[4] reset];
}

uint64_t __80__HMDNotificationRegistryCoreDataAdapter_removeRegistrationsForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 instanceID];
}

- (id)_processDisableCharacteristicsRequest:(id)a3 registrationsForAccessory:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 managedObjectContext];
  objc_msgSend(v11, "hmd_assertIsExecuting");

  id v12 = [v8 characteristicThresholds];
  id v13 = [MEMORY[0x263EFF980] array];
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  int v28 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke;
  v21[3] = &unk_264A29F48;
  id v14 = v12;
  id v22 = v14;
  uint64_t v23 = self;
  __int16 v25 = v27;
  id v26 = &v29;
  id v15 = v13;
  id v24 = v15;
  objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);
  id v16 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  int v17 = *((unsigned __int8 *)v30 + 24);
  double v18 = (void *)[v15 copy];
  __int16 v19 = [(HMDNotificationRegistryCoreDataCharacteristicsRequestResult *)v16 initWithCoreDataRequest:v8 didSucceed:1 didModify:v17 != 0 didModifyThresholdOnly:0 modifiedCharacteristics:v18];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke_2;
  v13[3] = &unk_264A2A138;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  uint64_t v17 = *(void *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v12;
  long long v16 = v12;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  unint64_t v11 = *(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if ([*(id *)(a1 + 32) count] <= v11) {
    *a4 = 1;
  }
}

void __114__HMDNotificationRegistryCoreDataAdapter__processDisableCharacteristicsRequest_registrationsForAccessory_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v6 = [v13 characteristic];
  id v7 = [v6 instanceID];
  id v8 = [*(id *)(a1 + 32) characteristic];
  uint64_t v9 = [v8 instanceID];
  int v10 = HAPEqualInstanceIDs();

  if (v10)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *a4 = 1;
    if ([*(id *)(a1 + 40) _disableRegistration:*(void *)(a1 + 32)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      unint64_t v11 = *(void **)(a1 + 48);
      long long v12 = [v13 characteristic];
      [v11 addObject:v12];
    }
  }
}

- (id)_processEnableCharacteristicsRequest:(id)a3 homeMember:(id)a4 registrationsForAccessory:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v28 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v12 managedObjectContext];
  objc_msgSend(v13, "hmd_assertIsExecuting");

  id v14 = [v10 characteristicThresholds];
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 1;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__235925;
  v41[4] = __Block_byref_object_dispose__235926;
  id v42 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke;
  v29[3] = &unk_264A2A110;
  id v27 = v11;
  id v30 = v27;
  uint64_t v31 = self;
  id v37 = &v51;
  id v16 = v15;
  id v32 = v16;
  __int16 v38 = &v47;
  id v39 = v41;
  id v17 = v14;
  id v33 = v17;
  id v18 = v12;
  id v34 = v18;
  uint64_t v40 = &v43;
  id v19 = v10;
  id v35 = v19;
  id v20 = v28;
  id v36 = v20;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v29);
  __int16 v21 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  int v22 = *((unsigned __int8 *)v44 + 24);
  int v23 = *((unsigned __int8 *)v52 + 24);
  LODWORD(v11) = *((unsigned __int8 *)v48 + 24);
  id v24 = (void *)[v16 copy];
  __int16 v25 = [(HMDNotificationRegistryCoreDataCharacteristicsRequestResult *)v21 initWithCoreDataRequest:v19 didSucceed:v22 != 0 didModify:v23 != 0 didModifyThresholdOnly:v11 != 0 modifiedCharacteristics:v24];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v25;
}

void __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v45 = 0;
  char v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  id v7 = *(void **)(a1 + 32);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_2;
  v38[3] = &unk_264A2A0C8;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v39 = v8;
  uint64_t v40 = v9;
  uint64_t v11 = *(void *)(a1 + 88);
  id v42 = &v45;
  uint64_t v43 = v11;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 96);
  id v41 = v12;
  uint64_t v44 = v13;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v38);
  if (!*((unsigned char *)v46 + 24))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)) {
      goto LABEL_4;
    }
    id v14 = *(void **)(a1 + 40);
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 56), "na_map:", &__block_literal_global_304);
    id v16 = [*(id *)(a1 + 64) managedObjectContext];
    uint64_t v17 = [v14 _fetchMKFCharacteristicsFromHMDCharacteristics:v15 context:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 104) + 8);
    id v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
    {
LABEL_4:
      id v20 = *(void **)(a1 + 40);
      __int16 v21 = [v8 characteristic];
      int v22 = [v8 threshold];
      int v23 = [*(id *)(a1 + 72) request];
      id v24 = [v23 deviceIdsDestination];
      uint64_t v25 = *(void *)(a1 + 80);
      id v26 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) objectAtIndexedSubscript:a3];
      char v27 = [v20 _insertNotificationRegistrationForCharacteristic:v21 notificationThreshold:v22 deviceIdsDestination:v24 homeMember:v25 mkfCharacteristic:v26 context:*(void *)(a1 + 64)];

      if (v27)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        id v28 = *(void **)(a1 + 48);
        uint64_t v29 = [v8 characteristic];
        [v28 addObject:v29];

        goto LABEL_12;
      }
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        id v34 = [v8 characteristic];
        *(_DWORD *)buf = 138543618;
        id v50 = v33;
        __int16 v51 = 2112;
        v52 = v34;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to insert notification registration for characteristic: %@", buf, 0x16u);
      }
    }
    else
    {
      id v30 = (void *)MEMORY[0x230FBD990]();
      id v31 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        id v36 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        id v50 = v35;
        __int16 v51 = 2112;
        v52 = v36;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFCharacteristics for characteristics: %@", buf, 0x16u);
      }
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_12:

  _Block_object_dispose(&v45, 8);
}

void __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  id v6 = [v17 characteristic];
  id v7 = [v6 instanceID];
  id v8 = [*(id *)(a1 + 32) characteristic];
  uint64_t v9 = [v8 instanceID];
  int v10 = HAPEqualInstanceIDs();

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
    if ([*(id *)(a1 + 40) _enableRegistration:v17])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      uint64_t v11 = *(void **)(a1 + 48);
      id v12 = [*(id *)(a1 + 32) characteristic];
      [v11 addObject:v12];
    }
    uint64_t v13 = *(void **)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) threshold];
    LODWORD(v13) = [v13 _updateThresholdRegistration:v17 threshold:v14];

    if (v13 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      uint64_t v15 = *(void **)(a1 + 48);
      id v16 = [*(id *)(a1 + 32) characteristic];
      [v15 addObject:v16];
    }
  }
}

uint64_t __124__HMDNotificationRegistryCoreDataAdapter__processEnableCharacteristicsRequest_homeMember_registrationsForAccessory_context___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 characteristic];
}

- (id)_processGroupedCharacteristicsRequests:(id)a3 user:(id)a4 destination:(id)a5 context:(id)a6
{
  v67[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v13 managedObjectContext];
  objc_msgSend(v14, "hmd_assertIsExecuting");

  uint64_t v15 = [MEMORY[0x263EFF9C0] set];
  id v16 = [MEMORY[0x263EFF9C0] set];
  id v17 = [MEMORY[0x263EFF9A0] dictionary];
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke;
  v61[3] = &unk_264A2A008;
  id v18 = v15;
  id v62 = v18;
  id v19 = v16;
  id v63 = v19;
  id v43 = v17;
  id v64 = v43;
  uint64_t v45 = v10;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v61);
  uint64_t v44 = v13;
  uint64_t v20 = [v13 managedObjectContext];
  v67[0] = @"characteristic.service.accessory.modelID";
  v67[1] = @"characteristic.instanceID";
  v67[2] = @"lastModified";
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
  int v22 = [v11 uuid];
  int v23 = [v19 allObjects];
  id v24 = [v18 allObjects];
  id v60 = 0;
  char v46 = (void *)v21;
  uint64_t v47 = (void *)v20;
  uint64_t v49 = v12;
  uint64_t v25 = -[HMDNotificationRegistryCoreDataAdapter _fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:](self, "_fetchMKFUserAndRegistrationsWithUserUUID:withCharacteristicIIDs:withAccessoryUUIDs:withDeviceIdsDestination:withPrefetchPaths:isRestrictedGuest:outHomeMember:context:", v22, v23, v24, v12, v21, [v11 isRestrictedGuest], &v60, v20);
  id v26 = v60;

  char v48 = v18;
  if (v25 && v26)
  {
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2_300;
    v58[3] = &unk_264A2A078;
    char v27 = v43;
    id v59 = v43;
    objc_msgSend(v25, "na_filter:", v58);
    id v28 = v42 = v11;
    uint64_t v29 = [MEMORY[0x263EFF9A0] dictionary];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_4;
    v56[3] = &unk_264A29D98;
    id v30 = v29;
    id v57 = v30;
    objc_msgSend(v28, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v56);
    id v31 = [MEMORY[0x263EFF9C0] set];
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_5;
    v50[3] = &unk_264A2A0A0;
    id v51 = v30;
    v52 = self;
    id v53 = v26;
    id v32 = v44;
    id v54 = v44;
    id v55 = v31;
    id v33 = v31;
    id v34 = v30;
    id v35 = v45;
    objc_msgSend(v45, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v50);
    id v36 = (void *)[v33 copy];

    id v11 = v42;
  }
  else
  {
    id v37 = (void *)MEMORY[0x230FBD990]();
    __int16 v38 = self;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v66 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", buf, 0xCu);
    }
    id v35 = v45;
    id v36 = objc_msgSend(v45, "na_map:", &__block_literal_global_299_236005);
    char v27 = v43;
    id v32 = v44;
  }

  return v36;
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke(id *a1, void *a2)
{
  id v3 = [a2 characteristicThresholds];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2;
  v4[3] = &unk_264A29FE0;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v4);
}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2_300(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 characteristic];
  id v6 = [v5 service];
  id v7 = [v6 accessory];
  id v8 = [v7 modelID];
  uint64_t v9 = [v4 objectForKeyedSubscript:v8];

  id v10 = [v9 allObjects];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_3;
  v14[3] = &unk_264A2A050;
  id v15 = v3;
  id v11 = v3;
  uint64_t v12 = objc_msgSend(v10, "na_any:", v14);

  return v12;
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_4(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 characteristic];
  id v4 = [v3 service];
  id v5 = [v4 accessory];
  id v6 = [v5 modelID];

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF980] array];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_5(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [v11 request];
  id v5 = [v4 accessoryUUID];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if (!v6) {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = [v11 request];
  int v8 = [v7 enable];

  uint64_t v9 = *(void **)(a1 + 40);
  if (v8) {
    [v9 _processEnableCharacteristicsRequest:v11 homeMember:*(void *)(a1 + 48) registrationsForAccessory:v6 context:*(void *)(a1 + 56)];
  }
  else {
  id v10 = [v9 _processDisableCharacteristicsRequest:v11 registrationsForAccessory:v6 context:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) addObject:v10];
}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 characteristic];
  id v5 = [v4 instanceID];
  uint64_t v6 = HAPEqualInstanceIDs();

  return v6;
}

HMDNotificationRegistryCoreDataCharacteristicsRequestResult *__106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_296(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  id v4 = [(HMDNotificationRegistryCoreDataCharacteristicsRequestResult *)v3 initWithCoreDataRequest:v2 didSucceed:0 didModify:0 didModifyThresholdOnly:0 modifiedCharacteristics:MEMORY[0x263EFFA68]];

  return v4;
}

void __106__HMDNotificationRegistryCoreDataAdapter__processGroupedCharacteristicsRequests_user_destination_context___block_invoke_2(void *a1, void *a2)
{
  id v17 = a2;
  id v3 = [v17 characteristic];
  id v4 = [v3 accessory];

  id v5 = (void *)a1[4];
  uint64_t v6 = [v4 uuid];
  [v5 addObject:v6];

  id v7 = (void *)a1[5];
  int v8 = [v17 characteristic];
  uint64_t v9 = [v8 instanceID];
  [v7 addObject:v9];

  id v10 = (void *)a1[6];
  id v11 = [v4 uuid];
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    id v13 = (void *)a1[6];
    id v14 = [v4 uuid];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
  id v15 = [v17 characteristic];
  id v16 = [v15 instanceID];
  [v12 addObject:v16];
}

- (id)processCharacteristicsRequests:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke;
    v25[3] = &unk_264A29F70;
    id v7 = v6;
    id v26 = v7;
    objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v25);
    int v8 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
    uint64_t v9 = [v8 backingStore];
    id v10 = [v9 context];

    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_2;
    id v19 = &unk_264A2E908;
    id v20 = v7;
    uint64_t v21 = self;
    id v22 = v10;
    id v23 = v5;
    id v24 = v4;
    id v11 = v5;
    id v12 = v10;
    id v13 = v7;
    [v12 unsafeSynchronousBlock:&v16];
    id v14 = objc_msgSend(v11, "copy", v16, v17, v18, v19);
  }
  else
  {
    id v14 = [MEMORY[0x263EFFA08] set];
  }

  return v14;
}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 request];
  id v4 = [v3 deviceIdsDestination];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
  }
  [v5 addObject:v6];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_3;
  v15[3] = &unk_264A29F98;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  void v15[4] = *(void *)(a1 + 40);
  id v16 = v3;
  id v17 = *(id *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v15];
  if (objc_msgSend(*(id *)(a1 + 56), "na_any:", &__block_literal_global_290_236016))
  {
    id v4 = *(void **)(a1 + 48);
    id v14 = 0;
    char v5 = [v4 save:&v14];
    id v6 = v14;
    if ((v5 & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x230FBD990]();
      id v8 = *(id *)(a1 + 40);
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v19 = v10;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the characteristic notification registration changes requested, error: %@", buf, 0x16u);
      }
      [*(id *)(a1 + 56) removeAllObjects];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_291;
      v12[3] = &unk_264A29F70;
      id v11 = *(void **)(a1 + 64);
      id v13 = *(id *)(a1 + 56);
      objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
    }
  }
  [*(id *)(a1 + 48) reset];
}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    id v6 = [v5 anyObject];
    id v7 = [v6 request];
    id v8 = [v7 user];

    uint64_t v9 = [*(id *)(a1 + 32) _processGroupedCharacteristicsRequests:v5 user:v8 destination:v12 context:*(void *)(a1 + 40)];
    id v10 = *(void **)(a1 + 48);
    id v11 = [v9 allObjects];
    [v10 addObjectsFromArray:v11];
  }
}

void __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_291(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [HMDNotificationRegistryCoreDataCharacteristicsRequestResult alloc];
  id v5 = [(HMDNotificationRegistryCoreDataCharacteristicsRequestResult *)v4 initWithCoreDataRequest:v3 didSucceed:0 didModify:0 didModifyThresholdOnly:0 modifiedCharacteristics:MEMORY[0x263EFFA68]];

  [v2 addObject:v5];
}

uint64_t __73__HMDNotificationRegistryCoreDataAdapter_processCharacteristicsRequests___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 didSucceed])
  {
    if ([v2 didModify]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v2 didModifyThresholdOnly];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)disableNotificationForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    id v12 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
    id v13 = [v12 backingStore];
    id v14 = [v13 context];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke;
    v19[3] = &unk_264A2A298;
    id v15 = v14;
    id v20 = v15;
    id v21 = v8;
    uint64_t v22 = self;
    id v23 = v9;
    id v24 = v10;
    id v26 = &v27;
    id v16 = v11;
    id v25 = v16;
    [v15 unsafeSynchronousBlock:v19];
    if (*((unsigned char *)v28 + 24)) {
      id v17 = (void *)[v16 copy];
    }
    else {
      id v17 = (void *)MEMORY[0x263EFFA68];
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v17 = (void *)MEMORY[0x263EFFA68];
  }

  return v17;
}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  id v4 = [v3 service];
  id v5 = [v4 accessory];
  id v6 = [v5 uuid];

  id v7 = objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_280);
  id v8 = *(void **)(a1 + 48);
  id v9 = [*(id *)(a1 + 56) uuid];
  uint64_t v10 = *(void *)(a1 + 64);
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObject:@"characteristic.instanceID"];
  uint64_t v12 = [*(id *)(a1 + 56) isRestrictedGuest];
  id v39 = 0;
  id v13 = [v8 _fetchMKFUserAndRegistrationsWithUserUUID:v9 withCharacteristicIIDs:v7 withAccessoryUUID:v6 withDeviceIdsDestination:v10 withPrefetchPaths:v11 isRestrictedGuest:v12 outHomeMember:&v39 context:v2];
  id v14 = v39;

  if (v13 && v14)
  {
    if ([v13 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v45 = 0x2020000000;
      int v46 = 0;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_281;
      v33[3] = &unk_264A29F48;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      id v34 = v15;
      uint64_t v35 = v16;
      id v18 = *(void **)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 80);
      p_long long buf = &buf;
      uint64_t v38 = v17;
      id v36 = v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);
      if ([v2 hasChanges]
        && ((id v19 = *(void **)(a1 + 32),
             id v32 = 0,
             char v20 = [v19 save:&v32],
             (id v21 = v32) == 0)
          ? (char v22 = v20)
          : (char v22 = 0),
            (v22 & 1) == 0))
      {
        uint64_t v27 = v21;
        context = (void *)MEMORY[0x230FBD990]();
        id v28 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          char v30 = HMFGetLogIdentifier();
          *(_DWORD *)uint64_t v40 = 138543618;
          id v41 = v30;
          __int16 v42 = 2112;
          id v43 = v27;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the disable characteristic notification registration changes requested, error: %@", v40, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      }
      else
      {
        [*(id *)(a1 + 32) reset];
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      [*(id *)(a1 + 32) reset];
    }
  }
  else
  {
    id v23 = (void *)MEMORY[0x230FBD990]();
    id v24 = *(id *)(a1 + 48);
    id v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", (uint8_t *)&buf, 0xCu);
    }
    [*(id *)(a1 + 32) reset];
  }
}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_281(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2_282;
  v13[3] = &unk_264A29F20;
  id v8 = v6;
  uint64_t v9 = *(void *)(a1 + 40);
  id v14 = v8;
  uint64_t v15 = v9;
  uint64_t v17 = *(void *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  id v10 = (id)v12;
  long long v16 = v12;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v13);
  unint64_t v11 = *(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if ([*(id *)(a1 + 32) count] <= v11) {
    *a4 = 1;
  }
}

void __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2_282(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 instanceID];
  id v7 = [*(id *)(a1 + 32) characteristic];
  id v8 = [v7 instanceID];
  int v9 = HAPEqualInstanceIDs();

  if (v9)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *a4 = 1;
    if ([*(id *)(a1 + 40) _disableRegistration:*(void *)(a1 + 32)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      [*(id *)(a1 + 48) addObject:v10];
    }
  }
}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter_disableNotificationForCharacteristics_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 instanceID];
}

- (BOOL)enableNotificationsForCharacteristics:(id)a3 user:(id)a4 deviceIdsDestination:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    unint64_t v11 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
    long long v12 = v11;
    if (v11)
    {
      uint64_t v28 = 0;
      uint64_t v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      v26[0] = 0;
      v26[1] = v26;
      v26[2] = 0x2020000000;
      char v27 = 1;
      id v13 = [v11 backingStore];
      id v14 = [v13 context];

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke;
      v18[3] = &unk_264A29EF8;
      id v15 = v14;
      id v19 = v15;
      id v20 = v8;
      id v21 = self;
      id v22 = v9;
      id v23 = v10;
      id v24 = v26;
      id v25 = &v28;
      [v15 unsafeSynchronousBlock:v18];
      BOOL v16 = *((unsigned char *)v29 + 24) != 0;

      _Block_object_dispose(v26, 8);
      _Block_object_dispose(&v28, 8);
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  id v4 = [v3 service];
  id v5 = [v4 accessory];
  id v33 = [v5 uuid];

  id v6 = objc_msgSend(*(id *)(a1 + 40), "na_map:", &__block_literal_global_275_236024);
  id v7 = *(void **)(a1 + 48);
  id v8 = [*(id *)(a1 + 56) uuid];
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = [*(id *)(a1 + 56) isRestrictedGuest];
  id v45 = 0;
  unint64_t v11 = [v7 _fetchMKFUserAndRegistrationsWithUserUUID:v8 withCharacteristicIIDs:v6 withAccessoryUUID:v33 withDeviceIdsDestination:v9 withPrefetchPaths:0 isRestrictedGuest:v10 outHomeMember:&v45 context:v2];
  id v12 = v45;

  if (v11 && v12)
  {
    *(void *)&long long v50 = 0;
    *((void *)&v50 + 1) = &v50;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__235925;
    id v53 = __Block_byref_object_dispose__235926;
    id v54 = 0;
    id v13 = *(void **)(a1 + 40);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_276;
    v35[3] = &unk_264A29ED0;
    id v14 = v11;
    uint64_t v15 = *(void *)(a1 + 80);
    id v36 = v14;
    uint64_t v42 = v15;
    id v43 = &v50;
    int8x16_t v32 = *(int8x16_t *)(a1 + 40);
    id v16 = (id)v32.i64[0];
    int8x16_t v37 = vextq_s8(v32, v32, 8uLL);
    id v17 = v2;
    id v19 = *(void **)(a1 + 64);
    uint64_t v18 = *(void *)(a1 + 72);
    id v38 = v17;
    uint64_t v44 = v18;
    id v39 = v19;
    id v40 = v12;
    id v41 = *(id *)(a1 + 32);
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v35);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) && [v17 hasChanges])
    {
      id v20 = *(void **)(a1 + 32);
      id v34 = 0;
      char v21 = [v20 save:&v34];
      id v22 = v34;
      id v23 = v22;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v21;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || v22)
      {
        id v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = *(id *)(a1 + 48);
        HMFGetOSLogHandle();
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          char v27 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          uint64_t v47 = v27;
          __int16 v48 = 2112;
          uint64_t v49 = v23;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the enable characteristic notification registration changes requested, error: %@", buf, 0x16u);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
    [*(id *)(a1 + 32) reset];

    _Block_object_dispose(&v50, 8);
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 48);
    uint64_t v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      char v31 = HMFGetLogIdentifier();
      LODWORD(v50) = 138543362;
      *(void *)((char *)&v50 + 4) = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home member and registrations", (uint8_t *)&v50, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    [*(id *)(a1 + 32) reset];
  }
}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_276(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  id v8 = *(void **)(a1 + 32);
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  char v27 = __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2_277;
  uint64_t v28 = &unk_264A29EA8;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 40);
  id v29 = v9;
  uint64_t v30 = v10;
  uint64_t v11 = *(void *)(a1 + 88);
  char v31 = &v33;
  uint64_t v32 = v11;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v25);
  if (!*((unsigned char *)v34 + 24))
  {
    id v12 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    if (v12
      || (objc_msgSend(*(id *)(a1 + 40), "_fetchMKFCharacteristicsFromHMDCharacteristics:context:", *(void *)(a1 + 48), *(void *)(a1 + 56), v25, v26, v27, v28), v13 = objc_claimAutoreleasedReturnValue(), v14 = *(void *)(*(void *)(a1 + 96) + 8), v15 = *(void **)(v14 + 40), *(void *)(v14 + 40) = v13, v15, (id v12 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) != 0))
    {
      id v16 = *(void **)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 72);
      id v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", a3, v25, v26, v27, v28);
      LOBYTE(v17) = [v16 _insertNotificationRegistrationForCharacteristic:v9 notificationThreshold:0 deviceIdsDestination:v17 homeMember:v18 mkfCharacteristic:v19 context:*(void *)(a1 + 80)];

      if (v17)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        goto LABEL_10;
      }
    }
    else
    {
      id v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        uint64_t v24 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138543618;
        id v38 = v23;
        __int16 v39 = 2112;
        uint64_t v40 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFCharacteristics for characteristics: %@", buf, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
    *a4 = 1;
  }
LABEL_10:

  _Block_object_dispose(&v33, 8);
}

void __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2_277(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v6 = [v10 characteristic];
  id v7 = [v6 instanceID];
  id v8 = [*(id *)(a1 + 32) instanceID];
  int v9 = HAPEqualInstanceIDs();

  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    if ([*(id *)(a1 + 40) _enableRegistration:v10]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

uint64_t __106__HMDNotificationRegistryCoreDataAdapter_enableNotificationsForCharacteristics_user_deviceIdsDestination___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 instanceID];
}

- (id)_fetchRequestForAllActionSetRegistrations
{
  id v3 = objc_alloc(MEMORY[0x263EFF260]);
  id v4 = +[_MKFNotificationRegistrationActionSet entity];
  id v5 = [v4 name];
  id v6 = (void *)[v3 initWithEntityName:v5];

  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  int v9 = [v8 uuid];
  id v10 = [v7 predicateWithFormat:@"%K == %@", @"actionSet.home.modelID", v9];
  [v6 setPredicate:v10];

  return v6;
}

- (id)_fetchRequestForAllMediaProfileRegistrations
{
  id v3 = objc_alloc(MEMORY[0x263EFF260]);
  id v4 = +[_MKFNotificationRegistrationMediaProperty entity];
  id v5 = [v4 name];
  id v6 = (void *)[v3 initWithEntityName:v5];

  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  int v9 = [v8 uuid];
  id v10 = [v7 predicateWithFormat:@"%K == %@", @"accessory.home.modelID", v9];
  [v6 setPredicate:v10];

  return v6;
}

- (id)_fetchRequestForAllCharacteristicRegistrations
{
  v17[2] = *MEMORY[0x263EF8340];
  id v2 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v3 = objc_alloc(MEMORY[0x263EFF260]);
  id v4 = +[_MKFNotificationRegistrationCharacteristic entity];
  id v5 = [v4 name];
  id v6 = (void *)[v3 initWithEntityName:v5];

  id v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [v2 uuid];
  int v9 = [v7 predicateWithFormat:@"%K == %@", @"user.home.modelID", v8];

  [v6 setPredicate:v9];
  id v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [v2 uuid];
  id v12 = [v10 predicateWithFormat:@"%K == %@", @"guest.home.modelID", v11];

  uint64_t v13 = (void *)MEMORY[0x263F08730];
  v17[0] = v9;
  v17[1] = v12;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  uint64_t v15 = [v13 orPredicateWithSubpredicates:v14];
  [v6 setPredicate:v15];

  return v6;
}

- (id)_fetchRequestForActionSetRegistrationsWithoutAllowedDestinations:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v6 = objc_alloc(MEMORY[0x263EFF260]);
  id v7 = +[_MKFNotificationRegistrationActionSet entity];
  id v8 = [v7 name];
  int v9 = (void *)[v6 initWithEntityName:v8];

  id v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [v5 uuid];
  id v12 = [v10 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"user.home.modelID", v11, @"deviceIdsDestination", v4];

  [v9 setPredicate:v12];
  uint64_t v13 = (void *)MEMORY[0x263F08A98];
  uint64_t v14 = [v5 uuid];
  uint64_t v15 = [v13 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"guest.home.modelID", v14, @"deviceIdsDestination", v4];

  id v16 = (void *)MEMORY[0x263F08730];
  v20[0] = v12;
  v20[1] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v18 = [v16 orPredicateWithSubpredicates:v17];
  [v9 setPredicate:v18];

  return v9;
}

- (id)_fetchRequestForMediaProfileRegistrationsWithoutAllowedDestinations:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v6 = objc_alloc(MEMORY[0x263EFF260]);
  id v7 = +[_MKFNotificationRegistrationMediaProperty entity];
  id v8 = [v7 name];
  int v9 = (void *)[v6 initWithEntityName:v8];

  id v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [v5 uuid];
  id v12 = [v10 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"user.home.modelID", v11, @"deviceIdsDestination", v4];

  [v9 setPredicate:v12];
  uint64_t v13 = (void *)MEMORY[0x263F08A98];
  uint64_t v14 = [v5 uuid];
  uint64_t v15 = [v13 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"guest.home.modelID", v14, @"deviceIdsDestination", v4];

  id v16 = (void *)MEMORY[0x263F08730];
  v20[0] = v12;
  v20[1] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v18 = [v16 orPredicateWithSubpredicates:v17];
  [v9 setPredicate:v18];

  return v9;
}

- (id)_fetchRequestForCharacteristicRegistrationsWithoutAllowedDestinations:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  id v6 = objc_alloc(MEMORY[0x263EFF260]);
  id v7 = +[_MKFNotificationRegistrationCharacteristic entity];
  id v8 = [v7 name];
  int v9 = (void *)[v6 initWithEntityName:v8];

  id v10 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = [v5 uuid];
  id v12 = [v10 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"user.home.modelID", v11, @"deviceIdsDestination", v4];

  [v9 setPredicate:v12];
  uint64_t v13 = (void *)MEMORY[0x263F08A98];
  uint64_t v14 = [v5 uuid];
  uint64_t v15 = [v13 predicateWithFormat:@"(%K == %@) AND NOT (%K IN %@)", @"guest.home.modelID", v14, @"deviceIdsDestination", v4];

  id v16 = (void *)MEMORY[0x263F08730];
  v20[0] = v12;
  v20[1] = v15;
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  uint64_t v18 = [v16 orPredicateWithSubpredicates:v17];
  [v9 setPredicate:v18];

  return v9;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 outHomeMember:(id *)a8 context:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  objc_msgSend(v16, "hmd_assertIsExecuting");
  id v20 = [MEMORY[0x263EFF980] arrayWithArray:v17];

  [v20 addObject:@"user"];
  id v21 = [(HMDNotificationRegistryCoreDataAdapter *)self _fetchMKFRegistrationsWithUserUUID:v15 actionSetUUID:v19 deviceIdsDestination:v18 prefetchPaths:v20 isRestrictedGuest:v10 context:v16];

  if (v21)
  {
    *a8 = [(HMDNotificationRegistryCoreDataAdapter *)self homeMemberForRegistrations:v21 userUUID:v15 isRestrictedGuest:v10 context:v16];
    id v22 = v21;
  }

  return v21;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 actionSetUUID:(id)a4 deviceIdsDestination:(id)a5 prefetchPaths:(id)a6 isRestrictedGuest:(BOOL)a7 context:(id)a8
{
  BOOL v9 = a7;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  objc_msgSend(v18, "hmd_assertIsExecuting");
  id v19 = objc_alloc(MEMORY[0x263EFF260]);
  id v20 = +[_MKFNotificationRegistrationActionSet entity];
  id v21 = [v20 name];
  id v22 = (void *)[v19 initWithEntityName:v21];

  [v22 setRelationshipKeyPathsForPrefetching:v17];
  id v23 = @"user.modelID";
  if (v9) {
    id v23 = @"guest.modelID";
  }
  uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == %@)", v23, v14, @"actionSet.modelID", v15, @"deviceIdsDestination", v16];
  [v22 setPredicate:v24];

  id v33 = 0;
  uint64_t v25 = [v18 executeFetchRequest:v22 error:&v33];
  id v26 = v33;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    uint64_t v28 = self;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      char v31 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138544642;
      uint64_t v35 = v31;
      __int16 v36 = 2112;
      id v37 = v14;
      __int16 v38 = 2112;
      id v39 = v15;
      __int16 v40 = 2112;
      id v41 = v16;
      __int16 v42 = 2112;
      id v43 = v17;
      __int16 v44 = 2112;
      id v45 = v26;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations for userUUID %@ actionSetUUID %@ deviceIdsDestination %@ prefetchPaths %@, error: %@", buf, 0x3Eu);
    }
  }

  return v25;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 outHomeMember:(id *)a10 context:(id)a11
{
  id v16 = a3;
  id v17 = a11;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  objc_msgSend(v17, "hmd_assertIsExecuting");
  id v23 = [MEMORY[0x263EFF980] arrayWithArray:v18];

  [v23 addObject:@"user"];
  LOBYTE(v27) = a9;
  uint64_t v24 = [(HMDNotificationRegistryCoreDataAdapter *)self _fetchMKFRegistrationsWithUserUUID:v16 withMediaProfileUUID:v22 withMediaPropertyIn:v21 withDeviceIdsDestination:v20 withAccessoryUUID:v19 withPrefetchPaths:v23 isRestrictedGuest:v27 context:v17];

  if (v24)
  {
    *a10 = [(HMDNotificationRegistryCoreDataAdapter *)self homeMemberForRegistrations:v24 userUUID:v16 isRestrictedGuest:a9 context:v17];
    id v25 = v24;
  }

  return v24;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withMediaProfileUUID:(id)a4 withMediaPropertyIn:(id)a5 withDeviceIdsDestination:(id)a6 withAccessoryUUID:(id)a7 withPrefetchPaths:(id)a8 isRestrictedGuest:(BOOL)a9 context:(id)a10
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  id v21 = objc_alloc(MEMORY[0x263EFF260]);
  id v22 = +[_MKFNotificationRegistrationMediaProperty entity];
  id v23 = [v22 name];
  uint64_t v24 = (void *)[v21 initWithEntityName:v23];

  id v25 = v18;
  __int16 v38 = v19;
  [v24 setRelationshipKeyPathsForPrefetching:v19];
  id v26 = @"user.modelID";
  if (a9) {
    id v26 = @"guest.modelID";
  }
  uint64_t v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K IN %@) AND (%K == %@) AND (%K == %@)", v26, v37, @"mediaProfileIdentifier", v15, @"mediaProperty", v16, @"deviceIdsDestination", v17, @"accessory.modelID", v18];
  [v24 setPredicate:v27];

  id v39 = 0;
  uint64_t v28 = [v20 executeFetchRequest:v24 error:&v39];
  id v29 = v39;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    char v31 = self;
    uint64_t v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      __int16 v36 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138545154;
      id v41 = v36;
      __int16 v42 = 2112;
      id v43 = v37;
      __int16 v44 = 2112;
      id v45 = v15;
      __int16 v46 = 2112;
      id v47 = v16;
      __int16 v48 = 2112;
      id v49 = v17;
      __int16 v50 = 2112;
      id v51 = v18;
      __int16 v52 = 2112;
      id v53 = v38;
      __int16 v54 = 2112;
      id v55 = v29;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media property registrations for userUUID %@ mediaProfileUUID %@ mediaProperties %@ deviceIdsDestination %@ accessoryUUID %@ prefetchPaths %@, error: %@", buf, 0x52u);
    }
    id v25 = v18;
  }

  return v28;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10
{
  BOOL v10 = a8;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  objc_msgSend(v21, "hmd_assertIsExecuting");
  if (v10) {
    id v22 = @"guest";
  }
  else {
    id v22 = @"user";
  }
  id v23 = [MEMORY[0x263EFF980] arrayWithArray:v20];
  [v23 addObject:v22];
  uint64_t v24 = [(HMDNotificationRegistryCoreDataAdapter *)self _fetchMKFRegistrationsWithUserUUID:v16 withCharacteristicIIDs:v17 withAccessoryUUIDs:v18 withDeviceIdsDestination:v19 withPrefetchPaths:v23 isRestrictedGuest:v10 context:v21];
  if (v24)
  {
    *a9 = [(HMDNotificationRegistryCoreDataAdapter *)self homeMemberForRegistrations:v24 userUUID:v16 isRestrictedGuest:v10 context:v21];
    id v25 = v24;
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    id v26 = self;
    uint64_t v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v29 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138544386;
      uint64_t v32 = v29;
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2112;
      id v36 = v17;
      __int16 v37 = 2112;
      id v38 = v18;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for user uuid %@ characteristic iids %@ accessory uuids %@ deviceIdsDestination %@", buf, 0x34u);
    }
  }

  return v24;
}

- (id)homeMemberForRegistrations:(id)a3 userUUID:(id)a4 isRestrictedGuest:(BOOL)a5 context:(id)a6
{
  BOOL v7 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 count])
  {
    uint64_t v13 = [v10 firstObject];
    id v14 = v13;
    if (v7) {
      [v13 guest];
    }
    else {
    id v15 = [v13 user];
    }
  }
  else
  {
    id v15 = [(HMDNotificationRegistryCoreDataAdapter *)self _fetchHomeMemberWithUUID:v11 context:v12];
    if (!v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        id v22 = v19;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the home member with UUID: %@", (uint8_t *)&v21, 0x16u);
      }
      id v15 = 0;
    }
  }

  return v15;
}

- (id)_fetchMKFUserAndRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 outHomeMember:(id *)a9 context:(id)a10
{
  BOOL v10 = a8;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  objc_msgSend(v21, "hmd_assertIsExecuting");
  id v22 = [MEMORY[0x263EFF980] arrayWithArray:v20];
  [v22 addObject:@"user"];
  __int16 v23 = [(HMDNotificationRegistryCoreDataAdapter *)self _fetchMKFRegistrationsWithUserUUID:v16 withCharacteristicIIDs:v17 withAccessoryUUID:v18 withDeviceIdsDestination:v19 withPrefetchPaths:v22 isRestrictedGuest:v10 context:v21];
  if (v23)
  {
    *a9 = [(HMDNotificationRegistryCoreDataAdapter *)self homeMemberForRegistrations:v23 userUUID:v16 isRestrictedGuest:v10 context:v21];
    id v24 = v23;
  }
  else
  {
    context = (void *)MEMORY[0x230FBD990]();
    uint64_t v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138544386;
      char v31 = v28;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      id v35 = v17;
      __int16 v36 = 2112;
      id v37 = v18;
      __int16 v38 = 2112;
      id v39 = v19;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch registrations for user uuid %@ characteristic iids %@ accessory uuid %@ deviceIdsDestination %@", buf, 0x34u);
    }
  }

  return v23;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUIDs:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9
{
  BOOL v9 = a8;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  if (objc_msgSend(v16, "hmf_isEmpty"))
  {
    id v21 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    id v37 = self;
    id v22 = objc_alloc(MEMORY[0x263EFF260]);
    __int16 v23 = +[_MKFNotificationRegistrationCharacteristic entity];
    id v24 = [v23 name];
    uint64_t v25 = (void *)[v22 initWithEntityName:v24];

    id v26 = (void *)MEMORY[0x263F08A98];
    uint64_t v27 = updatedCharacteristicIIDs(v16);
    uint64_t v28 = (void *)v27;
    id v29 = @"user.modelID";
    if (v9) {
      id v29 = @"guest.modelID";
    }
    id v30 = [v26 predicateWithFormat:@"(%K == %@) AND (%K IN %@) AND (%K IN %@) AND (%K == %@)", v29, v15, @"characteristic.instanceID", v27, @"characteristic.service.accessory.modelID", v17, @"deviceIdsDestination", v18];
    [v25 setPredicate:v30];

    if (v19) {
      [v25 setRelationshipKeyPathsForPrefetching:v19];
    }
    id v39 = 0;
    id v21 = [v20 executeFetchRequest:v25 error:&v39];
    id v31 = v39;
    if (v21)
    {
      id v32 = v21;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v37;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138544642;
        uint64_t v41 = v35;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        id v45 = v16;
        __int16 v46 = 2112;
        id v47 = v17;
        __int16 v48 = 2112;
        id v49 = v18;
        __int16 v50 = 2112;
        id v51 = v31;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for userOrGuest uuid %@ characteristic IIDs %@ accessory UUIDs %@ deviceIdsDestination %@, error: %@", buf, 0x3Eu);
      }
    }
  }
  return v21;
}

- (id)_fetchMKFRegistrationsWithUserUUID:(id)a3 withCharacteristicIIDs:(id)a4 withAccessoryUUID:(id)a5 withDeviceIdsDestination:(id)a6 withPrefetchPaths:(id)a7 isRestrictedGuest:(BOOL)a8 context:(id)a9
{
  BOOL v9 = a8;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  objc_msgSend(v20, "hmd_assertIsExecuting");
  if (objc_msgSend(v16, "hmf_isEmpty"))
  {
    id v21 = 0;
  }
  else
  {
    id v37 = self;
    id v22 = objc_alloc(MEMORY[0x263EFF260]);
    __int16 v23 = +[_MKFNotificationRegistrationCharacteristic entity];
    id v24 = [v23 name];
    uint64_t v25 = (void *)[v22 initWithEntityName:v24];

    id v26 = (void *)MEMORY[0x263F08A98];
    uint64_t v27 = updatedCharacteristicIIDs(v16);
    uint64_t v28 = (void *)v27;
    id v29 = @"user.modelID";
    if (v9) {
      id v29 = @"guest.modelID";
    }
    id v30 = [v26 predicateWithFormat:@"(%K == %@) AND (%K IN %@) AND (%K == %@) AND (%K == %@)", v29, v15, @"characteristic.instanceID", v27, @"characteristic.service.accessory.modelID", v17, @"deviceIdsDestination", v18];
    [v25 setPredicate:v30];

    if (v19) {
      [v25 setRelationshipKeyPathsForPrefetching:v19];
    }
    id v39 = 0;
    id v21 = [v20 executeFetchRequest:v25 error:&v39];
    id v31 = v39;
    if (v21)
    {
      id v32 = v21;
    }
    else
    {
      context = (void *)MEMORY[0x230FBD990]();
      __int16 v38 = v37;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        id v35 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138544642;
        uint64_t v41 = v35;
        __int16 v42 = 2112;
        id v43 = v15;
        __int16 v44 = 2112;
        id v45 = v16;
        __int16 v46 = 2112;
        id v47 = v17;
        __int16 v48 = 2112;
        id v49 = v18;
        __int16 v50 = 2112;
        id v51 = v31;
        _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch notification registrations for userOrGuest uuid %@ characteristic IIDs %@ accessory UUID %@ deviceIdsDestination %@, error: %@", buf, 0x3Eu);
      }
    }
  }
  return v21;
}

- (id)_fetchMKFCharacteristicsFromHMDCharacteristics:(id)a3 context:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (v6 && [v6 count])
  {
    id v55 = self;
    id v8 = [v6 objectAtIndexedSubscript:0];
    BOOL v9 = [v8 service];

    BOOL v10 = [v9 accessory];
    uint64_t v11 = [v10 uuid];

    v58 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    id v12 = objc_alloc(MEMORY[0x263EFF260]);
    uint64_t v13 = +[_MKFCharacteristic entity];
    id v14 = [v13 name];
    id v15 = (void *)[v12 initWithEntityName:v14];

    id v57 = (void *)v11;
    id v59 = v7;
    if ([v6 count] == 1)
    {
      id v53 = v9;
      id v16 = (void *)MEMORY[0x263F08A98];
      id v17 = [v6 objectAtIndexedSubscript:0];
      id v18 = [v17 instanceID];
      id v19 = HAPInstanceIDFromValue();
      id v20 = NSNumber;
      id v21 = [v6 objectAtIndexedSubscript:0];
      id v22 = [v21 instanceID];
      __int16 v23 = objc_msgSend(v20, "numberWithLongLong:", objc_msgSend(v22, "longLongValue"));
      id v24 = [v16 predicateWithFormat:@"(%K == %@ OR %K == %@) AND (%K == %@)", @"instanceID", v19, @"instanceID", v23, @"service.accessory.modelID", v11];
      [v15 setPredicate:v24];

      id v64 = 0;
      uint64_t v25 = v15;
      id v26 = [v59 executeFetchRequest:v15 error:&v64];
      id v27 = v64;
      if (v26 && [v26 count])
      {
        uint64_t v28 = [v26 objectAtIndexedSubscript:0];
        id v29 = v58;
        [v58 setObject:v28 atIndexedSubscript:0];

        id v30 = v58;
        BOOL v9 = v53;
      }
      else
      {
        id v37 = (void *)MEMORY[0x230FBD990]();
        __int16 v38 = v55;
        id v39 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          uint64_t v40 = HMFGetLogIdentifier();
          uint64_t v41 = [v6 objectAtIndexedSubscript:0];
          __int16 v42 = [v41 instanceID];
          *(_DWORD *)long long buf = 138543874;
          v66 = v40;
          __int16 v67 = 2112;
          uint64_t v68 = (uint64_t)v42;
          __int16 v69 = 2112;
          uint64_t v70 = (uint64_t)v27;
          _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKF Characteristic for characteristic instance id: %@, error: %@", buf, 0x20u);
        }
        id v30 = 0;
        BOOL v9 = v53;
        id v29 = v58;
      }
    }
    else
    {
      id v31 = objc_msgSend(v6, "na_map:", &__block_literal_global_230_236104);
      id v32 = (void *)MEMORY[0x263F08A98];
      id v33 = updatedCharacteristicIIDs(v31);
      __int16 v34 = [v32 predicateWithFormat:@"(%K IN %@) AND (%K == %@)", @"instanceID", v33, @"service.accessory.modelID", v11];
      [v15 setPredicate:v34];

      id v63 = 0;
      id v26 = [v7 executeFetchRequest:v15 error:&v63];
      id v27 = v63;
      if (v26 && [v26 count])
      {
        uint64_t v25 = v15;
        v60[0] = MEMORY[0x263EF8330];
        v60[1] = 3221225472;
        v60[2] = __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_231;
        v60[3] = &unk_264A29E80;
        id v61 = v26;
        id v29 = v58;
        id v35 = v58;
        id v62 = v35;
        objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v60);
        uint64_t v36 = [v35 count];
        if (v36 == [v6 count])
        {
          id v30 = v35;
        }
        else
        {
          id v47 = (void *)MEMORY[0x230FBD990]();
          uint64_t v56 = v55;
          __int16 v48 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            id v49 = v54 = v47;
            uint64_t v50 = [v35 count];
            uint64_t v51 = [v6 count];
            *(_DWORD *)long long buf = 138543874;
            v66 = v49;
            __int16 v67 = 2048;
            uint64_t v68 = v50;
            id v29 = v58;
            __int16 v69 = 2048;
            uint64_t v70 = v51;
            _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch all MKFCharacteristics (%lu) for input characteristics (%lu)", buf, 0x20u);

            id v47 = v54;
          }

          id v30 = 0;
        }
      }
      else
      {
        uint64_t v25 = v15;
        id v43 = (void *)MEMORY[0x230FBD990]();
        __int16 v44 = v55;
        id v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          __int16 v46 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v66 = v46;
          __int16 v67 = 2112;
          uint64_t v68 = (uint64_t)v27;
          _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKF Characteristics array for characteristics, error: %@", buf, 0x16u);
        }
        id v30 = 0;
        id v29 = v58;
      }
    }
    id v7 = v59;
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

void __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_231(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_2;
  v6[3] = &unk_264A29E58;
  id v5 = v3;
  id v7 = v5;
  id v8 = *(id *)(a1 + 40);
  BOOL v9 = v10;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);

  _Block_object_dispose(v10, 8);
}

void __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v6 = [*(id *)(a1 + 32) instanceID];
  id v7 = [v9 instanceID];
  int v8 = HAPEqualInstanceIDs();

  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __97__HMDNotificationRegistryCoreDataAdapter__fetchMKFCharacteristicsFromHMDCharacteristics_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 instanceID];
}

- (id)_fetchEnabledMKFRegistrationsForHMDCharacteristics:(id)a3 context:(id)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  if (!v6 || ![v6 count])
  {
    id v18 = 0;
    goto LABEL_15;
  }
  int v8 = [v6 objectAtIndexedSubscript:0];
  id v9 = [v8 service];
  BOOL v10 = [v9 accessory];
  char v11 = [v10 uuid];

  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  __int16 v38 = __Block_byref_object_copy__235925;
  id v39 = __Block_byref_object_dispose__235926;
  id v40 = [MEMORY[0x263EFF980] array];
  if ([v6 count] == 1)
  {
    id v12 = [v6 objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 instanceID];
    v47[0] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
    id v34 = 0;
    id v15 = [(HMDNotificationRegistryCoreDataAdapter *)self _registrationsForCharacteristicIIDs:v14 accessoryUUID:v11 moc:v7 error:&v34];
    id v16 = v34;
    id v17 = objc_msgSend(v15, "na_filter:", &__block_literal_global_236118);

    if (!v17)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = self;
      HMFGetOSLogHandle();
      uint64_t v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        id v30 = [v6 objectAtIndexedSubscript:0];
        id v31 = [v30 instanceID];
        *(_DWORD *)long long buf = 138543874;
        id v42 = v29;
        __int16 v43 = 2112;
        id v44 = v31;
        __int16 v45 = 2112;
        id v46 = v16;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFNotificationRegistrationCharacteristic for characteristic instance id: %@, error: %@", buf, 0x20u);
      }
      id v18 = 0;
      goto LABEL_14;
    }
    [(id)v36[5] addObjectsFromArray:v17];
    id v18 = (id)v36[5];
  }
  else
  {
    id v19 = objc_msgSend(v6, "na_map:", &__block_literal_global_214_236120);
    id v33 = 0;
    id v20 = [(HMDNotificationRegistryCoreDataAdapter *)self _registrationsForCharacteristicIIDs:v19 accessoryUUID:v11 moc:v7 error:&v33];
    id v16 = v33;
    id v17 = objc_msgSend(v20, "na_filter:", &__block_literal_global_216_236121);

    if (v17)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_217;
      v32[3] = &unk_264A29E30;
      void v32[4] = &v35;
      objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v32);
      id v18 = (id)v36[5];
    }
    else
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = self;
      HMFGetOSLogHandle();
      __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        id v42 = v24;
        __int16 v43 = 2112;
        id v44 = v6;
        __int16 v45 = 2112;
        id v46 = v16;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch MKFNotificationRegistrationCharacteristic for characteristics %@, error: %@", buf, 0x20u);
      }
      id v18 = 0;
    }
  }
LABEL_14:

  _Block_object_dispose(&v35, 8);
LABEL_15:

  return v18;
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_217(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 enabled];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke_211(uint64_t a1, void *a2)
{
  return [a2 instanceID];
}

uint64_t __101__HMDNotificationRegistryCoreDataAdapter__fetchEnabledMKFRegistrationsForHMDCharacteristics_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 enabled];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_deleteAllMKFRegistrationsForActionSetUUID:(id)a3 hmcContext:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 managedObjectContext];
  objc_msgSend(v8, "hmd_assertIsExecuting");
  id v9 = [(HMDNotificationRegistryCoreDataAdapter *)self _requestToFetchMKFRegistrationsWithActionSetUUID:v6 context:v8];
  id v20 = 0;
  BOOL v10 = [v8 executeFetchRequest:v9 error:&v20];
  id v11 = v20;
  if (!v10)
  {
    uint64_t v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete action set registrations for action set uuid: %@ error: %@", buf, 0x20u);
    }
    goto LABEL_7;
  }
  if (![v10 count])
  {
LABEL_7:
    BOOL v12 = 0;
    goto LABEL_8;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __96__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForActionSetUUID_hmcContext___block_invoke;
  v18[3] = &unk_264A29DE8;
  id v19 = v7;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

  BOOL v12 = 1;
LABEL_8:

  return v12;
}

uint64_t __96__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForActionSetUUID_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (id)_fetchEnabledMKFRegistrationsForActionSetUUID:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  id v8 = objc_alloc(MEMORY[0x263EFF260]);
  id v9 = +[_MKFNotificationRegistrationActionSet entity];
  BOOL v10 = [v9 name];
  id v11 = (void *)[v8 initWithEntityName:v10];

  BOOL v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == YES)", @"actionSet.modelID", v6, @"enabled"];
  [v11 setPredicate:v12];

  id v21 = 0;
  uint64_t v13 = [v7 executeFetchRequest:v11 error:&v21];
  id v14 = v21;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      __int16 v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set registrations for action set uuid: %@ error: %@", buf, 0x20u);
    }
  }

  return v13;
}

- (id)_requestToFetchMKFRegistrationsWithActionSetUUID:(id)a3 context:(id)a4
{
  id v5 = a3;
  objc_msgSend(a4, "hmd_assertIsExecuting");
  id v6 = objc_alloc(MEMORY[0x263EFF260]);
  id v7 = +[_MKFNotificationRegistrationActionSet entity];
  id v8 = [v7 name];
  id v9 = (void *)[v6 initWithEntityName:v8];

  BOOL v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"actionSet.modelID", v5];

  [v9 setPredicate:v10];
  return v9;
}

- (BOOL)_deleteAllMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 hmcContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 managedObjectContext];
  objc_msgSend(v11, "hmd_assertIsExecuting");
  BOOL v12 = [(HMDNotificationRegistryCoreDataAdapter *)self _requestToFetchMKFRegistrationsWithMediaProfileUUID:v8 withMediaProperty:v9 context:v11];
  id v24 = 0;
  uint64_t v13 = [v11 executeFetchRequest:v12 error:&v24];
  id v14 = v24;
  if (!v13)
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = id v21 = v16;
      *(_DWORD *)long long buf = 138543874;
      __int16 v26 = v19;
      __int16 v27 = 2112;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete media profile registrations for media profile uuid: %@ error: %@", buf, 0x20u);

      id v16 = v21;
    }

    goto LABEL_7;
  }
  if (![v13 count])
  {
LABEL_7:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __117__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForMediaProfileUUID_withMediaProperty_hmcContext___block_invoke;
  v22[3] = &unk_264A29DC0;
  id v23 = v10;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);

  BOOL v15 = 1;
LABEL_8:

  return v15;
}

uint64_t __117__HMDNotificationRegistryCoreDataAdapter__deleteAllMKFRegistrationsForMediaProfileUUID_withMediaProperty_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (id)_fetchEnabledMKFRegistrationsForMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  id v11 = objc_alloc(MEMORY[0x263EFF260]);
  BOOL v12 = +[_MKFNotificationRegistrationMediaProperty entity];
  uint64_t v13 = [v12 name];
  id v14 = (void *)[v11 initWithEntityName:v13];

  if (v9) {
    [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@) AND (%K == YES)", @"mediaProfileIdentifier", v8, @"mediaProperty", v9, @"enabled"];
  }
  else {
  BOOL v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == YES)", @"mediaProfileIdentifier", v8, @"enabled", v24, v25];
  }
  [v14 setPredicate:v15];

  id v26 = 0;
  id v16 = [v10 executeFetchRequest:v14 error:&v26];
  id v17 = v26;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v28 = v22;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch media profile registrations for media profile uuid: %@ error: %@", buf, 0x20u);
    }
  }

  return v16;
}

- (id)_requestToFetchMKFRegistrationsWithMediaProfileUUID:(id)a3 withMediaProperty:(id)a4 context:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(a5, "hmd_assertIsExecuting");
  id v9 = objc_alloc(MEMORY[0x263EFF260]);
  id v10 = +[_MKFNotificationRegistrationMediaProperty entity];
  id v11 = [v10 name];
  BOOL v12 = (void *)[v9 initWithEntityName:v11];

  if (v7) {
    [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@) AND (%K == %@)", @"mediaProfileIdentifier", v8, @"mediaProperty", v7];
  }
  else {
  uint64_t v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"mediaProfileIdentifier", v8, v15, v16];
  }

  [v12 setPredicate:v13];
  return v12;
}

- (BOOL)_deleteAllRegistrationsForCharacteristicIIDs:(id)a3 withAccessoryUUID:(id)a4 hmcContext:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 managedObjectContext];
  objc_msgSend(v11, "hmd_assertIsExecuting");
  id v22 = 0;
  BOOL v12 = [(HMDNotificationRegistryCoreDataAdapter *)self _registrationsForCharacteristicIIDs:v8 accessoryUUID:v9 moc:v11 error:&v22];
  id v13 = v22;
  if (!v12)
  {
    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138544130;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to batch delete registrations for characteristic IIDs %@ accessory UUID %@, error: %@", buf, 0x2Au);
    }
    goto LABEL_7;
  }
  if (![v12 count])
  {
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __116__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsForCharacteristicIIDs_withAccessoryUUID_hmcContext___block_invoke;
  void v20[3] = &unk_264A29D98;
  id v21 = v10;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  BOOL v14 = 1;
LABEL_8:

  return v14;
}

uint64_t __116__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsForCharacteristicIIDs_withAccessoryUUID_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (id)_registrationsForCharacteristicIIDs:(id)a3 accessoryUUID:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  objc_msgSend(v9, "hmd_assertIsExecuting");
  id v12 = objc_alloc(MEMORY[0x263EFF260]);
  id v13 = +[_MKFNotificationRegistrationCharacteristic entity];
  BOOL v14 = [v13 name];
  uint64_t v15 = (void *)[v12 initWithEntityName:v14];

  uint64_t v16 = (void *)MEMORY[0x263F08A98];
  id v17 = updatedCharacteristicIIDs(v11);

  id v18 = [v16 predicateWithFormat:@"(%K IN %@) AND (%K == %@)", @"characteristic.instanceID", v17, @"characteristic.service.accessory.modelID", v10];

  [v15 setPredicate:v18];
  id v19 = [v9 executeFetchRequest:v15 error:a6];
  id v20 = (id)[v9 executeFetchRequest:v15 error:a6];

  return v19;
}

- (BOOL)_deleteAllCharacteristicRegistrationsWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[_MKFNotificationRegistrationCharacteristic entity];
  id v6 = [v5 name];
  BOOL v7 = [(HMDNotificationRegistryCoreDataAdapter *)self _deleteAllRegistrationsWithEntityName:v6 withHomeKeypath:@"user.home.modelID" hmcContext:v4];

  id v8 = +[_MKFNotificationRegistrationCharacteristic entity];
  id v9 = [v8 name];
  LOBYTE(self) = [(HMDNotificationRegistryCoreDataAdapter *)self _deleteAllRegistrationsWithEntityName:v9 withHomeKeypath:@"guest.home.modelID" hmcContext:v4];

  return v7 | self;
}

- (BOOL)_deleteAllRegistrationsWithEntityName:(id)a3 withHomeKeypath:(id)a4 hmcContext:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 managedObjectContext];
  objc_msgSend(v11, "hmd_assertIsExecuting");
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:v8];
  id v13 = (void *)MEMORY[0x263F08A98];
  BOOL v14 = [(HMDNotificationRegistryCoreDataAdapter *)self home];
  uint64_t v15 = [v14 uuid];
  uint64_t v16 = [v13 predicateWithFormat:@"(%K == %@)", v9, v15];
  [v12 setPredicate:v16];

  id v28 = 0;
  id v17 = [v11 executeFetchRequest:v12 error:&v28];
  id v18 = v28;
  if (!v17)
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = __int16 v25 = v20;
      *(_DWORD *)long long buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch and delete all registrations, error: %@", buf, 0x16u);

      id v20 = v25;
    }

    goto LABEL_7;
  }
  if (![v17 count])
  {
LABEL_7:
    BOOL v19 = 0;
    goto LABEL_8;
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __107__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsWithEntityName_withHomeKeypath_hmcContext___block_invoke;
  void v26[3] = &unk_264A29D70;
  id v27 = v10;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v26);

  BOOL v19 = 1;
LABEL_8:

  return v19;
}

uint64_t __107__HMDNotificationRegistryCoreDataAdapter__deleteAllRegistrationsWithEntityName_withHomeKeypath_hmcContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (id)_fetchMKFActionSetWithUUID:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  id v8 = objc_alloc(MEMORY[0x263EFF260]);
  id v9 = +[_MKFActionSet entity];
  id v10 = [v9 name];
  id v11 = (void *)[v8 initWithEntityName:v10];

  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"modelID", v6];
  [v11 setPredicate:v12];

  id v21 = 0;
  id v13 = [v7 executeFetchRequest:v11 error:&v21];
  id v14 = v21;
  if (v13 && [v13 count])
  {
    uint64_t v15 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch action set for uuid %@, error: %@", buf, 0x20u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_fetchMKFHAPAccessoryWithUUID:(id)a3 context:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_msgSend(v7, "hmd_assertIsExecuting");
  id v8 = objc_alloc(MEMORY[0x263EFF260]);
  id v9 = +[_MKFAccessory entity];
  id v10 = [v9 name];
  id v11 = (void *)[v8 initWithEntityName:v10];

  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"(%K == %@)", @"modelID", v6];
  [v11 setPredicate:v12];

  id v21 = 0;
  id v13 = [v7 executeFetchRequest:v11 error:&v21];
  id v14 = v21;
  if (v13 && [v13 count])
  {
    uint64_t v15 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      BOOL v19 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543874;
      id v23 = v19;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch accessory for uuid %@, error: %@", buf, 0x20u);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_fetchHomeMemberWithUUID:(id)a3 context:(id)a4
{
  return +[_MKFHome findHomeMemberWithUUID:a3 context:a4];
}

- (HMDNotificationRegistryCoreDataAdapter)initWithHome:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDNotificationRegistryCoreDataAdapter;
  id v5 = [(HMDNotificationRegistryCoreDataAdapter *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_home, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t81_236159 != -1) {
    dispatch_once(&logCategory__hmf_once_t81_236159, &__block_literal_global_374_236160);
  }
  id v2 = (void *)logCategory__hmf_once_v82_236161;
  return v2;
}

void __53__HMDNotificationRegistryCoreDataAdapter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v82_236161;
  logCategory__hmf_once_v82_236161 = v0;
}

@end