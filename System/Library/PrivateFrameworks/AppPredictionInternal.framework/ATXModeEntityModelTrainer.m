@interface ATXModeEntityModelTrainer
+ (double)maxScoreWithThresholdGivenModeEntityScores:(id)a3;
+ (double)scoreThresholdGivenModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4;
+ (id)eventProviderForMode:(unint64_t)a3;
+ (id)eventProviderForScorableTime:(id)a3;
+ (id)thresholdedModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 threshold:(double)a5;
- (ATXModeEntityModelTrainer)init;
- (ATXModeEntityModelTrainer)initWithCacheBasePath:(id)a3 modeEntityStore:(id)a4 globalAppModeAffinityModel:(id)a5 globalInterruptingAppModel:(id)a6 globalWidgetPopularityModel:(id)a7;
- (BOOL)persistModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 modeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6;
- (BOOL)shouldDeferTrainingDueToRestoredBackup;
- (BOOL)shouldDeferTrainingDueToUpgrade;
- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5;
- (void)train;
- (void)trainWithShouldDeferTrainingOnBackupRestoreOrUpgrade:(BOOL)a3;
- (void)trainWithXPCActivity:(id)a3;
- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldDeferTrainingOnRestoreOrUpgrade:(BOOL)a5;
@end

@implementation ATXModeEntityModelTrainer

- (ATXModeEntityModelTrainer)init
{
  v3 = [MEMORY[0x1E4F4B650] modeCachesRootDirectory];
  v4 = objc_opt_new();
  v5 = +[ATXGlobalAppModeAffinityModel modelWithAllInstalledAppsKnownToSpringBoard];
  v6 = +[ATXGlobalInterruptingAppModel modelWithAllInstalledAppsKnownToSpringBoard];
  v7 = +[ATXGlobalWidgetPopularityModel modelWithAllAvailableWidgets];
  v8 = [(ATXModeEntityModelTrainer *)self initWithCacheBasePath:v3 modeEntityStore:v4 globalAppModeAffinityModel:v5 globalInterruptingAppModel:v6 globalWidgetPopularityModel:v7];

  return v8;
}

- (ATXModeEntityModelTrainer)initWithCacheBasePath:(id)a3 modeEntityStore:(id)a4 globalAppModeAffinityModel:(id)a5 globalInterruptingAppModel:(id)a6 globalWidgetPopularityModel:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXModeEntityModelTrainer;
  v17 = [(ATXModeEntityModelTrainer *)&v21 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    cacheBasePath = v17->_cacheBasePath;
    v17->_cacheBasePath = (NSString *)v18;

    objc_storeStrong((id *)&v17->_modeEntityStore, a4);
    objc_storeStrong((id *)&v17->_globalAppModeAffinityModel, a5);
    objc_storeStrong((id *)&v17->_globalInterruptingAppModel, a6);
    objc_storeStrong((id *)&v17->_globalWidgetPopularityModel, a7);
  }

  return v17;
}

- (void)trainWithShouldDeferTrainingOnBackupRestoreOrUpgrade:(BOOL)a3
{
}

- (void)train
{
}

- (void)trainWithXPCActivity:(id)a3
{
}

