@interface DNDSModeConfigurationManager
- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 withError:(id *)a5;
- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4;
- (BOOL)setModeConfiguration:(id)a3 withError:(id *)a4;
- (DNDSModeConfigurationManager)initWithBackingStore:(id)a3 keybag:(id)a4;
- (DNDSModeConfigurationManagerDelegate)delegate;
- (NSString)sysdiagnoseDataIdentifier;
- (id)_inheritFromDefaultModeConfiguration:(id)a3;
- (id)_prepareModeConfigurationForStorage:(id)a3 withError:(id *)a4;
- (id)_readModeConfigurationsReturningError:(id *)a3;
- (id)_removedModeConfigurationRecordForModeRecord:(id)a3;
- (id)_sysdiagnoseDataShouldRedact:(BOOL)a3;
- (id)availableModesFilteringPlaceholders:(BOOL)a3 returningError:(id *)a4;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)modeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4;
- (id)modeConfigurationsWithError:(id *)a3;
- (id)relevantApplicationIdentifiers;
- (id)relevantContacts;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)_saveModeConfiguration:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5;
- (unint64_t)_writeModeConfigurationsRecord:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5;
- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5;
- (unint64_t)exceptionForApplicationIdentifier:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5;
- (unint64_t)exceptionForContactHandle:(id)a3 forModeIdentifier:(id)a4;
- (void)_fixupConfigurationsIfNeeded;
- (void)_notifyChangeOfModeConfigurationFrom:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)modeConfigurationStore:(id)a3 didUpdateAvailableModes:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSModeConfigurationManager

- (id)modeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:a4];
  v8 = [v7 modeConfigurationForModeIdentifier:v6];

  if (v8
    && ([v8 mode],
        v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 visibility],
        v9,
        !v10))
  {
    v11 = [MEMORY[0x1E4F5F658] modeConfigurationForRecord:v8];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_readModeConfigurationsReturningError:(id *)a3
{
  backingStore = self->_backingStore;
  id v12 = 0;
  id v6 = [(DNDSModeConfigurationsStoring *)backingStore readRecordWithError:&v12];
  id v7 = v12;
  v8 = v7;
  if (!v7) {
    goto LABEL_10;
  }
  if (a3) {
    *a3 = v7;
  }
  int v9 = [(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot];
  BOOL v10 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v10) {
      -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:]();
    }
    _DNDSRequestRadar(@"Failed to load configurations", v8, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeConfigurationManager.m", 266);
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (!v10)
  {
LABEL_10:
    if (v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:]();
  if (!v6) {
LABEL_11:
  }
    id v6 = objc_alloc_init(DNDSModeConfigurationsRecord);
LABEL_12:

  return v6;
}

- (DNDSModeConfigurationManager)initWithBackingStore:(id)a3 keybag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DNDSModeConfigurationManager;
  int v9 = [(DNDSModeConfigurationManager *)&v13 init];
  if (v9)
  {
    uint64_t v10 = +[DNDSWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.donotdisturb.server.ModeConfigurationsManager"];
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_backingStore, a3);
    [(DNDSModeConfigurationsStoring *)v9->_backingStore setDelegate:v9];
    objc_storeStrong((id *)&v9->_keybag, a4);
    [(DNDSKeybagStateProviding *)v9->_keybag addObserver:v9];
    DNDSRegisterSysdiagnoseDataProvider(v9);
    [(DNDSModeConfigurationManager *)v9 _fixupConfigurationsIfNeeded];
  }

  return v9;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModeConfigurationManager;
  [(DNDSModeConfigurationManager *)&v3 dealloc];
}

- (BOOL)setModeConfiguration:(id)a3 withError:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 mode];
  id v8 = [v7 modeIdentifier];
  id v9 = [(DNDSModeConfigurationManager *)self modeConfigurationForModeIdentifier:v8 withError:0];

  if (v9 == v6 || v6 && v9 && [v6 isEqual:v9])
  {
    uint64_t v10 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1D3052000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring call to set mode configuration because it is unchanged.", (uint8_t *)&v34, 2u);
    }
  }
  if ([(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot])
  {
    v11 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Secure data will be written", (uint8_t *)&v34, 2u);
    }
    goto LABEL_21;
  }
  if ([v6 hasSecureData])
  {
    id v12 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationManager setModeConfiguration:withError:](v12);
    }
    objc_super v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5F528];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"Cannot store mode configuration as new configuration contains secure data and store is not writeable";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = (__CFString **)v39;
    v17 = &v38;
  }
  else
  {
    int v18 = [v9 hasSecureData];
    v19 = DNDSLogModeConfigurations;
    if (!v18)
    {
      uint64_t v23 = 0;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1D3052000, v19, OS_LOG_TYPE_DEFAULT, "Secure data will not be written", (uint8_t *)&v34, 2u);
        uint64_t v23 = 0;
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR)) {
      -[DNDSModeConfigurationManager setModeConfiguration:withError:](v19);
    }
    objc_super v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F5F528];
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37 = @"Cannot replace mode configuration as existing configuration has secure data and store is not writeable";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    v16 = &v37;
    v17 = &v36;
  }
  v20 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:1];
  id v21 = [v13 errorWithDomain:v14 code:1004 userInfo:v20];

  if (!v21)
  {
LABEL_21:
    uint64_t v23 = 1;
LABEL_22:
    if (!v9 && [v6 isAutomaticallyGenerated])
    {
      uint64_t v24 = [(DNDSModeConfigurationManager *)self _inheritFromDefaultModeConfiguration:v6];

      id v6 = (id)v24;
    }
    v25 = v6;
    id v6 = [(DNDSModeConfigurationManager *)self _prepareModeConfigurationForStorage:v6 withError:a4];

    if (a4 && *a4)
    {
      id v21 = 0;
      goto LABEL_28;
    }
    v26 = [v6 mode];
    int v27 = [v26 isPlaceholder];

    if (v27)
    {
      v28 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = [v6 mode];
        v31 = [v30 modeIdentifier];
        int v34 = 138543362;
        v35 = v31;
        _os_log_impl(&dword_1D3052000, v29, OS_LOG_TYPE_DEFAULT, "Setting mode configuration with placeholder visibility effectively removing mode configuration for system Focus by demoting to placeholder; modeIdentifier=%{public}@",
          (uint8_t *)&v34,
          0xCu);
      }
    }
    unint64_t v32 = [(DNDSModeConfigurationManager *)self _saveModeConfiguration:v6 writeSecurePartition:v23 error:a4];
    if (v32 == 2) {
      [(DNDSModeConfigurationManager *)self _notifyChangeOfModeConfigurationFrom:v9 to:v6];
    }
    id v21 = 0;
    BOOL v22 = v32 != 0;
    goto LABEL_35;
  }
  if (!a4)
  {
LABEL_28:
    BOOL v22 = 0;
    goto LABEL_35;
  }
  id v21 = v21;
  BOOL v22 = 0;
  *a4 = v21;
