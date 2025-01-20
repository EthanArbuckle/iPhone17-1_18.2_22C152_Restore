@interface HMDBulletinBoardNotificationServiceGroup
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_isAlarmService:(id)a3;
- (BOOL)_isDefaultRoom:(id)a3 ofHome:(id)a4;
- (BOOL)_isNotificationGeneratingService:(id)a3;
- (BOOL)_isSupportedAssociationService:(id)a3;
- (HMDBulletinBoardNotification)bulletinBoardNotification;
- (HMDBulletinBoardNotificationServiceGroup)initWithBulletinBoardNotification:(id)a3;
- (HMDBulletinBoardNotificationServiceGroup)initWithCoder:(id)a3;
- (NSArray)associatedServices;
- (NSArray)cameraProfiles;
- (NSHashTable)associatedServicesTable;
- (NSHashTable)cameraProfilesTable;
- (NSSet)associatedServiceUUIDs;
- (NSSet)cameraProfileUUIDs;
- (OS_dispatch_queue)workQueue;
- (id)_accessoriesInRoom:(id)a3 ofHome:(id)a4;
- (id)_cameraNotificationGeneratingServicesForAccessory:(id)a3;
- (id)_cameraProfileWithID:(id)a3;
- (id)_prepareServiceGroupPayload;
- (id)actionContextForCameraProfileID:(id)a3;
- (id)dumpState;
- (id)logIdentifier;
- (void)_configureServices;
- (void)_handleBulletinBoardNotificationServiceGroupRequest:(id)a3;
- (void)_updateAssociatedServices:(id)a3 associatedCameras:(id)a4;
- (void)_updateAssociatedServicesTable:(id)a3;
- (void)configureBulletinNotification;
- (void)configureWithWorkQueue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedServiceUUIDs:(id)a3;
- (void)setAssociatedServices:(id)a3;
- (void)setAssociatedServicesTable:(id)a3;
- (void)setBulletinBoardNotification:(id)a3;
- (void)setCameraProfileUUIDs:(id)a3;
- (void)setCameraProfiles:(id)a3;
- (void)setCameraProfilesTable:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HMDBulletinBoardNotificationServiceGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cameraProfiles, 0);
  objc_storeStrong((id *)&self->_associatedServices, 0);
  objc_destroyWeak((id *)&self->_bulletinBoardNotification);
  objc_storeStrong((id *)&self->_associatedServicesTable, 0);
  objc_storeStrong((id *)&self->_cameraProfilesTable, 0);
  objc_storeStrong((id *)&self->_associatedServiceUUIDs, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUIDs, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCameraProfiles:(id)a3
{
}

- (void)setAssociatedServices:(id)a3
{
}

- (void)setBulletinBoardNotification:(id)a3
{
}

- (HMDBulletinBoardNotification)bulletinBoardNotification
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bulletinBoardNotification);
  return (HMDBulletinBoardNotification *)WeakRetained;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotificationServiceGroup *)self bulletinBoardNotification];
  [v4 encodeConditionalObject:v5 forKey:@"HM.BulletinBoardNotification"];

  v6 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfileUUIDs];
  v7 = [v6 allObjects];
  [v4 encodeObject:v7 forKey:@"HM.BulletinBoardNotificationCameraProfiles"];

  id v9 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServiceUUIDs];
  v8 = [v9 allObjects];
  [v4 encodeObject:v8 forKey:@"HM.BulletinBoardNotificationServices"];
}

