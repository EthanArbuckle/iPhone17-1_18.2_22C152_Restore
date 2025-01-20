@interface DNDSScheduleManager
- (DNDSScheduleManager)initWithModeAssertionManager:(id)a3;
- (DNDSScheduleManagerDataSource)dataSource;
- (id)_scheduleManagerClientIdentifierForModeIdentifier:(id)a3;
- (void)_refreshWithScheduleSettings:(id)a3 modeIdentifier:(id)a4 currentScheduleAssertion:(id)a5 context:(id)a6;
- (void)_refreshWithScheduleSettingsByModeIdentifier:(id)a3 context:(id)a4;
- (void)refresh;
- (void)setDataSource:(id)a3;
@end

@implementation DNDSScheduleManager

- (DNDSScheduleManager)initWithModeAssertionManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSScheduleManager;
  v6 = [(DNDSScheduleManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modeAssertionManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    currentScheduleSettingsByModeIdentifier = v7->_currentScheduleSettingsByModeIdentifier;
    v7->_currentScheduleSettingsByModeIdentifier = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (void)refresh
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D3052000, log, OS_LOG_TYPE_ERROR, "Unable to update assertions for schedule: error=%{public}@, settings=%{public}@", (uint8_t *)&v4, 0x16u);
}

uint64_t __30__DNDSScheduleManager_refresh__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 dataSource];
  uint64_t v6 = [v5 scheduleSettingsByModeIdentifierForScheduleManager:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [*(id *)(a1 + 32) _refreshWithScheduleSettingsByModeIdentifier:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) context:v4];
  return 1;
}

- (void)_refreshWithScheduleSettingsByModeIdentifier:(id)a3 context:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 allKeys];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke;
  v36[3] = &unk_1E6974B58;
  v9 = self;
  v36[4] = self;
  uint64_t v10 = objc_msgSend(v8, "bs_map:", v36);

  v26 = (void *)v10;
  [MEMORY[0x1E4F5F600] predicateForModeAssertionsWithClientIdentifiers:v10];
  v25 = objc_super v11 = v7;
  v12 = objc_msgSend(v7, "modeAssertionsMatchingPredicate:");
  v29 = v6;
  v13 = (void *)[v6 mutableCopy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    uint64_t v17 = *MEMORY[0x1E4F5F550];
    v27 = (void *)*MEMORY[0x1E4F5F518];
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v20 = [v19 details];
        v21 = [v20 modeIdentifier];

        if ([v21 isEqualToString:v17])
        {
          id v22 = v27;

          v21 = v22;
        }
        v23 = [v29 objectForKeyedSubscript:v21];
        [(DNDSScheduleManager *)v9 _refreshWithScheduleSettings:v23 modeIdentifier:v21 currentScheduleAssertion:v19 context:v11];
        [v13 setObject:0 forKeyedSubscript:v21];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke_2;
  v30[3] = &unk_1E6974B80;
  v30[4] = v9;
  id v31 = v11;
  id v24 = v11;
  [v13 enumerateKeysAndObjectsUsingBlock:v30];
}

uint64_t __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _scheduleManagerClientIdentifierForModeIdentifier:a2];
}

uint64_t __76__DNDSScheduleManager__refreshWithScheduleSettingsByModeIdentifier_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _refreshWithScheduleSettings:a3 modeIdentifier:a2 currentScheduleAssertion:0 context:*(void *)(a1 + 40)];
}

