@interface ATXActionPredictionBlacklist
+ (id)sharedInstanceWithAppPredictionBlacklist;
+ (id)sharedInstanceWithoutAppPredictionBlacklist;
- (ATXActionPredictionBlacklist)init;
- (ATXActionPredictionBlacklist)initWithAppPredictionBlacklist:(id)a3;
- (BOOL)isBundleIdBlacklisted:(id)a3;
- (BOOL)shouldPredictBundleId:(id)a3 action:(id)a4;
- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4;
- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5;
- (id)_prefsDisabledApps;
- (id)disabledBundlesInSettings;
- (id)homeScreenDisabledShortcutsInSettings;
- (id)shouldPredictBundleIdHelper:(id)a3 action:(id)a4;
- (void)_handlePrefsChange;
- (void)addToBlacklists:(id)a3 blacklistAppList:(id)a4 blacklistActionList:(id)a5 blacklistAppAndActionList:(id)a6;
- (void)dealloc;
- (void)setBlacklistFromAssetData:(id)a3 predictionBlacklist:(id)a4 shortcutBlacklist:(id)a5 primaryShortcutBlacklist:(id)a6;
@end

@implementation ATXActionPredictionBlacklist

- (ATXActionPredictionBlacklist)initWithAppPredictionBlacklist:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATXActionPredictionBlacklist;
  v5 = [(ATXActionPredictionBlacklist *)&v19 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F93B70]);
    v7 = objc_opt_new();
    uint64_t v8 = [v6 initWithGuardedData:v7];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v8;

    objc_storeWeak((id *)&v5->_appPredictionBlacklist, v4);
    v10 = +[_ATXGlobals sharedInstance];
    v11 = [v10 blacklistedAppActions];
    v12 = [v10 blacklistedAppActionsForPredictions];
    v13 = [v10 blacklistedAppActionsForShortcuts];
    v14 = [v10 blacklistedAppActionsForPrimaryShortcuts];
    [(ATXActionPredictionBlacklist *)v5 setBlacklistFromAssetData:v11 predictionBlacklist:v12 shortcutBlacklist:v13 primaryShortcutBlacklist:v14];

    [(ATXActionPredictionBlacklist *)v5 _handlePrefsChange];
    objc_initWeak(&location, v5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__ATXActionPredictionBlacklist_initWithAppPredictionBlacklist___block_invoke;
    v16[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v17, &location);
    v5->_prefsChangeNotificationToken = [v4 registerPrefsChangeHandler:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __63__ATXActionPredictionBlacklist_initWithAppPredictionBlacklist___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePrefsChange];
}

- (ATXActionPredictionBlacklist)init
{
  return [(ATXActionPredictionBlacklist *)self initWithAppPredictionBlacklist:0];
}

+ (id)sharedInstanceWithoutAppPredictionBlacklist
{
  if (sharedInstanceWithoutAppPredictionBlacklist_onceToken != -1) {
    dispatch_once(&sharedInstanceWithoutAppPredictionBlacklist_onceToken, &__block_literal_global_134);
  }
  v2 = (void *)sharedInstanceWithoutAppPredictionBlacklist_instance;
  return v2;
}

uint64_t __75__ATXActionPredictionBlacklist_sharedInstanceWithoutAppPredictionBlacklist__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstanceWithoutAppPredictionBlacklist_instance;
  sharedInstanceWithoutAppPredictionBlacklist_instance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedInstanceWithAppPredictionBlacklist
{
  if (sharedInstanceWithAppPredictionBlacklist_onceToken != -1) {
    dispatch_once(&sharedInstanceWithAppPredictionBlacklist_onceToken, &__block_literal_global_23_2);
  }
  v2 = (void *)sharedInstanceWithAppPredictionBlacklist_instance;
  return v2;
}

void __72__ATXActionPredictionBlacklist_sharedInstanceWithAppPredictionBlacklist__block_invoke()
{
  uint64_t v0 = [ATXActionPredictionBlacklist alloc];
  id v3 = +[ATXAppPredictionBlacklist sharedInstance];
  uint64_t v1 = [(ATXActionPredictionBlacklist *)v0 initWithAppPredictionBlacklist:v3];
  v2 = (void *)sharedInstanceWithAppPredictionBlacklist_instance;
  sharedInstanceWithAppPredictionBlacklist_instance = v1;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionBlacklist);
  [WeakRetained deregisterPrefsChangeHandlerWithToken:self->_prefsChangeNotificationToken];

  v4.receiver = self;
  v4.super_class = (Class)ATXActionPredictionBlacklist;
  [(ATXActionPredictionBlacklist *)&v4 dealloc];
}

