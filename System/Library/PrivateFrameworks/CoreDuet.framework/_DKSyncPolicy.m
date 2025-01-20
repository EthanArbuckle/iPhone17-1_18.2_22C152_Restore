@interface _DKSyncPolicy
+ (Class)policyFromDictionary:(uint64_t)a1;
+ (id)configurationPlist;
+ (id)forceSyncPolicy;
+ (id)policy;
+ (id)syncPolicyConfigPath;
+ (void)policy;
+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:;
- (BOOL)alwaysSyncUpAndDown;
- (BOOL)forceSync;
- (BOOL)pushTriggersSync;
- (BOOL)syncDisabled;
- (NSArray)streamNamesWithAdditionsTriggeringSync;
- (NSArray)streamNamesWithDeletionsTriggeringSync;
- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3;
- (id)description;
- (id)initWithSyncDisabled:(void *)a3 alwaysSyncUpAndDown:(void *)a4 assetThresholdInBytes:(void *)a5 firstSyncPeriodInDays:(void *)a6 maxSyncDownIntervalInDays:(void *)a7 minSyncIntervalInSeconds:(void *)a8 minSyncsPerDay:(void *)a9 maxSyncsPerDay:(void *)a10 numChangesTriggeringSync:(void *)a11 policyDownloadIntervalInDays:(void *)a12 pushTriggersSync:(void *)a13 singleDeviceSyncIntervalInDays:(void *)a14 streamNamesWithAdditionsTriggeringSync:(void *)a15 streamNamesWithDeletionsTriggeringSync:(void *)a16 syncTimeoutInSeconds:(void *)a17 triggeredSyncDelayInSeconds:;
- (id)queryStartDateFromLastDaySyncDates:(id)a3 lastSyncDate:(id)a4 isSingleDevice:(BOOL)a5 isTriggeredSync:(BOOL)a6;
- (unint64_t)assetThresholdInBytes;
- (unint64_t)firstSyncPeriodInDays;
- (unint64_t)maxSyncDownIntervalInDays;
- (unint64_t)maxSyncsPerDay;
- (unint64_t)minSyncIntervalInSeconds;
- (unint64_t)minSyncsPerDay;
- (unint64_t)numChangesTriggeringSync;
- (unint64_t)singleDeviceSyncIntervalInDays;
- (unint64_t)syncTimeoutInSeconds;
- (unint64_t)triggeredSyncDelayInSeconds;
@end

@implementation _DKSyncPolicy

+ (id)policy
{
  v3 = objc_opt_new();
  v4 = +[_DKSyncPolicy configurationPlist]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 addEntriesFromDictionary:v4];
  }
  v5 = +[_DKSync2Policy userDefaults]();
  v6 = [v5 valueForKey:@"CloudSyncPolicy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 addEntriesFromDictionary:v6];
  }
  +[_DKSyncPolicy policyFromDictionary:]((uint64_t)a1, v3);
  v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (([v3 isEqualToDictionary:policy_previousPolicyDict] & 1) == 0)
  {
    uint64_t v8 = policy_previousPolicyDict;
    v9 = +[_CDLogging syncChannel];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        +[_DKSyncPolicy policy]();
      }
    }
    else if (v10)
    {
      +[_DKSyncPolicy policy]();
    }

    objc_storeStrong((id *)&policy_previousPolicyDict, v3);
  }
  if (+[_DKCloudUtilities isUnitTesting]
    && [v7 syncDisabled])
  {
    v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18ECEB000, v11, OS_LOG_TYPE_INFO, "Enabling sync due to unit testing", v13, 2u);
    }

    if (v7) {
      v7[8] = 0;
    }
  }

  return v7;
}

+ (id)configurationPlist
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self;
  v0 = (void *)MEMORY[0x1E4F1C9E8];
  v1 = +[_DKSyncPolicy syncPolicyConfigPath]();
  v2 = [v0 dictionaryWithContentsOfFile:v1];

  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v3 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = +[_DKSyncPolicy syncPolicyConfigPath]();
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18ECEB000, v3, OS_LOG_TYPE_INFO, "Failed to read policy file: %@", (uint8_t *)&v6, 0xCu);
    }
    v2 = 0;
  }
  return v2;
}