LABEL_35:

  return v22;
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4
{
  return [(DNDSModeConfigurationManager *)self removeModeConfigurationForModeIdentifier:a3 deletePlaceholder:0 withError:a4];
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 withError:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:a5];
  uint64_t v10 = [v9 modeConfigurationForModeIdentifier:v8];
  if (v10)
  {
    v11 = (void *)[v9 mutableCopy];
    id v12 = [v10 mode];
    uint64_t v13 = [v12 semanticType];

    if ((unint64_t)(v13 - 1) >= 9)
    {
      if (v13)
      {
        uint64_t v23 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 138543362;
          id v25 = v8;
          _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Removing mode configuration for custom Focus or Focus w/ unknown semantic type; modeIdentifier=%{public}@",
            (uint8_t *)&v24,
            0xCu);
        }
        [v11 setModeConfiguration:0 forModeIdentifier:v8];
      }
      else if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_FAULT))
      {
        -[DNDSModeConfigurationManager removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:]();
      }
    }
    else
    {
      if (a4)
      {
        uint64_t v14 = 0;
      }
      else
      {
        v16 = [v10 mode];
        v17 = [(DNDSModeConfigurationManager *)self _removedModeConfigurationRecordForModeRecord:v16];
        uint64_t v14 = [v17 makeRecord];
      }
      int v18 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543362;
        id v25 = v8;
        _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Removing mode configuration for system Focus by demoting to placeholder; modeIdentifier=%{public}@",
          (uint8_t *)&v24,
          0xCu);
      }
      [v11 setModeConfiguration:v14 forModeIdentifier:v8];
    }
    unint64_t v19 = [(DNDSModeConfigurationManager *)self _writeModeConfigurationsRecord:v11 writeSecurePartition:1 error:a5];
    if (v19 == 2)
    {
      v20 = [(DNDSModeConfigurationManager *)self availableModesFilteringPlaceholders:1 returningError:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained modeConfigurationManager:self didUpdateAvailableModes:v20];
    }
    BOOL v15 = v19 != 0;
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (id)modeConfigurationsWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = objc_msgSend(v6, "modeConfigurations", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 mode];
        uint64_t v14 = [v13 visibility];

        if (!v14)
        {
          BOOL v15 = [MEMORY[0x1E4F5F658] modeConfigurationForRecord:v12];
          v16 = [v12 mode];
          v17 = [v16 modeIdentifier];
          [v5 setObject:v15 forKeyedSubscript:v17];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)availableModesFilteringPlaceholders:(BOOL)a3 returningError:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:a4];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 modeConfigurations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        id v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) mode];
        uint64_t v13 = [MEMORY[0x1E4F5F5F8] modeForRecord:v12];
        uint64_t v14 = v13;
        if ((!v4 || ([v13 isPlaceholder] & 1) == 0)
          && ([v14 semanticType] != 9 || _os_feature_enabled_impl()))
        {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x1E4F5F598];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[[v8 alloc] initWithBundleID:v11];

  unint64_t v13 = [(DNDSModeConfigurationManager *)self exceptionForApplicationIdentifier:v12 thread:v10 forModeIdentifier:v9];
  return v13;
}

