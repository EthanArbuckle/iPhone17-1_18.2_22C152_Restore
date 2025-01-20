@interface HDHRIrregularRhythmNotificationsV1SettingsProvider
- (id)featureSettingsUponBackgroundDelivery;
@end

@implementation HDHRIrregularRhythmNotificationsV1SettingsProvider

- (id)featureSettingsUponBackgroundDelivery
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F2BE88]];
  v4 = objc_msgSend(MEMORY[0x1E4F2B058], "hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:", v3);
  uint64_t v5 = *MEMORY[0x1E4F29DE0];
  v6 = [v4 numberForKey:*MEMORY[0x1E4F29DE0] error:0];

  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F2B058]);
    uint64_t v11 = v5;
    v12[0] = MEMORY[0x1E4F1CC28];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v9 = [v7 initWithDictionary:v8];

    v4 = (void *)v9;
  }

  return v4;
}

@end