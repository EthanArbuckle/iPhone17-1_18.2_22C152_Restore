@interface HMDAppleMediaAccessoryPowerAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isUnsecuringAction;
- (BOOL)requiresDeviceUnlock;
- (HMDAppleMediaAccessory)accessory;
- (HMDAppleMediaAccessoryPowerAction)initWithCoder:(id)a3;
- (HMDAppleMediaAccessoryPowerAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5;
- (HMDAppleMediaAccessoryPowerAction)initWithUUID:(id)a3 accessory:(id)a4 targetSleepWakeState:(unint64_t)a5 actionSet:(id)a6;
- (id)associatedAccessories;
- (id)attributeDescriptions;
- (id)dictionaryRepresentation;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)stateDump;
- (unint64_t)targetSleepWakeState;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)setAccessory:(id)a3;
- (void)setTargetSleepWakeState:(unint64_t)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAppleMediaAccessoryPowerAction

- (void).cxx_destruct
{
}

- (void)setTargetSleepWakeState:(unint64_t)a3
{
  self->_targetSleepWakeState = a3;
}

- (unint64_t)targetSleepWakeState
{
  return self->_targetSleepWakeState;
}

- (void)setAccessory:(id)a3
{
}

- (HMDAppleMediaAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAppleMediaAccessory *)WeakRetained;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDAction *)self uuid];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDAppleMediaAccessoryPowerAction *)self type];
  v7 = HMActionTypeAsString();
  v8 = (void *)[v6 initWithName:@"Type" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  id v4 = a3;
  [(HMDAction *)&v7 encodeWithCoder:v4];
  v5 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
  [v4 encodeObject:v5 forKey:*MEMORY[0x1E4F2C9A0]];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  [v4 encodeObject:v6 forKey:*MEMORY[0x1E4F2C9B0]];
}

- (HMDAppleMediaAccessoryPowerAction)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[HMDAction alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C9A0]];
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F2C9B0]];
    uint64_t v8 = [v7 unsignedIntegerValue];
    v9 = [(HMDAction *)v5 uuid];
    v10 = [(HMDAction *)v5 actionSet];
    v11 = [(HMDAppleMediaAccessoryPowerAction *)self initWithUUID:v9 accessory:v6 targetSleepWakeState:v8 actionSet:v10];

    v12 = v11;
    v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v19.receiver = v12;
      v19.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
      id v17 = [(HMDAppleMediaAccessoryPowerAction *)&v19 class];
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
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
    v14 = [v10 transactionResult];
    if (![v13 propertyWasSet:@"accessoryUUID"])
    {
      if (![v13 propertyWasSet:@"targetSleepWakeState"]) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    v15 = [(HMDAction *)self actionSet];
    v16 = [v15 home];
    id v17 = [v13 accessoryUUID];
    v18 = [v16 accessoryWithUUID:v17];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v19 = v18;
    }
    else {
      objc_super v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      [(HMDAppleMediaAccessoryPowerAction *)self setAccessory:v20];

      if (([v13 propertyWasSet:@"targetSleepWakeState"] & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
    v26 = (void *)MEMORY[0x1D9452090]();
    v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = v32 = v27;
      [v13 accessoryUUID];
      v30 = v33 = v26;
      *(_DWORD *)buf = 138543874;
      v35 = v29;
      __int16 v36 = 2112;
      id v37 = v13;
      __int16 v38 = 2112;
      id v39 = v30;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unknown accessory saved in object model %@: %@", buf, 0x20u);

      v26 = v33;
      v27 = v32;
    }

    if ([v13 propertyWasSet:@"targetSleepWakeState"])
    {
LABEL_20:
      v31 = [v13 targetSleepWakeState];
      -[HMDAppleMediaAccessoryPowerAction setTargetSleepWakeState:](self, "setTargetSleepWakeState:", [v31 integerValue]);

LABEL_21:
      [v14 markChanged];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D9452090]();
    __int16 v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v35 = v24;
      __int16 v36 = 2112;
      id v37 = v11;
      __int16 v38 = 2112;
      id v39 = (id)objc_opt_class();
      id v25 = v39;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [v10 respondWithError:v14];
  }
LABEL_22:
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  if (a4 < 4)
  {
    id v10 = 0;
  }
  else
  {
    id v6 = [HMDAppleMediaAccessoryPowerActionModel alloc];
    objc_super v7 = [(HMDAction *)self uuid];
    id v8 = [(HMDAction *)self actionSet];
    id v9 = [v8 uuid];
    id v10 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v9];

    id v11 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
    v12 = [v11 uuid];
    [(HMDAppleMediaAccessoryPowerActionModel *)v10 setAccessoryUUID:v12];

    id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
    [(HMDAppleMediaAccessoryPowerActionModel *)v10 setTargetSleepWakeState:v13];
  }
  return v10;
}

- (HMDAppleMediaAccessoryPowerAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
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

    if (!v15)
    {
      v34 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        __int16 v36 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v50 = v36;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Parent is not an actionset", buf, 0xCu);
      }
      if (a5)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_42;
    }
    v16 = [v15 home];
    id v17 = [v12 accessoryUUID];
    v18 = [v16 accessoryWithUUID:v17];

    if (!v18)
    {
      id v37 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      __int16 v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v39 = HMFGetLogIdentifier();
        [v12 accessoryUUID];
        uint64_t v40 = v48 = v37;
        *(_DWORD *)buf = 138543618;
        v50 = v39;
        __int16 v51 = 2112;
        uint64_t v52 = (uint64_t)v40;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory with UUID: %@", buf, 0x16u);

        id v37 = v48;
      }

      if (a5)
      {
        [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_41;
    }
    id v19 = v18;
    objc_opt_class();
    int v20 = objc_opt_isKindOfClass() & 1;
    if (v20) {
      v21 = v19;
    }
    else {
      v21 = 0;
    }
    id v47 = v21;

    if (v20)
    {
      __int16 v22 = [v12 targetSleepWakeState];
      uint64_t v23 = [v22 unsignedIntegerValue];

      if ((unint64_t)(v23 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      {
        v44 = [v12 uuid];
        id v25 = [(HMDAppleMediaAccessoryPowerAction *)self initWithUUID:v44 accessory:v19 targetSleepWakeState:v23 actionSet:v15];

        v33 = v25;
        goto LABEL_40;
      }
      uint64_t v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = v46 = v24;
        *(_DWORD *)buf = 138543618;
        v50 = v27;
        __int16 v51 = 2048;
        uint64_t v52 = v23;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Invalid target sleep wake state: %lu", buf, 0x16u);

        uint64_t v24 = v46;
      }

      if (a5)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = 3;
LABEL_36:
        objc_msgSend(v28, "hmErrorWithCode:", v29, v46, v47);
        v33 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x1D9452090]();
      id v25 = self;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v50 = v43;
        __int16 v51 = 2112;
        uint64_t v52 = 0;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not an Apple Media Accessory: %@", buf, 0x16u);
      }
      if (a5)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = 22;
        goto LABEL_36;
      }
    }
    v33 = 0;
    goto LABEL_40;
  }
  v30 = (void *)MEMORY[0x1D9452090]();
  id v25 = self;
  v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v50 = v32;
    _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Action model does not exist", buf, 0xCu);
  }
  if (a5)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
    v33 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
LABEL_43:

  return v33;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  if ([(HMDAction *)&v9 isCompatibleWithAction:v4])
  {
    v5 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
    id v6 = [v4 accessory];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isUnsecuringAction
{
  return 0;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = [a3 uuid];
  v5 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
  id v6 = [v5 uuid];
  char v7 = objc_msgSend(v4, "hmf_isEqualToUUID:", v6);

  return v7;
}

- (id)associatedAccessories
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_super v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Executing Apple TV Power Action", buf, 0xCu);
  }
  uint64_t v13 = [(HMDAppleMediaAccessoryPowerAction *)v10 targetSleepWakeState];
  if (v13)
  {
    if (v13 == 2)
    {
      v14 = &unk_1F2DC7B58;
    }
    else if (v13 == 1)
    {
      v14 = &unk_1F2DC7B40;
    }
    else
    {
      v14 = 0;
    }
    objc_initWeak((id *)buf, v10);
    int v20 = [(HMDAppleMediaAccessoryPowerAction *)v10 accessory];
    v21 = [v20 mediaProfile];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __84__HMDAppleMediaAccessoryPowerAction_executeWithSource_clientName_completionHandler___block_invoke;
    v22[3] = &unk_1E6A193F8;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v8;
    [v21 handleSetValue:v14 withRequestProperty:@"HMDMediaProfileSetPowerKey" withCompletionHandler:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v10;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      uint64_t v19 = [(HMDAppleMediaAccessoryPowerAction *)v16 targetSleepWakeState];
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Invalid target sleep wake state set: %tu", buf, 0x16u);
    }
  }
}

void __84__HMDAppleMediaAccessoryPowerAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = WeakRetained;
  id v10 = HMFGetOSLogHandle();
  id v11 = v10;
  if (v5)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v19 = 138543874;
    int v20 = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v5;
    uint64_t v13 = "%{public}@Failed to execute %@ with error: %@";
    v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v12 = HMFGetLogIdentifier();
    int v19 = 138543618;
    int v20 = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    uint64_t v13 = "%{public}@Successfully executed %@";
    v14 = v11;
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    uint32_t v16 = 22;
  }
  _os_log_impl(&dword_1D49D5000, v14, v15, v13, (uint8_t *)&v19, v16);

