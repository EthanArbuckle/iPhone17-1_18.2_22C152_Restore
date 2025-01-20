@interface HKFeatureAvailabilityFeatureSettingBooleanRequirement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSatisfiedWhenSettingIsAbsent;
- (BOOL)settingsValue;
- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithCoder:(id)a3;
- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4 settingsValue:(BOOL)a5 isSatisfiedWhenSettingIsAbsent:(BOOL)a6;
- (NSString)settingsKey;
- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityFeatureSettingBooleanRequirement

- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithFeatureIdentifier:(id)a3 settingsKey:(id)a4 settingsValue:(BOOL)a5 isSatisfiedWhenSettingIsAbsent:(BOOL)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  v11 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v15 initWithFeatureIdentifier:a3];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    settingsKey = v11->_settingsKey;
    v11->_settingsKey = (NSString *)v12;

    v11->_settingsValue = a5;
    v11->_isSatisfiedWhenSettingIsAbsent = a6;
  }

  return v11;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v6 = a3;
  v7 = [v6 featureSettings];

  if (v7)
  {
    v8 = [v6 featureSettings];
    v9 = [v8 numberForKey:self->_settingsKey];

    if (v9) {
      objc_msgSend(NSNumber, "numberWithInt:", self->_settingsValue == objc_msgSend(v9, "BOOLValue"));
    }
    else {
    id v10 = [NSNumber numberWithBool:self->_isSatisfiedWhenSettingIsAbsent];
    }
  }
  else
  {
    id v10 = [NSNumber numberWithBool:self->_isSatisfiedWhenSettingIsAbsent];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  if ([(HKFeatureAvailabilityOnboardingRecordRequirement *)&v8 isEqual:v4])
  {
    v5 = v4;
    BOOL v6 = [(NSString *)self->_settingsKey isEqualToString:v5[3]]
      && self->_settingsValue == *((unsigned __int8 *)v5 + 16)
      && self->_isSatisfiedWhenSettingIsAbsent == *((unsigned __int8 *)v5 + 17);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  unint64_t v3 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v5 hash];
  return [(NSString *)self->_settingsKey hash] ^ v3 ^ self->_settingsValue ^ self->_isSatisfiedWhenSettingIsAbsent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  id v4 = a3;
  [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v6 encodeWithCoder:v4];
  objc_super v5 = [(HKFeatureAvailabilityFeatureSettingBooleanRequirement *)self settingsKey];
  [v4 encodeObject:v5 forKey:@"settingsKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HKFeatureAvailabilityFeatureSettingBooleanRequirement settingsValue](self, "settingsValue"), @"settingsValueKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[HKFeatureAvailabilityFeatureSettingBooleanRequirement isSatisfiedWhenSettingIsAbsent](self, "isSatisfiedWhenSettingIsAbsent"), @"isSatisfiedWhenSettingIsAbsent");
}

- (HKFeatureAvailabilityFeatureSettingBooleanRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityFeatureSettingBooleanRequirement;
  objc_super v5 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsKey"];
    settingsKey = v5->_settingsKey;
    v5->_settingsKey = (NSString *)v6;

    v5->_settingsValue = [v4 decodeBoolForKey:@"settingsValueKey"];
    v5->_isSatisfiedWhenSettingIsAbsent = [v4 decodeBoolForKey:@"isSatisfiedWhenSettingIsAbsent"];
  }

  return v5;
}

- (NSString)settingsKey
{
  return self->_settingsKey;
}

- (BOOL)settingsValue
{
  return self->_settingsValue;
}

- (BOOL)isSatisfiedWhenSettingIsAbsent
{
  return self->_isSatisfiedWhenSettingIsAbsent;
}

- (void).cxx_destruct
{
}

@end