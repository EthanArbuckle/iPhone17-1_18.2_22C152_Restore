@interface DNDSAppSpecificSettingsManager
- (BOOL)removeAppSpecificSettingsForApplicationIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeModeSpecificSettingsForModeIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setAppSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 applicationIdentifier:(id)a6 modeIdentifier:(id)a7 error:(id *)a8;
- (BOOL)setModeSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 modeIdentifier:(id)a6 error:(id *)a7;
- (DNDSAppSpecificSettingsManager)init;
- (DNDSAppSpecificSettingsManager)initWithIDSSyncEngine:(id)a3 backingStoreURL:(id)a4;
- (DNDSCoreDataBackingStore)store;
- (id)_allAppSpecificSettingsOfType:(Class)a3;
- (id)_allModeSpecificSettingsOfType:(Class)a3;
- (id)_initWithBackingStoreURL:(id)a3;
- (id)_perModeSettingsMOsOfType:(Class)a3 modeIdentifier:(id)a4 processBlock:(id)a5;
- (id)appActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)appConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)appConfigurationPredicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)appConfigurationTargetContentIdentifierPrefixForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)appSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 applicationIdentifier:(id)a6 error:(id *)a7;
- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 applicationIdentifier:(id)a5 error:(id *)a6;
- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)modeSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6;
- (id)modeSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (id)recordIDsForIDSSyncEngine:(id)a3;
- (id)removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:(id)a3 error:(id *)a4;
- (id)systemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5;
- (void)_allPerModeSettingsMOsOfType:(Class)a3 processBlock:(id)a4;
- (void)_modesToSave:(id)a3 modesToDelete:(id)a4;
- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4;
- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4;
- (void)purgeRecordsForIDSSyncEngine:(id)a3;
@end

@implementation DNDSAppSpecificSettingsManager

- (id)appActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(DNDSAppSpecificSettingsManager *)self appSpecificSettingsOfType:objc_opt_class() identifier:v12 modeIdentifier:v10 applicationIdentifier:v11 error:a6];

  return v13;
}

- (id)appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(DNDSAppSpecificSettingsManager *)self appSpecificSettingsOfType:objc_opt_class() modeIdentifier:v8 applicationIdentifier:v9 error:a5];

  id v11 = [v10 anyObject];

  return v11;
}

- (id)appConfigurationTargetContentIdentifierPrefixForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(DNDSAppSpecificSettingsManager *)self appSpecificSettingsOfType:objc_opt_class() identifier:v12 modeIdentifier:v10 applicationIdentifier:v11 error:a6];

  return v13;
}

- (id)systemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(DNDSAppSpecificSettingsManager *)self modeSpecificSettingsOfType:objc_opt_class() identifier:v9 modeIdentifier:v8 error:a5];

  return v10;
}

- (id)appConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(DNDSAppSpecificSettingsManager *)self appSpecificSettingsOfType:objc_opt_class() identifier:v12 modeIdentifier:v10 applicationIdentifier:v11 error:a6];

  return v13;
}

- (id)appConfigurationPredicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(DNDSAppSpecificSettingsManager *)self appSpecificSettingsOfType:objc_opt_class() modeIdentifier:v8 applicationIdentifier:v9 error:a5];

  id v11 = [v10 anyObject];

  return v11;
}

- (DNDSAppSpecificSettingsManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)DNDSAppSpecificSettingsManager;
  v2 = [(DNDSAppSpecificSettingsManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(DNDSCoreDataBackingStore);
    store = v2->_store;
    v2->_store = v3;
  }
  return v2;
}

- (DNDSAppSpecificSettingsManager)initWithIDSSyncEngine:(id)a3 backingStoreURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSAppSpecificSettingsManager;
  id v9 = [(DNDSAppSpecificSettingsManager *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsSyncEngine, a3);
    [(DNDSIDSSyncEngine *)v10->_idsSyncEngine setDataSource:v10 forZone:@"DNDSAppSpecificSettings"];
    id v11 = [[DNDSCoreDataBackingStore alloc] _initWithURL:v8];
    store = v10->_store;
    v10->_store = v11;
  }
  return v10;
}

- (id)_initWithBackingStoreURL:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSAppSpecificSettingsManager *)self init];
  if (v5)
  {
    objc_super v6 = [[DNDSCoreDataBackingStore alloc] _initWithURL:v4];
    store = v5->_store;
    v5->_store = v6;
  }
  return v5;
}

- (id)modeSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  id v19 = [MEMORY[0x1E4F1CA80] set];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_modeIdentifier_error___block_invoke;
  v13[3] = &unk_1E6974E88;
  v13[4] = &v14;
  v13[5] = a3;
  id v9 = [(DNDSAppSpecificSettingsManager *)self _perModeSettingsMOsOfType:a3 modeIdentifier:v8 processBlock:v13];
  if (v9)
  {
    id v10 = (void *)v15[5];
    v15[5] = 0;

    if (a5) {
      *a5 = v9;
    }
  }
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __82__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_modeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(a1 + 40) appSpecificSettingsForManagedObject:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        if (v8) {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a4;
  long long v10 = [v8 dictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke;
  v15[3] = &unk_1E6974EB0;
  id v11 = v10;
  id v16 = v11;
  Class v17 = a3;
  long long v12 = [(DNDSAppSpecificSettingsManager *)self _perModeSettingsMOsOfType:a3 modeIdentifier:v9 processBlock:v15];

  if (v12)
  {

    id v11 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  id v13 = v11;

  return v13;
}

void __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = objc_alloc(MEMORY[0x1E4F5F598]);
          long long v10 = [v8 application];
          id v11 = [v10 bundleIdentifier];
          long long v12 = (void *)[v9 initWithBundleID:v11];

          id v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
            [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v12];
          }
          v15 = [*(id *)(a1 + 40) appSpecificSettingsForManagedObject:v8];
          if (v15)
          {
            id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v12];
            Class v17 = [v16 setByAddingObject:v15];
            [*(id *)(a1 + 32) setObject:v17 forKeyedSubscript:v12];
          }
        }
        else
        {
          v18 = (void *)DNDSLogAppSpecificSettingsManager;
          if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
            __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke_cold_1(v23, v18, (uint64_t)v8, &v24);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }
}

- (id)_perModeSettingsMOsOfType:(Class)a3 modeIdentifier:(id)a4 processBlock:(id)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__13;
  v44 = __Block_byref_object_dispose__13;
  id v45 = 0;
  long long v10 = +[DNDSKeybag sharedInstance];
  char v11 = [v10 hasUnlockedSinceBoot];

  if (v11)
  {
    long long v12 = [(DNDSAppSpecificSettingsManager *)self store];
    id v13 = (void *)[v12 newManagedObjectContext];

    id v14 = [(objc_class *)a3 appSpecificSettingsEntity];
    v15 = [v13 persistentStoreCoordinator];
    id v16 = [v15 managedObjectModel];
    Class v17 = [v16 entitiesByName];
    v18 = [v17 objectForKeyedSubscript:v14];

    if (v8)
    {
      if (v18)
      {
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke;
        v33[3] = &unk_1E6974ED8;
        id v34 = v13;
        id v35 = v8;
        id v36 = v18;
        v38 = &v40;
        id v37 = v9;
        [v34 performBlockAndWait:v33];

        id v19 = v34;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
          -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
        }
        v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        v47 = @"Model does not contain provided entity name.";
        id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        uint64_t v30 = [v29 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v19];
        v31 = (void *)v41[5];
        v41[5] = v30;
      }
    }
    else
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v48 = *MEMORY[0x1E4F28568];
      v49 = @"Mode identifier not valid.";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      uint64_t v27 = [v26 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v19];
      v28 = (void *)v41[5];
      v41[5] = v27;
    }
    id v25 = (id)v41[5];
  }
  else
  {
    long long v20 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Attempt to get mode specific settings before first unlock.", buf, 2u);
    }
    long long v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v51[0] = @"Attempt to get mode specific settings before first unlock.";
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v22];
    uint64_t v24 = (void *)v41[5];
    v41[5] = v23;

    id v25 = (id)v41[5];
  }
  _Block_object_dispose(&v40, 8);

  return v25;
}

