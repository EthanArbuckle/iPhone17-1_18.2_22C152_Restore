@interface ASActivityDataValidator
+ (id)_copyAchievement:(id)a3;
+ (id)_removeInvalidWorkouts:(id)a3;
+ (id)_shiftedAchievements:(id)a3 friendTimeZones:(id)a4 friendListManager:(id)a5;
+ (id)_unhiddenSamplesInFilterableSamples:(id)a3 friendTimeZones:(id)a4 friendListManager:(id)a5 isInvitationData:(BOOL)a6;
+ (id)validatedSamplesFromAchievements:(id)a3 workouts:(id)a4 activitySnapshots:(id)a5 friendListManager:(id)a6 isInvitationData:(BOOL)a7;
@end

@implementation ASActivityDataValidator

+ (id)validatedSamplesFromAchievements:(id)a3 workouts:(id)a4 activitySnapshots:(id)a5 friendListManager:(id)a6 isInvitationData:(BOOL)a7
{
  BOOL v69 = a7;
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v71 = a6;
  v10 = (void *)MEMORY[0x263EFFA68];
  if (a4) {
    id v11 = a4;
  }
  else {
    id v11 = (id)MEMORY[0x263EFFA68];
  }
  id v65 = v11;
  id v12 = a5;
  id v13 = a3;
  if (v12) {
    v14 = v12;
  }
  else {
    v14 = v10;
  }
  id v15 = v14;

  if (v13) {
    v16 = v13;
  }
  else {
    v16 = v10;
  }
  id v64 = v16;

  id v17 = v15;
  v18 = [MEMORY[0x263EFFA08] set];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v84 objects:buf count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v85;
    do
    {
      uint64_t v23 = 0;
      v24 = v18;
      do
      {
        if (*(void *)v85 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = [*(id *)(*((void *)&v84 + 1) + 8 * v23) friendUUID];
        v18 = [v24 setByAddingObject:v25];

        ++v23;
        v24 = v18;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v84 objects:buf count:16];
    }
    while (v21);
  }

  v74 = [MEMORY[0x263EFF9A0] dictionary];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v18;
  uint64_t v26 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v81 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v80 + 1) + 8 * i);
        v79[0] = MEMORY[0x263EF8330];
        v79[1] = 3221225472;
        v79[2] = ___FriendTimeZonesFromNewActivitySnapshots_block_invoke;
        v79[3] = &unk_265215E08;
        v79[4] = v30;
        v31 = [MEMORY[0x263F08A98] predicateWithBlock:v79];
        v32 = [v19 filteredArrayUsingPredicate:v31];

        v33 = _HKMostRecentActivitySnapshotInSnapshots();
        v34 = [v33 timeZone];
        if (v34) {
          [v74 setObject:v34 forKeyedSubscript:v30];
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    }
    while (v27);
  }

  v35 = [a1 _removeInvalidWorkouts:v65];

  v36 = [a1 _shiftedAchievements:v64 friendTimeZones:v74 friendListManager:v71];

  uint64_t obja = [v19 count];
  uint64_t v37 = [v35 count];
  uint64_t v38 = [v36 count];
  v39 = [a1 _unhiddenSamplesInFilterableSamples:v19 friendTimeZones:v74 friendListManager:v71 isInvitationData:v69];

  uint64_t v40 = [a1 _unhiddenSamplesInFilterableSamples:v35 friendTimeZones:v74 friendListManager:v71 isInvitationData:v69];

  v41 = (void *)v40;
  v42 = [a1 _unhiddenSamplesInFilterableSamples:v36 friendTimeZones:v74 friendListManager:v71 isInvitationData:v69];

  ASLoggingInitialize();
  v43 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    v44 = v43;
    uint64_t v45 = obja - [v39 count];
    uint64_t v46 = v37 - [v41 count];
    uint64_t v47 = [v42 count];
    *(_DWORD *)buf = 134219264;
    uint64_t v91 = v45;
    __int16 v92 = 2048;
    uint64_t v93 = obja;
    __int16 v94 = 2048;
    uint64_t v95 = v46;
    __int16 v96 = 2048;
    uint64_t v97 = v37;
    __int16 v98 = 2048;
    uint64_t v99 = v38 - v47;
    __int16 v100 = 2048;
    uint64_t v101 = v38;
    _os_log_impl(&dword_2474C9000, v44, OS_LOG_TYPE_DEFAULT, "Filtered hidden data: %lu/%lu snapshots, %lu/%lu workouts, %lu/%lu achievements.", buf, 0x3Eu);
  }
  v66 = v42;
  v68 = v41;
  v48 = [v41 arrayByAddingObjectsFromArray:v42];
  v70 = v39;
  v49 = [v48 arrayByAddingObjectsFromArray:v39];

  ASLoggingInitialize();
  v50 = (os_log_t *)MEMORY[0x263F23AA0];
  v51 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v51, OS_LOG_TYPE_DEFAULT, "Validated samples:", buf, 2u);
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v52 = v49;
  uint64_t v53 = [v52 countByEnumeratingWithState:&v75 objects:v88 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v54; ++j)
      {
        if (*(void *)v76 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v75 + 1) + 8 * j);
        if (objc_opt_respondsToSelector())
        {
          ASLoggingInitialize();
          os_log_t v58 = *v50;
          if (os_log_type_enabled(*v50, OS_LOG_TYPE_DEFAULT))
          {
            v59 = v58;
            v60 = objc_msgSend(v57, "filter_friendUUID");
            v61 = (objc_class *)objc_opt_class();
            v62 = NSStringFromClass(v61);
            *(_DWORD *)buf = 138412546;
            uint64_t v91 = (uint64_t)v60;
            __int16 v92 = 2112;
            uint64_t v93 = (uint64_t)v62;
            _os_log_impl(&dword_2474C9000, v59, OS_LOG_TYPE_DEFAULT, "%@ -> %@", buf, 0x16u);

            v50 = (os_log_t *)MEMORY[0x263F23AA0];
          }
        }
      }
      uint64_t v54 = [v52 countByEnumeratingWithState:&v75 objects:v88 count:16];
    }
    while (v54);
  }

  return v52;
}

