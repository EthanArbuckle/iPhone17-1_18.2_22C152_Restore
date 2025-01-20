@interface HMDLightProfileNaturalLightingAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 actionSet:(id)a4;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)isActionForCharacteristic:(id)a3;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isNaturalLightingEnabled;
- (BOOL)isUnsecuringAction;
- (Class)modelClass;
- (HMDLightProfile)lightProfile;
- (HMDLightProfileNaturalLightingAction)initWithCoder:(id)a3;
- (HMDLightProfileNaturalLightingAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5;
- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6;
- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6 notificationCenter:(id)a7;
- (NSArray)lightServices;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)lightProfileUUID;
- (id)associatedAccessories;
- (id)attributeDescriptions;
- (id)dictionaryRepresentation;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)writeRequestForTransitionStartWithLightProfile:(id)a3 startDate:(id)a4 type:(unint64_t)a5;
- (unint64_t)type;
- (void)configureWithHome:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleAccessoryProfileAddedNotification:(id)a3;
- (void)setLightProfile:(id)a3;
- (void)setLightServices:(id)a3;
- (void)setNaturalLightingEnabled:(BOOL)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDLightProfileNaturalLightingAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightServices, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_lightProfileUUID, 0);
  objc_storeStrong((id *)&self->_lightProfile, 0);
}

- (void)setLightServices:(id)a3
{
}