void __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v4 = *(void *)(a1 + 40);
  id v19 = @"MODE_ID";
  v20[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  uint64_t v6 = [v3 fetchRequestFromTemplateWithName:@"PerModeSettingsForMode" substitutionVariables:v5];

  [v6 setEntity:*(void *)(a1 + 48)];
  uint64_t v7 = a1 + 64;
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = [v6 execute:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke_cold_1();
    }
    long long v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F5F528];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18 = @"Error querying settings.";
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:1008 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)v7 + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 applicationIdentifier:(id)a5 error:(id *)a6
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  long long v12 = +[DNDSKeybag sharedInstance];
  char v13 = [v12 hasUnlockedSinceBoot];

  if (v13)
  {
    *(void *)buf = 0;
    uint64_t v42 = buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__13;
    id v45 = __Block_byref_object_dispose__13;
    id v46 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__13;
    v39 = __Block_byref_object_dispose__13;
    id v40 = 0;
    uint64_t v14 = [v11 bundleID];
    BOOL v15 = v14 == 0;

    if (v15)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      uint64_t v50 = @"Application's bundle identifier not valid.";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      uint64_t v24 = [v23 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v18];
    }
    else
    {
      if (v10)
      {
        id v16 = [(DNDSAppSpecificSettingsManager *)self store];
        uint64_t v17 = (void *)[v16 newManagedObjectContext];

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke;
        v28[3] = &unk_1E6974F00;
        id v18 = v17;
        id v29 = v18;
        id v30 = v11;
        id v31 = v10;
        v32 = &v35;
        v33 = buf;
        Class v34 = a3;
        [v18 performBlockAndWait:v28];

        id v19 = v29;
        goto LABEL_12;
      }
      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      uint64_t v48 = @"Mode identifier not valid.";
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v24 = [v25 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v18];
    }
    id v19 = (void *)v36[5];
    v36[5] = v24;
LABEL_12:

    if (a6)
    {
      *a6 = (id) v36[5];
      if (v36[5])
      {
        uint64_t v26 = (void *)*((void *)v42 + 5);
        *((void *)v42 + 5) = 0;
      }
    }
    a6 = (id *)*((id *)v42 + 5);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  long long v20 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v20, OS_LOG_TYPE_DEFAULT, "Attempt to get app specific settings before first unlock.", buf, 2u);
  }
  if (a6)
  {
    long long v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"Attempt to get app specific settings before first unlock.";
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    *a6 = [v21 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v22];

    a6 = 0;
  }
LABEL_16:

  return a6;
}

void __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke(uint64_t a1)
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  v40[0] = @"BUNDLE_ID";
  uint64_t v4 = [*(id *)(a1 + 40) bundleID];
  v40[1] = @"MODE_ID";
  v41[0] = v4;
  v41[1] = *(void *)(a1 + 48);
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  uint64_t v6 = [v3 fetchRequestFromTemplateWithName:@"PerAppSettingsForAppMode" substitutionVariables:v5];

  uint64_t v7 = [*(id *)(a1 + 72) appSpecificSettingsEntity];
  uint64_t v8 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v9 = [v8 managedObjectModel];
  id v10 = [v9 entitiesByName];
  id v11 = [v10 objectForKeyedSubscript:v7];

  if (v11)
  {
    [v6 setEntity:v11];
    uint64_t v12 = a1 + 56;
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    uint64_t v14 = [v6 execute:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
      }
      BOOL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5F528];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      uint64_t v37 = @"Failed to fetch settings.";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v18 = [v15 errorWithDomain:v16 code:1008 userInfo:v17];
      uint64_t v19 = *(void *)(*(void *)v12 + 8);
      long long v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = v14;
      uint64_t v25 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v31;
        do
        {
          uint64_t v28 = 0;
          do
          {
            if (*(void *)v31 != v27) {
              objc_enumerationMutation(v17);
            }
            id v29 = objc_msgSend(*(id *)(a1 + 72), "appSpecificSettingsForManagedObject:", *(void *)(*((void *)&v30 + 1) + 8 * v28), (void)v30);
            if (v29) {
              [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v29];
            }

            ++v28;
          }
          while (v26 != v28);
          uint64_t v26 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v26);
      }
      uint64_t v14 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
    }
    long long v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F5F528];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39 = @"Model does not contain provided entity name.";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v23 = [v21 errorWithDomain:v22 code:1006 userInfo:v14];
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    id v17 = *(id *)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
}

- (id)modeSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[DNDSKeybag sharedInstance];
  char v13 = [v12 hasUnlockedSinceBoot];

  if (v13)
  {
    *(void *)buf = 0;
    uint64_t v38 = buf;
    uint64_t v39 = 0x3032000000;
    id v40 = __Block_byref_object_copy__13;
    v41 = __Block_byref_object_dispose__13;
    id v42 = 0;
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x3032000000;
    Class v34 = __Block_byref_object_copy__13;
    uint64_t v35 = __Block_byref_object_dispose__13;
    id v36 = 0;
    if (v11)
    {
      uint64_t v14 = [(DNDSAppSpecificSettingsManager *)self store];
      BOOL v15 = (void *)[v14 newManagedObjectContext];

      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __93__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_identifier_modeIdentifier_error___block_invoke;
      v24[3] = &unk_1E6974F00;
      id v16 = v15;
      id v25 = v16;
      id v26 = v11;
      id v27 = v10;
      uint64_t v28 = &v31;
      id v29 = buf;
      Class v30 = a3;
      [v16 performBlockAndWait:v24];

      id v17 = v25;
    }
    else
    {
      long long v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44 = @"Mode identifier not valid.";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      uint64_t v22 = [v21 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v16];
      id v17 = (void *)v32[5];
      v32[5] = v22;
    }

    if (a6) {
      *a6 = (id) v32[5];
    }
    a6 = (id *)*((id *)v38 + 5);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v18 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3052000, v18, OS_LOG_TYPE_DEFAULT, "Attempt to get mode specific settings before first unlock.", buf, 2u);
    }
    if (a6)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      v46[0] = @"Attempt to mode app specific settings before first unlock.";
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
      *a6 = [v19 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v20];

      a6 = 0;
    }
  }

  return a6;
}