+ (id)_removeInvalidWorkouts:(id)a3
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_1);
}

BOOL __50__ASActivityDataValidator__removeInvalidWorkouts___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F0A6E8];
  id v3 = a2;
  v4 = [v2 workoutType];
  [v4 maximumAllowedDuration];
  double v6 = v5;
  [v3 duration];
  double v8 = v7;

  return v6 > v8;
}

+ (id)_shiftedAchievements:(id)a3 friendTimeZones:(id)a4 friendListManager:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__ASActivityDataValidator__shiftedAchievements_friendTimeZones_friendListManager___block_invoke;
  v14[3] = &unk_265215DB8;
  id v15 = v8;
  id v16 = v9;
  id v17 = a1;
  id v10 = v9;
  id v11 = v8;
  id v12 = objc_msgSend(a3, "hk_map:", v14);

  return v12;
}

id __82__ASActivityDataValidator__shiftedAchievements_friendTimeZones_friendListManager___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 friendUUID];
  double v5 = [a1[4] objectForKeyedSubscript:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [a1[5] friendWithUUID:v4];
    id v7 = [v8 timeZone];
  }
  uint64_t v9 = [v7 secondsFromGMT];
  id v10 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v11 = [v10 secondsFromGMT];

  id v12 = (void *)[a1[6] _copyAchievement:v3];
  id v13 = [v3 completedDate];

  v14 = [v13 dateByAddingTimeInterval:(double)(v9 - v11)];
  [v12 setCompletedDate:v14];

  return v12;
}

+ (id)_unhiddenSamplesInFilterableSamples:(id)a3 friendTimeZones:(id)a4 friendListManager:(id)a5 isInvitationData:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x263EFF8F0];
  id v12 = a3;
  id v13 = objc_msgSend(v11, "hk_gregorianCalendar");
  v14 = (void *)MEMORY[0x263F08A98];
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __114__ASActivityDataValidator__unhiddenSamplesInFilterableSamples_friendTimeZones_friendListManager_isInvitationData___block_invoke;
  v24 = &unk_265215DE0;
  id v25 = v10;
  id v26 = v13;
  id v27 = v9;
  BOOL v28 = a6;
  id v15 = v9;
  id v16 = v13;
  id v17 = v10;
  v18 = [v14 predicateWithBlock:&v21];
  id v19 = objc_msgSend(v12, "filteredArrayUsingPredicate:", v18, v21, v22, v23, v24);

  return v19;
}

