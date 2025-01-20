@interface HKFeatureSettings(HDHRIrregularRhythmNotificationsV1Settings)
+ (id)hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:()HDHRIrregularRhythmNotificationsV1Settings;
@end

@implementation HKFeatureSettings(HDHRIrregularRhythmNotificationsV1Settings)

+ (id)hdhr_irregularRhythmNotificationsV1SettingsFromDefaults:()HDHRIrregularRhythmNotificationsV1Settings
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F2BE60];
  v5 = [v3 objectForKey:*MEMORY[0x1E4F2BE60]];

  if (v5)
  {
    uint64_t v6 = objc_msgSend(v3, "hk_BOOLForKey:defaultValue:", v4, 0);
    id v7 = objc_alloc(MEMORY[0x1E4F2B058]);
    uint64_t v13 = *MEMORY[0x1E4F29DE0];
    v8 = [NSNumber numberWithBool:v6];
    v14[0] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = (void *)[v7 initWithDictionary:v9];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F2B058]);
    v10 = (void *)[v11 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }

  return v10;
}

@end