void __93__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_identifier_modeIdentifier_error___block_invoke(uint64_t a1)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  v34[0] = @"MODE_ID";
  v34[1] = @"SETTINGS_ID";
  v35[0] = v4;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v35[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  uint64_t v8 = [v3 fetchRequestFromTemplateWithName:@"PerModeSettingsForModeID" substitutionVariables:v7];

  if (!v5) {
  id v9 = [*(id *)(a1 + 72) appSpecificSettingsEntity];
  }
  id v10 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v11 = [v10 managedObjectModel];
  uint64_t v12 = [v11 entitiesByName];
  char v13 = [v12 objectForKeyedSubscript:v9];

  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F5F528];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"Model does not contain provided entity name.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v24 = [v22 errorWithDomain:v23 code:1006 userInfo:v16];
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
    goto LABEL_16;
  }
  [v8 setEntity:v13];
  uint64_t v14 = (uint64_t *)(a1 + 56);
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v15 + 40);
  id v16 = [v8 execute:&obj];
  objc_storeStrong((id *)(v15 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
    }
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F5F528];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = @"Failed to fetch settings.";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v20 = [v17 errorWithDomain:v18 code:1008 userInfo:v19];
    uint64_t v21 = *v14;
    goto LABEL_15;
  }
  if ([v16 count])
  {
    id v26 = *(void **)(a1 + 72);
    uint64_t v19 = [v16 firstObject];
    uint64_t v20 = [v26 appSpecificSettingsForManagedObject:v19];
    uint64_t v21 = *(void *)(a1 + 64);
LABEL_15:
    uint64_t v27 = *(void *)(v21 + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v20;

LABEL_16:
  }
}

- (id)appSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 applicationIdentifier:(id)a6 error:(id *)a7
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[DNDSKeybag sharedInstance];
  char v16 = [v15 hasUnlockedSinceBoot];

  if (v16)
  {
    *(void *)buf = 0;
    uint64_t v45 = buf;
    uint64_t v46 = 0x3032000000;
    uint64_t v47 = __Block_byref_object_copy__13;
    uint64_t v48 = __Block_byref_object_dispose__13;
    id v49 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    id v42 = __Block_byref_object_dispose__13;
    id v43 = 0;
    id v17 = [v14 bundleID];
    BOOL v18 = v17 == 0;

    if (v18)
    {
      id v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v53 = @"Application's bundle identifier not valid.";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      uint64_t v27 = [v26 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v21];
    }
    else
    {
      if (v13)
      {
        uint64_t v19 = [(DNDSAppSpecificSettingsManager *)self store];
        uint64_t v20 = (void *)[v19 newManagedObjectContext];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __114__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_identifier_modeIdentifier_applicationIdentifier_error___block_invoke;
        v30[3] = &unk_1E6974F28;
        id v21 = v20;
        id v31 = v21;
        id v32 = v14;
        id v33 = v13;
        id v34 = v12;
        uint64_t v35 = &v38;
        id v36 = buf;
        Class v37 = a3;
        [v21 performBlockAndWait:v30];

        uint64_t v22 = v31;
LABEL_12:

        if (a7) {
          *a7 = (id) v39[5];
        }
        a7 = (id *)*((id *)v45 + 5);
        _Block_object_dispose(&v38, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      uint64_t v51 = @"Mode identifier not valid.";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      uint64_t v27 = [v28 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v21];
    }
    uint64_t v22 = (void *)v39[5];
    v39[5] = v27;
    goto LABEL_12;
  }
  uint64_t v23 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v23, OS_LOG_TYPE_DEFAULT, "Attempt to get app specific settings before first unlock.", buf, 2u);
  }
  if (a7)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    v55[0] = @"Attempt to get app specific settings before first unlock.";
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    *a7 = [v24 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v25];

    a7 = 0;
  }
LABEL_15:

  return a7;
}

void __114__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_identifier_modeIdentifier_applicationIdentifier_error___block_invoke(uint64_t a1)
{
  v36[3] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  v35[0] = @"BUNDLE_ID";
  uint64_t v4 = [*(id *)(a1 + 40) bundleID];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v36[0] = v4;
  v36[1] = v5;
  v35[1] = @"MODE_ID";
  v35[2] = @"SETTINGS_ID";
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v36[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
  id v9 = [v3 fetchRequestFromTemplateWithName:@"PerAppSettingsForAppModeID" substitutionVariables:v8];

  if (!v6) {
  id v10 = [*(id *)(a1 + 80) appSpecificSettingsEntity];
  }
  id v11 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v12 = [v11 managedObjectModel];
  id v13 = [v12 entitiesByName];
  id v14 = [v13 objectForKeyedSubscript:v10];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F5F528];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    id v34 = @"Model does not contain provided entity name.";
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v25 = [v23 errorWithDomain:v24 code:1006 userInfo:v17];
    uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v20 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
    goto LABEL_16;
  }
  [v9 setEntity:v14];
  uint64_t v15 = (uint64_t *)(a1 + 64);
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v16 + 40);
  id v17 = [v9 execute:&obj];
  objc_storeStrong((id *)(v16 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
    }
    BOOL v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5F528];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    id v32 = @"Failed to fetch settings.";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v21 = [v18 errorWithDomain:v19 code:1008 userInfo:v20];
    uint64_t v22 = *v15;
    goto LABEL_15;
  }
  if ([v17 count])
  {
    uint64_t v27 = *(void **)(a1 + 80);
    uint64_t v20 = [v17 firstObject];
    uint64_t v21 = [v27 appSpecificSettingsForManagedObject:v20];
    uint64_t v22 = *(void *)(a1 + 72);
LABEL_15:
    uint64_t v28 = *(void *)(v22 + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v21;

LABEL_16:
  }
}