- (HMDBulletinBoardNotificationServiceGroup)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.BulletinBoardNotification"];
  if (v5)
  {
    v6 = [(HMDBulletinBoardNotificationServiceGroup *)self initWithBulletinBoardNotification:v5];
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      id v9 = [v7 setWithArray:v8];
      v10 = [v4 decodeObjectOfClasses:v9 forKey:@"HM.BulletinBoardNotificationCameraProfiles"];

      uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
      cameraProfileUUIDs = v6->_cameraProfileUUIDs;
      v6->_cameraProfileUUIDs = (NSSet *)v11;

      v13 = (void *)MEMORY[0x1E4F1CAD0];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v15 = objc_msgSend(v13, "setWithArray:", v14, v25[0]);
      v16 = [v4 decodeObjectOfClasses:v15 forKey:@"HM.BulletinBoardNotificationServices"];

      uint64_t v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
      associatedServiceUUIDs = v6->_associatedServiceUUIDs;
      v6->_associatedServiceUUIDs = (NSSet *)v17;
    }
    v19 = v6;
    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v28 = v23;
      __int16 v29 = 2112;
      uint64_t v30 = 0;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded bulletinBoardNotification: %@", buf, 0x16u);
    }
    v20 = 0;
  }

  return v20;
}

- (id)logIdentifier
{
  v2 = [(HMDBulletinBoardNotificationServiceGroup *)self bulletinBoardNotification];
  v3 = [v2 logIdentifier];

  return v3;
}

