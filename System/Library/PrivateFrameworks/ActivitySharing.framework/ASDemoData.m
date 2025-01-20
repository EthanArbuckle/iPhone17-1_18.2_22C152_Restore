@interface ASDemoData
+ (id)_achievementsForFriendTwoWithFriendUUID:(id)a3;
+ (id)_achievementsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4;
+ (id)_activitySnapshotForFitnessJrFriendWithFriendUUID:(id)a3 sourceUUID:(id)a4;
+ (id)_activitySnapshotForFriendOneWithFriendUUID:(id)a3 sourceUUID:(id)a4;
+ (id)_activitySnapshotForFriendThreeWithFriendUUID:(id)a3 sourceUUID:(id)a4;
+ (id)_activitySnapshotForFriendTwoWithFriendUUID:(id)a3 sourceUUID:(id)a4;
+ (id)_activitySnapshotForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4 sourceUUID:(id)a5;
+ (id)_appleWatchSourceRevision;
+ (id)_fakeAchievementDuringDayStartingAtDate:(id)a3 personUUID:(id)a4;
+ (id)_fakeFriendListWithDemoFileName:(id)a3;
+ (id)_fakeWorkoutDuringDayStartingAtDate:(id)a3 personUUID:(id)a4;
+ (id)_fakeWorkoutsForIndex:(int64_t)a3 personUUID:(id)a4;
+ (id)_fakeWorkoutsForLastWeekWithPersonUUID:(id)a3 dailySnapshotProbability:(double)a4;
+ (id)_workoutsForFitnessJrFriendTwoWithFriendUUID:(id)a3;
+ (id)_workoutsForFriendOneWithFriendUUID:(id)a3;
+ (id)_workoutsForFriendTwoWithFriendUUID:(id)a3;
+ (id)_workoutsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4;
+ (id)createMeWithModel:(id)a3;
+ (id)fakeAppFriendListForMarketing;
+ (id)fakeFirstGlanceFriendListForMarketing;
@end

@implementation ASDemoData

+ (id)_activitySnapshotForFriendOneWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  v25[7] = *MEMORY[0x263EF8340];
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v23 = [v5 numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v24[0] = v23;
  v22 = _ActivitySnapshot(0, v7, v6, 70, 30, 6, 12, 10532, 630.0, 400.0, 0.0, 0.0, 7.4, 1);
  v25[0] = v22;
  v21 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v24[1] = v21;
  v20 = _ActivitySnapshot(1, v7, v6, 76, 30, 13, 12, 12849, 515.0, 400.0, 0.0, 0.0, 8.5, 1);
  v25[1] = v20;
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(2)];
  v24[2] = v19;
  v18 = _ActivitySnapshot(2, v7, v6, 55, 30, 12, 12, 9845, 380.0, 400.0, 0.0, 0.0, 6.2, 1);
  v25[2] = v18;
  v8 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(3)];
  v24[3] = v8;
  v9 = _ActivitySnapshot(3, v7, v6, 45, 30, 10, 12, 10003, 550.0, 400.0, 0.0, 0.0, 6.8, 1);
  v25[3] = v9;
  v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(4)];
  v24[4] = v10;
  v11 = _ActivitySnapshot(4, v7, v6, 78, 30, 14, 12, 12849, 472.0, 400.0, 0.0, 0.0, 7.2, 1);
  v25[4] = v11;
  v12 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v24[5] = v12;
  v13 = _ActivitySnapshot(5, v7, v6, 63, 30, 12, 12, 11536, 611.0, 400.0, 0.0, 0.0, 6.3, 1);
  v25[5] = v13;
  v14 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(6)];
  v24[6] = v14;
  v15 = _ActivitySnapshot(6, v7, v6, 72, 30, 10, 12, 10305, 500.0, 400.0, 0.0, 0.0, 6.8, 1);

  v25[6] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  return v16;
}

+ (id)_activitySnapshotForFriendTwoWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  v25[7] = *MEMORY[0x263EF8340];
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v23 = [v5 numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v24[0] = v23;
  v22 = _ActivitySnapshot(0, v7, v6, 52, 30, 4, 12, 4523, 923.0, 850.0, 0.0, 0.0, 9.2, 1);
  v25[0] = v22;
  v21 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v24[1] = v21;
  v20 = _ActivitySnapshot(1, v7, v6, 56, 30, 12, 12, 9042, 720.0, 850.0, 0.0, 0.0, 5.6, 1);
  v25[1] = v20;
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(2)];
  v24[2] = v19;
  v18 = _ActivitySnapshot(2, v7, v6, 44, 30, 14, 12, 8573, 878.0, 850.0, 0.0, 0.0, 5.2, 1);
  v25[2] = v18;
  v8 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(3)];
  v24[3] = v8;
  v9 = _ActivitySnapshot(3, v7, v6, 28, 30, 13, 12, 7523, 700.0, 850.0, 0.0, 0.0, 4.9, 1);
  v25[3] = v9;
  v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(4)];
  v24[4] = v10;
  v11 = _ActivitySnapshot(4, v7, v6, 33, 30, 15, 12, 4073, 710.0, 850.0, 0.0, 0.0, 2.8, 1);
  v25[4] = v11;
  v12 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v24[5] = v12;
  v13 = _ActivitySnapshot(5, v7, v6, 45, 30, 10, 12, 9500, 689.0, 850.0, 0.0, 0.0, 6.0, 1);
  v25[5] = v13;
  v14 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(6)];
  v24[6] = v14;
  v15 = _ActivitySnapshot(6, v7, v6, 40, 30, 8, 12, 8294, 566.0, 850.0, 0.0, 0.0, 5.7, 1);

  v25[6] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  return v16;
}

+ (id)_activitySnapshotForFriendThreeWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  v25[7] = *MEMORY[0x263EF8340];
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v23 = [v5 numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v24[0] = v23;
  v22 = _ActivitySnapshot(0, v7, v6, 10, 30, 2, 12, 3038, 100.0, 250.0, 0.0, 0.0, 1.5, 1);
  v25[0] = v22;
  v21 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v24[1] = v21;
  v20 = _ActivitySnapshot(1, v7, v6, 15, 30, 8, 12, 3489, 120.0, 250.0, 0.0, 0.0, 1.8, 1);
  v25[1] = v20;
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(2)];
  v24[2] = v19;
  v18 = _ActivitySnapshot(2, v7, v6, 12, 30, 6, 12, 2855, 90.0, 250.0, 0.0, 0.0, 1.3, 1);
  v25[2] = v18;
  v8 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(3)];
  v24[3] = v8;
  v9 = _ActivitySnapshot(3, v7, v6, 5, 30, 6, 12, 4180, 169.0, 250.0, 0.0, 0.0, 2.4, 1);
  v25[3] = v9;
  v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(4)];
  v24[4] = v10;
  v11 = _ActivitySnapshot(4, v7, v6, 19, 30, 3, 12, 3767, 145.0, 250.0, 0.0, 0.0, 2.1, 1);
  v25[4] = v11;
  v12 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v24[5] = v12;
  v13 = _ActivitySnapshot(5, v7, v6, 15, 30, 9, 12, 3611, 110.0, 250.0, 0.0, 0.0, 1.7, 1);
  v25[5] = v13;
  v14 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(6)];
  v24[6] = v14;
  v15 = _ActivitySnapshot(6, v7, v6, 13, 30, 4, 12, 6412, 200.0, 250.0, 0.0, 0.0, 3.0, 1);

  v25[6] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  return v16;
}

