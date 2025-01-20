@interface HMDAssistantAccessControl
+ (BOOL)isAccessorySupported:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (HMDAssistantAccessControl)accessControlWithMessage:(id)a3 user:(id)a4 currentAccessories:(id)a5 error:(id *)a6;
+ (id)logCategory;
+ (id)modelIDNamespace;
- (BOOL)areActivityNotificationsEnabledForPersonalRequests;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (HMDAssistantAccessControl)init;
- (HMDAssistantAccessControl)initWithCoder:(id)a3;
- (HMDAssistantAccessControl)initWithUser:(id)a3;
- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 enabled:(BOOL)a5;
- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 hapAccessoryIdentifiers:(id)a5 enabled:(BOOL)a6 activityNotificationsEnabledForPersonalRequests:(BOOL)a7;
- (HMDAssistantAccessControl)initWithUser:(id)a3 model:(id)a4;
- (HMDAssistantAccessControlModel)model;
- (HMDUser)user;
- (NSArray)accessories;
- (NSString)propertyDescription;
- (NSUUID)modelID;
- (OS_dispatch_queue)clientQueue;
- (id)_appleMediaAccessories;
- (id)_hapAccessoryIdentifiers;
- (id)assistantAccessControlModelWithRemovedAccessories:(id)a3;
- (id)logIdentifier;
- (id)transactionWithObjectChangeType:(unint64_t)a3;
- (unint64_t)cachedHash;
- (unint64_t)options;
- (void)_populateModel:(void *)a3 withAccessoryIdsFromAccessories:;
- (void)addAccessory:(id)a3;
- (void)configure;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleRemovedAccessory:(id)a3;
- (void)notifyClientOfUpdateWithMessage:(id)a3;
- (void)removeAccessoriesAddedByOldController:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3;
- (void)setAppleMediaAccessories:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHapAccessoryIdentifiers:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setUser:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAssistantAccessControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_hapAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_appleMediaAccessories, 0);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAssistantAccessControl *)self user];
  [v4 encodeConditionalObject:v5 forKey:*MEMORY[0x1E4F2C0E0]];

  BOOL v6 = [(HMDAssistantAccessControl *)self isEnabled];
  [v4 encodeBool:v6 forKey:*MEMORY[0x1E4F2CA00]];
  unint64_t v7 = [(HMDAssistantAccessControl *)self options];
  [v4 encodeInteger:v7 forKey:*MEMORY[0x1E4F2CA08]];
  BOOL v8 = [(HMDAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests];
  v35 = v4;
  [v4 encodeBool:v8 forKey:*MEMORY[0x1E4F2C9F8]];
  v34 = (char *)self;
  v9 = [(HMDAssistantAccessControl *)self accessories];
  v36 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v11) {
    goto LABEL_26;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v40;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v40 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(id *)(*((void *)&v39 + 1) + 8 * v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      id v18 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }
      id v20 = v19;

      if (v20)
      {
        v21 = (void *)v38;
        id v22 = v20;
LABEL_16:
        [v21 addObject:v22];
        goto LABEL_17;
      }
      if (v17)
      {
        v21 = (void *)v37;
        id v22 = v17;
        goto LABEL_16;
      }
      id v23 = v18;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
      id v25 = v24;

      if (!v25) {
        [v36 addObject:v23];
      }

LABEL_17:
      ++v14;
    }
    while (v12 != v14);
    uint64_t v26 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    uint64_t v12 = v26;
  }
  while (v26);
LABEL_26:

  int v27 = objc_msgSend(v35, "hmd_isForXPCTransport");
  uint64_t v28 = *MEMORY[0x1E4F2C9F0];
  if (v27)
  {
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v10, v28);
    v29 = v36;
    v30 = (void *)v37;
    v31 = (void *)v38;
  }
  else
  {
    v29 = v36;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v36, v28);
    v30 = (void *)v37;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v37, @"HMD.ac.homepods");
    v31 = (void *)v38;
    objc_msgSend(v35, "hm_encodeArrayOfConditionalObjects:forKey:", v38, @"HMD.ac.homepods_6_1");
    v32 = -[HMDAssistantAccessControl _hapAccessoryIdentifiers](v34);
    v33 = objc_msgSend(v32, "na_map:", &__block_literal_global_75_177270);

    [v35 encodeObject:v33 forKey:@"HMD.ac.siriEndpointIdentifiers"];
  }
}

- (id)_hapAccessoryIdentifiers
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = [v1[3] allObjects];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

