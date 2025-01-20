@interface ACHEarnedInstanceCleanupUtility
- (ACHAwardsKeyValueClient)keyValueClient;
- (ACHEarnedInstanceCleanupUtility)initWithEarnedInstanceStore:(id)a3 profile:(id)a4;
- (ACHEarnedInstanceCleanupUtility)initWithHealthStore:(id)a3 keyValueClient:(id)a4 earnedInstanceStore:(id)a5;
- (ACHEarnedInstanceStore)earnedInstanceStore;
- (HDProfile)profile;
- (HKHealthStore)healthStore;
- (id)_fastestRunAchievementsToRemoveFromEarnedInstances:(id)a3;
- (id)_firstWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3;
- (id)_largestValueActivityAndWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3;
- (id)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(id)a3;
- (int64_t)_client_historicalEvaluationAdjustment;
- (int64_t)_daemon_historicalEvaluationAdjustment;
- (int64_t)_historicalEvaluationAdjustment;
- (void)_client_historicalEvaluationAdjustment;
- (void)performCleanup;
- (void)setEarnedInstanceStore:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setKeyValueClient:(id)a3;
- (void)setProfile:(id)a3;
@end

@implementation ACHEarnedInstanceCleanupUtility

- (ACHEarnedInstanceCleanupUtility)initWithHealthStore:(id)a3 keyValueClient:(id)a4 earnedInstanceStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACHEarnedInstanceCleanupUtility;
  v12 = [(ACHEarnedInstanceCleanupUtility *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_keyValueClient, a4);
    objc_storeStrong((id *)&v13->_earnedInstanceStore, a5);
  }

  return v13;
}

- (ACHEarnedInstanceCleanupUtility)initWithEarnedInstanceStore:(id)a3 profile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHEarnedInstanceCleanupUtility;
  id v9 = [(ACHEarnedInstanceCleanupUtility *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_earnedInstanceStore, a3);
    objc_storeStrong((id *)&v10->_profile, a4);
  }

  return v10;
}

- (void)performCleanup
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "Performing earned instances cleanup phase.", v1, 2u);
}

- (id)_firstWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_7];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_288];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_super v15 = objc_msgSend(v14, "templateUniqueName", (void)v19);
        v16 = [v7 objectForKeyedSubscript:v15];

        if (v16)
        {
          [v8 addObject:v14];
        }
        else
        {
          v17 = [v14 templateUniqueName];
          [v7 setObject:v14 forKeyedSubscript:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

uint64_t __88__ACHEarnedInstanceCleanupUtility__firstWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 templateUniqueName];
  uint64_t v3 = [v2 containsString:@"FirstWorkout"];

  return v3;
}

uint64_t __88__ACHEarnedInstanceCleanupUtility__firstWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 earnedDateComponents];
  v6 = [v4 earnedDateComponents];

  uint64_t v7 = ACHCompareYearMonthDayDateComponents();
  return v7;
}

- (id)_largestValueActivityAndWorkoutAchievementsToRemoveFromEarnedInstances:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26D116418];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v11 = [v10 templateUniqueName];
        if (([v4 containsObject:v11] & 1) != 0
          || [v11 containsString:@"BestWorkout"])
        {
          id v12 = [v5 objectForKeyedSubscript:v11];
          if (!v12)
          {
            id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v5 setObject:v12 forKeyedSubscript:v11];
          }
          [v12 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v7);
  }
  v29 = v4;

  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v28 = v5;
  id v30 = [v5 allValues];
  uint64_t v33 = [v30 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v40;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = v14;
        objc_super v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
        [v15 sortUsingComparator:&__block_literal_global_313];
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          long long v19 = 0;
          uint64_t v20 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(v16);
              }
              long long v22 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              if (!v19
                || ([v19 value],
                    v23 = objc_claimAutoreleasedReturnValue(),
                    [v22 value],
                    uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v25 = [v23 compare:v24],
                    v24,
                    v23,
                    v25 == -1))
              {
                id v26 = v22;

                long long v19 = v26;
              }
              else
              {
                [v13 addObject:v22];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
          }
          while (v18);
        }
        else
        {
          long long v19 = 0;
        }

        uint64_t v14 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [v30 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v33);
  }

  return v13;
}