- (BOOL)setModeSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = +[DNDSKeybag sharedInstance];
  char v16 = [v15 hasUnlockedSinceBoot];

  if (v16)
  {
    uint64_t v39 = 0;
    uint64_t v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__13;
    id v43 = __Block_byref_object_dispose__13;
    id v44 = 0;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 1;
    if (v14)
    {
      id v17 = [(DNDSAppSpecificSettingsManager *)self store];
      BOOL v18 = (void *)[v17 newManagedObjectContext];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke;
      v26[3] = &unk_1E6974F50;
      id v19 = v18;
      id v27 = v19;
      id v28 = v14;
      Class v34 = a5;
      id v29 = v13;
      id v32 = &v39;
      uint64_t v33 = &v35;
      id v30 = v12;
      uint64_t v31 = self;
      [v19 performBlockAndWait:v26];

      uint64_t v20 = v27;
    }
    else
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28568];
      uint64_t v46 = @"Mode identifier not valid.";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v24 = [v23 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v19];
      uint64_t v20 = (void *)v40[5];
      v40[5] = v24;
    }

    if (a7) {
      *a7 = (id) v40[5];
    }
    LOBYTE(a7) = *((unsigned char *)v36 + 24) != 0;
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager setModeSpecificSettings:identifier:type:modeIdentifier:error:]();
    }
    if (a7)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v48[0] = @"Attempt to set mode specific settings before first unlock.";
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      *a7 = [v21 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v22];

      LOBYTE(a7) = 0;
    }
  }

  return (char)a7;
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke(uint64_t a1)
{
  v80[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v4 = *(void **)(a1 + 48);
  v80[0] = *(void *)(a1 + 40);
  v79[0] = @"MODE_ID";
  v79[1] = @"SETTINGS_ID";
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v80[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
  uint64_t v7 = [v3 fetchRequestFromTemplateWithName:@"PerModeSettingsForModeID" substitutionVariables:v6];

  if (!v4) {
  [v7 setFetchLimit:1];
  }
  uint64_t v8 = [*(id *)(a1 + 88) appSpecificSettingsEntity];
  id v9 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v10 = [v9 managedObjectModel];
  id v11 = [v10 entitiesByName];
  id v12 = [v11 objectForKeyedSubscript:v8];

  if (v12)
  {
    [v7 setEntity:v12];
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    id obj = *(id *)(v14 + 40);
    uint64_t v15 = [v13 executeFetchRequest:v7 error:&obj];
    objc_storeStrong((id *)(v14 + 40), obj);
    char v16 = (void *)DNDSLogAppSpecificSettingsManager;
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4();
      }
      if (!*(void *)(a1 + 56))
      {
        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F5F528];
        uint64_t v75 = *MEMORY[0x1E4F28568];
        v76 = @"Failed to fetch settings to delete.";
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        uint64_t v36 = [v33 errorWithDomain:v34 code:1008 userInfo:v35];
        uint64_t v37 = *(void *)(*(void *)(a1 + 72) + 8);
        char v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;

        id v19 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        uint64_t v22 = v12;
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
      BOOL v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;

      if (!*(void *)(a1 + 56))
      {
        id v19 = 0;
LABEL_29:
        uint64_t v22 = v12;
LABEL_30:
        if ([*(id *)(a1 + 32) hasChanges])
        {
          uint64_t v46 = *(void **)(a1 + 32);
          uint64_t v47 = *(void *)(*(void *)(a1 + 72) + 8);
          id v63 = *(id *)(v47 + 40);
          char v48 = [v46 save:&v63];
          objc_storeStrong((id *)(v47 + 40), v63);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v48;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
            && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
          {
            v55 = DNDSLogAppSpecificSettingsManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v57 = *(void *)(a1 + 40);
              v56 = *(void **)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v68 = v56;
              __int16 v69 = 2114;
              uint64_t v70 = v57;
              _os_log_impl(&dword_1D3052000, v55, OS_LOG_TYPE_DEFAULT, "Committed mode settings for %{public}@ in %{public}@", buf, 0x16u);
            }
            v58 = *(void **)(a1 + 64);
            if (*(void *)(a1 + 56))
            {
              uint64_t v66 = *(void *)(a1 + 40);
              v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
              v60 = v58;
              v61 = v59;
              v62 = 0;
            }
            else
            {
              uint64_t v65 = *(void *)(a1 + 40);
              v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
              v60 = v58;
              v61 = 0;
              v62 = v59;
            }
            [v60 _modesToSave:v61 modesToDelete:v62];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
              __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2();
            }
            id v49 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v50 = *MEMORY[0x1E4F5F528];
            uint64_t v71 = *MEMORY[0x1E4F28568];
            v72 = @"Failed to commit settings.";
            uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
            uint64_t v52 = [v49 errorWithDomain:v50 code:1008 userInfo:v51];
            uint64_t v53 = *(void *)(*(void *)(a1 + 72) + 8);
            uint64_t v54 = *(void **)(v53 + 40);
            *(void *)(v53 + 40) = v52;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
          }
        }
        goto LABEL_42;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = NSNumber;
        uint64_t v26 = v16;
        id v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        *(_DWORD *)buf = 138543362;
        v68 = v27;
        _os_log_impl(&dword_1D3052000, v26, OS_LOG_TYPE_DEFAULT, "Fetched %{public}@ settings for set/clear.", buf, 0xCu);
      }
      uint64_t v28 = [v15 firstObject];
      id v19 = (void *)v28;
      uint64_t v29 = *(void *)(a1 + 56);
      if (!v29)
      {
        if (v28) {
          [*(id *)(a1 + 32) deleteObject:v28];
        }
        goto LABEL_29;
      }
      if (v28)
      {
        uint64_t v22 = v12;
LABEL_22:
        [*(id *)(a1 + 88) completeManagedObject:v19 forAppSpecificSettings:v29];
        goto LABEL_30;
      }
    }
    id v30 = (void *)MEMORY[0x1E4F1C0A8];
    uint64_t v31 = [*(id *)(a1 + 88) appSpecificSettingsEntity];
    uint64_t v22 = [v30 entityForName:v31 inManagedObjectContext:*(void *)(a1 + 32)];

    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C108]) initWithEntity:v22 insertIntoManagedObjectContext:*(void *)(a1 + 32)];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v39 = (void *)DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(v39);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F5F528];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v74 = @"Unexpected managed object class for entity.";
      id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      uint64_t v43 = [v40 errorWithDomain:v41 code:1006 userInfo:v42];
      uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v45 = *(void **)(v44 + 40);
      *(void *)(v44 + 40) = v43;

      goto LABEL_42;
    }
    [v19 setIdentifier:*(void *)(a1 + 48)];
    id v32 = [[DNDFocusModeMO alloc] initWithContext:*(void *)(a1 + 32)];
    [(DNDFocusModeMO *)v32 setIdentifier:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) refreshObject:v32 mergeChanges:1];
    [v19 setMode:v32];

    uint64_t v29 = *(void *)(a1 + 56);
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
  }
  uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F5F528];
  uint64_t v77 = *MEMORY[0x1E4F28568];
  v78 = @"Model does not contain provided entity name.";
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  uint64_t v23 = [v20 errorWithDomain:v21 code:1006 userInfo:v22];
  uint64_t v24 = *(void *)(*(void *)(a1 + 72) + 8);
  id v19 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
LABEL_43:
}

- (BOOL)setAppSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 applicationIdentifier:(id)a6 modeIdentifier:(id)a7 error:(id *)a8
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  BOOL v18 = +[DNDSKeybag sharedInstance];
  char v19 = [v18 hasUnlockedSinceBoot];

  if (v19)
  {
    uint64_t v46 = 0;
    uint64_t v47 = &v46;
    uint64_t v48 = 0x3032000000;
    id v49 = __Block_byref_object_copy__13;
    uint64_t v50 = __Block_byref_object_dispose__13;
    id v51 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 1;
    uint64_t v20 = [v16 bundleID];
    BOOL v21 = v20 == 0;

    if (v21)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v55 = @"Application's bundle identifier not valid.";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      uint64_t v29 = [v28 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v24];
    }
    else
    {
      if (v17)
      {
        uint64_t v22 = [(DNDSAppSpecificSettingsManager *)self store];
        uint64_t v23 = (void *)[v22 newManagedObjectContext];

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __116__DNDSAppSpecificSettingsManager_setAppSpecificSettings_identifier_type_applicationIdentifier_modeIdentifier_error___block_invoke;
        v32[3] = &unk_1E6974F78;
        id v24 = v23;
        id v33 = v24;
        id v34 = v16;
        id v35 = v17;
        Class v41 = a5;
        id v36 = v15;
        uint64_t v39 = &v46;
        uint64_t v40 = &v42;
        id v37 = v14;
        char v38 = self;
        [v24 performBlockAndWait:v32];

        uint64_t v25 = v33;
LABEL_12:

        if (a8) {
          *a8 = (id) v47[5];
        }
        LOBYTE(a8) = *((unsigned char *)v43 + 24) != 0;
        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);

        goto LABEL_15;
      }
      id v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      uint64_t v53 = @"Mode identifier not valid.";
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      uint64_t v29 = [v30 errorWithDomain:*MEMORY[0x1E4F5F528] code:1006 userInfo:v24];
    }
    uint64_t v25 = (void *)v47[5];
    v47[5] = v29;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:]();
  }
  if (a8)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28568];
    v57[0] = @"Attempt to set app specific settings before first unlock.";
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
    *a8 = [v26 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v27];

    LOBYTE(a8) = 0;
  }
