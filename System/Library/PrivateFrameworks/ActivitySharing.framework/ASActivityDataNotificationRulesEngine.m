@interface ASActivityDataNotificationRulesEngine
- (id)_filterNotificationGroup:(id)a3 ruleset:(id *)a4;
- (id)filterNotificationGroup:(id)a3;
@end

@implementation ASActivityDataNotificationRulesEngine

- (id)filterNotificationGroup:(id)a3
{
  id v4 = a3;
  long long v12 = ASStandardNotificationRuleset;
  long long v13 = unk_267EA3FD0;
  v5 = [(ASActivityDataNotificationRulesEngine *)self _filterNotificationGroup:v4 ruleset:&v12];
  v6 = [v5 allNotifications];
  unint64_t v7 = [v6 count];
  unint64_t v8 = ASStrictNotificationThreshold;

  if (v7 >= v8)
  {
    long long v12 = ASStrictNotificationRuleset;
    long long v13 = unk_267EA3FF0;
    id v9 = [(ASActivityDataNotificationRulesEngine *)self _filterNotificationGroup:v4 ruleset:&v12];
  }
  else
  {
    id v9 = v5;
  }
  v10 = v9;

  return v10;
}

- (id)_filterNotificationGroup:(id)a3 ruleset:(id *)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFFA08] set];
  v59 = [MEMORY[0x263EFFA08] set];
  v53 = [MEMORY[0x263EFFA08] set];
  v6 = [MEMORY[0x263EFFA08] set];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v56 = v4;
  unint64_t v7 = [v4 allNotifications];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v72 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        long long v13 = [v12 friend];

        if (v13)
        {
          v14 = [v12 friend];
          uint64_t v15 = [v6 setByAddingObject:v14];

          v6 = (void *)v15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v72 objects:v81 count:16];
    }
    while (v9);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v6;
  uint64_t v16 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v69;
    uint64_t v52 = *(void *)v69;
    do
    {
      uint64_t v19 = 0;
      uint64_t v54 = v17;
      do
      {
        if (*(void *)v69 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v68 + 1) + 8 * v19);
        ASLoggingInitialize();
        v21 = (void *)ASLogNotifications;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          v22 = v21;
          v23 = [v20 UUID];
          *(_DWORD *)buf = 138543618;
          v77 = v23;
          __int16 v78 = 2112;
          v79 = v20;
          _os_log_impl(&dword_21EC60000, v22, OS_LOG_TYPE_DEFAULT, "Collecting notifications for friend %{public}@ - %@", buf, 0x16u);
        }
        if ([v20 isMuted])
        {
          ASLoggingInitialize();
          v24 = ASLogNotifications;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21EC60000, v24, OS_LOG_TYPE_DEFAULT, "Contact is muted, not allowing any notifications", buf, 2u);
          }
        }
        else
        {
          v25 = [v56 workoutNotifications];
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke;
          v65[3] = &unk_2644E8A18;
          v65[4] = v20;
          long long v26 = *(_OWORD *)&a4->var2;
          long long v66 = *(_OWORD *)&a4->var0;
          long long v67 = v26;
          v27 = [MEMORY[0x263F08A98] predicateWithBlock:v65];
          v28 = [v25 filteredSetUsingPredicate:v27];

          uint64_t v57 = [v5 setByAddingObjectsFromSet:v28];

          v29 = [v56 achievementNotifications];
          v62[0] = MEMORY[0x263EF8330];
          v62[1] = 3221225472;
          v62[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_280;
          v62[3] = &unk_2644E8A18;
          v62[4] = v20;
          long long v30 = *(_OWORD *)&a4->var2;
          long long v63 = *(_OWORD *)&a4->var0;
          long long v64 = v30;
          v31 = [MEMORY[0x263F08A98] predicateWithBlock:v62];
          v32 = [v29 filteredSetUsingPredicate:v31];

          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_282;
          v61[3] = &unk_2644E8A40;
          v61[4] = v20;
          v33 = objc_msgSend(v32, "hk_filter:", v61);
          unint64_t var2 = a4->var2;
          unint64_t v35 = [v33 count];
          if (var2 >= v35) {
            unint64_t v36 = v35;
          }
          else {
            unint64_t v36 = var2;
          }
          v37 = (void *)MEMORY[0x263EFFA08];
          v38 = [v33 allObjects];
          v39 = objc_msgSend(v38, "subarrayWithRange:", 0, v36);
          v40 = [v37 setWithArray:v39];

          uint64_t v41 = [v59 setByAddingObjectsFromSet:v40];

          if ([v28 count]) {
            BOOL v42 = 1;
          }
          else {
            BOOL v42 = [v40 count] != 0;
          }
          BOOL var3 = a4->var3;
          ASLoggingInitialize();
          v44 = ASLogNotifications;
          BOOL v45 = os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT);
          if (var3 && v42)
          {
            if (v45)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21EC60000, v44, OS_LOG_TYPE_DEFAULT, "Goal completions not allowed, skipping", buf, 2u);
            }
          }
          else
          {
            if (v45)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21EC60000, v44, OS_LOG_TYPE_DEFAULT, "Goal completions allowed, collecting", buf, 2u);
            }
            v46 = [v56 goalCompletionNotifications];
            v60[0] = MEMORY[0x263EF8330];
            v60[1] = 3221225472;
            v60[2] = __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_284;
            v60[3] = &unk_2644E8A68;
            v60[4] = v20;
            v47 = [MEMORY[0x263F08A98] predicateWithBlock:v60];
            v48 = [v46 filteredSetUsingPredicate:v47];

            uint64_t v49 = [v53 setByAddingObjectsFromSet:v48];

            v53 = (void *)v49;
          }
          uint64_t v17 = v54;
          uint64_t v18 = v52;

          v59 = (void *)v41;
          v5 = (void *)v57;
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [obj countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v17);
  }

  v50 = objc_alloc_init(ASActivityDataNotificationGroup);
  [(ASActivityDataNotificationGroup *)v50 setGoalCompletionNotifications:v53];
  [(ASActivityDataNotificationGroup *)v50 setWorkoutNotifications:v5];
  [(ASActivityDataNotificationGroup *)v50 setAchievementNotifications:v59];

  return v50;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 friend];
  v5 = [v4 UUID];
  v6 = [*(id *)(a1 + 32) UUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v3 sample];
    ASLoggingInitialize();
    uint64_t v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138412290;
      v32 = v8;
      _os_log_impl(&dword_21EC60000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating workout: %@", (uint8_t *)&v31, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    v11 = [v8 endDate];
    [v10 timeIntervalSinceDate:v11];
    double v13 = v12;
    double v14 = *(double *)(a1 + 40);

    if (v13 <= v14)
    {
      uint64_t v18 = [v8 endDate];
      int IsNotificationEventDateBeforeRelationshipBeganWithFriend = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v18, *(void **)(a1 + 32));

      if (IsNotificationEventDateBeforeRelationshipBeganWithFriend)
      {
        ASLoggingInitialize();
        uint64_t v15 = ASLogNotifications;
        uint64_t v16 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          uint64_t v17 = "Workout completed prior to the relationship starting, skipping";
          goto LABEL_17;
        }
      }
      else
      {
        v20 = [v8 endDate];
        v21 = *(void **)(a1 + 32);
        v22 = (void *)MEMORY[0x263EFF8F0];
        id v23 = v21;
        v24 = objc_msgSend(v22, "hk_gregorianCalendar");
        v25 = [v23 timeZone];
        [v24 setTimeZone:v25];

        long long v26 = [v23 currentDateComponents];

        v27 = [v24 dateFromComponents:v26];
        ASLoggingInitialize();
        v28 = ASLogNotifications;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 138412290;
          v32 = v27;
          _os_log_impl(&dword_21EC60000, v28, OS_LOG_TYPE_DEFAULT, "Friend current date: %@", (uint8_t *)&v31, 0xCu);
        }
        char v29 = [v24 isDate:v20 inSameDayAsDate:v27];

        if (v29)
        {
          uint64_t v16 = 1;
        }
        else
        {
          ASLoggingInitialize();
          uint64_t v15 = ASLogNotifications;
          uint64_t v16 = 0;
          if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31) = 0;
            uint64_t v17 = "Workout is not in the current day for friend, skipping";
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      uint64_t v15 = ASLogNotifications;
      uint64_t v16 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        uint64_t v17 = "Workout is too old, skipping";