+ (id)_activitySnapshotForFitnessJrFriendWithFriendUUID:(id)a3 sourceUUID:(id)a4
{
  v25[7] = *MEMORY[0x263EF8340];
  v5 = NSNumber;
  id v6 = a4;
  id v7 = a3;
  v23 = [v5 numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v24[0] = v23;
  v22 = _ActivitySnapshot(0, v7, v6, 56, 60, 11, 10, 5527, 0.0, 0.0, 122.0, 120.0, 3.2, 2);
  v25[0] = v22;
  v21 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v24[1] = v21;
  v20 = _ActivitySnapshot(1, v7, v6, 82, 60, 12, 10, 6143, 0.0, 0.0, 135.0, 120.0, 3.7, 2);
  v25[1] = v20;
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(2)];
  v24[2] = v19;
  v18 = _ActivitySnapshot(2, v7, v6, 54, 60, 11, 10, 5496, 0.0, 0.0, 120.0, 120.0, 3.1, 2);
  v25[2] = v18;
  v8 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(3)];
  v24[3] = v8;
  v9 = _ActivitySnapshot(3, v7, v6, 47, 60, 11, 10, 4438, 0.0, 0.0, 101.0, 120.0, 2.5, 2);
  v25[3] = v9;
  v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(4)];
  v24[4] = v10;
  v11 = _ActivitySnapshot(4, v7, v6, 73, 60, 12, 10, 5986, 0.0, 0.0, 128.0, 120.0, 3.4, 2);
  v25[4] = v11;
  v12 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v24[5] = v12;
  v13 = _ActivitySnapshot(5, v7, v6, 131, 60, 14, 10, 10091, 0.0, 0.0, 183.0, 120.0, 6.9, 2);
  v25[5] = v13;
  v14 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(6)];
  v24[6] = v14;
  v15 = _ActivitySnapshot(6, v7, v6, 115, 60, 13, 10, 9002, 0.0, 0.0, 174.0, 120.0, 5.5, 2);

  v25[6] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  return v16;
}

+ (id)_activitySnapshotForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4 sourceUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3 <= 0) {
    int64_t v9 = -(-a3 & 3);
  }
  else {
    int64_t v9 = a3 & 3;
  }
  if (v9 == 2)
  {
    uint64_t v10 = [(id)objc_opt_class() _activitySnapshotForFriendThreeWithFriendUUID:v7 sourceUUID:v8];
  }
  else if (v9 == 1)
  {
    uint64_t v10 = [(id)objc_opt_class() _activitySnapshotForFriendTwoWithFriendUUID:v7 sourceUUID:v8];
  }
  else
  {
    if (v9) {
      [(id)objc_opt_class() _activitySnapshotForFitnessJrFriendWithFriendUUID:v7 sourceUUID:v8];
    }
    else {
    uint64_t v10 = [(id)objc_opt_class() _activitySnapshotForFriendOneWithFriendUUID:v7 sourceUUID:v8];
    }
  }
  v11 = (void *)v10;

  return v11;
}

+ (id)_achievementsForFriendTwoWithFriendUUID:(id)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v24[0] = v4;
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = (void *)MEMORY[0x263F0A9C8];
  id v7 = v3;
  id v8 = DailyMoveRecordTemplate();
  int64_t v9 = [v8 uniqueName];
  _CacheIndexForDayWithOffsetFromCurrentDay(0);
  uint64_t v10 = _HKStartDateForSnapshotIndex();
  v11 = [v6 achievementWithTemplateUniqueName:v9 completedDate:v10 value:&unk_26D051338 friendUUID:v7];

  v12 = [v5 setWithObject:v11];
  v25[0] = v12;
  v13 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v24[1] = v13;
  v14 = (void *)MEMORY[0x263EFFA08];
  v15 = (void *)MEMORY[0x263F0A9C8];
  id v16 = v7;
  v17 = DailyExerciseRecordTemplate();
  v18 = [v17 uniqueName];
  _CacheIndexForDayWithOffsetFromCurrentDay(1);
  v19 = _HKStartDateForSnapshotIndex();
  v20 = [v15 achievementWithTemplateUniqueName:v18 completedDate:v19 value:&unk_26D051338 friendUUID:v16];

  v21 = [v14 setWithObject:v20];
  v25[1] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v22;
}

+ (id)_achievementsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4
{
  if ((a3 & 0x8000000000000003) == 1)
  {
    id v4 = a4;
    v5 = [(id)objc_opt_class() _achievementsForFriendTwoWithFriendUUID:v4];
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA78];
  }

  return v5;
}

+ (id)_workoutsForFriendOneWithFriendUUID:(id)a3
{
  v20[3] = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  id v4 = a3;
  v5 = [v3 numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v19[0] = v5;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = _CreatePedestrianWorkout(v4, 0, 52, 2, 1800.0, 2.5);
  id v8 = [v6 setWithObject:v7];
  v20[0] = v8;
  int64_t v9 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(2)];
  v19[1] = v9;
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  v11 = _CreatePedestrianWorkout(v4, 2, 37, 1, 1800.0, 3.0);
  v12 = [v10 setWithObject:v11];
  v20[1] = v12;
  v13 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v19[2] = v13;
  v14 = (void *)MEMORY[0x263EFFA08];
  v15 = _CreatePedestrianWorkout(v4, 5, 37, 1, 2200.0, 3.5);

  id v16 = [v14 setWithObject:v15];
  v20[2] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  return v17;
}

