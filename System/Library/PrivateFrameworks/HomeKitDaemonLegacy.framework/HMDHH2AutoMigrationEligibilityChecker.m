@interface HMDHH2AutoMigrationEligibilityChecker
+ (id)logCategory;
- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3;
- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3 accountManager:(id)a4 featuresDataSource:(id)a5 userDefaults:(id)a6;
- (HMDHomeManager)homeManager;
- (id)frameworkSwitchProvider;
- (id)isHSA2Enabled;
- (uint64_t)_hasAnySharedUser;
- (uint64_t)_migrationReadinessiCloudAccountStatus;
- (uint64_t)_unsupportedDeviceTypeFromDevice:(void *)a1;
- (uint64_t)_unsupportedDevicesOnCurrentAccountNotAtLeastVersion:(void *)a1;
- (uint64_t)_unsupportedDevicesWithCurrentDeviceAtLeastVersion:(void *)a3 residentDevicesAtLeastVersion:(void *)a4 otherDevicesAtLeastVersion:;
- (uint64_t)numberOwnedNonEmptyHomes;
- (uint64_t)numberOwnedSharedHomes;
- (uint64_t)numberUnownedSharedHomes;
- (uint64_t)ownedHomesAreEmpty;
- (void)fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:(id)a3;
- (void)fetchIsCurrentUserEligibleForMigrationByOwnerWithCompletion:(id)a3;
- (void)setFrameworkSwitchProvider:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setIsHSA2Enabled:(id)a3;
@end

@implementation HMDHH2AutoMigrationEligibilityChecker

- (void).cxx_destruct
{
  objc_storeStrong(&self->_frameworkSwitchProvider, 0);
  objc_storeStrong(&self->_isHSA2Enabled, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (void)setFrameworkSwitchProvider:(id)a3
{
}

- (id)frameworkSwitchProvider
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setIsHSA2Enabled:(id)a3
{
}

- (id)isHSA2Enabled
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeManager:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (void)fetchIsCurrentUserEligibleForMigrationByOwnerWithCompletion:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v81 = (void (**)(id, HMDHH2AutoMigrationEligibilityResult *, void *))a3;
  if (!self) {
    goto LABEL_23;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v4 = [(HMDHH2AutoMigrationEligibilityChecker *)self homeManager];
  v5 = [v4 homes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v83 objects:v90 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v84;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v84 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        if (([v11 isOwnerUser] & 1) == 0 && (objc_msgSend(v11, "isUpdatedToHH2") & 1) == 0)
        {
          uint64_t v12 = [v11 owner];
          v13 = (void *)v12;
          if (v8)
          {
            char v14 = [v8 isAccountEqualWithUser:v12];

            if ((v14 & 1) == 0)
            {
              v15 = (void *)MEMORY[0x1D9452090]();
              v16 = self;
              v17 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                v19 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                v89 = v19;
                _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@At least one shared home owned by different a owner, all shared homes must be owned by the same owner to be eligible for auto migration by owner", buf, 0xCu);
              }
              char v87 = 0;

              goto LABEL_21;
            }
          }
          else
          {
            v8 = (void *)v12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v83 objects:v90 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    v8 = 0;
  }

  char v87 = 1;
LABEL_21:

  if (v87)
  {
    uint64_t v20 = 0;
  }
  else
  {
LABEL_23:
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)v90 = 138543362;
      uint64_t v91 = (uint64_t)v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: only shared homes owned by the same owner supported", v90, 0xCu);
    }
    uint64_t v20 = 512;
  }
  if ((-[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x1D9452090]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)v90 = 138543362;
      uint64_t v91 = (uint64_t)v28;
      _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: found non-empty owned homes", v90, 0xCu);
    }
    v20 |= 0x400uLL;
  }
  v29 = [(HMDHH2AutoMigrationEligibilityChecker *)self homeManager];
  uint64_t v30 = -[HMDHH2AutoMigrationEligibilityChecker _migrationReadinessiCloudAccountStatus](self);
  uint64_t v82 = v30;
  if (v30)
  {
    uint64_t v31 = v30;
    v32 = (void *)MEMORY[0x1D9452090]();
    v33 = self;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      v36 = (void *)v35;
      v37 = @"iCloud account is not signed in";
      if (v31 <= 7)
      {
        if (v31 == 2)
        {
          v37 = @"iCloud account status could not be determined";
        }
        else if (v31 == 4)
        {
          v37 = @"iCloud account status is temporarily unavailable";
        }
      }
      else
      {
        switch(v31)
        {
          case 8:
            v37 = @"iCloud account status is restricted";
            break;
          case 16:
            v37 = @"iCloud account invalid credentials";
            break;
          case 32:
            v37 = @"iCloud account need to verify terms";
            break;
        }
      }
      *(_DWORD *)v90 = 138543618;
      uint64_t v91 = v35;
      __int16 v92 = 2114;
      v93 = v37;
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: %{public}@", v90, 0x16u);
    }
    v20 |= 1uLL;
  }
  v38 = [v29 cloudDataSyncStateFilter];
  char v39 = [v38 isiCloudSwitchEnabled];

  if ((v39 & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1D9452090]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)v90 = 138543362;
      uint64_t v91 = (uint64_t)v43;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: iCloud switch for HomeKit is not enabled", v90, 0xCu);
    }
    v20 |= 2uLL;
  }
  v44 = [v29 cloudDataSyncStateFilter];
  char v45 = [v44 isKeychainSyncSwitchEnabled];

  if ((v45 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1D9452090]();
    v47 = self;
    v48 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)v90 = 138543362;
      uint64_t v91 = (uint64_t)v49;
      _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration by owner: iCloud keychain sync is not enabled", v90, 0xCu);
    }
    v20 |= 4uLL;
  }
  v50 = [(HMDHH2AutoMigrationEligibilityChecker *)self isHSA2Enabled];
  char v51 = v50[2]();

  if ((v51 & 1) == 0)
  {
    v52 = (void *)MEMORY[0x1D9452090]();
    v53 = self;
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = HMFGetLogIdentifier();
      *(_DWORD *)v90 = 138543362;
      uint64_t v91 = (uint64_t)v55;
      _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration by owner: HSA2 is not enabled", v90, 0xCu);
    }
    v20 |= 8uLL;
  }
  if (!self
    || ([(HMDHH2AutoMigrationEligibilityChecker *)self homeManager],
        v56 = objc_claimAutoreleasedReturnValue(),
        [v56 idsServerBag],
        v57 = objc_claimAutoreleasedReturnValue(),
        v56,
        !v57))
  {
    uint64_t v59 = 0;
    goto LABEL_64;
  }
  v58 = [v57 minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual];
  uint64_t v59 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesOnCurrentAccountNotAtLeastVersion:](self, v58);

  if (!v59)
  {
LABEL_64:
    uint64_t v64 = v20;
    goto LABEL_65;
  }
  v60 = (void *)MEMORY[0x1D9452090]();
  v61 = self;
  v62 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    v63 = HMFGetLogIdentifier();
    *(_DWORD *)v90 = 138543362;
    uint64_t v91 = (uint64_t)v63;
    _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for migration by owner: not all devices support migration by owner performing manual migration", v90, 0xCu);
  }
  uint64_t v64 = v20 | 0x10;