- (id)actionContextForCameraProfileID:(id)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotificationServiceGroup *)self _cameraProfileWithID:v4];
  if (v5)
  {
    v6 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServices];
    v7 = objc_opt_new();
    unint64_t v8 = 0x1E4F1C000uLL;
    if (![v5 isMicrophonePresent]) {
      goto LABEL_4;
    }
    id v9 = [(HMDBulletinBoardNotificationServiceGroup *)self bulletinBoardNotification];
    v10 = [v9 service];
    uint64_t v11 = [v10 type];
    char v12 = [v11 isEqualToString:*MEMORY[0x1E4F5BB10]];

    if ((v12 & 1) == 0)
    {
      uint64_t v18 = HMDLocalizedStringForKey(@"BULLETIN_MICROPHONE_ACTION");
      v19 = @"microphone_toggleButton";
      v99[0] = @"itemType";
      v99[1] = @"identifier";
      v100[0] = @"MICROPHONE";
      v100[1] = @"microphone_toggleButton";
      v79 = @"microphone_toggleButton";
      v80 = (void *)v18;
      v99[2] = @"title";
      v100[2] = v18;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:3];
      [v7 addObject:v20];
    }
    else
    {
LABEL_4:
      v79 = 0;
      v80 = 0;
    }
    v21 = objc_opt_new();
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke;
    v91[3] = &unk_1E6A065E8;
    id v22 = v21;
    id v92 = v22;
    v81 = v6;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v91);
    uint64_t v23 = *MEMORY[0x1E4F5BAB0];
    v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F5BAB0]];
    v74 = v5;
    id v82 = v4;
    v83 = v7;
    v84 = v22;
    if ([v24 count])
    {
      v25 = [v5 accessory];
      v26 = [v25 home];
      v27 = [MEMORY[0x1E4F1C9C8] date];
      id v28 = v26;
      id v29 = v27;
      uint64_t v30 = v29;
      if (v28)
      {
        uint64_t v31 = v29;
        if (!v29)
        {
          uint64_t v31 = [MEMORY[0x1E4F1C9C8] date];
        }
        v32 = [v28 homeLocationHandler];
        v33 = [v32 location];

        v34 = +[HMDLocation sunriseTimeForLocation:v33];
        v35 = +[HMDLocation sunsetTimeForLocation:v33];
        [v31 timeIntervalSince1970];
        double v37 = v36;
        [v35 timeIntervalSince1970];
        double v39 = v38;
        [v34 timeIntervalSince1970];
        if (v39 <= v40) {
          BOOL v41 = v37 >= v40 || v37 <= v39;
        }
        else {
          BOOL v41 = v37 < v39 && v37 > v40;
        }

        v7 = v83;
        id v22 = v84;
        if (v41)
        {
          v77 = 0;
          v78 = 0;
          v75 = 0;
          v76 = 0;
          unint64_t v8 = 0x1E4F1C000;
LABEL_26:
          id v46 = objc_alloc_init(NSString);
          uint64_t v47 = *MEMORY[0x1E4F5BAD0];
          v48 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F5BAD0]];
          uint64_t v49 = [v48 count];

          uint64_t v50 = *MEMORY[0x1E4F5BAB8];
          v51 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F5BAB8]];
          uint64_t v52 = [v51 count];

          if (!v52 && !v49)
          {
            id v53 = 0;
            id v54 = 0;
            v5 = v74;
            v55 = v83;
            unint64_t v56 = v8;
LABEL_45:
            v68 = HMDLocalizedStringForKey(@"BULLETIN_DISMISS_ACTION_TITLE");
            v69 = [MEMORY[0x1E4F445D8] actionWithIdentifier:@"DISMISS" title:v68 options:0];
            v93[0] = @"categoryID";
            v93[1] = @"bulletinActionButtonDescription";
            v94[0] = @"HomeAppBulletinCategory";
            v94[1] = v55;
            v93[2] = *MEMORY[0x1E4F2CA78];
            v70 = [v5 contextSPIUniqueIdentifier];
            [v70 UUIDString];
            v72 = v71 = v55;
            v93[3] = @"dismissButton";
            v94[2] = v72;
            v94[3] = v69;
            uint64_t v17 = [*(id *)(v56 + 2536) dictionaryWithObjects:v94 forKeys:v93 count:4];

            id v4 = v82;
            goto LABEL_46;
          }
          v57 = [MEMORY[0x1E4F1CA48] array];
          v58 = [v84 objectForKeyedSubscript:v47];
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_3;
          v87[3] = &unk_1E6A06610;
          id v59 = v57;
          id v88 = v59;
          objc_msgSend(v58, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v87);
          v60 = [v84 objectForKeyedSubscript:v50];
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_4;
          v85[3] = &unk_1E6A06610;
          id v54 = v59;
          id v86 = v54;
          objc_msgSend(v60, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v85);
          id v53 = (id)*MEMORY[0x1E4F5BA38];
          if (v52 && v49)
          {
            uint64_t v61 = [v60 count];
            v62 = @"BULLETIN_ALARM_AND_UNLOCK_ACTION_TITLE";
          }
          else
          {
            if (v52) {
              BOOL v63 = v49 != 0;
            }
            else {
              BOOL v63 = 1;
            }
            if (v63)
            {
              if (v49) {
                BOOL v64 = v52 != 0;
              }
              else {
                BOOL v64 = 1;
              }
              v55 = v83;
              unint64_t v65 = 0x1E4F1C000;
              if (v64)
              {
                v5 = v74;
LABEL_44:
                v95[0] = @"itemType";
                v95[1] = @"identifier";
                v96[0] = @"SERVICE";
                v96[1] = v53;
                v95[2] = @"title";
                v95[3] = @"services.uuid";
                v96[2] = v46;
                v96[3] = v54;
                v67 = [*(id *)(v65 + 2536) dictionaryWithObjects:v96 forKeys:v95 count:4];
                [v55 addObject:v67];

                unint64_t v56 = v65;
                goto LABEL_45;
              }
              uint64_t v66 = HMDLocalizedStringForKey(@"BULLETIN_DISARM_SECURITY_ACTION_TITLE");

              id v46 = v53;
              id v53 = (id)*MEMORY[0x1E4F5BA40];
              v5 = v74;
LABEL_43:

              id v46 = (id)v66;
              goto LABEL_44;
            }
            uint64_t v61 = [v60 count];
            v62 = @"BULLETIN_UNLOCK_ACTION_TITLE";
          }
          uint64_t v66 = HMDLocalizedStringForKeyWithCount(v62, v61);
          v5 = v74;
          v55 = v83;
          unint64_t v65 = 0x1E4F1C000uLL;
          goto LABEL_43;
        }
      }
      else
      {
      }
      v24 = [v22 objectForKeyedSubscript:v23];
      v42 = [MEMORY[0x1E4F1CA48] array];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_2;
      v89[3] = &unk_1E6A06610;
      id v43 = v42;
      id v90 = v43;
      objc_msgSend(v24, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v89);
      id v44 = (id)*MEMORY[0x1E4F5BA30];
      uint64_t v45 = HMDLocalizedStringForKeyWithCount(@"BULLETIN_LIGHTS_ACTION_TITLE", [v43 count]);
      v97[0] = @"itemType";
      v97[1] = @"identifier";
      v98[0] = @"SERVICE";
      v98[1] = v44;
      v77 = (void *)v45;
      v78 = v44;
      v97[2] = @"title";
      v97[3] = @"services.uuid";
      v98[2] = v45;
      v98[3] = v43;
      v76 = v43;
      unint64_t v8 = 0x1E4F1C000uLL;
      v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:4];
      objc_msgSend(v7, "addObject:");
    }
    else
    {
      v77 = 0;
      v78 = 0;
      v75 = 0;
      v76 = 0;
    }

    goto LABEL_26;
  }
  v13 = (void *)MEMORY[0x1D9452090]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v102 = v16;
    __int16 v103 = 2112;
    id v104 = v4;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Could not find the camera profile with unique id %@, not providing any context", buf, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_46:

  return v17;
}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v9 = v3;
  v5 = [v3 serviceType];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v6 = [MEMORY[0x1E4F1CA80] set];
    v7 = *(void **)(a1 + 32);
    unint64_t v8 = [v9 serviceType];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  [v6 addObject:v9];
}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 contextSPIUniqueIdentifier];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 contextSPIUniqueIdentifier];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