- (NSArray)lightServices
{
  return self->_lightServices;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)lightProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)HMDLightProfileNaturalLightingAction;
  v3 = [(HMDAction *)&v17 attributeDescriptions];
  v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
  v7 = (void *)[v5 initWithName:@"Light Profile UUID" value:v6];
  v18[0] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  v9 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
  v10 = (void *)[v8 initWithName:@"Light Profile" value:v9];
  v18[1] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDLightProfileNaturalLightingAction *)self isNaturalLightingEnabled];
  v12 = HMFBooleanToString();
  v13 = (void *)[v11 initWithName:@"Natural Light Enabled" value:v12];
  v18[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  [v4 addObjectsFromArray:v14];

  v15 = (void *)[v4 copy];
  return v15;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    v14 = [(HMDAction *)self actionSet];
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 home];
      if (v16)
      {
        objc_super v17 = (void *)v16;
        id v53 = v8;
        v18 = [v13 setProperties];
        int v19 = [v18 containsObject:@"naturalLightingEnabledField"];

        v20 = (void *)MEMORY[0x1D9452090]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
        if (v19)
        {
          v52 = v10;
          if (v23)
          {
            v24 = HMFGetLogIdentifier();
            [(HMDLightProfileNaturalLightingAction *)v21 isNaturalLightingEnabled];
            v25 = HMFBooleanToString();
            [v13 isNaturalLightingEnabled];
            v26 = HMFBooleanToString();
            *(_DWORD *)buf = 138543874;
            v57 = v24;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v25;
            __int16 v60 = 2112;
            id v61 = v26;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating natural lighting enabled from %@ to %@", buf, 0x20u);
          }
          -[HMDLightProfileNaturalLightingAction setNaturalLightingEnabled:](v21, "setNaturalLightingEnabled:", [v13 isNaturalLightingEnabled]);
          v54[0] = @"kActionUUID";
          v51 = [(HMDAction *)v21 uuid];
          v27 = [v51 UUIDString];
          v55[0] = v27;
          v54[1] = @"kActionInfo";
          v28 = [(HMDLightProfileNaturalLightingAction *)v21 dictionaryRepresentation];
          v55[1] = v28;
          v54[2] = @"kHomeUUID";
          v29 = [v17 uuid];
          v30 = [v29 UUIDString];
          v55[2] = v30;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

          id v10 = v52;
          v32 = (void *)MEMORY[0x1D9452090]([v52 respondWithPayload:v31]);
          v33 = v21;
          v34 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            v35 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v57 = v35;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v31;
            _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response %@", buf, 0x16u);
          }
        }
        else
        {
          if (v23)
          {
            v49 = HMFGetLogIdentifier();
            v50 = [v13 setProperties];
            *(_DWORD *)buf = 138543618;
            v57 = v49;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v50;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Ignoring update naturalLightingEnabledField property is not set: %@", buf, 0x16u);
          }
          [v10 respondWithSuccess];
        }
        id v8 = v53;
      }
      else
      {
        v44 = (void *)MEMORY[0x1D9452090]();
        v45 = self;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v57 = v47;
          __int16 v58 = 2112;
          uint64_t v59 = (uint64_t)v15;
          __int16 v60 = 2112;
          id v61 = 0;
          _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to update action, action set missing home %@:%@", buf, 0x20u);
        }
        v48 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        [v10 respondWithError:v48];

        objc_super v17 = 0;
      }
    }
    else
    {
      v40 = (void *)MEMORY[0x1D9452090]();
      v41 = self;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v57 = v43;
        __int16 v58 = 2112;
        uint64_t v59 = 0;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to update action, missing action set: %@", buf, 0x16u);
      }
      objc_super v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      [v10 respondWithError:v17];
    }
  }
  else
  {
    v36 = (void *)MEMORY[0x1D9452090]();
    v37 = self;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v57 = v39;
      __int16 v58 = 2112;
      uint64_t v59 = objc_opt_class();
      __int16 v60 = 2112;
      id v61 = v11;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Ignoring update from object of unhandled type %@:%@", buf, 0x20u);
    }
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v15];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4 < 4)
  {
    v4 = 0;
    goto LABEL_14;
  }
  id v8 = [(HMDAction *)self actionSet];
  if (!v8)
  {
    v20 = (void *)MEMORY[0x1D9452090]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      BOOL v23 = HMFGetLogIdentifier();
      int v33 = 138543874;
      v34 = v23;
      __int16 v35 = 2048;
      int64_t v36 = a4;
      __int16 v37 = 2112;
      uint64_t v38 = 0;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model object for change type:%lu missing actionSet: %@", (uint8_t *)&v33, 0x20u);
    }
    v4 = 0;
    goto LABEL_13;
  }
  id v9 = [HMDLightProfileNaturalLightingActionModel alloc];
  id v10 = [(HMDAction *)self uuid];
  id v11 = [v8 uuid];
  v4 = [(HMDBackingStoreModelObject *)v9 initWithObjectChangeType:a3 uuid:v10 parentUUID:v11];

  v12 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
  [(HMDLightProfileNaturalLightingActionModel *)v4 setLightProfileUUID:v12];

  [(HMDLightProfileNaturalLightingActionModel *)v4 setNaturalLightingEnabled:[(HMDLightProfileNaturalLightingAction *)self isNaturalLightingEnabled]];
  id v13 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
  v14 = v13;
  if (v13)
  {
    v15 = [v13 accessory];
    uint64_t v16 = [v15 uuid];
    [(HMDLightProfileNaturalLightingActionModel *)v4 setAccessoryUUID:v16];

    objc_super v17 = [v14 services];
    v18 = v17;
    int v19 = &__block_literal_global_69536;
LABEL_11:
    v30 = objc_msgSend(v17, "na_map:", v19);

    v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
    [(HMDLightProfileNaturalLightingActionModel *)v4 setServiceUUIDs:v31];

    goto LABEL_12;
  }
  v24 = [(HMDLightProfileNaturalLightingAction *)self lightServices];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    v26 = [(HMDLightProfileNaturalLightingAction *)self lightServices];
    v27 = [v26 firstObject];
    v28 = [v27 accessory];
    v29 = [v28 uuid];
    [(HMDLightProfileNaturalLightingActionModel *)v4 setAccessoryUUID:v29];

    objc_super v17 = [(HMDLightProfileNaturalLightingAction *)self lightServices];
    v18 = v17;
    int v19 = &__block_literal_global_26_69537;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
LABEL_14:
  return v4;
}