LABEL_65:
  uint64_t v65 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedNonEmptyHomes](self);
  uint64_t v66 = -[HMDHH2AutoMigrationEligibilityChecker numberUnownedSharedHomes](self);
  uint64_t v67 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedSharedHomes](self);
  p_vtable = &OBJC_METACLASS___HMDOutgoingHomeInvitationModel.vtable;
  v69 = -[HMDHH2AutoMigrationEligibilityResult initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:]([HMDHH2AutoMigrationEligibilityResult alloc], "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", v64, v82, v59, -[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self), v65, v66, v67);
  v80 = v29;
  if (self
    && ([(HMDHH2AutoMigrationEligibilityChecker *)self homeManager],
        v70 = objc_claimAutoreleasedReturnValue(),
        [v70 idsServerBag],
        v71 = objc_claimAutoreleasedReturnValue(),
        v70,
        v71))
  {
    v72 = [v71 minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto];
    uint64_t v73 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesOnCurrentAccountNotAtLeastVersion:](self, v72);

    if (v73)
    {
      v74 = (void *)MEMORY[0x1D9452090]();
      v75 = self;
      v76 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v77 = v79 = v74;
        *(_DWORD *)v90 = 138543362;
        uint64_t v91 = (uint64_t)v77;
        _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for migration by owner: not all devices support migration by owner performing auto migration", v90, 0xCu);

        v74 = v79;
      }

      v20 |= 0x10uLL;
      p_vtable = (void **)(&OBJC_METACLASS___HMDOutgoingHomeInvitationModel + 24);
    }
  }
  else
  {
    uint64_t v73 = 0;
  }
  v78 = (void *)[objc_alloc((Class)(p_vtable + 207)) initWithStatus:v20 iCloudAccountStatus:v82 unsupportedDevices:v73 hasOnlyEmptyHomes:-[HMDHH2AutoMigrationEligibilityChecker ownedHomesAreEmpty](self) numberOwnedNonEmptyHomes:v65 numberUnownedSharedHomes:v66 numberOwnedSharedHomes:v67];
  v81[2](v81, v69, v78);
}

- (uint64_t)ownedHomesAreEmpty
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "homeManager", 0);
  v2 = [v1 homes];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 isOwnerUser] && !HMDIsEmptyHome(v7))
        {
          uint64_t v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_13:

  return v8;
}

- (uint64_t)_migrationReadinessiCloudAccountStatus
{
  if (!a1) {
    return 0;
  }
  v2 = [a1 frameworkSwitchProvider];
  uint64_t v3 = [a1 homeManager];
  uint64_t v4 = ((void (**)(void, void *))v2)[2](v2, v3);

  uint64_t v8 = 0;
  unint64_t v5 = [v4 areCloudKitServersReachableWithError:&v8];
  uint64_t v6 = 0;
  if (v5 <= 6) {
    uint64_t v6 = qword_1D54D3C08[v5];
  }

  return v6;
}