- (void)trainWithXPCActivity:(id)a3 shouldSkipRetrainingIfTrainedRecently:(BOOL)a4 shouldDeferTrainingOnRestoreOrUpgrade:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v83 = a4;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v5
    || ![(ATXModeEntityModelTrainer *)self shouldDeferTrainingDueToRestoredBackup]&& ![(ATXModeEntityModelTrainer *)self shouldDeferTrainingDueToUpgrade])
  {
    v8 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Started training Mode Entity Models...", buf, 2u);
    }

    v9 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v10 = allModesForTraining();
    uint64_t v82 = [v10 countByEnumeratingWithState:&v89 objects:v97 count:16];
    if (v82)
    {
      uint64_t v81 = *(void *)v90;
      v80 = v7;
      v88 = v9;
      obj = v10;
LABEL_8:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v90 != v81) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v89 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v14 = [v12 unsignedIntegerValue];
        id v15 = __atxlog_handle_notification_management();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = ATXModeToString();
          *(_DWORD *)buf = 138412290;
          uint64_t v94 = (uint64_t)v16;
          _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "Training Mode Entity Models for Mode %@...", buf, 0xCu);
        }
        if (v83)
        {
          [v12 unsignedIntegerValue];
          v17 = ATXModeToString();
          uint64_t v18 = [(ATXModeEntityModelTrainer *)self pathForModeEntityTypeIdentifier:@"apps" modeIdentifier:v17 modeConfigurationType:0];

          v19 = [MEMORY[0x1E4F4B650] modificationDateOfFileAtPath:v18];
          [v19 timeIntervalSinceNow];
          double v21 = v20;

          if (v21 < 0.0 && v21 > -21600.0)
          {
            v22 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              [v12 unsignedIntegerValue];
              v23 = ATXModeToString();
              *(_DWORD *)buf = 138412546;
              uint64_t v94 = (uint64_t)v23;
              __int16 v95 = 2048;
              double v96 = -v21;
              _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "Skipping training of apps, contacts, and notification scores in Mode Entity Scorer for mode %@ since it was trained recently. Cache age: %.2f", buf, 0x16u);
            }
            v9 = v88;
            goto LABEL_45;
          }
        }
        v24 = -[ATXAppModeModel initWithMode:modeEntityStore:globalAppModeAffinityModel:]([ATXAppModeModel alloc], "initWithMode:modeEntityStore:globalAppModeAffinityModel:", [v12 unsignedIntegerValue], self->_modeEntityStore, self->_globalAppModeAffinityModel);
        uint64_t v25 = [(ATXAppModeModel *)v24 scoredEntities];
        v26 = ATXModeToString();
        v27 = (void *)v25;
        [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v25 modeEntityTypeIdentifier:@"apps" modeIdentifier:v26 modeConfigurationType:0];

        if ([v7 didDefer])
        {
          __atxlog_handle_notification_management();
          v28 = (ATXAppModeDenyListModel *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v28->super, OS_LOG_TYPE_DEFAULT))
          {
            v68 = ATXModeToString();
            *(_DWORD *)buf = 138412290;
            uint64_t v94 = (uint64_t)v68;
            _os_log_impl(&dword_1D0FA3000, &v28->super, OS_LOG_TYPE_DEFAULT, "(Allow List) Finished training of app scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
          }
          v67 = obj;
          goto LABEL_55;
        }
        context = v13;
        v28 = [[ATXAppModeDenyListModel alloc] initWithMode:v14 modeEntityStore:self->_modeEntityStore globalInterruptingAppModel:self->_globalInterruptingAppModel];
        v29 = [(ATXAppModeDenyListModel *)v28 scoredEntities];
        v30 = ATXModeToString();
        [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v29 modeEntityTypeIdentifier:@"apps" modeIdentifier:v30 modeConfigurationType:1];

        if ([v7 didDefer])
        {
          v69 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = ATXModeToString();
            *(_DWORD *)buf = 138412290;
            uint64_t v94 = (uint64_t)v70;
            _os_log_impl(&dword_1D0FA3000, v69, OS_LOG_TYPE_DEFAULT, "(Deny List) Finished training of app scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
          }
          v67 = obj;
          id v13 = context;
LABEL_55:
          v9 = v88;

          goto LABEL_57;
        }
        v85 = v29;
        v86 = v28;
        v31 = v24;
        v32 = [[ATXContactModeModel alloc] initWithMode:v14 contactStore:v88];
        v33 = [(ATXContactModeModel *)v32 scoredEntities];
        v84 = v32;
        uint64_t v34 = [(ATXContactModeModel *)v32 purgeDeletedContacts:v33];

        v35 = ATXModeToString();
        v36 = (void *)v34;
        [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v34 modeEntityTypeIdentifier:@"contacts" modeIdentifier:v35 modeConfigurationType:0];

        if ([v7 didDefer])
        {
          p_super = __atxlog_handle_notification_management();
          v38 = v31;
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            v39 = ATXModeToString();
            *(_DWORD *)buf = 138412290;
            uint64_t v94 = (uint64_t)v39;
            _os_log_impl(&dword_1D0FA3000, p_super, OS_LOG_TYPE_DEFAULT, "(Allow List) Finished training of contact scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
          }
          int v40 = 1;
          v41 = v84;
          v42 = v36;
          v44 = v85;
          v43 = v86;
        }
        else
        {
          v45 = self;
          v46 = [[ATXContactModeDenyListModel alloc] initWithMode:v14 contactStore:v88];
          v47 = [(ATXContactModeDenyListModel *)v46 scoredEntities];
          v77 = v46;
          v48 = v46;
          self = v45;
          uint64_t v49 = [(ATXContactModeDenyListModel *)v48 purgeDeletedContacts:v47];

          v50 = ATXModeToString();
          v76 = (void *)v49;
          [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v49 modeEntityTypeIdentifier:@"contacts" modeIdentifier:v50 modeConfigurationType:1];

          v79 = (void *)v34;
          if ([v7 didDefer])
          {
            v51 = __atxlog_handle_notification_management();
            v38 = v31;
            v78 = (ATXNotificationModeModel *)v51;
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              v52 = ATXModeToString();
              *(_DWORD *)buf = 138412290;
              uint64_t v94 = (uint64_t)v52;
              _os_log_impl(&dword_1D0FA3000, v51, OS_LOG_TYPE_DEFAULT, "(Deny List) Finished training of contact scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
            }
            int v40 = 1;
            v44 = v85;
            v43 = v86;
            v41 = v84;
            v53 = v76;
            p_super = &v77->super;
          }
          else
          {
            v78 = [[ATXNotificationModeModel alloc] initWithMode:v14 contactStore:v88];
            uint64_t v54 = [(ATXNotificationModeModel *)v78 scoredEntitiesWithScoredAppEntities:v27 scoredContactEntities:v34];
            v55 = ATXModeToString();
            [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v54 modeEntityTypeIdentifier:@"notifications" modeIdentifier:v55 modeConfigurationType:0];

            v74 = (void *)v54;
            if ([v7 didDefer])
            {
              v38 = v31;
              v56 = __atxlog_handle_notification_management();
              v44 = v85;
              v43 = v86;
              v73 = (ATXWidgetModeModel *)v56;
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                v57 = ATXModeToString();
                *(_DWORD *)buf = 138412290;
                uint64_t v94 = (uint64_t)v57;
                _os_log_impl(&dword_1D0FA3000, v56, OS_LOG_TYPE_DEFAULT, "Finished training of notification scores in Mode Entity Scorer for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
              }
              int v40 = 1;
            }
            else
            {
              v58 = [[ATXWidgetModeModel alloc] initWithMode:v14 globalWidgetPopularityModel:self->_globalWidgetPopularityModel];
              uint64_t v59 = [(ATXWidgetModeModel *)v58 scoredEntitiesWithScoredAppEntities:v27];
              v60 = ATXModeToString();
              v72 = (void *)v59;
              [(ATXModeEntityModelTrainer *)self persistModeEntityScores:v59 modeEntityTypeIdentifier:@"widgets" modeIdentifier:v60 modeConfigurationType:0];

              v61 = __atxlog_handle_notification_management();
              v44 = v85;
              v43 = v86;
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v62 = ATXModeToString();
                *(_DWORD *)buf = 138412290;
                uint64_t v94 = v62;
                v71 = v31;
                v63 = v58;
                v64 = (void *)v62;
                _os_log_impl(&dword_1D0FA3000, v61, OS_LOG_TYPE_DEFAULT, "Finished training of widget scores in Mode Entity Scorer for mode %@.", buf, 0xCu);

                v58 = v63;
                v31 = v71;
              }

              v73 = v58;
              if ([v80 didDefer])
              {
                v65 = __atxlog_handle_notification_management();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = ATXModeToString();
                  *(_DWORD *)buf = 138412290;
                  uint64_t v94 = (uint64_t)v66;
                  _os_log_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_DEFAULT, "Finished training of all entities for mode %@, but deferring training because XPC activity asked for deferral.", buf, 0xCu);
                }
                v38 = v31;

                int v40 = 1;
              }
              else
              {
                v38 = v31;
                int v40 = 0;
              }
            }
            v41 = v84;
            v53 = v76;
            p_super = &v77->super;
          }
          v42 = v79;
        }

        id v7 = v80;
        v9 = v88;
        if (v40)
        {
          v67 = obj;
          goto LABEL_57;
        }
