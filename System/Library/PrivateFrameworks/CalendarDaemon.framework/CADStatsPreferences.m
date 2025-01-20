@interface CADStatsPreferences
+ (id)eventName;
- (CADStatsPreferences)init;
- (id)eventDictionaries;
@end

@implementation CADStatsPreferences

- (CADStatsPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)CADStatsPreferences;
  v2 = [(CADStatsPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    payload = v2->payload;
    v2->payload = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)eventName
{
  return @"cadstats.Preferences";
}

- (id)eventDictionaries
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F57780]);
  v4 = (void *)[v3 initWithDomain:*MEMORY[0x1E4F57900]];
  v5 = [v4 getValueForPreference:@"overlayCalendarID" expectedClass:objc_opt_class()];
  [(NSMutableDictionary *)self->payload setObject:v5 forKeyedSubscript:@"overlayCalendarID"];

  if ([MEMORY[0x1E4F70FE8] isLunarCalendarDefaultOn])
  {
    objc_super v6 = (void *)MEMORY[0x1E4F70FE8];
    v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    v8 = [v7 localeIdentifier];
    v9 = [v6 preferredLunarCalendarForLocaleID:v8];
    [(NSMutableDictionary *)self->payload setObject:v9 forKeyedSubscript:@"defaultOverlayCalendarID"];
  }
  v10 = (void *)MEMORY[0x1E4F28ED0];
  v11 = [MEMORY[0x1E4F57440] shared];
  v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "get_enableTravelAdvisoriesForAutomaticBehavior"));
  [(NSMutableDictionary *)self->payload setObject:v12 forKeyedSubscript:@"travelAdvisoryEnabled"];

  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "getBooleanPreference:defaultValue:", @"ShowWeekNumbers", 0));
  [(NSMutableDictionary *)self->payload setObject:v13 forKeyedSubscript:@"weekNumbersEnabled"];

  v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "getBooleanPreference:defaultValue:", @"ShowDeclinedEvents", 0));
  [(NSMutableDictionary *)self->payload setObject:v14 forKeyedSubscript:@"declinedEventsEnabled"];

  v17[0] = self->payload;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v15;
}

- (void).cxx_destruct
{
}

@end