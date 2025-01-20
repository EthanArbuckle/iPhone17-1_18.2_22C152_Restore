@interface DNDSAppConfigurationManager
- (DNDSAppConfigurationManager)initWithAppSpecificSettingsManager:(id)a3;
- (NSString)sysdiagnoseDataIdentifier;
- (id)appActionForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)appActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5;
- (id)clearSystemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4;
- (id)predicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)predicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5;
- (id)setPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6;
- (id)setSystemAction:(id)a3 modeIdentifier:(id)a4;
- (id)setTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (id)systemActionForActionIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)systemActionsForModeIdentifier:(id)a3 error:(id *)a4;
- (id)targetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)targetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4;
- (id)updateSystemActionWithReverseAction:(id)a3 actionIdentifier:(id)a4 modeIdentifier:(id)a5;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)invalidateAppContextForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5;
- (void)refreshWithAvailableModes:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation DNDSAppConfigurationManager

- (DNDSAppConfigurationManager)initWithAppSpecificSettingsManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSAppConfigurationManager;
  v6 = [(DNDSAppConfigurationManager *)&v14 init];
  if (v6)
  {
    uint64_t v7 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.server.AppConfigurationsManager"];
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    predicates = v6->_predicates;
    v6->_predicates = v9;

    objc_storeStrong((id *)&v6->_appSpecificSettingsManager, a3);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v11;

    DNDSRegisterSysdiagnoseDataProvider(v6);
  }

  return v6;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSAppConfigurationManager;
  [(DNDSAppConfigurationManager *)&v3 dealloc];
}

- (void)addDelegate:(id)a3
{
}

- (void)removeDelegate:(id)a3
{
}

- (void)refreshWithAvailableModes:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v23 = objc_msgSend(a3, "bs_map:", &__block_literal_global_30);
  v24 = self;
  v4 = -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:error:](self->_appSpecificSettingsManager, "removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:error:");
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        v13 = [v7 objectForKeyedSubscript:v12];
        objc_super v14 = [v13 applicationIdentifiers];
        [v5 setObject:v14 forKeyedSubscript:v12];

        v15 = [v7 objectForKeyedSubscript:v12];
        v16 = [v15 modeSpecificSettings];
        [v6 setObject:v16 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = v24->_delegates;
  uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v25 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v22 appConfigurationManager:v24 didClearActionsForAppsInModeIdentifiers:v5];
        }
        if (objc_opt_respondsToSelector()) {
          [v22 appConfigurationManager:v24 didClearSystemActionsInModeIdentifiers:v6];
        }
      }
      uint64_t v19 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }
}

uint64_t __57__DNDSAppConfigurationManager_refreshWithAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 modeIdentifier];
}

- (id)predicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  return [(DNDSAppSpecificSettingsManager *)self->_appSpecificSettingsManager appConfigurationPredicateForActionIdentifier:a3 forApplicationIdentifier:a4 modeIdentifier:a5 error:a6];
}

- (id)setPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    goto LABEL_4;
  }
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v22 = 0;
  v15 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager appActionWithIdentifier:v11 forApplicationIdentifier:v12 modeIdentifier:v13 error:&v22];
  id v16 = v22;
  if (v15)
  {

LABEL_4:
    v17 = self->_appSpecificSettingsManager;
    id v21 = 0;
    [(DNDSAppSpecificSettingsManager *)v17 setAppSpecificSettings:v10 identifier:v11 type:objc_opt_class() applicationIdentifier:v12 modeIdentifier:v13 error:&v21];
    id v18 = v21;
    goto LABEL_8;
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", @"No action exists for action identifier; ignoring request to set predicate.",
    *MEMORY[0x1E4F28568]);
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v19];

LABEL_8:
  return v18;
}

- (id)predicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  return [(DNDSAppSpecificSettingsManager *)self->_appSpecificSettingsManager appConfigurationPredicateForApplicationIdentifier:a3 modeIdentifier:a4 error:a5];
}

- (id)targetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  return [(DNDSAppSpecificSettingsManager *)self->_appSpecificSettingsManager appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:a3 modeIdentifier:a4 error:a5];
}