- (uint64_t)numberOwnedNonEmptyHomes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = objc_msgSend(a1, "homeManager", 0);
  v2 = [v1 homes];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 isOwnerUser]) {
          v5 += !HMDIsEmptyHome(v8);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)numberUnownedSharedHomes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(a1, "homeManager", 0);
  v2 = [v1 homes];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isOwnerUser] ^ 1;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)numberOwnedSharedHomes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = objc_msgSend(a1, "homeManager", 0);
  v2 = [v1 homes];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isOwnerUser])
        {
          long long v9 = [v8 users];
          unsigned int v10 = objc_msgSend(v9, "na_any:", &__block_literal_global_98);

          v5 += v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_unsupportedDevicesOnCurrentAccountNotAtLeastVersion:(void *)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = objc_msgSend(objc_getProperty(a1, v4, 16, 1), "account");
  uint64_t v6 = [v5 devices];

  uint64_t v7 = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v9 = 138543874;
    long long v23 = v9;
    v24 = v7;
    do
    {
      uint64_t v13 = 0;
      uint64_t v25 = v10;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        long long v15 = objc_msgSend(v14, "derivedVersion", v23);
        char v16 = [v15 isAtLeastVersion:v3];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = a1;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = uint64_t v20 = a1;
            *(_DWORD *)buf = v23;
            uint64_t v31 = v21;
            __int16 v32 = 2114;
            id v33 = v3;
            __int16 v34 = 2114;
            uint64_t v35 = v14;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Device for current user does not meet required version %{public}@ for HH2 auto migration: %{public}@", buf, 0x20u);

            a1 = v20;
            uint64_t v7 = v24;
          }

          v11 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](v18, v14);
          uint64_t v10 = v25;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (uint64_t)_unsupportedDeviceTypeFromDevice:(void *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isCurrentDevice]) {
    uint64_t v4 = 16;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v3 productInfo];
  uint64_t v6 = [v5 productPlatform];

  switch(v6)
  {
    case 0:
      uint64_t v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = a1;
      long long v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected HMFProductPlatformUnknown", (uint8_t *)&v16, 0xCu);
      }
      break;
    case 1:
      v4 |= 4uLL;
      break;
    case 2:
      v4 |= 1uLL;
      break;
    case 3:
      v4 |= 8uLL;
      break;
    case 4:
      v4 |= 2uLL;
      break;
    case 5:
      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = a1;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v14 = HMFGetLogIdentifier();
        int v16 = 138543362;
        uint64_t v17 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected VisionOS device that does not support HH2", (uint8_t *)&v16, 0xCu);
      }
      v4 |= 0x20uLL;
      break;
    default:
      break;
  }

  return v4;
}

BOOL __63__HMDHH2AutoMigrationEligibilityChecker_numberOwnedSharedHomes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isOwner] & 1) != 0 || (objc_msgSend(v2, "isRemoteGateway"))
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 userID];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (void)fetchIsCurrentUserEligibleForAutoMigrationWithCompletion:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v5 = [(HMDHH2AutoMigrationEligibilityChecker *)self homeManager];
  uint64_t v6 = -[HMDHH2AutoMigrationEligibilityChecker _migrationReadinessiCloudAccountStatus](self);
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    HMFGetOSLogHandle();
    long long v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      uint64_t v11 = (void *)v10;
      id v12 = @"iCloud account is not signed in";
      if (v6 <= 7)
      {
        if (v6 == 2)
        {
          id v12 = @"iCloud account status could not be determined";
        }
        else if (v6 == 4)
        {
          id v12 = @"iCloud account status is temporarily unavailable";
        }
      }
      else
      {
        switch(v6)
        {
          case 8:
            id v12 = @"iCloud account status is restricted";
            break;
          case 16:
            id v12 = @"iCloud account invalid credentials";
            break;
          case 32:
            id v12 = @"iCloud account need to verify terms";
            break;
        }
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v10;
      __int16 v51 = 2114;
      v52 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: %{public}@", buf, 0x16u);
    }
    v46[3] |= 1uLL;
  }
  uint64_t v13 = [v5 cloudDataSyncStateFilter];
  char v14 = [v13 isiCloudSwitchEnabled];

  if ((v14 & 1) == 0)
  {
    long long v15 = (void *)MEMORY[0x1D9452090]();
    int v16 = self;
    HMFGetOSLogHandle();
    uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: iCloud switch for HomeKit is not enabled", buf, 0xCu);
    }
    v46[3] |= 2uLL;
  }
  v19 = [v5 cloudDataSyncStateFilter];
  char v20 = [v19 isKeychainSyncSwitchEnabled];

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    HMFGetOSLogHandle();
    long long v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Current user is not eligible for auto migration: iCloud keychain sync is not enabled", buf, 0xCu);
    }
    v46[3] |= 4uLL;
  }
  uint64_t v25 = [(HMDHH2AutoMigrationEligibilityChecker *)self isHSA2Enabled];
  char v26 = v25[2]();

  if ((v26 & 1) == 0)
  {
    long long v27 = (void *)MEMORY[0x1D9452090]();
    long long v28 = self;
    HMFGetOSLogHandle();
    long long v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = (uint64_t)v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: HSA2 is not enabled", buf, 0xCu);
    }
    v46[3] |= 8uLL;
  }
  if (!self)
  {
    uint64_t v38 = 0;
    goto LABEL_37;
  }
  if (!-[HMDHH2AutoMigrationEligibilityChecker _hasAnySharedUser](self))
  {
    uint64_t v37 = [(HMDHH2AutoMigrationEligibilityChecker *)self homeManager];
    __int16 v32 = [v37 idsServerBag];

    if (v32)
    {
      id v33 = [v32 minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers];
      __int16 v34 = [v32 minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers];
      uint64_t v35 = [v32 minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers];
      uint64_t v36 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesWithCurrentDeviceAtLeastVersion:residentDevicesAtLeastVersion:otherDevicesAtLeastVersion:](self, v33, v34, v35);
      goto LABEL_34;
    }