LABEL_15:

  return (char)a8;
}

void __116__DNDSAppSpecificSettingsManager_setAppSpecificSettings_identifier_type_applicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1)
{
  v84[3] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  v83[0] = @"BUNDLE_ID";
  uint64_t v4 = [*(id *)(a1 + 40) bundleID];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 56);
  v84[0] = v4;
  v84[1] = v5;
  v83[1] = @"MODE_ID";
  v83[2] = @"SETTINGS_ID";
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v84[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:3];
  id v9 = [v3 fetchRequestFromTemplateWithName:@"PerAppSettingsForAppModeID" substitutionVariables:v8];

  if (!v6) {
  [v9 setFetchLimit:1];
  }
  id v10 = [*(id *)(a1 + 96) appSpecificSettingsEntity];
  id v11 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v12 = [v11 managedObjectModel];
  id v13 = [v12 entitiesByName];
  id v14 = [v13 objectForKeyedSubscript:v10];

  if (v14)
  {
    [v9 setEntity:v14];
    id v15 = *(void **)(a1 + 32);
    uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v16 + 40);
    id v17 = [v15 executeFetchRequest:v9 error:&obj];
    objc_storeStrong((id *)(v16 + 40), obj);
    BOOL v18 = (void *)DNDSLogAppSpecificSettingsManager;
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4();
      }
      if (!*(void *)(a1 + 64))
      {
        id v37 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v38 = *MEMORY[0x1E4F5F528];
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v80 = @"Failed to fetch settings to delete.";
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        uint64_t v40 = [v37 errorWithDomain:v38 code:1008 userInfo:v39];
        uint64_t v41 = *(void *)(*(void *)(a1 + 80) + 8);
        uint64_t v42 = *(void **)(v41 + 40);
        *(void *)(v41 + 40) = v40;

        BOOL v21 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
        id v24 = v14;
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      uint64_t v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = 0;

      if (!*(void *)(a1 + 64))
      {
        BOOL v21 = 0;
LABEL_29:
        id v24 = v14;
LABEL_30:
        if ([*(id *)(a1 + 32) hasChanges])
        {
          uint64_t v50 = *(void **)(a1 + 32);
          uint64_t v51 = *(void *)(*(void *)(a1 + 80) + 8);
          id v67 = *(id *)(v51 + 40);
          char v52 = [v50 save:&v67];
          objc_storeStrong((id *)(v51 + 40), v67);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v52;
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
            && !*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
          {
            v59 = DNDSLogAppSpecificSettingsManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
            {
              v60 = *(void **)(a1 + 40);
              uint64_t v61 = *(void *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v72 = v60;
              __int16 v73 = 2114;
              uint64_t v74 = v61;
              _os_log_impl(&dword_1D3052000, v59, OS_LOG_TYPE_DEFAULT, "Committed settings for %{public}@ in %{public}@", buf, 0x16u);
            }
            v62 = *(void **)(a1 + 72);
            if (*(void *)(a1 + 64))
            {
              uint64_t v70 = *(void *)(a1 + 48);
              id v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
              v64 = v62;
              uint64_t v65 = v63;
              uint64_t v66 = 0;
            }
            else
            {
              uint64_t v69 = *(void *)(a1 + 48);
              id v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
              v64 = v62;
              uint64_t v65 = 0;
              uint64_t v66 = v63;
            }
            [v64 _modesToSave:v65 modesToDelete:v66];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
              __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2();
            }
            uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v54 = *MEMORY[0x1E4F5F528];
            uint64_t v75 = *MEMORY[0x1E4F28568];
            v76 = @"Failed to commit settings.";
            v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
            uint64_t v56 = [v53 errorWithDomain:v54 code:1008 userInfo:v55];
            uint64_t v57 = *(void *)(*(void *)(a1 + 80) + 8);
            v58 = *(void **)(v57 + 40);
            *(void *)(v57 + 40) = v56;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
          }
        }
        goto LABEL_42;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = NSNumber;
        uint64_t v28 = v18;
        uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        *(_DWORD *)buf = 138412290;
        v72 = v29;
        _os_log_impl(&dword_1D3052000, v28, OS_LOG_TYPE_DEFAULT, "Fetched %@ settings for set/clear.", buf, 0xCu);
      }
      uint64_t v30 = [v17 firstObject];
      BOOL v21 = (void *)v30;
      uint64_t v31 = *(void *)(a1 + 64);
      if (!v31)
      {
        if (v30) {
          [*(id *)(a1 + 32) deleteObject:v30];
        }
        goto LABEL_29;
      }
      if (v30)
      {
        id v24 = v14;
LABEL_22:
        [*(id *)(a1 + 96) completeManagedObject:v21 forAppSpecificSettings:v31];
        goto LABEL_30;
      }
    }
    id v32 = (void *)MEMORY[0x1E4F1C0A8];
    id v33 = [*(id *)(a1 + 96) appSpecificSettingsEntity];
    id v24 = [v32 entityForName:v33 inManagedObjectContext:*(void *)(a1 + 32)];

    BOOL v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C108]) initWithEntity:v24 insertIntoManagedObjectContext:*(void *)(a1 + 32)];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v43 = (void *)DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(v43);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F5F528];
      uint64_t v77 = *MEMORY[0x1E4F28568];
      v78 = @"Unexpected managed object class for entity.";
      uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      uint64_t v47 = [v44 errorWithDomain:v45 code:1006 userInfo:v46];
      uint64_t v48 = *(void *)(*(void *)(a1 + 80) + 8);
      id v49 = *(void **)(v48 + 40);
      *(void *)(v48 + 40) = v47;

      goto LABEL_42;
    }
    [v21 setIdentifier:*(void *)(a1 + 56)];
    id v34 = [[DNDApplicationMO alloc] initWithContext:*(void *)(a1 + 32)];
    id v35 = [*(id *)(a1 + 40) bundleID];
    [(DNDApplicationMO *)v34 setBundleIdentifier:v35];

    [*(id *)(a1 + 32) refreshObject:v34 mergeChanges:1];
    [v21 setApplication:v34];
    id v36 = [[DNDFocusModeMO alloc] initWithContext:*(void *)(a1 + 32)];
    [(DNDFocusModeMO *)v36 setIdentifier:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) refreshObject:v36 mergeChanges:1];
    [v21 setMode:v36];

    uint64_t v31 = *(void *)(a1 + 64);
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v23 = *MEMORY[0x1E4F5F528];
  uint64_t v81 = *MEMORY[0x1E4F28568];
  v82 = @"Model does not contain provided entity name.";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  uint64_t v25 = [v22 errorWithDomain:v23 code:1006 userInfo:v24];
  uint64_t v26 = *(void *)(*(void *)(a1 + 80) + 8);
  BOOL v21 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;
LABEL_43:
}

