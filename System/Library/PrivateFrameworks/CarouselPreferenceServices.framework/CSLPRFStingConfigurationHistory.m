@interface CSLPRFStingConfigurationHistory
- (BOOL)isValidHistoryItem:(id)a3;
- (CSLPRFStingConfigurationHistory)init;
- (CSLPRFStingConfigurationHistory)initWithSetting:(id)a3 model:(id)a4;
- (id)_historyItemForActionType:(unint64_t)a3;
- (id)_itemForActionType:(unint64_t)a3 withBundleID:(id)a4;
- (id)itemForActionType:(unint64_t)a3;
- (id)itemForWorkoutWithBundleID:(id)a3;
- (unint64_t)historyActionType:(unint64_t)a3;
- (void)addHistoryItem:(id)a3;
@end

@implementation CSLPRFStingConfigurationHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_historySetting, 0);
}

- (id)_historyItemForActionType:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = [(CSLPRFStingConfigurationHistorySetting *)self->_historySetting read];
    v6 = [v5 actionsDictionary];
    if (!v6)
    {
      v8 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (a3 > 0x29) {
          v17 = 0;
        }
        else {
          v17 = off_264A0AC28[a3 - 1];
        }
        v21 = v17;
        *(_DWORD *)buf = 138412802;
        v30 = self;
        __int16 v31 = 2080;
        v32 = "-[CSLPRFStingConfigurationHistory _historyItemForActionType:]";
        __int16 v33 = 2112;
        v34 = v21;
        _os_log_impl(&dword_22F4EA000, v8, OS_LOG_TYPE_DEFAULT, "%@: %s no dictionary for action %@", buf, 0x20u);
      }
      v16 = 0;
LABEL_38:

      goto LABEL_39;
    }
    v7 = [NSNumber numberWithUnsignedInteger:a3];
    v8 = [v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v9 = [v8 reversedOrderedSet];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(NSObject **)(*((void *)&v25 + 1) + 8 * i);
            if ([(CSLPRFStingConfigurationHistory *)self isValidHistoryItem:v14])
            {
              v18 = cslprf_sting_settings_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                if (a3 > 0x29) {
                  v19 = 0;
                }
                else {
                  v19 = off_264A0AC28[a3 - 1];
                }
                v22 = v19;
                *(_DWORD *)buf = 138413058;
                v30 = self;
                __int16 v31 = 2080;
                v32 = "-[CSLPRFStingConfigurationHistory _historyItemForActionType:]";
                __int16 v33 = 2112;
                v34 = v22;
                __int16 v35 = 2112;
                v36 = v14;
                _os_log_impl(&dword_22F4EA000, v18, OS_LOG_TYPE_DEFAULT, "%@: %s found valid history item for action %@ %@", buf, 0x2Au);
              }
              v16 = v14;
              goto LABEL_37;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v37 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      v9 = cslprf_sting_settings_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      if (a3 > 0x29) {
        v15 = 0;
      }
      else {
        v15 = off_264A0AC28[a3 - 1];
      }
      v23 = v15;
      *(_DWORD *)buf = 138413058;
      v30 = self;
      __int16 v31 = 2080;
      v32 = "-[CSLPRFStingConfigurationHistory _historyItemForActionType:]";
      __int16 v33 = 2112;
      v34 = v23;
      __int16 v35 = 2112;
      v36 = v8;
      _os_log_error_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_ERROR, "%@: %s no valid history item for action %@ historyItems %@", buf, 0x2Au);
    }
    else
    {
      v9 = cslprf_sting_settings_log();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      if (a3 > 0x29) {
        v20 = 0;
      }
      else {
        v20 = off_264A0AC28[a3 - 1];
      }
      v23 = v20;
      *(_DWORD *)buf = 138412802;
      v30 = self;
      __int16 v31 = 2080;
      v32 = "-[CSLPRFStingConfigurationHistory _historyItemForActionType:]";
      __int16 v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_DEFAULT, "%@: %s no history items for action %@", buf, 0x20u);
    }

LABEL_36:
    v16 = 0;
