@interface HKFeatureAvailabilityRequirementFeatureSetting
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnWhenSettingIsAbsent;
- (HKFeatureAvailabilityRequirementFeatureSetting)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4;
- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5;
- (NSString)featureIdentifier;
- (NSString)settingsOnKey;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementFeatureSetting

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 isOnWhenSettingIsAbsent:(BOOL)a4
{
  return [(HKFeatureAvailabilityRequirementFeatureSetting *)self initWithFeatureIdentifier:a3 settingsOnKey:@"Enabled" isOnWhenSettingIsAbsent:a4];
}

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithFeatureIdentifier:(id)a3 settingsOnKey:(id)a4 isOnWhenSettingIsAbsent:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureAvailabilityRequirementFeatureSetting;
  v11 = [(HKFeatureAvailabilityRequirementFeatureSetting *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureIdentifier, a3);
    objc_storeStrong((id *)&v12->_settingsOnKey, a4);
    v12->_isOnWhenSettingIsAbsent = a5;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = [(NSString *)self->_featureIdentifier isEqualToString:v5[2]]
      && [(NSString *)self->_settingsOnKey isEqualToString:v5[3]]
      && self->_isOnWhenSettingIsAbsent == *((unsigned __int8 *)v5 + 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureIdentifier hash];
  return [(NSString *)self->_settingsOnKey hash] ^ v3 ^ self->_isOnWhenSettingIsAbsent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  [v5 encodeObject:featureIdentifier forKey:@"featureIdentifierKey"];
  [v5 encodeObject:self->_settingsOnKey forKey:@"settingsOnKey"];
  [v5 encodeBool:self->_isOnWhenSettingIsAbsent forKey:@"isOnWhenSettingIsAbsent"];
}

- (HKFeatureAvailabilityRequirementFeatureSetting)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureIdentifierKey"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settingsOnKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isOnWhenSettingIsAbsent"];

  v8 = [(HKFeatureAvailabilityRequirementFeatureSetting *)self initWithFeatureIdentifier:v5 settingsOnKey:v6 isOnWhenSettingIsAbsent:v7];
  return v8;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)settingsOnKey
{
  return self->_settingsOnKey;
}

- (BOOL)isOnWhenSettingIsAbsent
{
  return self->_isOnWhenSettingIsAbsent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsOnKey, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end