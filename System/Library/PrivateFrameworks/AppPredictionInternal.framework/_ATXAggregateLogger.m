@interface _ATXAggregateLogger
+ (BOOL)isConversionOutcome:(unint64_t)a3;
+ (BOOL)yesWithProbability:(double)a3;
+ (_ATXAggregateLogger)sharedInstance;
+ (id)notificationOutcomesMapping;
+ (id)predictedItemOutcomesMapping;
+ (id)predictionOutcomesMapping;
+ (id)propertyStringForLaunchReason:(id)a3;
+ (id)stringForPredictedItemOutcome:(unint64_t)a3;
+ (id)stringForPredictionOutcome:(unint64_t)a3;
+ (id)suggestionCountsArray;
+ (int64_t)getBuildType;
+ (void)yesWithProbabilityAlwaysSays:(BOOL)a3;
+ (void)yesWithProbabilityStopMocking;
- (_ATXAggregateLogger)init;
- (void)logAppLaunch:(id)a3 bundleId:(id)a4;
- (void)logInputs:(const float *)a3 andScore:(float)a4 withOutcome:(unint64_t)a5;
- (void)logLaunchEventWithLaunchReason:(id)a3 predicted:(BOOL)a4 position:(int64_t)a5;
- (void)logNotificationInteraction:(int64_t)a3 orbed:(BOOL)a4 onscreen:(BOOL)a5;
- (void)logPredictUninstalledApps:(unint64_t)a3 consumerSubType:(unsigned __int8)a4;
- (void)logPredictionEventWith:(id)a3 outcome:(unint64_t)a4 forABGroup:(id)a5 consumerType:(unint64_t)a6 andSubType:(unsigned __int8)a7;
- (void)logPredictionOfAppWithBundleId:(id)a3 inputs:(const float *)a4 outcome:(unint64_t)a5 rank:(unint64_t)a6 score:(float)a7 forABGroup:(id)a8;
@end

@implementation _ATXAggregateLogger

- (_ATXAggregateLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXAggregateLogger;
  v2 = [(_ATXAggregateLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[_ATXBundleIdSet sharedInstance];
    bundleIdSet = v2->_bundleIdSet;
    v2->_bundleIdSet = (_ATXBundleIdSet *)v3;

    v2->_buildType = +[_ATXAggregateLogger getBuildType];
  }
  return v2;
}

+ (int64_t)getBuildType
{
  if ([MEMORY[0x1E4F93B08] isBetaBuild])
  {
    v2 = __atxlog_handle_default();
    int64_t v3 = 1;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = 0;
      v4 = "Seed build detected";
      int64_t v3 = 1;
      v5 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_INFO, v4, v5, 2u);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4F93B08] isInternalBuild];
    v2 = __atxlog_handle_default();
    BOOL v7 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);
    if (!v6)
    {
      if (!v7)
      {
        int64_t v3 = 2;
        goto LABEL_12;
      }
      __int16 v9 = 0;
      v4 = "Customer build detected";
      int64_t v3 = 2;
      v5 = (uint8_t *)&v9;
      goto LABEL_10;
    }
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_INFO, "Internal build detected", buf, 2u);
    }
    int64_t v3 = 0;
  }
LABEL_12:

  return v3;
}

+ (_ATXAggregateLogger)sharedInstance
{
  if (sharedInstance__pasOnceToken9_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken9_0, &__block_literal_global_157);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_36;
  return (_ATXAggregateLogger *)v2;
}

+ (id)predictionOutcomesMapping
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
  for (uint64_t i = 0; i != 8; ++i)
  {
    v4 = +[_ATXAggregateLogger stringForPredictionOutcome:i];
    v5 = [NSNumber numberWithUnsignedInteger:i];
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
  return v2;
}

+ (id)predictedItemOutcomesMapping
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
  for (uint64_t i = 0; i != 5; ++i)
  {
    v4 = +[_ATXAggregateLogger stringForPredictedItemOutcome:i];
    v5 = [NSNumber numberWithUnsignedInteger:i];
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
  return v2;
}

+ (id)suggestionCountsArray
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
  for (uint64_t i = 0; i != 10; ++i)
  {
    v4 = ATXSuggestionTypeToString();
    [v2 setObject:v4 atIndexedSubscript:i];
  }
  return v2;
}

+ (id)notificationOutcomesMapping
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:27];
  for (uint64_t i = 0; i != 27; ++i)
  {
    v4 = ATXNEventTypeToString();
    v5 = [NSNumber numberWithInteger:i];
    [v2 setObject:v4 forKeyedSubscript:v5];
  }
  int v6 = (void *)[v2 copy];

  return v6;
}