- (id)targetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4
{
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v6 = a3;
  id v7 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager appSpecificSettingsOfType:objc_opt_class() modeIdentifier:v6 error:a4];

  return v7;
}

- (id)setTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 || ![v10 length]) {
    goto LABEL_5;
  }
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v22 = 0;
  v15 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager appActionWithIdentifier:v11 forApplicationIdentifier:v12 modeIdentifier:v13 error:&v22];
  id v16 = v22;
  if (v15)
  {

LABEL_5:
    v17 = self->_appSpecificSettingsManager;
    id v21 = 0;
    [(DNDSAppSpecificSettingsManager *)v17 setAppSpecificSettings:v10 identifier:v11 type:objc_opt_class() applicationIdentifier:v12 modeIdentifier:v13 error:&v21];
    id v18 = v21;
    goto LABEL_6;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", @"No action exists for action identifier; ignoring request to set target content identifier prefix.",
    *MEMORY[0x1E4F28568]);
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v20];

LABEL_6:
  return v18;
}

- (void)invalidateAppContextForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v39 = 0;
  id v11 = [(DNDSAppConfigurationManager *)self appActionForActionIdentifier:v8 applicationIdentifier:v9 modeIdentifier:v10 error:&v39];
  id v12 = v39;
  if (v12) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  if (v13)
  {
    id v14 = v12;
    v15 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v9;
      __int16 v44 = 2112;
      id v45 = v10;
      __int16 v46 = 2112;
      id v47 = v14;
      _os_log_error_impl(&dword_1D3052000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve action for actionIdentifier:%@ applicationIdentifier:%@ modeIdentifier: %@, error=%@", buf, 0x2Au);
    }
  }
  else
  {
    id v16 = [v9 bundleID];
    id v17 = objc_alloc_init(MEMORY[0x1E4F72CD8]);
    id v38 = 0;
    id v18 = [v17 actionForBundleIdentifier:v16 andActionIdentifier:v8 error:&v38];
    id v19 = v38;
    id v14 = v19;
    if (v19 || !v18)
    {
      long long v27 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        id v41 = v8;
        __int16 v42 = 2114;
        id v43 = v9;
        __int16 v44 = 2114;
        id v45 = v10;
        __int16 v46 = 2114;
        id v47 = v14;
        _os_log_error_impl(&dword_1D3052000, v27, OS_LOG_TYPE_ERROR, "Failed to get action metadata for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ modeIdentifier:%{public}@ error=%{public}@", buf, 0x2Au);
      }
    }
    else
    {
      id v29 = v17;
      long long v30 = v16;
      uint64_t v20 = [MEMORY[0x1E4F72BC8] policyWithActionMetadata:v18];
      id v21 = [v11 action];
      id v22 = [v21 parameters];
      v23 = [v20 actionWithParameters:v22];

      v24 = [v23 actionWithOpenWhenRun:0];

      long long v25 = v20;
      id v37 = 0;
      long long v26 = [v20 connectionWithError:&v37];
      id v14 = v37;
      if (v14 || !v26)
      {
        long long v28 = DNDSLogAppConfigurationServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          id v41 = v8;
          __int16 v42 = 2112;
          id v43 = v9;
          __int16 v44 = 2112;
          id v45 = v10;
          __int16 v46 = 2112;
          id v47 = v14;
          _os_log_error_impl(&dword_1D3052000, v28, OS_LOG_TYPE_ERROR, "Failed to create connection for actionIdentifier:%@ applicationIdentifier:%@ modeIdentifier: %@, error=%@", buf, 0x2Au);
        }
      }
      else
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke;
        v31[3] = &unk_1E69751F0;
        id v32 = v24;
        v33 = self;
        id v34 = v8;
        id v35 = v9;
        id v36 = v10;
        [v26 fetchActionAppContextForAction:v32 completionHandler:v31];
      }
      id v17 = v29;
      id v16 = v30;
    }
  }
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR)) {
      __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_2((uint64_t)a1, (uint64_t)v6, v7);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v5;
      id v9 = DNDSLogAppConfigurationServiceProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[4];
        int v18 = 138412546;
        id v19 = v8;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched updated appContext %@ for action %@", (uint8_t *)&v18, 0x16u);
      }
      id v11 = (void *)a1[5];
      id v12 = [v8 notificationFilterPredicate];
      id v13 = (id)[v11 setPredicate:v12 forActionIdentifier:a1[6] forApplicationIdentifier:a1[7] modeIdentifier:a1[8]];

      id v14 = (void *)a1[5];
      v15 = [v8 targetContentIdentifierPrefix];
      id v16 = (id)[v14 setTargetContentIdentifierPrefix:v15 forActionIdentifier:a1[6] forApplicationIdentifier:a1[7] modeIdentifier:a1[8]];
    }
    else
    {
      id v17 = DNDSLogAppConfigurationServiceProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR)) {
        __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_1((uint64_t)v5, (uint64_t)a1, v17);
      }
    }
  }
}