+ (id)_workoutsForFriendTwoWithFriendUUID:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  v20[0] = v19;
  id v3 = (void *)MEMORY[0x263EFFA08];
  v18 = [MEMORY[0x263F08C38] UUID];
  v17 = _CreatePedestrianWorkout(v18, 0, 37, 1, 2760.0, 6.0);
  id v4 = [v3 setWithObject:v17];
  v21[0] = v4;
  v5 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v20[1] = v5;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = _CreatePedestrianWorkout(v7, 1, 37, 1, 1200.0, 2.0);
  int64_t v9 = [v6 setWithObject:v8];
  v21[1] = v9;
  uint64_t v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(4)];
  v20[2] = v10;
  v11 = (void *)MEMORY[0x263EFFA08];
  v12 = [MEMORY[0x263F08C38] UUID];
  v13 = _CreatePedestrianWorkout(v12, 4, 52, 2, 1600.0, 2.8);
  v14 = [v11 setWithObject:v13];
  v21[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v15;
}

+ (id)_workoutsForFitnessJrFriendTwoWithFriendUUID:(id)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  v19 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(1)];
  v20[0] = v19;
  id v3 = (void *)MEMORY[0x263EFFA08];
  v18 = [MEMORY[0x263F08C38] UUID];
  v17 = _CreateFitnessJrWorkout(v18, 1, 32, 2, 900.0, 0.5);
  id v4 = [v3 setWithObject:v17];
  v21[0] = v4;
  v5 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(5)];
  v20[1] = v5;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = _CreateFitnessJrWorkout(v7, 5, 41, 2, 5400.0, 3.0);
  int64_t v9 = [v6 setWithObject:v8];
  v21[1] = v9;
  uint64_t v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(6)];
  v20[2] = v10;
  v11 = (void *)MEMORY[0x263EFFA08];
  v12 = [MEMORY[0x263F08C38] UUID];
  v13 = _CreateFitnessJrWorkout(v12, 6, 37, 1, 720.0, 1.0);
  v14 = [v11 setWithObject:v13];
  v21[2] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v15;
}

+ (id)_workoutsForFriendWithIndex:(int64_t)a3 friendUUID:(id)a4
{
  id v5 = a4;
  if (a3 <= 0) {
    int64_t v6 = -(-a3 & 3);
  }
  else {
    int64_t v6 = a3 & 3;
  }
  if (v6 == 2)
  {
    id v8 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    if (v6 == 1)
    {
      uint64_t v7 = [(id)objc_opt_class() _workoutsForFriendTwoWithFriendUUID:v5];
    }
    else
    {
      if (v6) {
        [(id)objc_opt_class() _workoutsForFitnessJrFriendTwoWithFriendUUID:v5];
      }
      else {
      uint64_t v7 = [(id)objc_opt_class() _workoutsForFriendOneWithFriendUUID:v5];
      }
    }
    id v8 = (void *)v7;
  }

  return v8;
}

+ (id)createMeWithModel:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [ASFriend alloc];
  id v5 = [(ASFriend *)v4 initWithActivitySnapshots:0 friendAchievements:0 friendWorkouts:0 contact:0 competitions:MEMORY[0x263EFFA68]];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __32__ASDemoData_createMeWithModel___block_invoke;
  v14[3] = &unk_2644E8B18;
  id v16 = &v17;
  uint64_t v7 = v6;
  v15 = v7;
  id v8 = (void *)MEMORY[0x223C38130](v14);
  int64_t v9 = [v3 startCurrentActivitySummaryQueryWithHandler:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  [v3 stopCurrentActivitySummaryQueryForClientToken:v9];
  uint64_t v10 = [NSNumber numberWithInteger:_CacheIndexForDayWithOffsetFromCurrentDay(0)];
  uint64_t v11 = v18[5];
  v23 = v10;
  v24[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [(ASFriend *)v5 setSnapshots:v12];

  _Block_object_dispose(&v17, 8);

  return v5;
}

intptr_t __32__ASDemoData_createMeWithModel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x263F0A9D0] snapshotWithActivitySummary:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_t v6 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v6);
}