LABEL_45:
        if (v82 == ++v11)
        {
          v10 = obj;
          uint64_t v82 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
          if (v82) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    v67 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v67, OS_LOG_TYPE_DEFAULT, "Finished training Mode Entity Models for all modes.", buf, 2u);
    }
LABEL_57:
  }
}

- (BOOL)shouldDeferTrainingDueToRestoredBackup
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  uint64_t v4 = *MEMORY[0x1E4F936B8];
  [v3 doubleForKey:*MEMORY[0x1E4F936B8]];
  double v6 = v5;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7 - v6;
  if (v7 - v6 >= 604800.0)
  {
    if (v6 > 0.0) {
      [v3 removeObjectForKey:v4];
    }
  }
  else
  {
    v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Skipping retraining because backup was recently restored", v11, 2u);
    }
  }
  return v8 < 604800.0;
}

- (BOOL)shouldDeferTrainingDueToUpgrade
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F936E0]];
  uint64_t v4 = *MEMORY[0x1E4F936C0];
  [v3 doubleForKey:*MEMORY[0x1E4F936C0]];
  if (v5 == 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    objc_msgSend(v3, "setDouble:forKey:", v4);
  }
  else
  {
    double v7 = v5;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8 - v7;
  if (v9 < 604800.0)
  {
    v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Skipping retraining because of recent upgrade", v12, 2u);
    }
  }
  return v9 < 604800.0;
}

