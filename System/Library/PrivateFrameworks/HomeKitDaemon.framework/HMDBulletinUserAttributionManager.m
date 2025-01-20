@interface HMDBulletinUserAttributionManager
+ (BOOL)currentStateCharacteristicSupportsUserAttribution:(id)a3;
+ (BOOL)targetStateCharacteristicSupportsUserAttribution:(id)a3;
+ (id)logCategory;
- (HMDAccountRegistry)accountRegistry;
- (HMDBulletinUserAttributionManager)initWithAccountRegistry:(id)a3;
- (NSMutableArray)userAttributions;
- (id)attributedUserUUIDForCurrentStateCharacteristic:(id)a3 destination:(id)a4;
- (void)removeAttributedUserUUIDForTargetStateCharacteristic:(id)a3;
- (void)saveAttributedUserUUID:(id)a3 forTargetStateCharacteristic:(id)a4;
@end

@implementation HMDBulletinUserAttributionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_userAttributions, 0);
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (NSMutableArray)userAttributions
{
  return self->_userAttributions;
}

- (void)removeAttributedUserUUIDForTargetStateCharacteristic:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 instanceID];
  v6 = [v4 value];
  p_lock = &self->_lock;
  uint64_t v8 = os_unfair_lock_lock_with_options();
  v9 = (void *)MEMORY[0x230FBD990](v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = v5;
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing user attribution for characteristic with instanceID=%@ value=%@", buf, 0x20u);
  }
  v13 = [(HMDBulletinUserAttributionManager *)v10 userAttributions];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke;
  v18[3] = &unk_264A1EB80;
  id v14 = v5;
  id v19 = v14;
  id v15 = v6;
  id v20 = v15;
  v16 = objc_msgSend(v13, "na_filter:", v18);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke_2;
  v17[3] = &unk_264A1EB58;
  v17[4] = v10;
  objc_msgSend(v16, "na_each:", v17);

  os_unfair_lock_unlock(p_lock);
}

uint64_t __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 targetCharacteristicInstanceID];
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    v5 = [v3 value];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userAttributions];
  [v4 removeObject:v3];
}

- (id)attributedUserUUIDForCurrentStateCharacteristic:(id)a3 destination:(id)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v77 = a4;
  v7 = (void *)MEMORY[0x230FBD990]();
  uint64_t v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v87 = v10;
    __int16 v88 = 2112;
    uint64_t v89 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Attempting to retrieve user attribution for current state characteristic=%@", buf, 0x16u);
  }
  v11 = [(id)objc_opt_class() currentTargetStateCharacteristicTypeMap];
  v12 = [v6 type];
  v13 = objc_msgSend(v11, "hmf_stringForKey:", v12);

  id v14 = [v6 service];
  id v15 = [v14 characteristics];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke;
  v84[3] = &unk_264A2D3B8;
  id v16 = v13;
  id v85 = v16;
  v17 = objc_msgSend(v15, "na_firstObjectPassingTest:", v84);

  if (v17)
  {
    p_lock = &v8->_lock;
    os_unfair_lock_lock_with_options();
    id v19 = [(HMDBulletinUserAttributionManager *)v8 userAttributions];
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_39;
    v81[3] = &unk_264A1EB80;
    id v20 = v17;
    id v82 = v20;
    id v21 = v6;
    id v83 = v21;
    v22 = objc_msgSend(v19, "na_firstObjectPassingTest:", v81);

    os_unfair_lock_unlock(&v8->_lock);
    if (!v22)
    {
      v40 = (void *)MEMORY[0x230FBD990]();
      v41 = v8;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = HMFGetLogIdentifier();
        v44 = [v20 instanceID];
        v45 = [v20 value];
        *(_DWORD *)buf = 138543874;
        v87 = v43;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v44;
        __int16 v90 = 2112;
        id v91 = v45;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@No saved tuple found for target state characteristic with instanceID=%@ and value=%@", buf, 0x20u);
      }
      goto LABEL_15;
    }
    __int16 v23 = [v21 lastKnownValueUpdateTime];
    v24 = [v22 lastKnownValueUpdateTime];
    [v23 timeIntervalSinceDate:v24];
    double v26 = v25;

    uint64_t v27 = HMDSecureClassBulletinUserAttributionTime();
    if (v26 > v28)
    {
      v29 = (void *)MEMORY[0x230FBD990](v27);
      v30 = v8;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        HMDSecureClassBulletinUserAttributionTime();
        *(_DWORD *)buf = 138543618;
        v87 = v32;
        __int16 v88 = 2048;
        uint64_t v89 = (uint64_t)v33;
        _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@TargetState changed date is too far apart from CurrentState changed date (%ld seconds), these are likely different operations, therefore we do not know who triggered this operation.", buf, 0x16u);
      }
      os_unfair_lock_lock_with_options();
      v34 = [(HMDBulletinUserAttributionManager *)v30 userAttributions];
      [v34 removeObject:v22];

      os_unfair_lock_unlock(p_lock);