void __76__HMDBulletinBoardNotificationServiceGroup_actionContextForCameraProfileID___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 contextSPIUniqueIdentifier];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

- (id)_cameraProfileWithID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfiles];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__HMDBulletinBoardNotificationServiceGroup__cameraProfileWithID___block_invoke;
  v14[3] = &unk_1E6A065C0;
  id v6 = v4;
  id v15 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v14];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find the camera profile with unique id %@", buf, 0x16u);
    }
    char v12 = 0;
  }
  else
  {
    char v12 = [v5 objectAtIndex:v7];
  }

  return v12;
}

uint64_t __65__HMDBulletinBoardNotificationServiceGroup__cameraProfileWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)dumpState
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) description];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F64DA8]];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v12 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfiles];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) description];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F64D98]];
  return v3;
}

- (NSArray)cameraProfiles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSHashTable *)self->_cameraProfilesTable allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)associatedServices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSHashTable *)self->_associatedServicesTable allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setAssociatedServicesTable:(id)a3
{
  uint64_t v4 = (NSHashTable *)a3;
  os_unfair_lock_lock_with_options();
  associatedServicesTable = self->_associatedServicesTable;
  self->_associatedServicesTable = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSHashTable)associatedServicesTable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_associatedServicesTable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCameraProfilesTable:(id)a3
{
  uint64_t v4 = (NSHashTable *)a3;
  os_unfair_lock_lock_with_options();
  cameraProfilesTable = self->_cameraProfilesTable;
  self->_cameraProfilesTable = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSHashTable)cameraProfilesTable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_cameraProfilesTable;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAssociatedServiceUUIDs:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSSet *)[v6 copy];
  associatedServiceUUIDs = self->_associatedServiceUUIDs;
  self->_associatedServiceUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)associatedServiceUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_associatedServiceUUIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCameraProfileUUIDs:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSSet *)[v6 copy];
  cameraProfileUUIDs = self->_cameraProfileUUIDs;
  self->_cameraProfileUUIDs = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSSet)cameraProfileUUIDs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_cameraProfileUUIDs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_prepareServiceGroupPayload
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfileUUIDs];
  uint64_t v4 = [v3 allObjects];

  v5 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServiceUUIDs];
  id v6 = [v5 allObjects];

  v9[0] = @"HM.BulletinBoardNotificationCameraProfiles";
  v9[1] = @"HM.BulletinBoardNotificationServices";
  v10[0] = v4;
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)_updateAssociatedServicesTable:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(v4, "allValues", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(HMDBulletinBoardNotificationServiceGroup *)self setAssociatedServicesTable:v5];
}

