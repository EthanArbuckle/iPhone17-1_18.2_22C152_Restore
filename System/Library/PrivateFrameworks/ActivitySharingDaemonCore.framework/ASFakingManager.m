@interface ASFakingManager
- (ACHAchievement)fakeAchievement;
- (ASActivityDataManager)activityDataManager;
- (ASCloudKitManager)cloudKitManager;
- (ASCompetitionManager)competitionManager;
- (ASContactsManager)contactsManager;
- (ASFakingManager)initWithDatabaseClient:(id)a3;
- (ASFriend)fakeFriend;
- (_HKFitnessFriendAchievement)fakeFriendAchievement;
- (_HKFitnessFriendActivitySnapshot)fakeCompleteSnapshot;
- (_HKFitnessFriendActivitySnapshot)fakeSnapshot;
- (_HKFitnessFriendWorkout)fakeGuidedRunWorkout;
- (_HKFitnessFriendWorkout)fakeGuidedWalkWorkout;
- (_HKFitnessFriendWorkout)fakeVideoWorkout;
- (_HKFitnessFriendWorkout)fakeWorkout;
- (id)_contactWithFakeCompetitionStatus:(int64_t)a3;
- (id)_fakeCompetitionHistory;
- (id)_fakeCompetitionWithStartDate:(id)a3 opponentScores:(id)a4 scores:(id)a5;
- (id)_fakeSnapshotWithCompleteRings:(BOOL)a3;
- (id)fakeCompetitionWithStartDate:(id)a3 winningParticipant:(int64_t)a4;
- (id)fakeFriendWithCompetitionStatus:(int64_t)a3 competition:(id)a4;
- (id)fakeTiedCompetitionWithStartDate:(id)a3;
- (id)fakeWorkoutWithSeymourCatalogWorkoutIdentifier:(id)a3 seymourMediaType:(id)a4;
- (void)activitySharingManagerReady:(id)a3;
- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3;
- (void)setActivityDataManager:(id)a3;
- (void)setCloudKitManager:(id)a3;
- (void)setCompetitionManager:(id)a3;
- (void)setContactsManager:(id)a3;
@end

@implementation ASFakingManager

- (ASFakingManager)initWithDatabaseClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASFakingManager;
  v6 = [(ASFakingManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_databaseClient, a3);
  }

  return v7;
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityDataManager];
  [(ASFakingManager *)self setActivityDataManager:v5];

  v6 = [v4 cloudKitManager];
  [(ASFakingManager *)self setCloudKitManager:v6];

  v7 = [v4 competitionManager];
  [(ASFakingManager *)self setCompetitionManager:v7];

  id v8 = [v4 contactsManager];

  [(ASFakingManager *)self setContactsManager:v8];
}

- (ASFriend)fakeFriend
{
  return (ASFriend *)[(ASFakingManager *)self fakeFriendWithCompetitionStatus:0 competition:0];
}

- (id)fakeFriendWithCompetitionStatus:(int64_t)a3 competition:(id)a4
{
  id v6 = a4;
  v7 = [(ASFakingManager *)self _contactWithFakeCompetitionStatus:a3];
  id v8 = [(ASFakingManager *)self _fakeCompetitionHistory];
  objc_super v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 arrayByAddingObject:v6];

    objc_super v9 = (void *)v10;
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263F23BD0]) initWithActivitySnapshots:0 friendAchievements:0 friendWorkouts:0 contact:v7 competitions:v9];

  return v11;
}

- (id)fakeCompetitionWithStartDate:(id)a3 winningParticipant:(int64_t)a4
{
  if (a4 == 1) {
    id v4 = &unk_26FBA7F40;
  }
  else {
    id v4 = &unk_26FBA7F58;
  }
  if (a4) {
    id v5 = &unk_26FBA7F58;
  }
  else {
    id v5 = &unk_26FBA7F40;
  }
  return [(ASFakingManager *)self _fakeCompetitionWithStartDate:a3 opponentScores:v4 scores:v5];
}

