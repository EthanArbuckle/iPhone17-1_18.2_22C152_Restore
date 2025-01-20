@interface HKActivitySummary(Fitness)
- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:;
- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:requiredDelta:;
@end

@implementation HKActivitySummary(Fitness)

- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:
{
  LODWORD(a3) = 1.0;
  return objc_msgSend(a1, "isNoticeablyDifferentFromActivitySummary:comparingGoalTypes:userActiveEnergyBurnedUnit:requiredDelta:", a3);
}

- (uint64_t)isNoticeablyDifferentFromActivitySummary:()Fitness comparingGoalTypes:userActiveEnergyBurnedUnit:requiredDelta:
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10) {
    goto LABEL_26;
  }
  if (v11 && ([v11 containsObject:&unk_26CD11CB8] & 1) == 0)
  {
    if (![v11 containsObject:&unk_26CD11CD0]) {
      goto LABEL_19;
    }
    char v13 = 0;
  }
  else
  {
    char v13 = 1;
  }
  if ([a1 activityMoveMode] == 2)
  {
    id v14 = [MEMORY[0x263F0A830] minuteUnit];
  }
  else
  {
    id v14 = v12;
  }
  v15 = v14;
  if ([a1 activityMoveMode] == 2) {
    [a1 appleMoveTime];
  }
  else {
  v16 = [a1 activeEnergyBurned];
  }
  if ([a1 activityMoveMode] == 2) {
    [v10 appleMoveTime];
  }
  else {
  v17 = [v10 activeEnergyBurned];
  }
  [v16 doubleValueForUnit:v15];
  double v19 = v18;
  [v17 doubleValueForUnit:v15];
  float v20 = v19;
  *(float *)&double v21 = v21;
  *(float *)&double v19 = vabds_f32(floorf(v20), floorf(*(float *)&v21));

  if (*(float *)&v19 >= a2) {
    goto LABEL_26;
  }
  if (v13)
  {
    char v22 = 1;
    goto LABEL_21;
  }
LABEL_19:
  if (![v11 containsObject:&unk_26CD11CE8]) {
    goto LABEL_23;
  }
  char v22 = 0;
LABEL_21:
  v23 = [MEMORY[0x263F0A830] minuteUnit];
  v24 = [a1 appleExerciseTime];
  [v24 doubleValueForUnit:v23];
  double v26 = v25;

  v27 = [v10 appleExerciseTime];
  [v27 doubleValueForUnit:v23];
  double v29 = v28;

  float v30 = v26;
  float v31 = v29;
  *(float *)&double v26 = vabds_f32(floorf(v30), floorf(v31));

  if (*(float *)&v26 >= a2) {
    goto LABEL_26;
  }
  if (v22)
  {
LABEL_24:
    v32 = [MEMORY[0x263F0A830] countUnit];
    v33 = [a1 appleStandHours];
    [v33 doubleValueForUnit:v32];
    double v35 = v34;

    v36 = [v10 appleStandHours];
    [v36 doubleValueForUnit:v32];
    double v38 = v37;

    float v39 = v35;
    float v40 = v38;
    *(float *)&double v35 = vabds_f32(floorf(v39), floorf(v40));

    if (*(float *)&v35 < a2) {
      goto LABEL_25;
    }
LABEL_26:
    uint64_t v41 = 1;
    goto LABEL_27;
  }
LABEL_23:
  if ([v11 containsObject:&unk_26CD11D00]) {
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v41 = 0;
LABEL_27:

  return v41;
}

@end