- (id)appActionForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  return [(DNDSAppSpecificSettingsManager *)self->_appSpecificSettingsManager appActionWithIdentifier:a3 forApplicationIdentifier:a4 modeIdentifier:a5 error:a6];
}

- (id)appActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v6 = a3;
  id v7 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager appSpecificSettingsOfType:objc_opt_class() modeIdentifier:v6 error:a4];

  return v7;
}

- (id)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  [MEMORY[0x1E4F5F570] runtimeIsSupported:&v33];
  id v11 = v33;
  if (!v11)
  {
    id v12 = [v9 bundleID];
    [v8 setBundleIdentifier:v12];

    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    id v14 = [v8 identifier];
    id v32 = 0;
    [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager setAppSpecificSettings:v8 identifier:v14 type:objc_opt_class() applicationIdentifier:v9 modeIdentifier:v10 error:&v32];
    id v11 = v32;

    if (v8)
    {
      if (v11) {
        goto LABEL_16;
      }
    }
    else
    {
      v15 = self->_appSpecificSettingsManager;
      id v16 = [0 identifier];
      id v31 = v11;
      [(DNDSAppSpecificSettingsManager *)v15 setAppSpecificSettings:0 identifier:v16 type:objc_opt_class() applicationIdentifier:v9 modeIdentifier:v10 error:&v31];
      id v17 = v31;

      id v11 = v17;
      if (v17) {
        goto LABEL_16;
      }
    }
    id v26 = v11;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    int v18 = self->_delegates;
    uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v23 appConfigurationManager:self didSetAction:v8 forApplicationIdentifier:v9 modeIdentifier:v10];
          }
        }
        uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v20);
    }

    id v11 = v26;
  }
LABEL_16:
  id v24 = v11;

  return v24;
}

- (id)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v27 = 0;
  [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager setAppSpecificSettings:0 identifier:v8 type:objc_opt_class() applicationIdentifier:v9 modeIdentifier:v10 error:&v27];
  id v12 = v27;
  id v13 = self->_appSpecificSettingsManager;
  id v26 = v12;
  [(DNDSAppSpecificSettingsManager *)v13 setAppSpecificSettings:0 identifier:v8 type:objc_opt_class() applicationIdentifier:v9 modeIdentifier:v10 error:&v26];
  id v21 = v26;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = self->_delegates;
  uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v19 appConfigurationManager:self didClearActionWithIdentifier:v8 forApplicationIdentifier:v9 modeIdentifier:v10];
        }
      }
      uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v16);
  }

  return v21;
}

- (id)systemActionForActionIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager modeSpecificSettingsOfType:objc_opt_class() identifier:v9 modeIdentifier:v8 error:a5];

  return v10;
}

- (id)systemActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v6 = a3;
  id v7 = [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager modeSpecificSettingsOfType:objc_opt_class() modeIdentifier:v6 error:a4];

  return v7;
}

