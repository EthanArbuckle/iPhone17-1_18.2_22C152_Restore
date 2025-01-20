@interface HMDSignificantTimeEvent
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)nextTimerDateFromHomeLocation:(id)a3 signifiantEvent:(id)a4 offset:(id)a5 loggingObject:(id)a6;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDSignificantTimeEvent)initWithCoder:(id)a3;
- (HMDSignificantTimeEvent)initWithModel:(id)a3 home:(id)a4;
- (NSDateComponents)offset;
- (NSString)description;
- (NSString)significantEvent;
- (id)_nextTimerDate;
- (id)analyticsTriggerEventData;
- (id)createPayload;
- (id)emptyModelObject;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)_handleUpdateRequest:(id)a3;
- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setOffset:(id)a3;
- (void)setSignificantEvent:(id)a3;
@end

@implementation HMDSignificantTimeEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

- (id)analyticsTriggerEventData
{
  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  [(HMDAnalyticsTriggerEventData *)v3 setEndEvent:[(HMDEvent *)self isEndEvent]];
  v4 = objc_alloc_init(HMDAnalyticsSignificantTimeEventData);
  v5 = [(HMDSignificantTimeEvent *)self significantEvent];
  [(HMDAnalyticsSignificantTimeEventData *)v4 setSignificantEvent:v5];

  v6 = [(HMDSignificantTimeEvent *)self offset];
  [(HMDAnalyticsSignificantTimeEventData *)v4 setOffsetPresent:v6 != 0];

  [(HMDAnalyticsTriggerEventData *)v3 setSignificantTimeEvent:v4];
  return v3;
}

- (id)_nextTimerDate
{
  v3 = [(HMDEvent *)self eventTrigger];
  v4 = [v3 home];
  v5 = [v4 homeLocationHandler];
  v6 = [v5 location];
  v7 = [(HMDSignificantTimeEvent *)self significantEvent];
  v8 = [(HMDSignificantTimeEvent *)self offset];
  v9 = +[HMDSignificantTimeEvent nextTimerDateFromHomeLocation:v6 signifiantEvent:v7 offset:v8 loggingObject:self];

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v30 = 138543362;
    v31 = v14;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling transaction updated", (uint8_t *)&v30, 0xCu);
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
    if ([v17 propertyWasSet:@"significantEvent"]
      && ([(HMDSignificantTimeEvent *)v12 significantEvent],
          v18 = objc_claimAutoreleasedReturnValue(),
          [v17 significantEvent],
          v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = HMFEqualObjects(),
          v19,
          v18,
          (v20 & 1) == 0))
    {
      v22 = [v17 significantEvent];
      [(HMDSignificantTimeEvent *)v12 setSignificantEvent:v22];

      int v21 = 1;
    }
    else
    {
      int v21 = 0;
    }
    v23 = [v17 offset];

    if (v23)
    {
      v24 = (void *)MEMORY[0x1E4F1C9D8];
      v25 = [v17 offset];
      v26 = objc_msgSend(v24, "hmf_unarchiveFromData:error:", v25, 0);

      if (v26
        && ([(HMDSignificantTimeEvent *)v12 offset],
            v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = [v27 isEqual:v26],
            v27,
            (v28 & 1) == 0))
      {
        [(HMDSignificantTimeEvent *)v12 setOffset:v26];
      }
      else
      {

        if ((v21 & 1) == 0) {
          goto LABEL_20;
        }
      }
    }
    else if (!v21)
    {
      goto LABEL_20;
    }
    v29 = [(HMDEvent *)v12 eventTrigger];
    [v29 markChangedForMessage:v10];

LABEL_20:
    [v10 respondWithSuccess];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDSignificantTimeEventModel alloc];
  v6 = [(HMDEvent *)self uuid];
  v7 = [(HMDEvent *)self eventTrigger];
  id v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  id v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  [(HMDSignificantTimeEventModel *)v9 setEndEvent:v10];

  v11 = [(HMDSignificantTimeEvent *)self significantEvent];
  [(HMDSignificantTimeEventModel *)v9 setSignificantEvent:v11];

  v12 = [(HMDSignificantTimeEvent *)self offset];
  v13 = encodeRootObject();
  [(HMDSignificantTimeEventModel *)v9 setOffset:v13];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDSignificantTimeEvent;
  id v4 = a3;
  [(HMDTimeEvent *)&v7 encodeWithCoder:v4];
  v5 = [(HMDSignificantTimeEvent *)self significantEvent];
  [v4 encodeObject:v5 forKey:@"kSignificantTimeEventSignificantEvent"];

  v6 = [(HMDSignificantTimeEvent *)self offset];
  [v4 encodeObject:v6 forKey:@"kSignificantTimeEventOffset"];
}

