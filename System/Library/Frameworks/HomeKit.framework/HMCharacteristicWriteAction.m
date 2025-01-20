@interface HMCharacteristicWriteAction
+ (BOOL)supportsSecureCoding;
+ (HMCharacteristicWriteAction)actionWithProtoBuf:(id)a3 home:(id)a4;
+ (HMCharacteristicWriteAction)new;
+ (NSSet)allowedTargetValueClassesForShortcuts;
- (BOOL)_handleUpdates:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfAllowedTargetValueClass:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (HMCharacteristic)characteristic;
- (HMCharacteristicWriteAction)init;
- (HMCharacteristicWriteAction)initWithCharacteristic:(HMCharacteristic *)characteristic targetValue:(id)targetValue;
- (HMCharacteristicWriteAction)initWithCoder:(id)a3;
- (HMCharacteristicWriteAction)initWithDictionary:(id)a3 home:(id)a4;
- (HMCharacteristicWriteAction)initWithUUID:(id)a3;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProtoBuf;
- (id)initWithCharacteristic:(void *)a3 targetValue:(uint64_t)a4 uuid:;
- (id)targetValue;
- (unint64_t)type;
- (void)__configureWithContext:(id)a3 actionSet:(id)a4;
- (void)updateTargetValue:(id)targetValue completionHandler:(void *)completion;
@end

@implementation HMCharacteristicWriteAction

- (unint64_t)type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMCharacteristicWriteAction *)a3;
  if (v4 == self)
  {
    char v12 = 1;
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
    if (v6
      && ([(HMCharacteristicWriteAction *)self characteristic],
          v7 = objc_claimAutoreleasedReturnValue(),
          [(HMCharacteristicWriteAction *)v6 characteristic],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      v10 = [(HMCharacteristicWriteAction *)self targetValue];
      v11 = [(HMCharacteristicWriteAction *)v6 targetValue];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (HMCharacteristic)characteristic
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_characteristic;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (id)targetValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_targetValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)__configureWithContext:(id)a3 actionSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMCharacteristicWriteAction;
  [(HMAction *)&v11 __configureWithContext:v6 actionSet:v7];
  v8 = [v7 home];
  os_unfair_lock_lock_with_options();
  resolveCharacteristic(self->_characteristic, v8);
  int v9 = (HMCharacteristic *)objc_claimAutoreleasedReturnValue();
  characteristic = self->_characteristic;
  self->_characteristic = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMCharacteristicWriteAction)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMCharacteristicWriteAction;
  v5 = [(HMAction *)&v20 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristic"];
  characteristic = v5->_characteristic;
  v5->_characteristic = (HMCharacteristic *)v6;

  if (!v5->_characteristic)
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = v5;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      v17 = "%{public}@Unable to unarchive %@, missing characteristic";
LABEL_9:
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0x16u);
    }