- (void)setBlacklistFromAssetData:(id)a3 predictionBlacklist:(id)a4 shortcutBlacklist:(id)a5 primaryShortcutBlacklist:(id)a6
{
  v66[2] = *MEMORY[0x1E4F143B8];
  id v43 = a6;
  id v42 = a5;
  id v38 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v12 = objc_opt_new();
  v36 = objc_opt_new();
  v13 = objc_opt_new();
  v14 = objc_opt_new();
  v39 = objc_opt_new();
  v40 = objc_opt_new();
  v41 = objc_opt_new();
  v66[0] = v10;
  v66[1] = v36;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v65[0] = v11;
  v65[1] = v13;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];
  v64[0] = v12;
  v64[1] = v14;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  [(ATXActionPredictionBlacklist *)self addToBlacklists:v9 blacklistAppList:v15 blacklistActionList:v16 blacklistAppAndActionList:v17];

  v63 = v10;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v62 = v11;
  objc_super v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v61 = v12;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
  [(ATXActionPredictionBlacklist *)self addToBlacklists:v38 blacklistAppList:v18 blacklistActionList:v19 blacklistAppAndActionList:v20];

  v60 = v36;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
  v59 = v13;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v58 = v14;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  [(ATXActionPredictionBlacklist *)self addToBlacklists:v42 blacklistAppList:v21 blacklistActionList:v22 blacklistAppAndActionList:v23];

  v57 = v39;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
  v56 = v40;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  v55 = v41;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  [(ATXActionPredictionBlacklist *)self addToBlacklists:v43 blacklistAppList:v24 blacklistActionList:v25 blacklistAppAndActionList:v26];

  lock = self->_lock;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __121__ATXActionPredictionBlacklist_setBlacklistFromAssetData_predictionBlacklist_shortcutBlacklist_primaryShortcutBlacklist___block_invoke;
  v45[3] = &unk_1E68B2B38;
  id v46 = v10;
  id v47 = v11;
  id v48 = v12;
  id v49 = v36;
  id v50 = v13;
  id v51 = v14;
  id v52 = v39;
  id v53 = v40;
  id v54 = v41;
  id v44 = v41;
  id v28 = v40;
  id v29 = v39;
  id v30 = v51;
  id v31 = v13;
  id v32 = v36;
  id v33 = v48;
  id v34 = v11;
  id v35 = v46;
  [(_PASLock *)lock runWithLockAcquired:v45];
}

void __121__ATXActionPredictionBlacklist_setBlacklistFromAssetData_predictionBlacklist_shortcutBlacklist_primaryShortcutBlacklist___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  objc_super v4 = a2;
  uint64_t v5 = [v3 copy];
  id v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [*(id *)(a1 + 48) copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [*(id *)(a1 + 56) copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [*(id *)(a1 + 64) copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [*(id *)(a1 + 72) copy];
  v16 = (void *)v4[6];
  v4[6] = v15;

  uint64_t v17 = [*(id *)(a1 + 80) copy];
  v18 = (void *)v4[7];
  v4[7] = v17;

  uint64_t v19 = [*(id *)(a1 + 88) copy];
  v20 = (void *)v4[8];
  v4[8] = v19;

  uint64_t v21 = [*(id *)(a1 + 96) copy];
  id v22 = (id)v4[9];
  v4[9] = v21;
}

- (void)addToBlacklists:(id)a3 blacklistAppList:(id)a4 blacklistActionList:(id)a5 blacklistAppAndActionList:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v57 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v15 = [v14 second];
        int v16 = [v15 isEqualToString:@"_"];

        if (v16)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v17 = v42;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v53;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v53 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                v23 = [v14 first];
                [v22 addObject:v23];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v62 count:16];
            }
            while (v19);
          }
        }
        else
        {
          v24 = [v14 first];
          int v25 = [v24 isEqualToString:@"_"];

          if (v25)
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v17 = v41;
            uint64_t v26 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v49;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v49 != v28) {
                    objc_enumerationMutation(v17);
                  }
                  id v30 = *(void **)(*((void *)&v48 + 1) + 8 * k);
                  id v31 = [v14 second];
                  [v30 addObject:v31];
                }
                uint64_t v27 = [v17 countByEnumeratingWithState:&v48 objects:v61 count:16];
              }
              while (v27);
            }
          }
          else
          {
            id v32 = objc_alloc(MEMORY[0x1E4F93BB8]);
            id v33 = [v14 first];
            id v34 = [v14 second];
            id v17 = (id)[v32 initWithFirst:v33 second:v34];

            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v35 = v40;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v45;
              do
              {
                for (uint64_t m = 0; m != v37; ++m)
                {
                  if (*(void *)v45 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  [*(id *)(*((void *)&v44 + 1) + 8 * m) addObject:v17];
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v44 objects:v60 count:16];
              }
              while (v37);
            }
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v11);
  }
}

- (id)disabledBundlesInSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionBlacklist);
  id v3 = [WeakRetained disabledBundleIds];

  return v3;
}

