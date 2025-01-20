@interface HMCharacteristicEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMCharacteristic)characteristic;
- (HMCharacteristicEvent)initWithCharacteristic:(HMCharacteristic *)characteristic triggerValue:(id)triggerValue;
- (HMCharacteristicEvent)initWithCoder:(id)a3;
- (HMCharacteristicEvent)initWithDict:(id)a3 characteristic:(id)a4 triggerValue:(id)a5;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)triggerValue;
- (void)_updateFromDictionary:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setTriggerValue:(id)a3;
- (void)updateTriggerValue:(id)triggerValue completionHandler:(void *)completion;
@end

@implementation HMCharacteristicEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);

  objc_storeStrong((id *)&self->_triggerValue, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMMutableCharacteristicEvent alloc];
  v5 = [(HMCharacteristicEvent *)self characteristic];
  v6 = [(HMCharacteristicEvent *)self triggerValue];
  v7 = [(HMCharacteristicEvent *)v4 initWithCharacteristic:v5 triggerValue:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"kCharacteristicValue"];
  v9 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kServiceInstanceID");
  uint64_t v11 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  v12 = (void *)v11;
  if (v9 && v10 && v11)
  {
    v13 = [v7 _findCharacteristic:v11 forService:v10 accessoryUUID:v9];
    if (v13)
    {
      v14 = [[HMCharacteristicEvent alloc] initWithDict:v6 characteristic:v13 triggerValue:v8];
    }
    else
    {
      v19 = (void *)MEMORY[0x19F3A64A0]();
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = v24 = v19;
        *(_DWORD *)buf = 138544386;
        v26 = v22;
        __int16 v27 = 2112;
        uint64_t v28 = objc_opt_class();
        __int16 v29 = 2112;
        v30 = v9;
        __int16 v31 = 2112;
        v32 = v10;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@", buf, 0x34u);

        v19 = v24;
      }

      v14 = 0;
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x19F3A64A0]();
    id v16 = a1;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v18;
      __int16 v27 = 2112;
      uint64_t v28 = objc_opt_class();
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/service/characteristic ids", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMCharacteristicEvent alloc];
  v5 = [(HMCharacteristicEvent *)self characteristic];
  id v6 = [(HMCharacteristicEvent *)self triggerValue];
  id v7 = [(HMCharacteristicEvent *)v4 initWithCharacteristic:v5 triggerValue:v6];

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMCharacteristicEvent;
  BOOL v5 = [(HMEvent *)&v12 mergeFromNewObject:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [(HMCharacteristicEvent *)self triggerValue];
    v8 = [v6 triggerValue];
    char v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      v10 = [v6 triggerValue];
      [(HMCharacteristicEvent *)self setTriggerValue:v10];

      BOOL v5 = 1;
    }
  }
  return v5;
}

- (HMCharacteristicEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMCharacteristicEvent;
  BOOL v5 = [(HMEvent *)&v12 initWithCoder:v4];
  if (v5)
  {
    id v6 = allowedCharValueTypes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"characteristicValue"];
    triggerValue = v5->_triggerValue;
    v5->_triggerValue = (NSCopying *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristic"];
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v9;
  }
  return v5;
}

- (void)_updateFromDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMCharacteristicEvent;
  id v4 = a3;
  [(HMEvent *)&v6 _updateFromDictionary:v4];
  BOOL v5 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kCharacteristicValue", v6.receiver, v6.super_class);

  [(HMCharacteristicEvent *)self setTriggerValue:v5];
}

- (id)_serializeForAdd
{
  v3 = [(HMCharacteristicEvent *)self characteristic];
  id v4 = [v3 service];

  uint64_t v5 = [v4 accessory];
  objc_super v6 = (void *)v5;
  uint64_t v7 = 0;
  if (v4 && v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)HMCharacteristicEvent;
    v8 = [(HMEvent *)&v18 _serializeForAdd];
    uint64_t v9 = (void *)[v8 mutableCopy];

    v10 = [v4 accessoryUUID];
    uint64_t v11 = [v10 UUIDString];
    [v9 setObject:v11 forKeyedSubscript:@"kAccessoryUUID"];

    objc_super v12 = [v4 instanceID];
    [v9 setObject:v12 forKeyedSubscript:@"kServiceInstanceID"];

    v13 = [(HMCharacteristicEvent *)self characteristic];
    v14 = [v13 instanceID];
    [v9 setObject:v14 forKeyedSubscript:@"kCharacteristicInstanceID"];

    v15 = [(HMCharacteristicEvent *)self triggerValue];

    if (v15)
    {
      id v16 = [(HMCharacteristicEvent *)self triggerValue];
      [v9 setObject:v16 forKeyedSubscript:@"kCharacteristicValue"];
    }
    uint64_t v7 = (void *)[v9 copy];
  }

  return v7;
}

