@interface HMCharacteristicThresholdRangeEvent
+ (BOOL)isSupportedForHome:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMCharacteristic)characteristic;
- (HMCharacteristicThresholdRangeEvent)initWithCharacteristic:(HMCharacteristic *)characteristic thresholdRange:(HMNumberRange *)thresholdRange;
- (HMCharacteristicThresholdRangeEvent)initWithCoder:(id)a3;
- (HMCharacteristicThresholdRangeEvent)initWithDict:(id)a3 characteristic:(id)a4 thresholdRange:(id)a5;
- (HMNumberRange)thresholdRange;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateFromDictionary:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setThresholdRange:(id)a3;
- (void)updateThresholdRange:(id)a3 completionHandler:(id)a4;
@end

@implementation HMCharacteristicThresholdRangeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristic, 0);

  objc_storeStrong((id *)&self->_thresholdRange, 0);
}

- (HMCharacteristicThresholdRangeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v5 = [(HMEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristic"];
    characteristic = v5->_characteristic;
    v5->_characteristic = (HMCharacteristic *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
    v10 = [[HMNumberRange alloc] initWithMinValue:v8 maxValue:v9];
    thresholdRange = v5->_thresholdRange;
    v5->_thresholdRange = v10;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableCharacteristicThresholdRangeEvent alloc];
  v5 = [(HMCharacteristicThresholdRangeEvent *)self characteristic];
  uint64_t v6 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
  v7 = [(HMCharacteristicThresholdRangeEvent *)v4 initWithCharacteristic:v5 thresholdRange:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
  v9 = objc_msgSend(v6, "hmf_numberForKey:", @"kServiceInstanceID");
  uint64_t v10 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
  v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    v12 = [v7 _findCharacteristic:v10 forService:v9 accessoryUUID:v8];
    if (v12)
    {
      objc_super v13 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMin");
      v14 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMax");
      v15 = [HMCharacteristicThresholdRangeEvent alloc];
      v16 = [[HMNumberRange alloc] initWithMinValue:v13 maxValue:v14];
      v17 = [(HMCharacteristicThresholdRangeEvent *)v15 initWithDict:v6 characteristic:v12 thresholdRange:v16];
    }
    else
    {
      v22 = (void *)MEMORY[0x19F3A64A0]();
      id v23 = a1;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        int v27 = 138544386;
        v28 = v25;
        __int16 v29 = 2112;
        uint64_t v30 = objc_opt_class();
        __int16 v31 = 2112;
        v32 = v8;
        __int16 v33 = 2112;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, failed to resolve characteristic %@/%@/%@", (uint8_t *)&v27, 0x34u);
      }
      v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    id v19 = a1;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v21;
      __int16 v29 = 2112;
      uint64_t v30 = objc_opt_class();
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode %@, missing accessory/service/characteristic ids", (uint8_t *)&v27, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

+ (BOOL)isSupportedForHome:(id)a3
{
  return +[HMEvent sharedTriggerActivationSupportedForHome:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMCharacteristicThresholdRangeEvent alloc];
  v5 = [(HMCharacteristicThresholdRangeEvent *)self characteristic];
  id v6 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
  id v7 = [(HMCharacteristicThresholdRangeEvent *)v4 initWithCharacteristic:v5 thresholdRange:v6];

  return v7;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  BOOL v5 = [(HMEvent *)&v14 mergeFromNewObject:v4];
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
    v9 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
    uint64_t v10 = [v8 thresholdRange];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      v12 = [v8 thresholdRange];
      [(HMCharacteristicThresholdRangeEvent *)self setThresholdRange:v12];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)updateThresholdRange:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(HMEvent *)self context];
  if (!v7)
  {
    uint64_t v28 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMCharacteristicThresholdRangeEvent updateThresholdRange:completionHandler:]", @"completion"];
    __int16 v29 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v30 = self;
    __int16 v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v32;
      __int16 v36 = 2112;
      uint64_t v37 = (const char *)v28;
      _os_log_impl(&dword_19D1A8000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v28 userInfo:0];
    objc_exception_throw(v33);
  }
  v9 = v8;
  if (!v8)
  {
    v17 = (void *)MEMORY[0x19F3A64A0]();
    v18 = self;
    id v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v20;
      __int16 v36 = 2080;
      uint64_t v37 = "-[HMCharacteristicThresholdRangeEvent updateThresholdRange:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v19, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v7[2](v7, v16);
    goto LABEL_12;
  }
  if (!v6)
  {
    v16 = [v8 delegateCaller];
    v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v16 callCompletion:v7 error:v21];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v10 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v13 = self;
    objc_super v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v15;
      __int16 v36 = 2112;
      uint64_t v37 = v6;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_INFO, "%{public}@Threshold range is already %@", buf, 0x16u);
    }
    v16 = [v9 delegateCaller];
    [v16 callCompletion:v7 error:0];
    goto LABEL_12;
  }
  v22 = [MEMORY[0x1E4F1CA60] dictionary];
  id v23 = [v6 minValue];

  if (v23)
  {
    v24 = [v6 minValue];
    [v22 setObject:v24 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
  }
  v25 = [v6 maxValue];

  if (v25)
  {
    v26 = [v6 maxValue];
    [v22 setObject:v26 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
  }
  int v27 = (void *)[v22 copy];
  [(HMEvent *)self _updateEventWithPayload:v27 completionHandler:v7];

LABEL_13:
}

- (id)_serializeForAdd
{
  v22.receiver = self;
  v22.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  v3 = [(HMEvent *)&v22 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  BOOL v5 = [(HMCharacteristicThresholdRangeEvent *)self characteristic];
  id v6 = [v5 service];

  id v7 = [v6 accessoryUUID];
  id v8 = [v7 UUIDString];
  [v4 setObject:v8 forKeyedSubscript:@"kAccessoryUUID"];

  v9 = [v6 instanceID];
  [v4 setObject:v9 forKeyedSubscript:@"kServiceInstanceID"];

  uint64_t v10 = [(HMCharacteristicThresholdRangeEvent *)self characteristic];
  int v11 = [v10 instanceID];
  [v4 setObject:v11 forKeyedSubscript:@"kCharacteristicInstanceID"];

  v12 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
  objc_super v13 = [v12 minValue];

  if (v13)
  {
    objc_super v14 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
    v15 = [v14 minValue];
    [v4 setObject:v15 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
  }
  v16 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
  v17 = [v16 maxValue];

  if (v17)
  {
    v18 = [(HMCharacteristicThresholdRangeEvent *)self thresholdRange];
    id v19 = [v18 maxValue];
    [v4 setObject:v19 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
  }
  v20 = (void *)[v4 copy];

  return v20;
}

- (void)_updateFromDictionary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  id v4 = a3;
  [(HMEvent *)&v8 _updateFromDictionary:v4];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMin", v8.receiver, v8.super_class);
  uint64_t v6 = objc_msgSend(v4, "hmf_numberForKey:", @"kCharacteristicThresholdRangeEventThresholdRangeMax");

  if (v5 | v6)
  {
    id v7 = [[HMNumberRange alloc] initWithMinValue:v5 maxValue:v6];
    [(HMCharacteristicThresholdRangeEvent *)self setThresholdRange:v7];
  }
}

- (void)setThresholdRange:(id)a3
{
  id v4 = (HMNumberRange *)a3;
  os_unfair_lock_lock_with_options();
  thresholdRange = self->_thresholdRange;
  self->_thresholdRange = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (HMNumberRange)thresholdRange
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_thresholdRange;
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

- (HMCharacteristicThresholdRangeEvent)initWithDict:(id)a3 characteristic:(id)a4 thresholdRange:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMCharacteristicThresholdRangeEvent;
  int v11 = [(HMEvent *)&v14 initWithDict:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristic, a4);
    objc_storeStrong((id *)&v12->_thresholdRange, a5);
  }

  return v12;
}

- (HMCharacteristicThresholdRangeEvent)initWithCharacteristic:(HMCharacteristic *)characteristic thresholdRange:(HMNumberRange *)thresholdRange
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = characteristic;
  id v7 = thresholdRange;
  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 3;
    goto LABEL_6;
  }
  objc_super v8 = v7;
  id v9 = [(HMCharacteristic *)v6 properties];
  char v10 = [v9 containsObject:@"HMCharacteristicPropertySupportsEventNotification"];

  if ((v10 & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = *MEMORY[0x1E4F1C3C8];
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = 7;
LABEL_6:
    id v19 = [v17 hmStringFromErrorCode:v18];
    id v20 = [v15 exceptionWithName:v16 reason:v19 userInfo:0];

    objc_exception_throw(v20);
  }
  v21 = @"kEventUUIDKey";
  int v11 = [MEMORY[0x1E4F29128] UUID];
  v22[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  objc_super v13 = [(HMCharacteristicThresholdRangeEvent *)self initWithDict:v12 characteristic:v6 thresholdRange:v8];

  return v13;
}

@end