@interface HMAppleMediaAccessoryPowerAction
+ (BOOL)supportsSecureCoding;
- (BOOL)_handleUpdates:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMAccessory)accessory;
- (HMAppleMediaAccessoryPowerAction)init;
- (HMAppleMediaAccessoryPowerAction)initWithAccessory:(id)a3 targetSleepWakeState:(unint64_t)a4;
- (HMAppleMediaAccessoryPowerAction)initWithCoder:(id)a3;
- (HMAppleMediaAccessoryPowerAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMAppleMediaAccessoryPowerAction)initWithUUID:(id)a3;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)targetSleepWakeState;
- (unint64_t)type;
- (void)initWithAccessory:(void *)a1 targetSleepWakeState:(void *)a2 uuid:(uint64_t)a3;
- (void)setAccessory:(id)a3;
- (void)setTargetSleepWakeState:(unint64_t)a3;
- (void)updateWithAction:(id)a3 completionHandler:(id)a4;
@end

@implementation HMAppleMediaAccessoryPowerAction

- (void).cxx_destruct
{
}

- (void)setTargetSleepWakeState:(unint64_t)a3
{
  self->_targetSleepWakeState = a3;
}

- (void)setAccessory:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAppleMediaAccessoryPowerAction *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = [(HMAppleMediaAccessoryPowerAction *)v6 accessory];
      v9 = [v8 uuid];
      v10 = [(HMAppleMediaAccessoryPowerAction *)self accessory];
      v11 = [v10 uuid];
      if (objc_msgSend(v9, "hmf_isEqualToUUID:", v11))
      {
        uint64_t v12 = [(HMAppleMediaAccessoryPowerAction *)v7 targetSleepWakeState];
        BOOL v13 = v12 == [(HMAppleMediaAccessoryPowerAction *)self targetSleepWakeState];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4 = a3;
  v5 = [(HMAction *)self actionSet];
  v6 = [v5 home];

  v7 = objc_msgSend(v4, "hmf_UUIDForKey:", @"accessory");
  v8 = [v6 accessoryWithUUID:v7];
  v9 = objc_msgSend(v4, "hmf_numberForKey:", @"HMAPA.targetState");

  unint64_t v10 = [v9 unsignedIntegerValue];
  v11 = [v8 category];
  uint64_t v12 = [v11 categoryType];
  int v13 = [v12 isEqualToString:@"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"];

  if (v13)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_accessory, v8);
    self->_targetSleepWakeState = v10;
    os_unfair_lock_unlock(&self->_lock);
  }

  return v13;
}

- (HMAppleMediaAccessoryPowerAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  v8 = [(HMAction *)&v25 initWithDictionary:v6 home:v7];
  if (!v8) {
    goto LABEL_5;
  }
  v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"accessory");
  if (!v9)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = v8;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      v19 = "%{public}@Unable to decode %@, missing accessory id";
      v20 = v16;
      uint32_t v21 = 22;
LABEL_10:
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
LABEL_11:

    int v13 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v7 accessoryWithUUID:v9];
  accessory = v8->_accessory;
  v8->_accessory = (HMAccessory *)v10;

  if (!v8->_accessory)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v22 = v8;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      uint64_t v23 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v27 = v17;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      v31 = v9;
      v19 = "%{public}@Unable to decode %@, failed to resolve accessory %@";
      v20 = v16;
      uint32_t v21 = 32;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  uint64_t v12 = objc_msgSend(v6, "hmf_numberForKey:", @"targetState");
  v8->_targetSleepWakeState = [v12 unsignedIntegerValue];

LABEL_5:
  int v13 = v8;
LABEL_12:

  return v13;
}

- (id)_serializeForAdd
{
  v11.receiver = self;
  v11.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  v3 = [(HMAction *)&v11 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMAppleMediaAccessoryPowerAction *)self accessory];
  id v6 = [v5 uuid];
  id v7 = [v6 UUIDString];
  [v4 setObject:v7 forKeyedSubscript:@"accessory"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMAppleMediaAccessoryPowerAction targetSleepWakeState](self, "targetSleepWakeState"));
  [v4 setObject:v8 forKeyedSubscript:@"targetState"];

  v9 = (void *)[v4 copy];

  return v9;
}