- (unint64_t)exceptionForApplicationIdentifier:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(DNDSModeConfigurationManager *)self modeConfigurationForModeIdentifier:a5 withError:0];
  id v11 = [v10 configuration];
  unint64_t v12 = [v11 exceptionForApplicationIdentifier:v9 thread:v8];

  return v12;
}

- (unint64_t)exceptionForContactHandle:(id)a3 forModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(DNDSModeConfigurationManager *)self modeConfigurationForModeIdentifier:a4 withError:0];
  id v8 = [v7 configuration];
  unint64_t v9 = [v8 exceptionForContactHandle:v6];

  return v9;
}

- (id)relevantApplicationIdentifiers
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v26 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:0];
  [v26 modeConfigurations];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v8 = [v7 triggers];
        unint64_t v9 = [v8 triggers];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v34 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v16 = [v15 applicationIdentifier];
                [v3 addObject:v16];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v12);
        }

        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v17 = [v7 secureConfiguration];
        long long v18 = [v17 allowedApplications];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v30 != v21) {
                objc_enumerationMutation(v18);
              }
              [v3 addObject:*(void *)(*((void *)&v29 + 1) + 8 * k)];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
          }
          while (v20);
        }

        uint64_t v23 = [v7 secureConfiguration];
        uint64_t v24 = [v23 deniedApplications];
        [v3 unionSet:v24];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)relevantContacts
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(DNDSModeConfigurationManager *)self _readModeConfigurationsReturningError:0];
  uint64_t v5 = [v4 modeConfigurations];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)MEMORY[0x1E4F5F748];
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) secureConfiguration];
        uint64_t v12 = [v11 senderConfiguration];
        uint64_t v13 = [v10 configurationForRecord:v12];

        uint64_t v14 = [v13 allowedContacts];
        [v3 unionSet:v14];

        BOOL v15 = [v13 deniedContacts];
        [v3 unionSet:v15];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  uint64_t v4 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "Keybag unlocked for the first time; fixing up mode sender configurations if needed.",
      v5,
      2u);
  }
  [(DNDSModeConfigurationManager *)self _fixupConfigurationsIfNeeded];
}

- (unint64_t)_saveModeConfiguration:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v8 = DNDSLogModeConfigurations;
  id v9 = a3;
  [v9 log:v8 withMessage:@"Saving configuration"];
  id v10 = [(DNDSModeConfigurationsStoring *)self->_backingStore readRecordWithError:0];
  uint64_t v11 = (void *)[v10 mutableCopy];
  uint64_t v12 = [v9 makeRecord];
  uint64_t v13 = [v9 mode];

  uint64_t v14 = [v13 modeIdentifier];
  [v11 setModeConfiguration:v12 forModeIdentifier:v14];

  unint64_t v15 = [(DNDSModeConfigurationManager *)self _writeModeConfigurationsRecord:v11 writeSecurePartition:v6 error:a5];
  return v15;
}