uint64_t __74__HMDLightProfileNaturalLightingAction_modelObjectWithChangeType_version___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __74__HMDLightProfileNaturalLightingAction_modelObjectWithChangeType_version___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (HMDLightProfileNaturalLightingAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      uint64_t v16 = [v12 lightProfileUUID];
      if (v16)
      {
        id v17 = v9;
        uint64_t v39 = [v15 home];
        v18 = [v39 lightProfileWithUUID:v16];
        int v19 = (void *)MEMORY[0x1D9452090]();
        v20 = self;
        v21 = HMFGetOSLogHandle();
        v22 = v21;
        if (v18)
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            BOOL v23 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v23;
            __int16 v43 = 2112;
            id v44 = v18;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Creating natural lighting action with action model with light profile: %@", buf, 0x16u);
          }
          v24 = [v12 uuid];
          uint64_t v25 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:](v20, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v24, v16, [v12 isNaturalLightingEnabled], v15);

          [(HMDLightProfileNaturalLightingAction *)v25 setLightProfile:v18];
          v20 = v25;
          v26 = v20;
        }
        else
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v38 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v42 = v38;
            __int16 v43 = 2112;
            id v44 = v16;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, home doesn't have a light profile with UUID: %@", buf, 0x16u);
          }
          if (a5)
          {
            [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
            v26 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v26 = 0;
          }
        }
        id v9 = v17;
      }
      else
      {
        int v33 = (void *)MEMORY[0x1D9452090]();
        v20 = self;
        v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = id v35 = v9;
          *(_DWORD *)buf = 138543618;
          v42 = v36;
          __int16 v43 = 2112;
          id v44 = 0;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model is missing light profile UUID: %@", buf, 0x16u);

          id v9 = v35;
        }

        if (a5)
        {
          [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
          v26 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
      }
    }
    else
    {
      v30 = (void *)MEMORY[0x1D9452090]();
      v20 = self;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = id v40 = v9;
        *(_DWORD *)buf = 138543874;
        v42 = v32;
        __int16 v43 = 2112;
        id v44 = v13;
        __int16 v45 = 2112;
        uint64_t v46 = objc_opt_class();
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model's parent is of invalid class %@:%@", buf, 0x20u);

        id v9 = v40;
      }

      if (a5)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
        v26 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v42 = v29;
      __int16 v43 = 2112;
      id v44 = v10;
      __int16 v45 = 2112;
      uint64_t v46 = objc_opt_class();
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to create action, model is of invalid class %@:%@", buf, 0x20u);
    }
    if (a5)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
      v26 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (void)handleAccessoryProfileAddedNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 lightProfiles];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__HMDLightProfileNaturalLightingAction_handleAccessoryProfileAddedNotification___block_invoke;
    v21[3] = &unk_1E6A0CA58;
    v21[4] = self;
    id v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", v21);

    if (v9)
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = self;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        v14 = [v4 name];
        *(_DWORD *)buf = 138543874;
        BOOL v23 = v13;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling accessory profile update notification: %@, updating light profile to: %@", buf, 0x20u);
      }
      [(HMDLightProfileNaturalLightingAction *)v11 setLightProfile:v9];
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = [v4 name];
      v20 = [v4 object];
      *(_DWORD *)buf = 138544130;
      BOOL v23 = v18;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = objc_opt_class();
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory profile update notification: %@ is sent by object: %@ which is not of type %@", buf, 0x2Au);
    }
  }
}

uint64_t __80__HMDLightProfileNaturalLightingAction_handleAccessoryProfileAddedNotification___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) lightProfileUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)configureWithHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self notificationCenter];
  [v5 removeObserver:self];

  v6 = [(HMDLightProfileNaturalLightingAction *)self notificationCenter];
  [v6 addObserver:self selector:sel_handleAccessoryProfileAddedNotification_ name:@"HMDAccessoryProfileAddedNotification" object:0];

  id v8 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
  id v7 = [v4 lightProfileWithUUID:v8];

  [(HMDLightProfileNaturalLightingAction *)self setLightProfile:v7];
}

- (id)dictionaryRepresentation
{
  v10.receiver = self;
  v10.super_class = (Class)HMDLightProfileNaturalLightingAction;
  v3 = [(HMDAction *)&v10 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
  v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F2D8B0]];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDLightProfileNaturalLightingAction isNaturalLightingEnabled](self, "isNaturalLightingEnabled"));
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2D880]];

  id v8 = (void *)[v4 copy];
  return v8;
}

- (unint64_t)type
{
  return 3;
}

- (BOOL)isActionForCharacteristic:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
  v6 = [v5 readCharacteristicRequests];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__HMDLightProfileNaturalLightingAction_isActionForCharacteristic___block_invoke;
  v10[3] = &unk_1E6A18E90;
  id v11 = v4;
  id v7 = v4;
  char v8 = objc_msgSend(v6, "na_any:", v10);

  return v8;
}