- (HMDSignificantTimeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDSignificantTimeEvent;
  v5 = [(HMDTimeEvent *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignificantTimeEventSignificantEvent"];
    significantEvent = v5->_significantEvent;
    v5->_significantEvent = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSignificantTimeEventOffset"];
    offset = v5->_offset;
    v5->_offset = (NSDateComponents *)v8;
  }
  return v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDSignificantTimeEvent;
  return [(HMDTimeEvent *)&v4 isCompatibleWithEvent:a3];
}

- (void)setOffset:(id)a3
{
  objc_super v4 = (NSDateComponents *)a3;
  os_unfair_lock_lock_with_options();
  offset = self->_offset;
  self->_offset = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateComponents)offset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_offset;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSignificantEvent:(id)a3
{
  objc_super v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  significantEvent = self->_significantEvent;
  self->_significantEvent = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)significantEvent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:@"kSignificantTimeEventSignificantEvent"];
  uint64_t v6 = [v4 dataForKey:@"kSignificantTimeEventOffset"];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hmf_unarchiveFromData:error:", v6, 0);
  if (v5 | v7)
  {
    id v9 = [(HMDSignificantTimeEvent *)self emptyModelObject];
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v5)
    {
      [v9 setSignificantEvent:v5];
      [v10 setObject:v5 forKeyedSubscript:@"kSignificantTimeEventSignificantEvent"];
    }
    uint64_t v19 = v7;
    if (v6)
    {
      [v9 setOffset:v6];
      [v10 setObject:v6 forKeyedSubscript:@"kSignificantTimeEventOffset"];
    }
    objc_super v11 = [(HMDEvent *)self eventTrigger];
    v12 = [v11 home];
    v13 = [v12 backingStore];
    [v4 name];
    v14 = v18 = v9;
    id v15 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    v16 = [v13 transaction:v14 options:v15];

    [v16 add:v18];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__HMDSignificantTimeEvent__handleUpdateRequest___block_invoke;
    v20[3] = &unk_1E6A196E0;
    id v21 = v4;
    id v22 = v10;
    id v17 = v10;
    [v16 run:v20];

    uint64_t v7 = v19;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v4 respondWithError:v8];
  }
}

void __48__HMDSignificantTimeEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    id v4 = (id)[*(id *)(a1 + 40) copy];
    [v2 respondWithPayload:v4];
  }
}

- (id)emptyModelObject
{
  v3 = [HMDSignificantTimeEventModel alloc];
  id v4 = [(HMDEvent *)self uuid];
  uint64_t v5 = [(HMDEvent *)self eventTrigger];
  uint64_t v6 = [v5 uuid];
  uint64_t v7 = [(HMDBackingStoreModelObject *)v3 initWithObjectChangeType:2 uuid:v4 parentUUID:v6];

  return v7;
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v11.receiver = self;
  v11.super_class = (Class)HMDSignificantTimeEvent;
  id v4 = [(HMDEvent *)&v11 createPayload];
  uint64_t v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDSignificantTimeEvent *)self significantEvent];
  [v5 setObject:v6 forKeyedSubscript:@"kSignificantTimeEventSignificantEvent"];

  uint64_t v7 = [(HMDSignificantTimeEvent *)self offset];
  uint64_t v8 = encodeRootObject();
  [v5 setObject:v8 forKeyedSubscript:@"kSignificantTimeEventOffset"];

  id v9 = (void *)[v5 copy];
  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HMDSignificantTimeEvent;
  id v4 = [(HMDEvent *)&v10 description];
  uint64_t v5 = [(HMDSignificantTimeEvent *)self significantEvent];
  uint64_t v6 = [(HMDSignificantTimeEvent *)self offset];
  uint64_t v7 = objc_msgSend(v6, "hmf_localTimeDescription");
  uint64_t v8 = [v3 stringWithFormat:@"[Sig-Event: %@ Type:%@, %@]", v4, v5, v7];

  return (NSString *)v8;
}

- (HMDSignificantTimeEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDSignificantTimeEvent;
  uint64_t v7 = [(HMDTimeEvent *)&v14 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 significantEvent];
    significantEvent = v7->_significantEvent;
    v7->_significantEvent = (NSString *)v8;

    objc_super v10 = [v6 offset];
    uint64_t v11 = [v10 decodeDateComponents];
    offset = v7->_offset;
    v7->_offset = (NSDateComponents *)v11;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)nextTimerDateFromHomeLocation:(id)a3 signifiantEvent:(id)a4 offset:(id)a5 loggingObject:(id)a6
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9)
  {
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v12;
    id v21 = v12;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v77 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get next significant event fire date because home location is nil", buf, 0xCu);
    }
    v24 = 0;
    id v12 = v20;
    goto LABEL_51;
  }
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
  objc_super v14 = (void *)MEMORY[0x1D9452090]();
  id v15 = v12;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v77 = v17;
    __int16 v78 = 2112;
    id v79 = v9;
    __int16 v80 = 2112;
    uint64_t v81 = v13;
    _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Current Home Location & time : %@ / %@", buf, 0x20u);
  }
  if ([v10 isEqualToString:*MEMORY[0x1E4F2DF70]])
  {
    uint64_t v18 = +[HMDLocation nextSunriseTimeForLocation:v9 date:v13];
  }
  else
  {
    if (![v10 isEqualToString:*MEMORY[0x1E4F2DF78]])
    {
      v25 = 0;
      goto LABEL_13;
    }
    uint64_t v18 = +[HMDLocation nextSunsetTimeForLocation:v9 date:v13];
  }
  v25 = (void *)v18;