uint64_t __106__ACHEarnedInstanceCleanupUtility__largestValueActivityAndWorkoutAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 earnedDateComponents];
  uint64_t v7 = [v5 earnedDateComponents];
  uint64_t v8 = ACHCompareYearMonthDayDateComponents();

  if (!v8)
  {
    id v9 = [v4 value];
    uint64_t v10 = [v5 value];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (id)_fastestRunAchievementsToRemoveFromEarnedInstances:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26D116430];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v12 = [v11 templateUniqueName];
        if ([v4 containsObject:v12])
        {
          id v13 = [v5 objectForKeyedSubscript:v12];
          if (!v13)
          {
            id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v5 setObject:v13 forKeyedSubscript:v12];
          }
          [v13 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v8);
  }
  v31 = v4;
  v29 = v6;

  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v30 = v5;
  obuint64_t j = [v5 allValues];
  uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v41;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v15;
        id v16 = *(void **)(*((void *)&v40 + 1) + 8 * v15);
        [v16 sortUsingComparator:&__block_literal_global_342];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = 0;
          uint64_t v21 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v17);
              }
              v23 = *(void **)(*((void *)&v36 + 1) + 8 * j);
              if (v20
                && ([v20 value],
                    uint64_t v24 = objc_claimAutoreleasedReturnValue(),
                    [v23 value],
                    uint64_t v25 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v26 = [v24 compare:v25],
                    v25,
                    v24,
                    v26 != 1))
              {
                [v14 addObject:v23];
              }
              else
              {
                id v27 = v23;

                uint64_t v20 = v27;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v19);
        }
        else
        {
          uint64_t v20 = 0;
        }

        uint64_t v15 = v35 + 1;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v34);
  }

  return v14;
}

uint64_t __86__ACHEarnedInstanceCleanupUtility__fastestRunAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 earnedDateComponents];
  uint64_t v7 = [v5 earnedDateComponents];
  uint64_t v8 = ACHCompareYearMonthDayDateComponents();

  if (!v8)
  {
    uint64_t v9 = [v5 value];
    uint64_t v10 = [v4 value];
    uint64_t v8 = [v9 compare:v10];
  }
  return v8;
}

- (id)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_344];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  if (![v6 count])
  {
    id v12 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_38;
  }
  uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_349];
  uint64_t v8 = [(ACHEarnedInstanceCleanupUtility *)self profile];

  if (v8)
  {
    uint64_t v9 = [(ACHEarnedInstanceCleanupUtility *)self profile];
    uint64_t v52 = 0;
    uint64_t v10 = (id *)&v52;
    uint64_t v11 = +[ACHDataStoreSyncEntity dataStoreValueForKey:@"totalMoveGoalsMade" domain:@"ActivityAwardingSource" profile:v9 error:&v52];
  }
  else
  {
    uint64_t v9 = [(ACHEarnedInstanceCleanupUtility *)self keyValueClient];
    uint64_t v51 = 0;
    uint64_t v10 = (id *)&v51;
    uint64_t v11 = [v9 valueForKey:@"totalMoveGoalsMade" domain:@"ActivityAwardingSource" error:&v51];
  }
  id v13 = (void *)v11;
  id v14 = *v10;

  if (v13)
  {
    if (!v14)
    {
      uint64_t v15 = [v13 unsignedIntegerValue];
      int64_t v16 = [(ACHEarnedInstanceCleanupUtility *)self _historicalEvaluationAdjustment];
      uint64_t v46 = v16 + v15;
      id v17 = ACHLogCleanup();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v57 = v15;
        __int16 v58 = 2048;
        int64_t v59 = v16;
        __int16 v60 = 2048;
        int64_t v61 = v16 + v15;
        _os_log_debug_impl(&dword_21F5DA000, v17, OS_LOG_TYPE_DEBUG, "Total move goals completed so far: %ld, adjustment: %ld, adjustedTotal, %ld", buf, 0x20u);
      }

      os_log_t log = (os_log_t)objc_alloc_init(MEMORY[0x263EFF9C0]);
      uint64_t v18 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      obuint64_t j = v7;
      uint64_t v19 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        long long v39 = 0;
        long long v40 = v13;
        long long v41 = v7;
        long long v42 = v6;
        uint64_t v21 = 0;
        uint64_t v22 = *(void *)v48;
        id v43 = v4;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            uint64_t v24 = v21;
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v26 = objc_msgSend(v25, "templateUniqueName", v39, v40, v41, v42, v43);
            id v27 = [v26 stringByReplacingOccurrencesOfString:@"MoveGoals" withString:&stru_26D0FD8F8];
            uint64_t v28 = [v27 integerValue];

            v29 = ACHLogCleanup();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v33 = [v25 templateUniqueName];
              uint64_t v34 = [NSNumber numberWithInteger:v28];
              *(_DWORD *)buf = 138412546;
              uint64_t v57 = (uint64_t)v33;
              __int16 v58 = 2112;
              int64_t v59 = (int64_t)v34;
              _os_log_debug_impl(&dword_21F5DA000, v29, OS_LOG_TYPE_DEBUG, "%@ count: %@", buf, 0x16u);
            }
            if (v28 > v46)
            {
              id v30 = ACHLogCleanup();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v35 = [v25 templateUniqueName];
                long long v36 = [NSNumber numberWithInteger:v28];
                *(_DWORD *)buf = 138412546;
                uint64_t v57 = (uint64_t)v35;
                __int16 v58 = 2112;
                int64_t v59 = (int64_t)v36;
                _os_log_debug_impl(&dword_21F5DA000, v30, OS_LOG_TYPE_DEBUG, "Found a candidate! %@ count: %@", buf, 0x16u);
              }
              [log addObject:v25];
            }
            v31 = [v25 earnedDateComponents];
            uint64_t v21 = [v18 dateFromComponents:v31];

            if (v24 && [v21 compare:v24] == -1)
            {
              uint64_t v32 = ACHLogCleanup();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:](v53, v25, &v54, v32);
              }

              [log addObject:v25];
            }
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v20);

        id v6 = v42;
        id v4 = v43;
        id v13 = v40;
        uint64_t v7 = v41;
        id v14 = v39;
      }

      long long v37 = ACHLogCleanup();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
        -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:](log, v37);
      }

      id v12 = [log allObjects];

      goto LABEL_37;
    }
    ACHLogCleanup();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:].cold.4((uint64_t)v14, log);
    }
  }
  else
  {
    ACHLogCleanup();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[ACHEarnedInstanceCleanupUtility _lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:](log);
    }
  }
  id v12 = (void *)MEMORY[0x263EFFA68];
