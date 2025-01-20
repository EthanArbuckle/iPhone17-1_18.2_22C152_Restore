@interface _DKSync2Policy
+ (BOOL)cloudSyncDisabled;
+ (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4;
+ (BOOL)rapportSyncDisabled;
+ (NSObject)configurationPlistForFilename:(uint64_t)a1;
+ (id)_policyForSyncTransportType:(uint64_t)a1;
+ (id)disabledFeaturesForSyncType:(id)a3 transports:(int64_t)a4;
+ (id)featureNameFromFeatureType:(unint64_t)a3;
+ (id)getDisabledFeaturesForTransportType:(uint64_t)a1;
+ (id)internalFeatureNameFromFeatureName:(id)a3;
+ (id)policyCache;
+ (id)policyForSyncTransportType:(int64_t)a3;
+ (id)policyFromDictionary:(id)a3;
+ (id)productVersion;
+ (id)removeDisabledFeaturesStreamsForTransportType:(void *)a3 fromDictionary:;
+ (id)syncPolicyConfigPathForFilename:(uint64_t)a1;
+ (id)userDefaults;
+ (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 disabled:(BOOL)a5;
+ (void)handleDownloadSyncPolicyResponse:(void *)a3 data:(void *)a4 error:;
+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(uint64_t)a1;
+ (void)setOkToDownloadPolicyUpdates:(BOOL)a3;
- (BOOL)canDeferSyncOperationWithSyncType:(id)a3;
- (BOOL)canPerformSyncOperationWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 isCharging:(BOOL)a6;
- (BOOL)highPriorityForSyncDownWithSyncType:(id)a3;
- (BOOL)highPriorityForSyncUpWithSyncType:(id)a3 lastSyncDate:(id)a4;
- (BOOL)pushTriggersSync;
- (BOOL)requireCharging;
- (BOOL)syncDisabled;
- (NSArray)streamNamesToAlwaysSync;
- (NSArray)streamNamesWithAdditionsTriggeringSync;
- (NSArray)streamNamesWithDeletionsTriggeringSync;
- (NSDictionary)streamNamesToSync;
- (NSNumber)version;
- (NSString)name;
- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3;
- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3 urgency:(unint64_t)a4;
- (id)description;
- (id)queryStartDateWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 previousHighWaterMark:(id)a6;
- (id)queryStartDateWithSyncType:(id)a3 previousHighWaterMark:(id)a4;
- (id)queryStartDateWithSyncType:(void *)a1 lastSyncDate:(uint64_t)a2 lastDaySyncCount:(void *)a3;
- (id)streamNamesToSyncWithDisabledFeatures:(id)a3;
- (id)streamNamesToSyncWithSyncType:(id)a3 transportType:(int64_t)a4;
- (uint64_t)initWithDictionary:(uint64_t *)a1;
- (unint64_t)maxBatchesPerSync;
- (unint64_t)maxSyncDownIntervalInDays;
- (unint64_t)maxSyncPeriodInDays;
- (unint64_t)maxSyncsPerDay;
- (unint64_t)minSyncIntervalInSeconds;
- (unint64_t)minSyncWindowInSeconds;
- (unint64_t)minSyncsPerDay;
- (unint64_t)numChangesTriggeringSync;
- (unint64_t)policyDownloadIntervalInDays;
- (unint64_t)singleDeviceSyncIntervalInDays;
- (unint64_t)syncBatchSizeInEvents;
- (unint64_t)syncTimeoutInSeconds;
- (unint64_t)triggeredSyncDelayInSeconds;
- (void)setMaxBatchesPerSync:(unint64_t)a3;
- (void)setMaxSyncDownIntervalInDays:(unint64_t)a3;
- (void)setMaxSyncPeriodInDays:(unint64_t)a3;
- (void)setMaxSyncsPerDay:(unint64_t)a3;
- (void)setMinSyncIntervalInSeconds:(unint64_t)a3;
- (void)setMinSyncWindowInSeconds:(unint64_t)a3;
- (void)setMinSyncsPerDay:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setNumChangesTriggeringSync:(unint64_t)a3;
- (void)setPolicyDownloadIntervalInDays:(unint64_t)a3;
- (void)setPushTriggersSync:(BOOL)a3;
- (void)setRequireCharging:(BOOL)a3;
- (void)setSingleDeviceSyncIntervalInDays:(unint64_t)a3;
- (void)setStreamNamesToAlwaysSync:(id)a3;
- (void)setStreamNamesToSync:(id)a3;
- (void)setStreamNamesWithAdditionsTriggeringSync:(id)a3;
- (void)setStreamNamesWithDeletionsTriggeringSync:(id)a3;
- (void)setSyncBatchSizeInEvents:(unint64_t)a3;
- (void)setSyncDisabled:(BOOL)a3;
- (void)setSyncTimeoutInSeconds:(unint64_t)a3;
- (void)setTriggeredSyncDelayInSeconds:(unint64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation _DKSync2Policy

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  v6 = [(_DKSync2Policy *)self name];
  [v3 appendFormat:@"                                   name: %@\n", v6];

  if ([(_DKSync2Policy *)self syncDisabled]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"                           syncDisabled: %@\n", v7];
  if (+[_DKSync2Policy cloudSyncDisabled])
  {
    if (+[_DKSync2Policy cloudSyncDisabled]) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    [v3 appendFormat:@"                      cloudSyncDisabled: %@\n", v8];
  }
  if (+[_DKSync2Policy rapportSyncDisabled])
  {
    if (+[_DKSync2Policy rapportSyncDisabled]) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    [v3 appendFormat:@"                    rapportSyncDisabled: %@\n", v9];
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncDownIntervalInDays](self, "maxSyncDownIntervalInDays"));
  [v3 appendFormat:@"              maxSyncDownIntervalInDays: %@\n", v10];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncPeriodInDays](self, "maxSyncPeriodInDays"));
  [v3 appendFormat:@"                    maxSyncPeriodInDays: %@\n", v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncIntervalInSeconds](self, "minSyncIntervalInSeconds"));
  [v3 appendFormat:@"               minSyncIntervalInSeconds: %@\n", v12];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncWindowInSeconds](self, "minSyncWindowInSeconds"));
  [v3 appendFormat:@"                 minSyncWindowInSeconds: %@\n", v13];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy minSyncsPerDay](self, "minSyncsPerDay"));
  [v3 appendFormat:@"                         minSyncsPerDay: %@\n", v14];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy maxSyncsPerDay](self, "maxSyncsPerDay"));
  [v3 appendFormat:@"                         maxSyncsPerDay: %@\n", v15];

  if ([(_DKSync2Policy *)self numChangesTriggeringSync])
  {
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy numChangesTriggeringSync](self, "numChangesTriggeringSync"));
    [v3 appendFormat:@"               numChangesTriggeringSync: %@\n", v16];
  }
  else
  {
    [v3 appendFormat:@"               numChangesTriggeringSync: %@\n", @"disabled"];
  }
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy policyDownloadIntervalInDays](self, "policyDownloadIntervalInDays"));
  [v3 appendFormat:@"           policyDownloadIntervalInDays: %@\n", v17];

  if ([(_DKSync2Policy *)self pushTriggersSync]) {
    v18 = @"YES";
  }
  else {
    v18 = @"NO";
  }
  [v3 appendFormat:@"                       pushTriggersSync: %@\n", v18];
  if ([(_DKSync2Policy *)self requireCharging]) {
    v19 = @"YES";
  }
  else {
    v19 = @"NO";
  }
  [v3 appendFormat:@"                        requireCharging: %@\n", v19];
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays"));
  [v3 appendFormat:@"         singleDeviceSyncIntervalInDays: %@\n", v20];

  v21 = [(_DKSync2Policy *)self streamNamesToSync];
  v22 = _CDPrettyPrintCollection(v21, 0, 0, 0);
  [v3 appendFormat:@"                      streamNamesToSync: %@\n", v22];

  v23 = [(_DKSync2Policy *)self streamNamesToAlwaysSync];
  v24 = _CDPrettyPrintCollection(v23, 0, 0, 0);
  [v3 appendFormat:@"                streamNamesToAlwaysSync: %@\n", v24];

  v25 = [(_DKSync2Policy *)self streamNamesWithAdditionsTriggeringSync];
  v26 = _CDPrettyPrintCollection(v25, 0, 0, 0);
  [v3 appendFormat:@" streamNamesWithAdditionsTriggeringSync: %@\n", v26];

  v27 = [(_DKSync2Policy *)self streamNamesWithDeletionsTriggeringSync];
  v28 = _CDPrettyPrintCollection(v27, 0, 0, 0);
  [v3 appendFormat:@" streamNamesWithDeletionsTriggeringSync: %@\n", v28];

  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy syncBatchSizeInEvents](self, "syncBatchSizeInEvents"));
  [v3 appendFormat:@"                  syncBatchSizeInEvents: %@\n", v29];

  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy maxBatchesPerSync](self, "maxBatchesPerSync"));
  [v3 appendFormat:@"                      maxBatchesPerSync: %@\n", v30];

  v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy syncTimeoutInSeconds](self, "syncTimeoutInSeconds"));
  [v3 appendFormat:@"                   syncTimeoutInSeconds: %@\n", v31];

  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSync2Policy triggeredSyncDelayInSeconds](self, "triggeredSyncDelayInSeconds"));
  [v3 appendFormat:@"            triggeredSyncDelayInSeconds: %@\n", v32];

  [v3 appendString:@"}\n"];
  return v3;
}