- (id)fakeTiedCompetitionWithStartDate:(id)a3
{
  return [(ASFakingManager *)self _fakeCompetitionWithStartDate:a3 opponentScores:&unk_26FBA7F70 scores:&unk_26FBA7F70];
}

- (id)_fakeCompetitionWithStartDate:(id)a3 opponentScores:(id)a4 scores:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  v7 = (objc_class *)MEMORY[0x263F23BB0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  v12 = [MEMORY[0x263F08C38] UUID];
  [v11 setUUID:v12];

  [v11 setOpponentScores:v9];
  [v11 setScores:v8];

  v13 = [MEMORY[0x263EFF8F0] currentCalendar];
  v14 = [v13 components:*MEMORY[0x263F0AC18] fromDate:v10];

  [v11 setStartDateComponents:v14];
  v15 = ASCompetitionDurationDateComponentsForNewCompetitions();
  [v11 setDurationDateComponents:v15];

  v16 = [MEMORY[0x263EFFA08] set];
  v17 = ASPreferredCompetitionVictoryBadgeStylesForFriend();
  v18 = [v17 firstObject];

  v19 = _ActivitySharingDefaults();
  v20 = _LoadValueFromDefaultsWithFallback(v19, @"fakeCompetitionBadgeStyle", v18);

  v23[0] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  [v11 setPreferredVictoryBadgeStyles:v21];

  [v11 setMaximumNumberOfPointsPerDay:ASCompetitionMaximumPointsPerDayForNewCompetitions()];
  return v11;
}

- (_HKFitnessFriendWorkout)fakeWorkout
{
  return (_HKFitnessFriendWorkout *)[(ASFakingManager *)self fakeWorkoutWithSeymourCatalogWorkoutIdentifier:0 seymourMediaType:0];
}

- (_HKFitnessFriendWorkout)fakeVideoWorkout
{
  v3 = _ActivitySharingDefaults();
  id v4 = _LoadValueFromDefaultsWithFallback(v3, @"fakeWorkoutVideoIdentifier", @"1537521179");

  id v5 = [(ASFakingManager *)self fakeWorkoutWithSeymourCatalogWorkoutIdentifier:v4 seymourMediaType:@"video"];

  return (_HKFitnessFriendWorkout *)v5;
}

- (_HKFitnessFriendWorkout)fakeGuidedRunWorkout
{
  v3 = _ActivitySharingDefaults();
  id v4 = _LoadValueFromDefaultsWithFallback(v3, @"fakeWorkoutGuidedRunIdentifier", @"1567714086");

  id v5 = [(ASFakingManager *)self fakeWorkoutWithSeymourCatalogWorkoutIdentifier:v4 seymourMediaType:@"breeze"];

  return (_HKFitnessFriendWorkout *)v5;
}

- (_HKFitnessFriendWorkout)fakeGuidedWalkWorkout
{
  v3 = _ActivitySharingDefaults();
  id v4 = _LoadValueFromDefaultsWithFallback(v3, @"fakeWorkoutGuidedWalkIdentifier", @"1546163570");

  id v5 = [(ASFakingManager *)self fakeWorkoutWithSeymourCatalogWorkoutIdentifier:v4 seymourMediaType:@"guidedWalk"];

  return (_HKFitnessFriendWorkout *)v5;
}