LABEL_37:

    goto LABEL_38;
  }
  v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v30 = self;
    __int16 v31 = 2080;
    v32 = "-[CSLPRFStingConfigurationHistory _historyItemForActionType:]";
    _os_log_error_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_ERROR, "%@: %s action type isn't valid", buf, 0x16u);
  }
  v16 = 0;
LABEL_39:

  return v16;
}

- (id)_itemForActionType:(unint64_t)a3 withBundleID:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    v7 = [(CSLPRFStingConfigurationHistorySetting *)self->_historySetting read];
    v8 = [v7 actionsDictionary];
    if (v8)
    {
      v9 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v10;
      id v12 = (id)[v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            v16 = objc_msgSend(v15, "bundleID", (void)v20);
            int v17 = [v16 isEqualToString:v6];

            if (v17)
            {
              id v12 = v15;
              goto LABEL_14;
            }
          }
          id v12 = (id)[v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  v18 = objc_msgSend(v12, "copy", (void)v20);

  return v18;
}

- (id)itemForWorkoutWithBundleID:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(CSLPRFStingSettingsModel *)self->_model startWorkoutsListForBundleID:v4];
  id v6 = [v5 firstObject];
  v7 = [v6 workoutIdentifier];
  v8 = objc_alloc_init(CSLPRFStingConfigurationHistory);
  v9 = [(CSLPRFStingConfigurationHistory *)v8 _itemForActionType:6 withBundleID:v4];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = [v9 identifier];

    if (v11)
    {
      long long v26 = v8;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = v5;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v24 = v6;
        uint64_t v25 = v5;
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) workoutIdentifier];
            v18 = [v10 identifier];
            int v19 = [v17 isEqualToString:v18];

            if (v19)
            {
              uint64_t v20 = [v10 identifier];

              v7 = (void *)v20;
              goto LABEL_13;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
LABEL_13:
        id v6 = v24;
        v5 = v25;
      }

      v8 = v26;
    }
    else
    {

      v7 = 0;
    }
  }
  if (v7) {
    uint64_t v21 = 6;
  }
  else {
    uint64_t v21 = 9;
  }
  long long v22 = [[CSLPRFStingConfigurationHistoryItem alloc] initWithBundleID:v4 actionType:v21 identifier:v7];

  return v22;
}