- (void)updateTriggerValue:(id)triggerValue completionHandler:(void *)completion
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  objc_super v6 = (char *)triggerValue;
  uint64_t v7 = completion;
  uint64_t v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v26 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristicEvent updateTriggerValue:completionHandler:]", @"completion"];
    __int16 v27 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v28 = self;
    __int16 v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v30;
      __int16 v36 = 2112;
      v37 = (const char *)v26;
      _os_log_impl(&dword_19D1A8000, v29, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v31 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v26 userInfo:0];
    objc_exception_throw(v31);
  }
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    v10 = [(HMEvent *)self eventTrigger];
    uint64_t v11 = v10;
    if (!v10 || ([v10 home], objc_super v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
    {
      v19 = [v9 delegateCaller];
      id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
      [v19 callCompletion:v7 error:v20];

LABEL_10:
      goto LABEL_18;
    }
    v13 = [(HMCharacteristicEvent *)self triggerValue];
    int v14 = HMFEqualObjects();

    if (v14)
    {
      v15 = (void *)MEMORY[0x19F3A64A0]();
      id v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_super v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v18;
        __int16 v36 = 2112;
        v37 = v6;
        _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_INFO, "%{public}@Trigger value is already %@", buf, 0x16u);
      }
      v19 = [v9 delegateCaller];
      [v19 callCompletion:v7 error:0];
      goto LABEL_10;
    }
    if (v6)
    {
      v32 = @"kCharacteristicValue";
      __int16 v33 = v6;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    }
    else
    {
      v25 = 0;
    }
    [(HMEvent *)self _updateEventWithPayload:v25 completionHandler:v7];
  }
  else
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v24;
      __int16 v36 = 2080;
      v37 = "-[HMCharacteristicEvent updateTriggerValue:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v11);
  }
LABEL_18:
}

- (void)setTriggerValue:(id)a3
{
  id v4 = (NSCopying *)a3;
  os_unfair_lock_lock_with_options();
  triggerValue = self->_triggerValue;
  self->_triggerValue = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (id)triggerValue
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_triggerValue;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCharacteristic:(id)a3
{
  id v4 = (HMCharacteristic *)a3;
  os_unfair_lock_lock_with_options();
  characteristic = self->_characteristic;
  self->_characteristic = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMCharacteristic)characteristic
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_characteristic;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (HMCharacteristicEvent)initWithCharacteristic:(HMCharacteristic *)characteristic triggerValue:(id)triggerValue
{
  v22[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = characteristic;
  id v7 = triggerValue;
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 3;
    goto LABEL_6;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [(HMCharacteristic *)v6 properties];
  char v10 = [v9 containsObject:@"HMCharacteristicPropertySupportsEventNotification"];

  if ((v10 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 7;
LABEL_6:
    v19 = [v17 hmStringFromErrorCode:v18];
    id v20 = [v15 exceptionWithName:v16 reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  v21 = @"kEventUUIDKey";
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  v22[0] = v11;
  objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v13 = [(HMCharacteristicEvent *)self initWithDict:v12 characteristic:v6 triggerValue:v8];

  return v13;
}

- (HMCharacteristicEvent)initWithDict:(id)a3 characteristic:(id)a4 triggerValue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMCharacteristicEvent;
  uint64_t v11 = [(HMEvent *)&v16 initWithDict:a3];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a4);
    uint64_t v13 = [v10 copy];
    triggerValue = v12->_triggerValue;
    v12->_triggerValue = (NSCopying *)v13;
  }
  return v12;
}

@end