LABEL_10:

    objc_super v11 = 0;
    goto LABEL_11;
  }
  v8 = allowedCharValueTypes();
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"characteristicValue"];
  targetValue = v5->_targetValue;
  v5->_targetValue = (NSCopying *)v9;

  if (!v5->_targetValue)
  {
    char v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = v5;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      v17 = "%{public}@Unable to unarchive %@, missing target value";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  objc_super v11 = v5;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (id)encodeAsProtoBuf
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(HMCharacteristicWriteAction *)self characteristic];
  id v4 = [v3 service];

  v5 = [v4 accessory];
  uint64_t v6 = [v5 home];
  if (v6)
  {
    id v7 = objc_alloc_init(HMPBCharacteristicWriteAction);
    v8 = [(HMAction *)self uuid];
    uint64_t v9 = objc_msgSend(v8, "hm_convertToData");
    [(HMPBCharacteristicWriteAction *)v7 setActionUUID:v9];

    v10 = [(HMCharacteristicWriteAction *)self characteristic];
    objc_super v11 = +[HMPBCharacteristicReference characteristicReferenceWithCharacteristic:v10];
    [(HMPBCharacteristicWriteAction *)v7 setCharacteristicReference:v11];

    char v12 = [(HMCharacteristicWriteAction *)self targetValue];
    LODWORD(v10) = [(HMCharacteristicWriteAction *)self isKindOfAllowedTargetValueClass:v12];

    if (v10)
    {
      v13 = (void *)MEMORY[0x1E4F28DB0];
      v14 = [(HMCharacteristicWriteAction *)self targetValue];
      id v33 = 0;
      v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v33];
      id v16 = v33;
      [(HMPBCharacteristicWriteAction *)v7 setTargetValue:v15];

      v17 = [(HMPBCharacteristicWriteAction *)v7 targetValue];

      if (v17)
      {

        uint64_t v18 = objc_alloc_init(HMPBActionContainer);
        [(HMPBActionContainer *)v18 setType:1];
        [(HMPBActionContainer *)v18 setCharacteristicWriteAction:v7];
LABEL_15:

        goto LABEL_16;
      }
      v28 = (void *)MEMORY[0x19F3A64A0]();
      v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v35 = v31;
        __int16 v36 = 2112;
        id v37 = v16;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode targetValue: %@", buf, 0x16u);
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      __int16 v23 = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        v26 = [(HMCharacteristicWriteAction *)v23 targetValue];
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        __int16 v36 = 2112;
        id v37 = (id)objc_opt_class();
        id v27 = v37;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Target Value is of unhandled class %@", buf, 0x16u);
      }
    }
    uint64_t v18 = 0;
    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x19F3A64A0]();
  objc_super v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v35 = v21;
    __int16 v36 = 2112;
    id v37 = self;
    __int16 v38 = 2112;
    uint64_t v39 = 0;
    _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed encode action as protobuf, home is invalid %@:%@", buf, 0x20u);
  }
  uint64_t v18 = 0;
LABEL_16:

  return v18;
}