LABEL_35:
    uint64_t v38 = 0;
    goto LABEL_36;
  }
  uint64_t v31 = [(HMDHH2AutoMigrationEligibilityChecker *)self homeManager];
  __int16 v32 = [v31 idsServerBag];

  if (!v32) {
    goto LABEL_35;
  }
  id v33 = [v32 minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers];
  __int16 v34 = [v32 minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers];
  uint64_t v35 = [v32 minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers];
  uint64_t v36 = -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDevicesWithCurrentDeviceAtLeastVersion:residentDevicesAtLeastVersion:otherDevicesAtLeastVersion:](self, v33, v34, v35);
LABEL_34:
  uint64_t v38 = v36;

LABEL_36:
LABEL_37:
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __98__HMDHH2AutoMigrationEligibilityChecker_fetchIsCurrentUserEligibleForAutoMigrationWithCompletion___block_invoke;
  v40[3] = &unk_1E6A0C850;
  v40[4] = self;
  v42 = &v45;
  uint64_t v43 = v38;
  uint64_t v44 = v6;
  id v39 = v4;
  id v41 = v39;
  [v5 fetchHasOnlyEmptyHomesWithCompletion:v40];

  _Block_object_dispose(&v45, 8);
}

void __98__HMDHH2AutoMigrationEligibilityChecker_fetchIsCurrentUserEligibleForAutoMigrationWithCompletion___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1D9452090]();
  uint64_t v171 = a1;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    uint64_t v7 = HMFBooleanToString();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    __int16 v197 = 2114;
    unint64_t v198 = (unint64_t)v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Does user have only empty homes: %{public}@", buf, 0x16u);
  }
  id v8 = *(void **)(v171 + 32);
  if (v8)
  {
    long long v182 = 0u;
    long long v183 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    v169 = v8;
    long long v9 = [v8 homeManager];
    obuint64_t j = [v9 homes];

    id v172 = (id)[obj countByEnumeratingWithState:&v180 objects:buf count:16];
    if (v172)
    {
      uint64_t v10 = *(void *)v181;
      uint64_t v168 = *(void *)v181;
      while (2)
      {
        for (uint64_t i = 0; i != v172; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v181 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v180 + 1) + 8 * i);
          if (([v12 isOwnerUser] & 1) == 0)
          {
            v161 = (void *)MEMORY[0x1D9452090]();
            id v162 = v169;
            v163 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
            {
              v164 = HMFGetLogIdentifier();
              *(_DWORD *)v194 = 138543618;
              *(void *)&v194[4] = v164;
              *(_WORD *)&v194[12] = 2112;
              *(void *)&v194[14] = v12;
              _os_log_impl(&dword_1D49D5000, v163, OS_LOG_TYPE_INFO, "%{public}@Current user is in a shared home: %@", v194, 0x16u);
            }
LABEL_34:

            goto LABEL_35;
          }
          long long v178 = 0u;
          long long v179 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          uint64_t v13 = [v12 users];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v176 objects:&v184 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v177;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v177 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = *(void **)(*((void *)&v176 + 1) + 8 * j);
                if (([v17 isOwner] & 1) == 0)
                {
                  uint64_t v18 = [v17 userDataController];
                  char v19 = [v18 supportsHH2MigrationByOwnerManual];
                  char v20 = [v18 supportsHH2MigrationByOwnerAuto];
                  int v21 = isInternalBuild();
                  char v22 = v20 | v19;
                  if (!v21) {
                    char v22 = v20;
                  }
                  if ((v22 & 1) == 0)
                  {
                    char v26 = (void *)MEMORY[0x1D9452090]();
                    id v27 = v169;
                    long long v28 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                    {
                      long long v29 = HMFGetLogIdentifier();
                      uint64_t v30 = [v12 shortDescription];
                      *(_DWORD *)v194 = 138543874;
                      *(void *)&v194[4] = v29;
                      *(_WORD *)&v194[12] = 2114;
                      *(void *)&v194[14] = v30;
                      *(_WORD *)&v194[22] = 2114;
                      v195 = v17;
                      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ has at least one shared user that doesn't support migration by owner performing auto migration: %{public}@", v194, 0x20u);
                    }

                    goto LABEL_33;
                  }
                }
                if (([v17 isOwner] & 1) == 0)
                {
                  long long v23 = [v17 userDataController];
                  char v24 = [v23 supportsHH2MigrationByOwnerAuto];

                  if ((v24 & 1) == 0)
                  {
                    uint64_t v31 = (void *)MEMORY[0x1D9452090]();
                    id v32 = v169;
                    id v33 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      __int16 v34 = HMFGetLogIdentifier();
                      uint64_t v35 = [v12 shortDescription];
                      *(_DWORD *)v194 = 138543874;
                      *(void *)&v194[4] = v34;
                      *(_WORD *)&v194[12] = 2114;
                      *(void *)&v194[14] = v35;
                      *(_WORD *)&v194[22] = 2114;
                      v195 = v17;
                      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ has at least one shared user that doesn't support migration by owner performing auto migration: %{public}@", v194, 0x20u);
                    }
LABEL_33:

                    goto LABEL_34;
                  }
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v176 objects:&v184 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }

          uint64_t v10 = v168;
        }
        id v172 = (id)[obj countByEnumeratingWithState:&v180 objects:buf count:16];
        uint64_t v10 = v168;
        if (v172) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