uint64_t __45__HMDAssistantAccessControl_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (HMDAssistantAccessControl)initWithCoder:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C0E0]];
  BOOL v6 = [(HMDAssistantAccessControl *)self initWithUser:v5];
  if (v6)
  {
    v6->_enabled = [v4 decodeBoolForKey:*MEMORY[0x1E4F2CA00]];
    v6->_options = [v4 decodeIntegerForKey:*MEMORY[0x1E4F2CA08]];
    uint64_t v7 = *MEMORY[0x1E4F2C9F8];
    v6->_activityNotificationsEnabledForPersonalRequests = [v4 containsValueForKey:*MEMORY[0x1E4F2C9F8]]? objc_msgSend(v4, "decodeBoolForKey:", v7): 1;
    uint64_t v8 = *MEMORY[0x1E4F2C9F0];
    if ([v4 containsValueForKey:*MEMORY[0x1E4F2C9F0]])
    {
      v9 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), v8);
      id v10 = (void *)[v9 mutableCopy];

      uint64_t v11 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"HMD.ac.homepods");
      if (v11) {
        [v10 addObjectsFromArray:v11];
      }
      uint64_t v12 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), @"HMD.ac.homepods_6_1");
      if (v12) {
        [v10 addObjectsFromArray:v12];
      }
      uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
      hapAccessoryIdentifiers = v6->_hapAccessoryIdentifiers;
      v6->_hapAccessoryIdentifiers = (NSMutableSet *)v13;

      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      id v17 = [v15 setWithArray:v16];
      id v18 = [v4 decodeObjectOfClasses:v17 forKey:@"HMD.ac.siriEndpointIdentifiers"];

      if ([v18 count])
      {
        v19 = v6->_hapAccessoryIdentifiers;
        id v20 = objc_msgSend(v18, "na_map:", &__block_literal_global_71_177285);
        [(NSMutableSet *)v19 addObjectsFromArray:v20];
      }
      uint64_t v21 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
      appleMediaAccessories = v6->_appleMediaAccessories;
      v6->_appleMediaAccessories = (NSMutableSet *)v21;
    }
  }

  return v6;
}

id __43__HMDAssistantAccessControl_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)logIdentifier
{
  v2 = [(HMDAssistantAccessControl *)self modelID];
  id v3 = [v2 UUIDString];

  return v3;
}

- (id)assistantAccessControlModelWithRemovedAccessories:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        id v10 = [(HMDAssistantAccessControl *)self accessories];
        LOBYTE(v9) = [v10 containsObject:v9];

        if (v9)
        {

          uint64_t v11 = [(HMDAssistantAccessControl *)self model];
          uint64_t v13 = [v11 accessoryModelIDs];
          uint64_t v38 = (void *)[v13 mutableCopy];

          uint64_t v14 = [v11 siriEndpointAccessoryModelUUIDs];
          uint64_t v37 = (void *)[v14 mutableCopy];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v36 = v4;
          id v15 = v4;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v39 + 1) + 8 * j);
                uint64_t v21 = [v11 accessoryModelIDs];
                id v22 = [v20 uuid];
                id v23 = [v22 UUIDString];
                int v24 = [v21 containsObject:v23];

                if (v24)
                {
                  id v25 = [v20 uuid];
                  uint64_t v26 = [v25 UUIDString];
                  [v38 removeObject:v26];
                }
                int v27 = [v11 siriEndpointAccessoryModelUUIDs];
                uint64_t v28 = [v20 uuid];
                v29 = [v28 UUIDString];
                int v30 = [v27 containsObject:v29];

                if (v30)
                {
                  v31 = [v20 uuid];
                  v32 = [v31 UUIDString];
                  [v37 removeObject:v32];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
            }
            while (v17);
          }

          uint64_t v12 = v38;
          v33 = (void *)[v38 copy];
          [v11 setAccessoryModelIDs:v33];

          v34 = (void *)[v37 copy];
          [v11 setSiriEndpointAccessoryModelUUIDs:v34];

          id v4 = v36;
          goto LABEL_22;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
  uint64_t v12 = v4;