LABEL_15:
      id v39 = 0;
LABEL_40:

      goto LABEL_41;
    }
    v76 = [v22 userUUID];
    v46 = [v21 accessory];
    v75 = [v46 home];

    v47 = [v75 userWithUUID:v76];
    v48 = v47;
    if (!v47)
    {
      v53 = (void *)MEMORY[0x230FBD990]();
      v54 = v8;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = HMFGetLogIdentifier();
        v57 = [v21 shortDescription];
        *(_DWORD *)buf = 138543874;
        v87 = v56;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v57;
        __int16 v90 = 2112;
        id v91 = v76;
        _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because the attributedUser cannot be determined from uuid=%@", buf, 0x20u);
      }
      id v39 = 0;
      goto LABEL_39;
    }
    if ([v47 isOwner])
    {
      v49 = (void *)MEMORY[0x230FBD990]();
      v50 = v8;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v87 = v52;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v76;
        __int16 v90 = 2112;
        id v91 = v21;
        __int16 v92 = 2112;
        v93 = v48;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_INFO, "%{public}@Returning attributedUserUUID=%@ (owner) for current state characteristic=%@ for destinationUser=%@", buf, 0x2Au);
      }
      id v39 = v76;
      goto LABEL_39;
    }
    v74 = +[HMDDeviceHandle deviceHandleForDestination:v77];
    if (v74)
    {
      char v80 = 0;
      v58 = [(HMDBulletinUserAttributionManager *)v8 accountRegistry];
      id v73 = [v58 deviceForHandle:v74 exists:&v80];

      if (!v80)
      {
        v59 = (void *)MEMORY[0x230FBD990]();
        v60 = v8;
        v61 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v87 = v62;
          __int16 v88 = 2112;
          uint64_t v89 = (uint64_t)v21;
          __int16 v90 = 2112;
          id v91 = v77;
          _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because we cannot determine an account for the device with destination=%@", buf, 0x20u);
        }
        id v39 = 0;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {
      id v73 = 0;
    }
    v63 = [v75 users];
    v78[0] = MEMORY[0x263EF8330];
    v78[1] = 3221225472;
    v78[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_42;
    v78[3] = &unk_264A2DB60;
    id v73 = v73;
    id v79 = v73;
    v72 = objc_msgSend(v63, "na_firstObjectPassingTest:", v78);

    LODWORD(v63) = [v72 isAdministrator];
    context = (void *)MEMORY[0x230FBD990]();
    v64 = v8;
    v65 = HMFGetOSLogHandle();
    BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
    if (v63)
    {
      if (v66)
      {
        v67 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v87 = v67;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v76;
        __int16 v90 = 2112;
        id v91 = v21;
        __int16 v92 = 2112;
        v93 = v72;
        _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@Returning attributedUserUUID=%@ for current state characteristic=%@ for destinationUser=%@ (who is an admin)", buf, 0x2Au);
      }
      id v39 = v76;
    }
    else
    {
      if (v66)
      {
        v68 = HMFGetLogIdentifier();
        v69 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v72, "privilege", context));
        *(_DWORD *)buf = 138544386;
        v87 = v68;
        __int16 v88 = 2112;
        uint64_t v89 = (uint64_t)v21;
        __int16 v90 = 2112;
        id v91 = v48;
        __int16 v92 = 2112;
        v93 = v72;
        __int16 v94 = 2112;
        v95 = v69;
        _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because the attributedUser=%@ is not the owner and the user we are sending to (destinationUser=%@) is not an admin. %@", buf, 0x34u);
      }
      id v39 = 0;
    }

    goto LABEL_38;
  }
  v35 = (void *)MEMORY[0x230FBD990]();
  v36 = v8;
  v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    v38 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v87 = v38;
    __int16 v88 = 2112;
    uint64_t v89 = (uint64_t)v6;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEBUG, "%{public}@No targetStateCounterpart available for characteristic=%@", buf, 0x16u);
  }
  id v39 = 0;