LABEL_35:
    uint64_t v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = *(id *)(v171 + 32);
    uint64_t v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not all homes support HH2", buf, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24) |= 0x20uLL;
  }
  if ((a2 & 1) == 0 && *(void *)(v171 + 56))
  {
    v40 = (void *)MEMORY[0x1D9452090]();
    id v41 = *(id *)(v171 + 32);
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      uint64_t v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v43;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not all devices on current account support HH2 auto migration", buf, 0xCu);
    }
    *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24) |= 0x10uLL;
  }
  uint64_t v44 = *(void **)(v171 + 32);
  if (v44)
  {
    v165 = [*(id *)(v171 + 32) homeManager];
    v167 = [v165 lastUserAddRemoveTimestamp];
    uint64_t v45 = (void *)MEMORY[0x1D9452090]();
    id obja = v44;
    v46 = HMFGetOSLogHandle();
    BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
    if (v167)
    {
      if (v47)
      {
        uint64_t v48 = HMFGetLogIdentifier();
        *(_DWORD *)v194 = 138543618;
        *(void *)&v194[4] = v48;
        *(_WORD *)&v194[12] = 2114;
        *(void *)&v194[14] = v167;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Last user add/remove occurred on %{public}@", v194, 0x16u);
      }
      v49 = [MEMORY[0x1E4F1C9C8] now];
      [v49 timeIntervalSinceDate:v167];
      double v51 = v50;
      uint64_t v53 = objc_msgSend(objc_getProperty(obja, v52, 32, 1), "objectForKey:", @"recentUserAddRemoveTimeIntervalKey");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v54 = v53;
      }
      else {
        v54 = 0;
      }
      id v55 = v54;

      if (v55)
      {
        [v55 doubleValue];
        double v57 = v56;
      }
      else if (isInternalBuild())
      {
        double v57 = 432000.0;
      }
      else
      {
        double v57 = 2592000.0;
      }

      BOOL v170 = v51 < v57;
    }
    else
    {
      if (v47)
      {
        v58 = HMFGetLogIdentifier();
        *(_DWORD *)v194 = 138543362;
        *(void *)&v194[4] = v58;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Setting last user add/remove to now since it is not set", v194, 0xCu);
      }
      [v165 setLastUserAddRemoveTimestamp];
      BOOL v170 = 1;
    }
    uint64_t v59 = [v165 homes];
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    id v173 = v59;
    uint64_t v60 = [v173 countByEnumeratingWithState:&v184 objects:buf count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v185;
      while (2)
      {
        for (uint64_t k = 0; k != v60; ++k)
        {
          if (*(void *)v185 != v61) {
            objc_enumerationMutation(v173);
          }
          v63 = *(void **)(*((void *)&v184 + 1) + 8 * k);
          if (HMDIsEmptyHome(v63))
          {
            uint64_t v64 = (void *)MEMORY[0x1D9452090]();
            id v65 = obja;
            uint64_t v66 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              uint64_t v67 = HMFGetLogIdentifier();
              v68 = [v63 shortDescription];
              *(_DWORD *)v194 = 138543618;
              *(void *)&v194[4] = v67;
              *(_WORD *)&v194[12] = 2114;
              *(void *)&v194[14] = v68;
              _os_log_impl(&dword_1D49D5000, v66, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ is empty, ignoring for eligible resident check", v194, 0x16u);
            }
          }
          else
          {
            *(void *)v194 = 0;
            *(void *)&v194[8] = v194;
            *(void *)&v194[16] = 0x2020000000;
            v195 = 0;
            v69 = [v63 enabledResidents];
            *(void *)&long long v180 = MEMORY[0x1E4F143A8];
            *((void *)&v180 + 1) = 3221225472;
            *(void *)&long long v181 = __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke;
            *((void *)&v181 + 1) = &unk_1E6A0C898;
            *(void *)&long long v182 = v194;
            v70 = objc_msgSend(v69, "na_filter:", &v180);

            if (*(uint64_t *)(*(void *)&v194[8] + 24) >= 1)
            {
              v71 = [v63 enabledResidents];
              uint64_t v72 = [v71 count];
              BOOL v73 = v72 == *(void *)(*(void *)&v194[8] + 24);

              if (v73)
              {
                v93 = (void *)MEMORY[0x1D9452090]();
                id v94 = obja;
                HMFGetOSLogHandle();
                v95 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  id v96 = (id)objc_claimAutoreleasedReturnValue();
                  v97 = [v63 shortDescription];
                  *(_DWORD *)v188 = 138543618;
                  id v189 = v96;
                  __int16 v190 = 2114;
                  v191 = v97;
                  _os_log_impl(&dword_1D49D5000, v95, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ only has iPad as resident", v188, 0x16u);
                }
                uint64_t v87 = 0x2000;
LABEL_97:

                _Block_object_dispose(v194, 8);
LABEL_98:

                goto LABEL_99;
              }
            }
            if ((HMDHH2AutoMigrationHasSharedUserOrPendingInvitation(v63) | v170))
            {
              if (![v70 count])
              {
                unsigned __int8 HasSharedUserOrPendingInvitation = HMDHH2AutoMigrationHasSharedUserOrPendingInvitation(v63);
                v99 = (void *)MEMORY[0x1D9452090]();
                id v100 = obja;
                if ((HasSharedUserOrPendingInvitation | !v170))
                {
                  HMFGetOSLogHandle();
                  v101 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    id v102 = (id)objc_claimAutoreleasedReturnValue();
                    v103 = [v63 shortDescription];
                    *(_DWORD *)v188 = 138543618;
                    id v189 = v102;
                    __int16 v190 = 2114;
                    v191 = v103;
                    _os_log_impl(&dword_1D49D5000, v101, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have an eligible resident", v188, 0x16u);
                  }
                  uint64_t v87 = 64;
                }
                else
                {
                  HMFGetOSLogHandle();
                  v104 = (id)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    id v105 = (id)objc_claimAutoreleasedReturnValue();
                    v106 = [v63 shortDescription];
                    *(_DWORD *)v188 = 138543874;
                    id v189 = v105;
                    __int16 v190 = 2114;
                    v191 = v106;
                    __int16 v192 = 2114;
                    v193 = v167;
                    _os_log_impl(&dword_1D49D5000, v104, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have an eligible resident, recent user add/remove on %{public}@", v188, 0x20u);
                  }
                  uint64_t v87 = 0x4000;
                }
                goto LABEL_97;
              }
              v74 = [v63 appleMediaAccessories];
              *(void *)&long long v176 = MEMORY[0x1E4F143A8];
              *((void *)&v176 + 1) = 3221225472;
              *(void *)&long long v177 = __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke_101;
              *((void *)&v177 + 1) = &unk_1E6A18D10;
              id v75 = v70;
              *(void *)&long long v178 = v75;
              v76 = objc_msgSend(v74, "na_filter:", &v176);

              if (!v76 || objc_msgSend(v76, "hmf_isEmpty"))
              {
                v88 = (void *)MEMORY[0x1D9452090]();
                id v89 = obja;
                HMFGetOSLogHandle();
                v90 = (id)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  id v91 = (id)objc_claimAutoreleasedReturnValue();
                  __int16 v92 = [v63 shortDescription];
                  *(_DWORD *)v188 = 138543618;
                  id v189 = v91;
                  __int16 v190 = 2114;
                  v191 = v92;
                  _os_log_impl(&dword_1D49D5000, v90, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ doesn't have a resident that is also accessory", v188, 0x16u);
                }

                _Block_object_dispose(v194, 8);
                uint64_t v87 = 64;
                goto LABEL_98;
              }
            }
            else
            {
              v77 = (void *)MEMORY[0x1D9452090]();
              id v78 = obja;
              HMFGetOSLogHandle();
              v79 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v80 = (id)objc_claimAutoreleasedReturnValue();
                v81 = [v63 shortDescription];
                *(_DWORD *)v188 = 138543874;
                id v189 = v80;
                __int16 v190 = 2114;
                v191 = v81;
                __int16 v192 = 2114;
                v193 = v167;
                _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_INFO, "%{public}@Home %{public}@ last user change on %{public}@, ignoring resident requiremnt", v188, 0x20u);
              }
            }
            _Block_object_dispose(v194, 8);
          }
        }
        uint64_t v60 = [v173 countByEnumeratingWithState:&v184 objects:buf count:16];
        if (v60) {
          continue;
        }
        break;
      }
    }

    uint64_t v82 = (void *)MEMORY[0x1D9452090]();
    id v83 = obja;
    long long v84 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      long long v85 = HMFGetLogIdentifier();
      uint64_t v86 = [v173 count];
      *(_DWORD *)v194 = 138543618;
      *(void *)&v194[4] = v85;
      *(_WORD *)&v194[12] = 2050;
      *(void *)&v194[14] = v86;
      _os_log_impl(&dword_1D49D5000, v84, OS_LOG_TYPE_INFO, "%{public}@All homes (%{public}lu) have at least one eligible resident device or no recent user add/remove", v194, 0x16u);
    }
    uint64_t v87 = 0;