- (void)_refreshWithScheduleSettings:(id)a3 modeIdentifier:(id)a4 currentScheduleAssertion:(id)a5 context:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v61 = a4;
  id v62 = a5;
  id v11 = a6;
  v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v65;
    uint64_t v17 = 1;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v65 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        [v19 scheduleEnabledSetting];
        if (DNDResolvedScheduleEnabledSetting() == 2) {
          uint64_t v17 = 2;
        }
        v20 = [v19 creationDate];
        if ([v20 compare:v12] == -1)
        {
          id v21 = v20;

          v12 = v21;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v17 = 1;
  }

  id v22 = v61;
  v23 = [(NSMutableDictionary *)self->_currentScheduleSettingsByModeIdentifier objectForKeyedSubscript:v61];
  if (![v23 isEqual:v13] || !v62 && v17 == 2 || v62 && v17 == 1)
  {
    id v24 = (void *)[v13 copy];
    [(NSMutableDictionary *)self->_currentScheduleSettingsByModeIdentifier setObject:v24 forKeyedSubscript:v61];

    v25 = [(DNDSScheduleManager *)self _scheduleManagerClientIdentifierForModeIdentifier:v61];
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F5F650]) initWithClientIdentifier:v25 deviceIdentifier:0];
    v27 = (void *)v26;
    if (v17 == 2)
    {
      uint64_t v56 = v26;
      id v28 = objc_alloc_init(MEMORY[0x1E4F5F700]);
      [v28 setIdentifier:@"schedule"];
      v29 = [MEMORY[0x1E4F5F638] lifetimeMatchingScheduleWithIdentifier:*MEMORY[0x1E4F5F520]];
      [v28 setLifetime:v29];

      v30 = (void *)*MEMORY[0x1E4F5F518];
      v60 = v25;
      if ((id)*MEMORY[0x1E4F5F518] == v61 || v61 && v30 && [v61 isEqual:v30])
      {
        id v31 = objc_msgSend(v13, "firstObject", v56);
        [v31 bedtimeBehaviorEnabledSetting];
        uint64_t v32 = DNDResolvedBedtimeBehaviorEnabledSetting();

        long long v33 = (void *)*MEMORY[0x1E4F5F550];
        if (v32 != 2) {
          long long v33 = v30;
        }
        id v22 = v33;
      }
      id v61 = v22;
      objc_msgSend(v28, "setModeIdentifier:", v22, v56);
      [v28 setReason:2];
      id v34 = v12;
      long long v35 = [v62 details];
      if ([v35 isEqual:v28])
      {
        v36 = [v62 startDate];
        char v37 = [v36 isEqual:v34];

        if (v37)
        {
          uint64_t v38 = v62;
          v27 = v57;
LABEL_37:

          v25 = v60;
          id v22 = v61;
          goto LABEL_38;
        }
      }
      else
      {
      }
      v59 = v23;
      v46 = (void *)MEMORY[0x1E4F5F630];
      v71 = v60;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      [v46 predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:v47];
      v48 = id v63 = v28;

      v44 = 0;
      v27 = v57;
      do
      {
        v49 = v34;
        v50 = v44;
        v44 = [v11 takeAssertionWithDetails:v63 source:v57 startDate:v34];

        v51 = [v11 modeAssertionInvalidationsMatchingPredicate:v48];
        v52 = [v51 firstObject];
        id v34 = [v52 invalidationDate];

        v53 = [v44 assertions];
        uint64_t v54 = [v53 count];
      }
      while (!v54);

      uint64_t v38 = v62;
      id v28 = v63;
      v23 = v59;
    }
    else
    {
      uint64_t v38 = v62;
      if (!v62)
      {
LABEL_38:

        goto LABEL_39;
      }
      v60 = v25;
      v58 = v23;
      id v39 = v12;
      [v62 UUID];
      id v40 = v11;
      v42 = v41 = v27;
      v70 = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      id v34 = +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:v43];

      v27 = v41;
      id v11 = v40;
      id v28 = v39;
      v23 = v58;
      v44 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:v34 requestDate:v28 source:v27 reason:3];
      id v45 = (id)[v11 invalidateAssertionsForRequest:v44];
    }

    goto LABEL_37;
  }
  v55 = DNDSLogSchedule;
  if (os_log_type_enabled((os_log_t)DNDSLogSchedule, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v69 = v13;
    _os_log_impl(&dword_1D3052000, v55, OS_LOG_TYPE_DEFAULT, "Existing schedule assertion does not need to change: settings=%{public}@", buf, 0xCu);
  }
  uint64_t v38 = v62;
LABEL_39:
}

- (id)_scheduleManagerClientIdentifierForModeIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (id)*MEMORY[0x1E4F5F518] == v3 || v3 && *MEMORY[0x1E4F5F518] && (objc_msgSend(v3, "isEqual:"))
  {
    uint64_t v5 = @"com.apple.donotdisturb.private.schedule";
  }
  else
  {
    uint64_t v5 = [v4 stringByAppendingString:@".private.schedule"];
  }

  return v5;
}

- (DNDSScheduleManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (DNDSScheduleManagerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentScheduleSettingsByModeIdentifier, 0);
  objc_storeStrong((id *)&self->_modeAssertionManager, 0);
}

@end