- (unint64_t)_writeModeConfigurationsRecord:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  backingStore = self->_backingStore;
  id v18 = 0;
  uint64_t v10 = [(DNDSModeConfigurationsStoring *)backingStore writeRecord:v8 writePartition:v6 error:&v18];
  id v11 = v18;
  uint64_t v12 = v11;
  if (v10)
  {
    if (v10 == 1)
    {
      long long v16 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v20 = v12;
        _os_log_impl(&dword_1D3052000, v16, OS_LOG_TYPE_DEFAULT, "Failed to save configurations, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v10 == 2)
    {
      [v8 log:DNDSLogModeConfigurations withMessage:@"Saved configurations"];
      unint64_t v13 = 2;
      goto LABEL_19;
    }
    unint64_t v13 = 1;
    goto LABEL_19;
  }
  if (a5 && v11) {
    *a5 = v11;
  }
  int v14 = [(DNDSKeybagStateProviding *)self->_keybag hasUnlockedSinceBoot];
  BOOL v15 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v15) {
      -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:]();
    }
    [v8 log:DNDSLogModeConfigurations withMessage:@"Failed to save configuations"];
    _DNDSRequestRadar(@"Error saving configurations", v12, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeConfigurationManager.m", 370);
  }
  else
  {
    if (v15) {
      -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:]();
    }
    [v8 log:DNDSLogModeConfigurations withMessage:@"Failed to save configuations; first lock"];
  }
  unint64_t v13 = 0;
LABEL_19:

  return v13;
}

- (id)_inheritFromDefaultModeConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 mode];
  BOOL v6 = [v5 modeIdentifier];

  uint64_t v7 = *MEMORY[0x1E4F5F518];
  char v8 = [v6 isEqualToString:*MEMORY[0x1E4F5F518]];
  char v9 = [v6 isEqualToString:*MEMORY[0x1E4F5F548]];
  uint64_t v10 = v4;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = v4;
    if ((v9 & 1) == 0)
    {
      id v11 = [(DNDSModeConfigurationManager *)self modeConfigurationForModeIdentifier:v7 withError:0];
      uint64_t v12 = [v4 configuration];
      unint64_t v13 = [v12 phoneCallBypassSettings];

      int v14 = [v11 configuration];
      BOOL v15 = [v14 phoneCallBypassSettings];

      uint64_t v10 = v4;
      if (([v13 isEqual:v15] & 1) == 0)
      {
        long long v16 = (void *)[v4 mutableCopy];
        long long v17 = [v4 configuration];
        id v18 = (void *)[v17 mutableCopy];

        uint64_t v19 = [v4 isAutomaticallyGenerated];
        [v18 setPhoneCallBypassSettings:v15];
        [v16 setConfiguration:v18];
        [v16 setAutomaticallyGenerated:v19];
        uint64_t v10 = (void *)[v16 copy];
      }
    }
  }

  return v10;
}