- (id)pathForModeEntityTypeIdentifier:(id)a3 modeIdentifier:(id)a4 modeConfigurationType:(int64_t)a5
{
  cacheBasePath = self->_cacheBasePath;
  double v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[[v8 alloc] initWithFormat:@"%@_%@", v10, v9];

  id v12 = [(NSString *)cacheBasePath stringByAppendingPathComponent:v11];

  if (a5 == 1)
  {
    id v13 = [NSString alloc];
    uint64_t v14 = NSStringForATXModeConfigurationType();
    uint64_t v15 = [v13 initWithFormat:@"%@_%@", v12, v14];

    id v12 = (void *)v15;
  }
  return v12;
}

- (BOOL)persistModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 modeIdentifier:(id)a5 modeConfigurationType:(int64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  [(id)objc_opt_class() scoreThresholdGivenModeEntityScores:v12 modeEntityTypeIdentifier:v10];
  uint64_t v14 = [(id)objc_opt_class() thresholdedModeEntityScores:v12 modeEntityTypeIdentifier:v10 threshold:v13];

  uint64_t v15 = (void *)MEMORY[0x1D25F6CC0]();
  id v16 = (void *)MEMORY[0x1D25F6CC0]();
  id v26 = 0;
  v17 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v26];
  id v18 = v26;
  if (v17 || !v18)
  {
    v19 = [(ATXModeEntityModelTrainer *)self pathForModeEntityTypeIdentifier:v10 modeIdentifier:v11 modeConfigurationType:a6];
    id v25 = 0;
    char v20 = [v17 writeToFile:v19 options:1073741825 error:&v25];
    id v21 = v25;
    v22 = __atxlog_handle_notification_management();
    v23 = v22;
    if (v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "SUCCESS: Finished writing mode entity scores for mode entity type: %@.", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:]();
    }
  }
  else
  {
    v19 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ATXModeEntityModelTrainer persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:]();
    }
    char v20 = 0;
  }

  return v20;
}

+ (id)thresholdedModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4 threshold:(double)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v8 isEqualToString:@"apps"] & 1) != 0
    || [v8 isEqualToString:@"contacts"])
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v25);
          v17 = [v16 scoreMetadata];
          [v17 score];
          double v19 = v18;

          if (v19 >= a5) {
            [v9 setObject:v16 forKeyedSubscript:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v12);
    }

    char v20 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v10 count];
      uint64_t v22 = v21 - [v9 count];
      uint64_t v23 = [v10 count];
      *(_DWORD *)buf = 136315906;
      v30 = "+[ATXModeEntityModelTrainer thresholdedModeEntityScores:modeEntityTypeIdentifier:threshold:]";
      __int16 v31 = 2048;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      uint64_t v34 = v23;
      __int16 v35 = 2048;
      double v36 = a5;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%s Filtered out %ld/%ld entities because their scores were < %f", buf, 0x2Au);
    }
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