- (id)itemForActionType:(unint64_t)a3
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  v5 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (a3 - 1 > 0x28) {
      id v6 = 0;
    }
    else {
      id v6 = off_264A0AC28[a3 - 1];
    }
    v7 = v6;
    *(_DWORD *)buf = 138412802;
    v112 = (__CFString *)self;
    __int16 v113 = 2080;
    v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
    __int16 v115 = 2112;
    v116 = v7;
    _os_log_impl(&dword_22F4EA000, v5, OS_LOG_TYPE_INFO, "%@ %s: retrieving history item for %@", buf, 0x20u);
  }
  if (a3 != 18)
  {
    unint64_t v10 = [(CSLPRFStingConfigurationHistory *)self historyActionType:a3];
    v88 = [(CSLPRFStingSettingsModel *)self->_model bundleIDsForActionType:v10];
    if (v10 == 2 || v10 == 38)
    {
      id v11 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = off_264A0AC28[v10 - 1];
        *(_DWORD *)buf = 138412802;
        v112 = (__CFString *)self;
        __int16 v113 = 2080;
        v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
        __int16 v115 = 2112;
        v116 = v12;
        _os_log_impl(&dword_22F4EA000, v11, OS_LOG_TYPE_INFO, "%@ %s: action type %@ does not require a bundleID", buf, 0x20u);
      }
    }
    else
    {
      if (![(__CFString *)v88 count])
      {
        v8 = [[CSLPRFStingConfigurationHistoryItem alloc] initWithBundleID:0 actionType:22 identifier:0];
        log = cslprf_sting_settings_log();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          if (v10 - 1 > 0x28) {
            v77 = 0;
          }
          else {
            v77 = off_264A0AC28[v10 - 1];
          }
          v81 = v77;
          v82 = @"Configure";
          *(_DWORD *)buf = 138413314;
          v112 = (__CFString *)self;
          __int16 v113 = 2080;
          v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
          __int16 v115 = 2112;
          v116 = v81;
          __int16 v117 = 2112;
          v118 = @"Configure";
          __int16 v119 = 2112;
          v120 = v8;
          _os_log_error_impl(&dword_22F4EA000, log, OS_LOG_TYPE_ERROR, "%@ %s no valid apps for %@ returning to %@ %@", buf, 0x34u);
        }
        v87 = 0;
        goto LABEL_103;
      }
      id v11 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        if (v10 - 1 > 0x28) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = off_264A0AC28[v10 - 1];
        }
        uint64_t v14 = v13;
        *(_DWORD *)buf = 138413058;
        v112 = (__CFString *)self;
        __int16 v113 = 2080;
        v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
        __int16 v115 = 2112;
        v116 = v14;
        __int16 v117 = 2112;
        v118 = v88;
        _os_log_impl(&dword_22F4EA000, v11, OS_LOG_TYPE_INFO, "%@ %s: valid bundleIDs for action type %@ using bundleID %@", buf, 0x2Au);
      }
    }

    uint64_t v15 = [(CSLPRFStingConfigurationHistory *)self _historyItemForActionType:v10];
    if (v15)
    {
      v16 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        if (v10 - 1 > 0x28) {
          int v17 = 0;
        }
        else {
          int v17 = off_264A0AC28[v10 - 1];
        }
        int v19 = v17;
        *(_DWORD *)buf = 138413058;
        v112 = (__CFString *)self;
        __int16 v113 = 2080;
        v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
        __int16 v115 = 2112;
        v116 = v19;
        __int16 v117 = 2112;
        v118 = v15;
        _os_log_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_INFO, "%@ %s found history item for %@ %@", buf, 0x2Au);
      }
      uint64_t v20 = [(__CFString *)v15 bundleID];
      int v21 = [(__CFString *)v88 containsObject:v20];

      if (v21)
      {
        v87 = [(__CFString *)v15 bundleID];
        goto LABEL_42;
      }
      v87 = [(__CFString *)v88 objectAtIndexedSubscript:0];
      long long v22 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v74 = [(__CFString *)v15 bundleID];
        if (v10 - 1 > 0x28) {
          v75 = 0;
        }
        else {
          v75 = off_264A0AC28[v10 - 1];
        }
        v76 = v75;
        *(_DWORD *)buf = 138413314;
        v112 = (__CFString *)self;
        __int16 v113 = 2080;
        v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
        __int16 v115 = 2112;
        v116 = v74;
        __int16 v117 = 2112;
        v118 = v76;
        __int16 v119 = 2112;
        v120 = v87;
        _os_log_error_impl(&dword_22F4EA000, v22, OS_LOG_TYPE_ERROR, "%@ %s history item bundleID %@ isn't valid  for %@ using %@", buf, 0x34u);
      }
    }
    else
    {
      if (v10 == 6
        && [(__CFString *)v88 containsObject:@"com.apple.SessionTrackerApp"])
      {
        v87 = @"com.apple.SessionTrackerApp";
        v18 = @"com.apple.SessionTrackerApp";
      }
      else
      {
        v87 = [(__CFString *)v88 objectAtIndexedSubscript:0];
      }
      long long v22 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        if (v10 - 1 > 0x28) {
          long long v23 = 0;
        }
        else {
          long long v23 = off_264A0AC28[v10 - 1];
        }
        v24 = v23;
        *(_DWORD *)buf = 138413058;
        v112 = (__CFString *)self;
        __int16 v113 = 2080;
        v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
        __int16 v115 = 2112;
        v116 = v24;
        __int16 v117 = 2112;
        v118 = v87;
        _os_log_impl(&dword_22F4EA000, v22, OS_LOG_TYPE_DEFAULT, "%@ %s: Could not find history for item for actionType:%@ using bundleID %@", buf, 0x2Au);
      }
    }

