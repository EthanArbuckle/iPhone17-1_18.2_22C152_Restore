@interface HMDCharacteristicEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_compareEventValue:(id)a3;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDCharacteristicEvent)initWithCoder:(id)a3;
- (HMDCharacteristicEvent)initWithModel:(id)a3 home:(id)a4;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)description;
- (id)dumpState;
- (id)emptyModelObject;
- (id)eventValue;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setEventValue:(id)a3;
@end

@implementation HMDCharacteristicEvent

- (void).cxx_destruct
{
}

- (void)setEventValue:(id)a3
{
}

- (id)eventValue
{
  return self->_eventValue;
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsCharacteristicEventData);
  v5 = [(HMDCharacteristicEvent *)self eventValue];
  [(HMDAnalyticsCharacteristicEventData *)v4 setContainsValue:v5 != 0];

  [(HMDAnalyticsTriggerEventData *)v3 setCharEvent:v4];
  return v3;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v25, 0xCu);
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
    v18 = [(HMDEvent *)v12 eventTrigger];
    v19 = [v10 name];
    int v20 = [v19 isEqualToString:@"kMigratedEventsToRecordsRequest"];

    if (v20)
    {
      [v18 processEventRecords:v17 message:v10];
    }
    else
    {
      if ([v17 propertyWasSet:@"eventValue"])
      {
        v21 = [(HMDCharacteristicEvent *)v12 eventValue];
        v22 = [v17 eventValue];
        char v23 = HMFEqualObjects();

        if ((v23 & 1) == 0)
        {
          v24 = [v17 eventValue];
          [(HMDCharacteristicEvent *)v12 setEventValue:v24];

          [v18 markChangedForMessage:v10];
        }
      }
      [v10 respondWithSuccess];
    }
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDCharacteristicEventModel alloc];
  v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDCharacteristicEventModel *)v9 setEndEvent:v10];

  v11 = [(HMDCharacteristicEventBase *)self accessoryUUID];
  v12 = [v11 UUIDString];
  [(HMDCharacteristicEventModel *)v9 setAccessory:v12];

  v13 = [(HMDCharacteristicEventBase *)self serviceID];
  [(HMDCharacteristicEventModel *)v9 setServiceID:v13];

  v14 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
  [(HMDCharacteristicEventModel *)v9 setCharacteristicID:v14];

  id v15 = [(HMDCharacteristicEvent *)self eventValue];
  [(HMDCharacteristicEventModel *)v9 setEventValue:v15];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicEvent;
  [(HMDCharacteristicEventBase *)&v7 encodeWithCoder:v4];
  v5 = [(HMDCharacteristicEvent *)self eventValue];

  if (v5)
  {
    v6 = [(HMDCharacteristicEvent *)self eventValue];
    [v4 encodeObject:v6 forKey:@"characteristicValue"];
  }
}

- (HMDCharacteristicEvent)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDCharacteristicEvent;
  v5 = [(HMDCharacteristicEventBase *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = allowedCharValueTypes();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"characteristicValue"];
    id eventValue = v5->_eventValue;
    v5->_id eventValue = (id)v7;
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicEvent;
  return [(HMDCharacteristicEventBase *)&v4 isCompatibleWithEvent:a3];
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicEvent;
  objc_super v4 = [(HMDCharacteristicEventBase *)&v9 createPayload];
  v5 = [v3 dictionaryWithDictionary:v4];

  v6 = [(HMDCharacteristicEvent *)self eventValue];
  [v5 setObject:v6 forKeyedSubscript:@"kCharacteristicValue"];

  uint64_t v7 = (void *)[v5 copy];
  return v7;
}

- (id)dumpState
{
  v3 = [(HMDCharacteristicEventBase *)self characteristic];
  objc_super v4 = [v3 service];

  v19.receiver = self;
  v19.super_class = (Class)HMDCharacteristicEvent;
  v5 = [(HMDEvent *)&v19 dumpState];
  v18 = (void *)[v5 mutableCopy];

  v6 = [(HMDCharacteristicEventBase *)self characteristic];
  uint64_t v7 = [v6 characteristicTypeDescription];

  id v8 = NSString;
  objc_super v9 = [v4 accessory];
  objc_super v10 = [v9 uuid];
  uint64_t v11 = [v10 UUIDString];
  v12 = [v4 instanceID];
  v13 = [(HMDCharacteristicEventBase *)self characteristic];
  v14 = [v13 instanceID];
  id v15 = [(HMDCharacteristicEvent *)self eventValue];
  v16 = [v8 stringWithFormat:@"type: %@, accUUID: %@, svcInstanceID: %@, chrInstanceID: %@, event value: %@", v7, v11, v12, v14, v15];

  [v18 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F64DB8]];
  return v18;
}