+ (id)fakeAppFriendListForMarketing
{
  return (id)[a1 _fakeFriendListWithDemoFileName:@"fakefriends.plist"];
}

+ (id)fakeFirstGlanceFriendListForMarketing
{
  v2 = [a1 _fakeFriendListWithDemoFileName:@"fakefriends_firstglance.plist"];
  uint64_t v3 = objc_msgSend(v2, "hk_filter:", &__block_literal_global_11);

  return v3;
}

BOOL __51__ASDemoData_fakeFirstGlanceFriendListForMarketing__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 currentCompetition];
  BOOL v3 = [v2 stage] == 1;

  return v3;
}

+ (id)_fakeFriendListWithDemoFileName:(id)a3
{
  v108[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v90 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263F08850]);
  v85 = [NSURL fileURLWithPath:@"/var/mobile/ActivityDemoData/" isDirectory:1];
  v87 = v3;
  id v5 = [v85 URLByAppendingPathComponent:v3 isDirectory:0];
  dispatch_semaphore_t v6 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v5];
  v84 = v5;
  uint64_t v7 = [v5 path];
  v86 = v4;
  LODWORD(v4) = [v4 fileExistsAtPath:v7];

  v83 = v6;
  if (v4)
  {
    id v8 = [v6 objectForKeyedSubscript:@"demodata"];
  }
  else
  {
    uint64_t v9 = MEMORY[0x263EFFA88];
    v105[0] = @"name";
    v105[1] = @"email";
    v106[0] = @"Jane";
    v106[1] = @"janedaniels@icloud.com";
    v105[2] = @"competition";
    v105[3] = @"myScores";
    v106[2] = MEMORY[0x263EFFA88];
    v106[3] = &unk_26D051368;
    v105[4] = @"opponentScores";
    v105[5] = @"myWins";
    v106[4] = &unk_26D051380;
    v106[5] = &unk_26D051200;
    v105[6] = @"opponentWins";
    v105[7] = @"dayOfCompetition";
    v106[6] = &unk_26D051218;
    v106[7] = &unk_26D051230;
    v97 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:8];
    v107[0] = v97;
    v103[0] = @"name";
    v103[1] = @"email";
    v104[0] = @"Allen";
    v104[1] = @"abuchinski@icloud.com";
    v103[2] = @"competition";
    v103[3] = @"myScores";
    v104[2] = v9;
    v104[3] = &unk_26D051398;
    v103[4] = @"opponentScores";
    v103[5] = @"myWins";
    v104[4] = &unk_26D0513B0;
    v104[5] = &unk_26D051260;
    v103[6] = @"opponentWins";
    v103[7] = @"dayOfCompetition";
    v104[6] = &unk_26D051278;
    v104[7] = &unk_26D051290;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:8];
    v107[1] = v10;
    v101[0] = @"name";
    v101[1] = @"email";
    v102[0] = @"Emily";
    v102[1] = @"emily_parker@icloud.com";
    v101[2] = @"competition";
    v101[3] = @"myScores";
    v102[2] = MEMORY[0x263EFFA88];
    v102[3] = &unk_26D0513C8;
    v101[4] = @"opponentScores";
    v101[5] = @"myWins";
    v102[4] = &unk_26D0513E0;
    v102[5] = &unk_26D051278;
    v101[6] = @"opponentWins";
    v101[7] = @"dayOfCompetition";
    v102[6] = &unk_26D051278;
    v102[7] = &unk_26D051200;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:8];
    v107[2] = v11;
    v99[0] = @"name";
    v99[1] = @"email";
    v100[0] = @"Doug";
    v100[1] = @"doug_FAH_renheit@icloud.com";
    v99[2] = @"competition";
    v99[3] = @"myScores";
    v100[2] = MEMORY[0x263EFFA88];
    v100[3] = &unk_26D0513F8;
    v99[4] = @"opponentScores";
    v99[5] = @"myWins";
    v100[4] = &unk_26D051410;
    v100[5] = &unk_26D051278;
    v99[6] = @"opponentWins";
    v99[7] = @"dayOfCompetition";
    v100[6] = &unk_26D051260;
    v100[7] = &unk_26D051260;
    v12 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:8];
    v107[3] = v12;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:4];
  }
  if ([v8 count])
  {
    unint64_t v13 = 0;
    uint64_t v88 = *MEMORY[0x263EFDFE0];
    v89 = v8;
    do
    {
      uint64_t v14 = [MEMORY[0x263F08C38] UUID];
      uint64_t v15 = [MEMORY[0x263F08C38] UUID];
      v95 = [v8 objectAtIndexedSubscript:v13];
      id v16 = [v95 objectForKey:@"name"];
      v94 = [v8 objectAtIndexedSubscript:v13];
      uint64_t v17 = [v94 objectForKey:@"email"];
      v96 = (void *)v15;
      v18 = [(id)objc_opt_class() _activitySnapshotForFriendWithIndex:v13 friendUUID:v14 sourceUUID:v15];
      uint64_t v19 = [(id)objc_opt_class() _achievementsForFriendWithIndex:v13 friendUUID:v14];
      v98 = (void *)v14;
      v92 = [(id)objc_opt_class() _workoutsForFriendWithIndex:v13 friendUUID:v14];
      id v20 = v17;
      id v21 = v16;
      id v22 = v18;
      id v23 = v19;
      v24 = objc_alloc_init(ASContact);
      [(ASContact *)v24 setShortName:v21];
      v93 = v21;

      v25 = [MEMORY[0x263EFFA08] setWithObject:v20];
      [(ASContact *)v24 setDestinations:v25];

      uint64_t v26 = _FetchLinkedContactStoreIdentifierForEmail_onceToken;
      id v27 = v20;
      if (v26 != -1) {
        dispatch_once(&_FetchLinkedContactStoreIdentifierForEmail_onceToken, &__block_literal_global_479);
      }
      v28 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:v27];

      v29 = (void *)_FetchLinkedContactStoreIdentifierForEmail___contactStore;
      v108[0] = v88;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:1];
      v31 = [v29 unifiedContactsMatchingPredicate:v28 keysToFetch:v30 error:0];
      v32 = [v31 firstObject];

      v33 = [v32 identifier];

      [(ASContact *)v24 setLinkedContactStoreIdentifier:v33];
      uint64_t v34 = arc4random_uniform(4u) + 6;
      LODWORD(v28) = arc4random_uniform(0x3Cu);
      LODWORD(v33) = arc4random_uniform(0x18u);
      id v35 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v35 setDay:-v34];
      [v35 setMinute:-(uint64_t)v28];
      [v35 setHour:-(uint64_t)v33];
      v36 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
      v37 = [MEMORY[0x263EFF910] date];
      v38 = [v36 dateByAddingComponents:v35 toDate:v37 options:0];

      id v39 = v38;
      v40 = objc_alloc_init(ASRelationship);
      v41 = [[ASRelationshipEvent alloc] initWithType:103 anchor:0 timestamp:v39];

      v108[0] = v41;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:1];
      [(ASRelationship *)v40 setRelationshipEvents:v42];

      v43 = objc_alloc_init(ASRelationshipStorage);
      [(ASRelationshipStorage *)v43 setLegacyRelationship:v40];
      [(ASRelationshipStorage *)v43 setLegacyRemoteRelationship:v40];
      [(ASRelationship *)v40 setCloudType:1];
      [(ASRelationshipStorage *)v43 setSecureCloudRelationship:v40];
      [(ASRelationshipStorage *)v43 setSecureCloudRemoteRelationship:v40];
      [(ASContact *)v24 setRelationshipStorage:v43];
      v44 = [ASFriend alloc];
      v91 = [(ASFriend *)v44 initWithActivitySnapshots:v22 friendAchievements:v23 friendWorkouts:v92 contact:v24 competitions:MEMORY[0x263EFFA68]];

      id v8 = v89;
      v45 = [v89 objectAtIndexedSubscript:v13];
      v46 = [v45 objectForKey:@"myWins"];
      uint64_t v47 = [v46 integerValue];

      v48 = [v89 objectAtIndexedSubscript:v13];
      v49 = [v48 objectForKey:@"opponentWins"];
      uint64_t v50 = [v49 integerValue];

      v51 = _FakeHistoricalCompetitionsWithWinner(v47, 0);
      v52 = [MEMORY[0x263EFFA68] arrayByAddingObjectsFromArray:v51];

      v53 = _FakeHistoricalCompetitionsWithWinner(v50, 1);
      v54 = [v52 arrayByAddingObjectsFromArray:v53];

      v55 = [v89 objectAtIndexedSubscript:v13];
      v56 = [v55 objectForKey:@"competition"];
      LODWORD(v50) = [v56 BOOLValue];

      if (v50)
      {
        v57 = objc_alloc_init(ASCompetition);
        v58 = [v89 objectAtIndexedSubscript:v13];
        v59 = [v58 objectForKey:@"myScores"];
        [(ASCompetition *)v57 setScores:v59];

        v60 = [v89 objectAtIndexedSubscript:v13];
        v61 = [v60 objectForKey:@"opponentScores"];
        [(ASCompetition *)v57 setOpponentScores:v61];

        v62 = ASCompetitionDurationDateComponentsForNewCompetitions();
        [(ASCompetition *)v57 setDurationDateComponents:v62];

        [(ASCompetition *)v57 setMaximumNumberOfPointsPerDay:ASCompetitionMaximumPointsPerDayForNewCompetitions()];
        v63 = [v89 objectAtIndexedSubscript:v13];
        v64 = [v63 objectForKey:@"dayOfCompetition"];
        uint64_t v65 = [v64 integerValue];

        uint64_t v66 = 1 - v65;
        v67 = [MEMORY[0x263EFF8F0] currentCalendar];
        v68 = [MEMORY[0x263EFF910] date];
        v69 = [v67 dateByAddingUnit:16 value:v66 toDate:v68 options:0];

        v70 = [MEMORY[0x263EFF8F0] currentCalendar];
        v71 = _HKActivityCacheDateComponentsFromDate();
        [(ASCompetition *)v57 setStartDateComponents:v71];

        uint64_t v72 = [v54 arrayByAddingObject:v57];

        v73 = v91;
        v74 = [(ASFriend *)v91 contact];
        v75 = [v74 primaryRelationship];

        [v75 insertEventWithType:11];
        v76 = [(ASFriend *)v91 contact];
        v77 = [v76 relationshipStorage];

        objc_msgSend(v77, "updateRelationship:cloudType:", v75, objc_msgSend(v75, "cloudType"));
        v78 = [(ASFriend *)v91 contact];
        [v78 setRelationshipStorage:v77];

        v54 = (void *)v72;
        v80 = v96;
        v79 = v98;
      }
      else
      {
        v80 = v96;
        v79 = v98;
        v73 = v91;
      }
      [(ASFriend *)v73 setCompetitions:v54];
      [v90 addObject:v73];

      ++v13;
    }
    while (v13 < [v89 count]);
  }
  v81 = [MEMORY[0x263EFFA08] setWithArray:v90];

  return v81;
}