- (id)_prefsDisabledApps
{
  id v3 = [(ATXActionPredictionBlacklist *)self disabledBundlesInSettings];
  objc_super v4 = [(ATXActionPredictionBlacklist *)self homeScreenDisabledShortcutsInSettings];
  if (v4)
  {
    id v5 = [v3 setByAddingObjectsFromArray:v4];
  }
  else
  {
    id v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)homeScreenDisabledShortcutsInSettings
{
  v2 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  return v5;
}

- (void)_handlePrefsChange
{
  locuint64_t k = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__ATXActionPredictionBlacklist__handlePrefsChange__block_invoke;
  v3[3] = &unk_1E68B2B60;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __50__ATXActionPredictionBlacklist__handlePrefsChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _prefsDisabledApps];
  id v5 = (void *)v3[10];
  v3[10] = v4;

  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = v3[10];
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - new action blacklist: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (BOOL)isBundleIdBlacklisted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    locuint64_t k = self->_lock;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__ATXActionPredictionBlacklist_isBundleIdBlacklisted___block_invoke;
    v9[3] = &unk_1E68B2B88;
    uint64_t v11 = &v12;
    id v10 = v4;
    [(_PASLock *)lock runWithLockAcquired:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void __54__ATXActionPredictionBlacklist_isBundleIdBlacklisted___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4[10] containsObject:*(void *)(a1 + 32)]) {
    char v3 = 1;
  }
  else {
    char v3 = [v4[1] containsObject:*(void *)(a1 + 32)];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)shouldPredictBundleId:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    id v10 = [(ATXActionPredictionBlacklist *)self shouldPredictBundleIdHelper:v6 action:v7];
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    locuint64_t k = self->_lock;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ATXActionPredictionBlacklist_shouldPredictBundleId_action___block_invoke;
    v14[3] = &unk_1E68B2B88;
    int v16 = &v17;
    id v12 = v10;
    id v15 = v12;
    [(_PASLock *)lock runWithLockAcquired:v14];
    BOOL v9 = *((unsigned char *)v18 + 24) == 0;

    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

void __61__ATXActionPredictionBlacklist_shouldPredictBundleId_action___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*((id *)v9 + 3) containsObject:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    char v3 = (void *)*((void *)v9 + 1);
    id v4 = [*(id *)(a1 + 32) first];
    if ([v3 containsObject:v4])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      id v5 = (void *)*((void *)v9 + 10);
      id v6 = [*(id *)(a1 + 32) first];
      if ([v5 containsObject:v6])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        id v7 = (void *)*((void *)v9 + 2);
        uint64_t v8 = [*(id *)(a1 + 32) second];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 containsObject:v8];
      }
    }
  }
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4
{
  return [(ATXActionPredictionBlacklist *)self shouldPredictBundleIdForShortcuts:a3 action:a4 forPrimaryShortcuts:0];
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    id v12 = [(ATXActionPredictionBlacklist *)self shouldPredictBundleIdHelper:v8 action:v9];
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    locuint64_t k = self->_lock;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__ATXActionPredictionBlacklist_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke;
    v16[3] = &unk_1E68B2BB0;
    uint64_t v18 = &v25;
    id v14 = v12;
    BOOL v20 = a5;
    id v17 = v14;
    uint64_t v19 = &v21;
    [(_PASLock *)lock runWithLockAcquired:v16];
    if (*((unsigned char *)v26 + 24)) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = *((unsigned char *)v22 + 24) == 0;
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  return v11;
}

void __93__ATXActionPredictionBlacklist_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if ([*((id *)v16 + 6) containsObject:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    char v3 = (void *)*((void *)v16 + 4);
    id v4 = [*(id *)(a1 + 32) first];
    if ([v3 containsObject:v4])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      id v5 = (void *)*((void *)v16 + 10);
      id v6 = [*(id *)(a1 + 32) first];
      if ([v5 containsObject:v6])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        id v7 = (void *)*((void *)v16 + 5);
        id v8 = [*(id *)(a1 + 32) second];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 containsObject:v8];
      }
    }
  }
  id v9 = v16;
  if (*(unsigned char *)(a1 + 56))
  {
    if ([*((id *)v16 + 9) containsObject:*(void *)(a1 + 32)])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      id v10 = (void *)*((void *)v16 + 7);
      BOOL v11 = [*(id *)(a1 + 32) first];
      if ([v10 containsObject:v11])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        id v12 = (void *)*((void *)v16 + 10);
        uint64_t v13 = [*(id *)(a1 + 32) first];
        if ([v12 containsObject:v13])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          id v14 = (void *)*((void *)v16 + 8);
          id v15 = [*(id *)(a1 + 32) second];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v14 containsObject:v15];
        }
      }
    }
    id v9 = v16;
  }
}

- (id)shouldPredictBundleIdHelper:(id)a3 action:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 lowercaseString];
  int v8 = [v7 containsString:@"nsua"];

  if (v8)
  {
    uint64_t v9 = [v5 substringFromIndex:5];

    id v5 = (id)v9;
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:v5];

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appPredictionBlacklist);
  objc_storeStrong(&self->_blacklistNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end