LABEL_22:

  return v11;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v77 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    uint64_t v13 = self;
    id v14 = v12;
    id v15 = v9;
    uint64_t v16 = [v15 transactionResult];
    if ([v14 propertyWasSet:@"enabled"])
    {
      uint64_t v17 = [v14 enabled];
      uint64_t v18 = [v17 BOOLValue];

      if (v18 != [(HMDAssistantAccessControl *)v13 isEnabled])
      {
        [(HMDAssistantAccessControl *)v13 setEnabled:v18];
        [v16 markChanged];
      }
    }
    if ([v14 propertyWasSet:@"options"])
    {
      v19 = [v14 options];
      uint64_t v20 = [v19 unsignedIntegerValue];

      if ([(HMDAssistantAccessControl *)v13 options] != v20)
      {
        [(HMDAssistantAccessControl *)v13 setOptions:v20];
        [v16 markChanged];
      }
    }
    if ([v14 propertyWasSet:@"activityNotificationsEnabledForPersonalRequests"])
    {
      uint64_t v21 = [v14 activityNotificationsEnabledForPersonalRequests];
      uint64_t v22 = [v21 BOOLValue];

      if (v22 != [(HMDAssistantAccessControl *)v13 areActivityNotificationsEnabledForPersonalRequests])
      {
        [(HMDAssistantAccessControl *)v13 setActivityNotificationsEnabledForPersonalRequests:v22];
        [v16 markChanged];
      }
    }
    id v74 = v15;
    id v75 = v12;
    v76 = v16;
    if ([v14 propertyWasSet:@"accessoryModelIDs"])
    {
      id v23 = [v14 accessoryModelIDs];
      int v24 = __modelIDsFromModelIDStrings(v23);

      id v25 = __accessoriesWithModelIDs(v13, v24);
      v72 = -[HMDAssistantAccessControl _appleMediaAccessories]((char *)v13);
      uint64_t v26 = (void *)MEMORY[0x1D9452090]();
      int v27 = v13;
      uint64_t v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        id v70 = v9;
        int v30 = v29 = v24;
        v31 = [(HMDAssistantAccessControl *)v27 accessories];
        *(_DWORD *)buf = 138543874;
        v79 = v30;
        __int16 v80 = 2112;
        v81 = v25;
        __int16 v82 = 2112;
        v83 = v31;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Got access control update for apple media accessories: %@, allCurrent:%@", buf, 0x20u);

        int v24 = v29;
        id v9 = v70;
      }

      char v32 = HMFEqualObjects();
      v33 = (void *)MEMORY[0x1D9452090]();
      v34 = v27;
      v35 = HMFGetOSLogHandle();
      id v36 = v35;
      if (v32)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v79 = v37;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@accessories list is the same skipping", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          long long v40 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v79 = v40;
          __int16 v80 = 2112;
          v81 = v25;
          __int16 v82 = 2112;
          v83 = v72;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control apple media accessories to: %@, from: %@", buf, 0x20u);
        }
        [(HMDAssistantAccessControl *)v34 setAppleMediaAccessories:v25];
        [v76 markChanged];
      }

      id v15 = v74;
      id v12 = v75;
      uint64_t v16 = v76;
    }
    if ([v14 propertyWasSet:@"siriEndpointAccessoryModelUUIDs"])
    {
      long long v41 = [v14 siriEndpointAccessoryModelUUIDs];
      long long v42 = __modelIDsFromModelIDStrings(v41);

      long long v43 = __accessoriesWithModelIDs(v13, v42);
      long long v44 = v43;
      if (v13)
      {
        uint64_t v45 = objc_msgSend(v43, "na_map:", &__block_literal_global_38_177302);
      }
      else
      {
        uint64_t v45 = 0;
      }
      v73 = (void *)v45;
      if ((HMFEqualObjects() & 1) == 0)
      {
        long long v46 = v44;
        v47 = (void *)MEMORY[0x1D9452090]();
        v48 = v13;
        uint64_t v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v79 = v50;
          __int16 v80 = 2112;
          v81 = v42;
          __int16 v82 = 2112;
          v83 = v46;
          _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Fatal: found non hap accessory in endpoint list %@, accessories: %@", buf, 0x20u);
        }
        long long v44 = v46;
      }
      id v71 = v9;
      v51 = -[HMDAssistantAccessControl _hapAccessoryIdentifiers]((char *)v13);
      v52 = (void *)MEMORY[0x1D9452090]();
      v53 = v13;
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = HMFGetLogIdentifier();
        [(HMDAssistantAccessControl *)v53 accessories];
        id v69 = v10;
        v56 = v42;
        v58 = v57 = v51;
        *(_DWORD *)buf = 138543874;
        v79 = v55;
        __int16 v80 = 2112;
        v81 = v73;
        __int16 v82 = 2112;
        v83 = v58;
        _os_log_impl(&dword_1D49D5000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@Got access control update for hap accessories: %@, allCurrent:%@", buf, 0x20u);

        v51 = v57;
        long long v42 = v56;
        id v10 = v69;
      }
      char v59 = HMFEqualObjects();
      v60 = (void *)MEMORY[0x1D9452090]();
      v61 = v53;
      v62 = HMFGetOSLogHandle();
      v63 = v62;
      if (v59)
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
        {
          v64 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v79 = v64;
          _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_INFO, "%{public}@endpoint list is the same skipping", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v79 = v65;
          __int16 v80 = 2112;
          v81 = v42;
          __int16 v82 = 2112;
          v83 = v51;
          _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@Updated assistant access control accessories to: %@ from: %@", buf, 0x20u);
        }
        [(HMDAssistantAccessControl *)v61 setHapAccessoryIdentifiers:v42];
        [v76 markChanged];
      }

      id v9 = v71;
      id v15 = v74;
      id v12 = v75;
      uint64_t v16 = v76;
    }
    if ([v16 changed]) {
      [(HMDAssistantAccessControl *)v13 notifyClientOfUpdateWithMessage:v15];
    }
    v66 = [v15 responseHandler];

    if (v66)
    {
      v67 = [v15 responseHandler];
      v67[2](v67, 0, 0);
    }
    uint64_t v38 = [(HMDAssistantAccessControl *)v13 user];
    long long v39 = [v38 home];
    v68 = [(HMDAssistantAccessControl *)v13 accessories];
    [v39 userAssistantAccessControlDidUpdate:v38 accessories:v68];
  }
  else
  {
    uint64_t v38 = [v9 responseHandler];
    long long v39 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    ((void (**)(void, void *, void))v38)[2](v38, v39, 0);
  }
}

- (id)_appleMediaAccessories
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock_with_options();
    v1 = [v1[2] allObjects];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

