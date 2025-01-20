@interface HMDRestrictedGuestHomeAccessSettings
+ (BOOL)shouldConsiderStartDate:(id)a3 endDate:(id)a4 currentTime:(id)a5;
+ (BOOL)supportsSecureCoding;
+ (id)convertWeekDayRulesToDateIntervals:(id)a3 currentTime:(id)a4 timeZone:(id)a5;
+ (id)dateIntervalFromWeekDayRule:(id)a3 currentTime:(id)a4 timeZone:(id)a5;
+ (id)logCategory;
+ (id)mergeIntervals:(id)a3;
+ (void)__logIntervals:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateRestrictedGuestSettingsFromWorkingStore:(id)a3;
- (HMDRestrictedGuestHomeAccessSettings)initWithAllowedAccessories:(id)a3 schedule:(id)a4;
- (HMDRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3;
- (HMDRestrictedGuestHomeAccessSettings)initWithRestrictedGuestHomeAccessSettings:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)schedule;
- (NSArray)matterWeekDaySchedules;
- (NSArray)matterYearDaySchedules;
- (NSArray)uuidsOfAllowedAccessories;
- (id)_nextScheduledIntervalFromDate:(id)a3 timeZone:(id)a4;
- (id)attributeDescriptions;
- (id)nextScheduledInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setSchedule:(id)a3;
- (void)setUuidsOfAllowedAccessories:(id)a3;
@end

@implementation HMDRestrictedGuestHomeAccessSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_uuidsOfAllowedAccessories, 0);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDRestrictedGuestHomeAccessSettings *)self uuidsOfAllowedAccessories];
  v5 = (void *)[v3 initWithName:@"allowedAccessories" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
  v8 = (void *)[v6 initWithName:@"schedule" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (id)_nextScheduledIntervalFromDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];

  if (v8)
  {
    v9 = [MEMORY[0x263EFF980] array];
    v10 = objc_opt_class();
    v11 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
    v12 = [v11 weekDayRules];
    v13 = [v10 convertWeekDayRulesToDateIntervals:v12 currentTime:v6 timeZone:v7];
    [v9 addObjectsFromArray:v13];

    v14 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
    v15 = [v14 yearDayRules];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__HMDRestrictedGuestHomeAccessSettings__nextScheduledIntervalFromDate_timeZone___block_invoke;
    v20[3] = &unk_264A17350;
    v20[4] = self;
    id v21 = v6;
    id v16 = v9;
    id v22 = v16;
    objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

    v17 = [(id)objc_opt_class() mergeIntervals:v16];
    if ([v17 count])
    {
      v18 = [v17 firstObject];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __80__HMDRestrictedGuestHomeAccessSettings__nextScheduledIntervalFromDate_timeZone___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = objc_opt_class();
  v4 = [v10 dateInterval];
  v5 = [v4 startDate];
  id v6 = [v10 dateInterval];
  id v7 = [v6 endDate];
  LODWORD(v3) = [v3 shouldConsiderStartDate:v5 endDate:v7 currentTime:*(void *)(a1 + 40)];

  if (v3)
  {
    v8 = *(void **)(a1 + 48);
    v9 = [v10 dateInterval];
    [v8 addObject:v9];
  }
}

- (id)nextScheduledInterval
{
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = [MEMORY[0x263EFF910] date];
  v5 = [MEMORY[0x263EFFA18] localTimeZone];
  id v6 = [(HMDRestrictedGuestHomeAccessSettings *)self _nextScheduledIntervalFromDate:v4 timeZone:v5];

  return v6;
}

- (BOOL)updateRestrictedGuestSettingsFromWorkingStore:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v5 = [v4 home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__HMDRestrictedGuestHomeAccessSettings_updateRestrictedGuestSettingsFromWorkingStore___block_invoke;
  v10[3] = &unk_264A2F698;
  v10[4] = self;
  id v8 = v4;
  id v11 = v8;
  v12 = &v13;
  [v7 unsafeSynchronousBlock:v10];
  LOBYTE(v4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __86__HMDRestrictedGuestHomeAccessSettings_updateRestrictedGuestSettingsFromWorkingStore___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = *(void **)(a1 + 40);
    int v35 = 138543618;
    v36 = v5;
    __int16 v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to update the schedule for restricted guest : %@", (uint8_t *)&v35, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) uuid];
  id v8 = +[HMCContext findGuestWithModelID:v7];

  if (v8)
  {
    v9 = [v8 allowedAccessoryUUIDs];
    id v10 = [*(id *)(a1 + 32) uuidsOfAllowedAccessories];
    id v11 = [v10 asSet];
    v12 = [v9 asSet];
    int v13 = HMFEqualObjects();

    if ((v13 & 1) == 0)
    {
      v14 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setUuidsOfAllowedAccessories:v9]);
      id v15 = *(id *)(a1 + 32);
      char v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        v18 = *(void **)(a1 + 40);
        int v35 = 138543874;
        v36 = v17;
        __int16 v37 = 2112;
        v38 = v18;
        __int16 v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updated the allowed accessories for restricted guest: %@, to: %@", (uint8_t *)&v35, 0x20u);
      }
    }
    v19 = [v8 restrictedGuestSchedule];
    v20 = [*(id *)(a1 + 32) schedule];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      id v22 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 32) setSchedule:v19]);
      id v23 = *(id *)(a1 + 32);
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = HMFGetLogIdentifier();
        v26 = *(void **)(a1 + 40);
        int v35 = 138543874;
        v36 = v25;
        __int16 v37 = 2112;
        v38 = v26;
        __int16 v39 = 2112;
        v40 = v19;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Updated the schedule for restricted guest: %@, to: %@", (uint8_t *)&v35, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (!v13 || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      v27 = [*(id *)(a1 + 40) home];
      v28 = [v27 homeManager];
      v29 = [*(id *)(a1 + 40) uuid];
      [v28 updateGenerationCounterWithReason:@"RGScheduleGotUpdated" sourceUUID:v29 shouldNotifyClients:1];
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = *(id *)(a1 + 32);
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      v34 = [*(id *)(a1 + 40) uuid];
      int v35 = 138543618;
      v36 = v33;
      __int16 v37 = 2112;
      v38 = v34;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unable to find restricted guest in working store with UUID: %@", (uint8_t *)&v35, 0x16u);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = [(HMDRestrictedGuestHomeAccessSettings *)self uuidsOfAllowedAccessories];
  id v11 = [v9 setWithArray:v10];

  v12 = (void *)MEMORY[0x263EFFA08];
  int v13 = [v8 uuidsOfAllowedAccessories];
  v14 = [v12 setWithArray:v13];

  if (v8 && HMFEqualObjects())
  {
    id v15 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
    char v16 = [v8 schedule];
    char v17 = HMFEqualObjects();
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (NSArray)matterYearDaySchedules
{
  v2 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
  id v3 = [v2 yearDayRules];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_8_15393);
  v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v4;

  return v6;
}

