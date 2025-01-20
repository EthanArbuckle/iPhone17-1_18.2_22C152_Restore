@interface HMDMatterAttributeEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)_compareEventValue:(id)a3;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDMatterAttributeEvent)initWithCoder:(id)a3;
- (HMDMatterAttributeEvent)initWithModel:(id)a3 home:(id)a4;
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

@implementation HMDMatterAttributeEvent

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
  v4 = objc_alloc_init(HMDAnalyticsAttributeEventData);
  v5 = [(HMDMatterAttributeEvent *)self eventValue];
  [(HMDAnalyticsAttributeEventData *)v4 setContainsValue:v5 != 0];

  [(HMDAnalyticsTriggerEventData *)v3 setAttributeEvent:v4];
  return v3;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v25 = 138543362;
    v26 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v25, 0xCu);
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
        v21 = [(HMDMatterAttributeEvent *)v12 eventValue];
        v22 = [v17 eventValue];
        char v23 = HMFEqualObjects();

        if ((v23 & 1) == 0)
        {
          v24 = [v17 eventValue];
          [(HMDMatterAttributeEvent *)v12 setEventValue:v24];

          [v18 markChangedForMessage:v10];
        }
      }
      [v10 respondWithSuccess];
    }
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDMatterAttributeEventModel alloc];
  v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDMatterAttributeEventModel *)v9 setEndEvent:v10];

  v11 = [(HMDMatterAttributeEventBase *)self matterPath];
  v12 = [v11 uuid];
  [(HMDMatterAttributeEventModel *)v9 setMatterPathUUID:v12];

  v13 = [(HMDMatterAttributeEvent *)self eventValue];
  [(HMDMatterAttributeEventModel *)v9 setEventValue:v13];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDMatterAttributeEvent;
  [(HMDMatterAttributeEventBase *)&v7 encodeWithCoder:v4];
  v5 = [(HMDMatterAttributeEvent *)self eventValue];

  if (v5)
  {
    v6 = [(HMDMatterAttributeEvent *)self eventValue];
    [v4 encodeObject:v6 forKey:*MEMORY[0x263F0BA80]];
  }
}

- (HMDMatterAttributeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  objc_super v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  id v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDMatterAttributeEvent;
  return [(HMDMatterAttributeEventBase *)&v4 isCompatibleWithEvent:a3];
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAttributeEvent;
  objc_super v4 = [(HMDMatterAttributeEventBase *)&v9 createPayload];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDMatterAttributeEvent *)self eventValue];
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F0BA88]];

  objc_super v7 = (void *)[v5 copy];
  return v7;
}

- (id)dumpState
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAttributeEvent;
  v3 = [(HMDEvent *)&v9 dumpState];
  objc_super v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  uint64_t v6 = [(HMDMatterAttributeEvent *)self eventValue];
  objc_super v7 = [v5 stringWithFormat:@"event value: %@", v6];
  [v4 setObject:v7 forKeyedSubscript:*MEMORY[0x263F41ED0]];

  return v4;
}

- (BOOL)_compareEventValue:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDMatterAttributeEvent *)self eventValue];

  if (v5)
  {
    uint64_t v6 = [(HMDMatterAttributeEvent *)self eventValue];
    objc_super v7 = +[HMDMatterAttributeEventBase compareValueOfAttribute:v4 againstValue:v6 operatorType:&unk_26E4716E0];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    objc_super v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDMatterAttributeEventBase *)v10 matterPath];
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Matter path %@ changed value due to any change, evaluating trigger", (uint8_t *)&v15, 0x16u);
    }
    char v8 = 1;
  }

  return v8;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 valueForKey:@"HMDMatterAttributeChangedNotificationValueKey"];
  if (v5) {
    BOOL v6 = [(HMDMatterAttributeEvent *)self _compareEventValue:v5];
  }
  else {
    BOOL v6 = 0;
  }
  objc_super v7 = (void *)MEMORY[0x230FBD990]();
  char v8 = self;
  objc_super v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    v11 = HMFBooleanToString();
    v12 = [(HMDMatterAttributeEvent *)v8 eventValue];
    int v14 = 138544130;
    int v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2112;
    v21 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, current value: %@, event monitor value: %@", (uint8_t *)&v14, 0x2Au);
  }

  return v6;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  objc_super v7 = NSString;
  char v8 = NSStringFromSelector(a2);
  objc_super v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)emptyModelObject
{
  v3 = [HMDMatterAttributeEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  objc_super v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDMatterAttributeEvent;
  id v4 = [(HMDMatterAttributeEventBase *)&v8 description];
  v5 = [(HMDMatterAttributeEvent *)self eventValue];
  uint64_t v6 = [v3 stringWithFormat:@"[Attribute-Event: %@, event value: %@]", v4, v5];

  return v6;
}

- (HMDMatterAttributeEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMatterAttributeEvent;
  objc_super v7 = [(HMDMatterAttributeEventBase *)&v11 initWithModel:v6 home:a4];
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
  if (logCategory__hmf_once_t0_100534 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_100534, &__block_literal_global_100535);
  }
  v2 = (void *)logCategory__hmf_once_v1_100536;
  return v2;
}

void __38__HMDMatterAttributeEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_100536;
  logCategory__hmf_once_v1_100536 = v0;
}

@end