LABEL_13:
  v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = v15;
  char v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v77 = v29;
    __int16 v78 = 2112;
    id v79 = v25;
    _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@nextSunEventDates %@", buf, 0x16u);
  }
  int v30 = (void *)MEMORY[0x1D9452090]();
  id v31 = v27;
  uint64_t v32 = HMFGetOSLogHandle();
  v33 = v32;
  v70 = (void *)v13;
  if (v25)
  {
    id v68 = v10;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v34 = HMFGetLogIdentifier();
      v35 = [v25 describeElements:&__block_literal_global_19_65776];
      *(_DWORD *)buf = 138543618;
      v77 = v34;
      __int16 v78 = 2112;
      id v79 = v35;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Set of events to pick from %@", buf, 0x16u);
    }
    v69 = v25;
    if (v11)
    {
      id v66 = v12;
      v36 = (void *)MEMORY[0x1D9452090]();
      id v37 = v31;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v77 = v39;
        __int16 v78 = 2112;
        id v79 = v11;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_INFO, "%{public}@Adding offset %@ to the sun event dates", buf, 0x16u);
      }
      v40 = [MEMORY[0x1E4F1CA48] array];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v41 = v25;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v71 objects:v75 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v72 != v44) {
              objc_enumerationMutation(v41);
            }
            uint64_t v46 = *(void *)(*((void *)&v71 + 1) + 8 * i);
            v47 = [MEMORY[0x1E4F1C9A8] currentCalendar];
            v48 = [v47 dateByAddingComponents:v11 toDate:v46 options:0];

            [v40 addObject:v48];
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v71 objects:v75 count:16];
        }
        while (v43);
      }

      id v12 = v66;
      v25 = v69;
      uint64_t v13 = (uint64_t)v70;
    }
    else
    {
      v40 = (void *)[v25 mutableCopy];
    }
    [v40 addObject:v13];
    v50 = [v40 sortedArrayUsingComparator:&__block_literal_global_25_65781];
    v51 = (void *)MEMORY[0x1D9452090]();
    id v52 = v31;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [v40 describeElements:&__block_literal_global_27_65782];
      *(_DWORD *)buf = 138543618;
      v77 = v54;
      __int16 v78 = 2112;
      id v79 = v55;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@Set of events to pick after offset & current time addition from %@", buf, 0x16u);

      v25 = v69;
    }

    if ([v50 count])
    {
      unint64_t v56 = 1;
      while (1)
      {
        v57 = [v50 objectAtIndex:v56 - 1];

        unint64_t v58 = [v50 count];
        if (v57 == v70) {
          break;
        }
        if (v56++ >= v58)
        {
          v24 = 0;
          v25 = v69;
          goto LABEL_49;
        }
      }
      if (v56 == v58)
      {
        context = (void *)MEMORY[0x1D9452090]();
        id v60 = v52;
        v61 = HMFGetOSLogHandle();
        v25 = v69;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v62 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v77 = v62;
          _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine next timer event for Significant Event", buf, 0xCu);
        }
        v24 = 0;
      }
      else
      {
        v24 = [v50 objectAtIndex:v56];
        context = (void *)MEMORY[0x1D9452090]();
        id v63 = v52;
        v61 = HMFGetOSLogHandle();
        v25 = v69;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v64 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v77 = v64;
          __int16 v78 = 2112;
          id v79 = v24;
          _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_INFO, "%{public}@Event next fire date : %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v24 = 0;
    }
LABEL_49:

    id v10 = v68;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v49 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v77 = v49;
      _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the sun event dates based on home location", buf, 0xCu);
    }
    v24 = 0;
  }

LABEL_51:
  return v24;
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_localTimeDescription");
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke_22(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __94__HMDSignificantTimeEvent_nextTimerDateFromHomeLocation_signifiantEvent_offset_loggingObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmf_localTimeDescription");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_65791 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_65791, &__block_literal_global_65792);
  }
  v2 = (void *)logCategory__hmf_once_v1_65793;
  return v2;
}

uint64_t __38__HMDSignificantTimeEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_65793;
  logCategory__hmf_once_v1_65793 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end