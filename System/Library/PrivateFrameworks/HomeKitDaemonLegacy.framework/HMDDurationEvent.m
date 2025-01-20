@interface HMDDurationEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isCompatbileWithEvent:(id)a3;
- (HMDDurationEvent)initWithCoder:(id)a3;
- (HMDDurationEvent)initWithModel:(id)a3 home:(id)a4;
- (NSNumber)duration;
- (NSString)description;
- (id)_nextTimerDate;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(id)a3;
@end

@implementation HMDDurationEvent

- (void).cxx_destruct
{
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsDurationEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setDurationEvent:v4];

  return v3;
}

- (id)_nextTimerDate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = [v4 components:252 fromDate:v3];

  uint64_t v6 = [v5 second];
  v7 = [(HMDDurationEvent *)self duration];
  objc_msgSend(v5, "setSecond:", objc_msgSend(v7, "unsignedIntegerValue") + v6);

  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 dateFromComponents:v5];

  v10 = (void *)MEMORY[0x1D9452090]();
  v11 = self;
  v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = HMFGetLogIdentifier();
    int v15 = 138543618;
    v16 = v13;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Next Fire Date : [%@]", (uint8_t *)&v15, 0x16u);
  }

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v27 = 138543362;
    v28 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v27, 0xCu);
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
    uint64_t v18 = [v17 duration];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      uint64_t v20 = [(HMDDurationEvent *)v12 duration];
      if (v20)
      {
        v21 = (void *)v20;
        v22 = [(HMDDurationEvent *)v12 duration];
        [v22 doubleValue];
        v23 = [v17 duration];
        [v23 doubleValue];
        char v24 = HMDurationsApproximatelyEqual();

        if (v24) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      v25 = [v17 duration];
      [(HMDDurationEvent *)v12 setDuration:v25];

      v26 = [(HMDEvent *)v12 eventTrigger];
      [v26 markChangedForMessage:v10];
    }
LABEL_13:
    [v10 respondWithSuccess];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDDurationEventModel alloc];
  uint64_t v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDDurationEventModel *)v9 setEndEvent:v10];

  v11 = [(HMDDurationEvent *)self duration];
  [(HMDDurationEventModel *)v9 setDuration:v11];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDDurationEvent;
  id v4 = a3;
  [(HMDTimeEvent *)&v6 encodeWithCoder:v4];
  v5 = [(HMDDurationEvent *)self duration];
  [v4 encodeObject:v5 forKey:@"kDurationEventDuration"];
}

- (HMDDurationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDurationEvent;
  v5 = [(HMDTimeEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDurationEventDuration"];
    duration = v5->_duration;
    v5->_duration = (NSNumber *)v6;
  }
  return v5;
}

- (BOOL)isCompatbileWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDDurationEvent;
  return [(HMDTimeEvent *)&v4 isCompatibleWithEvent:a3];
}

- (void)setDuration:(id)a3
{
  objc_super v4 = (NSNumber *)a3;
  os_unfair_lock_lock_with_options();
  duration = self->_duration;
  self->_duration = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSNumber)duration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_duration;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 numberForKey:@"kDurationEventDuration"];
  if (v5)
  {
    uint64_t v6 = [(HMDDurationEvent *)self emptyModelObject];
    [v6 setDuration:v5];
    v7 = [(HMDEvent *)self eventTrigger];
    id v8 = [v7 home];
    objc_super v9 = [v8 backingStore];
    id v10 = [v4 name];
    v11 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v12 = [v9 transaction:v10 options:v11];

    [v12 add:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__HMDDurationEvent__handleUpdateRequest___block_invoke;
    v15[3] = &unk_1E6A196E0;
    id v16 = v4;
    id v17 = v6;
    id v13 = v6;
    [v12 run:v15];
  }
  else
  {
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v14];
  }
}

void __41__HMDDurationEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v6 = @"kDurationEventDuration";
    id v4 = [*(id *)(a1 + 40) duration];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 respondWithPayload:v5];
  }
}

- (id)emptyModelObject
{
  v3 = [HMDDurationEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v9.receiver = self;
  v9.super_class = (Class)HMDDurationEvent;
  id v4 = [(HMDEvent *)&v9 createPayload];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDDurationEvent *)self duration];
  [v5 setObject:v6 forKeyedSubscript:@"kDurationEventDuration"];

  v7 = (void *)[v5 copy];
  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDDurationEvent;
  id v4 = [(HMDEvent *)&v8 description];
  v5 = [(HMDDurationEvent *)self duration];
  uint64_t v6 = [v3 stringWithFormat:@"[Duration-Event: %@, %@s]", v4, v5];

  return (NSString *)v6;
}

- (HMDDurationEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDDurationEvent;
  v7 = [(HMDTimeEvent *)&v11 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 duration];
    duration = v7->_duration;
    v7->_duration = (NSNumber *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_178976 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_178976, &__block_literal_global_178977);
  }
  v2 = (void *)logCategory__hmf_once_v1_178978;
  return v2;
}

uint64_t __31__HMDDurationEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_178978;
  logCategory__hmf_once_v1_178978 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end