+ (Class)policyFromDictionary:(uint64_t)a1
{
  id v2 = a2;
  Class v97 = (Class)self;
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v2 = (id)MEMORY[0x1E4F1CC08];
  }
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = [v2 objectForKeyedSubscript:@"SyncDisabled"];
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v2 objectForKeyedSubscript:@"SyncDisabled"];
  uint64_t v8 = v7;
  if (isKindOfClass)
  {
    v103 = v7;
  }
  else
  {

    if (v8)
    {
      v9 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v9];
      }
    }
    v103 = 0;
  }
  BOOL v10 = [v2 objectForKeyedSubscript:@"AlwaysSyncUpAndDown"];
  char v11 = objc_opt_isKindOfClass();

  v12 = [v2 objectForKeyedSubscript:@"AlwaysSyncUpAndDown"];
  v13 = v12;
  if (v11)
  {
    v102 = v12;
  }
  else
  {

    if (v13)
    {
      v14 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v14];
      }
    }
    v102 = 0;
  }
  v15 = [v2 objectForKeyedSubscript:@"AssetThresholdInBytes"];
  char v16 = objc_opt_isKindOfClass();

  v17 = [v2 objectForKeyedSubscript:@"AssetThresholdInBytes"];
  v18 = v17;
  if (v16)
  {
    v101 = v17;
  }
  else
  {

    if (v18)
    {
      v19 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v19];
      }
    }
    v101 = 0;
  }
  v20 = [v2 objectForKeyedSubscript:@"FirstSyncPeriodInDays"];
  char v21 = objc_opt_isKindOfClass();

  v22 = [v2 objectForKeyedSubscript:@"FirstSyncPeriodInDays"];
  v23 = v22;
  if (v21)
  {
    v99 = v22;
  }
  else
  {

    if (v23)
    {
      v24 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v24];
      }
    }
    v99 = 0;
  }
  v25 = [v2 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
  char v26 = objc_opt_isKindOfClass();

  v27 = [v2 objectForKeyedSubscript:@"MaxSyncDownIntervalInDays"];
  v28 = v27;
  if (v26)
  {
    v100 = v27;
  }
  else
  {

    if (v28)
    {
      v29 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v29];
      }
    }
    v100 = 0;
  }
  v30 = [v2 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
  char v31 = objc_opt_isKindOfClass();

  v32 = [v2 objectForKeyedSubscript:@"MinSyncIntervalInSeconds"];
  v33 = v32;
  if (v31)
  {
    v96 = v32;
  }
  else
  {

    if (v33)
    {
      v34 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v34];
      }
    }
    v96 = 0;
  }
  v35 = [v2 objectForKeyedSubscript:@"MinSyncsPerDay"];
  char v36 = objc_opt_isKindOfClass();

  v37 = [v2 objectForKeyedSubscript:@"MinSyncsPerDay"];
  v38 = v37;
  if (v36)
  {
    v95 = v37;
  }
  else
  {

    if (v38)
    {
      v39 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v39];
      }
    }
    v95 = 0;
  }
  v40 = [v2 objectForKeyedSubscript:@"MaxSyncsPerDay"];
  char v41 = objc_opt_isKindOfClass();

  v42 = [v2 objectForKeyedSubscript:@"MaxSyncsPerDay"];
  v43 = v42;
  if (v41)
  {
    v94 = v42;
  }
  else
  {

    if (v43)
    {
      v44 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v44];
      }
    }
    v94 = 0;
  }
  v45 = [v2 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
  char v46 = objc_opt_isKindOfClass();

  v47 = [v2 objectForKeyedSubscript:@"NumChangesTriggeringSync"];
  v48 = v47;
  if (v46)
  {
    v93 = v47;
    uint64_t v49 = v4;
  }
  else
  {

    uint64_t v49 = v4;
    if (v48)
    {
      v50 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v50];
      }
    }
    v93 = 0;
  }
  v51 = [v2 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
  char v52 = objc_opt_isKindOfClass();

  v53 = [v2 objectForKeyedSubscript:@"PolicyDownloadIntervalInDays"];
  v54 = v53;
  if (v52)
  {
    v92 = v53;
  }
  else
  {

    if (v54)
    {
      v55 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v55];
      }
    }
    v92 = 0;
  }
  v56 = [v2 objectForKeyedSubscript:@"PushTriggersSync"];
  char v57 = objc_opt_isKindOfClass();

  v58 = [v2 objectForKeyedSubscript:@"PushTriggersSync"];
  v59 = v58;
  if ((v57 & 1) != 0 || (v58, !v59))
  {
    uint64_t v61 = v49;
  }
  else
  {
    v60 = +[_CDLogging syncChannel];
    uint64_t v61 = v49;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      +[_DKSyncPolicy policyFromDictionary:v60];
    }

    v59 = 0;
  }
  v62 = [v2 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
  char v63 = objc_opt_isKindOfClass();

  v64 = [v2 objectForKeyedSubscript:@"SingleDeviceSyncIntervalInDays"];
  v65 = v64;
  if (v63)
  {
    v66 = v64;
  }
  else
  {

    if (v65)
    {
      v67 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v67];
      }
    }
    v66 = 0;
  }
  v68 = [v2 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
  char v69 = objc_opt_isKindOfClass();

  v70 = [v2 objectForKeyedSubscript:@"StreamNamesWithAdditionsTriggeringSync"];
  v71 = v70;
  if (v69)
  {
    v72 = v70;
  }
  else
  {

    if (v71)
    {
      v73 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v73];
      }
    }
    v72 = 0;
  }
  v74 = [v2 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
  char v75 = objc_opt_isKindOfClass();

  v76 = [v2 objectForKeyedSubscript:@"StreamNamesWithDeletionsTriggeringSync"];
  v77 = v76;
  if ((v75 & 1) == 0)
  {

    if (v77)
    {
      v78 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v78];
      }

      v77 = 0;
    }
  }
  v79 = [v2 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
  char v80 = objc_opt_isKindOfClass();

  v81 = [v2 objectForKeyedSubscript:@"SyncTimeoutInSeconds"];
  v82 = v81;
  if ((v80 & 1) == 0)
  {

    if (v82)
    {
      v83 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        +[_DKSyncPolicy policyFromDictionary:v83];
      }

      v82 = 0;
    }
  }
  v84 = [v2 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
  char v85 = objc_opt_isKindOfClass();

  v86 = [v2 objectForKeyedSubscript:@"TriggeredSyncDelayInSeconds"];
  v87 = v86;
  if ((v85 & 1) != 0 || (v86, !v87))
  {
    v90 = v97;
    v89 = v103;
  }
  else
  {
    v88 = +[_CDLogging syncChannel];
    v89 = v103;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      +[_DKSyncPolicy policyFromDictionary:v88];
    }

    v87 = 0;
    v90 = v97;
  }
  Class v98 = (Class)-[_DKSyncPolicy initWithSyncDisabled:alwaysSyncUpAndDown:assetThresholdInBytes:firstSyncPeriodInDays:maxSyncDownIntervalInDays:minSyncIntervalInSeconds:minSyncsPerDay:maxSyncsPerDay:numChangesTriggeringSync:policyDownloadIntervalInDays:pushTriggersSync:singleDeviceSyncIntervalInDays:streamNamesWithAdditionsTriggeringSync:streamNamesWithDeletionsTriggeringSync:syncTimeoutInSeconds:triggeredSyncDelayInSeconds:]([v90 alloc], v89, v102, v101, v99, v100, v96, v95, v94, v93, v92, v59, v66, v72, v77, v82, v87);

  return v98;
}