LABEL_42:
    if (v10 == 2)
    {
      v86 = [(CSLPRFStingSettingsModel *)self->_model shortcutItems];
      uint64_t v99 = 0;
      v100 = &v99;
      uint64_t v101 = 0x3032000000;
      v102 = __Block_byref_object_copy__3078;
      v103 = __Block_byref_object_dispose__3079;
      id v104 = 0;
      v98[0] = MEMORY[0x263EF8330];
      v98[1] = 3221225472;
      v98[2] = __53__CSLPRFStingConfigurationHistory_itemForActionType___block_invoke;
      v98[3] = &unk_264A0B478;
      v98[4] = &v99;
      [v86 enumerateKeysAndObjectsUsingBlock:v98];
      v34 = [(id)v100[5] firstObject];
      log = [v34 identifier];
      v84 = v34;
      if (v15)
      {
        __int16 v35 = [(__CFString *)v15 identifier];
        BOOL v36 = v35 == 0;

        if (!v36)
        {
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          id v37 = (id)v100[5];
          uint64_t v38 = [v37 countByEnumeratingWithState:&v94 objects:v110 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v95;
            while (2)
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v95 != v39) {
                  objc_enumerationMutation(v37);
                }
                v41 = *(void **)(*((void *)&v94 + 1) + 8 * i);
                v42 = [v41 identifier];
                v43 = [(__CFString *)v15 identifier];
                int v44 = [v42 isEqualToString:v43];

                if (v44)
                {
                  uint64_t v62 = [v41 identifier];

                  log = v62;
                  goto LABEL_87;
                }
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v94 objects:v110 count:16];
              if (v38) {
                continue;
              }
              break;
            }
          }
