@interface HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider
- (HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider)initWithHeartRateSettingsDefaults:(id)a3;
- (id)featureSettingsUponBackgroundDelivery;
@end

@implementation HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider

- (HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider)initWithHeartRateSettingsDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider;
  v6 = [(HDHRCardioFitnessBackgroundFeatureDeliverySettingsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_heartRateSettingsDefaults, a3);
  }

  return v7;
}

- (id)featureSettingsUponBackgroundDelivery
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = *MEMORY[0x1E4F67CE0];
  v9[0] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v5 = (void *)[v3 initWithDictionary:v4];

  if ([(NSUserDefaults *)self->_heartRateSettingsDefaults BOOLForKey:*MEMORY[0x1E4F2BE70]]) {
    [v5 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F67CE8]];
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F2B058]) initWithDictionary:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end