- (id)fakeWorkoutWithSeymourCatalogWorkoutIdentifier:(id)a3 seymourMediaType:(id)a4
{
  id v43 = a4;
  id v42 = a3;
  id v5 = _ActivitySharingDefaults();
  id v6 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutType", &unk_26FBA7E50);
  uint64_t v41 = [v6 integerValue];

  v7 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutGoalType", &unk_26FBA7E68);
  uint64_t v8 = [v7 integerValue];

  id v9 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutEnergyBurned", &unk_26FBA7FA0);
  double v10 = (double)[v9 integerValue];

  id v11 = (void *)MEMORY[0x263F0A630];
  v12 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v39 = [v11 quantityWithUnit:v12 doubleValue:v10];

  v13 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutDistance", &unk_26FBA7FB0);
  [v13 doubleValue];
  double v15 = v14;

  v16 = (void *)MEMORY[0x263F0A630];
  v17 = [MEMORY[0x263F0A830] mileUnit];
  v40 = [v16 quantityWithUnit:v17 doubleValue:v15];

  v18 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutGoal", &unk_26FBA7FC0);
  [v18 doubleValue];
  double v20 = v19;

  switch(v8)
  {
    case 1:
      v21 = (void *)MEMORY[0x263F0A630];
      uint64_t v22 = [MEMORY[0x263F0A830] mileUnit];
      goto LABEL_7;
    case 3:
      v21 = (void *)MEMORY[0x263F0A630];
      uint64_t v22 = [MEMORY[0x263F0A830] kilocalorieUnit];
      goto LABEL_7;
    case 2:
      v21 = (void *)MEMORY[0x263F0A630];
      uint64_t v22 = [MEMORY[0x263F0A830] minuteUnit];
LABEL_7:
      v23 = (void *)v22;
      v24 = [v21 quantityWithUnit:v22 doubleValue:v20];

      goto LABEL_9;
  }
  v24 = 0;
LABEL_9:
  v25 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutIsIndoor", MEMORY[0x263EFFA80]);
  char v26 = [v25 BOOLValue];

  v27 = _LoadValueFromDefaultsWithFallback(v5, @"fakeWorkoutDuration", &unk_26FBA7FD0);
  [v27 doubleValue];
  double v29 = v28;

  v30 = [MEMORY[0x263EFF910] date];
  v31 = [v30 dateByAddingTimeInterval:-v29];
  v32 = _FriendUUIDFromDefaults(v5);
  BYTE1(v38) = v26;
  LOBYTE(v38) = 1;
  objc_msgSend(MEMORY[0x263F0A9D8], "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v41, v32, v31, v30, v39, v39, v29, v40, v8, v24, @"com.apple.SessionTracker", v38, 0, 0, 1,
    v42,
  v33 = v43);

  if ([MEMORY[0x263F0A980] isAppleInternalInstall]) {
    v34 = @"iPod6,3";
  }
  else {
    v34 = @"Watch";
  }
  v35 = [MEMORY[0x263F0A7A0] _sourceWithBundleIdentifier:@"Watch" name:@"Watch" productType:v34 options:2];
  v36 = (void *)[objc_alloc(MEMORY[0x263F0A7B0]) initWithSource:v35 version:@"1"];

  [v33 _setSourceRevision:v36];
  return v33;
}

- (_HKFitnessFriendAchievement)fakeFriendAchievement
{
  v2 = _ActivitySharingDefaults();
  v3 = _LoadValueFromDefaultsWithFallback(v2, @"fakeAchievementTemplateUniqueName", @"NewExerciseRecord");
  id v4 = _LoadValueFromDefaultsWithFallback(v2, @"fakeAchievementValue", &unk_26FBA7FE0);
  id v5 = _FriendUUIDFromDefaults(v2);
  id v6 = (void *)MEMORY[0x263F0A9C8];
  v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = [v6 achievementWithTemplateUniqueName:v3 completedDate:v7 value:v4 friendUUID:v5];

  return (_HKFitnessFriendAchievement *)v8;
}