LABEL_37:

LABEL_38:
  return v12;
}

uint64_t __92__ACHEarnedInstanceCleanupUtility__lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 templateUniqueName];
  uint64_t v3 = [v2 hasSuffix:@"MoveGoals"];

  return v3;
}

uint64_t __92__ACHEarnedInstanceCleanupUtility__lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 templateUniqueName];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"MoveGoals" withString:&stru_26D0FD8F8];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [v4 templateUniqueName];

  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"MoveGoals" withString:&stru_26D0FD8F8];
  uint64_t v10 = [v9 integerValue];

  if (v7 >= v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v7 > v10) {
    return 1;
  }
  else {
    return v11;
  }
}

- (int64_t)_historicalEvaluationAdjustment
{
  uint64_t v3 = [(ACHEarnedInstanceCleanupUtility *)self healthStore];

  if (v3)
  {
    return [(ACHEarnedInstanceCleanupUtility *)self _client_historicalEvaluationAdjustment];
  }
  else
  {
    return [(ACHEarnedInstanceCleanupUtility *)self _daemon_historicalEvaluationAdjustment];
  }
}

- (int64_t)_client_historicalEvaluationAdjustment
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__5;
  uint64_t v34 = __Block_byref_object_dispose__5;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__5;
  uint64_t v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  uint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  dispatch_group_enter(v3);
  id v4 = objc_alloc(MEMORY[0x263F236A8]);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke;
  v20[3] = &unk_2645169E8;
  uint64_t v22 = &v30;
  id v5 = v3;
  uint64_t v21 = v5;
  v23 = &v24;
  id v6 = (void *)[v4 initWithUpdateHandler:v20];
  uint64_t v7 = [(ACHEarnedInstanceCleanupUtility *)self healthStore];
  [v7 executeQuery:v6];

  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  intptr_t v9 = dispatch_group_wait(v5, v8);
  uint64_t v10 = [(ACHEarnedInstanceCleanupUtility *)self healthStore];
  [v10 stopQuery:v6];

  if (v9)
  {
    uint64_t v11 = ACHLogCleanup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ACHEarnedInstanceCleanupUtility _client_historicalEvaluationAdjustment](v11);
    }

    int64_t v12 = 2;
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke_364;
    v15[3] = &unk_264516A10;
    v15[4] = &v16;
    id v13 = (void (**)(void, void))MEMORY[0x223C507A0](v15);
    v13[2](v13, v31[5]);
    v13[2](v13, v25[5]);
    int64_t v12 = v17[3];

    _Block_object_dispose(&v16, 8);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v12;
}