- (void)logLaunchEventWithLaunchReason:(id)a3 predicted:(BOOL)a4 position:(int64_t)a5
{
  BOOL v6 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)MEMORY[0x1D25F6CC0]();
  __int16 v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"launchReason"];
  v10 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"position"];
  id v11 = objc_alloc(MEMORY[0x1E4F93738]);
  v18[0] = v9;
  v18[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v13 = (void *)[v11 initWithFeatureId:@"AppPredictions" event:@"allLaunches" registerProperties:v12];

  v14 = +[_ATXAggregateLogger propertyStringForLaunchReason:v7];
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a5);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = @"notPredicted";
  }
  v17[0] = v14;
  v17[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v13 trackEventWithPropertyValues:v16];
}

- (void)logPredictionEventWith:(id)a3 outcome:(unint64_t)a4 forABGroup:(id)a5 consumerType:(unint64_t)a6 andSubType:(unsigned __int8)a7
{
  unsigned int v59 = a7;
  v81[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v9 = a5;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v10 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"abGroup"];
  id v11 = (void *)MEMORY[0x1E4F93720];
  v12 = +[_ATXAggregateLogger predictionOutcomesMapping];
  v66 = [v11 propertyWithName:@"outcomeType" enumMapping:v12 autoSanitizeValues:1];

  v13 = (void *)MEMORY[0x1E4F93720];
  v14 = [MEMORY[0x1E4F4B680] consumerMapping];
  v67 = [v13 propertyWithName:@"consumerType" enumMapping:v14 autoSanitizeValues:1];

  v15 = (void *)MEMORY[0x1E4F93720];
  v16 = [MEMORY[0x1E4F4B680] consumerSubtypeMapping];
  v17 = [v15 propertyWithName:@"consumerSubType" enumMapping:v16 autoSanitizeValues:1];

  v60 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"itemsShown", 0, 8, 1);
  id v18 = objc_alloc(MEMORY[0x1E4F93738]);
  v81[0] = v10;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  v20 = (void *)[v18 initWithFeatureId:@"AppPredictions" event:@"predictions" registerProperties:v19];

  id v21 = objc_alloc(MEMORY[0x1E4F93738]);
  v80 = v10;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
  v64 = (void *)[v21 initWithFeatureId:@"AppPredictions" event:@"conversions" registerProperties:v22];

  v63 = v9;
  id v79 = v9;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v58 = v20;
  [v20 trackEventWithPropertyValues:v23];

  if (+[_ATXAggregateLogger isConversionOutcome:a4])
  {
    id v78 = v9;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    [v64 trackEventWithPropertyValues:v24];
  }
  id v25 = objc_alloc(MEMORY[0x1E4F93738]);
  v77[0] = v10;
  v77[1] = v66;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  v56 = (void *)[v25 initWithFeatureId:@"AppPredictions" event:@"outcome" registerProperties:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F93738]);
  v76[0] = v10;
  v76[1] = v67;
  v76[2] = v17;
  v76[3] = v66;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
  v65 = (void *)[v27 initWithFeatureId:@"AppPredictions" event:@"consumerOutcome" registerProperties:v28];

  id v29 = objc_alloc(MEMORY[0x1E4F93718]);
  v75[0] = v10;
  v75[1] = v67;
  v75[2] = v17;
  v75[3] = v66;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:4];
  v54 = (void *)[v29 initWithFeatureId:@"AppPredictions" event:@"consumerOutcomeWithCacheAge" registerProperties:v30];

  id v31 = objc_alloc(MEMORY[0x1E4F93718]);
  v74[0] = v10;
  v74[1] = v67;
  v74[2] = v17;
  v74[3] = v66;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
  v55 = (void *)[v31 initWithFeatureId:@"AppPredictions" event:@"consumerOutcomeCacheAgeHistogram" registerProperties:v32];

  v73[0] = v9;
  v33 = [NSNumber numberWithUnsignedInteger:a4];
  v73[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  [v56 trackEventWithPropertyValues:v34];

  v72[0] = v63;
  v35 = [NSNumber numberWithUnsignedInteger:a6];
  v72[1] = v35;
  v36 = [NSNumber numberWithUnsignedChar:v59];
  v72[2] = v36;
  v37 = [NSNumber numberWithUnsignedInteger:a4];
  v72[3] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
  [v65 trackEventWithPropertyValues:v38];

  +[ATXFileUtil cacheAgeForConsumerType:v59];
  double v40 = v39;
  v71[0] = v63;
  v41 = [NSNumber numberWithUnsignedInteger:a6];
  v71[1] = v41;
  v42 = [NSNumber numberWithUnsignedChar:v59];
  v71[2] = v42;
  v43 = [NSNumber numberWithUnsignedInteger:a4];
  v71[3] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:4];
  [v54 trackEventWithPropertyValues:v44 value:v40];

  v70[0] = v63;
  v45 = [NSNumber numberWithUnsignedInteger:a6];
  v70[1] = v45;
  v46 = [NSNumber numberWithUnsignedChar:v59];
  v70[2] = v46;
  v47 = [NSNumber numberWithUnsignedInteger:a4];
  v70[3] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];
  [v55 trackEventWithPropertyValues:v48 value:v40];

  id v49 = objc_alloc(MEMORY[0x1E4F93738]);
  v69 = v60;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v51 = (void *)[v49 initWithFeatureId:@"AppPredictions" event:@"predictionItemsShown" registerProperties:v50];

  v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v62, "count"));
  v68 = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  [v51 trackEventWithPropertyValues:v53];
}