- (ACHAchievement)fakeAchievement
{
  v3 = _ActivitySharingDefaults();
  id v4 = _LoadValueFromDefaultsWithFallback(v3, @"fakeAchievementTemplateUniqueName", @"NewExerciseRecord");
  id v5 = _LoadValueFromDefaultsWithFallback(v3, @"fakeAchievementValue", &unk_26FBA7FE0);
  if (ASIsCompetitionVictoryTemplate())
  {
    id v6 = [MEMORY[0x263EFFA08] set];
    ASPreferredCompetitionVictoryBadgeStylesForFriend();
    id WeakRetained = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [WeakRetained firstObject];
    [v8 unsignedIntValue];
    id v9 = [MEMORY[0x263F08C38] UUID];
    double v10 = ASEphemeralCompetitionVictoryAchievementForStyle();
LABEL_5:

    goto LABEL_7;
  }
  if (ACHShouldUseNewAwardsSystem())
  {
    id WeakRetained = objc_alloc_init(MEMORY[0x263F238D8]);
    id v16 = 0;
    uint64_t v8 = [WeakRetained allAchievementsWithError:&v16];
    id v9 = v16;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__ASFakingManager_fakeAchievement__block_invoke;
    v14[3] = &unk_265218028;
    id v15 = v4;
    double v10 = objc_msgSend(v8, "hk_firstObjectPassingTest:", v14);

    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementStore);
  double v10 = [WeakRetained achievementWithTemplateUniqueName:v4];
LABEL_7:

  id v11 = [MEMORY[0x263EFF910] date];
  v12 = ASEphemeralEarnedAchievement();

  return (ACHAchievement *)v12;
}

uint64_t __34__ASFakingManager_fakeAchievement__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 template];
  id v4 = [v3 uniqueName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (_HKFitnessFriendActivitySnapshot)fakeSnapshot
{
  return (_HKFitnessFriendActivitySnapshot *)[(ASFakingManager *)self _fakeSnapshotWithCompleteRings:0];
}

- (_HKFitnessFriendActivitySnapshot)fakeCompleteSnapshot
{
  return (_HKFitnessFriendActivitySnapshot *)[(ASFakingManager *)self _fakeSnapshotWithCompleteRings:1];
}

- (void)pushFakeActivityDataToAllFriendsWithCompletion:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ASFakingManager *)self fakeSnapshot];
  v25[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];

  v7 = [(ASFakingManager *)self fakeFriendAchievement];
  v24 = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];

  id v9 = [(ASFakingManager *)self fakeWorkout];
  v23 = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];

  id v11 = [MEMORY[0x263EFF8C0] arrayWithArray:v6];
  v12 = [v11 arrayByAddingObjectsFromArray:v8];

  v13 = [v12 arrayByAddingObjectsFromArray:v10];

  double v14 = [(ASFakingManager *)self activityDataManager];
  id v15 = [v14 recordsFromActivityDataCodables:v13];

  ASLoggingInitialize();
  id v16 = *MEMORY[0x263F23AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "FakingManager saving activity records", buf, 2u);
  }
  v17 = [(ASFakingManager *)self cloudKitManager];
  v18 = ASCloudKitGroupUserActionExplicit();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __66__ASFakingManager_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke;
  v20[3] = &unk_265218050;
  v20[4] = self;
  id v21 = v4;
  id v19 = v4;
  [v17 forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:v15 recordIDsToDelete:0 priority:2 activity:0 group:v18 completion:v20];
}

void __66__ASFakingManager_pushFakeActivityDataToAllFriendsWithCompletion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  if (a3 || (a2 & 1) == 0)
  {
    id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v11();
  }
  else
  {
    ASLoggingInitialize();
    id v4 = *MEMORY[0x263F23AB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2474C9000, v4, OS_LOG_TYPE_DEFAULT, "FakingManager saving competition scores", v12, 2u);
    }
    uint64_t v5 = [*(id *)(a1 + 32) competitionManager];
    id v6 = ASCompetitionDurationDateComponentsForNewCompetitions();
    if ([v6 day] < 1)
    {
      double v10 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = (void *)MEMORY[0x263EFFA68];
      do
      {
        id v9 = [NSNumber numberWithUnsignedInt:arc4random_uniform(0x384u)];
        double v10 = [v8 arrayByAddingObject:v9];

        ++v7;
        uint64_t v8 = v10;
      }
      while (v7 < [v6 day]);
    }

    [v5 updateAllActiveCompetitionsWithScores:v10 completion:*(void *)(a1 + 40)];
  }
}