+ (id)_appleWatchSourceRevision
{
  if ([MEMORY[0x263F0A980] isAppleInternalInstall]) {
    v2 = @"iPod6,3";
  }
  else {
    v2 = @"Watch";
  }
  id v3 = [MEMORY[0x263F0A7A0] _sourceWithBundleIdentifier:@"Watch" name:@"Watch" productType:v2 options:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0A7B0]) initWithSource:v3 version:@"1"];

  return v4;
}

+ (id)_fakeAchievementDuringDayStartingAtDate:(id)a3 personUUID:(id)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v18 = a4;
  id v5 = a3;
  dispatch_semaphore_t v6 = FirstWorkoutTemplateForWorkoutActivityType();
  uint64_t v7 = [v6 uniqueName];
  v19[0] = v7;
  id v8 = FirstWorkoutTemplateForWorkoutActivityType();
  uint64_t v9 = [v8 uniqueName];
  v19[1] = v9;
  uint64_t v10 = DailyMoveRecordTemplate();
  uint64_t v11 = [v10 uniqueName];
  v19[2] = v11;
  v12 = DailyExerciseRecordTemplate();
  unint64_t v13 = [v12 uniqueName];
  void v19[3] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];

  uint64_t v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v14, "count")));
  id v16 = [MEMORY[0x263F0A9C8] achievementWithTemplateUniqueName:v15 completedDate:v5 value:&unk_26D051458 friendUUID:v18];

  return v16;
}