- (void)_updateAssociatedServices:(id)a3 associatedCameras:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v49 = v7;
  uint64_t v9 = [v7 allKeys];
  uint64_t v10 = [v8 setWithArray:v9];

  long long v11 = (void *)MEMORY[0x1E4F1CAD0];
  long long v12 = [v6 allKeys];
  long long v13 = [v11 setWithArray:v12];

  long long v14 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServiceUUIDs];
  char v15 = HMFEqualObjects();

  id v47 = v6;
  if (v15)
  {
    uint64_t v16 = [(HMDBulletinBoardNotificationServiceGroup *)self associatedServicesTable];
    uint64_t v17 = [v16 count];

    if (v17) {
      goto LABEL_8;
    }
    __int16 v18 = self;
  }
  else
  {
    long long v19 = (void *)MEMORY[0x1D9452090]([(HMDBulletinBoardNotificationServiceGroup *)self setAssociatedServiceUUIDs:v13]);
    long long v20 = self;
    long long v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v56 = v22;
      __int16 v57 = 2112;
      v58 = v13;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating associated services with %@", buf, 0x16u);

      id v6 = v47;
    }

    __int16 v18 = v20;
  }
  -[HMDBulletinBoardNotificationServiceGroup _updateAssociatedServicesTable:](v18, "_updateAssociatedServicesTable:", v6, v47);
LABEL_8:
  long long v23 = objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v47);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v24 = [v49 allValues];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v51 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = [*(id *)(*((void *)&v50 + 1) + 8 * i) cameraProfile];
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v26);
  }

  uint64_t v30 = [(HMDBulletinBoardNotificationServiceGroup *)self bulletinBoardNotification];
  uint64_t v31 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfileUUIDs];
  char v32 = HMFEqualObjects();

  if ((v32 & 1) == 0)
  {
    double v40 = (void *)MEMORY[0x1D9452090]();
    BOOL v41 = self;
    v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      unint64_t v56 = v43;
      __int16 v57 = 2112;
      v58 = v10;
      _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Updating associated cameras with %@", buf, 0x16u);
    }
    [(HMDBulletinBoardNotificationServiceGroup *)v41 setCameraProfileUUIDs:v10];
    [(HMDBulletinBoardNotificationServiceGroup *)v41 setCameraProfilesTable:v23];
    [v30 registerForCharacteristicNotifications];
    goto LABEL_25;
  }
  v33 = [(HMDBulletinBoardNotificationServiceGroup *)self cameraProfilesTable];
  char v34 = HMFEqualObjects();

  if ((v34 & 1) == 0) {
    uint64_t v35 = [(HMDBulletinBoardNotificationServiceGroup *)self setCameraProfilesTable:v23];
  }
  if ((v15 & 1) == 0)
  {
LABEL_25:
    id v44 = [v30 service];
    uint64_t v45 = [v44 accessory];
    id v46 = [v45 home];

    [v46 saveWithReason:@"HMDBulletinBoardNotificationServiceGroupUpdatedSaveReason" postSyncNotification:0];
    goto LABEL_26;
  }
  double v36 = (void *)MEMORY[0x1D9452090](v35);
  double v37 = self;
  double v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    double v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    unint64_t v56 = v39;
    _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No change in service and camera associations", buf, 0xCu);
  }
LABEL_26:
}