LABEL_99:

    if (v87 && (a2 & 1) == 0)
    {
      v107 = (void *)MEMORY[0x1D9452090]();
      id v108 = *(id *)(v171 + 32);
      v109 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        v110 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v110;
        _os_log_impl(&dword_1D49D5000, v109, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: not enough eligible residents exist for owned homes", buf, 0xCu);
      }
      *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24) |= v87;
    }
  }
  if ((a2 & 1) == 0)
  {
    id Property = *(id *)(v171 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v25, 24, 1);
    }
    if (([Property isHH2AutoMigrationEnabled] & 1) == 0)
    {
      v112 = (void *)MEMORY[0x1D9452090]();
      id v113 = *(id *)(v171 + 32);
      v114 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        v115 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v115;
        _os_log_impl(&dword_1D49D5000, v114, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: HH2 auto migration feature flag is not enabled", buf, 0xCu);
      }
      *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24) |= 0x80uLL;
    }
    v116 = *(void **)(v171 + 32);
    if (!v116) {
      goto LABEL_122;
    }
    v117 = [*(id *)(v171 + 32) homeManager];
    v118 = [v117 idsServerBag];

    if (!v118)
    {
      v121 = (void *)MEMORY[0x1D9452090]();
      id v122 = v116;
      v123 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      {
        v124 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v124;
        _os_log_impl(&dword_1D49D5000, v123, OS_LOG_TYPE_ERROR, "%{public}@Not ramp eligible because server bag is unavailable", buf, 0xCu);
      }
      goto LABEL_121;
    }
    if (-[HMDHH2AutoMigrationEligibilityChecker _hasAnySharedUser](v116))
    {
      v119 = [v118 hh2AutoMigrationWithSharedUserRampDivisor];
      unint64_t v120 = [v119 unsignedIntegerValue];

      [v118 hh2AutoMigrationWithSharedUserRampRemainder];
    }
    else
    {
      v125 = [v118 hh2AutoMigrationWithoutSharedUserRampDivisor];
      unint64_t v120 = [v125 unsignedIntegerValue];

      [v118 hh2AutoMigrationWithoutSharedUserRampRemainder];
    v126 = };
    unint64_t v127 = [v126 unsignedIntegerValue];

    if (v120 <= 0x63)
    {
      v121 = (void *)MEMORY[0x1D9452090]();
      id v129 = v116;
      v123 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        v130 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v130;
        __int16 v197 = 2050;
        unint64_t v198 = v120;
        __int16 v199 = 2050;
        uint64_t v200 = 100;
        _os_log_impl(&dword_1D49D5000, v123, OS_LOG_TYPE_INFO, "%{public}@Ramp dividier %{public}tu is less than the required minimum %{public}tu", buf, 0x20u);
      }