- (id)_contactWithFakeCompetitionStatus:(int64_t)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = _ActivitySharingDefaults();
  id v6 = _FriendUUIDFromDefaults(v5);
  [v4 setUUID:v6];

  uint64_t v7 = objc_opt_new();
  uint64_t v8 = _ActivitySharingDefaults();
  id v9 = _FriendUUIDFromDefaults(v8);
  [v7 setUUID:v9];

  [v4 insertEventWithType:103];
  [v7 insertEventWithType:103];
  uint64_t v10 = 105;
  uint64_t v11 = 10;
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      uint64_t v13 = 11;
      uint64_t v12 = 106;
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_8;
      }
      [v4 insertEventWithType:10];
      [v7 insertEventWithType:105];
      uint64_t v12 = 14;
      uint64_t v10 = 11;
      uint64_t v11 = 106;
      uint64_t v13 = 14;
    }
    [v4 insertEventWithType:v11];
    [v7 insertEventWithType:v10];
    uint64_t v11 = v12;
    uint64_t v10 = v13;
  }
  [v4 insertEventWithType:v11];
  [v7 insertEventWithType:v10];
LABEL_8:
  double v14 = objc_opt_new();
  id v15 = _ActivitySharingDefaults();
  id v16 = _LoadValueFromDefaultsWithFallback(v15, @"fakeContactName", @"Allen");
  [v14 setShortName:v16];

  v17 = (void *)MEMORY[0x263EFFA08];
  v18 = _ActivitySharingDefaults();
  id v19 = _LoadValueFromDefaultsWithFallback(v18, @"fakeContactAddress", @"2025550184");
  double v20 = [v17 setWithObject:v19];
  [v14 setDestinations:v20];

  id v21 = objc_alloc_init(MEMORY[0x263F23C00]);
  [v21 setLegacyRelationship:v4];
  [v21 setLegacyRemoteRelationship:v7];
  [v21 setSecureCloudRelationship:v4];
  [v21 setSecureCloudRemoteRelationship:v7];
  [v14 setRelationshipStorage:v21];

  return v14;
}

- (id)_fakeCompetitionHistory
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = _ActivitySharingDefaults();
  uint64_t v4 = [v3 integerForKey:@"fakeCompetitionMyWinCount"];
  uint64_t v5 = [v3 integerForKey:@"fakeCompetitionOpponentWinCount"];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__13;
  id v21 = __Block_byref_object_dispose__13;
  id v22 = (id)MEMORY[0x263EFFA68];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__13;
  v15[4] = __Block_byref_object_dispose__13;
  id v16 = [MEMORY[0x263EFF910] distantPast];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__ASFakingManager__fakeCompetitionHistory__block_invoke;
  v14[3] = &unk_265218078;
  void v14[4] = self;
  v14[5] = v15;
  v14[6] = &v17;
  id v6 = (void *)MEMORY[0x24C557E50](v14);
  int v7 = [v3 BOOLForKey:@"fakeCompetitionOpponentWonPreviously"];
  uint64_t v8 = (void (*)(void *, uint64_t, uint64_t))v6[2];
  if (v7)
  {
    v8(v6, v4, 0);
    uint64_t v9 = 1;
  }
  else
  {
    v8(v6, v5, 1);
    uint64_t v9 = 0;
    uint64_t v5 = v4;
  }
  ((void (*)(void *, uint64_t, uint64_t))v6[2])(v6, v5, v9);
  ASLoggingInitialize();
  uint64_t v10 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v18[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v11;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Fake competitions=%@", buf, 0xCu);
  }
  id v12 = (id)v18[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __42__ASFakingManager__fakeCompetitionHistory__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = a2;
    do
    {
      id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v7 = [v6 dateByAddingUnit:16 value:1 toDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) options:0];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v10 = [*(id *)(a1 + 32) fakeCompetitionWithStartDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) winningParticipant:a3];
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) arrayByAddingObject:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      --v4;
    }
    while (v4);
  }
}

