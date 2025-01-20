@interface ACHBuiltinTemplateSource
- (BOOL)sourceShouldRunForDate:(id)a3;
- (NSString)identifier;
- (id)localizationBundleURLForTemplate:(id)a3;
- (id)propertyListBundleURLForTemplate:(id)a3;
- (id)resourceBundleURLForTemplate:(id)a3;
- (id)stickerBundleURLForTemplate:(id)a3;
- (int64_t)runCadence;
- (void)templatesForDate:(id)a3 completion:(id)a4;
@end

@implementation ACHBuiltinTemplateSource

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x263F23610];
}

- (int64_t)runCadence
{
  return 1;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  v107[16] = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v43 = a4;
  id v42 = objc_alloc(MEMORY[0x263EFF9C0]);
  v93 = NewMoveGoalAchievedTemplate();
  v95 = DailyMoveRecordTemplate();
  v89 = NewMoveTimeGoalAchievedTemplate();
  v91 = DailyMoveTimeRecordTemplate();
  v85 = DailyExerciseRecordTemplate();
  v87 = LongestMoveStreakTemplate();
  v81 = MoveGoal200PercentTemplate();
  v83 = MoveGoal300PercentTemplate();
  v79 = MoveGoal400PercentTemplate();
  v80 = PerfectWeekMoveTemplate();
  v77 = PerfectWeekExerciseTemplate();
  v78 = PerfectWeekStandTemplate();
  v75 = PerfectWeekAllTemplate();
  v76 = HundredMoveGoals();
  v73 = ThreeHundredSixtyFiveMoveGoals();
  v74 = FiveHundredMoveGoals();
  v71 = ThousandMoveGoals();
  v72 = TwelveFiftyMoveGoals();
  v69 = FifteenHundredMoveGoals();
  v70 = SeventeenFiftyMoveGoals();
  v67 = TwoThousandMoveGoals();
  v68 = TwentyTwoFiftyMoveGoals();
  v65 = TwentyFiveHundredMoveGoals();
  v66 = TwentySevenFiftyMoveGoals();
  v63 = ThreeThousandMoveGoals();
  v64 = ThreeThousandTwoHundredFiftyMoveGoals();
  v61 = ThreeThousandFiveHundredMoveGoals();
  v62 = ThreeThousandSevenHundredFiftyMoveGoals();
  v59 = FourThousandMoveGoals();
  v60 = SevenWorkoutWeekTemplate();
  v58 = FiftyMilesCyclingWorkout();
  v57 = FiftyKilometersCyclingWorkout();
  v56 = OneHundredMilesCyclingWorkout();
  v55 = OneHundredKilometersCyclingWorkout();
  v54 = HalfMarathonWorkout();
  v53 = WheelchairHalfMarathonWorkout();
  v52 = FastestHalfMarathonWorkout();
  v51 = FastestWheelchairHalfMarathonWorkout();
  v50 = MarathonWorkout();
  v49 = WheelchairMarathonWorkout();
  v48 = FastestMarathonWorkout();
  v47 = FastestWheelchairMarathonWorkout();
  v46 = DuathlonWorkout();
  v45 = SprintTriathlonWorkout();
  v5 = FiftyKilometerTriathlonWorkout();
  v6 = HalfDistanceTriathlonWorkout();
  v7 = FullDistanceTriathlonWorkout();
  v8 = Best5KDuration();
  v41 = Best10KDuration();
  v9 = BestWheelchair5KDuration();
  v10 = BestWheelchair10KDuration();
  v11 = FiveKilometerWorkout();
  v12 = TenKilometerWorkout();
  v13 = FiveKilometerWheelchairWorkout();
  v40 = TenKilometerWheelchairWorkout();
  v14 = objc_msgSend(v42, "initWithObjects:", v93, v95, v89, v91, v85, v87, v81, v83, v79, v80, v77, v78, v75, v76, v73, v74, v71,
                  v72,
                  v69,
                  v70,
                  v67,
                  v68,
                  v65,
                  v66,
                  v63,
                  v64,
                  v61,
                  v62,
                  v59,
                  v60,
                  v58,
                  v57,
                  v56,
                  v55,
                  v54,
                  v53,
                  v52,
                  v51,
                  v50,
                  v49,
                  v48,
                  v47,
                  v46,
                  v45,
                  v5,
                  v6,
                  v7,
                  v8,
                  v41,
                  v9,
                  v10,
                  v11,
                  v12,
                  v13,
                  v40,
                  0);

  if (_os_feature_enabled_impl())
  {
    v96 = HundredAllGoals();
    v107[0] = v96;
    v94 = ThreeHundredSixtyFiveAllGoals();
    v107[1] = v94;
    v92 = FiveHundredAllGoals();
    v107[2] = v92;
    v90 = ThousandAllGoals();
    v107[3] = v90;
    v88 = TwelveFiftyAllGoals();
    v107[4] = v88;
    v86 = FifteenHundredAllGoals();
    v107[5] = v86;
    v84 = SeventeenFiftyAllGoals();
    v107[6] = v84;
    v82 = TwoThousandAllGoals();
    v107[7] = v82;
    v15 = TwentyTwoFiftyAllGoals();
    v107[8] = v15;
    v16 = TwentyFiveHundredAllGoals();
    v107[9] = v16;
    v17 = TwentySevenFiftyAllGoals();
    v107[10] = v17;
    v18 = ThreeThousandAllGoals();
    v107[11] = v18;
    v19 = ThreeThousandTwoHundredFiftyAllGoals();
    v107[12] = v19;
    v20 = ThreeThousandFiveHundredAllGoals();
    v107[13] = v20;
    v21 = ThreeThousandSevenHundredFiftyAllGoals();
    v107[14] = v21;
    v22 = FourThousandAllGoals();
    v107[15] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:16];
    [v14 addObjectsFromArray:v23];
  }
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v24 = (id)*MEMORY[0x263F23508];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v101 objects:v106 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v102 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        v30 = (void *)MEMORY[0x223C50570]();
        [v29 unsignedIntegerValue];
        v31 = FirstWorkoutTemplateForWorkoutActivityType();
        [v14 addObject:v31];

        v32 = BestWorkoutEnergyBurnedTemplateForWorkoutActivityType();
        [v14 addObject:v32];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v101 objects:v106 count:16];
    }
    while (v26);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v33 = [&unk_26D116448 countByEnumeratingWithState:&v97 objects:v105 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v98 != v35) {
          objc_enumerationMutation(&unk_26D116448);
        }
        [*(id *)(*((void *)&v97 + 1) + 8 * j) unsignedIntegerValue];
        v37 = BestWorkoutDistanceTemplateForWorkoutActivityType();
        [v14 addObject:v37];
      }
      uint64_t v34 = [&unk_26D116448 countByEnumeratingWithState:&v97 objects:v105 count:16];
    }
    while (v34);
  }
  v38 = BestWorkoutElevationGainedTemplateForWorkoutActivityType();
  [v14 addObject:v38];

  if (v43)
  {
    v39 = (void *)[v14 copy];
    (*((void (**)(id, void *, void, void))v43 + 2))(v43, v39, 0, 0);
  }
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  v3 = [a3 uniqueName];
  v4 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:v3];
  v5 = [v4 stringByAppendingPathComponent:@"localization"];

  v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  v3 = [a3 uniqueName];
  v4 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:v3];
  v5 = [v4 stringByAppendingPathComponent:@"badgemodel"];

  v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  v3 = [a3 uniqueName];
  v4 = [(id)*MEMORY[0x263F235E8] stringByAppendingPathComponent:v3];
  v5 = [v4 stringByAppendingPathComponent:@"badgeproperties"];

  v6 = [NSURL fileURLWithPath:v5];

  return v6;
}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

@end