id __62__HMDRestrictedGuestHomeAccessSettings_matterYearDaySchedules__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F49850];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 dateInterval];
  id v6 = [v5 startDate];
  id v7 = [v3 dateInterval];

  id v8 = [v7 endDate];
  v9 = (void *)[v4 initWithStartTime:v6 endTime:v8];

  return v9;
}

- (NSArray)matterWeekDaySchedules
{
  v2 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
  id v3 = [v2 weekDayRules];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_15397);
  v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }
  id v6 = v4;

  return v6;
}

id __62__HMDRestrictedGuestHomeAccessSettings_matterWeekDaySchedules__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F49848];
  id v3 = a2;
  id v19 = [v2 alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "daysOfTheWeek"));
  v5 = NSNumber;
  id v6 = [v3 startTime];
  id v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "hour"));
  id v8 = NSNumber;
  v9 = [v3 startTime];
  id v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "minute"));
  id v11 = NSNumber;
  v12 = [v3 endTime];
  int v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "hour"));
  v14 = NSNumber;
  id v15 = [v3 endTime];

  char v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "minute"));
  char v17 = (void *)[v19 initWithDaysMask:v4 startHour:v7 startMinute:v10 endHour:v13 endMinute:v16];

  return v17;
}

- (void)setSchedule:(id)a3
{
  id v4 = (HMRestrictedGuestHomeAccessSchedule *)a3;
  os_unfair_lock_lock_with_options();
  schedule = self->_schedule;
  self->_schedule = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMRestrictedGuestHomeAccessSchedule)schedule
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_schedule;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setUuidsOfAllowedAccessories:(id)a3
{
  id v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  uuidsOfAllowedAccessories = self->_uuidsOfAllowedAccessories;
  self->_uuidsOfAllowedAccessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)uuidsOfAllowedAccessories
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_uuidsOfAllowedAccessories;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDRestrictedGuestHomeAccessSettings *)self uuidsOfAllowedAccessories];
  [v4 encodeObject:v5 forKey:*MEMORY[0x263F0D550]];

  id v6 = [(HMDRestrictedGuestHomeAccessSettings *)self schedule];
  [v4 encodeObject:v6 forKey:*MEMORY[0x263F0D560]];
}

