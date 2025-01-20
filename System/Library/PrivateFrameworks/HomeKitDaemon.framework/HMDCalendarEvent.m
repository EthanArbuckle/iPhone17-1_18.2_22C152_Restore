@interface HMDCalendarEvent
+ (BOOL)supportsSecureCoding;
+ (id)_nextRecurrentFireDateAfterDate:(id)a3 recurrences:(id)a4;
+ (id)logCategory;
+ (id)nextTimerDateAfterDate:(id)a3 timeZone:(id)a4 fireDateComponents:(id)a5 recurrences:(id)a6;
- (BOOL)areMonthDayNotMatching:(id)a3;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDCalendarEvent)initWithCoder:(id)a3;
- (HMDCalendarEvent)initWithModel:(id)a3 home:(id)a4;
- (NSDateComponents)fireDateComponents;
- (NSString)description;
- (id)_nextTimerDate;
- (id)_nextTimerDateAfterDate:(id)a3 timeZone:(id)a4;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setFireDateComponents:(id)a3;
@end

@implementation HMDCalendarEvent

- (void).cxx_destruct
{
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsCalendarEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setCalendarEvent:v4];

  return v3;
}

- (id)_nextTimerDateAfterDate:(id)a3 timeZone:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = [(HMDCalendarEvent *)v9 fireDateComponents];
    v13 = [(HMDEvent *)v9 eventTrigger];
    v14 = [v13 recurrences];
    int v21 = 138544130;
    v22 = v11;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    v26 = v12;
    __int16 v27 = 2112;
    v28 = v14;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Determining next fire date after date %@ using components: %@ recurrence: %@", (uint8_t *)&v21, 0x2Au);
  }
  v15 = objc_opt_class();
  v16 = [(HMDCalendarEvent *)v9 fireDateComponents];
  v17 = [(HMDEvent *)v9 eventTrigger];
  v18 = [v17 recurrences];
  v19 = [v15 nextTimerDateAfterDate:v6 timeZone:v7 fireDateComponents:v16 recurrences:v18];

  return v19;
}

- (id)_nextTimerDate
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [MEMORY[0x263EFFA18] localTimeZone];
  v5 = [(HMDCalendarEvent *)self _nextTimerDateAfterDate:v3 timeZone:v4];

  return v5;
}

- (BOOL)areMonthDayNotMatching:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCalendarEvent *)self fireDateComponents];
  uint64_t v6 = [v5 month];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(HMDCalendarEvent *)self fireDateComponents];
    uint64_t v8 = [v7 month];
    uint64_t v9 = [v4 month];

    if (v8 != v9) {
      goto LABEL_6;
    }
  }
  v10 = [(HMDCalendarEvent *)self fireDateComponents];
  uint64_t v11 = [v10 day];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL
    || ([(HMDCalendarEvent *)self fireDateComponents],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 day],
        uint64_t v14 = [v4 day],
        v12,
        v13 == v14))
  {
    BOOL v15 = 0;
  }
  else
  {
LABEL_6:
    BOOL v15 = 1;
  }

  return v15;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
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
    v18 = [v17 fireDateComponents];

    if (v18)
    {
      v19 = (void *)MEMORY[0x263EFF918];
      v20 = [v17 fireDateComponents];
      int v21 = objc_msgSend(v19, "hmf_unarchiveFromData:error:", v20, 0);

      if (v21)
      {
        v22 = [(HMDCalendarEvent *)v12 fireDateComponents];
        char v23 = [v22 isEqual:v21];

        if ((v23 & 1) == 0)
        {
          [(HMDCalendarEvent *)v12 setFireDateComponents:v21];
          id v24 = [(HMDEvent *)v12 eventTrigger];
          [v24 markChangedForMessage:v10];
        }
      }
    }
    [v10 respondWithSuccess];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDCalendarEventModel alloc];
  uint64_t v6 = [(HMDEvent *)self uuid];
  id v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDCalendarEventModel *)v9 setEndEvent:v10];

  uint64_t v11 = [(HMDCalendarEvent *)self fireDateComponents];
  v12 = encodeRootObject();
  [(HMDCalendarEventModel *)v9 setFireDateComponents:v12];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCalendarEvent;
  id v4 = a3;
  [(HMDTimeEvent *)&v6 encodeWithCoder:v4];
  v5 = [(HMDCalendarEvent *)self fireDateComponents];
  [v4 encodeObject:v5 forKey:@"kCalendarTimeEventFireDateComponents"];
}