+ (id)userDefaults
{
  self;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  return v0;
}

+ (id)policyCache
{
  self;
  if (policyCache_onceToken != -1) {
    dispatch_once(&policyCache_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)policyCache_policyCache;
  return v0;
}

+ (id)policyForSyncTransportType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = @"CloudDown";
  v5 = &stru_1EDDE58B8;
  if (a3 == 8) {
    v5 = @"CloudUp";
  }
  if (a3 != 4) {
    v4 = v5;
  }
  if (a3 == 1) {
    v6 = @"Rapport";
  }
  else {
    v6 = v4;
  }
  v7 = +[_DKSync2Policy policyCache]();
  v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    v8 = +[_DKSync2Policy _policyForSyncTransportType:]((uint64_t)_DKSync2Policy, a3);
    if (v8)
    {
      v9 = +[_DKSync2Policy policyCache]();
      [v9 setObject:v8 forKey:v6];

      v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = [(id)objc_opt_class() description];
        int v13 = 138543874;
        v14 = v12;
        __int16 v15 = 2114;
        v16 = v6;
        __int16 v17 = 2114;
        v18 = v8;
        _os_log_debug_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Policy for transport %{public}@: %{public}@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  return v8;
}

+ (id)_policyForSyncTransportType:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = self;
  switch(a2)
  {
    case 1:
      v4 = @"Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.rp.dn";
      goto LABEL_7;
    case 8:
      v4 = @"Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.ck.up";
      goto LABEL_7;
    case 4:
      v4 = @"Policies/com.apple.coreduet.knowledge.syncPolicies2.ios.ck.dn";
LABEL_7:
      v5 = objc_opt_new();
      v6 = +[_DKSync2Policy configurationPlistForFilename:]((uint64_t)v3, v4);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 addEntriesFromDictionary:v6];
      }
      v7 = [v6 objectForKeyedSubscript:@"Version"];
      [v7 floatValue];
      float v9 = v8;

      v10 = +[_DKSync2Policy userDefaults]();
      v11 = [v10 objectForKey:@"CloudSync2Policies"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = @"CloudDown";
        int v13 = &stru_1EDDE58B8;
        if (a2 == 8) {
          int v13 = @"CloudUp";
        }
        if (a2 != 4) {
          v12 = v13;
        }
        if (a2 == 1) {
          v14 = @"Rapport";
        }
        else {
          v14 = v12;
        }
        __int16 v15 = [v11 objectForKeyedSubscript:v14];
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [v15 objectForKeyedSubscript:@"Version"];
            if (!v16
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
              || ([v16 floatValue], v17 < v9))
            {
              v18 = +[_CDLogging syncChannel];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                v29 = [(id)objc_opt_class() description];
                *(_DWORD *)buf = 138543618;
                v31 = v29;
                __int16 v32 = 2112;
                v33 = v14;
                _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "%{public}@: Cloud policy for %@ is invalid and/or old. Removing saved policies from defaults.", buf, 0x16u);
              }
              uint64_t v19 = +[_DKSync2Policy userDefaults]();
              [v19 removeObjectForKey:@"CloudSync2Policies"];

              __int16 v15 = (void *)MEMORY[0x1E4F1CC08];
              v11 = (void *)MEMORY[0x1E4F1CC08];
            }
          }
        }
        if ([v15 count])
        {
          v20 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v28 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = 138543874;
            v31 = v28;
            __int16 v32 = 2114;
            v33 = v14;
            __int16 v34 = 2114;
            v35 = v15;
            _os_log_debug_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Using remote policy override for %{public}@: %{public}@", buf, 0x20u);
          }
        }
        [v5 addEntriesFromDictionary:v15];
      }
      v21 = +[_DKSync2Policy userDefaults]();
      v22 = [v21 objectForKey:@"CloudSync2Policy"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v22 count])
        {
          v23 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            +[_DKSync2Policy _policyForSyncTransportType:]();
          }
        }
        [v5 addEntriesFromDictionary:v22];
      }
      +[_DKSync2Policy removeDisabledFeaturesStreamsForTransportType:fromDictionary:]((uint64_t)_DKSync2Policy, a2, v5);
      objc_claimAutoreleasedReturnValue();

      v24 = [v3 policyFromDictionary:v5];
      if (+[_DKCloudUtilities isUnitTesting]
        && [v24 syncDisabled])
      {
        v25 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = [(id)objc_opt_class() description];
          *(_DWORD *)buf = 138543362;
          v31 = v26;
          _os_log_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_INFO, "%{public}@: Enabling sync due to unit testing", buf, 0xCu);
        }
        [v24 setSyncDisabled:0];
      }

      goto LABEL_45;
  }
  v24 = objc_opt_new();
  [v24 setSyncDisabled:1];
  v5 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[_DKSync2Policy _policyForSyncTransportType:]();
  }
LABEL_45:

  return v24;
}

+ (id)featureNameFromFeatureType:(unint64_t)a3
{
  if (a3) {
    return @"ScreenTime";
  }
  v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[_DKSync2Policy featureNameFromFeatureType:]();
  }

  return 0;
}

+ (id)internalFeatureNameFromFeatureName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ScreenTime"])
  {
    v4 = @"DigitalHealth";
  }
  else
  {
    v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_DKSync2Policy internalFeatureNameFromFeatureName:]();
    }

    v4 = @"No name";
  }

  return v4;
}