- (void)_configureServices
{
  v111[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HMDBulletinBoardNotificationServiceGroup *)self bulletinBoardNotification];
  id v3 = [v2 service];

  id v4 = [v3 accessory];
  v5 = [v4 room];

  if (v5)
  {
    v71 = [v5 home];
    if (v71)
    {
      v70 = [v3 accessory];
      if (v70)
      {
        id v72 = [v71 accessories];
        v68 = v5;
        v69 = v3;
        if ([(HMDBulletinBoardNotificationServiceGroup *)self _isDefaultRoom:v5 ofHome:v71])
        {
          id v6 = v70;
          v111[0] = v70;
          id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:1];
        }
        else
        {
          id v7 = [(HMDBulletinBoardNotificationServiceGroup *)self _accessoriesInRoom:v5 ofHome:v71];
          id v6 = v70;
        }
        long long v23 = [MEMORY[0x1E4F1CA60] dictionary];
        v67 = [(HMDBulletinBoardNotificationServiceGroup *)self _cameraNotificationGeneratingServicesForAccessory:v6];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        obuint64_t j = v7;
        v83 = v23;
        uint64_t v77 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
        if (v77)
        {
          uint64_t v75 = *(void *)v98;
          do
          {
            for (uint64_t i = 0; i != v77; ++i)
            {
              if (*(void *)v98 != v75) {
                objc_enumerationMutation(obj);
              }
              id v25 = *(id *)(*((void *)&v97 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v26 = v25;
              }
              else {
                uint64_t v26 = 0;
              }
              id v27 = v26;

              if (v27)
              {
                id v79 = v27;
                uint64_t v81 = i;
                long long v95 = 0u;
                long long v96 = 0u;
                long long v93 = 0u;
                long long v94 = 0u;
                id v28 = [v27 services];
                uint64_t v29 = [v28 countByEnumeratingWithState:&v93 objects:v109 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v94;
                  do
                  {
                    for (uint64_t j = 0; j != v30; ++j)
                    {
                      if (*(void *)v94 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      v33 = *(void **)(*((void *)&v93 + 1) + 8 * j);
                      if ([(HMDBulletinBoardNotificationServiceGroup *)self _isSupportedAssociationService:v33])
                      {
                        char v34 = (void *)MEMORY[0x1D9452090]();
                        uint64_t v35 = self;
                        double v36 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                        {
                          double v37 = HMFGetLogIdentifier();
                          double v38 = [v33 serviceType];
                          *(_DWORD *)buf = 138543874;
                          id v104 = v37;
                          __int16 v105 = 2112;
                          v106 = v33;
                          __int16 v107 = 2112;
                          v108 = v38;
                          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Service %@ with type %@ is a supported service for association", buf, 0x20u);

                          long long v23 = v83;
                        }

                        double v39 = [v33 serviceIdentifier];
                        [v23 setObject:v33 forKeyedSubscript:v39];
                      }
                    }
                    uint64_t v30 = [v28 countByEnumeratingWithState:&v93 objects:v109 count:16];
                  }
                  while (v30);
                }

                id v27 = v79;
                uint64_t i = v81;
              }
            }
            uint64_t v77 = [obj countByEnumeratingWithState:&v97 objects:v110 count:16];
          }
          while (v77);
        }

        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id v73 = v72;
        uint64_t v78 = [v73 countByEnumeratingWithState:&v89 objects:v102 count:16];
        if (v78)
        {
          uint64_t v76 = *(void *)v90;
          do
          {
            for (uint64_t k = 0; k != v78; ++k)
            {
              if (*(void *)v90 != v76) {
                objc_enumerationMutation(v73);
              }
              id v41 = *(id *)(*((void *)&v89 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v42 = v41;
              }
              else {
                v42 = 0;
              }
              id v43 = v42;

              if (v43)
              {
                id v80 = v43;
                uint64_t v82 = k;
                long long v87 = 0u;
                long long v88 = 0u;
                long long v85 = 0u;
                long long v86 = 0u;
                id v44 = [v43 services];
                uint64_t v45 = [v44 countByEnumeratingWithState:&v85 objects:v101 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v86;
                  do
                  {
                    for (uint64_t m = 0; m != v46; ++m)
                    {
                      if (*(void *)v86 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      id v49 = *(void **)(*((void *)&v85 + 1) + 8 * m);
                      if ([(HMDBulletinBoardNotificationServiceGroup *)self _isAlarmService:v49])
                      {
                        long long v50 = (void *)MEMORY[0x1D9452090]();
                        long long v51 = self;
                        long long v52 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                        {
                          long long v53 = HMFGetLogIdentifier();
                          id v54 = [v49 serviceType];
                          *(_DWORD *)buf = 138543874;
                          id v104 = v53;
                          __int16 v105 = 2112;
                          v106 = v49;
                          __int16 v107 = 2112;
                          v108 = v54;
                          _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_DEBUG, "%{public}@Service %@ with type %@ contains an alarm system, adding it to association", buf, 0x20u);

                          long long v23 = v83;
                        }

                        v55 = [v49 serviceIdentifier];
                        [v23 setObject:v49 forKeyedSubscript:v55];
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v85 objects:v101 count:16];
                  }
                  while (v46);
                }

                id v43 = v80;
                uint64_t k = v82;
              }
            }
            uint64_t v78 = [v73 countByEnumeratingWithState:&v89 objects:v102 count:16];
          }
          while (v78);
        }

        unint64_t v56 = (void *)MEMORY[0x1D9452090]();
        __int16 v57 = self;
        v58 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v59 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v104 = v59;
          __int16 v105 = 2112;
          v106 = v67;
          _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_DEBUG, "%{public}@Camera Notification Services %@", buf, 0x16u);
        }
        if ([v67 count])
        {
          v60 = v57;
          uint64_t v61 = v23;
          v62 = v67;
        }
        else
        {
          BOOL v63 = (void *)MEMORY[0x1D9452090]();
          BOOL v64 = v57;
          unint64_t v65 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            uint64_t v66 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            id v104 = v66;
            _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_INFO, "%{public}@There are no cameras, no association of services", buf, 0xCu);
          }
          uint64_t v61 = (void *)MEMORY[0x1E4F1CC08];
          v60 = v64;
          v62 = (void *)MEMORY[0x1E4F1CC08];
        }
        [(HMDBulletinBoardNotificationServiceGroup *)v60 _updateAssociatedServices:v61 associatedCameras:v62];

        uint64_t v8 = v68;
        uint64_t v9 = v69;
      }
      else
      {
        uint64_t v8 = v5;
        uint64_t v9 = v3;
        long long v19 = (void *)MEMORY[0x1D9452090]();
        long long v20 = self;
        long long v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          long long v22 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v104 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@No accessory, bailing out", buf, 0xCu);
        }
      }
      __int16 v18 = v71;
    }
    else
    {
      uint64_t v8 = v5;
      uint64_t v9 = v3;
      long long v14 = (void *)MEMORY[0x1D9452090]();
      char v15 = self;
      uint64_t v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v104 = v17;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@No home, bailing out", buf, 0xCu);
      }
      __int16 v18 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = v3;
    uint64_t v10 = (void *)MEMORY[0x1D9452090]();
    long long v11 = self;
    long long v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v104 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@No room, bailing out", buf, 0xCu);
    }
  }
}