id __66__HMDAssistantAccessControl_siriEndpointAccessoriesInAccessories___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 siriEndpointProfile];

    if (v6)
    {
      id v7 = v5;
      uint64_t v6 = v2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)transactionWithObjectChangeType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDAssistantAccessControl *)self user];
  if (v5)
  {
    uint64_t v6 = [HMDAssistantAccessControlModel alloc];
    id v7 = [(HMDAssistantAccessControl *)self modelID];
    id v8 = [v5 uuid];
    id v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v15 = 138543362;
      uint64_t v16 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to create model without parent user", (uint8_t *)&v15, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (HMDAssistantAccessControlModel)model
{
  id v3 = [(HMDAssistantAccessControl *)self transactionWithObjectChangeType:0];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAssistantAccessControl isEnabled](self, "isEnabled"));
  [v3 setEnabled:v4];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAssistantAccessControl options](self, "options"));
  [v3 setOptions:v5];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests"));
  [v3 setActivityNotificationsEnabledForPersonalRequests:v6];

  id v7 = -[HMDAssistantAccessControl _appleMediaAccessories]((char *)self);
  -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:]((uint64_t)self, v3, v7);

  id v8 = -[HMDAssistantAccessControl _hapAccessoryIdentifiers]((char *)self);
  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_52_177342);
  [v3 setSiriEndpointAccessoryModelUUIDs:v9];

  return (HMDAssistantAccessControlModel *)v3;
}

- (void)_populateModel:(void *)a3 withAccessoryIdsFromAccessories:
{
  if (a1)
  {
    id v4 = a2;
    objc_msgSend(a3, "na_map:", &__block_literal_global_35_177344);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __modelIDStringsFromAccessories(v6);
    [v4 setAccessoryModelIDs:v5];
  }
}

uint64_t __34__HMDAssistantAccessControl_model__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

id __64__HMDAssistantAccessControl_appleMediaAccessoriesInAccessories___block_invoke(uint64_t a1, void *a2)
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

  return v4;
}

- (NSUUID)modelID
{
  id v2 = [(HMDAssistantAccessControl *)self user];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29128]);
    id v4 = +[HMDAssistantAccessControl modelIDNamespace];
    uint64_t v5 = [v2 uuid];
    id v6 = [v5 UUIDString];
    id v7 = [v6 dataUsingEncoding:4];
    id v8 = (void *)[v3 initWithNamespace:v4 data:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (NSUUID *)v8;
}

- (void)notifyClientOfUpdateWithMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAssistantAccessControl *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMDAssistantAccessControl_notifyClientOfUpdateWithMessage___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDAssistantAccessControl_notifyClientOfUpdateWithMessage___block_invoke(uint64_t a1)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) user];
  if (v2)
  {
    id v3 = encodeRootObjectForSPIClients(*(void **)(a1 + 32));
    id v4 = (void *)MEMORY[0x1E4F654B0];
    uint64_t v5 = *MEMORY[0x1E4F2E260];
    id v6 = [*(id *)(a1 + 40) identifier];
    uint64_t v7 = *MEMORY[0x1E4F2E258];
    v20[0] = v3;
    uint64_t v8 = *MEMORY[0x1E4F2E248];
    v19[0] = v7;
    v19[1] = v8;
    id v9 = [*(id *)(a1 + 32) accessories];
    id v10 = __modelIDStringsFromAccessories(v9);
    v20[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v12 = [v4 entitledMessageWithName:v5 identifier:v6 messagePayload:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F65488]);
    id v14 = [v2 uuid];
    int v15 = (void *)[v13 initWithTarget:v14];
    [v12 setDestination:v15];

    uint64_t v16 = [v2 home];
    uint64_t v17 = [v16 homeManager];
    uint64_t v18 = [v17 messageDispatcher];
    [v18 sendMessage:v12 completionHandler:0];
  }
}

- (void)removeAccessoriesAddedByOldController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAssistantAccessControl *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transactionWithObjectChangeType:2];
  id v3 = -[HMDAssistantAccessControl _appleMediaAccessories](*(char **)(a1 + 32));
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectsInArray:*(void *)(a1 + 40)];
  -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:](*(void *)(a1 + 32), v2, v4);
  uint64_t v5 = -[HMDAssistantAccessControl _hapAccessoryIdentifiers](*(char **)(a1 + 32));
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_2;
  v18[3] = &unk_1E6A175A8;
  id v8 = v6;
  id v19 = v8;
  objc_msgSend(v7, "na_each:", v18);
  id v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_41_177350);
  [v2 setSiriEndpointAccessoryModelUUIDs:v9];
  id v10 = [*(id *)(a1 + 32) user];
  uint64_t v11 = [v10 home];
  id v12 = [v11 backingStore];
  id v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
  id v14 = [v12 transaction:@"FixupMediaSystemUserAccessControl" options:v13];

  [v14 add:v2];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_4;
  v15[3] = &unk_1E6A18528;
  objc_copyWeak(&v16, &location);
  [v14 run:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 removeObject:v3];
}

void __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    id v4 = WeakRetained;
    [WeakRetained notifyClientOfUpdateWithMessage:0];
    id WeakRetained = v4;
  }
}