- (void)logInputs:(const float *)a3 andScore:(float)a4 withOutcome:(unint64_t)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1D25F6CC0](self, a2, a3);
  v8 = (void *)MEMORY[0x1E4F93720];
  id v9 = +[_ATXAggregateLogger predictedItemOutcomesMapping];
  v10 = [v8 propertyWithName:@"outcome" enumMapping:v9 autoSanitizeValues:1];

  id v11 = objc_alloc(MEMORY[0x1E4F93718]);
  v17[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v13 = (void *)[v11 initWithFeatureId:@"AppPredictions" event:@"score" registerProperties:v12];

  v14 = [NSNumber numberWithUnsignedInteger:a5];
  v16 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v13 trackEventWithPropertyValues:v15 value:a4];
}

- (void)logPredictionOfAppWithBundleId:(id)a3 inputs:(const float *)a4 outcome:(unint64_t)a5 rank:(unint64_t)a6 score:(float)a7 forABGroup:(id)a8
{
  v46[2] = *MEMORY[0x1E4F143B8];
  v14 = (__CFString *)a3;
  id v15 = a8;
  v42 = (void *)MEMORY[0x1D25F6CC0]();
  BOOL v16 = ([(__CFString *)v14 hasPrefix:@"com.apple"] & 1) != 0
     || [(_ATXBundleIdSet *)self->_bundleIdSet containsBundleId:v14];
  v17 = __atxlog_handle_default();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[_ATXAggregateLogger logPredictionOfAppWithBundleId:inputs:outcome:rank:score:forABGroup:]((uint64_t)v14, v16, v17);
  }

  int64_t buildType = self->_buildType;
  v19 = v14;
  switch(buildType)
  {
    case 0:
      goto LABEL_11;
    case 2:
      if ([(id)objc_opt_class() yesWithProbability:0.1])
      {
LABEL_9:
        v19 = @"redactedBundleId";
        if (v16) {
          v19 = v14;
        }
LABEL_11:
        v20 = v19;
        id v21 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"bundleId"];
        id v40 = v15;
        v22 = (void *)MEMORY[0x1E4F93720];
        +[_ATXAggregateLogger predictedItemOutcomesMapping];
        v23 = unint64_t v39 = a6;
        v24 = [v22 propertyWithName:@"outcomeType" enumMapping:v23 autoSanitizeValues:1];

        id v25 = objc_alloc(MEMORY[0x1E4F93738]);
        v46[0] = v21;
        v46[1] = v24;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
        id v27 = v26 = a4;
        v28 = (void *)[v25 initWithFeatureId:@"AppPredictions" event:@"predictedApp" registerProperties:v27];

        v41 = v20;
        v45[0] = v20;
        id v29 = [NSNumber numberWithUnsignedInteger:a5];
        v45[1] = v29;
        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
        [v28 trackEventWithPropertyValues:v30];

        *(float *)&double v31 = a7;
        [(_ATXAggregateLogger *)self logInputs:v26 andScore:a5 withOutcome:v31];

        a6 = v39;
        id v15 = v40;

        goto LABEL_14;
      }
      break;
    case 1:
      goto LABEL_9;
  }
  v41 = 0;
LABEL_14:
  if (!a5)
  {
    v32 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"abGroup"];
    v33 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"position", 0, 8, 1);
    id v34 = objc_alloc(MEMORY[0x1E4F93738]);
    v44[0] = v32;
    v44[1] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v36 = (void *)[v34 initWithFeatureId:@"AppPredictions" event:@"conversionAtPosition" registerProperties:v35];

    v43[0] = v15;
    v37 = [NSNumber numberWithUnsignedInteger:a6];
    v43[1] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [v36 trackEventWithPropertyValues:v38];
  }
}

- (void)logPredictUninstalledApps:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)MEMORY[0x1E4F93720];
  id v7 = [MEMORY[0x1E4F4B680] consumerSubtypeMapping];
  v8 = [v6 propertyWithName:@"consumerSubType" enumMapping:v7 autoSanitizeValues:1];

  id v9 = objc_alloc(MEMORY[0x1E4F93738]);
  v15[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v11 = (void *)[v9 initWithFeatureId:@"AppPredictions" event:@"predictUninstalledApps" registerProperties:v10];

  v12 = [NSNumber numberWithUnsignedChar:v4];
  v14 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v11 trackEventWithPropertyValues:v13 value:a3];
}

