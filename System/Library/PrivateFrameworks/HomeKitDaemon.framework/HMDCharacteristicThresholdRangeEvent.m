@interface HMDCharacteristicThresholdRangeEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)_isValueInRange:(id)a3;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDCharacteristicThresholdRangeEvent)initWithCoder:(id)a3;
- (HMDCharacteristicThresholdRangeEvent)initWithModel:(id)a3 home:(id)a4;
- (NSNumber)max;
- (NSNumber)min;
- (NSString)description;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setMax:(id)a3;
- (void)setMin:(id)a3;
@end

@implementation HMDCharacteristicThresholdRangeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_min, 0);
}

- (void)setMax:(id)a3
{
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMin:(id)a3
{
}

- (NSNumber)min
{
  return self->_min;
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsCharacteristicThresholdEventData);
  v5 = [(HMDCharacteristicThresholdRangeEvent *)self min];
  [(HMDAnalyticsCharacteristicThresholdEventData *)v4 setMinPresent:v5 != 0];

  v6 = [(HMDCharacteristicThresholdRangeEvent *)self max];
  [(HMDAnalyticsCharacteristicThresholdEventData *)v4 setMaxPresent:v6 != 0];

  [(HMDAnalyticsTriggerEventData *)v3 setCharThresholdEvent:v4];
  return v3;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v27, 0xCu);
  }
  id v15 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    if (([v17 propertyWasSet:@"min"] & 1) != 0
      || [v17 propertyWasSet:@"max"])
    {
      v18 = [(HMDCharacteristicThresholdRangeEvent *)v12 min];
      v19 = [v17 min];
      int v20 = HMFEqualObjects();

      if (!v20
        || ([(HMDCharacteristicThresholdRangeEvent *)v12 max],
            v21 = objc_claimAutoreleasedReturnValue(),
            [v17 max],
            v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = HMFEqualObjects(),
            v22,
            v21,
            (v23 & 1) == 0))
      {
        v24 = [v17 min];
        [(HMDCharacteristicThresholdRangeEvent *)v12 setMin:v24];

        v25 = [v17 max];
        [(HMDCharacteristicThresholdRangeEvent *)v12 setMax:v25];

        v26 = [(HMDEvent *)v12 eventTrigger];
        [v26 markChangedForMessage:v10];
      }
    }
    [v10 respondWithSuccess];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDCharacteristicThresholdRangeEventModel alloc];
  v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setEndEvent:v10];

  v11 = [(HMDCharacteristicEventBase *)self accessoryUUID];
  v12 = [v11 UUIDString];
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setAccessory:v12];

  v13 = [(HMDCharacteristicEventBase *)self serviceID];
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setServiceID:v13];

  v14 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setCharacteristicID:v14];

  id v15 = [(HMDCharacteristicThresholdRangeEvent *)self min];
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setMin:v15];

  v16 = [(HMDCharacteristicThresholdRangeEvent *)self max];
  [(HMDCharacteristicThresholdRangeEventModel *)v9 setMax:v16];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  id v4 = a3;
  [(HMDCharacteristicEventBase *)&v7 encodeWithCoder:v4];
  v5 = [(HMDCharacteristicThresholdRangeEvent *)self min];
  [v4 encodeObject:v5 forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];

  v6 = [(HMDCharacteristicThresholdRangeEvent *)self max];
  [v4 encodeObject:v6 forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
}

- (HMDCharacteristicThresholdRangeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  v5 = [(HMDCharacteristicEventBase *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
    min = v5->_min;
    v5->_min = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
    max = v5->_max;
    v5->_max = (NSNumber *)v8;
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  return [(HMDCharacteristicEventBase *)&v4 isCompatibleWithEvent:a3];
}

- (BOOL)_evaluateNewValue:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCharacteristicEventBase *)self characteristic];
  uint64_t v6 = [v5 previousValue];

  BOOL v7 = 0;
  if (v4 && v6)
  {
    uint64_t v8 = [(HMDCharacteristicEventBase *)self characteristic];
    id v9 = +[HMDCharacteristicEventBase compareValueOfCharacteristic:v8 againstValue:v6 operatorType:&unk_26E4722B0];
    char v10 = [v9 BOOLValue];

    if (v10)
    {
      if (![(HMDCharacteristicThresholdRangeEvent *)self _isValueInRange:v6])
      {
        BOOL v7 = [(HMDCharacteristicThresholdRangeEvent *)self _isValueInRange:v4];
        goto LABEL_10;
      }
    }
    else
    {
      objc_super v11 = (void *)MEMORY[0x230FBD990]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v14;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@The value hasn't changed from previous value, ignoring", buf, 0xCu);
      }
    }
    BOOL v7 = 0;
  }