uint64_t __67__HMDAssistantAccessControl_removeAccessoriesAddedByOldController___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)handleRemovedAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDAssistantAccessControl *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_1E6A197C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [*v2 userInfo];
  id v8 = objc_msgSend(v7, "hmf_numberForKey:", @"HMDNotificationSourceKey");

  if (v8)
  {
    uint64_t v9 = [v8 unsignedIntegerValue];
    if (v6)
    {
      if (v9 == 1)
      {
        id v10 = (void *)MEMORY[0x1D9452090]();
        id v11 = *(id *)(a1 + 40);
        id v12 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v36 = v13;
          __int16 v37 = 2112;
          id v38 = v6;
          _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory was removed: %@", buf, 0x16u);
        }
        id v14 = -[HMDAssistantAccessControl _appleMediaAccessories](*(char **)(a1 + 40));
        int v15 = (void *)[v14 mutableCopy];

        id v16 = -[HMDAssistantAccessControl _hapAccessoryIdentifiers](*(char **)(a1 + 40));
        v31 = (void *)[v16 mutableCopy];

        if (([v15 containsObject:v6] & 1) != 0
          || ([v6 uuid],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = [v31 containsObject:v17],
              v17,
              v18))
        {
          if ([v15 containsObject:v6])
          {
            [v15 removeObject:v6];
          }
          else
          {
            id v19 = [v6 uuid];
            int v20 = [v31 containsObject:v19];

            if (v20)
            {
              uint64_t v21 = [v6 uuid];
              [v31 removeObject:v21];
            }
          }
          id v23 = *(void **)(a1 + 40);
          uint64_t v22 = (id *)(a1 + 40);
          [v23 removeAccessory:v6];
          int v24 = [*v22 transactionWithObjectChangeType:2];
          -[HMDAssistantAccessControl _populateModel:withAccessoryIdsFromAccessories:]((uint64_t)*v22, v24, v15);
          id v25 = objc_msgSend(v31, "na_map:", &__block_literal_global_177357);
          [v24 setSiriEndpointAccessoryModelUUIDs:v25];

          uint64_t v26 = [*v22 user];
          int v27 = [v26 home];
          uint64_t v28 = [v27 backingStore];
          v29 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
          int v30 = [v28 transaction:0 options:v29];

          [v30 add:v24 withMessage:0];
          objc_initWeak((id *)buf, *v22);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_2;
          v32[3] = &unk_1E6A17758;
          objc_copyWeak(&v34, (id *)buf);
          id v33 = v6;
          [v30 run:v32];

          objc_destroyWeak(&v34);
          objc_destroyWeak((id *)buf);
        }
      }
    }
  }
}

void __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v13 = 138543874;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error: %@ running transaction to remove accessory: %@ from ACL adding it back.", (uint8_t *)&v13, 0x20u);
    }
    [v6 addAccessory:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = *(void **)(a1 + 32);
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@ from assistant access control list.", (uint8_t *)&v13, 0x16u);
    }
    [v6 notifyClientOfUpdateWithMessage:0];
  }
}

uint64_t __52__HMDAssistantAccessControl_handleRemovedAccessory___block_invoke_28(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (void)removeAccessory:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (isKindOfClass)
    {
      os_unfair_lock_lock_with_options();
      hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
      id v11 = [v6 uuid];
      int v12 = [(NSMutableSet *)hapAccessoryIdentifiers containsObject:v11];

      int v13 = self->_hapAccessoryIdentifiers;
      id v14 = [v6 uuid];
      [(NSMutableSet *)v13 removeObject:v14];

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      int v12 = 0;
    }
    id v15 = v6;
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();
    if (v16) {
      __int16 v17 = v15;
    }
    else {
      __int16 v17 = 0;
    }
    id v18 = v17;

    if (v16)
    {
      os_unfair_lock_lock_with_options();
      unsigned __int8 v19 = [(NSMutableSet *)self->_appleMediaAccessories containsObject:v15];
      [(NSMutableSet *)self->_appleMediaAccessories removeObject:v15];
      os_unfair_lock_unlock(&self->_lock);
      if (((v19 | v12) & 1) == 0) {
        goto LABEL_18;
      }
    }
    else if (!v12)
    {
LABEL_18:

      goto LABEL_19;
    }
    int v20 = (void *)MEMORY[0x1D9452090]();
    uint64_t v21 = self;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = HMFGetLogIdentifier();
      int v24 = 138543618;
      id v25 = v23;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Removed accessory %@", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)addAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (isKindOfClass)
    {
      os_unfair_lock_lock_with_options();
      hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
      id v11 = [v6 uuid];
      [(NSMutableSet *)hapAccessoryIdentifiers addObject:v11];

      os_unfair_lock_unlock(&self->_lock);
    }
    id v12 = v6;
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();
    if (v13) {
      id v14 = v12;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v13)
    {
      os_unfair_lock_lock_with_options();
      [(NSMutableSet *)self->_appleMediaAccessories addObject:v12];
      os_unfair_lock_unlock(&self->_lock);
    }
    char v16 = (void *)MEMORY[0x1D9452090]();
    __int16 v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v19 = HMFGetLogIdentifier();
      int v20 = 138543618;
      uint64_t v21 = v19;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Added accessory %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)setAppleMediaAccessories:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
    id v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    appleMediaAccessories = self->_appleMediaAccessories;
    self->_appleMediaAccessories = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setHapAccessoryIdentifiers:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
    id v4 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    hapAccessoryIdentifiers = self->_hapAccessoryIdentifiers;
    self->_hapAccessoryIdentifiers = v4;

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (NSArray)accessories
{
  id v3 = [MEMORY[0x1E4F1C978] array];
  id v4 = [MEMORY[0x1E4F1C978] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(NSMutableSet *)self->_hapAccessoryIdentifiers allObjects];

  os_unfair_lock_unlock(&self->_lock);
  if ([v6 count])
  {
    uint64_t v7 = __accessoriesWithModelIDs(self, v6);

    id v3 = (void *)v7;
  }
  os_unfair_lock_lock_with_options();
  id v8 = [(NSMutableSet *)self->_appleMediaAccessories allObjects];
  id v9 = [v8 arrayByAddingObjectsFromArray:v3];

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v9;
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_activityNotificationsEnabledForPersonalRequests = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_activityNotificationsEnabledForPersonalRequests;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setOptions:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_options = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)options
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t options = self->_options;
  os_unfair_lock_unlock(p_lock);
  return options;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUser:(id)a3
{
  obuint64_t j = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_user, obj);
  if (obj) {
    self->_cachedHash = [obj hash];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)cachedHash
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t cachedHash = self->_cachedHash;
  os_unfair_lock_unlock(p_lock);
  return cachedHash;
}