- (BOOL)removeModeSpecificSettingsForModeIdentifier:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[DNDSKeybag sharedInstance];
  char v8 = [v7 hasUnlockedSinceBoot];

  if (v8)
  {
    uint64_t v25 = 0;
    uint64_t v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = __Block_byref_object_copy__13;
    uint64_t v29 = __Block_byref_object_dispose__13;
    id v30 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    id v9 = [(DNDSAppSpecificSettingsManager *)self store];
    id v10 = (void *)[v9 newManagedObjectContext];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke;
    v15[3] = &unk_1E6974FA0;
    id v11 = v10;
    id v16 = v11;
    uint64_t v19 = &v25;
    uint64_t v20 = &v21;
    id v17 = v6;
    BOOL v18 = self;
    [v11 performBlockAndWait:v15];
    if (a4) {
      *a4 = (id) v26[5];
    }
    LOBYTE(a4) = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifier:error:]();
    }
    if (a4)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v32[0] = @"Attempt to remove mode specific settings before first unlock.";
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a4 = [v12 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v13];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

void __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke(uint64_t a1)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v4 = *(void *)(a1 + 40);
  id v49 = @"MODE_ID";
  v50[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
  id v6 = [v3 fetchRequestFromTemplateWithName:@"ModeForModeIdentifier" substitutionVariables:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v6];
  [v7 setResultType:2];
  char v8 = *(void **)(a1 + 32);
  uint64_t v9 = a1 + 56;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [v8 executeRequest:v7 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  id v12 = (void *)DNDSLogAppSpecificSettingsManager;
  id v13 = (uint64_t *)MEMORY[0x1E4F5F528];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
    }
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *v13;
    uint64_t v47 = *MEMORY[0x1E4F28568];
    uint64_t v48 = @"Failed to remote settings.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v17 = [v14 errorWithDomain:v15 code:1008 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)v9 + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    uint64_t v20 = *(void *)(*(void *)v9 + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = 0;
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v12;
    uint64_t v23 = [v11 result];
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v44 = v23;
    __int16 v45 = 2114;
    uint64_t v46 = v24;
    _os_log_impl(&dword_1D3052000, v22, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ settings for mode %{public}@.", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    id v38 = *(id *)(v26 + 40);
    char v27 = [v25 save:&v38];
    objc_storeStrong((id *)(v26 + 40), v38);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v27;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
      && !*(void *)(*(void *)(*(void *)v9 + 8) + 40))
    {
      id v34 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v44 = v35;
        _os_log_impl(&dword_1D3052000, v34, OS_LOG_TYPE_DEFAULT, "Committed settings removal for mode %{public}@", buf, 0xCu);
      }
      id v36 = *(void **)(a1 + 48);
      uint64_t v40 = *(void *)(a1 + 40);
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      [v36 _modesToSave:0 modesToDelete:v37];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
      }
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F5F528];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v42 = @"Failed to remove settings.";
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v31 = [v28 errorWithDomain:v29 code:1008 userInfo:v30];
      uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
}

- (id)removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[DNDSKeybag sharedInstance];
  char v8 = [v7 hasUnlockedSinceBoot];

  if (v8)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__13;
    uint64_t v32 = __Block_byref_object_dispose__13;
    id v33 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__13;
    uint64_t v26 = __Block_byref_object_dispose__13;
    id v27 = 0;
    uint64_t v9 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v6;
      _os_log_impl(&dword_1D3052000, v9, OS_LOG_TYPE_DEFAULT, "Removing settings for modes not in %{public}@.", buf, 0xCu);
    }
    uint64_t v10 = [(DNDSAppSpecificSettingsManager *)self store];
    id v11 = (void *)[v10 newManagedObjectContext];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke;
    v16[3] = &unk_1E6974FA0;
    id v17 = v6;
    id v12 = v11;
    uint64_t v20 = &v28;
    uint64_t v21 = &v22;
    id v18 = v12;
    uint64_t v19 = self;
    [v12 performBlockAndWait:v16];
    if (a4) {
      *a4 = (id) v29[5];
    }
    a4 = (id *)(id)v23[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifier:error:]();
    }
    if (a4)
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v37[0] = @"Attempt to remove mode specific settings before first unlock.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a4 = [v13 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v14];

      a4 = 0;
    }
  }

  return a4;
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v78[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN (%@)", *(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v2];

  uint64_t v4 = +[DNDFocusModeMO fetchRequest];
  [v4 setPredicate:v3];
  [v4 setIncludesPendingChanges:1];
  uint64_t v5 = *(void **)(v1 + 40);
  uint64_t v6 = *(void *)(*(void *)(v1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v5 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(v1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_2();
    }
    char v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F5F528];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78[0] = @"Failed to fetch settings to delete.";
    uint64_t v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
    uint64_t v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1008);
    uint64_t v11 = *(void *)(*(void *)(v1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v46 = v1 + 56;
    uint64_t v48 = v4;
    id v49 = v3;
    uint64_t v53 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    uint64_t v47 = v7;
    id v50 = v7;
    uint64_t v54 = [v50 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v54)
    {
      uint64_t v51 = *(void *)v65;
      uint64_t v52 = v1;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v65 != v51) {
            objc_enumerationMutation(v50);
          }
          uint64_t v57 = v13;
          id v14 = *(void **)(*((void *)&v64 + 1) + 8 * v13);
          uint64_t v56 = [v14 identifier];
          uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
          v58 = [MEMORY[0x1E4F1CA80] set];
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          v55 = v14;
          id v16 = [v14 settings];
          uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v75 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v61;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v61 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v22 = (objc_class *)MEMORY[0x1E4F5F598];
                  id v23 = v21;
                  id v24 = [v22 alloc];
                  uint64_t v25 = [v23 application];
                  uint64_t v26 = [v25 bundleIdentifier];
                  id v27 = (void *)[v24 initWithBundleID:v26];
                  [v15 addObject:v27];
                }
                else
                {
                  uint64_t v28 = (objc_class *)objc_msgSend(v21, "dnd_settingsType");
                  uint64_t v25 = NSStringFromClass(v28);
                  if ([&unk_1F2A5E050 containsObject:v25])
                  {
                    uint64_t v29 = [(objc_class *)v28 appSpecificSettingsForManagedObject:v21];
                    if (v29) {
                      [v58 addObject:v29];
                    }
                  }
                  else
                  {
                    uint64_t v30 = DNDSLogAppSpecificSettingsManager;
                    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v72 = v25;
                    }
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v60 objects:v75 count:16];
            }
            while (v18);
          }

          uint64_t v31 = objc_opt_new();
          [v31 setApplicationIdentifiers:v15];
          [v31 setModeSpecificSettings:v58];
          [v53 setObject:v31 forKeyedSubscript:v56];
          uint64_t v32 = DNDSLogAppSpecificSettingsManager;
          if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v72 = v56;
            __int16 v73 = 2114;
            uint64_t v74 = v15;
            _os_log_impl(&dword_1D3052000, v32, OS_LOG_TYPE_DEFAULT, "Removing settings for %{public}@; apps=%{public}@",
              buf,
              0x16u);
          }
          uint64_t v1 = v52;
          [*(id *)(v52 + 40) deleteObject:v55];

          uint64_t v13 = v57 + 1;
        }
        while (v57 + 1 != v54);
        uint64_t v54 = [v50 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v54);
    }

    if (![*(id *)(v1 + 40) hasChanges])
    {
      uint64_t v4 = v48;
      id v3 = v49;
      uint64_t v7 = v47;
      goto LABEL_37;
    }
    id v33 = *(void **)(v1 + 40);
    uint64_t v34 = *(void *)(*(void *)(v1 + 56) + 8);
    id v59 = *(id *)(v34 + 40);
    int v35 = [v33 save:&v59];
    objc_storeStrong((id *)(v34 + 40), v59);
    uint64_t v4 = v48;
    id v3 = v49;
    if (v35 && !*(void *)(*(void *)(*(void *)v46 + 8) + 40))
    {
      uint64_t v41 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3052000, v41, OS_LOG_TYPE_DEFAULT, "Changes did commit.", buf, 2u);
      }
      uint64_t v42 = [v53 copy];
      uint64_t v43 = *(void *)(*(void *)(v1 + 64) + 8);
      uint64_t v44 = *(void **)(v43 + 40);
      *(void *)(v43 + 40) = v42;

      __int16 v45 = *(void **)(v1 + 48);
      id v12 = [v53 allKeys];
      [v45 _modesToSave:0 modesToDelete:v12];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_1();
      }
      uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F5F528];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      uint64_t v70 = @"Failed to commit changes.";
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      uint64_t v38 = [v36 errorWithDomain:v37 code:1008 userInfo:v12];
      uint64_t v39 = *(void *)(*(void *)v46 + 8);
      uint64_t v40 = *(void **)(v39 + 40);
      *(void *)(v39 + 40) = v38;
    }
    uint64_t v7 = v47;
  }