LABEL_41:

  return v39;
}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 type];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_39(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 targetCharacteristicInstanceID];
  v5 = [*(id *)(a1 + 32) instanceID];
  if ([v4 isEqual:v5])
  {
    id v6 = [v3 value];
    v7 = [*(id *)(a1 + 40) value];
    uint64_t v8 = [v6 isEqual:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = [a2 account];
  uint64_t v4 = [v3 identifier];
  v5 = [v4 identifier];
  id v6 = [*(id *)(a1 + 32) account];
  v7 = [v6 identifier];
  uint64_t v8 = [v7 identifier];
  uint64_t v9 = objc_msgSend(v5, "hmf_isEqualToUUID:", v8);

  return v9;
}

- (void)saveAttributedUserUUID:(id)a3 forTargetStateCharacteristic:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x230FBD990]();
  uint64_t v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [v7 instanceID];
    v13 = [v7 value];
    *(_DWORD *)buf = 138544130;
    uint64_t v27 = v11;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    v31 = v12;
    __int16 v32 = 2112;
    double v33 = v13;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving attributedUserUUID=%@ for targetCharacteristicInstanceID=%@ value=%@", buf, 0x2Au);
  }
  id v14 = [MEMORY[0x263EFF9C0] set];
  os_unfair_lock_lock_with_options();
  id v15 = [(HMDBulletinUserAttributionManager *)v9 userAttributions];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke;
  v24[3] = &unk_264A1EB58;
  id v16 = v14;
  id v25 = v16;
  objc_msgSend(v15, "na_each:", v24);

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_2;
  v23[3] = &unk_264A1EB58;
  v23[4] = v9;
  objc_msgSend(v16, "na_each:", v23);
  v17 = objc_opt_new();
  v18 = [v7 instanceID];
  [v17 setTargetCharacteristicInstanceID:v18];

  id v19 = [v7 value];
  [v17 setValue:v19];

  id v20 = [v7 lastKnownValueUpdateTime];
  [v17 setLastKnownValueUpdateTime:v20];

  [v17 setUserUUID:v6];
  id v21 = [(HMDBulletinUserAttributionManager *)v9 userAttributions];
  [v21 addObject:v17];

  os_unfair_lock_unlock(&v9->_lock);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_3;
  v22[3] = &unk_264A1EB58;
  v22[4] = v9;
  objc_msgSend(v16, "na_each:", v22);
}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [MEMORY[0x263EFF910] now];
  uint64_t v4 = [v8 lastKnownValueUpdateTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  HMDSecureClassBulletinUserAttributionTime();
  if (v6 > v7) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userAttributions];
  [v4 removeObject:v3];
}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = HMFGetLogIdentifier();
    id v8 = [v3 targetCharacteristicInstanceID];
    int v9 = 138543618;
    v10 = v7;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed orphaned user attribution for characteristic with instanceID=%@", (uint8_t *)&v9, 0x16u);
  }
}

- (HMDBulletinUserAttributionManager)initWithAccountRegistry:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBulletinUserAttributionManager;
  double v6 = [(HMDBulletinUserAttributionManager *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    userAttributions = v6->_userAttributions;
    v6->_userAttributions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_accountRegistry, a3);
  }

  return v6;
}