+ (void)disableSyncPolicyForFeature:(unint64_t)a3 transportType:(int64_t)a4 disabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v7 = +[_DKSync2Policy featureNameFromFeatureType:a3];
  float v8 = _DKSyncTransportName(a4);
  float v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [(id)objc_opt_class() description];
    int v21 = 138543874;
    v22 = v10;
    __int16 v23 = 2114;
    v24 = v7;
    __int16 v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_18ECEB000, v9, OS_LOG_TYPE_INFO, "%{public}@: Disable sync policy for feature: %{public}@ on transport: %{public}@", (uint8_t *)&v21, 0x20u);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = +[_DKSync2Policy userDefaults]();
  int v13 = [v12 valueForKey:@"DKSync2PolicyDisableSyncForFeature"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 addEntriesFromDictionary:v13];
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v15 = [v11 valueForKey:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v14 addEntriesFromDictionary:v15];
  }
  v16 = [NSNumber numberWithBool:v5];
  [v14 setValue:v16 forKey:v8];

  [v11 setValue:v14 forKey:v7];
  float v17 = +[_DKSync2Policy userDefaults]();
  [v17 setValue:v11 forKey:@"DKSync2PolicyDisableSyncForFeature"];

  v18 = (void *)_DKSync2PolicyDisableSyncPolicyForFeatures;
  _DKSync2PolicyDisableSyncPolicyForFeatures = (uint64_t)v11;
  id v19 = v11;

  v20 = +[_DKSync2Policy policyCache]();

  [v20 removeAllObjects];
}

+ (id)getDisabledFeaturesForTransportType:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = _DKSyncTransportName(a2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v5 = &OBJC_PROTOCOL____DKNotificationReceiver;
  id v6 = (id)_DKSync2PolicyDisableSyncPolicyForFeatures;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138543874;
    long long v20 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v21 = v9;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * v11);
        int v13 = -[__objc2_meth_list valueForKey:](v5[45].inst_meths, "valueForKey:", v12, v20);
        id v14 = [v13 valueForKey:v3];
        if ([v14 BOOLValue])
        {
          __int16 v15 = +[_DKSync2Policy internalFeatureNameFromFeatureName:v12];
          [v4 addObject:v15];

          v16 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            [(id)objc_opt_class() description];
            v18 = id v17 = v4;
            *(_DWORD *)buf = v20;
            uint64_t v27 = v18;
            __int16 v28 = 2114;
            uint64_t v29 = v12;
            __int16 v30 = 2114;
            v31 = v3;
            _os_log_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_INFO, "%{public}@: Sync policy is disabled for feature: %{public}@ on transport: %{public}@", buf, 0x20u);

            id v4 = v17;
            BOOL v5 = &OBJC_PROTOCOL____DKNotificationReceiver;
          }

          uint64_t v9 = v21;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v9);
  }

  return v4;
}

+ (id)removeDisabledFeaturesStreamsForTransportType:(void *)a3 fromDictionary:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  BOOL v5 = +[_DKSync2Policy getDisabledFeaturesForTransportType:]((uint64_t)_DKSync2Policy, a2);
  id v6 = [v4 valueForKey:@"StreamNamesToSync"];
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    uint64_t v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v13, (void)v17) & 1) == 0)
          {
            id v14 = [v8 valueForKey:v13];
            [v7 setValue:v14 forKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v4 setValue:v7 forKey:@"StreamNamesToSync"];
  }
  else
  {
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [(id)objc_opt_class() description];
      *(_DWORD *)buf = 138543874;
      long long v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = [v5 count];
      __int16 v26 = 2048;
      uint64_t v27 = [v6 count];
      _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "%{public}@: No disabled features, featuresCount = %lu, originalFeatureCount = %lu", buf, 0x20u);
    }
  }

  return v4;
}

+ (NSObject)configurationPlistForFilename:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = +[_DKSync2Policy syncPolicyConfigPathForFilename:](v3, v2);
  if (!v4)
  {
    BOOL v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[_DKSync2Policy configurationPlistForFilename:]();
    }
    goto LABEL_9;
  }
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v4];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_DKSync2Policy configurationPlistForFilename:]();
    }

LABEL_9:
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)rapportSyncDisabled
{
  id v2 = +[_DKSync2Policy userDefaults]();
  uint64_t v3 = [v2 objectForKey:@"CloudSync2Policy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"RapportSyncDisabled"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isSyncPolicyDisabledForFeature:(unint64_t)a3 transportType:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  char v5 = +[_DKSync2Policy policyForSyncTransportType:a4];
  id v6 = v5;
  if (v5 && ![v5 syncDisabled])
  {
    uint64_t v7 = +[_DKSync2Policy featureNameFromFeatureType:a3];
    uint64_t v10 = +[_DKSync2Policy internalFeatureNameFromFeatureName:v7];
    uint64_t v12 = [v6 valueForKey:@"_streamNamesToSync"];
    uint64_t v13 = [v12 valueForKey:v10];
    id v14 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [(id)objc_opt_class() description];
      int v17 = 138544130;
      uint64_t v18 = (uint64_t)v15;
      __int16 v19 = 2112;
      long long v20 = v7;
      __int16 v21 = 2112;
      long long v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = [v12 count];
      _os_log_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_INFO, "%{public}@: isSyncPolicyDisabledForFeature: featureName:%@ internal:%@ streamNamesToSync.count = %lu", (uint8_t *)&v17, 0x2Au);
    }
    BOOL v8 = v13 == 0;

    goto LABEL_10;
  }
  uint64_t v7 = +[_CDLogging syncChannel];
  BOOL v8 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(id)objc_opt_class() description];
    uint64_t v10 = (void *)v9;
    uint64_t v11 = @"has syncDisabled == YES";
    if (!v6) {
      uint64_t v11 = @"is nil";
    }
    int v17 = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2112;
    long long v20 = v11;
    _os_log_impl(&dword_18ECEB000, v7, OS_LOG_TYPE_INFO, "%{public}@: Sync Policy %@", (uint8_t *)&v17, 0x16u);
LABEL_10:
  }
  return v8;
}