- (BOOL)isAffectedByEndEvents
{
  return [(HMAppleMediaAccessoryPowerAction *)self targetSleepWakeState] == 2;
}

- (BOOL)isValidWithError:(id *)a3
{
  id v4 = [(HMAppleMediaAccessoryPowerAction *)self accessory];
  v5 = [v4 category];
  id v6 = [v5 categoryType];
  if ([v6 isEqualToString:@"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"]) {
    BOOL v7 = [(HMAppleMediaAccessoryPowerAction *)self targetSleepWakeState] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)updateWithAction:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  BOOL v7 = [(HMAction *)self actionSet];
  if (v7)
  {
    v8 = [v9 _serializeForAdd];
    [v7 _updateAction:self changes:v8 completionHandler:v6];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:4];
    v6[2](v6, v8);
  }
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    BOOL v7 = [(HMAppleMediaAccessoryPowerAction *)self accessory];
    v8 = [v6 accessory];
    id v9 = [v7 uuid];
    uint64_t v10 = [v8 uuid];
    char v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);
    char v12 = v11 ^ 1;

    if ((v11 & 1) == 0) {
      [(HMAppleMediaAccessoryPowerAction *)self setAccessory:v8];
    }
    unint64_t v13 = [(HMAppleMediaAccessoryPowerAction *)self targetSleepWakeState];
    if (v13 != [v6 targetSleepWakeState])
    {
      -[HMAppleMediaAccessoryPowerAction setTargetSleepWakeState:](self, "setTargetSleepWakeState:", [v6 targetSleepWakeState]);
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (HMAppleMediaAccessoryPowerAction)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMAppleMediaAccessoryPowerAction;
  v5 = [(HMAction *)&v16 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAPA.accessory"];
  accessory = v5->_accessory;
  v5->_accessory = (HMAccessory *)v6;

  if (v5->_accessory)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMAPA.targetState"];
    v5->_targetSleepWakeState = [v8 unsignedIntegerValue];

LABEL_4:
    id v9 = v5;
    goto LABEL_8;
  }
  uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
  char v11 = v5;
  char v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    unint64_t v13 = HMFGetLogIdentifier();
    uint64_t v14 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive %@, missing accessory", buf, 0x16u);
  }
  id v9 = 0;
LABEL_8:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = -[HMAppleMediaAccessoryPowerAction initWithAccessory:targetSleepWakeState:uuid:]([HMAppleMediaAccessoryPowerAction alloc], self->_accessory, self->_targetSleepWakeState);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)initWithAccessory:(void *)a1 targetSleepWakeState:(void *)a2 uuid:(uint64_t)a3
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)HMAppleMediaAccessoryPowerAction;
    id v7 = objc_msgSendSuper2(&v9, sel_initWithUUID_, 0);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 7, a2);
      a1[8] = a3;
    }
  }

  return a1;
}

- (unint64_t)targetSleepWakeState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t targetSleepWakeState = self->_targetSleepWakeState;
  os_unfair_lock_unlock(p_lock);
  return targetSleepWakeState;
}

- (HMAccessory)accessory
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_accessory;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (unint64_t)type
{
  return 4;
}

- (HMAppleMediaAccessoryPowerAction)initWithAccessory:(id)a3 targetSleepWakeState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 category];
  v8 = [v7 categoryType];
  int v9 = [v8 isEqualToString:@"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E"];

  uint64_t v10 = 0;
  if (a4 && v9)
  {
    self = -[HMAppleMediaAccessoryPowerAction initWithAccessory:targetSleepWakeState:uuid:](self, v6, a4);
    uint64_t v10 = self;
  }

  return v10;
}

- (HMAppleMediaAccessoryPowerAction)initWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  v8 = NSStringFromSelector(a2);
  int v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMAppleMediaAccessoryPowerAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end