+ (BOOL)targetStateCharacteristicSupportsUserAttribution:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  id v5 = [v3 type];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0C510]];
  if (v6)
  {
    uint64_t v7 = [v4 type];
    if ([v7 isEqualToString:*MEMORY[0x263F0D798]])
    {
      char v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    __int16 v23 = v7;
  }
  int v9 = [v3 type];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0C4A8]];
  if (v10)
  {
    __int16 v11 = [v4 type];
    if ([v11 isEqualToString:*MEMORY[0x263F0D6F8]])
    {
      char v8 = 1;
      goto LABEL_20;
    }
    v22 = v11;
  }
  v12 = [v3 type];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F0C548]];
  if (v13)
  {
    id v14 = [v4 type];
    if ([v14 isEqualToString:*MEMORY[0x263F0D7D8]])
    {
      char v8 = 1;
      goto LABEL_19;
    }
    id v21 = v14;
  }
  id v15 = [v3 type];
  if ([v15 isEqualToString:*MEMORY[0x263F0C520]])
  {
    [v4 type];
    int v20 = v6;
    id v16 = v9;
    v18 = v17 = v5;
    char v8 = [v18 isEqualToString:*MEMORY[0x263F0D8A8]];

    id v5 = v17;
    int v9 = v16;
    int v6 = v20;

    id v14 = v21;
    if ((v13 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {

    char v8 = 0;
    id v14 = v21;
    if (!v13)
    {
LABEL_15:

      __int16 v11 = v22;
      if (v10) {
        goto LABEL_20;
      }
LABEL_16:

      uint64_t v7 = v23;
      if (!v6) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
LABEL_19:

  __int16 v11 = v22;
  if ((v10 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_20:

  uint64_t v7 = v23;
  if (v6) {
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

+ (BOOL)currentStateCharacteristicSupportsUserAttribution:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  id v5 = [v3 type];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F0C0B0]];
  if (v6)
  {
    uint64_t v7 = [v4 type];
    if ([v7 isEqualToString:*MEMORY[0x263F0D798]])
    {
      char v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    __int16 v23 = v7;
  }
  int v9 = [v3 type];
  int v10 = [v9 isEqualToString:*MEMORY[0x263F0C040]];
  if (v10)
  {
    __int16 v11 = [v4 type];
    if ([v11 isEqualToString:*MEMORY[0x263F0D6F8]])
    {
      char v8 = 1;
      goto LABEL_20;
    }
    v22 = v11;
  }
  v12 = [v3 type];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F0C0E8]];
  if (v13)
  {
    id v14 = [v4 type];
    if ([v14 isEqualToString:*MEMORY[0x263F0D7D8]])
    {
      char v8 = 1;
      goto LABEL_19;
    }
    id v21 = v14;
  }
  id v15 = [v3 type];
  if ([v15 isEqualToString:*MEMORY[0x263F0C0D0]])
  {
    [v4 type];
    int v20 = v6;
    id v16 = v9;
    v18 = v17 = v5;
    char v8 = [v18 isEqualToString:*MEMORY[0x263F0D8A8]];

    id v5 = v17;
    int v9 = v16;
    int v6 = v20;

    id v14 = v21;
    if ((v13 & 1) == 0) {
      goto LABEL_15;
    }
  }
  else
  {

    char v8 = 0;
    id v14 = v21;
    if (!v13)
    {
LABEL_15:

      __int16 v11 = v22;
      if (v10) {
        goto LABEL_20;
      }
LABEL_16:

      uint64_t v7 = v23;
      if (!v6) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
LABEL_19:

  __int16 v11 = v22;
  if ((v10 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_20:

  uint64_t v7 = v23;
  if (v6) {
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_109507 != -1) {
    dispatch_once(&logCategory__hmf_once_t16_109507, &__block_literal_global_109508);
  }
  v2 = (void *)logCategory__hmf_once_v17_109509;
  return v2;
}

void __48__HMDBulletinUserAttributionManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v17_109509;
  logCategory__hmf_once_v17_109509 = v0;
}

@end