- (HMDUser)user
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  os_unfair_lock_unlock(p_lock);
  return (HMDUser *)WeakRetained;
}

- (NSString)propertyDescription
{
  id v3 = NSString;
  [(HMDAssistantAccessControl *)self isEnabled];
  id v4 = HMFBooleanToString();
  [(HMDAssistantAccessControl *)self options];
  uint64_t v5 = HMAssistantAccessControlOptionsToString();
  [(HMDAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests];
  id v6 = HMFBooleanToString();
  uint64_t v7 = [(HMDAssistantAccessControl *)self accessories];
  id v8 = [v3 stringWithFormat:@" Enabled = %@, Options = %@, Activity Notifications Enabled for Personal Requests = %@, Accessories = %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAssistantAccessControl *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDAssistantAccessControl *)self user];
      uint64_t v8 = [(HMDAssistantAccessControl *)v6 user];
      id v9 = (void *)v8;
      char v10 = 0;
      if (v7 && v8)
      {
        if (HMFEqualObjects()
          && (BOOL v11 = [(HMDAssistantAccessControl *)self isEnabled],
              v11 == [(HMDAssistantAccessControl *)v6 isEnabled])
          && (unint64_t v12 = [(HMDAssistantAccessControl *)self options],
              v12 == [(HMDAssistantAccessControl *)v6 options])
          && (BOOL v13 = [(HMDAssistantAccessControl *)self areActivityNotificationsEnabledForPersonalRequests], v13 == [(HMDAssistantAccessControl *)v6 areActivityNotificationsEnabledForPersonalRequests]))
        {
          id v15 = (void *)MEMORY[0x1E4F1CAD0];
          char v16 = [(HMDAssistantAccessControl *)self accessories];
          __int16 v17 = [v15 setWithArray:v16];

          id v18 = (void *)MEMORY[0x1E4F1CAD0];
          unsigned __int8 v19 = [(HMDAssistantAccessControl *)v6 accessories];
          int v20 = [v18 setWithArray:v19];

          char v10 = HMFEqualObjects();
        }
        else
        {
          char v10 = 0;
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDAssistantAccessControl;
  [(HMDAssistantAccessControl *)&v4 dealloc];
}

- (void)configure
{
  id v6 = [(HMDAssistantAccessControl *)self user];
  id v3 = [v6 home];
  if (v6 && v3)
  {
    objc_super v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self];

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel_handleRemovedAccessory_ name:@"HMDHomeAccessoryRemovedNotification" object:v3];
  }
}

- (HMDAssistantAccessControl)initWithUser:(id)a3
{
  return [(HMDAssistantAccessControl *)self initWithUser:a3 appleAccessories:MEMORY[0x1E4F1CBF0] hapAccessoryIdentifiers:MEMORY[0x1E4F1CBF0] enabled:1 activityNotificationsEnabledForPersonalRequests:1];
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 hapAccessoryIdentifiers:(id)a5 enabled:(BOOL)a6 activityNotificationsEnabledForPersonalRequests:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HMDAssistantAccessControl;
  id v15 = [(HMDAssistantAccessControl *)&v27 init];
  char v16 = v15;
  if (v15)
  {
    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v15->_user, v12);
    v16->_unint64_t cachedHash = [v12 hash];
    v16->_enabled = a6;
    v16->_activityNotificationsEnabledForPersonalRequests = a7;
    uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    appleMediaAccessories = v16->_appleMediaAccessories;
    v16->_appleMediaAccessories = (NSMutableSet *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithArray:v14];
    hapAccessoryIdentifiers = v16->_hapAccessoryIdentifiers;
    v16->_hapAccessoryIdentifiers = (NSMutableSet *)v19;

    HMDispatchQueueNameString();
    id v21 = objc_claimAutoreleasedReturnValue();
    __int16 v22 = (const char *)[v21 UTF8String];
    id v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create(v22, v23);
    clientQueue = v16->_clientQueue;
    v16->_clientQueue = (OS_dispatch_queue *)v24;
  }
  return v16;
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 appleAccessories:(id)a4 enabled:(BOOL)a5
{
  return [(HMDAssistantAccessControl *)self initWithUser:a3 appleAccessories:a4 hapAccessoryIdentifiers:MEMORY[0x1E4F1CBF0] enabled:a5 activityNotificationsEnabledForPersonalRequests:1];
}

- (HMDAssistantAccessControl)initWithUser:(id)a3 model:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 enabled];
    uint64_t v10 = [v9 BOOLValue];

    BOOL v11 = [(HMDAssistantAccessControl *)self initWithUser:v6 appleAccessories:MEMORY[0x1E4F1CBF0] enabled:v10];
    if (v11)
    {
      id v12 = [v8 options];
      v11->_unint64_t options = [v12 unsignedIntegerValue];

      id v13 = [v8 activityNotificationsEnabledForPersonalRequests];
      v11->_activityNotificationsEnabledForPersonalRequests = [v13 BOOLValue];

      id v14 = [v8 accessoryModelIDs];
      id v15 = __modelIDsFromModelIDStrings(v14);

      uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
      hapAccessoryIdentifiers = v11->_hapAccessoryIdentifiers;
      v11->_hapAccessoryIdentifiers = (NSMutableSet *)v16;

      id v18 = [v8 siriEndpointAccessoryModelUUIDs];
      uint64_t v19 = __modelIDsFromModelIDStrings(v18);

      if ([v19 count])
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA80] setWithArray:v19];
        id v21 = v11->_hapAccessoryIdentifiers;
        v11->_hapAccessoryIdentifiers = (NSMutableSet *)v20;
      }
      __int16 v22 = (void *)MEMORY[0x1E4F1CA80];
      id v23 = __accessoriesWithModelIDs(v11, v15);
      uint64_t v24 = [v22 setWithArray:v23];
      appleMediaAccessories = v11->_appleMediaAccessories;
      v11->_appleMediaAccessories = (NSMutableSet *)v24;
    }
    __int16 v26 = v11;
    objc_super v27 = v26;
  }
  else
  {
    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    __int16 v26 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v30 = HMFGetLogIdentifier();
      int v32 = 138543362;
      id v33 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Model is required", (uint8_t *)&v32, 0xCu);
    }
    objc_super v27 = 0;
  }

  return v27;
}