LABEL_37:
}

- (BOOL)removeAppSpecificSettingsForApplicationIdentifier:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = +[DNDSKeybag sharedInstance];
  char v8 = [v7 hasUnlockedSinceBoot];

  if (v8)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy__13;
    uint64_t v28 = __Block_byref_object_dispose__13;
    id v29 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    uint64_t v9 = [(DNDSAppSpecificSettingsManager *)self store];
    uint64_t v10 = (void *)[v9 newManagedObjectContext];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke;
    v15[3] = &unk_1E6974FC8;
    id v11 = v10;
    id v16 = v11;
    id v17 = v6;
    uint64_t v18 = &v24;
    uint64_t v19 = &v20;
    [v11 performBlockAndWait:v15];
    if (a4) {
      *a4 = (id) v25[5];
    }
    LOBYTE(a4) = *((unsigned char *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
      -[DNDSAppSpecificSettingsManager removeAppSpecificSettingsForApplicationIdentifier:error:]();
    }
    if (a4)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      v31[0] = @"Attempt to remove app specific settings before first unlock.";
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      *a4 = [v12 errorWithDomain:*MEMORY[0x1E4F5F528] code:1004 userInfo:v13];

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

void __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke(uint64_t a1)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v37 = @"BUNDLE_ID";
  uint64_t v4 = [*(id *)(a1 + 40) bundleID];
  v38[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  id v6 = [v3 fetchRequestFromTemplateWithName:@"ApplicationForBundleIdentifier" substitutionVariables:v5];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v6];
  [v7 setResultType:2];
  char v8 = *(void **)(a1 + 32);
  uint64_t v9 = a1 + 48;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  id v11 = [v8 executeRequest:v7 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  id v12 = (void *)DNDSLogAppSpecificSettingsManager;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
    }
    uint64_t v13 = *(void *)(*(void *)v9 + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v12;
    id v16 = [v11 result];
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v16;
    __int16 v35 = 2114;
    uint64_t v36 = v17;
    _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ settings for app %{public}@.", buf, 0x16u);
  }
  if ([*(id *)(a1 + 32) hasChanges])
  {
    uint64_t v18 = *(void **)(a1 + 32);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    id v29 = *(id *)(v19 + 40);
    char v20 = [v18 save:&v29];
    objc_storeStrong((id *)(v19 + 40), v29);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v20;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      && !*(void *)(*(void *)(*(void *)v9 + 8) + 40))
    {
      id v27 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = v28;
        _os_log_impl(&dword_1D3052000, v27, OS_LOG_TYPE_DEFAULT, "Removed settings for app %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
        __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke_cold_1();
      }
      uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F5F528];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      uint64_t v32 = @"Failed to remove app settings.";
      char v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      uint64_t v24 = [v21 errorWithDomain:v22 code:1008 userInfo:v23];
      uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
}

- (id)_allModeSpecificSettingsOfType:(Class)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__DNDSAppSpecificSettingsManager__allModeSpecificSettingsOfType___block_invoke;
  v8[3] = &unk_1E6974FF0;
  id v6 = v5;
  id v9 = v6;
  Class v10 = a3;
  [(DNDSAppSpecificSettingsManager *)self _allPerModeSettingsMOsOfType:a3 processBlock:v8];

  return v6;
}

void __65__DNDSAppSpecificSettingsManager__allModeSpecificSettingsOfType___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 mode];
  uint64_t v4 = [v3 identifier];

  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v4];
  }
  uint64_t v7 = [*(id *)(a1 + 40) appSpecificSettingsForManagedObject:v9];
  if (v7)
  {
    char v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    [v8 addObject:v7];
  }
}

- (id)_allAppSpecificSettingsOfType:(Class)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke;
  v8[3] = &unk_1E6974FF0;
  id v6 = v5;
  id v9 = v6;
  Class v10 = a3;
  [(DNDSAppSpecificSettingsManager *)self _allPerModeSettingsMOsOfType:a3 processBlock:v8];

  return v6;
}

void __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 mode];
    id v5 = [v4 identifier];

    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
    }
    char v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    id v9 = objc_alloc(MEMORY[0x1E4F5F598]);
    Class v10 = [v3 application];
    id v11 = [v10 bundleIdentifier];
    id v12 = (void *)[v9 initWithBundleID:v11];

    uint64_t v13 = [v8 objectForKeyedSubscript:v12];

    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
      [v8 setObject:v14 forKeyedSubscript:v12];
    }
    uint64_t v15 = [*(id *)(a1 + 40) appSpecificSettingsForManagedObject:v3];
    if (v15)
    {
      id v16 = [v8 objectForKeyedSubscript:v12];
      uint64_t v17 = [v16 setByAddingObject:v15];
      [v8 setObject:v17 forKeyedSubscript:v12];
    }
  }
  else
  {
    uint64_t v18 = (void *)DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke_cold_1(v18);
    }
  }
}

- (void)_allPerModeSettingsMOsOfType:(Class)a3 processBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DNDSAppSpecificSettingsManager *)self store];
  char v8 = (void *)[v7 newManagedObjectContext];

  id v9 = [(objc_class *)a3 appSpecificSettingsEntity];
  Class v10 = [v8 persistentStoreCoordinator];
  id v11 = [v10 managedObjectModel];
  id v12 = [v11 entitiesByName];
  uint64_t v13 = [v12 objectForKeyedSubscript:v9];

  if (v13)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke;
    v14[3] = &unk_1E69734F0;
    id v15 = v9;
    id v16 = v6;
    [v8 performBlockAndWait:v14];
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
  {
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:]();
  }
}

void __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  id v15 = 0;
  id v3 = [v2 execute:&v15];
  id v4 = v15;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1();
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          Class v10 = (void *)MEMORY[0x1D9430630](v6);
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
        uint64_t v7 = v6;
      }
      while (v6);
    }
  }
}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v4 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager idsSyncEngine:didFetchRecord:]();
  }
}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1D3052000, v6, OS_LOG_TYPE_DEFAULT, "prepareRecordToSave: %@", buf, 0xCu);
  }
  uint64_t v7 = [v5 recordID];
  uint64_t v8 = [v7 identifier];

  uint64_t v9 = [(DNDSAppSpecificSettingsManager *)self store];
  Class v10 = (void *)[v9 newManagedObjectContext];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__DNDSAppSpecificSettingsManager_idsSyncEngine_prepareRecordToSave___block_invoke;
  v14[3] = &unk_1E69734A0;
  id v15 = v10;
  id v16 = v8;
  id v17 = v5;
  id v11 = v5;
  id v12 = v8;
  id v13 = v10;
  [v13 performBlockAndWait:v14];
}