+ (id)forceSyncPolicy
{
  id result = (id)[a1 policy];
  if (result)
  {
    *((unsigned char *)result + 11) = 1;
    *((unsigned char *)result + 9) = 1;
  }
  return result;
}

- (id)initWithSyncDisabled:(void *)a3 alwaysSyncUpAndDown:(void *)a4 assetThresholdInBytes:(void *)a5 firstSyncPeriodInDays:(void *)a6 maxSyncDownIntervalInDays:(void *)a7 minSyncIntervalInSeconds:(void *)a8 minSyncsPerDay:(void *)a9 maxSyncsPerDay:(void *)a10 numChangesTriggeringSync:(void *)a11 policyDownloadIntervalInDays:(void *)a12 pushTriggersSync:(void *)a13 singleDeviceSyncIntervalInDays:(void *)a14 streamNamesWithAdditionsTriggeringSync:(void *)a15 streamNamesWithDeletionsTriggeringSync:(void *)a16 syncTimeoutInSeconds:(void *)a17 triggeredSyncDelayInSeconds:
{
  id v51 = a2;
  id v55 = a3;
  id v23 = a4;
  id v60 = a5;
  id v59 = a6;
  id v58 = a7;
  id v57 = a8;
  id v56 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v54 = a14;
  id v53 = a15;
  id v28 = a16;
  id v29 = a17;
  if (!a1)
  {
    id v30 = 0;
    v32 = v51;
    char v31 = v55;
    goto LABEL_64;
  }
  v61.receiver = a1;
  v61.super_class = (Class)_DKSyncPolicy;
  id v30 = objc_msgSendSuper2(&v61, sel_init);
  char v31 = v55;
  if (!v30)
  {
    v32 = v51;
    goto LABEL_64;
  }
  v32 = v51;
  if (v51) {
    char v33 = [v51 BOOLValue];
  }
  else {
    char v33 = 0;
  }
  *((unsigned char *)v30 + 8) = v33;
  if (v55) {
    char v34 = [v55 BOOLValue];
  }
  else {
    char v34 = 0;
  }
  *((unsigned char *)v30 + 9) = v34;
  if (v23) {
    uint64_t v35 = [v23 unsignedIntegerValue];
  }
  else {
    uint64_t v35 = 20480;
  }
  *((void *)v30 + 2) = v35;
  if (v60) {
    uint64_t v36 = [v60 unsignedIntegerValue];
  }
  else {
    uint64_t v36 = 7;
  }
  *((void *)v30 + 3) = v36;
  if (v59) {
    uint64_t v37 = [v59 unsignedIntegerValue];
  }
  else {
    uint64_t v37 = 7;
  }
  *((void *)v30 + 4) = v37;
  if (v58) {
    uint64_t v38 = [v58 unsignedIntegerValue];
  }
  else {
    uint64_t v38 = 60;
  }
  *((void *)v30 + 5) = v38;
  if (v57) {
    uint64_t v39 = [v57 unsignedIntegerValue];
  }
  else {
    uint64_t v39 = 4;
  }
  *((void *)v30 + 6) = v39;
  if (v56) {
    uint64_t v40 = [v56 unsignedIntegerValue];
  }
  else {
    uint64_t v40 = 6;
  }
  *((void *)v30 + 7) = v40;
  if (v24) {
    uint64_t v41 = [v24 unsignedIntegerValue];
  }
  else {
    uint64_t v41 = 0;
  }
  *((void *)v30 + 8) = v41;
  if (v25) {
    uint64_t v42 = [v25 unsignedIntegerValue];
  }
  else {
    uint64_t v42 = 7;
  }
  *((void *)v30 + 14) = v42;
  if (v26) {
    char v43 = [v26 BOOLValue];
  }
  else {
    char v43 = 1;
  }
  *((unsigned char *)v30 + 10) = v43;
  if (v27) {
    uint64_t v44 = [v27 unsignedIntegerValue];
  }
  else {
    uint64_t v44 = 1;
  }
  *((void *)v30 + 9) = v44;
  objc_storeStrong((id *)v30 + 10, a14);
  objc_storeStrong((id *)v30 + 11, a15);
  if (v28) {
    uint64_t v45 = [v28 unsignedIntegerValue];
  }
  else {
    uint64_t v45 = 30;
  }
  *((void *)v30 + 12) = v45;
  if (v29) {
    unint64_t v46 = [v29 unsignedIntegerValue];
  }
  else {
    unint64_t v46 = 10;
  }
  *((void *)v30 + 13) = v46;
  if (*((void *)v30 + 5) > 0x15180uLL) {
    *((void *)v30 + 5) = 86400;
  }
  unint64_t v47 = *((void *)v30 + 7);
  if (v47 >= 0x121)
  {
    unint64_t v47 = 288;
    *((void *)v30 + 7) = 288;
  }
  if (*((void *)v30 + 6) > v47) {
    *((int64x2_t *)v30 + 3) = vdupq_n_s64(4uLL);
  }
  unint64_t v48 = *((void *)v30 + 14);
  if (!v48)
  {
    uint64_t v49 = 1;
    goto LABEL_56;
  }
  if (v48 >= 0x16E)
  {
    uint64_t v49 = 365;
LABEL_56:
    *((void *)v30 + 14) = v49;
  }
  if (!*((void *)v30 + 9)) {
    *((void *)v30 + 9) = 1;
  }
  if (!*((void *)v30 + 12)) {
    *((void *)v30 + 12) = 30;
  }
  if (v46 > 0x15180) {
    *((void *)v30 + 13) = 86400;
  }
  +[_DKSyncPolicy possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:]();
LABEL_64:

  return v30;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:
{
  self;
  if (!+[_DKCloudUtilities isUnitTesting])
  {
    id v0 = +[_DKCloudUtilities sharedInstance];
    [v0 isCloudSyncAvailable];
  }
}

+ (id)syncPolicyConfigPath
{
  self;
  id v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"com.apple.coreduet.knowledge.syncPolicies" ofType:@"plist"];

  return v1;
}