- (BOOL)isKindOfAllowedTargetValueClass:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[HMCharacteristicWriteAction allowedTargetValueClassesForShortcuts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v5 = -[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:]([HMCharacteristicWriteAction alloc], self->_characteristic, self->_targetValue, 0);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)initWithCharacteristic:(void *)a3 targetValue:(uint64_t)a4 uuid:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)HMCharacteristicWriteAction;
    long long v10 = (id *)objc_msgSendSuper2(&v15, sel_initWithUUID_, a4);
    long long v11 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 7, a2);
      uint64_t v12 = [v9 copy];
      id v13 = v11[8];
      v11[8] = (id)v12;
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
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
    id v7 = [(HMAction *)self actionSet];
    id v8 = [v7 home];

    id v9 = [v6 characteristic];
    long long v10 = [v6 targetValue];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    char v12 = HMFEqualObjects();
    if ((v12 & 1) == 0) {
      objc_storeStrong((id *)&self->_targetValue, v10);
    }
    if (HMFEqualObjects())
    {
      char v13 = v12 ^ 1;
    }
    else
    {
      resolveCharacteristic(v9, v8);
      uint64_t v14 = (HMCharacteristic *)objc_claimAutoreleasedReturnValue();
      characteristic = self->_characteristic;
      self->_characteristic = v14;

      char v13 = 1;
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_handleUpdates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kActionType"];
  id v6 = v5;
  if (v5 && ![v5 unsignedIntegerValue])
  {
    id v8 = [v4 objectForKeyedSubscript:@"kCharacteristicValue"];
    BOOL v7 = v8 != 0;
    if (v8)
    {
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&self->_targetValue, v8);
      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_serializeForAdd
{
  v17[4] = *MEMORY[0x1E4F143B8];
  if ([(HMAction *)self isValid])
  {
    v15.receiver = self;
    v15.super_class = (Class)HMCharacteristicWriteAction;
    id v3 = [(HMAction *)&v15 _serializeForAdd];
    id v4 = (void *)[v3 mutableCopy];

    uint64_t v5 = [(HMCharacteristicWriteAction *)self characteristic];
    id v6 = [v5 service];
    v16[0] = @"kAccessoryUUID";
    BOOL v7 = [v6 accessoryUUID];
    id v8 = [v7 UUIDString];
    v17[0] = v8;
    v16[1] = @"kServiceInstanceID";
    id v9 = [v6 instanceID];
    v17[1] = v9;
    v16[2] = @"kCharacteristicInstanceID";
    long long v10 = [v5 instanceID];
    v17[2] = v10;
    v16[3] = @"kCharacteristicValue";
    long long v11 = [(HMCharacteristicWriteAction *)self targetValue];
    v17[3] = v11;
    char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
    [v4 addEntriesFromDictionary:v12];

    char v13 = (void *)[v4 copy];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)requiresDeviceUnlock
{
  v2 = [(HMCharacteristicWriteAction *)self characteristic];
  char v3 = [v2 requiresDeviceUnlock];

  return v3;
}

- (BOOL)isAffectedByEndEvents
{
  char v3 = [(HMCharacteristicWriteAction *)self characteristic];
  id v4 = [v3 characteristicType];
  if (isRestoreSupportedForCharacteristic(v4))
  {
    uint64_t v5 = [(HMCharacteristicWriteAction *)self targetValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    char v8 = [v7 isEqualToNumber:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isValidWithError:(id *)a3
{
  uint64_t v5 = [(HMCharacteristicWriteAction *)self characteristic];
  id v6 = [v5 properties];
  char v7 = [v6 containsObject:@"HMCharacteristicPropertyWritable"];

  if ((v7 & 1) == 0)
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:5];
      BOOL v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  char v8 = [(HMCharacteristicWriteAction *)self targetValue];

  if (!v8) {
    goto LABEL_6;
  }
  id v9 = [v5 service];
  long long v10 = [v9 accessory];
  BOOL v11 = v10 != 0;

LABEL_7:
  return v11;
}

- (void)updateTargetValue:(id)targetValue completionHandler:(void *)completion
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = targetValue;
  char v7 = completion;
  char v8 = [(HMAction *)self context];
  if (!v7)
  {
    uint64_t v21 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristicWriteAction updateTargetValue:completionHandler:]", @"completion"];
    v22 = (void *)MEMORY[0x19F3A64A0]();
    __int16 v23 = self;
    uint64_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = (const char *)v21;
      _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v26 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v21 userInfo:0];
    objc_exception_throw(v26);
  }
  id v9 = v8;
  if (v8)
  {
    if (v6)
    {
      long long v10 = [(HMAction *)self actionSet];
      BOOL v11 = [v10 home];
      if (v11)
      {
        char v12 = (void *)[v6 copy];

        char v13 = [(HMAction *)self uuid];

        if (v13)
        {
          v27[0] = @"kActionType";
          v27[1] = @"kCharacteristicValue";
          v28[0] = &unk_1EEF07E18;
          v28[1] = v12;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
          [v10 _updateAction:self changes:v14 completionHandler:v7];
        }
        else
        {
          os_unfair_lock_lock_with_options();
          objc_storeStrong((id *)&self->_targetValue, v12);
          os_unfair_lock_unlock(&self->_lock);
          uint64_t v14 = [v9 delegateCaller];
          [v14 callCompletion:v7 error:0];
        }

        id v6 = v12;
      }
      else
      {
        v19 = [v9 delegateCaller];
        objc_super v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:21];
        [v19 callCompletion:v7 error:v20];
      }
    }
    else
    {
      id v6 = [v8 delegateCaller];
      long long v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v6 callCompletion:v7 error:v10];
    }
  }
  else
  {
    objc_super v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v30 = v18;
      __int16 v31 = 2080;
      v32 = "-[HMCharacteristicWriteAction updateTargetValue:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    long long v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v10);
  }
}

- (HMCharacteristicWriteAction)initWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)HMCharacteristicWriteAction;
  char v8 = [(HMAction *)&v31 initWithDictionary:v6 home:v7];
  if (!v8) {
    goto LABEL_8;
  }
  id v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  long long v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kServiceInstanceID");
  uint64_t v11 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  char v12 = (void *)v11;
  if (!v9 || !v10 || !v11)
  {
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    v19 = v8;
    objc_super v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v22 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      uint64_t v35 = v22;
      __int16 v23 = "%{public}@Unable to decode %@, missing accessory/service/characteristic ids";
LABEL_13:
      id v26 = v20;
      uint32_t v27 = 22;
LABEL_14:
      _os_log_impl(&dword_19D1A8000, v26, OS_LOG_TYPE_ERROR, v23, buf, v27);
    }
