@interface HMDHouseholdActivityLogEventContributor
+ (id)logCategory;
- (HMDEventCountersManager)countersManager;
- (HMDHouseholdActivityLogEventContributor)initWithHouseholdGroupName:(id)a3 countersManager:(id)a4 dateProvider:(id)a5;
- (HMMDateProvider)dateProvider;
- (NSString)householdGroupName;
- (id)householdGroupForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)householdGroupForLogEvent:(id)a3;
- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4;
- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4;
- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5;
@end

@implementation HMDHouseholdActivityLogEventContributor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_householdGroupName, 0);
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (NSString)householdGroupName
{
  return self->_householdGroupName;
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHouseholdActivityLogEventContributor *)self countersManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HMDHouseholdActivityLogEventContributor_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_1E6A123F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

BOOL __67__HMDHouseholdActivityLogEventContributor_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 groupName];
    id v8 = [*(id *)(a1 + 32) householdGroupName];
    if ([v7 isEqualToString:v8])
    {
      v9 = [v6 date];
      BOOL v10 = [v9 compare:*(void *)(a1 + 40)] == 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHouseholdActivityLogEventContributor *)self countersManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__HMDHouseholdActivityLogEventContributor_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_1E6A123F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

BOOL __68__HMDHouseholdActivityLogEventContributor_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 groupName];
    id v8 = [*(id *)(a1 + 32) householdGroupName];
    if ([v7 isEqualToString:v8])
    {
      v9 = [v6 date];
      BOOL v10 = [v9 compare:*(void *)(a1 + 40)] == -1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)coalesceLogEvent:(id)a3 fromSourceEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  BOOL v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)contributeLogEvent:(id)a3 toCoreAnalyticsEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  BOOL v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)deserializeLogEvent:(id)a3 fromSerializedMetric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  BOOL v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)contributeLogEvent:(id)a3 toSerializedMetric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  BOOL v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"You must override %@ in a subclass", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (void)populateLogEvent:(id)a3 forHomeWithUUID:(id)a4 associatedToDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"You must override %@ in a subclass", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)householdGroupForLogEvent:(id)a3
{
  id v4 = HMMSafeHomeUUIDFromLogEvent();
  if (v4)
  {
    id v5 = [(HMDHouseholdActivityLogEventContributor *)self dateProvider];
    id v6 = [v5 startOfCurrentDay];
    id v7 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupForHomeWithUUID:v4 associatedWithDate:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)householdGroupForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HMDHouseholdActivityLogEventContributor *)self countersManager];
  id v9 = [(HMDHouseholdActivityLogEventContributor *)self householdGroupName];
  id v10 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:v9 homeUUID:v7 date:v6];

  v11 = [v8 objectForKeyedSubscript:v10];

  return v11;
}

- (HMDHouseholdActivityLogEventContributor)initWithHouseholdGroupName:(id)a3 countersManager:(id)a4 dateProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDHouseholdActivityLogEventContributor;
  uint64_t v12 = [(HMDHouseholdActivityLogEventContributor *)&v14 init];
  if (v12 == self)
  {
    objc_storeStrong((id *)&self->_householdGroupName, a3);
    objc_storeStrong((id *)&self->_countersManager, a4);
    objc_storeStrong((id *)&self->_dateProvider, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_140172 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_140172, &__block_literal_global_140173);
  }
  v2 = (void *)logCategory__hmf_once_v3_140174;
  return v2;
}

uint64_t __54__HMDHouseholdActivityLogEventContributor_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_140174;
  logCategory__hmf_once_v3_140174 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end