LABEL_7:
  id v17 = _Block_copy(*(const void **)(a1 + 32));
  v18 = v17;
  if (v17) {
    (*((void (**)(void *, id))v17 + 2))(v17, v5);
  }
}

- (id)dictionaryRepresentation
{
  v11.receiver = self;
  v11.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  id v3 = [(HMDAction *)&v11 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
  id v6 = [v5 uuid];
  id v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2C9A8]];

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2C9B8]];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (id)stateDump
{
  id v3 = NSString;
  id v4 = [(HMDAction *)self uuid];
  id v5 = [(HMDAppleMediaAccessoryPowerAction *)self accessory];
  id v6 = [v3 stringWithFormat:@"Action uuid: %@, Accessory: %@, Power State: %tu", v4, v5, -[HMDAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState")];

  return v6;
}

- (unint64_t)type
{
  return 4;
}

- (HMDAppleMediaAccessoryPowerAction)initWithUUID:(id)a3 accessory:(id)a4 targetSleepWakeState:(unint64_t)a5 actionSet:(id)a6
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAppleMediaAccessoryPowerAction;
  objc_super v11 = [(HMDAction *)&v14 initWithUUID:a3 actionSet:a6];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v10);
    v12->_targetSleepWakeState = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_40356 != -1) {
    dispatch_once(&logCategory__hmf_once_t26_40356, &__block_literal_global_40357);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v27_40358;
  return v2;
}

uint64_t __48__HMDAppleMediaAccessoryPowerAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27_40358;
  logCategory__hmf_once_v27_40358 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  if (!v8) {
    _HMFPreconditionFailure();
  }
  id v9 = v8;
  if ([v8 unsignedIntegerValue] == 4)
  {
    id v10 = [HMDAppleMediaAccessoryPowerActionModel alloc];
    objc_super v11 = [MEMORY[0x1E4F29128] UUID];
    id v12 = [v7 uuid];
    uint64_t v13 = [(HMDBackingStoreModelObject *)v10 initWithObjectChangeType:0 uuid:v11 parentUUID:v12];

    [(HMDAppleMediaAccessoryPowerActionModel *)v13 loadModelWithActionInformation:v6];
    objc_super v14 = [(HMDAppleMediaAccessoryPowerActionModel *)v13 accessoryUUID];
    os_log_type_t v15 = [v7 accessoryWithUUID:v14];

    id v16 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }
    id v18 = v17;

    if (v18)
    {
      int v19 = [(HMDAppleMediaAccessoryPowerActionModel *)v13 targetSleepWakeState];
      uint64_t v20 = [v19 unsignedIntegerValue];

      if ((unint64_t)(v20 - 3) > 0xFFFFFFFFFFFFFFFDLL)
      {
        __int16 v36 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kActionUUID");
        id v37 = v36;
        if (v36)
        {
          id v38 = v36;
        }
        else
        {
          id v38 = [MEMORY[0x1E4F29128] UUID];
        }
        id v39 = v38;

        v30 = [[HMDAppleMediaAccessoryPowerAction alloc] initWithUUID:v39 accessory:v18 targetSleepWakeState:v20 actionSet:0];
        goto LABEL_22;
      }
      uint64_t v21 = MEMORY[0x1D9452090]();
      id v22 = a1;
      __int16 v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v24 = v41 = v21;
        *(_DWORD *)buf = 138543618;
        v44 = v24;
        __int16 v45 = 2048;
        uint64_t v46 = v20;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid power state: %tu", buf, 0x16u);

        uint64_t v21 = v41;
      }

      uint64_t v25 = (void *)v21;
    }
    else
    {
      uint64_t v31 = MEMORY[0x1D9452090]();
      id v32 = a1;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        [(HMDAppleMediaAccessoryPowerActionModel *)v13 accessoryUUID];
        v35 = uint64_t v42 = v31;
        *(_DWORD *)buf = 138543618;
        v44 = v34;
        __int16 v45 = 2112;
        uint64_t v46 = (uint64_t)v35;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find an Apple TV in the home with UUID: %@", buf, 0x16u);

        uint64_t v31 = v42;
      }

      uint64_t v25 = (void *)v31;
    }
    v30 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = a1;
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v44 = v29;
    __int16 v45 = 2112;
    uint64_t v46 = (uint64_t)v9;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);
  }
  v30 = 0;
LABEL_23:

  return v30;
}

@end