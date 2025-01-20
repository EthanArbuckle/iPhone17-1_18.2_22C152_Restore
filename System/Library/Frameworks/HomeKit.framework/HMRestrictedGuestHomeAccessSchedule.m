@interface HMRestrictedGuestHomeAccessSchedule
+ (BOOL)doDaysOfTheWeek:(unint64_t)a3 containWeekday:(id)a4;
+ (BOOL)isDate:(id)a3 inTimeZone:(id)a4 withinAllowedWeekDayScheduleRules:(id)a5;
+ (BOOL)isDate:(id)a3 withinAllowedTimeForSchedule:(id)a4 forHomeInTimeZone:(id)a5;
+ (BOOL)isDate:(id)a3 withinAllowedYearDayScheduleRules:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)initWithCoder:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)initWithDictionary:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3;
- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3 yearDayRules:(id)a4;
- (HMRestrictedGuestHomeAccessSchedule)initWithYearDayRules:(id)a3;
- (NSArray)attributeDescriptions;
- (NSArray)weekDayRules;
- (NSArray)yearDayRules;
- (NSString)description;
- (NSString)shortDescription;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWeekDayRules:(id)a3;
- (void)setYearDayRules:(id)a3;
@end

@implementation HMRestrictedGuestHomeAccessSchedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearDayRules, 0);

  objc_storeStrong((id *)&self->_weekDayRules, 0);
}

- (void)setYearDayRules:(id)a3
{
}

- (NSArray)yearDayRules
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWeekDayRules:(id)a3
{
}

- (NSArray)weekDayRules
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
  v5 = (void *)[v3 initWithName:@"weekDayRules" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
  v8 = (void *)[v6 initWithName:@"yearDayRules" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMRestrictedGuestHomeAccessSchedule)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (HMRestrictedGuestHomeAccessSchedule *)objc_alloc_init((Class)objc_opt_class());
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v8 = [v6 setWithArray:v7];
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HMWeekDayScheduleRules"];
  [(HMRestrictedGuestHomeAccessSchedule *)v5 setWeekDayRules:v9];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v12 = [v10 setWithArray:v11];
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"HMYearDayScheduleRules"];

  [(HMRestrictedGuestHomeAccessSchedule *)v5 setYearDayRules:v13];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];

  if (v4)
  {
    v5 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
    [v8 encodeObject:v5 forKey:@"HMWeekDayScheduleRules"];
  }
  id v6 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];

  if (v6)
  {
    v7 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
    [v8 encodeObject:v7 forKey:@"HMYearDayScheduleRules"];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMMutableRestrictedGuestSchedule allocWithZone:a3] init];
  v5 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
  [(HMRestrictedGuestHomeAccessSchedule *)v4 setWeekDayRules:v5];

  id v6 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
  [(HMRestrictedGuestHomeAccessSchedule *)v4 setYearDayRules:v6];

  return v4;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)doDaysOfTheWeek:(unint64_t)a3 containWeekday:(id)a4
{
  char v5 = [a4 weekday];
  id v6 = [NSNumber numberWithUnsignedInteger:(1 << (v5 - 1)) & a3];
  char v7 = [v6 BOOLValue];

  return v7;
}

+ (BOOL)isDate:(id)a3 withinAllowedYearDayScheduleRules:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    char v7 = 1;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__HMRestrictedGuestHomeAccessSchedule_isDate_withinAllowedYearDayScheduleRules___block_invoke;
    v9[3] = &unk_1E59442B8;
    id v10 = v5;
    char v7 = objc_msgSend(v6, "na_any:", v9);
  }
  return v7;
}

uint64_t __80__HMRestrictedGuestHomeAccessSchedule_isDate_withinAllowedYearDayScheduleRules___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 dateInterval];
  uint64_t v4 = [v3 containsDate:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)isDate:(id)a3 inTimeZone:(id)a4 withinAllowedWeekDayScheduleRules:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend(v10, "hmf_isEmpty"))
  {
    char v11 = 1;
  }
  else
  {
    v12 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    v13 = [v12 componentsInTimeZone:v9 fromDate:v8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __91__HMRestrictedGuestHomeAccessSchedule_isDate_inTimeZone_withinAllowedWeekDayScheduleRules___block_invoke;
    v16[3] = &unk_1E5944290;
    id v18 = v13;
    id v19 = a1;
    id v17 = v8;
    id v14 = v13;
    char v11 = objc_msgSend(v10, "na_any:", v16);
  }
  return v11;
}