uint64_t __114__ASActivityDataValidator__unhiddenSamplesInFilterableSamples_friendTimeZones_friendListManager_isInvitationData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = objc_msgSend(v3, "filter_friendUUID");
  double v5 = objc_msgSend(v3, "filter_date");

  double v6 = [*(id *)(a1 + 32) friendWithUUID:v4];
  int v7 = [v6 isActivityDataVisibleToMeForDate:v5];
  int v8 = [v6 isHidingActivityDataFromMeForDate:v5];
  id v9 = *(void **)(a1 + 48);
  id v10 = [v6 UUID];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];
  if (v11)
  {
    id v12 = (void **)(a1 + 40);
    [*(id *)(a1 + 40) setTimeZone:v11];
  }
  else
  {
    id v13 = [v6 timeZone];
    id v12 = (void **)(a1 + 40);
    [*(id *)(a1 + 40) setTimeZone:v13];
  }
  v14 = *v12;
  id v15 = v5;
  id v16 = v14;
  id v17 = [v6 dateActivityDataInitiallyBecameVisibleToMe];
  if (v17)
  {
    v18 = [v16 startOfDayForDate:v17];
    int v19 = objc_msgSend(v15, "hk_isAfterOrEqualToDate:", v18);
  }
  else
  {
    int v19 = 0;
  }

  if ((v7 | v8) & 1) != 0 || (v19)
  {
    if ((v7 | (v7 | v8) ^ 1)) {
      goto LABEL_10;
    }
  }
  else if (*(unsigned char *)(a1 + 56))
  {
LABEL_10:
    uint64_t v20 = 1;
    goto LABEL_24;
  }
  ASLoggingInitialize();
  uint64_t v21 = (os_log_t *)MEMORY[0x263F23AA0];
  uint64_t v22 = (void *)*MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    v24 = [v6 contact];
    id v25 = [v24 fullName];
    int v33 = 138543618;
    id v34 = v4;
    __int16 v35 = 2112;
    v36 = v25;
    _os_log_impl(&dword_2474C9000, v23, OS_LOG_TYPE_DEFAULT, "Not allowing sample for friend %{public}@ - %@", (uint8_t *)&v33, 0x16u);

    uint64_t v21 = (os_log_t *)MEMORY[0x263F23AA0];
  }
  ASLoggingInitialize();
  id v26 = *v21;
  if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138543362;
    id v34 = v15;
    _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "Sample date: %{public}@", (uint8_t *)&v33, 0xCu);
  }
  ASLoggingInitialize();
  id v27 = *v21;
  if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    LODWORD(v34) = v7;
    _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "Activity data visible: %d", (uint8_t *)&v33, 8u);
  }
  ASLoggingInitialize();
  BOOL v28 = *v21;
  if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    LODWORD(v34) = v8;
    _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "Explicitly hiding: %d", (uint8_t *)&v33, 8u);
  }
  ASLoggingInitialize();
  v29 = *v21;
  if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = *(unsigned __int8 *)(a1 + 56);
    int v33 = 67109120;
    LODWORD(v34) = v30;
    _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "Invitation data: %d", (uint8_t *)&v33, 8u);
  }
  ASLoggingInitialize();
  v31 = *v21;
  uint64_t v20 = 0;
  if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 67109120;
    LODWORD(v34) = v19;
    _os_log_impl(&dword_2474C9000, v31, OS_LOG_TYPE_DEFAULT, "Is on same day as friendship began: %d", (uint8_t *)&v33, 8u);
    uint64_t v20 = 0;
  }
LABEL_24:

  return v20;
}

+ (id)_copyAchievement:(id)a3
{
  id v3 = (void *)MEMORY[0x263F0A9C8];
  id v4 = a3;
  double v5 = [v4 templateUniqueName];
  double v6 = [v4 completedDate];
  int v7 = [v4 value];
  int v8 = [v4 friendUUID];
  id v9 = [v3 achievementWithTemplateUniqueName:v5 completedDate:v6 value:v7 friendUUID:v8];

  id v10 = [v4 UUID];

  uint64_t v11 = (void *)[v10 copy];
  [v9 _setUUID:v11];

  return v9;
}

@end