LABEL_121:

LABEL_122:
      v131 = (void *)MEMORY[0x1D9452090]();
      id v132 = *(id *)(v171 + 32);
      v133 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
      {
        v134 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v134;
        _os_log_impl(&dword_1D49D5000, v133, OS_LOG_TYPE_INFO, "%{public}@Current user is not eligible for auto migration: ramp roll out in effect", buf, 0xCu);
      }
      *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24) |= 0x1000uLL;
      goto LABEL_125;
    }
    v142 = objc_msgSend(objc_getProperty(v116, v128, 32, 1), "objectForKey:", @"rmigration-ercv");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v143 = v142;
    }
    else {
      v143 = 0;
    }
    id v144 = v143;

    if (!v144 || (v145 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v144]) == 0)
    {
      v145 = [MEMORY[0x1E4F29128] UUID];
      id v147 = objc_getProperty(v116, v146, 32, 1);
      v148 = [v145 UUIDString];
      [v147 setObject:v148 forKey:@"rmigration-ercv"];

      v149 = (void *)MEMORY[0x1D9452090]();
      id v150 = v116;
      v151 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v151, OS_LOG_TYPE_INFO))
      {
        v152 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v152;
        __int16 v197 = 2114;
        unint64_t v198 = (unint64_t)v145;
        _os_log_impl(&dword_1D49D5000, v151, OS_LOG_TYPE_INFO, "%{public}@Generated ramp candidate value: %{public}@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    v153 = objc_msgSend(v145, "hmf_bytesAsData");
    v154 = objc_msgSend(v153, "hm_generateSHA256");

    [v154 getBytes:buf length:8];
    unint64_t v155 = *(void *)buf;

    v156 = (void *)MEMORY[0x1D9452090]();
    id v157 = v116;
    v158 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      v159 = HMFGetLogIdentifier();
      v160 = HMFBooleanToString();
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v159;
      __int16 v197 = 2050;
      unint64_t v198 = v155;
      __int16 v199 = 2050;
      uint64_t v200 = v120;
      __int16 v201 = 2050;
      unint64_t v202 = v127;
      __int16 v203 = 2114;
      v204 = v160;
      _os_log_impl(&dword_1D49D5000, v158, OS_LOG_TYPE_INFO, "%{public}@HH2 auto migration ramp decision: dividend=%{public}tu, divisor=%{public}tu, remainder=%{public}tu, result=%{public}@", buf, 0x34u);
    }

    if (v155 % v120 >= v127) {
      goto LABEL_122;
    }
  }
LABEL_125:
  v135 = [HMDHH2AutoMigrationEligibilityResult alloc];
  uint64_t v136 = *(void *)(v171 + 56);
  uint64_t v137 = *(void *)(*(void *)(*(void *)(v171 + 48) + 8) + 24);
  uint64_t v138 = *(void *)(v171 + 64);
  uint64_t v139 = -[HMDHH2AutoMigrationEligibilityChecker numberOwnedNonEmptyHomes](*(void **)(v171 + 32));
  uint64_t v140 = -[HMDHH2AutoMigrationEligibilityChecker numberUnownedSharedHomes](*(void **)(v171 + 32));
  v141 = -[HMDHH2AutoMigrationEligibilityResult initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:](v135, "initWithStatus:iCloudAccountStatus:unsupportedDevices:hasOnlyEmptyHomes:numberOwnedNonEmptyHomes:numberUnownedSharedHomes:numberOwnedSharedHomes:", v137, v138, v136, a2, v139, v140, -[HMDHH2AutoMigrationEligibilityChecker numberOwnedSharedHomes](*(void **)(v171 + 32)));
  (*(void (**)(void))(*(void *)(v171 + 40) + 16))();
}

- (uint64_t)_hasAnySharedUser
{
  v1 = [a1 homeManager];
  id v2 = [v1 homes];
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_107_65564);

  return v3;
}

uint64_t __58__HMDHH2AutoMigrationEligibilityChecker__hasAnySharedUser__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 users];
  uint64_t v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_218_65567);

  return v3;
}

BOOL __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 device];
  id v4 = [v3 productInfo];
  uint64_t v5 = [v4 productClass];

  if (v5 == 3) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return v5 != 3;
}