uint64_t __66__HMDLightProfileNaturalLightingAction_isActionForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 characteristic];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLightProfileNaturalLightingAction;
  [(HMDAction *)&v9 encodeWithCoder:v4];
  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
    [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2D868]];
  }
  else
  {
    v6 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
    [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2D8B0]];

    uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
    id v7 = [v5 services];
    [v4 encodeObject:v7 forKey:@"services"];
  }
  BOOL v8 = [(HMDLightProfileNaturalLightingAction *)self isNaturalLightingEnabled];
  [v4 encodeBool:v8 forKey:*MEMORY[0x1E4F2D880]];
}

- (HMDLightProfileNaturalLightingAction)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[HMDAction alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2D8B0]];
    if (v6)
    {
      id v7 = [(HMDAction *)v5 actionSet];
      uint64_t v8 = [v4 decodeBoolForKey:*MEMORY[0x1E4F2D880]];
      objc_super v9 = [(HMDAction *)v5 uuid];
      objc_super v10 = [(HMDLightProfileNaturalLightingAction *)self initWithUUID:v9 lightProfileUUID:v6 naturalLightingEnabled:v8 actionSet:v7];

      LODWORD(v8) = objc_msgSend(v4, "hmd_isForXPCTransport");
      int v11 = objc_msgSend(v4, "hmd_isForXPCTransportEntitledForSPIAccess");
      if (!v8 || v11)
      {
        id v12 = (void *)MEMORY[0x1E4F1CAD0];
        v27[0] = objc_opt_class();
        v27[1] = objc_opt_class();
        id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
        v14 = [v12 setWithArray:v13];
        id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"services"];
        [(HMDLightProfileNaturalLightingAction *)v10 setLightServices:v15];
      }
      uint64_t v16 = v10;

      id v17 = v16;
    }
    else
    {
      v22 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = self;
      BOOL v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v29 = v24;
        __int16 v30 = 2112;
        id v31 = 0;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode, light profile UUID is: %@", buf, 0x16u);
      }
      id v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      v26.receiver = v16;
      v26.super_class = (Class)HMDLightProfileNaturalLightingAction;
      id v21 = [(HMDLightProfileNaturalLightingAction *)&v26 class];
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      id v31 = v21;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);
    }
    id v17 = 0;
  }

  return v17;
}

- (BOOL)isNaturalLightingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_naturalLightingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_naturalLightingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMDLightProfile)lightProfile
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_lightProfile;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLightProfile:(id)a3
{
  id v4 = (HMDLightProfile *)a3;
  os_unfair_lock_lock_with_options();
  lightProfile = self->_lightProfile;
  self->_lightProfile = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)writeRequestForTransitionStartWithLightProfile:(id)a3 startDate:(id)a4 type:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_super v10 = +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:v9 naturalLightingEnabled:[(HMDLightProfileNaturalLightingAction *)self isNaturalLightingEnabled] startDate:v8 type:a5];

  return v10;
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (id)associatedAccessories
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
  v3 = [v2 accessory];

  if (v3)
  {
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLightProfileNaturalLightingAction;
  if ([(HMDAction *)&v9 isCompatibleWithAction:v4])
  {
    uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfileUUID];
    v6 = [v4 lightProfileUUID];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = [a3 uuid];
  uint64_t v5 = [(HMDLightProfileNaturalLightingAction *)self lightProfile];
  v6 = [v5 accessory];
  char v7 = [v6 uuid];
  char v8 = [v4 isEqual:v7];

  return v8;
}

- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6
{
  BOOL v6 = a5;
  objc_super v10 = (void *)MEMORY[0x1E4F28EB8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 defaultCenter];
  id v15 = [(HMDLightProfileNaturalLightingAction *)self initWithUUID:v13 lightProfileUUID:v12 naturalLightingEnabled:v6 actionSet:v11 notificationCenter:v14];

  return v15;
}