LABEL_87:
        }
      }
      v63 = cslprf_sting_settings_log();
      os_log_type_t v64 = 16 * (log == 0);
      if (os_log_type_enabled(v63, v64))
      {
        v65 = @"RunShortcut";
        model = self->_model;
        v67 = (void *)v100[5];
        *(_DWORD *)buf = 138413826;
        v112 = @"RunShortcut";
        __int16 v113 = 2112;
        v114 = (const char *)v87;
        __int16 v115 = 2112;
        v116 = (__CFString *)log;
        __int16 v117 = 2112;
        v118 = (__CFString *)model;
        __int16 v119 = 2112;
        v120 = v84;
        __int16 v121 = 2112;
        v122 = v67;
        __int16 v123 = 2112;
        v124 = v86;
        _os_log_impl(&dword_22F4EA000, v63, v64, "Returning shortcut item for actionType=%@, bundleID=%@ workoutIdentifier=%@ model=%@ shortcut=%@ shortcuts=%@ shortcutsByBundleID=%@", buf, 0x48u);
      }
      _Block_object_dispose(&v99, 8);

      unint64_t v10 = 2;
      goto LABEL_101;
    }
    if (v10 == 38)
    {
      v86 = [(CSLPRFStingSettingsModel *)self->_model accessibilityItems];
      v85 = [v86 firstObject];
      log = [v85 identifier];
      if (v15)
      {
        v45 = [(__CFString *)v15 identifier];
        BOOL v46 = v45 == 0;

        if (!v46)
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v47 = v86;
          uint64_t v48 = [v47 countByEnumeratingWithState:&v90 objects:v109 count:16];
          if (v48)
          {
            uint64_t v49 = *(void *)v91;
            while (2)
            {
              for (uint64_t j = 0; j != v48; ++j)
              {
                if (*(void *)v91 != v49) {
                  objc_enumerationMutation(v47);
                }
                v51 = *(void **)(*((void *)&v90 + 1) + 8 * j);
                v52 = [v51 identifier];
                v53 = [(__CFString *)v15 identifier];
                int v54 = [v52 isEqualToString:v53];

                if (v54)
                {
                  uint64_t v56 = [v51 identifier];

                  id v57 = v51;
                  v85 = v57;
                  log = v56;
                  goto LABEL_82;
                }
              }
              uint64_t v48 = [v47 countByEnumeratingWithState:&v90 objects:v109 count:16];
              if (v48) {
                continue;
              }
              break;
            }
          }
LABEL_82:
        }
      }
      v58 = cslprf_sting_settings_log();
      os_log_type_t v59 = 16 * (log == 0);
      if (os_log_type_enabled(v58, v59))
      {
        v60 = @"RunAccessibilityShortcut";
        v61 = self->_model;
        *(_DWORD *)buf = 138413570;
        v112 = @"RunAccessibilityShortcut";
        __int16 v113 = 2112;
        v114 = (const char *)v87;
        __int16 v115 = 2112;
        v116 = (__CFString *)log;
        __int16 v117 = 2112;
        v118 = (__CFString *)v61;
        __int16 v119 = 2112;
        v120 = v85;
        __int16 v121 = 2112;
        v122 = v86;
        _os_log_impl(&dword_22F4EA000, v58, v59, "Returning AX shortcut item for actionType=%@, bundleID=%@ workoutIdentifier=%@ model=%@ AX shortcut=%@ AX shortcuts=%@", buf, 0x3Eu);
      }
      unint64_t v10 = 38;
      goto LABEL_101;
    }
    if (v10 != 6)
    {
      log = 0;
LABEL_102:
      v8 = [[CSLPRFStingConfigurationHistoryItem alloc] initWithBundleID:v87 actionType:v10 identifier:log];

LABEL_103:
      v9 = v87;
      goto LABEL_104;
    }
    v86 = [(CSLPRFStingSettingsModel *)self->_model startWorkoutsListForBundleID:v87];
    v83 = [v86 firstObject];
    log = [v83 workoutIdentifier];
    if (v15)
    {
      uint64_t v25 = [(__CFString *)v15 identifier];
      BOOL v26 = v25 == 0;

      if (v26)
      {
        v68 = [(__CFString *)v15 actionType];
        BOOL v69 = [v68 integerValue] == 9;

        if (v69)
        {

          log = 0;
          unint64_t v10 = 9;
          goto LABEL_95;
        }
      }
      else
      {
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v27 = v86;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v105 objects:v125 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v106;
          while (2)
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v106 != v29) {
                objc_enumerationMutation(v27);
              }
              __int16 v31 = [*(id *)(*((void *)&v105 + 1) + 8 * k) workoutIdentifier];
              uint64_t v32 = [(__CFString *)v15 identifier];
              int v33 = [v31 isEqualToString:v32];

              if (v33)
              {
                uint64_t v55 = [(__CFString *)v15 identifier];

                log = v55;
                goto LABEL_80;
              }
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v105 objects:v125 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }
LABEL_80:
      }
    }
    if (!log)
    {
      v70 = cslprf_sting_settings_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        v78 = @"StartWorkout";
        v79 = @"OpenWorkout";
        v80 = self->_model;
        *(_DWORD *)buf = 138413826;
        v112 = @"StartWorkout";
        __int16 v113 = 2112;
        v114 = (const char *)@"OpenWorkout";
        __int16 v115 = 2112;
        v116 = v87;
        __int16 v117 = 2112;
        v118 = 0;
        __int16 v119 = 2112;
        v120 = v80;
        __int16 v121 = 2112;
        v122 = v83;
        __int16 v123 = 2112;
        v124 = v86;
        _os_log_error_impl(&dword_22F4EA000, v70, OS_LOG_TYPE_ERROR, "Missing identifier for workout item actionType=%@, switching to actionType to %@, bundleID=%@ workoutIdentifier=%@ model=%@ workout=%@ workouts=%@", buf, 0x48u);
      }
      log = 0;
      unint64_t v10 = 9;
      goto LABEL_100;
    }
    unint64_t v10 = 6;
LABEL_95:
    v70 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      v71 = off_264A0AC28[v10 - 1];
      v72 = self->_model;
      *(_DWORD *)buf = 138413314;
      v112 = v71;
      __int16 v113 = 2112;
      v114 = (const char *)v87;
      __int16 v115 = 2112;
      v116 = (__CFString *)log;
      __int16 v117 = 2112;
      v118 = (__CFString *)v72;
      __int16 v119 = 2112;
      v120 = v83;
      _os_log_impl(&dword_22F4EA000, v70, OS_LOG_TYPE_INFO, "Returning workout item actionType=%@, bundleID=%@ workoutIdentifier=%@ model=%@ workout=%@", buf, 0x34u);
    }