LABEL_17:
        _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v31, 2u);
        uint64_t v16 = 0;
      }
    }

    goto LABEL_19;
  }
  uint64_t v16 = 0;
LABEL_19:

  return v16;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_280(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 friend];
  v5 = [v4 UUID];
  v6 = [*(id *)(a1 + 32) UUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v3 sample];
    ASLoggingInitialize();
    uint64_t v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412290;
      v25 = v8;
      _os_log_impl(&dword_21EC60000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating achievement: %@", (uint8_t *)&v24, 0xCu);
    }
    if (!v8)
    {
      uint64_t v12 = 0;
LABEL_23:

      goto LABEL_24;
    }
    if (ACHShouldUseNewAwardsSystem())
    {
      uint64_t v10 = [v8 relevantEarnedInstance];
      v11 = [v10 earnedDateComponents];
    }
    else
    {
      uint64_t v10 = [v8 earnedInstances];
      double v13 = [v10 lastObject];
      v11 = [v13 earnedDateComponents];
    }
    if (!v11)
    {
      ASLoggingInitialize();
      v22 = ASLogNotifications;
      uint64_t v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_21EC60000, v22, OS_LOG_TYPE_DEFAULT, "Achievement is missing earned date, skipping", (uint8_t *)&v24, 2u);
        uint64_t v12 = 0;
      }
      goto LABEL_22;
    }
    double v14 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    uint64_t v15 = [v14 dateFromComponents:v11];

    uint64_t v16 = [MEMORY[0x263EFF910] date];
    [v16 timeIntervalSinceDate:v15];
    double v18 = v17;
    double v19 = *(double *)(a1 + 48);

    if (v18 <= v19)
    {
      if (!_IsNotificationEventDateBeforeRelationshipBeganWithFriend(v15, *(void **)(a1 + 32)))
      {
        uint64_t v12 = 1;
        goto LABEL_21;
      }
      ASLoggingInitialize();
      v20 = ASLogNotifications;
      uint64_t v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        v21 = "Achievement completed prior to the relationship starting, skipping";
        goto LABEL_19;
      }
    }
    else
    {
      ASLoggingInitialize();
      v20 = ASLogNotifications;
      uint64_t v12 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        v21 = "Achievement is too old, skipping";
LABEL_19:
        _os_log_impl(&dword_21EC60000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v24, 2u);
        uint64_t v12 = 0;
      }
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v12 = 0;
LABEL_24:

  return v12;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_282(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 sample];
  v5 = [v4 template];
  v6 = [v5 uniqueName];

  int v7 = [v3 sample];

  uint64_t v8 = [v7 template];
  uint64_t v9 = [v8 sourceName];

  id v10 = v6;
  v11 = MoveGoal200PercentTemplate();
  uint64_t v12 = [v11 uniqueName];
  if ([v10 isEqualToString:v12]) {
    goto LABEL_4;
  }
  double v13 = MoveGoal300PercentTemplate();
  double v14 = [v13 uniqueName];
  if ([v10 isEqualToString:v14])
  {

LABEL_4:
    goto LABEL_5;
  }
  double v19 = MoveGoal400PercentTemplate();
  v20 = [v19 uniqueName];
  char v21 = [v10 isEqualToString:v20];

  if (v21)
  {
LABEL_5:
    ASLoggingInitialize();
    uint64_t v15 = ASLogNotifications;
    uint64_t v16 = 0;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      id v31 = v10;
      double v17 = "Dropping achievement with template unique name %@, move percent";
LABEL_7:
      _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v30, 0xCu);
      uint64_t v16 = 0;
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v10 containsString:@"CompetitionParticipation"])
  {
    ASLoggingInitialize();
    uint64_t v15 = ASLogNotifications;
    uint64_t v16 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v30 = 138412290;
    id v31 = v10;
    double v17 = "Dropping achievement with template unique name %@, competition participation";
    goto LABEL_7;
  }
  v22 = LongestMoveStreakTemplate();
  id v23 = [v22 uniqueName];
  int v24 = [v10 isEqualToString:v23];

  if (v24)
  {
    ASLoggingInitialize();
    uint64_t v15 = ASLogNotifications;
    uint64_t v16 = 0;
    if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v30 = 138412290;
    id v31 = v10;
    double v17 = "Dropping achievement with template unique name %@, move streak";
    goto LABEL_7;
  }
  if ([v10 containsString:@"CompetitionVictory"])
  {
    v25 = [*(id *)(a1 + 32) contact];
    uint64_t v26 = [v25 primaryRemoteRelationship];
    v27 = [v26 UUID];
    v28 = [v27 UUIDString];
    int v29 = [v10 containsString:v28];

    if (v29)
    {
      ASLoggingInitialize();
      uint64_t v15 = ASLogNotifications;
      uint64_t v16 = 0;
      if (!os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      int v30 = 138412290;
      id v31 = v10;
      double v17 = "Dropping achievement with template unique name %@, competition victory against me";
      goto LABEL_7;
    }
  }
  if (![v9 isEqualToString:*MEMORY[0x263F23628]])
  {
    uint64_t v16 = 1;
    goto LABEL_8;
  }
  ASLoggingInitialize();
  uint64_t v15 = ASLogNotifications;
  uint64_t v16 = 0;
  if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    id v31 = v10;
    double v17 = "Dropping achievement with template unique name %@, source is Remote";
    goto LABEL_7;
  }