+ (double)scoreThresholdGivenModeEntityScores:(id)a3 modeEntityTypeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_ATXGlobals sharedInstance];
  [v8 scoreThresholdForSavingAppsToModeFiles];
  double v10 = v9;
  [v8 scoreThresholdForSavingContactsToModeFiles];
  double v12 = v11;
  if ([v7 isEqualToString:@"apps"])
  {
    [a1 maxScoreWithThresholdGivenModeEntityScores:v6];
    if (v13 >= v10) {
      double v10 = v13;
    }
  }
  else
  {
    double v10 = 1.0;
    if ([v7 isEqualToString:@"contacts"])
    {
      [a1 maxScoreWithThresholdGivenModeEntityScores:v6];
      if (v14 >= v12) {
        double v10 = v14;
      }
      else {
        double v10 = v12;
      }
    }
  }

  return v10;
}

+ (double)maxScoreWithThresholdGivenModeEntityScores:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(v5, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * v9), (void)v23);
        id v11 = objc_alloc(NSNumber);
        double v12 = [v10 scoreMetadata];
        [v12 score];
        double v13 = objc_msgSend(v11, "initWithDouble:");

        [v4 addObject:v13];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  double v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:0];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
  id v16 = [v4 sortedArrayUsingDescriptors:v15];

  v17 = +[_ATXGlobals sharedInstance];
  unint64_t v18 = [v17 maxElementsToPerisistPerEntityForModeBackup];
  if ([v16 count] <= v18)
  {
    if (![v16 count])
    {
LABEL_14:
      double v21 = 0.0;
      goto LABEL_15;
    }
    unint64_t v18 = [v16 count];
  }
  else if (!v18)
  {
    goto LABEL_14;
  }
  double v19 = objc_msgSend(v16, "objectAtIndexedSubscript:", v18 - 1, (void)v23);
  [v19 doubleValue];
  double v21 = v20;

LABEL_15:
  return v21;
}

+ (id)eventProviderForScorableTime:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_msgSend(a1, "eventProviderForMode:", objc_msgSend(v4, "atxMode"));
  }
  else
  {
    uint64_t v6 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ATXModeEntityModelTrainer eventProviderForScorableTime:]((uint64_t)v4, v6);
    }

    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3B8];
    uint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    [v7 raise:v8, @"Received invalid scorable time class %@", v10 format];

    id v5 = 0;
  }

  return v5;
}

+ (id)eventProviderForMode:(unint64_t)a3
{
  if (a3 - 8 >= 4)
  {
    if (a3 == 12)
    {
      uint64_t v6 = (ATXUnifiedModeStreamModeEventProvider *)objc_opt_new();
      unint64_t v7 = 12;
    }
    else
    {
      uint64_t v6 = [ATXUnifiedModeStreamModeEventProvider alloc];
      unint64_t v7 = a3;
    }
    id v4 = [(ATXModeTransitionModeEventProvider *)v6 initWithMode:v7];
  }
  else
  {
    id v3 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      +[ATXModeEntityModelTrainer eventProviderForMode:](v3);
    }

    id v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalWidgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_globalInterruptingAppModel, 0);
  objc_storeStrong((id *)&self->_globalAppModeAffinityModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_cacheBasePath, 0);
}

- (void)persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "FAILURE: Unable to archive mode entity scores for mode entity type: %@. Error: %@");
}

- (void)persistModeEntityScores:modeEntityTypeIdentifier:modeIdentifier:modeConfigurationType:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_8(&dword_1D0FA3000, v0, v1, "FAILURE: Unable to write mode entity scores for mode entity type: %@. Error: %@");
}

+ (void)eventProviderForScorableTime:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Received invalid scorable time class %@", (uint8_t *)&v5, 0xCu);
}

+ (void)eventProviderForMode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Attempted to fetch event provider for digest mode", v1, 2u);
}

@end