void __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  if (v12 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v15 = ACHLogAwardEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F5DA000, v15, OS_LOG_TYPE_DEFAULT, "Received today summary in cleanup utility", buf, 2u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  if (v13 && !*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v16 = ACHLogAwardEngine();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_21F5DA000, v16, OS_LOG_TYPE_DEFAULT, "Received yesterday summary in cleanup utility", v17, 2u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __73__ACHEarnedInstanceCleanupUtility__client_historicalEvaluationAdjustment__block_invoke_364(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v12 = v3;
    uint64_t v4 = [v3 activityMoveMode];
    if (v4 == 2)
    {
      intptr_t v9 = [v12 appleMoveTime];
      uint64_t v10 = [v12 appleMoveTimeGoal];
      uint64_t v11 = [v9 compare:v10];

      id v3 = v12;
      if (v11 == -1) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v5 = v4 == 1;
      id v3 = v12;
      if (!v5) {
        goto LABEL_9;
      }
      id v6 = [v12 activeEnergyBurned];
      uint64_t v7 = [v12 activeEnergyBurnedGoal];
      uint64_t v8 = [v6 compare:v7];

      id v3 = v12;
      if (v8 == -1) {
        goto LABEL_9;
      }
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
LABEL_9:
}

- (int64_t)_daemon_historicalEvaluationAdjustment
{
  id v3 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
  int v4 = [v3 hasLoadedActivitySummaries];

  if (!v4) {
    return 2;
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__ACHEarnedInstanceCleanupUtility__daemon_historicalEvaluationAdjustment__block_invoke;
  v12[3] = &unk_264516A10;
  v12[4] = &v13;
  BOOL v5 = (void (**)(void, void))MEMORY[0x223C507A0](v12);
  id v6 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
  uint64_t v7 = [v6 yesterdayActivitySummary];

  ((void (**)(void, void *))v5)[2](v5, v7);
  uint64_t v8 = [(HDProfile *)self->_profile currentActivitySummaryHelper];
  intptr_t v9 = [v8 todayActivitySummary];

  ((void (**)(void, void *))v5)[2](v5, v9);
  int64_t v10 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v10;
}

void __73__ACHEarnedInstanceCleanupUtility__daemon_historicalEvaluationAdjustment__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v12 = v3;
    uint64_t v4 = [v3 activityMoveMode];
    if (v4 == 2)
    {
      intptr_t v9 = [v12 appleMoveTime];
      int64_t v10 = [v12 appleMoveTimeGoal];
      uint64_t v11 = [v9 compare:v10];

      id v3 = v12;
      if (v11 == -1) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v5 = v4 == 1;
      id v3 = v12;
      if (!v5) {
        goto LABEL_9;
      }
      id v6 = [v12 activeEnergyBurned];
      uint64_t v7 = [v12 activeEnergyBurnedGoal];
      uint64_t v8 = [v6 compare:v7];

      id v3 = v12;
      if (v8 == -1) {
        goto LABEL_9;
      }
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
LABEL_9:
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (ACHAwardsKeyValueClient)keyValueClient
{
  return self->_keyValueClient;
}

- (void)setKeyValueClient:(id)a3
{
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
}

- (HDProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_keyValueClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F5DA000, log, OS_LOG_TYPE_DEBUG, "Unable to obtain the total move goals completed so far. Reason: the value retrieved is nil.", v1, 2u);
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Move goals earned instances to be removed: %@", (uint8_t *)&v4, 0xCu);
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(void *)a3 .cold.3(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 templateUniqueName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_21F5DA000, a4, OS_LOG_TYPE_DEBUG, "Found a candidate out of date!: %@", a1, 0xCu);
}

- (void)_lifetimeMoveGoalAchievementsToRemoveFromEarnedInstances:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain the total move goals completed so far. Reason: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_client_historicalEvaluationAdjustment
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F5DA000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for group to complete fetching activity summaries", v1, 2u);
}

@end