- (HMDAssistantAccessControl)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t54_177389 != -1) {
    dispatch_once(&logCategory__hmf_once_t54_177389, &__block_literal_global_55_177390);
  }
  id v2 = (void *)logCategory__hmf_once_v55_177391;
  return v2;
}

uint64_t __40__HMDAssistantAccessControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v55_177391;
  logCategory__hmf_once_v55_177391 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)modelIDNamespace
{
  if (modelIDNamespace_onceToken_177396 != -1) {
    dispatch_once(&modelIDNamespace_onceToken_177396, &__block_literal_global_49_177397);
  }
  id v2 = (void *)modelIDNamespace_modelIDNamespace_177398;
  return v2;
}

uint64_t __45__HMDAssistantAccessControl_modelIDNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5FF02DEF-EFB2-45C7-BF0C-042B4F336FD8"];
  uint64_t v1 = modelIDNamespace_modelIDNamespace_177398;
  modelIDNamespace_modelIDNamespace_177398 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDAssistantAccessControl)accessControlWithMessage:(id)a3 user:(id)a4 currentAccessories:(id)a5 error:(id *)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v79 = a5;
  id v12 = [v10 dataForKey:*MEMORY[0x1E4F2E258]];
  if (v12)
  {
    id v13 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = objc_opt_class();
    id v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    v85 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
    id v18 = [v13 deserializeObjectWithData:v12 allowedClass:v14 frameworkClasses:v17];

    if (v18)
    {
      uint64_t v19 = [v10 arrayForKey:*MEMORY[0x1E4F2E248]];
      if (v19)
      {
        id v73 = v11;
        v72 = a6;
        v78 = [v11 home];
        v76 = [MEMORY[0x1E4F1CA48] array];
        id v75 = [MEMORY[0x1E4F1CA48] array];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        obuint64_t j = v19;
        uint64_t v20 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v81;
          id v71 = v10;
          id v74 = v19;
LABEL_6:
          uint64_t v23 = 0;
          while (1)
          {
            if (*(void *)v81 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v80 + 1) + 8 * v23);
            uint64_t v25 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v24];
            if (!v25)
            {
              v55 = (void *)MEMORY[0x1D9452090]();
              id v56 = a1;
              v57 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                v58 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v87 = v58;
                __int16 v88 = 2112;
                id v89 = v24;
                _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_INFO, "%{public}@Invalid accessory identifier: %@", buf, 0x16u);
              }
              id v11 = v73;
              uint64_t v19 = v74;
              uint64_t v39 = v75;
              id v38 = v76;
              char v59 = obj;
              if (v72)
              {
                id *v72 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
              }
              goto LABEL_54;
            }
            __int16 v26 = (void *)v25;
            uint64_t v27 = [v78 accessoryWithUUID:v25];
            if (!v27) {
              break;
            }
            uint64_t v28 = (void *)v27;
            if (([v79 containsObject:v26] & 1) == 0
              && ([a1 isAccessorySupported:v28] & 1) == 0)
            {
              v66 = (void *)MEMORY[0x1D9452090]();
              id v67 = a1;
              v68 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                id v69 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v87 = v69;
                __int16 v88 = 2112;
                id v89 = v28;
                _os_log_impl(&dword_1D49D5000, v68, OS_LOG_TYPE_INFO, "%{public}@Accessory not supported: %@", buf, 0x16u);
              }
              v64 = v72;
              uint64_t v19 = v74;
              if (v72)
              {
                uint64_t v65 = 9002;
LABEL_51:
                id v11 = v73;
                uint64_t v39 = v75;
                id v38 = v76;
                char v59 = obj;
                id *v64 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:v65];