- (HMDCalendarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCalendarEvent;
  v5 = [(HMDTimeEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCalendarTimeEventFireDateComponents"];
    fireDateComponents = v5->_fireDateComponents;
    v5->_fireDateComponents = (NSDateComponents *)v6;
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCalendarEvent;
  return [(HMDTimeEvent *)&v4 isCompatibleWithEvent:a3];
}

- (void)setFireDateComponents:(id)a3
{
  objc_super v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  fireDateComponents = self->_fireDateComponents;
  self->_fireDateComponents = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateComponents)fireDateComponents
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_fireDateComponents;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 dataForKey:@"kCalendarTimeEventFireDateComponents"];
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF918], "hmf_unarchiveFromData:error:", v5, 0);
  if (+[HMDTimeEvent isValidAbsoluteDateComponents:v6])
  {
    id v7 = [(HMDCalendarEvent *)self emptyModelObject];
    [v7 setFireDateComponents:v5];
    id v8 = [(HMDEvent *)self eventTrigger];
    objc_super v9 = [v8 home];
    id v10 = [v9 backingStore];
    uint64_t v11 = [v4 name];
    v12 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    uint64_t v13 = [v10 transaction:v11 options:v12];

    [v13 add:v7];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __41__HMDCalendarEvent__handleUpdateRequest___block_invoke;
    v16[3] = &unk_264A2F370;
    id v17 = v4;
    id v18 = v7;
    id v14 = v7;
    [v13 run:v16];
  }
  else
  {
    id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    [v4 respondWithError:v15];
  }
}

void __41__HMDCalendarEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v6 = @"kCalendarTimeEventFireDateComponents";
    id v4 = [*(id *)(a1 + 40) fireDateComponents];
    v7[0] = v4;
    v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 respondWithPayload:v5];
  }
}

- (id)emptyModelObject
{
  v3 = [HMDCalendarEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  id v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = self;
  v10.super_class = (Class)HMDCalendarEvent;
  id v4 = [(HMDEvent *)&v10 createPayload];
  v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDCalendarEvent *)self fireDateComponents];
  id v7 = encodeRootObject();
  [v5 setObject:v7 forKeyedSubscript:@"kCalendarTimeEventFireDateComponents"];

  id v8 = (void *)[v5 copy];
  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HMDCalendarEvent;
  id v4 = [(HMDEvent *)&v10 description];
  v5 = [(HMDCalendarEvent *)self fireDateComponents];
  uint64_t v6 = [v5 hour];
  id v7 = [(HMDCalendarEvent *)self fireDateComponents];
  id v8 = [v3 stringWithFormat:@"[Calendar-Event: %@, %tuh:%tum]", v4, v6, objc_msgSend(v7, "minute")];

  return (NSString *)v8;
}

- (HMDCalendarEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCalendarEvent;
  id v7 = [(HMDTimeEvent *)&v12 initWithModel:v6 home:a4];
  if (v7)
  {
    id v8 = [v6 fireDateComponents];
    uint64_t v9 = [v8 decodeDateComponents];
    fireDateComponents = v7->_fireDateComponents;
    v7->_fireDateComponents = (NSDateComponents *)v9;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (id)_nextRecurrentFireDateAfterDate:(id)a3 recurrences:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v8 = [v7 component:512 fromDate:v5];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    uint64_t v13 = 7;
    uint64_t v14 = v8;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "weekday", (void)v24);
        int64_t v17 = (v16 - v8 + 7) % 7uLL;
        if (!v17) {
          int64_t v17 = 7;
        }
        if (v17 < v13)
        {
          uint64_t v13 = v17;
          uint64_t v14 = v16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v14 = v8;
  }

  id v18 = objc_msgSend(v5, "hmf_dateComponents");
  id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
  v20 = [v18 timeZone];
  [v19 setTimeZone:v20];

  objc_msgSend(v19, "setHour:", objc_msgSend(v18, "hour"));
  objc_msgSend(v19, "setMinute:", objc_msgSend(v18, "minute"));
  [v19 setWeekday:v14];
  int v21 = [MEMORY[0x263EFF8F0] currentCalendar];
  v22 = [v21 nextDateAfterDate:v5 matchingComponents:v19 options:1024];

  return v22;
}