- (id)_cameraNotificationGeneratingServicesForAccessory:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    [v8 cameraProfiles];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v29)
    {
      id v25 = v6;
      uint64_t v9 = 0;
      uint64_t v27 = *(void *)v35;
      id v28 = v5;
      do
      {
        uint64_t v10 = 0;
        long long v11 = v9;
        do
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(obj);
          }
          long long v12 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
          uint64_t v9 = [[HMDBulletinBoardCameraNotificationAssociation alloc] initWithCameraProfile:v12];

          long long v13 = [v12 uniqueIdentifier];
          long long v14 = [v13 UUIDString];
          [v5 setObject:v9 forKeyedSubscript:v14];

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v15 = v8;
          uint64_t v16 = [v8 services];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v31 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                if ([(HMDBulletinBoardNotificationServiceGroup *)self _isNotificationGeneratingService:v21])
                {
                  long long v22 = [(HMDBulletinBoardCameraNotificationAssociation *)v9 notificationGeneratingServicesWithCamera];
                  [v22 addObject:v21];
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v18);
          }

          ++v10;
          long long v11 = v9;
          v5 = v28;
          id v8 = v15;
        }
        while (v10 != v29);
        uint64_t v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v29);

      id v6 = v25;
    }
    id v23 = (id)[v5 copy];
  }
  else
  {
    id v23 = v5;
  }

  return v23;
}