+ (id)_fakeWorkoutDuringDayStartingAtDate:(id)a3 personUUID:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v37[0] = xmmword_21ECAA170;
  v37[1] = xmmword_21ECAA180;
  uint64_t v38 = 3000;
  id v5 = a4;
  id v6 = a3;
  uint64_t v35 = *((void *)v37 + arc4random_uniform(4u));
  double v7 = (double)(arc4random_uniform(0xFD20u) + 21600);
  double v8 = (double)(arc4random_uniform(0x1644u) + 1500);
  uint64_t v9 = [v6 dateByAddingTimeInterval:v7];

  uint64_t v10 = [v9 dateByAddingTimeInterval:v8];
  double v11 = v8 / 20.0 * (double)(arc4random_uniform(6u) + 1);
  double v12 = v8 / 20.0 * (double)(arc4random_uniform(6u) + 1);
  unint64_t v13 = (void *)MEMORY[0x263F0A9D8];
  uint64_t v14 = (void *)MEMORY[0x263F0A630];
  uint64_t v15 = [MEMORY[0x263F0A830] kilocalorieUnit];
  id v16 = [v14 quantityWithUnit:v15 doubleValue:v11];
  uint64_t v17 = (void *)MEMORY[0x263F0A630];
  id v18 = [MEMORY[0x263F0A830] kilocalorieUnit];
  uint64_t v19 = [v17 quantityWithUnit:v18 doubleValue:v11 * 0.6];
  id v20 = (void *)MEMORY[0x263F0A630];
  id v21 = [MEMORY[0x263F0A830] meterUnit];
  id v22 = [v20 quantityWithUnit:v21 doubleValue:v12];
  LOWORD(v34) = 1;
  id v23 = v13;
  v24 = (void *)v10;
  objc_msgSend(v23, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v35, v5, v9, v10, v16, v19, v8, v22, *MEMORY[0x263F0AC20], 0, @"com.apple.SessionTrackerApp", v34, 0, 0, 1,
    0,
  v25 = 0);

  uint64_t v26 = [a1 _appleWatchSourceRevision];
  [v25 _setSourceRevision:v26];

  [v25 setGoalType:arc4random_uniform(4u)];
  uint64_t v27 = [v25 goalType];
  switch(v27)
  {
    case 3:
      double v28 = v11 + (double)arc4random_uniform((v11 * 0.75));
      v29 = (void *)MEMORY[0x263F0A630];
      uint64_t v30 = [MEMORY[0x263F0A830] kilocalorieUnit];
      break;
    case 2:
      double v28 = v12 + (double)arc4random_uniform((v12 * 0.75));
      v29 = (void *)MEMORY[0x263F0A630];
      uint64_t v30 = [MEMORY[0x263F0A830] secondUnit];
      break;
    case 1:
      double v28 = v8 + (double)arc4random_uniform((v8 * 0.75));
      v29 = (void *)MEMORY[0x263F0A630];
      uint64_t v30 = [MEMORY[0x263F0A830] meterUnit];
      break;
    default:
      goto LABEL_8;
  }
  v31 = (void *)v30;
  v32 = [v29 quantityWithUnit:v30 doubleValue:v28];
  [v25 setGoal:v32];

LABEL_8:

  return v25;
}

+ (id)_fakeWorkoutsForIndex:(int64_t)a3 personUUID:(id)a4
{
  id v6 = a4;
  double v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)a3];
  uint32_t v8 = arc4random_uniform(4u);
  for (i = [MEMORY[0x263EFF9C0] setWithCapacity:v8];
  {
    uint64_t v10 = [a1 _fakeWorkoutDuringDayStartingAtDate:v7 personUUID:v6];
    [i addObject:v10];
  }

  return i;
}

+ (id)_fakeWorkoutsForLastWeekWithPersonUUID:(id)a3 dailySnapshotProbability:(double)a4
{
  id v6 = a3;
  double v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
  uint64_t v8 = 0;
  double v9 = 1.0 - a4;
  do
  {
    if ((double)arc4random() * 2.32830644e-10 > v9)
    {
      uint64_t v10 = _CacheIndexForDayWithOffsetFromCurrentDay(v8);
      double v11 = [a1 _fakeWorkoutsForIndex:v10 personUUID:v6];
      double v12 = [NSNumber numberWithInteger:v10];
      [v7 setObject:v11 forKeyedSubscript:v12];
    }
    ++v8;
  }
  while (v8 != 7);

  return v7;
}

@end