- (id)queryStartDateFromLastDaySyncDates:(id)a3 lastSyncDate:(id)a4 isSingleDevice:(BOOL)a5 isTriggeredSync:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ([(_DKSyncPolicy *)self syncDisabled])
  {
    v12 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:]();
    }
LABEL_4:

LABEL_5:
    id v13 = 0;
    goto LABEL_6;
  }
  BOOL v15 = [(_DKSyncPolicy *)self forceSync];
  if (!v15 && !v6)
  {
    if (![(_DKSyncPolicy *)self minSyncsPerDay]) {
      goto LABEL_5;
    }
LABEL_16:
    if (v11)
    {
      unint64_t v16 = [v10 count];
      unint64_t v17 = [(_DKSyncPolicy *)self maxSyncsPerDay];
      if (v6)
      {
        if (v16 >= v17)
        {
          v12 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:]();
          }
          goto LABEL_4;
        }
      }
      else
      {
        if (v16 >= v17)
        {
          v12 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.5();
          }
          goto LABEL_4;
        }
        [v11 timeIntervalSinceNow];
        double v28 = -v27;
        [(_DKSyncPolicy *)self hoursBetweenSyncsWhenIsSingleDevice:v7];
        if (v29 * 3600.0 * 0.75 > v28)
        {
          v12 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:].cold.4();
          }
          goto LABEL_4;
        }
      }
      goto LABEL_28;
    }
    goto LABEL_21;
  }
  if (!v15) {
    goto LABEL_16;
  }
  if (v11)
  {
LABEL_28:
    id v13 = v11;
    goto LABEL_6;
  }