uint64_t __74__HMDHH2AutoMigrationEligibilityChecker_allHomesHaveHH2SupportedResidents__block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 device];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "device", (void)v11);
        char v9 = [v3 isEqual:v8];

        if (v9)
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (uint64_t)_unsupportedDevicesWithCurrentDeviceAtLeastVersion:(void *)a3 residentDevicesAtLeastVersion:(void *)a4 otherDevicesAtLeastVersion:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v40 = a2;
  id v37 = a3;
  id v38 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v8 = objc_msgSend(objc_getProperty(a1, v7, 16, 1), "account");
  char v9 = [v8 devices];

  obuint64_t j = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v42;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if (![v15 isCurrentDevice])
        {
          char v22 = [v15 productInfo];
          if ([v22 productClass] != 3
            && ([v22 productPlatform] == 4
             || ([v15 capabilities],
                 uint64_t v31 = objc_claimAutoreleasedReturnValue(),
                 int v32 = [v31 isResidentCapable],
                 v31,
                 v32)))
          {
            id v33 = [v15 derivedVersion];
            char v34 = [v33 isAtLeastVersion:v37];

            if ((v34 & 1) == 0)
            {
              uint64_t v25 = (void *)MEMORY[0x1D9452090]();
              id v35 = a1;
              id v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                long long v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v46 = v28;
                __int16 v47 = 2114;
                id v48 = v37;
                __int16 v49 = 2114;
                double v50 = v15;
                long long v29 = v27;
                uint64_t v30 = "%{public}@Resident device on current user's account does not meet required version %{public}@ for "
                      "HH2 auto migration: %{public}@";
LABEL_20:
                _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, v30, buf, 0x20u);
              }
              goto LABEL_21;
            }
          }
          else
          {
            long long v23 = [v15 derivedVersion];
            char v24 = [v23 isAtLeastVersion:v38];

            if ((v24 & 1) == 0)
            {
              uint64_t v25 = (void *)MEMORY[0x1D9452090]();
              id v26 = a1;
              id v27 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                long long v28 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v46 = v28;
                __int16 v47 = 2114;
                id v48 = v38;
                __int16 v49 = 2114;
                double v50 = v15;
                long long v29 = v27;
                uint64_t v30 = "%{public}@Controller device on current user's account does not meet required version %{public}@ fo"
                      "r HH2 auto migration: %{public}@";
                goto LABEL_20;
              }
LABEL_21:

              v12 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](a1, v15);
            }
          }

          continue;
        }
        uint64_t v16 = [v15 derivedVersion];
        char v17 = [v16 isAtLeastVersion:v40];

        if ((v17 & 1) == 0)
        {
          uint64_t v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = a1;
          char v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            int v21 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v46 = v21;
            __int16 v47 = 2114;
            id v48 = v40;
            __int16 v49 = 2114;
            double v50 = v15;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Current device on current user's account does not meet required version %{public}@ for HH2 auto migration: %{public}@", buf, 0x20u);
          }
          v12 |= -[HMDHH2AutoMigrationEligibilityChecker _unsupportedDeviceTypeFromDevice:](v19, v15);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (!v11) {
        goto LABEL_27;
      }
    }
  }
  uint64_t v12 = 0;
LABEL_27:

  return v12;
}

- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3 accountManager:(id)a4 featuresDataSource:(id)a5 userDefaults:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v11)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    uint64_t v20 = _HMFPreconditionFailure();
    return (HMDHH2AutoMigrationEligibilityChecker *)__108__HMDHH2AutoMigrationEligibilityChecker_initWithHomeManager_accountManager_featuresDataSource_userDefaults___block_invoke_2(v20);
  }
  long long v14 = v13;
  v21.receiver = self;
  v21.super_class = (Class)HMDHH2AutoMigrationEligibilityChecker;
  uint64_t v15 = [(HMDHH2AutoMigrationEligibilityChecker *)&v21 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_homeManager, v10);
    objc_storeStrong((id *)&v16->_accountManager, a4);
    objc_storeStrong((id *)&v16->_featuresDataSource, a5);
    objc_storeStrong((id *)&v16->_userDefaults, a6);
    id isHSA2Enabled = v16->_isHSA2Enabled;
    v16->_id isHSA2Enabled = &__block_literal_global_65596;

    id frameworkSwitchProvider = v16->_frameworkSwitchProvider;
    v16->_id frameworkSwitchProvider = &__block_literal_global_93;
  }
  return v16;
}

HMDHH2FrameworkSwitch *__108__HMDHH2AutoMigrationEligibilityChecker_initWithHomeManager_accountManager_featuresDataSource_userDefaults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[HMDHH2FrameworkSwitch alloc] initWithAutoSwitchDisabledWithHomeManager:v2];

  return v3;
}

BOOL __108__HMDHH2AutoMigrationEligibilityChecker_initWithHomeManager_accountManager_featuresDataSource_userDefaults___block_invoke()
{
  return +[HMDRemoteLoginUtilities isTwoFactorAuthenticationEnabledForAccount];
}

- (HMDHH2AutoMigrationEligibilityChecker)initWithHomeManager:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[HMDAppleAccountManager sharedManager];
  uint64_t v6 = objc_alloc_init(HMDFeaturesDataSource);
  SEL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v8 = [(HMDHH2AutoMigrationEligibilityChecker *)self initWithHomeManager:v4 accountManager:v5 featuresDataSource:v6 userDefaults:v7];

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t47_65611 != -1) {
    dispatch_once(&logCategory__hmf_once_t47_65611, &__block_literal_global_110);
  }
  id v2 = (void *)logCategory__hmf_once_v48_65612;
  return v2;
}

uint64_t __52__HMDHH2AutoMigrationEligibilityChecker_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v48_65612;
  logCategory__hmf_once_v48_65612 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end