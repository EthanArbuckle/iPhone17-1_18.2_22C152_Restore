@interface HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithFeatureIdentifier:(id)a3 daysBeforeCurrentDate:(int64_t)a4;
- (NSString)requirementDescription;
- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo

- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithFeatureIdentifier:(id)a3 daysBeforeCurrentDate:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  v5 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v9 initWithFeatureIdentifier:a3];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithDays:", a4);
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v6;
  }
  return v5;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardedBeforeTimeAgo";
}

- (NSString)requirementDescription
{
  v3 = NSString;
  v4 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  v5 = [(NSDateComponents *)self->_dateComponents debugDescription];
  uint64_t v6 = [v3 stringWithFormat:@"Onboarding record for %@ must be before %@", v4, v5];

  return (NSString *)v6;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [v7 onboardingCompletion];

  if (v9)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
    v11 = [(NSDateComponents *)self->_dateComponents hk_negativeComponents];
    v12 = [v8 currentDate];
    v13 = [v10 dateByAddingComponents:v11 toDate:v12 options:0];

    v14 = NSNumber;
    v15 = [v7 onboardingCompletion];
    v16 = [v15 completionDate];
    v17 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v16, "hk_isBeforeDate:", v13));
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSDateComponents *)self->_dateComponents isEqual:v4[2]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDateComponents *)self->_dateComponents hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  id v4 = a3;
  [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateComponents, @"DateComponents", v5.receiver, v5.super_class);
}

- (HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementOnboardedBeforeTimeAgo;
  objc_super v5 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DateComponents"];
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end