- (HMDLightProfileNaturalLightingAction)initWithUUID:(id)a3 lightProfileUUID:(id)a4 naturalLightingEnabled:(BOOL)a5 actionSet:(id)a6 notificationCenter:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDLightProfileNaturalLightingAction;
  id v15 = [(HMDAction *)&v23 initWithUUID:a3 actionSet:v13];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_naturalLightingEnabled = a5;
    uint64_t v17 = [v12 copy];
    lightProfileUUID = v16->_lightProfileUUID;
    v16->_lightProfileUUID = (NSUUID *)v17;

    v16->_lock._os_unfair_lock_opaque = 0;
    int v19 = [v13 home];
    uint64_t v20 = [v19 lightProfileWithUUID:v12];
    lightProfile = v16->_lightProfile;
    v16->_lightProfile = (HMDLightProfile *)v20;

    objc_storeStrong((id *)&v16->_notificationCenter, a7);
  }

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31 != -1) {
    dispatch_once(&logCategory__hmf_once_t31, &__block_literal_global_31_69575);
  }
  v2 = (void *)logCategory__hmf_once_v32;
  return v2;
}

uint64_t __51__HMDLightProfileNaturalLightingAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32;
  logCategory__hmf_once_uint64_t v32 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
  objc_super v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F29128] UUID];
  }
  id v11 = v10;

  id v12 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  id v13 = v12;
  if (!v12)
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = a1;
    objc_super v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v24;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = @"kActionType";
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation mising key %@:%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if ([v12 integerValue] != 3)
  {
    id v21 = (void *)MEMORY[0x1D9452090]();
    id v22 = a1;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_super v26 = HMFGetLogIdentifier();
      HMActionTypeAsString();
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v26;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation invalid action type %@:%@", buf, 0x20u);
    }
LABEL_16:

    uint64_t v17 = 0;
    goto LABEL_25;
  }
  id v14 = (__CFString *)*MEMORY[0x1E4F2D8B0];
  id v15 = objc_msgSend(v6, "hmf_UUIDForKey:", *MEMORY[0x1E4F2D8B0]);
  if (v15)
  {
    uint64_t v16 = [v7 lightProfileWithUUID:v15];
    if (v16)
    {
      uint64_t v17 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:]([HMDLightProfileNaturalLightingAction alloc], "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v11, v15, objc_msgSend(v6, "hmf_BOOLForKey:", *MEMORY[0x1E4F2D880]), 0);
      context = (void *)MEMORY[0x1D9452090]([(HMDLightProfileNaturalLightingAction *)v17 setLightProfile:v16]);
      id v18 = a1;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = id v35 = v16;
        *(_DWORD *)buf = 138543874;
        uint64_t v38 = v20;
        __int16 v39 = 2112;
        id v40 = v18;
        __int16 v41 = 2112;
        v42 = (__CFString *)v17;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Created natural lighting action with dictionary representation %@:%@", buf, 0x20u);

        uint64_t v16 = v35;
      }
    }
    else
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v32 = a1;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = v33;
        __int16 v39 = 2112;
        id v40 = v15;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation light profile with UUID does not exisit: %@", buf, 0x16u);
      }
      uint64_t v17 = 0;
    }
  }
  else
  {
    __int16 v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = a1;
    __int16 v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v31;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation missing key %@:%@", buf, 0x20u);
    }
    uint64_t v17 = 0;
  }

LABEL_25:
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 actionSet:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 home];
  if (v8)
  {
    objc_super v9 = +[HMDLightProfileNaturalLightingAction actionWithDictionaryRepresentation:v6 home:v8];
    if (v9)
    {
      id v10 = [HMDLightProfileNaturalLightingAction alloc];
      id v11 = [v9 uuid];
      id v12 = [v9 lightProfileUUID];
      id v13 = -[HMDLightProfileNaturalLightingAction initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:](v10, "initWithUUID:lightProfileUUID:naturalLightingEnabled:actionSet:", v11, v12, [v9 isNaturalLightingEnabled], v7);
    }
    else
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = a1;
      uint64_t v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        int v23 = 138543874;
        __int16 v24 = v21;
        __int16 v25 = 2112;
        id v26 = v7;
        __int16 v27 = 2112;
        __int16 v28 = v8;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation and action set %@:%@", (uint8_t *)&v23, 0x20u);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    uint64_t v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      int v23 = 138543874;
      __int16 v24 = v17;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2112;
      __int16 v28 = 0;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to create natural lighting action with dictionary representation, action set missing home %@:%@", (uint8_t *)&v23, 0x20u);
    }
    id v13 = 0;
  }

  return v13;
}

@end