void __68__DNDSAppSpecificSettingsManager_idsSyncEngine_prepareRecordToSave___block_invoke(uint64_t a1)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v37 = @"MODE_ID";
  v38[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  uint64_t v6 = [v3 fetchRequestFromTemplateWithName:@"PerModeSettingsForMode" substitutionVariables:v5];

  uint64_t v7 = +[DNDPerAppSettingsMO entity];
  [v6 setEntity:v7];

  id v35 = 0;
  uint64_t v8 = [v6 execute:&v35];
  id v9 = v35;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR)) {
      __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v27 = a1;
    uint64_t v28 = v6;
    id v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v26 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0x1E4F1C000uLL;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v16 = [*(id *)(v12 + 2656) dictionaryWithCapacity:4];
          id v17 = (objc_class *)objc_msgSend(v15, "dnd_settingsType");
          if (objc_opt_respondsToSelector())
          {
            uint64_t v18 = NSStringFromClass(v17);
            id v19 = [v15 identifier];
            [v15 application];
            uint64_t v20 = v13;
            v22 = uint64_t v21 = v11;
            char v23 = [v22 bundleIdentifier];

            uint64_t v24 = [(objc_class *)v17 appSpecificSettingsForManagedObject:v15];
            uint64_t v25 = [(objc_class *)v17 dictionaryRepresentationForAppSpecificSettings:v24];
            [v16 setObject:v23 forKeyedSubscript:@"DNDSAppSpecificSettingsApp"];
            [v16 setObject:v19 forKeyedSubscript:@"DNDSAppSpecificSettingsIdentifier"];
            [v16 setObject:v18 forKeyedSubscript:@"DNDSAppSpecificSettingsType"];
            [v16 setObject:v25 forKeyedSubscript:@"DNDSAppSpecificSettingsPayload"];
            [v29 addObject:v16];

            uint64_t v11 = v21;
            uint64_t v13 = v20;

            unint64_t v12 = 0x1E4F1C000;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    [*(id *)(v27 + 48) setObject:v29 forKey:@"DNDSAppSpecificSettingsRecord"];
    uint64_t v6 = v28;
    id v9 = 0;
    uint64_t v8 = v26;
  }
}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  id v4 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager idsSyncEngine:recordWithIDWasDeleted:]();
  }
}

- (void)purgeRecordsForIDSSyncEngine:(id)a3
{
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT)) {
    -[DNDSAppSpecificSettingsManager purgeRecordsForIDSSyncEngine:]();
  }
}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  id v4 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D3052000, v4, OS_LOG_TYPE_DEFAULT, "recordIDsForIDSSyncEngine", buf, 2u);
  }
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [(DNDSAppSpecificSettingsManager *)self store];
  uint64_t v7 = (void *)[v6 newManagedObjectContext];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__DNDSAppSpecificSettingsManager_recordIDsForIDSSyncEngine___block_invoke;
  v13[3] = &unk_1E69735B8;
  id v14 = v7;
  id v8 = v5;
  id v15 = v8;
  id v9 = v7;
  [v9 performBlockAndWait:v13];
  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

void __60__DNDSAppSpecificSettingsManager_recordIDsForIDSSyncEngine___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[DNDFocusModeMO fetchRequest];
  id v3 = *(void **)(a1 + 32);
  id v21 = 0;
  id v16 = (void *)v2;
  id v4 = objc_msgSend(v3, "executeFetchRequest:error:");
  id v15 = v21;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        id v11 = *(void **)(a1 + 40);
        unint64_t v12 = [DNDSIDSRecordID alloc];
        uint64_t v13 = objc_msgSend(v10, "identifier", v15);
        id v14 = [(DNDSIDSRecordID *)v12 initWithIdentifier:v13 zone:@"DNDSAppSpecificSettings"];
        [v11 addObject:v14];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)_modesToSave:(id)a3 modesToDelete:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [[DNDSIDSRecordID alloc] initWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * v12) zone:@"DNDSAppSpecificSettings"];
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [[DNDSIDSRecordID alloc] initWithIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * v19) zone:@"DNDSAppSpecificSettings"];
        [v14 addObject:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [(DNDSIDSSyncEngine *)self->_idsSyncEngine addRecordIDsToSave:v7 recordIDsToDelete:v14];
}

- (DNDSCoreDataBackingStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
}

void __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke_cold_1(uint8_t *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1D3052000, v6, OS_LOG_TYPE_ERROR, "Unexpected result type for appSpecificSettings: %{public}@", a1, 0xCu);
}

- (void)_perModeSettingsMOsOfType:modeIdentifier:processBlock:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_1D3052000, v0, v1, "Model does not contain entity with name %{public}@", v2, v3, v4, v5, v6);
}

void __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error querying settings: %{public}@", v2, v3, v4, v5, v6);
}

void __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to fetch settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setModeSpecificSettings:identifier:type:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3052000, v0, v1, "Attempt to set mode specific settings before first unlock.", v2, v3, v4, v5, v6);
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to commit settings: %{public}@", v2, v3, v4, v5, v6);
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(void *a1)
{
  id v1 = a1;
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_7(&dword_1D3052000, v3, v4, "Unexpected class for managed object: %{public}@", v5, v6, v7, v8, 2u);
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to fetch existing settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3052000, v0, v1, "Attempt to set app specific settings before first unlock.", v2, v3, v4, v5, v6);
}

- (void)removeModeSpecificSettingsForModeIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3052000, v0, v1, "Attempt to remove mode specific settings before first unlock.", v2, v3, v4, v5, v6);
}

void __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to remove settings for mode: %{public}@", v2, v3, v4, v5, v6);
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to commit changes for modes not in: %{public}@", v2, v3, v4, v5, v6);
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to fetch modes to delete: %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeAppSpecificSettingsForApplicationIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3052000, v0, v1, "Attempt to remove app specific settings before first unlock.", v2, v3, v4, v5, v6);
}

void __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_3(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Failed to remove settings for app: %{public}@", v2, v3, v4, v5, v6);
}

void __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D3052000, v1, OS_LOG_TYPE_ERROR, "Unexpected result type for appSpecificSettings: %{public}@", v4, 0xCu);
}

void __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1D3052000, v0, v1, "Error querying settings: %{public}@", v2, v3, v4, v5, v6);
}

- (void)idsSyncEngine:didFetchRecord:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_1D3052000, v0, v1, "Unexpected call to -idsSyncEngine:didFetchRecord:. Record: %@", v2, v3, v4, v5, v6);
}

- (void)idsSyncEngine:recordWithIDWasDeleted:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_3(&dword_1D3052000, v0, v1, "Unexpected call to -idsSyncEngine:recordWithIDWasDeleted:. Record: %@", v2, v3, v4, v5, v6);
}

- (void)purgeRecordsForIDSSyncEngine:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1D3052000, v0, v1, "Unexpected call to -purgeRecordsForIDSSyncEngine:", v2, v3, v4, v5, v6);
}

@end