- (HMDRestrictedGuestHomeAccessSettings)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  id v7 = [v4 setWithArray:v6];
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F0D550]];

  v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0D560]];

  id v10 = [(HMDRestrictedGuestHomeAccessSettings *)self initWithAllowedAccessories:v8 schedule:v9];
  return v10;
}

- (HMDRestrictedGuestHomeAccessSettings)initWithAllowedAccessories:(id)a3 schedule:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRestrictedGuestHomeAccessSettings;
  v9 = [(HMDRestrictedGuestHomeAccessSettings *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuidsOfAllowedAccessories, a3);
    objc_storeStrong((id *)&v10->_schedule, a4);
  }

  return v10;
}

- (HMDRestrictedGuestHomeAccessSettings)initWithRestrictedGuestHomeAccessSettings:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifiersOfAccessAllowedToAccessories];
  uint64_t v6 = [v5 allObjects];

  if (v6) {
    id v7 = (void *)v6;
  }
  else {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }
  id v8 = [v4 guestAccessSchedule];

  v9 = [(HMDRestrictedGuestHomeAccessSettings *)self initWithAllowedAccessories:v7 schedule:v8];
  return v9;
}

+ (void)__logIntervals:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__HMDRestrictedGuestHomeAccessSettings___logIntervals___block_invoke;
  v3[3] = &__block_descriptor_40_e31_v32__0__NSDateInterval_8Q16_B24l;
  v3[4] = a1;
  objc_msgSend(a3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v3);
}

void __55__HMDRestrictedGuestHomeAccessSettings___logIntervals___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [v3 startDate];
    v9 = [v3 endDate];
    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2112;
    int v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@, %@]", (uint8_t *)&v10, 0x20u);
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12_15424 != -1) {
    dispatch_once(&logCategory__hmf_once_t12_15424, &__block_literal_global_26_15425);
  }
  v2 = (void *)logCategory__hmf_once_v13_15426;
  return v2;
}

void __51__HMDRestrictedGuestHomeAccessSettings_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13_15426;
  logCategory__hmf_once_v13_15426 = v0;
}

+ (BOOL)shouldConsiderStartDate:(id)a3 endDate:(id)a4 currentTime:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 compare:v8];
  uint64_t v12 = [v10 compare:v9];
  int v13 = (void *)MEMORY[0x230FBD990]();
  id v14 = a1;
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    uint64_t v16 = v22 = v13;
    char v17 = HMFBooleanToString();
    v18 = HMFBooleanToString();
    *(_DWORD *)buf = 138544386;
    v24 = v16;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = v17;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v18;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@startDate: %@ / in future: %@, endDate: %@ / in future: %@", buf, 0x34u);

    int v13 = v22;
  }

  BOOL v20 = v11 != 1 || v12 != 1;

  return v20;
}

+ (id)mergeIntervals:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "hmf_isEmpty"))
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_17;
  }
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  [v3 sortUsingComparator:&__block_literal_global_23];
  uint64_t v6 = [v3 firstObject];
  id v7 = [v6 startDate];

  id v8 = [v3 firstObject];
  id v9 = [v8 endDate];

  if ((unint64_t)[v3 count] >= 2)
  {
    unsigned int v10 = 2;
    uint64_t v11 = 1;
    while (1)
    {
      uint64_t v12 = [v3 objectAtIndexedSubscript:v11];
      [v9 timeIntervalSince1970];
      double v14 = v13;
      id v15 = [v12 startDate];
      [v15 timeIntervalSince1970];
      if (v14 > v16) {
        break;
      }
      double v17 = vabdd_f64(v14, v16);

      if (v17 < 2.22044605e-16) {
        goto LABEL_8;
      }
      __int16 v25 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v9];
      [v5 addObject:v25];

      uint64_t v26 = [v12 startDate];

      v24 = [v12 endDate];
      id v7 = (void *)v26;
LABEL_13:

      uint64_t v11 = v10;
      BOOL v27 = [v3 count] > (unint64_t)v10++;
      id v9 = v24;
      if (!v27) {
        goto LABEL_16;
      }
    }

LABEL_8:
    [v9 timeIntervalSince1970];
    double v19 = v18;
    BOOL v20 = [v12 endDate];
    [v20 timeIntervalSince1970];
    double v22 = v21;

    if (v19 >= v22) {
      double v23 = v19;
    }
    else {
      double v23 = v22;
    }
    v24 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v23];
    goto LABEL_13;
  }
  v24 = v9;
