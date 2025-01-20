@interface HKHRSampleClassificationCollection
+ (BOOL)supportsSecureCoding;
- (HKHRSampleClassificationCollection)initWithClassifications:(id)a3 dayIndex:(id)a4 majorityTimeZone:(id)a5;
- (HKHRSampleClassificationCollection)initWithCoder:(id)a3;
- (NSArray)classifications;
- (NSNumber)dayIndex;
- (NSString)majorityTimeZone;
- (void)encodeWithCoder:(id)a3;
- (void)setClassifications:(id)a3;
- (void)setDayIndex:(id)a3;
- (void)setMajorityTimeZone:(id)a3;
@end

@implementation HKHRSampleClassificationCollection

- (HKHRSampleClassificationCollection)initWithClassifications:(id)a3 dayIndex:(id)a4 majorityTimeZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKHRSampleClassificationCollection;
  v12 = [(HKHRSampleClassificationCollection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_classifications, a3);
    objc_storeStrong((id *)&v13->_dayIndex, a4);
    objc_storeStrong((id *)&v13->_majorityTimeZone, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  classifications = self->_classifications;
  id v5 = a3;
  [v5 encodeObject:classifications forKey:@"Classifications"];
  [v5 encodeObject:self->_dayIndex forKey:@"DayIndex"];
  [v5 encodeObject:self->_majorityTimeZone forKey:@"MajorityTimeZone"];
}

- (HKHRSampleClassificationCollection)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKHRSampleClassificationCollection;
  id v5 = [(HKHRSampleClassificationCollection *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Classifications"];
    classifications = v5->_classifications;
    v5->_classifications = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayIndex"];
    dayIndex = v5->_dayIndex;
    v5->_dayIndex = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MajorityTimeZone"];
    majorityTimeZone = v5->_majorityTimeZone;
    v5->_majorityTimeZone = (NSString *)v13;
  }
  return v5;
}

- (NSArray)classifications
{
  return self->_classifications;
}

- (void)setClassifications:(id)a3
{
}

- (NSNumber)dayIndex
{
  return self->_dayIndex;
}

- (void)setDayIndex:(id)a3
{
}

- (NSString)majorityTimeZone
{
  return self->_majorityTimeZone;
}

- (void)setMajorityTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_majorityTimeZone, 0);
  objc_storeStrong((id *)&self->_dayIndex, 0);

  objc_storeStrong((id *)&self->_classifications, 0);
}

@end