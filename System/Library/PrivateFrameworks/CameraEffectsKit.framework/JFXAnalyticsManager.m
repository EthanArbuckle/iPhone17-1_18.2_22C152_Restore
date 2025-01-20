@interface JFXAnalyticsManager
+ (id)allIncrementScalarEvents;
+ (id)bundleForAnalytics;
+ (id)sharedInstance;
- (BOOL)checkIfEventExistsWithName:(id)a3;
- (BOOL)isIncrementScalar:(id)a3;
- (JFXAnalyticsManager)init;
- (id)dictionaryWithEventName:(id)a3 value:(double)a4;
- (id)fullKeyFromEvent:(id)a3;
- (void)trackEventWithName:(id)a3;
- (void)trackKey:(id)a3 withCount:(unint64_t)a4;
- (void)trackKey:(id)a3 withPayload:(id)a4;
@end

@implementation JFXAnalyticsManager

- (JFXAnalyticsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)JFXAnalyticsManager;
  return [(JFXAnalyticsManager *)&v3 init];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_44);
  }
  v2 = (void *)sharedInstance_analyticsManager_0;
  return v2;
}

uint64_t __37__JFXAnalyticsManager_sharedInstance__block_invoke()
{
  sharedInstance_analyticsManager_0 = objc_alloc_init(JFXAnalyticsManager);
  return MEMORY[0x270F9A758]();
}

- (id)dictionaryWithEventName:(id)a3 value:(double)a4
{
  v12[3] = *MEMORY[0x263EF8340];
  v12[0] = a3;
  v11[0] = @"AnalyticsEventNameKey";
  v11[1] = @"AnalyticsEventCountOrDurationValueKey";
  v5 = NSNumber;
  id v6 = a3;
  v7 = [v5 numberWithDouble:a4];
  v12[1] = v7;
  v11[2] = @"AnalyticsEventTimeStampKey";
  v8 = [MEMORY[0x263EFF910] date];
  v12[2] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

- (BOOL)checkIfEventExistsWithName:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = +[JFXAnalyticsKeys allEventNames];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isEqualToString:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)trackEventWithName:(id)a3
{
  id v5 = a3;
  if (-[JFXAnalyticsManager checkIfEventExistsWithName:](self, "checkIfEventExistsWithName:"))
  {
    v4 = [(JFXAnalyticsManager *)self fullKeyFromEvent:v5];
    [(JFXAnalyticsManager *)self trackKey:v4 withCount:1];
  }
}

+ (id)bundleForAnalytics
{
  if (bundleForAnalytics_onceToken != -1) {
    dispatch_once(&bundleForAnalytics_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)bundleForAnalytics_bundle;
  return v2;
}

void __41__JFXAnalyticsManager_bundleForAnalytics__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  id v5 = [v1 componentsSeparatedByString:@"."];

  v2 = [v5 lastObject];
  uint64_t v3 = [v2 lowercaseString];
  v4 = (void *)bundleForAnalytics_bundle;
  bundleForAnalytics_bundle = v3;
}

- (id)fullKeyFromEvent:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"com.apple.cameraeffectskit.", a3];
}

- (void)trackKey:(id)a3 withPayload:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
    long long v9 = [(id)objc_opt_class() bundleForAnalytics];
    [v8 setValue:v9 forKey:@"hostApp"];

    v15 = v8;
    id v10 = v8;
    int v11 = AnalyticsSendEventLazy();
    long long v12 = JFXLog_DebugAnalytics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v11) {
        v13 = @"succeeded";
      }
      else {
        v13 = @"failed";
      }
      uint64_t v14 = [v7 descriptionInStringsFileFormat];
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEBUG, "Tracking key (%@) %@ : %@", buf, 0x20u);
    }
  }
}

id __44__JFXAnalyticsManager_trackKey_withPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)trackKey:(id)a3 withCount:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v10 = @"itemCount";
  id v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithUnsignedLongLong:a4];
  v11[0] = v8;
  long long v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(JFXAnalyticsManager *)self trackKey:v7 withPayload:v9];
}

- (BOOL)isIncrementScalar:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = +[JFXAnalyticsKeys allIncrementScalarEffectEvents];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          char v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v4 = +[JFXAnalyticsKeys allIncrementScalarEvents];
  char v9 = [v4 containsObject:v3];
LABEL_11:

  return v9;
}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken_0 != -1) {
    dispatch_once(&allIncrementScalarEvents_onceToken_0, &__block_literal_global_31_0);
  }
  v2 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_0;
  return v2;
}

void __47__JFXAnalyticsManager_allIncrementScalarEvents__block_invoke()
{
  v2[10] = *MEMORY[0x263EF8340];
  v2[0] = @"thermalnominaltolight";
  v2[1] = @"thermallighttomoderate";
  v2[2] = @"thermalmoderatetoheavy";
  v2[3] = @"thermalheavytotrapping";
  v2[4] = @"thermaltrappingtosleeping";
  v2[5] = @"thermalsleepingtotrapping";
  v2[6] = @"thermaltrappingtoheavy";
  v2[7] = @"thermalheavytomoderate";
  v2[8] = @"thermalmoderatetolight";
  v2[9] = @"thermallighttonominal";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:10];
  v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_0;
  allIncrementScalarEvents_allIncrementScalarEvents_0 = v0;
}

@end