- (id)_prepareModeConfigurationForStorage:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  BOOL v6 = [v4 configuration];
  uint64_t v7 = [v6 senderConfiguration];
  char v8 = [v7 sanitizedConfigurationWithContactStore:v5];

  if (v8)
  {
    char v9 = [v4 configuration];
    uint64_t v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [v4 isAutomaticallyGenerated];
    [v10 setSenderConfiguration:v8];
    uint64_t v12 = (void *)[v4 mutableCopy];
    [v12 setConfiguration:v10];
    [v12 setAutomaticallyGenerated:v11];
    unint64_t v13 = (void *)[v12 copy];
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (void)_notifyChangeOfModeConfigurationFrom:(id)a3 to:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 configuration];
  char v8 = [v7 senderConfiguration];
  char v9 = [v8 allowedContacts];

  uint64_t v10 = [v6 configuration];
  uint64_t v11 = [v10 senderConfiguration];
  uint64_t v12 = [v11 allowedContacts];

  unint64_t v13 = (void *)[v9 mutableCopy];
  [v13 intersectSet:v12];
  v62 = v12;
  int v14 = (void *)[v12 mutableCopy];
  [v14 minusSet:v13];
  BOOL v15 = (void *)[v9 mutableCopy];
  v60 = v13;
  [v15 minusSet:v13];
  v64 = v5;
  long long v16 = [v5 configuration];
  long long v17 = [v16 senderConfiguration];
  id v18 = [v17 deniedContacts];

  v63 = v6;
  uint64_t v19 = [v6 configuration];
  long long v20 = [v19 senderConfiguration];
  uint64_t v21 = [v20 deniedContacts];

  uint64_t v22 = (void *)[v18 mutableCopy];
  [v22 intersectSet:v21];
  v58 = v21;
  v55 = (void *)[v21 mutableCopy];
  [v55 minusSet:v22];
  v59 = v18;
  uint64_t v23 = (void *)[v18 mutableCopy];
  v57 = v22;
  [v23 minusSet:v22];
  uint64_t v24 = objc_opt_new();
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v25 = v15;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v78 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void *)(*((void *)&v77 + 1) + 8 * i);
        long long v31 = [NSNumber numberWithUnsignedInteger:2];
        [v24 setObject:v31 forKey:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v77 objects:v84 count:16];
    }
    while (v27);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v32 = v23;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v74 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v73 + 1) + 8 * j);
        long long v38 = [NSNumber numberWithUnsignedInteger:2];
        [v24 setObject:v38 forKey:v37];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v34);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v39 = v14;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v70 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void *)(*((void *)&v69 + 1) + 8 * k);
        v45 = [NSNumber numberWithUnsignedInteger:0];
        [v24 setObject:v45 forKey:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v41);
  }
  v56 = v25;

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v46 = v55;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v66;
    do
    {
      for (uint64_t m = 0; m != v48; ++m)
      {
        if (*(void *)v66 != v49) {
          objc_enumerationMutation(v46);
        }
        uint64_t v51 = *(void *)(*((void *)&v65 + 1) + 8 * m);
        v52 = [NSNumber numberWithUnsignedInteger:1];
        [v24 setObject:v52 forKey:v51];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v65 objects:v81 count:16];
    }
    while (v48);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained modeConfigurationManager:self didModifyExceptionsForContacts:v24 forModeConfiguration:v63];
  if (objc_opt_respondsToSelector())
  {
    v54 = [v63 mode];
    [WeakRetained modeConfigurationManager:self didModifyAvailableMode:v54];
  }
}

- (id)_removedModeConfigurationRecordForModeRecord:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5F6E8];
  id v5 = a3;
  id v6 = [v4 defaultConfiguration];
  uint64_t v7 = (void *)[v5 mutableCopy];

  [v7 setVisibility:1];
  id v8 = objc_alloc(MEMORY[0x1E4F5F658]);
  char v9 = [MEMORY[0x1E4F5F5F8] modeForRecord:v7];
  uint64_t v10 = (void *)[v8 initWithMode:v9 configuration:v6 triggers:MEMORY[0x1E4F1CBF0]];

  uint64_t v11 = [(DNDSModeConfigurationManager *)self _prepareModeConfigurationForStorage:v10 withError:0];

  return v11;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.ModeConfigurationsManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  return [(DNDSModeConfigurationManager *)self _sysdiagnoseDataShouldRedact:a4];
}

- (id)_sysdiagnoseDataShouldRedact:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DNDSModeConfigurationsStoring *)self->_backingStore readRecordWithError:0];
  id v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  id v6 = objc_alloc_init(DNDSContactProvider);
  uint64_t v7 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:3 redactSensitiveData:v3 contactProvider:v6 applicationIdentifierMapper:v5];
  id v8 = [v4 dictionaryRepresentationWithContext:v7];

  return v8;
}

- (void)_fixupConfigurationsIfNeeded
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to read record to fix up configurations; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v6 = a4;
  return v6;
}

- (void)modeConfigurationStore:(id)a3 didUpdateAvailableModes:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained modeConfigurationManager:self didUpdateAvailableModes:v6];
}

- (DNDSModeConfigurationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSModeConfigurationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setModeConfiguration:(os_log_t)log withError:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Cannot store mode configuration as new configuration contains secure data and store is not writeable", v1, 2u);
}

- (void)setModeConfiguration:(os_log_t)log withError:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Cannot replace mode configuration as existing configuration has secure data and store is not writeable", v1, 2u);
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1D3052000, v0, OS_LOG_TYPE_FAULT, "Removing mode configuration for default Focus is not supported; modeIdentifier=%{public}@",
    v1,
    0xCu);
}

- (void)_readModeConfigurationsReturningError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load configurations, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_readModeConfigurationsReturningError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to load configurations but device is under first lock; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_writeModeConfigurationsRecord:writeSecurePartition:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to save configurations, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_writeModeConfigurationsRecord:writeSecurePartition:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to save configurations but device is under first lock; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end