LABEL_100:

LABEL_101:
    goto LABEL_102;
  }
  v8 = [[CSLPRFStingConfigurationHistoryItem alloc] initWithBundleID:0 actionType:18 identifier:0];
  v9 = cslprf_sting_settings_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v112 = (__CFString *)self;
    __int16 v113 = 2080;
    v114 = "-[CSLPRFStingConfigurationHistory itemForActionType:]";
    __int16 v115 = 2112;
    v116 = (__CFString *)v8;
    _os_log_impl(&dword_22F4EA000, v9, OS_LOG_TYPE_INFO, "%@ %s: action type is none returning %@", buf, 0x20u);
  }
LABEL_104:

  return v8;
}

void __53__CSLPRFStingConfigurationHistory_itemForActionType___block_invoke(uint64_t a1, int a2, id obj, unsigned char *a4)
{
  *a4 = 1;
}

- (void)addHistoryItem:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = (CSLPRFStingConfigurationHistory *)a3;
  if ([(CSLPRFStingConfigurationHistory *)self isValidHistoryItem:v4])
  {
    v5 = [(CSLPRFStingConfigurationHistory *)v4 actionType];
    unint64_t v6 = -[CSLPRFStingConfigurationHistory historyActionType:](self, "historyActionType:", [v5 integerValue]);

    os_log_t log = [NSNumber numberWithInteger:v6];
    obuint64_t j = self;
    objc_sync_enter(obj);
    v7 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [log integerValue];
      if ((unint64_t)(v8 - 1) > 0x28) {
        v9 = 0;
      }
      else {
        v9 = off_264A0AC28[v8 - 1];
      }
      unint64_t v10 = v9;
      *(_DWORD *)buf = 138412546;
      v40 = v4;
      __int16 v41 = 2112;
      v42 = (const char *)v10;
      _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "Storing %@ with %@", buf, 0x16u);
    }
    uint64_t v32 = [(CSLPRFStingConfigurationHistorySetting *)obj->_historySetting read];
    id v11 = [(CSLPRFStingConfigurationHistoryData *)v32 actionsDictionary];
    uint64_t v12 = [v11 mutableCopy];

    id v13 = (id)v12;
    if (!v12) {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    long long v30 = v13;
    uint64_t v14 = [v13 objectForKeyedSubscript:log];
    uint64_t v29 = (void *)[v14 mutableCopy];

    uint64_t v15 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      v40 = obj;
      __int16 v41 = 2080;
      v42 = "-[CSLPRFStingConfigurationHistory addHistoryItem:]";
      __int16 v43 = 2112;
      int v44 = v4;
      __int16 v45 = 2112;
      BOOL v46 = v29;
      _os_log_impl(&dword_22F4EA000, v15, OS_LOG_TYPE_INFO, "%@ %s Before adding %@, currentItems = %@", buf, 0x2Au);
    }

    if (v29)
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF9B0]);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v17 = v29;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v17);
            }
            int v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            long long v22 = [v21 bundleID];
            long long v23 = [(CSLPRFStingConfigurationHistory *)v4 bundleID];
            char v24 = [v22 isEqualToString:v23];

            if ((v24 & 1) == 0) {
              [v16 addObject:v21];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v18);
      }

      if ((unint64_t)[v16 count] >= 0x10) {
        [v16 removeObjectAtIndex:0];
      }
      [v16 addObject:v4];
      uint64_t v25 = (void *)[v16 copy];
      [v30 setObject:v25 forKeyedSubscript:log];
    }
    else
    {
      id v16 = (id)[objc_alloc(MEMORY[0x263EFF9D8]) initWithObject:v4];
      [v30 setObject:v16 forKeyedSubscript:log];
    }

    BOOL v26 = cslprf_sting_settings_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = [v30 objectForKeyedSubscript:log];
      *(_DWORD *)buf = 138413058;
      v40 = obj;
      __int16 v41 = 2080;
      v42 = "-[CSLPRFStingConfigurationHistory addHistoryItem:]";
      __int16 v43 = 2112;
      int v44 = v4;
      __int16 v45 = 2112;
      BOOL v46 = v27;
      _os_log_impl(&dword_22F4EA000, v26, OS_LOG_TYPE_INFO, "%@ %s: After adding %@, currentItems = %@", buf, 0x2Au);
    }
    if (!v32) {
      uint64_t v32 = objc_alloc_init(CSLPRFStingConfigurationHistoryData);
    }
    uint64_t v28 = (void *)[v30 copy];
    [(CSLPRFStingConfigurationHistoryData *)v32 setActionsDictionary:v28];

    [(CSLPRFStingConfigurationHistorySetting *)obj->_historySetting write:v32];
    objc_sync_exit(obj);
  }
  else
  {
    cslprf_sting_settings_log();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v40 = self;
      __int16 v41 = 2080;
      v42 = "-[CSLPRFStingConfigurationHistory addHistoryItem:]";
      __int16 v43 = 2112;
      int v44 = v4;
      _os_log_error_impl(&dword_22F4EA000, log, OS_LOG_TYPE_ERROR, "%@: %s item %@ is not valid, not adding", buf, 0x20u);
    }
  }
}