- (id)_accessoriesInRoom:(id)a3 ofHome:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1CA48] array];
  v20 = uint64_t v19 = v6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v6 accessories];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = [v12 room];
        long long v14 = [v13 uuid];
        id v15 = [v5 uuid];
        int v16 = [v14 isEqual:v15];

        if (v16) {
          [v20 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  uint64_t v17 = (void *)[v20 copy];
  return v17;
}

- (BOOL)_isDefaultRoom:(id)a3 ofHome:(id)a4
{
  id v5 = a4;
  id v6 = [a3 uuid];
  id v7 = [v5 roomForEntireHome];

  uint64_t v8 = [v7 uuid];
  char v9 = [v6 isEqual:v8];

  return v9;
}

- (void)configureBulletinNotification
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDBulletinBoardNotificationServiceGroup *)self workQueue];

  if (v3)
  {
    id v4 = [(HMDBulletinBoardNotificationServiceGroup *)self workQueue];
    dispatch_assert_queue_V2(v4);

    [(HMDBulletinBoardNotificationServiceGroup *)self _configureServices];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@configureBulletinNotification called before configure", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)_isNotificationGeneratingService:(id)a3
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5BB10];
  v9[0] = *MEMORY[0x1E4F5BA78];
  v9[1] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v9 count:2];
  id v7 = [v5 serviceType];

  LOBYTE(v4) = [v6 containsObject:v7];
  return (char)v4;
}

- (BOOL)_isAlarmService:(id)a3
{
  uint64_t v3 = [a3 findCharacteristicWithType:*MEMORY[0x1E4F5B8F8]];

  return v3 != 0;
}

- (BOOL)_isSupportedAssociationService:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F5BA70];
  v10[0] = *MEMORY[0x1E4F5BAB0];
  v10[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F5BAB8];
  v10[2] = *MEMORY[0x1E4F5BA90];
  void v10[3] = v4;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  id v7 = [v5 arrayWithObjects:v10 count:4];
  uint64_t v8 = [v6 serviceType];

  LOBYTE(v5) = [v7 containsObject:v8];
  return (char)v5;
}

- (void)_handleBulletinBoardNotificationServiceGroupRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 responseHandler];

  if (v5)
  {
    id v6 = [(HMDBulletinBoardNotificationServiceGroup *)self _prepareServiceGroupPayload];
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      long long v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Responding to a request for notification service group with payload %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v11 = [v4 responseHandler];
    ((void (**)(void, void, void *))v11)[2](v11, 0, v6);
  }
}

- (void)configureWithWorkQueue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    [(HMDBulletinBoardNotificationServiceGroup *)self setWorkQueue:v4];
  }
  else
  {
    id v5 = (HMDBulletinBoardNotificationServiceGroup *)_HMFPreconditionFailure();
    [(HMDBulletinBoardNotificationServiceGroup *)v5 initWithBulletinBoardNotification:v7];
  }
}

- (HMDBulletinBoardNotificationServiceGroup)initWithBulletinBoardNotification:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMDBulletinBoardNotificationServiceGroup;
  id v5 = [(HMDBulletinBoardNotificationServiceGroup *)&v16 init];
  SEL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_bulletinBoardNotification, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CAD0] set];
    cameraProfileUUIDs = v6->_cameraProfileUUIDs;
    v6->_cameraProfileUUIDs = (NSSet *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
    associatedServiceUUIDs = v6->_associatedServiceUUIDs;
    v6->_associatedServiceUUIDs = (NSSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    cameraProfilesTable = v6->_cameraProfilesTable;
    v6->_cameraProfilesTable = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    associatedServicesTable = v6->_associatedServicesTable;
    v6->_associatedServicesTable = (NSHashTable *)v13;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t27_9457 != -1) {
    dispatch_once(&logCategory__hmf_once_t27_9457, &__block_literal_global_9458);
  }
  v2 = (void *)logCategory__hmf_once_v28_9459;
  return v2;
}

uint64_t __55__HMDBulletinBoardNotificationServiceGroup_logCategory__block_invoke()
{
  logCategory__hmf_once_v28_9459 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end