- (BOOL)_compareEventValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCharacteristicEvent *)self eventValue];

  if (v5)
  {
    v6 = [(HMDCharacteristicEventBase *)self characteristic];
    uint64_t v7 = [(HMDCharacteristicEvent *)self eventValue];
    id v8 = +[HMDCharacteristicEventBase compareValueOfCharacteristic:v6 againstValue:v7 operatorType:&unk_1F2DC96B8];
    char v9 = [v8 BOOLValue];
  }
  else
  {
    objc_super v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDCharacteristicEventBase *)v11 characteristic];
      int v16 = 138543618;
      id v17 = v13;
      __int16 v18 = 2112;
      objc_super v19 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Characteristic %@ changed value due to any change, evaluating trigger", (uint8_t *)&v16, 0x16u);
    }
    char v9 = 1;
  }

  return v9;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCharacteristicEventBase *)self previousValue];
  if (v4 && [(HMDCharacteristicEvent *)self _compareEventValue:v4])
  {
    if (v5)
    {
      v6 = [(HMDCharacteristicEventBase *)self characteristic];
      uint64_t v7 = +[HMDCharacteristicEventBase compareValueOfCharacteristic:v6 againstValue:v5 operatorType:&unk_1F2DC96A0];
      char v8 = [v7 BOOLValue];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }
  char v9 = (void *)MEMORY[0x1D9452090]();
  objc_super v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    HMFBooleanToString();
    v13 = id v19 = v4;
    v14 = [(HMDCharacteristicEventBase *)v10 characteristic];
    id v15 = [v14 value];
    [(HMDCharacteristicEvent *)v10 eventValue];
    v16 = char v20 = v8;
    id v17 = [(HMDCharacteristicEventBase *)v10 characteristic];
    *(_DWORD *)buf = 138544642;
    v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v5;
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    v30 = v16;
    __int16 v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    char v8 = v20;
    id v4 = v19;
  }

  return v8;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 messagePayload];
  v6 = [v5 objectForKeyedSubscript:@"kCharacteristicValue"];

  id v7 = v6;
  char v8 = [(HMDCharacteristicEventBase *)self characteristic];
  id v21 = v7;
  char v9 = [v8 validateValueForNotify:v7 outValue:&v21];
  id v10 = v21;

  if (v9)
  {
    [v4 respondWithError:v9];
  }
  else
  {
    id v17 = [(HMDCharacteristicEvent *)self emptyModelObject];
    [v17 setEventValue:v10];
    uint64_t v11 = [(HMDEvent *)self eventTrigger];
    v12 = [v11 home];
    v13 = [v12 backingStore];
    v14 = [v4 name];
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    int v16 = [v13 transaction:v14 options:v15];

    [v16 add:v17];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__HMDCharacteristicEvent__handleUpdateRequest___block_invoke;
    v18[3] = &unk_1E6A196E0;
    id v19 = v4;
    id v20 = v10;
    [v16 run:v18];
  }
}

void __47__HMDCharacteristicEvent__handleUpdateRequest___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) respondWithError:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v7 = @"kCharacteristicValue";
      v8[0] = v5;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
      [v4 respondWithPayload:v6];
    }
    else
    {
      [*(id *)(a1 + 32) respondWithPayload:0];
    }
  }
}

- (id)emptyModelObject
{
  id v3 = [HMDCharacteristicEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  uint64_t v5 = [(HMDEvent *)self eventTrigger];
  v6 = [v5 uuid];
  id v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicEvent;
  id v4 = [(HMDCharacteristicEventBase *)&v8 description];
  uint64_t v5 = [(HMDCharacteristicEvent *)self eventValue];
  v6 = [v3 stringWithFormat:@"[Char-Event: %@, event value: %@]", v4, v5];

  return v6;
}

- (HMDCharacteristicEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDCharacteristicEvent;
  id v7 = [(HMDCharacteristicEventBase *)&v11 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 eventValue];
    id eventValue = v7->_eventValue;
    v7->_id eventValue = (id)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_147506 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_147506, &__block_literal_global_147507);
  }
  v2 = (void *)logCategory__hmf_once_v1_147508;
  return v2;
}

uint64_t __37__HMDCharacteristicEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_147508;
  logCategory__hmf_once_v1_147508 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end