LABEL_10:
  id v15 = (void *)MEMORY[0x230FBD990]();
  v16 = self;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    HMFBooleanToString();
    v19 = BOOL v26 = v7;
    v25 = [(HMDCharacteristicEventBase *)v16 characteristic];
    int v20 = [v25 value];
    [(HMDCharacteristicThresholdRangeEvent *)v16 min];
    v21 = int v27 = v15;
    v22 = [(HMDCharacteristicThresholdRangeEvent *)v16 max];
    char v23 = [(HMDCharacteristicEventBase *)v16 characteristic];
    *(_DWORD *)buf = 138544898;
    uint64_t v29 = v18;
    __int16 v30 = 2112;
    v31 = v19;
    __int16 v32 = 2112;
    v33 = v6;
    __int16 v34 = 2112;
    v35 = v20;
    __int16 v36 = 2112;
    v37 = v21;
    __int16 v38 = 2112;
    v39 = v22;
    __int16 v40 = 2112;
    v41 = v23;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire (did enter range): %@, previous value: %@, current value: %@, min: %@, max: %@, %@", buf, 0x48u);

    id v15 = v27;
    BOOL v7 = v26;
  }

  return v7;
}

- (BOOL)_isValueInRange:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v5 = [(HMDCharacteristicThresholdRangeEvent *)self min];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(HMDCharacteristicThresholdRangeEvent *)self max];

    if (!v6) {
      goto LABEL_9;
    }
  }
  BOOL v7 = [(HMDCharacteristicThresholdRangeEvent *)self min];

  if (!v7
    || ([(HMDCharacteristicThresholdRangeEvent *)self min],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v4 compare:v8],
        v8,
        v9 != -1))
  {
    char v10 = [(HMDCharacteristicThresholdRangeEvent *)self max];

    if (!v10
      || ([(HMDCharacteristicThresholdRangeEvent *)self max],
          objc_super v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v4 compare:v11],
          v11,
          v12 != 1))
    {
      BOOL v13 = 1;
      goto LABEL_11;
    }
  }
LABEL_9:
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 numberForKey:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
  uint64_t v6 = [v4 numberForKey:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
  if (v5 | v6)
  {
    uint64_t v8 = [(HMDCharacteristicThresholdRangeEvent *)self emptyModelObject];
    [v8 setMin:v5];
    [v8 setMax:v6];
    uint64_t v9 = [(HMDEvent *)self eventTrigger];
    char v10 = [v9 home];
    objc_super v11 = [v10 backingStore];
    uint64_t v12 = [v4 name];
    BOOL v13 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v14 = [v11 transaction:v12 options:v13];

    [v14 add:v8];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__HMDCharacteristicThresholdRangeEvent__handleUpdateRequest___block_invoke;
    v16[3] = &unk_264A2F370;
    id v17 = v4;
    id v18 = v8;
    id v15 = v8;
    [v14 run:v16];
  }
  else
  {
    BOOL v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    [v4 respondWithError:v7];
  }
}

void __61__HMDCharacteristicThresholdRangeEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF9A0] dictionary];
    id v4 = [*(id *)(a1 + 40) min];
    [v8 setObject:v4 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];

    uint64_t v5 = [*(id *)(a1 + 40) max];
    [v8 setObject:v5 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];

    uint64_t v6 = *(void **)(a1 + 32);
    BOOL v7 = (void *)[v8 copy];
    [v6 respondWithPayload:v7];
  }
}

- (id)emptyModelObject
{
  v3 = [HMDCharacteristicThresholdRangeEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  uint64_t v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  BOOL v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  id v4 = [(HMDCharacteristicEventBase *)&v12 createPayload];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDCharacteristicThresholdRangeEvent *)self min];

  if (v6)
  {
    BOOL v7 = [(HMDCharacteristicThresholdRangeEvent *)self min];
    [v5 setObject:v7 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMin"];
  }
  id v8 = [(HMDCharacteristicThresholdRangeEvent *)self max];

  if (v8)
  {
    uint64_t v9 = [(HMDCharacteristicThresholdRangeEvent *)self max];
    [v5 setObject:v9 forKeyedSubscript:@"kCharacteristicThresholdRangeEventThresholdRangeMax"];
  }
  char v10 = (void *)[v5 copy];

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  id v4 = [(HMDCharacteristicEventBase *)&v9 description];
  uint64_t v5 = [(HMDCharacteristicThresholdRangeEvent *)self min];
  uint64_t v6 = [(HMDCharacteristicThresholdRangeEvent *)self max];
  BOOL v7 = [v3 stringWithFormat:@"[Char-Threshold-Event: %@, min: %@, max: %@]", v4, v5, v6];

  return (NSString *)v7;
}

- (HMDCharacteristicThresholdRangeEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCharacteristicThresholdRangeEvent;
  BOOL v7 = [(HMDCharacteristicEventBase *)&v13 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 min];
    min = v7->_min;
    v7->_min = (NSNumber *)v8;

    uint64_t v10 = [v6 max];
    max = v7->_max;
    v7->_max = (NSNumber *)v10;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_154797 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_154797, &__block_literal_global_154798);
  }
  v2 = (void *)logCategory__hmf_once_v1_154799;
  return v2;
}

void __51__HMDCharacteristicThresholdRangeEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_154799;
  logCategory__hmf_once_v1_154799 = v0;
}

@end