- (id)setSystemAction:(id)a3 modeIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v24 = 0;
  [MEMORY[0x1E4F5F770] runtimeIsSupported:&v24];
  id v8 = v24;
  if (!v8)
  {
    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    id v10 = [v6 identifier];
    id v23 = 0;
    [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager setModeSpecificSettings:v6 identifier:v10 type:objc_opt_class() modeIdentifier:v7 error:&v23];
    id v8 = v23;

    if (!v8)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v11 = self->_delegates;
      uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v20 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v16, "appConfigurationManager:didSetSystemAction:modeIdentifier:", self, v6, v7, (void)v19);
            }
          }
          uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
        }
        while (v13);
      }
    }
  }
  id v17 = v8;

  return v17;
}

- (id)updateSystemActionWithReverseAction:(id)a3 actionIdentifier:(id)a4 modeIdentifier:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v33 = 0;
  [MEMORY[0x1E4F5F770] runtimeIsSupported:&v33];
  id v11 = v33;
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = v12;
    goto LABEL_19;
  }
  id v32 = 0;
  uint64_t v14 = [(DNDSAppConfigurationManager *)self systemActionForActionIdentifier:v9 modeIdentifier:v10 error:&v32];
  id v12 = v32;
  if (!v14)
  {
    long long v21 = DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDSAppConfigurationManager updateSystemActionWithReverseAction:actionIdentifier:modeIdentifier:]((uint64_t)v9, (uint64_t)v10, v21);
      if (v12) {
        goto LABEL_12;
      }
    }
    else if (v12)
    {
LABEL_12:
      id v26 = v12;
      id v12 = v26;
      uint64_t v14 = 0;
      goto LABEL_15;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Unable to find system action for reverse action. action=%@; mode=%@",
      v9,
    long long v22 = v10);
    id v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F5F528];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = v22;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    id v12 = [v23 errorWithDomain:v24 code:1007 userInfo:v25];

    goto LABEL_12;
  }
  uint64_t v15 = [v14 reverseAction];
  if ((id)v15 == v8)
  {

LABEL_17:
    uint64_t v13 = 0;
    goto LABEL_18;
  }
  uint64_t v16 = (void *)v15;
  if (v8 && ([v14 reverseAction], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v18 = (void *)v17;
    long long v19 = [v14 reverseAction];
    char v20 = [v8 isEqual:v19];

    if (v20) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  id v27 = (void *)[v14 mutableCopy];
  [v27 setReverseAction:v8];

  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  id v31 = v12;
  [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager setModeSpecificSettings:v27 identifier:v9 type:objc_opt_class() modeIdentifier:v10 error:&v31];
  id v29 = v31;

  id v26 = v29;
  id v12 = v26;
  uint64_t v14 = v27;
LABEL_15:
  uint64_t v13 = v26;
LABEL_18:

LABEL_19:
  return v13;
}

- (id)clearSystemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v25 = 0;
  id v8 = [(DNDSAppConfigurationManager *)self systemActionForActionIdentifier:v6 modeIdentifier:v7 error:&v25];
  id v9 = v25;
  if (v8)
  {
    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    id v24 = v9;
    id v19 = v6;
    [(DNDSAppSpecificSettingsManager *)appSpecificSettingsManager setModeSpecificSettings:0 identifier:v6 type:objc_opt_class() modeIdentifier:v7 error:&v24];
    id v18 = v24;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = self->_delegates;
    uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v16 appConfigurationManager:self didClearSystemAction:v8 modeIdentifier:v7];
          }
        }
        uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v13);
    }

    id v9 = v18;
    id v6 = v19;
  }

  return v9;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.AppConfigurationManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v4 = objc_opt_new();
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_appSpecificSettingsManager, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a2 + 32);
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, a2, a3, "Fetched appContext:%@ for action:%@ is invalid", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, a2, a3, "Failed to fetch appContext for action:%@, error=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)updateSystemActionWithReverseAction:(uint64_t)a1 actionIdentifier:(uint64_t)a2 modeIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, a2, a3, "Unable to find system action for reverse action. action=%@; mode=%@",
    *(void *)v3,
    *(void *)&v3[8],
    *(void *)&v3[16],
    *MEMORY[0x1E4F143B8]);
}

@end