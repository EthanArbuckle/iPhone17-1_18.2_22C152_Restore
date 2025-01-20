@interface UNMutableNotificationContent(HKMobility)
+ (id)_hkmobility_contentWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:;
+ (id)_makeUserInfoForCategory:()HKMobility;
@end

@implementation UNMutableNotificationContent(HKMobility)

+ (id)_hkmobility_contentWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(a1);
  id v11 = v8;
  if (([v11 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.Low"] & 1) != 0
    || [v11 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.Low"])
  {
    v12 = @"WALKING_STEADINESS_NOTIFICATION_TITLE_LOW";
LABEL_7:
    v13 = HKMobilityLocalizedNotificationString((uint64_t)v12);
    goto LABEL_8;
  }
  if (([v11 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessInitial.VeryLow"] & 1) != 0
    || [v11 isEqualToString:@"MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow"])
  {
    v12 = @"WALKING_STEADINESS_NOTIFICATION_TITLE_VERY_LOW";
    goto LABEL_7;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_FAULT)) {
    +[UNMutableNotificationContent(HKMobility) _hkmobility_contentWithCategory:shouldHidePregnancyContent:expirationDate:]();
  }
  v13 = 0;
LABEL_8:

  [v10 setTitle:v13];
  if (a4) {
    HKMobilityLocalizedNotificationBodyForCategory(v11);
  }
  else {
  v14 = HKMobilityLocalizedNotificationDuringPregnancyBodyForCategory(v11);
  }
  [v10 setBody:v14];

  [v10 setCategoryIdentifier:v11];
  [v10 setExpirationDate:v9];

  [v10 setThreadIdentifier:@"com.apple.health.Mobility"];
  v15 = [(objc_class *)a1 _makeUserInfoForCategory:v11];
  [v10 setUserInfo:v15];

  v16 = [MEMORY[0x1E4F44640] soundWithAlertType:25];
  [v10 setSound:v16];

  return v10;
}

+ (id)_makeUserInfoForCategory:()HKMobility
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  [v5 setObject:&unk_1F3B93FA0 forKeyedSubscript:*MEMORY[0x1E4F2BEF0]];
  id v6 = v4;
  v7 = HKMobilityAllWalkingSteadinessNotificationCategories();
  int v8 = [v7 containsObject:v6];

  if (v8
    && ([MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-health://summary"],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = v9;
    id v11 = [v9 absoluteString];
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2BF00]];
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E4F29F78];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F78], OS_LOG_TYPE_ERROR)) {
      +[UNMutableNotificationContent(HKMobility) _makeUserInfoForCategory:(uint64_t)v6];
    }
  }
  [v5 setObject:v6 forKeyedSubscript:@"mobilityNotificationCatgoryKey"];
  v13 = (void *)[v5 copy];

  return v13;
}

+ (void)_hkmobility_contentWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1E0B16000, v0, v1, "[UNNotificationRequest+HKMobility] Unable to localize notification title for category: %@", v2, v3, v4, v5, v6);
}

+ (void)_makeUserInfoForCategory:()HKMobility .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  __int16 v6 = 2112;
  uint64_t v7 = a3;
  _os_log_error_impl(&dword_1E0B16000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to determine URL for category: %@", v5, 0x16u);
}

@end