+ (id)nextTimerDateAfterDate:(id)a3 timeZone:(id)a4 fireDateComponents:(id)a5 recurrences:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = objc_msgSend(v10, "hmf_dateComponentsUsingTimeZone:", v11);
  [v14 setTimeZone:v11];
  if ([v12 minute] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v14, "setMinute:", objc_msgSend(v12, "minute"));
  }
  if ([v12 hour] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v14, "setHour:", objc_msgSend(v12, "hour"));
  }
  if ([v12 day] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v14, "setDay:", objc_msgSend(v12, "day"));
  }
  if ([v12 month] != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v14, "setMonth:", objc_msgSend(v12, "month"));
  }
  id v15 = [MEMORY[0x263EFF8F0] currentCalendar];
  [v15 setTimeZone:v11];
  uint64_t v16 = [v15 dateFromComponents:v14];
  uint64_t v17 = [v10 compare:v16];
  v45 = v13;
  if (![v13 count])
  {
    if (v17 != 1) {
      goto LABEL_14;
    }
    id v43 = v10;
    if ([v12 month] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v32 = [v12 day];
      id v33 = objc_alloc_init(MEMORY[0x263EFF918]);
      id v34 = v33;
      if (v32 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v33 setDay:1];
        v35 = [v15 dateByAddingComponents:v34 toDate:v16 options:0];

        v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = a1;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v39;
          __int16 v48 = 2112;
          v49 = v35;
          v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one day: %@";
LABEL_28:
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
        }
      }
      else
      {
        [v33 setMonth:1];
        v35 = [v15 dateByAddingComponents:v34 toDate:v16 options:0];

        v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = a1;
        v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v39 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v47 = v39;
          __int16 v48 = 2112;
          v49 = v35;
          v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one month: %@";
          goto LABEL_28;
        }
      }
    }
    else
    {
      id v34 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v34 setYear:1];
      v35 = [v15 dateByAddingComponents:v34 toDate:v16 options:0];

      v36 = (void *)MEMORY[0x230FBD990]();
      id v37 = a1;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v47 = v39;
        __int16 v48 = 2112;
        v49 = v35;
        v40 = "%{public}@Determined next fire date by assigning fire date components to current date and adding one year: %@";
        goto LABEL_28;
      }
    }

    id v26 = v35;

    id v10 = v43;
    goto LABEL_30;
  }
  v44 = v15;
  id v18 = v11;
  id v19 = objc_alloc_init(MEMORY[0x263EFF918]);
  v20 = [MEMORY[0x263EFF8F0] currentCalendar];
  objc_msgSend(v19, "setWeekday:", objc_msgSend(v20, "component:fromDate:", 512, v16));

  if ([v13 containsObject:v19] && v17 != 1)
  {

    id v11 = v18;
    id v15 = v44;
LABEL_14:
    int v21 = (void *)MEMORY[0x230FBD990]();
    id v22 = a1;
    char v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = id v24 = v10;
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      __int16 v48 = 2112;
      v49 = v16;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Determined next fire date by assigning fire date components to current date: %@", buf, 0x16u);

      id v10 = v24;
    }

    id v26 = v16;
    goto LABEL_30;
  }
  long long v27 = [(id)objc_opt_class() _nextRecurrentFireDateAfterDate:v16 recurrences:v13];

  v28 = (void *)MEMORY[0x230FBD990]();
  id v29 = a1;
  v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = id v42 = v10;
    *(_DWORD *)buf = 138543618;
    v47 = v31;
    __int16 v48 = 2112;
    v49 = v27;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Determined next fire date by assigning fire recurrent date components to current date: %@", buf, 0x16u);

    id v10 = v42;
  }

  id v26 = v27;

  id v11 = v18;
  id v15 = v44;
LABEL_30:

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_13815 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_13815, &__block_literal_global_13816);
  }
  v2 = (void *)logCategory__hmf_once_v1_13817;
  return v2;
}

void __31__HMDCalendarEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_13817;
  logCategory__hmf_once_v1_13817 = v0;
}

@end