+ (BOOL)cloudSyncDisabled
{
  id v2 = +[_DKSync2Policy userDefaults]();
  uint64_t v3 = [v2 objectForKey:@"CloudSync2Policy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"CloudSyncDisabled"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)setOkToDownloadPolicyUpdates:(BOOL)a3
{
  id v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[_DKSync2Policy setOkToDownloadPolicyUpdates:]();
  }

  _DKSync2PolicyOkToDownloadPolicyUpdates = a3;
}

- (uint64_t)initWithDictionary:(uint64_t *)a1
{
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v194.receiver = a1;
    v194.super_class = (Class)_DKSync2Policy;
    id v4 = (uint64_t *)objc_msgSendSuper2(&v194, sel_init);

    if (!v4)
    {
LABEL_152:
      a1 = v4;

      goto LABEL_153;
    }
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v3 objectForKeyedSubscript:@"Name"];
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v11 = [v3 objectForKeyedSubscript:@"Name"];
    uint64_t v12 = v11;
    if (isKindOfClass)
    {
      [v4 setName:v11];
    }
    else
    {

      if (!v12) {
        goto LABEL_9;
      }
      uint64_t v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v178 = [(id)objc_opt_class() description];
        v177 = [v3 objectForKeyedSubscript:@"Name"];
        v105 = [v3 objectForKeyedSubscript:@"Name"];
        id v106 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v178;
        __int16 v197 = 2112;
        v198 = @"Name";
        __int16 v199 = 2112;
        v200 = v177;
        __int16 v201 = 2112;
        id v202 = v106;
        id v107 = v106;
        __int16 v203 = 2112;
        uint64_t v204 = v7;
        _os_log_error_impl(&dword_18ECEB000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_9:
    uint64_t v13 = [v3 objectForKeyedSubscript:@"Version"];
    char v14 = objc_opt_isKindOfClass();

    __int16 v15 = [v3 objectForKeyedSubscript:@"Version"];
    v16 = v15;
    if (v14)
    {
      [v4 setVersion:v15];
    }
    else
    {

      if (!v16) {
        goto LABEL_15;
      }
      v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v108 = [(id)objc_opt_class() description];
        v179 = [v3 objectForKeyedSubscript:@"Version"];
        v109 = [v3 objectForKeyedSubscript:@"Version"];
        id v110 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v108;
        __int16 v197 = 2112;
        v198 = @"Version";
        __int16 v199 = 2112;
        v200 = v179;
        __int16 v201 = 2112;
        id v202 = v110;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_15:
    int v17 = [v3 objectForKeyedSubscript:@"SyncDisabled"];
    char v18 = objc_opt_isKindOfClass();

    __int16 v19 = [v3 objectForKeyedSubscript:@"SyncDisabled"];
    long long v20 = v19;
    if (v18)
    {
      objc_msgSend(v4, "setSyncDisabled:", -[NSObject BOOLValue](v19, "BOOLValue"));
    }
    else
    {

      if (!v20) {
        goto LABEL_21;
      }
      long long v20 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v111 = [(id)objc_opt_class() description];
        v180 = [v3 objectForKeyedSubscript:@"SyncDisabled"];
        v112 = [v3 objectForKeyedSubscript:@"SyncDisabled"];
        id v113 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v111;
        __int16 v197 = 2112;
        v198 = @"SyncDisabled";
        __int16 v199 = 2112;
        v200 = v180;
        __int16 v201 = 2112;
        id v202 = v113;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_21:
    __int16 v21 = [v3 objectForKeyedSubscript:@"MaxBatchesPerSync"];
    char v22 = objc_opt_isKindOfClass();

    __int16 v23 = [v3 objectForKeyedSubscript:@"MaxBatchesPerSync"];
    uint64_t v24 = v23;
    if (v22)
    {
      objc_msgSend(v4, "setMaxBatchesPerSync:", -[NSObject unsignedIntegerValue](v23, "unsignedIntegerValue"));
    }
    else
    {

      if (!v24) {
        goto LABEL_27;
      }
      uint64_t v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v114 = [(id)objc_opt_class() description];
        v181 = [v3 objectForKeyedSubscript:@"MaxBatchesPerSync"];
        v115 = [v3 objectForKeyedSubscript:@"MaxBatchesPerSync"];
        id v116 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v114;
        __int16 v197 = 2112;
        v198 = @"MaxBatchesPerSync";
        __int16 v199 = 2112;
        v200 = v181;
        __int16 v201 = 2112;
        id v202 = v116;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_27:
    uint64_t v25 = [v3 objectForKeyedSubscript:@"MaxSyncPeriodInDays"];
    char v26 = objc_opt_isKindOfClass();

    uint64_t v27 = [v3 objectForKeyedSubscript:@"MaxSyncPeriodInDays"];
    uint64_t v28 = v27;
    if (v26)
    {
      objc_msgSend(v4, "setMaxSyncPeriodInDays:", -[NSObject unsignedIntegerValue](v27, "unsignedIntegerValue"));
    }
    else
    {

      if (!v28) {
        goto LABEL_33;
      }
      uint64_t v28 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v117 = [(id)objc_opt_class() description];
        v182 = [v3 objectForKeyedSubscript:@"MaxSyncPeriodInDays"];
        v118 = [v3 objectForKeyedSubscript:@"MaxSyncPeriodInDays"];
        id v119 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v117;
        __int16 v197 = 2112;
        v198 = @"MaxSyncPeriodInDays";
        __int16 v199 = 2112;
        v200 = v182;
        __int16 v201 = 2112;
        id v202 = v119;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_33:
    uint64_t v29 = [v3 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
    char v30 = objc_opt_isKindOfClass();

    v31 = [v3 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
    __int16 v32 = v31;
    if (v30)
    {
      objc_msgSend(v4, "setMaxSyncDownIntervalInDays:", -[NSObject unsignedIntegerValue](v31, "unsignedIntegerValue"));
    }
    else
    {

      if (!v32) {
        goto LABEL_39;
      }
      __int16 v32 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v120 = [(id)objc_opt_class() description];
        v183 = [v3 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
        v121 = [v3 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
        id v122 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v120;
        __int16 v197 = 2112;
        v198 = @"MaxSyncDownIntervalInDays";
        __int16 v199 = 2112;
        v200 = v183;
        __int16 v201 = 2112;
        id v202 = v122;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_39:
    uint64_t v33 = [v3 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
    char v34 = objc_opt_isKindOfClass();

    v35 = [v3 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
    uint64_t v36 = v35;
    if (v34)
    {
      objc_msgSend(v4, "setMinSyncIntervalInSeconds:", -[NSObject unsignedIntegerValue](v35, "unsignedIntegerValue"));
    }
    else
    {

      if (!v36) {
        goto LABEL_45;
      }
      uint64_t v36 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v123 = [(id)objc_opt_class() description];
        v184 = [v3 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
        v124 = [v3 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
        id v125 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v123;
        __int16 v197 = 2112;
        v198 = @"MinSyncIntervalInSeconds";
        __int16 v199 = 2112;
        v200 = v184;
        __int16 v201 = 2112;
        id v202 = v125;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v36, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_45:
    v37 = [v3 objectForKeyedSubscript:@"MinSyncWindowInSeconds"];
    char v38 = objc_opt_isKindOfClass();

    v39 = [v3 objectForKeyedSubscript:@"MinSyncWindowInSeconds"];
    v40 = v39;
    if (v38)
    {
      objc_msgSend(v4, "setMinSyncWindowInSeconds:", -[NSObject unsignedIntegerValue](v39, "unsignedIntegerValue"));
    }
    else
    {

      if (!v40) {
        goto LABEL_51;
      }
      v40 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v126 = [(id)objc_opt_class() description];
        v185 = [v3 objectForKeyedSubscript:@"MinSyncWindowInSeconds"];
        v127 = [v3 objectForKeyedSubscript:@"MinSyncWindowInSeconds"];
        id v128 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v126;
        __int16 v197 = 2112;
        v198 = @"MinSyncWindowInSeconds";
        __int16 v199 = 2112;
        v200 = v185;
        __int16 v201 = 2112;
        id v202 = v128;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v40, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_51:
    v41 = [v3 objectForKeyedSubscript:@"MinSyncsPerDay"];
    char v42 = objc_opt_isKindOfClass();

    v43 = [v3 objectForKeyedSubscript:@"MinSyncsPerDay"];
    v44 = v43;
    if (v42)
    {
      objc_msgSend(v4, "setMinSyncsPerDay:", -[NSObject unsignedIntegerValue](v43, "unsignedIntegerValue"));
    }
    else
    {

      if (!v44) {
        goto LABEL_57;
      }
      v44 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v129 = [(id)objc_opt_class() description];
        v186 = [v3 objectForKeyedSubscript:@"MinSyncsPerDay"];
        v130 = [v3 objectForKeyedSubscript:@"MinSyncsPerDay"];
        id v131 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v129;
        __int16 v197 = 2112;
        v198 = @"MinSyncsPerDay";
        __int16 v199 = 2112;
        v200 = v186;
        __int16 v201 = 2112;
        id v202 = v131;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_57:
    v45 = [v3 objectForKeyedSubscript:@"MaxSyncsPerDay"];
    char v46 = objc_opt_isKindOfClass();

    v47 = [v3 objectForKeyedSubscript:@"MaxSyncsPerDay"];
    v48 = v47;
    if (v46)
    {
      objc_msgSend(v4, "setMaxSyncsPerDay:", -[NSObject unsignedIntegerValue](v47, "unsignedIntegerValue"));
    }
    else
    {

      if (!v48) {
        goto LABEL_63;
      }
      v48 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v132 = [(id)objc_opt_class() description];
        v187 = [v3 objectForKeyedSubscript:@"MaxSyncsPerDay"];
        v133 = [v3 objectForKeyedSubscript:@"MaxSyncsPerDay"];
        id v134 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v132;
        __int16 v197 = 2112;
        v198 = @"MaxSyncsPerDay";
        __int16 v199 = 2112;
        v200 = v187;
        __int16 v201 = 2112;
        id v202 = v134;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_63:
    v49 = [v3 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
    char v50 = objc_opt_isKindOfClass();

    v51 = [v3 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
    v52 = v51;
    if (v50)
    {
      objc_msgSend(v4, "setNumChangesTriggeringSync:", -[NSObject unsignedIntegerValue](v51, "unsignedIntegerValue"));
    }
    else
    {

      if (!v52) {
        goto LABEL_69;
      }
      v52 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v135 = [(id)objc_opt_class() description];
        v188 = [v3 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
        v136 = [v3 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
        id v137 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v135;
        __int16 v197 = 2112;
        v198 = @"NumChangesTriggeringSync";
        __int16 v199 = 2112;
        v200 = v188;
        __int16 v201 = 2112;
        id v202 = v137;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v52, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_69:
    v53 = [v3 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
    char v54 = objc_opt_isKindOfClass();

    v55 = [v3 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
    v56 = v55;
    if (v54)
    {
      objc_msgSend(v4, "setPolicyDownloadIntervalInDays:", -[NSObject unsignedIntegerValue](v55, "unsignedIntegerValue"));
    }
    else
    {

      if (!v56) {
        goto LABEL_75;
      }
      v56 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v138 = [(id)objc_opt_class() description];
        v189 = [v3 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
        v139 = [v3 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
        id v140 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v138;
        __int16 v197 = 2112;
        v198 = @"PolicyDownloadIntervalInDays";
        __int16 v199 = 2112;
        v200 = v189;
        __int16 v201 = 2112;
        id v202 = v140;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v56, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_75:
    v57 = [v3 objectForKeyedSubscript:@"PushTriggersSync"];
    char v58 = objc_opt_isKindOfClass();

    v59 = [v3 objectForKeyedSubscript:@"PushTriggersSync"];
    v60 = v59;
    if (v58)
    {
      objc_msgSend(v4, "setPushTriggersSync:", -[NSObject BOOLValue](v59, "BOOLValue"));
    }
    else
    {

      if (!v60) {
        goto LABEL_81;
      }
      v60 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v141 = [(id)objc_opt_class() description];
        v190 = [v3 objectForKeyedSubscript:@"PushTriggersSync"];
        v142 = [v3 objectForKeyedSubscript:@"PushTriggersSync"];
        id v143 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v141;
        __int16 v197 = 2112;
        v198 = @"PushTriggersSync";
        __int16 v199 = 2112;
        v200 = v190;
        __int16 v201 = 2112;
        id v202 = v143;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v60, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_81:
    v61 = [v3 objectForKeyedSubscript:@"RequireCharging"];
    char v62 = objc_opt_isKindOfClass();

    v63 = [v3 objectForKeyedSubscript:@"RequireCharging"];
    v64 = v63;
    if (v62)
    {
      objc_msgSend(v4, "setRequireCharging:", -[NSObject BOOLValue](v63, "BOOLValue"));
    }
    else
    {

      if (!v64) {
        goto LABEL_87;
      }
      v64 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v144 = [(id)objc_opt_class() description];
        v191 = [v3 objectForKeyedSubscript:@"RequireCharging"];
        v145 = [v3 objectForKeyedSubscript:@"RequireCharging"];
        id v146 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v144;
        __int16 v197 = 2112;
        v198 = @"RequireCharging";
        __int16 v199 = 2112;
        v200 = v191;
        __int16 v201 = 2112;
        id v202 = v146;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v64, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_87:
    v65 = [v3 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
    char v66 = objc_opt_isKindOfClass();

    v67 = [v3 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
    v68 = v67;
    if (v66)
    {
      objc_msgSend(v4, "setSingleDeviceSyncIntervalInDays:", -[NSObject unsignedIntegerValue](v67, "unsignedIntegerValue"));
    }
    else
    {

      if (!v68) {
        goto LABEL_93;
      }
      v68 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v147 = [(id)objc_opt_class() description];
        v192 = [v3 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
        v148 = [v3 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
        id v149 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v147;
        __int16 v197 = 2112;
        v198 = @"SingleDeviceSyncIntervalInDays";
        __int16 v199 = 2112;
        v200 = v192;
        __int16 v201 = 2112;
        id v202 = v149;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v68, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_93:
    v69 = [v3 objectForKeyedSubscript:@"StreamNamesToSync"];
    char v70 = objc_opt_isKindOfClass();

    v71 = [v3 objectForKeyedSubscript:@"StreamNamesToSync"];
    v72 = v71;
    if (v70)
    {
      [v4 setStreamNamesToSync:v71];
    }
    else
    {

      if (!v72) {
        goto LABEL_99;
      }
      v72 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v150 = [(id)objc_opt_class() description];
        v193 = [v3 objectForKeyedSubscript:@"StreamNamesToSync"];
        v151 = [v3 objectForKeyedSubscript:@"StreamNamesToSync"];
        id v152 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v150;
        __int16 v197 = 2112;
        v198 = @"StreamNamesToSync";
        __int16 v199 = 2112;
        v200 = v193;
        __int16 v201 = 2112;
        id v202 = v152;
        __int16 v203 = 2112;
        uint64_t v204 = v8;
        _os_log_error_impl(&dword_18ECEB000, v72, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_99:
    v73 = [v3 objectForKeyedSubscript:@"StreamNamesToAlwaysSync"];
    char v74 = objc_opt_isKindOfClass();

    v75 = [v3 objectForKeyedSubscript:@"StreamNamesToAlwaysSync"];
    v76 = v75;
    if (v74)
    {
      [v4 setStreamNamesToAlwaysSync:v75];
    }
    else
    {

      if (!v76) {
        goto LABEL_105;
      }
      v76 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        v153 = [(id)objc_opt_class() description];
        v154 = [v3 objectForKeyedSubscript:@"StreamNamesToAlwaysSync"];
        v155 = [v3 objectForKeyedSubscript:@"StreamNamesToAlwaysSync"];
        id v156 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v153;
        __int16 v197 = 2112;
        v198 = @"StreamNamesToAlwaysSync";
        __int16 v199 = 2112;
        v200 = v154;
        __int16 v201 = 2112;
        id v202 = v156;
        __int16 v203 = 2112;
        uint64_t v204 = v6;
        _os_log_error_impl(&dword_18ECEB000, v76, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_105:
    v77 = [v3 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
    char v78 = objc_opt_isKindOfClass();

    v79 = [v3 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
    v80 = v79;
    if (v78)
    {
      [v4 setStreamNamesWithAdditionsTriggeringSync:v79];
    }
    else
    {

      if (!v80) {
        goto LABEL_111;
      }
      v80 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v157 = [(id)objc_opt_class() description];
        v158 = [v3 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
        v159 = [v3 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
        id v160 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v157;
        __int16 v197 = 2112;
        v198 = @"StreamNamesWithAdditionsTriggeringSync";
        __int16 v199 = 2112;
        v200 = v158;
        __int16 v201 = 2112;
        id v202 = v160;
        __int16 v203 = 2112;
        uint64_t v204 = v6;
        _os_log_error_impl(&dword_18ECEB000, v80, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_111:
    v81 = [v3 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
    char v82 = objc_opt_isKindOfClass();

    v83 = [v3 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
    v84 = v83;
    if (v82)
    {
      [v4 setStreamNamesWithDeletionsTriggeringSync:v83];
    }
    else
    {

      if (!v84) {
        goto LABEL_117;
      }
      v84 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v161 = [(id)objc_opt_class() description];
        v162 = [v3 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
        v163 = [v3 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
        id v164 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v161;
        __int16 v197 = 2112;
        v198 = @"StreamNamesWithDeletionsTriggeringSync";
        __int16 v199 = 2112;
        v200 = v162;
        __int16 v201 = 2112;
        id v202 = v164;
        __int16 v203 = 2112;
        uint64_t v204 = v6;
        _os_log_error_impl(&dword_18ECEB000, v84, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_117:
    v85 = [v3 objectForKeyedSubscript:@"SyncBatchSizeInEvents"];
    char v86 = objc_opt_isKindOfClass();

    v87 = [v3 objectForKeyedSubscript:@"SyncBatchSizeInEvents"];
    v88 = v87;
    if (v86)
    {
      objc_msgSend(v4, "setSyncBatchSizeInEvents:", -[NSObject unsignedIntegerValue](v87, "unsignedIntegerValue"));
    }
    else
    {

      if (!v88) {
        goto LABEL_123;
      }
      v88 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        v165 = [(id)objc_opt_class() description];
        v166 = [v3 objectForKeyedSubscript:@"SyncBatchSizeInEvents"];
        v167 = [v3 objectForKeyedSubscript:@"SyncBatchSizeInEvents"];
        id v168 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v165;
        __int16 v197 = 2112;
        v198 = @"SyncBatchSizeInEvents";
        __int16 v199 = 2112;
        v200 = v166;
        __int16 v201 = 2112;
        id v202 = v168;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v88, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_123:
    v89 = [v3 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
    char v90 = objc_opt_isKindOfClass();

    v91 = [v3 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
    v92 = v91;
    if (v90)
    {
      objc_msgSend(v4, "setSyncTimeoutInSeconds:", -[NSObject unsignedIntegerValue](v91, "unsignedIntegerValue"));
    }
    else
    {

      if (!v92) {
        goto LABEL_129;
      }
      v92 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        v169 = [(id)objc_opt_class() description];
        v170 = [v3 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
        v171 = [v3 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
        id v172 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v169;
        __int16 v197 = 2112;
        v198 = @"SyncTimeoutInSeconds";
        __int16 v199 = 2112;
        v200 = v170;
        __int16 v201 = 2112;
        id v202 = v172;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v92, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

LABEL_129:
    v93 = [v3 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
    char v94 = objc_opt_isKindOfClass();

    v95 = [v3 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
    v96 = v95;
    if (v94)
    {
      objc_msgSend(v4, "setTriggeredSyncDelayInSeconds:", -[NSObject unsignedIntegerValue](v95, "unsignedIntegerValue"));
    }
    else
    {

      if (!v96)
      {
LABEL_135:
        [@"com.apple.CoreDuet" UTF8String];
        if (os_variant_has_internal_diagnostics())
        {
          v97 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Policy initWithDictionary:]();
          }

          v98 = (void *)v4[20];
          if (v98) {
            v99 = (void *)[v98 mutableCopy];
          }
          else {
            v99 = objc_opt_new();
          }
          id v100 = v99;

          [v100 addObject:@"/always/sync"];
          uint64_t v101 = [v100 copy];
          v102 = (void *)v4[20];
          v4[20] = v101;
        }
        if ([v3 count] && !*((unsigned char *)v4 + 8) && !v4[16])
        {
          *((unsigned char *)v4 + 8) = 1;
          v103 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
            -[_DKSync2Policy initWithDictionary:]();
          }
        }
        if (_DKSync2PolicyOkToDownloadPolicyUpdates && [v3 count] && !*((unsigned char *)v4 + 8)) {
          +[_DKSync2Policy possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:]((uint64_t)_DKSync2Policy, v4[19]);
        }
        goto LABEL_152;
      }
      v96 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v173 = [(id)objc_opt_class() description];
        v174 = [v3 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
        v175 = [v3 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
        id v176 = (id)objc_opt_class();
        *(_DWORD *)buf = 138544386;
        v196 = v173;
        __int16 v197 = 2112;
        v198 = @"TriggeredSyncDelayInSeconds";
        __int16 v199 = 2112;
        v200 = v174;
        __int16 v201 = 2112;
        id v202 = v176;
        __int16 v203 = 2112;
        uint64_t v204 = v5;
        _os_log_error_impl(&dword_18ECEB000, v96, OS_LOG_TYPE_ERROR, "%{public}@: Not setting %@ because %@ is a %@ instead of a %@", buf, 0x34u);
      }
    }

    goto LABEL_135;
  }
LABEL_153:

  return a1;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(uint64_t)a1
{
  uint64_t v3 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke;
  block[3] = &unk_1E560D4A8;
  uint64_t v5 = @"com.apple.coreduet.sync-policy.policy-download";
  uint64_t v6 = v3;
  uint64_t v7 = a2;
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized != -1) {
    dispatch_once(&possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized, block);
  }
}

+ (id)policyFromDictionary:(id)a3
{
  id v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v3 = (id)MEMORY[0x1E4F1CC08];
  }
  id v4 = -[_DKSync2Policy initWithDictionary:]((uint64_t *)[_DKSync2Policy alloc], v3);

  return v4;
}

+ (id)productVersion
{
  self;
  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v1 = v0;
    id v2 = [v0 objectForKey:*MEMORY[0x1E4F1CD30]];
    CFRelease(v1);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

+ (void)handleDownloadSyncPolicyResponse:(void *)a3 data:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  if (v8)
  {
    uint64_t v10 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.4();
    }

    goto LABEL_5;
  }
  if ([v6 statusCode] != 200)
  {
    if ([v6 statusCode] != 204
      && [v6 statusCode] != 205
      && [v6 statusCode] != 404
      && [v6 statusCode] != 410)
    {
      goto LABEL_5;
    }
    uint64_t v11 = objc_opt_new();
    if (!v11) {
      goto LABEL_5;
    }
LABEL_26:
    int v17 = +[_DKSync2Policy userDefaults]();
    char v18 = [v17 objectForKey:@"CloudSync2Policies"];
    __int16 v19 = v18;
    if (v18) {
      id v20 = v18;
    }
    else {
      id v20 = (id)objc_opt_new();
    }
    __int16 v21 = v20;

    [v17 setValue:v11 forKey:@"CloudSync2Policies"];
    if (([v11 isEqualToDictionary:v21] & 1) == 0)
    {
      char v22 = +[_DKSync2Policy policyCache]();
      [v22 removeAllObjects];

      __int16 v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v23 postNotificationName:@"_DKSync2PolicyDidChangeNotification" object:v9 userInfo:0];
    }
    goto LABEL_32;
  }
  if (v7)
  {
    id v24 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:&v24];
    uint64_t v12 = v24;
    if (!v11)
    {
      uint64_t v13 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:]();
      }
    }
  }
  else
  {
    uint64_t v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:]();
    }
    uint64_t v11 = 0;
  }

  char v14 = [v6 allHeaderFields];
  __int16 v15 = +[_CDServerRequest getHTTPModifiedSinceFromHeaders:]((uint64_t)_CDServerRequest, v14);

  if (v15)
  {
    v16 = +[_DKSync2Policy userDefaults]();
    [v16 setValue:v15 forKey:@"CloudSyncPoliciesLastModified"];
  }
  if (v11) {
    goto LABEL_26;
  }
LABEL_5:
  if ([v6 statusCode] == 304)
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:]();
    }
LABEL_32:
  }
}

+ (id)syncPolicyConfigPathForFilename:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 pathForResource:v2 ofType:@"plist"];

  return v4;
}

+ (id)disabledFeaturesForSyncType:(id)a3 transports:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[_DKSyncedFeatures sharedInstance]();
  id v7 = objc_opt_new();
  char v8 = -[_DKSyncToggle isEnabled]((BOOL)v5);

  if (-[_DKSyncedFeatures isDigitalHealthDisabledWithIsSingleDevice:forTransports:]((uint64_t)v6, v8, a4)) {
    [v7 addObject:@"DigitalHealth"];
  }
  if (-[_DKSyncedFeatures isIDSMessageGatingDisabled]((uint64_t)v6)) {
    [v7 addObject:@"IDSMessageGating"];
  }
  if (-[_DKSyncedFeatures isSiriPortraitDisabled]((uint64_t)v6)) {
    [v7 addObject:@"SiriPortrait"];
  }
  if (-[_DKSyncedFeatures isSupergreenDisabledForTransports:]((uint64_t)v6, a4)) {
    [v7 addObject:@"Supergreen"];
  }
  if (-[_DKSyncedFeatures isEucalyptusDisabled]((uint64_t)v6)) {
    [v7 addObject:@"Eucalyptus"];
  }
  if (-[_DKSyncedFeatures isOptimizedBatteryChargingDisabled]((uint64_t)v6)) {
    [v7 addObject:@"OptimizedBatteryCharging"];
  }
  if (-[_DKSyncedFeatures isTipsDisabled]((uint64_t)v6)) {
    [v7 addObject:@"Tips"];
  }
  if ([v7 count]) {
    uint64_t v9 = (void *)[v7 copy];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)streamNamesToSyncWithDisabledFeatures:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_streamNamesToAlwaysSync)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v6 = (void *)v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_streamNamesToSync;
  uint64_t v8 = [(NSDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (!v4
          || (objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16) & 1) == 0)
        {
          uint64_t v13 = -[NSDictionary objectForKeyedSubscript:](self->_streamNamesToSync, "objectForKeyedSubscript:", v12, (void)v16);
          [v6 addObjectsFromArray:v13];
        }
      }
      uint64_t v9 = [(NSDictionary *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  char v14 = [v6 allObjects];

  return v14;
}

- (id)streamNamesToSyncWithSyncType:(id)a3 transportType:(int64_t)a4
{
  uint64_t v5 = +[_DKSync2Policy disabledFeaturesForSyncType:a3 transports:a4];
  id v6 = [(_DKSync2Policy *)self streamNamesToSyncWithDisabledFeatures:v5];

  return v6;
}

- (BOOL)canDeferSyncOperationWithSyncType:(id)a3
{
  id v3 = a3;
  BOOL v4 = -[_DKSyncType isPeriodicSync]((BOOL)v3)
    && !-[_DKSyncType forceSync]((BOOL)v3)
    && (unint64_t)-[_DKSyncType urgency]((uint64_t)v3) < 8;

  return v4;
}

- (BOOL)canPerformSyncOperationWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 isCharging:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = -[_DKSyncType forceSync]((BOOL)v10);
  BOOL v13 = -[_DKSyncType isTriggeredSync]((BOOL)v10);
  BOOL v14 = -[_DKSyncToggle isEnabled]((BOOL)v10);
  if (![(_DKSync2Policy *)self syncDisabled])
  {
    if (v12) {
      goto LABEL_7;
    }
    if (-[_DKSyncType didReceivePush]((BOOL)v10) && v13)
    {
      if (![(_DKSync2Policy *)self pushTriggersSync])
      {
LABEL_17:
        BOOL v16 = 0;
        goto LABEL_18;
      }
    }
    else if (!v13 && ![(_DKSync2Policy *)self minSyncsPerDay])
    {
      goto LABEL_17;
    }
    if ([(_DKSync2Policy *)self requireCharging] && !a6)
    {
      __int16 v15 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.6();
      }
      goto LABEL_4;
    }
    if (v11)
    {
      if (v13)
      {
        if ([(_DKSync2Policy *)self maxSyncsPerDay] <= a5)
        {
          __int16 v15 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:]();
          }
          goto LABEL_4;
        }
      }
      else
      {
        if (-[_DKSyncType isPeriodicSync]((BOOL)v10))
        {
          long long v18 = +[_DKSync2Policy userDefaults]();
          char v19 = [v18 BOOLForKey:@"IgnorePeriodicSyncLimits"];

          if (v19)
          {
            __int16 v15 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:]();
            }
            BOOL v16 = 1;
            goto LABEL_5;
          }
        }
        if ([(_DKSync2Policy *)self maxSyncsPerDay] <= a5)
        {
          __int16 v15 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.5();
          }
          goto LABEL_4;
        }
        [v11 timeIntervalSinceNow];
        double v21 = -v20;
        [(_DKSync2Policy *)self hoursBetweenSyncsWhenIsSingleDevice:v14];
        if (v22 * 3600.0 * 0.75 > v21)
        {
          __int16 v15 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:].cold.4();
          }
          goto LABEL_4;
        }
      }
    }
LABEL_7:
    BOOL v16 = 1;
    goto LABEL_18;
  }
  __int16 v15 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_DKSync2Policy canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:]();
  }
LABEL_4:
  BOOL v16 = 0;
LABEL_5:

LABEL_18:
  return v16;
}

- (BOOL)highPriorityForSyncDownWithSyncType:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_DKSyncUrgencyTracker sharedInstance]();
  BOOL v5 = -[_DKSyncType forceSync]((BOOL)v3);

  BOOL v6 = v5 || (unint64_t)-[_DKEventData version]((uint64_t)v4) >= 0xA;
  return v6;
}

- (BOOL)highPriorityForSyncUpWithSyncType:(id)a3 lastSyncDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[_DKSyncUrgencyTracker sharedInstance]();
  BOOL v9 = -[_DKSyncType forceSync]((BOOL)v7);

  if (v9)
  {
    BOOL v10 = 1;
  }
  else
  {
    unint64_t v11 = -[_DKEventData version]((uint64_t)v8);
    BOOL v10 = 1;
    if (v6 && v11 <= 9)
    {
      unint64_t maxSyncDownIntervalInDays = self->_maxSyncDownIntervalInDays;
      if (maxSyncDownIntervalInDays)
      {
        double v13 = (double)(86400 * maxSyncDownIntervalInDays);
        [v6 timeIntervalSinceNow];
        BOOL v10 = -v14 > v13;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
  }

  return v10;
}

- (id)queryStartDateWithSyncType:(void *)a1 lastSyncDate:(uint64_t)a2 lastDaySyncCount:(void *)a3
{
  id v4 = a3;
  if (a1)
  {
    uint64_t v5 = [a1 maxSyncPeriodInDays];
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(double)(unint64_t)(86400 * v5)];
    if (v4
      && ([MEMORY[0x1E4F1C9C8] distantPast],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v4 isEqualToDate:v7],
          v7,
          (v8 & 1) == 0))
    {
      id v9 = [v4 laterDate:v6];
    }
    else
    {
      id v9 = v6;
      BOOL v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:]();
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)queryStartDateWithSyncType:(id)a3 lastSyncDate:(id)a4 lastDaySyncCount:(unint64_t)a5 previousHighWaterMark:(id)a6
{
  id v8 = a6;
  BOOL v10 = -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:](self, v9, a4);
  unint64_t v11 = [v10 laterDate:v8];

  return v11;
}

- (id)queryStartDateWithSyncType:(id)a3 previousHighWaterMark:(id)a4
{
  id v5 = a4;
  id v7 = -[_DKSync2Policy queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:](self, v6, 0);
  id v8 = v7;
  if (v5)
  {
    id v9 = [v7 laterDate:v5];
  }
  else
  {
    id v9 = v7;
  }
  BOOL v10 = v9;

  return v10;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3
{
  [(_DKSync2Policy *)self hoursBetweenSyncsWhenIsSingleDevice:a3 urgency:0];
  return result;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3 urgency:(unint64_t)a4
{
  BOOL v5 = a3;
  if (![(_DKSync2Policy *)self minSyncsPerDay]) {
    return -1.0;
  }
  if (v5) {
    return (double)[(_DKSync2Policy *)self singleDeviceSyncIntervalInDays] * 24.0;
  }
  double result = 24.0 / (double)[(_DKSync2Policy *)self minSyncsPerDay];
  switch(a4)
  {
    case 0uLL:
      return result;
    case 1uLL:
      double v8 = 1.25;
      goto LABEL_17;
    case 2uLL:
      double v8 = 1.5;
      goto LABEL_17;
    case 3uLL:
      double v8 = 1.75;
      goto LABEL_17;
    case 4uLL:
      double v8 = 2.0;
      goto LABEL_17;
    case 5uLL:
      double v8 = 2.33;
      goto LABEL_17;
    case 6uLL:
      double v8 = 2.66;
      goto LABEL_17;
    case 7uLL:
      double v8 = 3.0;
      goto LABEL_17;
    case 8uLL:
      double v8 = 3.33;
      goto LABEL_17;
    case 9uLL:
      double v8 = 3.66;
      goto LABEL_17;
    case 0xAuLL:
    case 0xBuLL:
      double v8 = 4.0;
      goto LABEL_17;
    default:
      double v8 = 1.0;
LABEL_17:
      double result = result / v8;
      break;
  }
  return result;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)syncDisabled
{
  return self->_syncDisabled;
}

- (void)setSyncDisabled:(BOOL)a3
{
  self->_syncDisabled = a3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (unint64_t)maxSyncPeriodInDays
{
  return self->_maxSyncPeriodInDays;
}

- (void)setMaxSyncPeriodInDays:(unint64_t)a3
{
  self->_maxSyncPeriodInDays = a3;
}

- (unint64_t)maxSyncDownIntervalInDays
{
  return self->_maxSyncDownIntervalInDays;
}

- (void)setMaxSyncDownIntervalInDays:(unint64_t)a3
{
  self->_unint64_t maxSyncDownIntervalInDays = a3;
}

- (unint64_t)minSyncIntervalInSeconds
{
  return self->_minSyncIntervalInSeconds;
}

- (void)setMinSyncIntervalInSeconds:(unint64_t)a3
{
  self->_minSyncIntervalInSeconds = a3;
}

- (unint64_t)minSyncWindowInSeconds
{
  return self->_minSyncWindowInSeconds;
}

- (void)setMinSyncWindowInSeconds:(unint64_t)a3
{
  self->_minSyncWindowInSeconds = a3;
}

- (unint64_t)minSyncsPerDay
{
  return self->_minSyncsPerDay;
}

- (void)setMinSyncsPerDay:(unint64_t)a3
{
  self->_minSyncsPerDay = a3;
}

- (unint64_t)maxSyncsPerDay
{
  return self->_maxSyncsPerDay;
}

- (void)setMaxSyncsPerDay:(unint64_t)a3
{
  self->_maxSyncsPerDay = a3;
}

- (unint64_t)numChangesTriggeringSync
{
  return self->_numChangesTriggeringSync;
}

- (void)setNumChangesTriggeringSync:(unint64_t)a3
{
  self->_numChangesTriggeringSync = a3;
}

- (BOOL)pushTriggersSync
{
  return self->_pushTriggersSync;
}

- (void)setPushTriggersSync:(BOOL)a3
{
  self->_pushTriggersSync = a3;
}

- (BOOL)requireCharging
{
  return self->_requireCharging;
}

- (void)setRequireCharging:(BOOL)a3
{
  self->_requireCharging = a3;
}

- (unint64_t)singleDeviceSyncIntervalInDays
{
  return self->_singleDeviceSyncIntervalInDays;
}

- (void)setSingleDeviceSyncIntervalInDays:(unint64_t)a3
{
  self->_singleDeviceSyncIntervalInDays = a3;
}

- (NSDictionary)streamNamesToSync
{
  return self->_streamNamesToSync;
}

- (void)setStreamNamesToSync:(id)a3
{
}

- (NSArray)streamNamesWithAdditionsTriggeringSync
{
  return self->_streamNamesWithAdditionsTriggeringSync;
}

- (void)setStreamNamesWithAdditionsTriggeringSync:(id)a3
{
}

- (NSArray)streamNamesWithDeletionsTriggeringSync
{
  return self->_streamNamesWithDeletionsTriggeringSync;
}

- (void)setStreamNamesWithDeletionsTriggeringSync:(id)a3
{
}

- (unint64_t)syncBatchSizeInEvents
{
  return self->_syncBatchSizeInEvents;
}

- (void)setSyncBatchSizeInEvents:(unint64_t)a3
{
  self->_syncBatchSizeInEvents = a3;
}

- (unint64_t)maxBatchesPerSync
{
  return self->_maxBatchesPerSync;
}

- (void)setMaxBatchesPerSync:(unint64_t)a3
{
  self->_maxBatchesPerSync = a3;
}

- (unint64_t)syncTimeoutInSeconds
{
  return self->_syncTimeoutInSeconds;
}

- (void)setSyncTimeoutInSeconds:(unint64_t)a3
{
  self->_syncTimeoutInSeconds = a3;
}

- (unint64_t)triggeredSyncDelayInSeconds
{
  return self->_triggeredSyncDelayInSeconds;
}

- (void)setTriggeredSyncDelayInSeconds:(unint64_t)a3
{
  self->_triggeredSyncDelayInSeconds = a3;
}

- (unint64_t)policyDownloadIntervalInDays
{
  return self->_policyDownloadIntervalInDays;
}

- (void)setPolicyDownloadIntervalInDays:(unint64_t)a3
{
  self->_policyDownloadIntervalInDays = a3;
}

- (NSArray)streamNamesToAlwaysSync
{
  return self->_streamNamesToAlwaysSync;
}

- (void)setStreamNamesToAlwaysSync:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNamesToAlwaysSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithDeletionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithAdditionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesToSync, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)_policyForSyncTransportType:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Disabling sync due to invalid policy information", v3, v4, v5, v6, v7);
}

+ (void)_policyForSyncTransportType:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Using local policy override: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)featureNameFromFeatureType:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: FeatureType %ld not yet supported (add?)", v3, v4, v5, v6, v7);
}

+ (void)internalFeatureNameFromFeatureName:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: FeatureName %{public}@ not yet supported (add?)", v3, v4, v5, v6, v7);
}

+ (void)configurationPlistForFilename:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Unable to obtain resource path for %@", v3, v4, v5, v6, v7);
}

+ (void)configurationPlistForFilename:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to read policy file: %@", v3, v4, v5, v6, v7);
}

+ (void)setOkToDownloadPolicyUpdates:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Enabling policy update downloads", v3, v4, v5, v6, v7);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Disabling %{public}@ sync policy due to invalid MaxBatchesPerSync", v3, v4, v5, v6, v7);
}

- (void)initWithDictionary:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Enabling always sync stream", v3, v4, v5, v6, v7);
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Got 304 unmodified response to policy download request.", v3, v4, v5, v6, v7);
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "%{public}@: Policy download returned status 200 but no data. Response: %@", v2, 0x16u);
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [v0 domain];
  [v0 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_1(&dword_18ECEB000, v3, v4, "%{public}@: Invalid sync policy config: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);
}

+ (void)handleDownloadSyncPolicyResponse:data:error:.cold.4()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = [v0 domain];
  [v0 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_8_1(&dword_18ECEB000, v3, v4, "%{public}@: Failed to download sync policy: %{public}@:%lld (%@)", v5, v6, v7, v8, v9);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Syncing disabled", v3, v4, v5, v6, v7);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Skipping triggered sync, over daily maximum", v3, v4, v5, v6, v7);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.3()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9(&dword_18ECEB000, v1, v2, "%{public}@: Ignoring periodic sync limits", v3, v4, v5, v6, v7);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.4()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Skipping sync, not yet time", v3, v4, v5, v6, v7);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.5()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Skipping sync, over daily maximum", v3, v4, v5, v6, v7);
}

- (void)canPerformSyncOperationWithSyncType:lastSyncDate:lastDaySyncCount:isCharging:.cold.6()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Skipping sync, device is not charging", v3, v4, v5, v6, v7);
}

- (void)queryStartDateWithSyncType:lastSyncDate:lastDaySyncCount:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "No last sync date, using: %@", v1, 0xCu);
}

@end