LABEL_8:

  return v16;
}

uint64_t __74__ASActivityDataNotificationRulesEngine__filterNotificationGroup_ruleset___block_invoke_284(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 friend];
  v5 = [v4 UUID];
  v6 = [*(id *)(a1 + 32) UUID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v3 sample];
    ASLoggingInitialize();
    uint64_t v9 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      uint64_t v24 = (uint64_t)v8;
      _os_log_impl(&dword_21EC60000, v9, OS_LOG_TYPE_DEFAULT, "Evaluating snapshot: %@", (uint8_t *)&v23, 0xCu);
    }
    id v10 = [*(id *)(a1 + 32) currentCacheIndex];
    uint64_t v11 = [v10 longLongValue];

    uint64_t v12 = [v8 snapshotIndex];
    ASLoggingInitialize();
    double v13 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134217984;
      uint64_t v24 = v11;
      _os_log_impl(&dword_21EC60000, v13, OS_LOG_TYPE_DEFAULT, "friend current index: %lld", (uint8_t *)&v23, 0xCu);
    }
    ASLoggingInitialize();
    double v14 = ASLogNotifications;
    if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134217984;
      uint64_t v24 = v12;
      _os_log_impl(&dword_21EC60000, v14, OS_LOG_TYPE_DEFAULT, "Snapshot index: %lld", (uint8_t *)&v23, 0xCu);
    }
    if (v11 == v12)
    {
      uint64_t v15 = [v8 snapshotUploadedDate];
      int IsNotificationEventDateBeforeRelationshipBeganWithFriend = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v15, *(void **)(a1 + 32));

      if (IsNotificationEventDateBeforeRelationshipBeganWithFriend)
      {
        ASLoggingInitialize();
        double v17 = ASLogNotifications;
        uint64_t v18 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          double v19 = "Snapshot uploaded prior to relationship starting, skipping";
LABEL_18:
          _os_log_impl(&dword_21EC60000, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, 2u);
          uint64_t v18 = 0;
        }
      }
      else
      {
        v20 = [v8 endDate];
        int v21 = _IsNotificationEventDateBeforeRelationshipBeganWithFriend(v20, *(void **)(a1 + 32));

        if (!v21)
        {
          uint64_t v18 = 1;
          goto LABEL_20;
        }
        ASLoggingInitialize();
        double v17 = ASLogNotifications;
        uint64_t v18 = 0;
        if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          double v19 = "Snapshot is for a date prior to when the relationship began, skipping";
          goto LABEL_18;
        }
      }
    }
    else
    {
      ASLoggingInitialize();
      double v17 = ASLogNotifications;
      uint64_t v18 = 0;
      if (os_log_type_enabled((os_log_t)ASLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        double v19 = "Snapshot is not in the current day for friend, skipping";
        goto LABEL_18;
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v18 = 0;
LABEL_21:

  return v18;
}

@end