uint64_t __91__HMRestrictedGuestHomeAccessSchedule_isDate_inTimeZone_withinAllowedWeekDayScheduleRules___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 startTime];
  uint64_t v6 = [v5 hour];
  char v7 = [v3 startTime];
  id v8 = HMDateFromDateWithHourAndMinuteComponents(v4, v6, [v7 minute]);

  id v9 = *(void **)(a1 + 32);
  id v10 = [v3 endTime];
  uint64_t v11 = [v10 hour];
  v12 = [v3 endTime];
  v13 = HMDateFromDateWithHourAndMinuteComponents(v9, v11, [v12 minute]);

  if (v8 && v13)
  {
    id v14 = HMMatterScheduleIntervalFromStartAndEndDates(v8, v13);
    if ([v14 containsDate:*(void *)(a1 + 32)]) {
      uint64_t v15 = objc_msgSend(*(id *)(a1 + 48), "doDaysOfTheWeek:containWeekday:", objc_msgSend(v3, "daysOfTheWeek"), *(void *)(a1 + 40));
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    id v17 = *(id *)(a1 + 48);
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v19;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create start and end dates for weekday rule", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

+ (BOOL)isDate:(id)a3 withinAllowedTimeForSchedule:(id)a4 forHomeInTimeZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 weekDayRules];
  int v12 = [a1 isDate:v8 inTimeZone:v10 withinAllowedWeekDayScheduleRules:v11];

  if (v12)
  {
    v13 = [v9 yearDayRules];
    char v14 = [a1 isDate:v8 withinAllowedYearDayScheduleRules:v13];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  id v3 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
  uint64_t v4 = [v3 hash];
  id v5 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A64A0]();
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
  uint64_t v11 = [v9 setWithArray:v10];

  int v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [v8 weekDayRules];
  char v14 = [v12 setWithArray:v13];

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
  id v17 = [v15 setWithArray:v16];

  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  id v19 = [v8 yearDayRules];

  v20 = [v18 setWithArray:v19];

  if (v8)
  {
    if (HMFEqualObjects()) {
      LOBYTE(v8) = HMFEqualObjects();
    }
    else {
      LOBYTE(v8) = 0;
    }
  }

  return (char)v8;
}

- (HMRestrictedGuestHomeAccessSchedule)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(v3, "hmf_arrayForKey:", @"HMWeekDayScheduleRules");
  id v5 = objc_msgSend(v3, "hmf_arrayForKey:", @"HMYearDayScheduleRules");
  id v6 = [MEMORY[0x1E4F1CA48] array];
  char v7 = [MEMORY[0x1E4F1CA48] array];
  v26 = v4;
  if (v4)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[HMWeekDayScheduleRule alloc] initWithDictionary:*(void *)(*((void *)&v31 + 1) + 8 * v12)];
          if (v13) {
            [v6 addObject:v13];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    id v4 = v26;
  }
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [[HMYearDayScheduleRule alloc] initWithDictionary:*(void *)(*((void *)&v27 + 1) + 8 * v18)];
          if (v19) {
            [v7 addObject:v19];
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v16);
    }

    id v4 = v26;
  }
  v20 = objc_msgSend(v6, "copy", self);
  int v21 = (void *)[v7 copy];
  v22 = (HMRestrictedGuestHomeAccessSchedule *)[v25 initWithWeekDayRules:v20 yearDayRules:v21];

  return v22;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    char v7 = [(HMRestrictedGuestHomeAccessSchedule *)self weekDayRules];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v9);
    }

    v13 = (void *)[v6 copy];
    [v3 setObject:v13 forKeyedSubscript:@"HMWeekDayScheduleRules"];
  }
  id v14 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v17 = [(HMRestrictedGuestHomeAccessSchedule *)self yearDayRules];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }

    uint64_t v23 = (void *)[v16 copy];
    [v3 setObject:v23 forKeyedSubscript:@"HMYearDayScheduleRules"];
  }
  v24 = (void *)[v3 copy];

  return v24;
}

- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3 yearDayRules:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMRestrictedGuestHomeAccessSchedule;
  uint64_t v8 = [(HMRestrictedGuestHomeAccessSchedule *)&v11 init];
  if (v8)
  {
    if (![v6 count] && !objc_msgSend(v7, "count"))
    {
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    [(HMRestrictedGuestHomeAccessSchedule *)v8 setWeekDayRules:v6];
    [(HMRestrictedGuestHomeAccessSchedule *)v8 setYearDayRules:v7];
  }
  uint64_t v9 = v8;
LABEL_6:

  return v9;
}

- (HMRestrictedGuestHomeAccessSchedule)initWithYearDayRules:(id)a3
{
  return [(HMRestrictedGuestHomeAccessSchedule *)self initWithWeekDayRules:MEMORY[0x1E4F1CBF0] yearDayRules:a3];
}

- (HMRestrictedGuestHomeAccessSchedule)initWithWeekDayRules:(id)a3
{
  return [(HMRestrictedGuestHomeAccessSchedule *)self initWithWeekDayRules:a3 yearDayRules:MEMORY[0x1E4F1CBF0]];
}

@end