- (unint64_t)historyActionType:(unint64_t)a3
{
  if (a3 == 9) {
    return 6;
  }
  else {
    return a3;
  }
}

- (BOOL)isValidHistoryItem:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 actionType];
  unint64_t v6 = v5;
  if (!v5)
  {
    v9 = cslprf_sting_settings_log();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      BOOL v8 = 0;
      goto LABEL_15;
    }
    uint64_t v12 = [0 integerValue];
    id v13 = 0;
    if ((unint64_t)(v12 - 1) <= 0x28) {
      id v13 = off_264A0AC28[v12 - 1];
    }
    uint64_t v14 = v13;
    int v18 = 138413058;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    int v21 = "-[CSLPRFStingConfigurationHistory isValidHistoryItem:]";
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v14;
    uint64_t v15 = "%@: %s item %@ does not include a valid action of type %@";
    id v16 = v9;
    goto LABEL_12;
  }
  unint64_t v7 = -[CSLPRFStingConfigurationHistory historyActionType:](self, "historyActionType:", [v5 integerValue]);
  BOOL v8 = 1;
  if (v7 != 2 && v7 != 38)
  {
    v9 = [(CSLPRFStingSettingsModel *)self->_model bundleIDsForActionType:v7];
    unint64_t v10 = [v4 bundleID];
    char v11 = [v9 containsObject:v10];

    if (v11)
    {

      BOOL v8 = 1;
      goto LABEL_15;
    }
    uint64_t v14 = cslprf_sting_settings_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v18 = 138413058;
    uint64_t v19 = self;
    __int16 v20 = 2080;
    int v21 = "-[CSLPRFStingConfigurationHistory isValidHistoryItem:]";
    __int16 v22 = 2112;
    id v23 = v4;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    uint64_t v15 = "%@: %s item %@ does not have a valid bundleID %@";
    id v16 = v14;
LABEL_12:
    _os_log_error_impl(&dword_22F4EA000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v18, 0x2Au);
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (CSLPRFStingConfigurationHistory)initWithSetting:(id)a3 model:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSLPRFStingConfigurationHistory;
  v9 = [(CSLPRFStingConfigurationHistory *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_historySetting, a3);
    objc_storeStrong((id *)&v10->_model, a4);
  }

  return v10;
}

- (CSLPRFStingConfigurationHistory)init
{
  v3 = objc_alloc_init(CSLPRFStingConfigurationHistorySetting);
  id v4 = objc_alloc_init(CSLPRFStingSettingsModel);
  v5 = [(CSLPRFStingConfigurationHistory *)self initWithSetting:v3 model:v4];

  return v5;
}

@end