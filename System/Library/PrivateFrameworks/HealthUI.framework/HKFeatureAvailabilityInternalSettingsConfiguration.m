@interface HKFeatureAvailabilityInternalSettingsConfiguration
- (BOOL)requireReboot;
- (BOOL)showDisabledOverride;
- (BOOL)showFeatureEnable;
- (BOOL)syncToWatch;
- (HKFeatureAvailabilityInternalSettingsConfiguration)initWithFeatureIdentifier:(id)a3 userDefaultsDomain:(id)a4 userDefaultsFeatureEnabledKey:(id)a5 userDefaultsDisabledOverrideKey:(id)a6 options:(unint64_t)a7 samplesTypesToDelete:(id)a8;
- (NSArray)samplesTypesToDelete;
- (NSString)featureIdentifier;
- (NSString)userDefaultsDisabledOverrideKey;
- (NSString)userDefaultsDomain;
- (NSString)userDefaultsFeatureEnabledKey;
- (unint64_t)options;
- (void)setFeatureIdentifier:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSamplesTypesToDelete:(id)a3;
- (void)setUserDefaultsDisabledOverrideKey:(id)a3;
- (void)setUserDefaultsDomain:(id)a3;
- (void)setUserDefaultsFeatureEnabledKey:(id)a3;
@end

@implementation HKFeatureAvailabilityInternalSettingsConfiguration

- (HKFeatureAvailabilityInternalSettingsConfiguration)initWithFeatureIdentifier:(id)a3 userDefaultsDomain:(id)a4 userDefaultsFeatureEnabledKey:(id)a5 userDefaultsDisabledOverrideKey:(id)a6 options:(unint64_t)a7 samplesTypesToDelete:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HKFeatureAvailabilityInternalSettingsConfiguration;
  v18 = [(HKFeatureAvailabilityInternalSettingsConfiguration *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_featureIdentifier, a3);
    objc_storeStrong((id *)&v19->_userDefaultsDomain, a4);
    objc_storeStrong((id *)&v19->_userDefaultsFeatureEnabledKey, a5);
    objc_storeStrong((id *)&v19->_userDefaultsDisabledOverrideKey, a6);
    v19->_options = a7;
    objc_storeStrong((id *)&v19->_samplesTypesToDelete, a8);
  }

  return v19;
}

- (BOOL)showFeatureEnable
{
  return [(HKFeatureAvailabilityInternalSettingsConfiguration *)self options] & 1;
}

- (BOOL)syncToWatch
{
  return ([(HKFeatureAvailabilityInternalSettingsConfiguration *)self options] >> 1) & 1;
}

- (BOOL)requireReboot
{
  return ([(HKFeatureAvailabilityInternalSettingsConfiguration *)self options] >> 2) & 1;
}

- (BOOL)showDisabledOverride
{
  return ([(HKFeatureAvailabilityInternalSettingsConfiguration *)self options] >> 3) & 1;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(id)a3
{
}

- (NSString)userDefaultsDomain
{
  return self->_userDefaultsDomain;
}

- (void)setUserDefaultsDomain:(id)a3
{
}

- (NSString)userDefaultsFeatureEnabledKey
{
  return self->_userDefaultsFeatureEnabledKey;
}

- (void)setUserDefaultsFeatureEnabledKey:(id)a3
{
}

- (NSString)userDefaultsDisabledOverrideKey
{
  return self->_userDefaultsDisabledOverrideKey;
}

- (void)setUserDefaultsDisabledOverrideKey:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSArray)samplesTypesToDelete
{
  return self->_samplesTypesToDelete;
}

- (void)setSamplesTypesToDelete:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samplesTypesToDelete, 0);
  objc_storeStrong((id *)&self->_userDefaultsDisabledOverrideKey, 0);
  objc_storeStrong((id *)&self->_userDefaultsFeatureEnabledKey, 0);
  objc_storeStrong((id *)&self->_userDefaultsDomain, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end