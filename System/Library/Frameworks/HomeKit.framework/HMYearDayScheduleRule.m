@interface HMYearDayScheduleRule
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMYearDayScheduleRule)initWithCoder:(id)a3;
- (HMYearDayScheduleRule)initWithDateInterval:(id)a3;
- (HMYearDayScheduleRule)initWithDictionary:(id)a3;
- (HMYearDayScheduleRule)initWithValidFrom:(id)a3 validUntil:(id)a4;
- (NSArray)attributeDescriptions;
- (NSDate)validFrom;
- (NSDate)validUntil;
- (NSDateInterval)dateInterval;
- (NSString)description;
- (NSString)shortDescription;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateInterval:(id)a3;
@end

@implementation HMYearDayScheduleRule

- (void).cxx_destruct
{
}

- (void)setDateInterval:(id)a3
{
}

- (NSDateInterval)dateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMYearDayScheduleRule *)self dateInterval];
  v5 = (void *)[v3 initWithName:@"Date Interval" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
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

- (HMYearDayScheduleRule)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMYearDayScheduleCodingKeyDateInterval"];
  if (v5)
  {
    v6 = [(HMYearDayScheduleRule *)self initWithDateInterval:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from dateInterval: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMYearDayScheduleRule *)self dateInterval];
  [v4 encodeObject:v5 forKey:@"HMYearDayScheduleCodingKeyDateInterval"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[HMMutableYearDayScheduleRule allocWithZone:a3];
  id v5 = [(HMYearDayScheduleRule *)self dateInterval];
  v6 = [(HMYearDayScheduleRule *)v4 initWithDateInterval:v5];

  return v6;
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

- (HMYearDayScheduleRule)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "hmf_dateForKey:", @"HMDStartDateKey");
  v6 = objc_msgSend(v4, "hmf_dateForKey:", @"HMDEndDateKey");

  v7 = 0;
  if (v5 && v6)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v5 endDate:v6];
    self = [(HMYearDayScheduleRule *)self initWithDateInterval:v8];

    v7 = self;
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMYearDayScheduleRule *)self dateInterval];

  if (v3)
  {
    v10[0] = @"HMDStartDateKey";
    id v4 = [(HMYearDayScheduleRule *)self dateInterval];
    id v5 = [v4 startDate];
    v10[1] = @"HMDEndDateKey";
    v11[0] = v5;
    v6 = [(HMYearDayScheduleRule *)self dateInterval];
    v7 = [v6 endDate];
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(HMYearDayScheduleRule *)self dateInterval];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMYearDayScheduleRule *)self dateInterval];
    v8 = [v6 dateInterval];
    char v9 = [v7 isEqualToDateInterval:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSDate)validUntil
{
  v2 = [(HMYearDayScheduleRule *)self dateInterval];
  unint64_t v3 = [v2 endDate];

  return (NSDate *)v3;
}

- (NSDate)validFrom
{
  v2 = [(HMYearDayScheduleRule *)self dateInterval];
  unint64_t v3 = [v2 startDate];

  return (NSDate *)v3;
}

- (HMYearDayScheduleRule)initWithValidFrom:(id)a3 validUntil:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = a3;
  char v9 = (void *)[[v6 alloc] initWithStartDate:v8 endDate:v7];

  v10 = [(HMYearDayScheduleRule *)self initWithDateInterval:v9];
  return v10;
}

- (HMYearDayScheduleRule)initWithDateInterval:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMYearDayScheduleRule;
  id v5 = [(HMYearDayScheduleRule *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 copy];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;
  }
  id v8 = v5;
LABEL_6:

  return v8;
}

@end