LABEL_53:

LABEL_54:
                id v40 = 0;
                id v10 = v71;
                goto LABEL_55;
              }
LABEL_52:
              id v11 = v73;
              uint64_t v39 = v75;
              id v38 = v76;
              char v59 = obj;
              goto LABEL_53;
            }
            id v29 = v28;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
            if (isKindOfClass) {
              v31 = v29;
            }
            else {
              v31 = 0;
            }
            id v32 = v31;

            if (isKindOfClass)
            {
              uint64_t v33 = [v29 uuid];

              [v75 addObject:v33];
              id v32 = (id)v33;
            }
            else
            {
              [v76 addObject:v29];
            }

            if (v21 == ++v23)
            {
              uint64_t v21 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
              id v10 = v71;
              uint64_t v19 = v74;
              if (v21) {
                goto LABEL_6;
              }
              goto LABEL_21;
            }
          }
          v60 = (void *)MEMORY[0x1D9452090]();
          id v61 = a1;
          v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v87 = v63;
            __int16 v88 = 2112;
            id v89 = v24;
            _os_log_impl(&dword_1D49D5000, v62, OS_LOG_TYPE_INFO, "%{public}@Failed to lookup accessory with identifier: %@", buf, 0x16u);
          }
          uint64_t v28 = 0;
          v64 = v72;
          uint64_t v19 = v74;
          if (v72)
          {
            uint64_t v65 = 9003;
            goto LABEL_51;
          }
          goto LABEL_52;
        }
LABEL_21:

        uint64_t v34 = (void *)MEMORY[0x1D9452090]();
        id v35 = a1;
        id v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          __int16 v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v87 = v37;
          __int16 v88 = 2112;
          id v89 = obj;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_INFO, "%{public}@Generated access control from message with accessories %@", buf, 0x16u);
        }
        id v38 = v76;
        [v18 setAppleMediaAccessories:v76];
        uint64_t v39 = v75;
        [v18 setHapAccessoryIdentifiers:v75];
        id v11 = v73;
        [v18 setUser:v73];
        id v40 = v18;
LABEL_55:
      }
      else
      {
        v50 = (void *)MEMORY[0x1D9452090]();
        id v51 = a1;
        v52 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          v53 = HMFGetLogIdentifier();
          v54 = [v10 messagePayload];
          *(_DWORD *)buf = 138543618;
          v87 = v53;
          __int16 v88 = 2112;
          id v89 = v54;
          _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Missing access control accessories in message payload: %@", buf, 0x16u);

          uint64_t v19 = 0;
        }

        if (a6)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          id v40 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v40 = 0;
        }
      }
    }
    else
    {
      long long v46 = (void *)MEMORY[0x1D9452090]();
      id v47 = a1;
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v49 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v87 = v49;
        _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_INFO, "%{public}@Invalid access control in message payload", buf, 0xCu);
      }
      if (a6)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:43];
        id v40 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v40 = 0;
      }
    }
  }
  else
  {
    long long v41 = (void *)MEMORY[0x1D9452090]();
    id v42 = a1;
    long long v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      long long v44 = HMFGetLogIdentifier();
      uint64_t v45 = [v10 messagePayload];
      *(_DWORD *)buf = 138543618;
      v87 = v44;
      __int16 v88 = 2112;
      id v89 = v45;
      _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_INFO, "%{public}@Missing serialized access control in message payload: %@", buf, 0x16u);
    }
    if (a6)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      id v40 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v40 = 0;
    }
  }

  return (HMDAssistantAccessControl *)v40;
}

+ (BOOL)isAccessorySupported:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 siriEndpointProfile];
    char v8 = v7 != 0;
  }
  else
  {
    id v9 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v7 = v10;

    if (v7
      && ([v7 capabilities], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
    {
      id v12 = [v7 capabilities];
      char v8 = [v12 supportsAssistantAccessControl];
    }
    else
    {
      char v8 = [v7 isHomePod];
    }
  }

  return v8;
}

@end