LABEL_21:
  unint64_t v18 = [(_DKSyncPolicy *)self firstSyncPeriodInDays];
  id v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-(double)(86400 * v18)];
  v19 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[_DKSyncPolicy queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:](v19, v20, v21, v22, v23, v24, v25, v26);
  }

LABEL_6:
  return v13;
}

- (double)hoursBetweenSyncsWhenIsSingleDevice:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_DKSyncPolicy *)self minSyncsPerDay]) {
    return -1.0;
  }
  if (v3) {
    return (double)[(_DKSyncPolicy *)self singleDeviceSyncIntervalInDays] * 24.0;
  }
  return 24.0 / (double)[(_DKSyncPolicy *)self minSyncsPerDay];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  if ([(_DKSyncPolicy *)self syncDisabled]) {
    BOOL v6 = @"YES";
  }
  else {
    BOOL v6 = @"NO";
  }
  [v3 appendFormat:@"                           syncDisabled: %@\n", v6];
  if ([(_DKSyncPolicy *)self forceSync])
  {
    if ([(_DKSyncPolicy *)self forceSync]) {
      BOOL v7 = @"YES";
    }
    else {
      BOOL v7 = @"NO";
    }
    [v3 appendFormat:@"                              forceSync: %@\n", v7];
  }
  if ([(_DKSyncPolicy *)self alwaysSyncUpAndDown]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  [v3 appendFormat:@"                    alwaysSyncUpAndDown: %@\n", v8];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy assetThresholdInBytes](self, "assetThresholdInBytes"));
  [v3 appendFormat:@"                  assetThresholdInBytes: %@\n", v9];

  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy firstSyncPeriodInDays](self, "firstSyncPeriodInDays"));
  [v3 appendFormat:@"                  firstSyncPeriodInDays: %@\n", v10];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy maxSyncDownIntervalInDays](self, "maxSyncDownIntervalInDays"));
  [v3 appendFormat:@"              maxSyncDownIntervalInDays: %@\n", v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy minSyncIntervalInSeconds](self, "minSyncIntervalInSeconds"));
  [v3 appendFormat:@"               minSyncIntervalInSeconds: %@\n", v12];

  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy minSyncsPerDay](self, "minSyncsPerDay"));
  [v3 appendFormat:@"                         minSyncsPerDay: %@\n", v13];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy maxSyncsPerDay](self, "maxSyncsPerDay"));
  [v3 appendFormat:@"                         maxSyncsPerDay: %@\n", v14];

  if ([(_DKSyncPolicy *)self numChangesTriggeringSync])
  {
    BOOL v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy numChangesTriggeringSync](self, "numChangesTriggeringSync"));
    [v3 appendFormat:@"               numChangesTriggeringSync: %@\n", v15];
  }
  else
  {
    [v3 appendFormat:@"               numChangesTriggeringSync: %@\n", @"disabled"];
  }
  if (self) {
    unint64_t policyDownloadIntervalInDays = self->_policyDownloadIntervalInDays;
  }
  else {
    unint64_t policyDownloadIntervalInDays = 0;
  }
  unint64_t v17 = [NSNumber numberWithUnsignedInteger:policyDownloadIntervalInDays];
  [v3 appendFormat:@"           policyDownloadIntervalInDays: %@\n", v17];

  if ([(_DKSyncPolicy *)self pushTriggersSync]) {
    unint64_t v18 = @"YES";
  }
  else {
    unint64_t v18 = @"NO";
  }
  [v3 appendFormat:@"                       pushTriggersSync: %@\n", v18];
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy singleDeviceSyncIntervalInDays](self, "singleDeviceSyncIntervalInDays"));
  [v3 appendFormat:@"         singleDeviceSyncIntervalInDays: %@\n", v19];

  uint64_t v20 = [(_DKSyncPolicy *)self streamNamesWithAdditionsTriggeringSync];
  uint64_t v21 = _CDPrettyPrintCollection(v20, 0, 0, 0);
  [v3 appendFormat:@" streamNamesWithAdditionsTriggeringSync: %@\n", v21];

  uint64_t v22 = [(_DKSyncPolicy *)self streamNamesWithDeletionsTriggeringSync];
  uint64_t v23 = _CDPrettyPrintCollection(v22, 0, 0, 0);
  [v3 appendFormat:@" streamNamesWithDeletionsTriggeringSync: %@\n", v23];

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy syncTimeoutInSeconds](self, "syncTimeoutInSeconds"));
  [v3 appendFormat:@"                   syncTimeoutInSeconds: %@\n", v24];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DKSyncPolicy triggeredSyncDelayInSeconds](self, "triggeredSyncDelayInSeconds"));
  [v3 appendFormat:@"            triggeredSyncDelayInSeconds: %@\n", v25];

  [v3 appendString:@"}\n"];
  return v3;
}