LABEL_16:
  v28 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v7 endDate:v24];
  [v5 addObject:v28];

  id v4 = (void *)[v5 copy];
LABEL_17:

  return v4;
}

uint64_t __55__HMDRestrictedGuestHomeAccessSettings_mergeIntervals___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)dateIntervalFromWeekDayRule:(id)a3 currentTime:(id)a4 timeZone:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v24 = 0;
    goto LABEL_17;
  }
  [v8 daysOfTheWeek];
  uint64_t v11 = HMDaysOfTheWeekToDateComponents();
  uint64_t v12 = [v8 startTime];
  double v13 = +[HMDCalendarEvent nextTimerDateAfterDate:v9 timeZone:v10 fireDateComponents:v12 recurrences:v11];

  double v14 = [v8 endTime];
  if ([v14 hour] == 23)
  {
    id v15 = [v8 endTime];
    uint64_t v16 = [v15 minute];

    if (v16 == 59)
    {
      int v35 = v13;
      __int16 v37 = v11;
      double v17 = [v9 addTimeInterval:86400.0];
      double v18 = [MEMORY[0x263EFF8F0] currentCalendar];
      double v19 = [v18 components:124 fromDate:v17];

      id v20 = objc_alloc_init(MEMORY[0x263EFF918]);
      double v21 = [MEMORY[0x263EFF8F0] currentCalendar];
      objc_msgSend(v20, "setWeekday:", objc_msgSend(v21, "component:fromDate:", 512, v9));

      if ([v19 hour] != 23) {
        goto LABEL_20;
      }
      if ([v19 minute] == 59 && objc_msgSend(v37, "containsObject:", v20))
      {
        [v19 setHour:0];
        [v19 setMinute:0];
        [v19 setSecond:0];
        double v22 = [MEMORY[0x263EFF8F0] currentCalendar];
        double v23 = [v22 dateFromComponents:v19];
      }
      else
      {
LABEL_20:
        double v23 = 0;
      }

      double v13 = v35;
      uint64_t v11 = v37;
      if (v23) {
        goto LABEL_11;
      }
    }
  }
  else
  {
  }
  __int16 v25 = [v8 endTime];
  double v23 = +[HMDCalendarEvent nextTimerDateAfterDate:v9 timeZone:v10 fireDateComponents:v25 recurrences:v11];

LABEL_11:
  if ([v13 compare:v23] == 1)
  {
    v36 = v13;
    v38 = v11;
    uint64_t v26 = [v8 startTime];
    [v26 hour];
    BOOL v27 = [v8 startTime];
    [v27 minute];
    v28 = HMDateFromDateWithHourAndMinuteComponents();

    id v29 = v23;
    id v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = a1;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v40 = v33;
      __int16 v41 = 2112;
      v42 = v28;
      __int16 v43 = 2112;
      id v44 = v29;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@weekDayRuleStart: %@, weekDayRuleEnd: %@", buf, 0x20u);
    }
    v24 = HMMatterScheduleIntervalFromStartAndEndDates();

    double v13 = v36;
    uint64_t v11 = v38;
  }
  else
  {
    v24 = HMMatterScheduleIntervalFromStartAndEndDates();
  }

LABEL_17:
  return v24;
}

+ (id)convertWeekDayRulesToDateIntervals:(id)a3 currentTime:(id)a4 timeZone:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v25 = v8;
    id obj = v8;
    uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v30)
    {
      uint64_t v12 = *(void *)v32;
      BOOL v27 = v11;
      id v28 = a1;
      id v26 = v10;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          double v14 = [a1 dateIntervalFromWeekDayRule:*(void *)(*((void *)&v31 + 1) + 8 * i) currentTime:v9 timeZone:v10];
          if (v14)
          {
            id v15 = (void *)MEMORY[0x230FBD990]();
            id v16 = a1;
            double v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              double v18 = HMFGetLogIdentifier();
              double v19 = [v14 startDate];
              [v14 endDate];
              uint64_t v20 = v12;
              v22 = id v21 = v9;
              *(_DWORD *)buf = 138543874;
              v36 = v18;
              __int16 v37 = 2112;
              v38 = v19;
              __int16 v39 = 2112;
              v40 = v22;
              _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[Calculated interval : [%@, %@]]", buf, 0x20u);

              id v9 = v21;
              uint64_t v12 = v20;

              id v10 = v26;
              a1 = v28;

              uint64_t v11 = v27;
            }

            [v11 addObject:v14];
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v30);
    }

    double v23 = (void *)[v11 copy];
    id v8 = v25;
  }
  else
  {
    double v23 = (void *)MEMORY[0x263EFFA68];
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end