- (void)logNotificationInteraction:(int64_t)a3 orbed:(BOOL)a4 onscreen:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v22[3] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F93720];
  id v9 = +[_ATXAggregateLogger notificationOutcomesMapping];
  v10 = [v8 propertyWithName:@"outcome" enumMapping:v9 autoSanitizeValues:1];

  id v11 = [MEMORY[0x1E4F93720] propertyWithName:@"screen" possibleValues:&unk_1F27F36C0];
  v12 = [MEMORY[0x1E4F93720] propertyWithName:@"orb" possibleValues:&unk_1F27F36D8];
  id v13 = objc_alloc(MEMORY[0x1E4F93738]);
  v22[0] = v10;
  v22[1] = v12;
  v22[2] = v11;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  id v15 = (void *)[v13 initWithFeatureId:@"AppNotifications" event:@"interaction" registerProperties:v14];

  uint64_t v16 = [NSNumber numberWithInteger:a3];
  v17 = (void *)v16;
  id v18 = @"no";
  if (v6) {
    id v18 = @"yes";
  }
  v21[0] = v16;
  v21[1] = v18;
  v19 = @"history";
  if (v5) {
    v19 = @"lockscreen";
  }
  v21[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  [v15 trackEventWithPropertyValues:v20];
}

- (void)logAppLaunch:(id)a3 bundleId:(id)a4
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F93720];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 freeValuedPropertyWithName:@"from"];
  id v9 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"bundleId"];
  id v10 = objc_alloc(MEMORY[0x1E4F93738]);
  v15[0] = v8;
  v15[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = (void *)[v10 initWithFeatureId:@"AppPredictions" event:@"limitedAppLaunch" registerProperties:v11];

  v14[0] = v7;
  v14[1] = v6;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  [v12 trackEventWithPropertyValues:v13];
}

+ (BOOL)yesWithProbability:(double)a3
{
  unsigned int v3 = atomic_load((unsigned int *)&yesWithProbabilityOverride);
  if ((v3 & 0x80000000) != 0) {
    return (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < a3;
  }
  else {
    return v3 != 0;
  }
}

+ (void)yesWithProbabilityAlwaysSays:(BOOL)a3
{
}

+ (void)yesWithProbabilityStopMocking
{
}

+ (BOOL)isConversionOutcome:(unint64_t)a3
{
  return a3 - 9 < 0xFFFFFFFFFFFFFFF9;
}

+ (id)stringForPredictionOutcome:(unint64_t)a3
{
  if (a3 >= 8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"_ATXAggregateLogger.m", 302, @"Invalid parameter not satisfying: %@", @"outcome >= 0 && outcome < _ATXPredictionOutcomeMax" object file lineNumber description];
  }
  if (a3 - 1 > 7) {
    return @"convertedAppExpert";
  }
  else {
    return off_1E68B3908[a3 - 1];
  }
}

+ (id)stringForPredictedItemOutcome:(unint64_t)a3
{
  if (a3 >= 5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"_ATXAggregateLogger.m", 327, @"Invalid parameter not satisfying: %@", @"outcome >= 0 && outcome < _ATXPredictedItemOutcomeMax" object file lineNumber description];
  }
  if (a3 > 5) {
    return @"abandoned";
  }
  else {
    return off_1E68B3948[a3];
  }
}

+ (id)propertyStringForLaunchReason:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  BOOL v5 = (void *)*MEMORY[0x1E4FA6D68];
  if ([v3 hasPrefix:*MEMORY[0x1E4FA6D68]])
  {
    [v4 appendString:@"Backlight-"];
  }
  else
  {
    BOOL v5 = (void *)*MEMORY[0x1E4FA6E20];
    if (![v3 hasPrefix:*MEMORY[0x1E4FA6E20]])
    {
      v8 = @"LaunchReasonUnknown";
      goto LABEL_8;
    }
  }
  id v6 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v5, "length"));

  if ([v6 hasPrefix:@"."])
  {
    uint64_t v7 = [v6 substringFromIndex:1];

    id v6 = (void *)v7;
  }
  [v4 appendString:v6];
  v8 = (__CFString *)[v4 copy];
  id v3 = v6;
LABEL_8:

  return v8;
}

- (void).cxx_destruct
{
}

- (void)logPredictionOfAppWithBundleId:(os_log_t)log inputs:outcome:rank:score:forABGroup:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "Bundleid %@ in approved list: %{BOOL}d", (uint8_t *)&v3, 0x12u);
}

@end