LABEL_15:

    v17 = 0;
    goto LABEL_16;
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"kCharacteristicValue"];
  targetValue = v8->_targetValue;
  v8->_targetValue = (NSCopying *)v13;

  if (!v8->_targetValue)
  {
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v24 = v8;
    objc_super v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      uint64_t v25 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v21;
      __int16 v34 = 2112;
      uint64_t v35 = v25;
      __int16 v23 = "%{public}@Unable to decode %@, missing target value";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  uint64_t v15 = [v7 _findCharacteristic:v12 forService:v10 accessoryUUID:v9];
  characteristic = v8->_characteristic;
  v8->_characteristic = (HMCharacteristic *)v15;

  if (!v8->_characteristic)
  {
    uint64_t v18 = (void *)MEMORY[0x19F3A64A0]();
    v29 = v8;
    objc_super v20 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v21 = HMFGetLogIdentifier();
    uint64_t v30 = objc_opt_class();
    *(_DWORD *)buf = 138544386;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    __int16 v36 = 2112;
    id v37 = v9;
    __int16 v38 = 2112;
    uint64_t v39 = v10;
    __int16 v40 = 2112;
    v41 = v12;
    __int16 v23 = "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@";
    id v26 = v20;
    uint32_t v27 = 52;
    goto LABEL_14;
  }

LABEL_8:
  v17 = v8;
LABEL_16:

  return v17;
}

- (HMCharacteristicWriteAction)initWithCharacteristic:(HMCharacteristic *)characteristic targetValue:(id)targetValue
{
  id v6 = characteristic;
  id v7 = targetValue;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_5:
    uint64_t v11 = (HMCharacteristicWriteAction *)_HMFPreconditionFailure();
    [(HMCharacteristicWriteAction *)v11 initWithUUID:v13];
  }
  char v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = (HMCharacteristicWriteAction *)-[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:](self, v6, v7, 0);

  return v9;
}

- (HMCharacteristicWriteAction)initWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  char v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (HMCharacteristicWriteAction)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (HMCharacteristicWriteAction)actionWithProtoBuf:(id)a3 home:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 characteristicReference];
  id v9 = +[HMCharacteristic characteristicWithCharacteristicReference:v8 home:v7];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v11 = +[HMCharacteristicWriteAction allowedTargetValueClassesForShortcuts];
    SEL v12 = [v6 targetValue];
    id v24 = 0;
    id v13 = [v10 unarchivedObjectOfClasses:v11 fromData:v12 error:&v24];
    id v14 = v24;

    if (v13)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F29128];
      id v16 = [v6 actionUUID];
      v17 = objc_msgSend(v15, "hmf_UUIDWithBytesAsData:", v16);

      uint64_t v18 = -[HMCharacteristicWriteAction initWithCharacteristic:targetValue:uuid:]([HMCharacteristicWriteAction alloc], v9, v13, (uint64_t)v17);
    }
    else
    {
      v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = a1;
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v26 = v22;
        __int16 v27 = 2112;
        id v28 = v14;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed target value from target value data: %@", buf, 0x16u);
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  return (HMCharacteristicWriteAction *)v18;
}

+ (NSSet)allowedTargetValueClassesForShortcuts
{
  if (allowedTargetValueClassesForShortcuts__hmf_once_t18 != -1) {
    dispatch_once(&allowedTargetValueClassesForShortcuts__hmf_once_t18, &__block_literal_global_20721);
  }
  v2 = (void *)allowedTargetValueClassesForShortcuts__hmf_once_v19;

  return (NSSet *)v2;
}

uint64_t __68__HMCharacteristicWriteAction_allowedTargetValueClassesForShortcuts__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v1 = allowedTargetValueClassesForShortcuts__hmf_once_v19;
  allowedTargetValueClassesForShortcuts__hmf_once_v19 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMCharacteristicWriteAction)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  uint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end