- (id)_fakeSnapshotWithCompleteRings:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = _ActivitySharingDefaults();
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = ASCacheIndexForLocalDate();

  id v7 = objc_alloc_init(MEMORY[0x263F0A090]);
  [v7 _setActivitySummaryIndex:v6];
  uint64_t v8 = _HKStartDateForSnapshotIndex();
  [v7 _setStartDate:v8];

  uint64_t v9 = _HKEndDateForSnapshotIndex();
  [v7 _setEndDate:v9];

  uint64_t v10 = _LoadValueFromDefaultsWithFallback(v4, @"fakeSnapshotEnergyBurnedGoal", &unk_26FBA7FA0);
  [v10 doubleValue];
  double v12 = v11;

  uint32_t v13 = arc4random_uniform(v12);
  double v14 = _LoadValueFromDefaultsWithFallback(v4, @"fakeSnapshotExerciseGoal", &unk_26FBA7FF0);
  [v14 doubleValue];
  double v16 = v15;

  uint32_t v80 = arc4random_uniform(v16);
  uint64_t v17 = _LoadValueFromDefaultsWithFallback(v4, @"fakeSnapshotStandGoal", &unk_26FBA8000);
  [v17 doubleValue];
  double v19 = v18;

  uint32_t v20 = arc4random_uniform(v19);
  id v21 = _LoadValueFromDefaultsWithFallback(v4, @"fakeSnapshotMoveMinuteGoal", &unk_26FBA8010);
  [v21 doubleValue];
  double v23 = v22;

  uint32_t v24 = arc4random_uniform(v23);
  uint64_t v25 = _LoadValueFromDefaultsWithFallback(v4, @"fakeSnapshotMoveMinuteEnabled", MEMORY[0x263EFFA80]);
  int v26 = [v25 BOOLValue];

  if (v3) {
    double v27 = v12;
  }
  else {
    double v27 = -0.0;
  }
  ASLoggingInitialize();
  double v28 = *MEMORY[0x263F23AC0];
  BOOL v29 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "Faking Move Minutes", buf, 2u);
    }
    [v7 setActivityMoveMode:2];
    v30 = (void *)MEMORY[0x263F0A630];
    v31 = [MEMORY[0x263F0A830] minuteUnit];
    v32 = [v30 quantityWithUnit:v31 doubleValue:(double)v24];
    [v7 setAppleMoveTime:v32];

    v33 = (void *)MEMORY[0x263F0A630];
    v34 = [MEMORY[0x263F0A830] minuteUnit];
    v35 = [v33 quantityWithUnit:v34 doubleValue:v23];
    [v7 setAppleMoveTimeGoal:v35];

    v36 = (void *)MEMORY[0x263F0A630];
    v37 = [MEMORY[0x263F0A830] kilocalorieUnit];
    uint64_t v38 = [v36 quantityWithUnit:v37 doubleValue:0.0];
    [v7 setActiveEnergyBurned:v38];

    v39 = (void *)MEMORY[0x263F0A630];
    v40 = [MEMORY[0x263F0A830] kilocalorieUnit];
    double v41 = 0.0;
    id v42 = v39;
    id v43 = v40;
  }
  else
  {
    double v44 = v27 + (double)v13;
    if (v29)
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_2474C9000, v28, OS_LOG_TYPE_DEFAULT, "Faking Calories", v83, 2u);
    }
    [v7 setActivityMoveMode:1];
    v45 = (void *)MEMORY[0x263F0A630];
    v46 = [MEMORY[0x263F0A830] kilocalorieUnit];
    v47 = [v45 quantityWithUnit:v46 doubleValue:v44];
    [v7 setActiveEnergyBurned:v47];

    v48 = (void *)MEMORY[0x263F0A630];
    v40 = [MEMORY[0x263F0A830] kilocalorieUnit];
    id v42 = v48;
    id v43 = v40;
    double v41 = v12;
  }
  v49 = [v42 quantityWithUnit:v43 doubleValue:v41];
  [v7 setActiveEnergyBurnedGoal:v49];

  double v50 = -0.0;
  if (v3) {
    double v51 = v16;
  }
  else {
    double v51 = -0.0;
  }
  double v52 = v51 + (double)v80;
  if (v3) {
    double v50 = v19;
  }
  double v53 = v50 + (double)v20;
  v54 = (void *)MEMORY[0x263F0A630];
  v55 = [MEMORY[0x263F0A830] minuteUnit];
  v56 = [v54 quantityWithUnit:v55 doubleValue:v52];
  [v7 setAppleExerciseTime:v56];

  v57 = (void *)MEMORY[0x263F0A630];
  v58 = [MEMORY[0x263F0A830] minuteUnit];
  v59 = [v57 quantityWithUnit:v58 doubleValue:v16];
  [v7 setAppleExerciseTimeGoal:v59];

  v60 = (void *)MEMORY[0x263F0A630];
  v61 = [MEMORY[0x263F0A830] countUnit];
  v62 = [v60 quantityWithUnit:v61 doubleValue:v53];
  [v7 setAppleStandHours:v62];

  v63 = (void *)MEMORY[0x263F0A630];
  v64 = [MEMORY[0x263F0A830] countUnit];
  v65 = [v63 quantityWithUnit:v64 doubleValue:v19];
  [v7 setAppleStandHoursGoal:v65];

  v66 = (void *)MEMORY[0x263F0A630];
  v67 = [MEMORY[0x263F0A830] meterUnit];
  v68 = [v66 quantityWithUnit:v67 doubleValue:(double)arc4random_uniform(0x2710u)];
  [v7 setDistanceWalkingRunning:v68];

  v69 = (void *)MEMORY[0x263F0A630];
  v70 = [MEMORY[0x263F0A830] countUnit];
  v71 = [v69 quantityWithUnit:v70 doubleValue:(double)arc4random_uniform(0x3A98u)];
  [v7 setStepCount:v71];

  v72 = (void *)MEMORY[0x263F0A630];
  v73 = [MEMORY[0x263F0A830] countUnit];
  v74 = [v72 quantityWithUnit:v73 doubleValue:(double)arc4random_uniform(0xBB8u)];
  [v7 _setPushCount:v74];

  [v7 _setWheelchairUse:1];
  v75 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:v7];
  databaseClient = self->_databaseClient;
  uint64_t v82 = 0;
  v77 = [(ASDatabaseClient *)databaseClient localSourceUUIDWithError:&v82];
  [v75 setSourceUUID:v77];

  v78 = _FriendUUIDFromDefaults(v4);
  [v75 setFriendUUID:v78];

  return v75;
}

- (ASActivityDataManager)activityDataManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  return (ASActivityDataManager *)WeakRetained;
}

- (void)setActivityDataManager:(id)a3
{
}

- (ASCloudKitManager)cloudKitManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  return (ASCloudKitManager *)WeakRetained;
}

- (void)setCloudKitManager:(id)a3
{
}

- (ASCompetitionManager)competitionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_competitionManager);
  return (ASCompetitionManager *)WeakRetained;
}

- (void)setCompetitionManager:(id)a3
{
}

- (ASContactsManager)contactsManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsManager);
  return (ASContactsManager *)WeakRetained;
}

- (void)setContactsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactsManager);
  objc_destroyWeak((id *)&self->_competitionManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
  objc_destroyWeak((id *)&self->_achievementStore);
  objc_storeStrong((id *)&self->_databaseClient, 0);
}

@end