- (BOOL)syncDisabled
{
  return self->_syncDisabled;
}

- (BOOL)alwaysSyncUpAndDown
{
  return self->_alwaysSyncUpAndDown;
}

- (unint64_t)assetThresholdInBytes
{
  return self->_assetThresholdInBytes;
}

- (unint64_t)firstSyncPeriodInDays
{
  return self->_firstSyncPeriodInDays;
}

- (unint64_t)maxSyncDownIntervalInDays
{
  return self->_maxSyncDownIntervalInDays;
}

- (unint64_t)minSyncIntervalInSeconds
{
  return self->_minSyncIntervalInSeconds;
}

- (unint64_t)minSyncsPerDay
{
  return self->_minSyncsPerDay;
}

- (unint64_t)maxSyncsPerDay
{
  return self->_maxSyncsPerDay;
}

- (unint64_t)numChangesTriggeringSync
{
  return self->_numChangesTriggeringSync;
}

- (BOOL)pushTriggersSync
{
  return self->_pushTriggersSync;
}

- (unint64_t)singleDeviceSyncIntervalInDays
{
  return self->_singleDeviceSyncIntervalInDays;
}

- (NSArray)streamNamesWithAdditionsTriggeringSync
{
  return self->_streamNamesWithAdditionsTriggeringSync;
}

- (NSArray)streamNamesWithDeletionsTriggeringSync
{
  return self->_streamNamesWithDeletionsTriggeringSync;
}

- (unint64_t)syncTimeoutInSeconds
{
  return self->_syncTimeoutInSeconds;
}

- (unint64_t)triggeredSyncDelayInSeconds
{
  return self->_triggeredSyncDelayInSeconds;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamNamesWithDeletionsTriggeringSync, 0);
  objc_storeStrong((id *)&self->_streamNamesWithAdditionsTriggeringSync, 0);
}

+ (void)policy
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "policy changed to: %@", v2, v3, v4, v5, v6);
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Syncing disabled", v2, v3, v4, v5, v6);
}

- (void)queryStartDateFromLastDaySyncDates:(uint64_t)a3 lastSyncDate:(uint64_t)a4 isSingleDevice:(uint64_t)a5 isTriggeredSync:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Skipping triggered sync, over daily maximum", v2, v3, v4, v5, v6);
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Skipping sync, not yet time", v2, v3, v4, v5, v6);
}

- (void)queryStartDateFromLastDaySyncDates:lastSyncDate:isSingleDevice:isTriggeredSync:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Skipping sync, over daily maximum", v2, v3, v4, v5, v6);
}

@end