@interface WFStartWorkoutIntentAction
+ (id)unitStringsToWorkoutGoalUnits;
+ (id)workoutActivityTypeToWorkoutIdentifier;
- (BOOL)allowsContinueInAppWhenRunningRemotely;
- (BOOL)isKjGoal:(id)a3;
- (BOOL)isKmGoal:(id)a3;
- (BOOL)isParameterHidden:(id)a3;
- (BOOL)skipsProcessingHiddenParameters;
- (id)actionForAppIdentifier:(id)a3;
- (id)appResource;
- (id)goalParameter;
- (id)goalUnitTypeFromValue:(id)a3;
- (id)goalValueFromValue:(id)a3;
- (id)identifierForActivityType:(unint64_t)a3;
- (id)kjGoalConvertedToJ:(id)a3;
- (id)kmGoalConvertedToM:(id)a3;
- (id)location;
- (id)parameterForSlot:(id)a3;
- (id)selectedAppNotSupportedError;
- (id)workoutGoalUnitTypeNumberForUnitString:(id)a3;
- (id)workoutNameForActivityType:(id)a3;
- (id)workoutTypeParameter;
- (unint64_t)normalizedWorkoutActivityType:(unint64_t)a3;
- (void)initializeParameters;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)resourceAvailabilityChanged;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFStartWorkoutIntentAction

- (id)actionForAppIdentifier:(id)a3
{
  return 0;
}

- (void)resourceAvailabilityChanged
{
  id v2 = [(WFStartWorkoutIntentAction *)self goalParameter];
  [v2 updatePossibleUnits];
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  [(WFStartWorkoutIntentAction *)&v5 wasRemovedFromWorkflow:a3];
  v4 = [(WFStartWorkoutIntentAction *)self resourceManager];
  [v4 removeTarget:self selector:sel_resourceAvailabilityChanged];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  [(WFStartWorkoutIntentAction *)&v5 wasAddedToWorkflow:a3];
  v4 = [(WFStartWorkoutIntentAction *)self resourceManager];
  [v4 addTarget:self selector:sel_resourceAvailabilityChanged];

  [(WFStartWorkoutIntentAction *)self resourceAvailabilityChanged];
}

- (void)initializeParameters
{
  v5.receiver = self;
  v5.super_class = (Class)WFStartWorkoutIntentAction;
  [(WFHandleSystemIntentAction *)&v5 initializeParameters];
  v3 = [(WFStartWorkoutIntentAction *)self goalParameter];
  v4 = [(WFStartWorkoutIntentAction *)self workoutTypeParameter];
  [v3 setAction:self];
  [v4 setAction:self];
}

- (BOOL)isParameterHidden:(id)a3
{
  id v3 = a3;
  v4 = [v3 resourceManager];
  if ([v4 resourcesRequiredForDisplayAvailable]) {
    char v5 = [v3 isHidden];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)workoutTypeParameter
{
  id v2 = [(WFStartWorkoutIntentAction *)self parameterForKey:@"workoutName"];
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (id)goalParameter
{
  id v2 = [(WFStartWorkoutIntentAction *)self parameterForKey:@"WorkoutGoal"];
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (unint64_t)normalizedWorkoutActivityType:(unint64_t)a3
{
  unint64_t v3 = 14;
  unint64_t v4 = 37;
  if (a3 != 71) {
    unint64_t v4 = a3;
  }
  if (a3 != 77) {
    unint64_t v3 = v4;
  }
  if (a3 == 70) {
    return 52;
  }
  else {
    return v3;
  }
}

- (id)selectedAppNotSupportedError
{
  v15[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = WFLocalizedString(@"Unsupported Device");
  unint64_t v4 = NSString;
  char v5 = WFLocalizedString(@"This action can only be run on Apple Watch.");
  v6 = [(WFStartWorkoutIntentAction *)self localizedName];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

  v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = *MEMORY[0x263F870B8];
  uint64_t v10 = *MEMORY[0x263F08320];
  v14[0] = *MEMORY[0x263F08338];
  v14[1] = v10;
  v15[0] = v3;
  v15[1] = v7;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v12 = [v8 errorWithDomain:v9 code:10 userInfo:v11];

  return v12;
}

- (id)identifierForActivityType:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v5 = +[WFStartWorkoutIntentAction workoutActivityTypeToWorkoutIdentifier];
  v6 = [v5 objectForKey:&unk_26F0757B0];
  unint64_t v7 = [(WFStartWorkoutIntentAction *)self normalizedWorkoutActivityType:a3];
  v8 = [NSNumber numberWithUnsignedInteger:v7];
  id v9 = [v5 objectForKey:v8];

  if (!v9)
  {
    id v9 = v6;
    uint64_t v10 = getWFActionsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "-[WFStartWorkoutIntentAction identifierForActivityType:]";
      __int16 v18 = 2050;
      unint64_t v19 = a3;
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_ERROR, "%s Failed to find an identifier for workout activity type %{public}lu", (uint8_t *)&v16, 0x16u);
    }
  }
  v11 = [NSNumber numberWithUnsignedInteger:v7];
  v12 = [v5 objectForKey:v11];
  v13 = v12;
  if (!v12) {
    v12 = v6;
  }
  id v14 = v12;

  return v14;
}

- (id)workoutGoalUnitTypeNumberForUnitString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[WFStartWorkoutIntentAction unitStringsToWorkoutGoalUnits];
  char v5 = [v4 objectForKey:v3];

  if (v5) {
    v6 = v5;
  }
  else {
    v6 = &unk_26F0756C0;
  }
  id v7 = v6;

  return v7;
}

- (id)location
{
  id v2 = [(WFStartWorkoutIntentAction *)self processedParameters];
  id v3 = [v2 objectForKey:@"workoutName"];

  if (v3)
  {
    unint64_t v4 = NSNumber;
    if ([v3 isIndoor]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    v6 = [v4 numberWithInteger:v5];
    id v7 = [v3 metadata];
    v8 = [v7 objectForKey:*MEMORY[0x263F09AE0]];
    uint64_t v9 = (int)[v8 intValue];

    if (v9 == 1)
    {
      id v10 = &unk_26F075708;
    }
    else if (v9 == 2)
    {
      id v10 = &unk_26F075720;
    }
    else
    {
      id v10 = v6;
    }
  }
  else
  {
    id v10 = &unk_26F0756C0;
  }

  return v10;
}

- (id)goalUnitTypeFromValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFStartWorkoutIntentAction *)self goalParameter];
  BOOL v6 = [(WFStartWorkoutIntentAction *)self isParameterHidden:v5];

  if (v6)
  {
    id v7 = &unk_26F0756C0;
  }
  else if ([(WFStartWorkoutIntentAction *)self isKmGoal:v4])
  {
    id v7 = &unk_26F0756D8;
  }
  else if ([(WFStartWorkoutIntentAction *)self isKjGoal:v4])
  {
    id v7 = &unk_26F0756F0;
  }
  else
  {
    v8 = [v4 unitString];
    id v7 = [(WFStartWorkoutIntentAction *)self workoutGoalUnitTypeNumberForUnitString:v8];
  }
  return v7;
}

- (id)kjGoalConvertedToJ:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08980];
  id v4 = a3;
  id v5 = [v3 alloc];
  BOOL v6 = [v4 magnitude];

  [v6 doubleValue];
  double v8 = v7;
  uint64_t v9 = [MEMORY[0x263F08CC0] kilojoules];
  id v10 = (void *)[v5 initWithDoubleValue:v9 unit:v8];

  v11 = [MEMORY[0x263F08CC0] joules];
  v12 = [v10 measurementByConvertingToUnit:v11];

  v13 = NSNumber;
  [v12 doubleValue];
  id v14 = objc_msgSend(v13, "numberWithDouble:");

  return v14;
}

- (id)kmGoalConvertedToM:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08980];
  id v4 = a3;
  id v5 = [v3 alloc];
  BOOL v6 = [v4 magnitude];

  [v6 doubleValue];
  double v8 = v7;
  uint64_t v9 = [MEMORY[0x263F08CE8] kilometers];
  id v10 = (void *)[v5 initWithDoubleValue:v9 unit:v8];

  v11 = [MEMORY[0x263F08CE8] miles];
  v12 = [v10 measurementByConvertingToUnit:v11];

  v13 = NSNumber;
  [v12 doubleValue];
  id v14 = objc_msgSend(v13, "numberWithDouble:");

  return v14;
}

- (BOOL)isKjGoal:(id)a3
{
  id v3 = [a3 unitString];
  char v4 = [v3 isEqualToString:@"kJ"];

  return v4;
}

- (BOOL)isKmGoal:(id)a3
{
  id v3 = [a3 unitString];
  char v4 = [v3 isEqualToString:@"km"];

  return v4;
}

- (id)goalValueFromValue:(id)a3
{
  id v4 = a3;
  id v5 = [(WFStartWorkoutIntentAction *)self goalParameter];
  BOOL v6 = [(WFStartWorkoutIntentAction *)self isParameterHidden:v5];

  if (v6)
  {
    double v7 = 0;
  }
  else
  {
    if ([(WFStartWorkoutIntentAction *)self isKmGoal:v4])
    {
      uint64_t v8 = [(WFStartWorkoutIntentAction *)self kmGoalConvertedToM:v4];
    }
    else
    {
      if ([(WFStartWorkoutIntentAction *)self isKjGoal:v4]) {
        [(WFStartWorkoutIntentAction *)self kjGoalConvertedToJ:v4];
      }
      else {
      uint64_t v8 = [v4 magnitude];
      }
    }
    double v7 = (void *)v8;
  }

  return v7;
}

- (id)workoutNameForActivityType:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCategorizedOtherWorkout]) {
    uint64_t v5 = [v4 auxiliaryTypeIdentifier];
  }
  else {
    uint64_t v5 = [v4 identifier];
  }
  uint64_t v6 = v5;
  double v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    id v14 = "-[WFStartWorkoutIntentAction workoutNameForActivityType:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Retrieving an identifier for workout activity type %{public}@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v8 = [(WFStartWorkoutIntentAction *)self identifierForActivityType:v6];
  id v9 = objc_alloc(MEMORY[0x263F0FFA0]);
  id v10 = [v4 localizedName];
  v11 = (void *)[v9 initWithVocabularyIdentifier:v8 spokenPhrase:v10 pronunciationHint:0];

  return v11;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, uint64_t, void))a7;
  uint64_t v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"workoutName"];

  if (v18)
  {
    uint64_t v19 = [(WFStartWorkoutIntentAction *)self workoutNameForActivityType:v13];
  }
  else
  {
    uint64_t v20 = objc_msgSend(v12, "wf_slotName");
    int v21 = [v20 isEqualToString:@"goalValue"];

    if (v21)
    {
      uint64_t v19 = [(WFStartWorkoutIntentAction *)self goalValueFromValue:v13];
    }
    else
    {
      v22 = objc_msgSend(v12, "wf_slotName");
      int v23 = [v22 isEqualToString:@"workoutGoalUnitType"];

      if (v23)
      {
        uint64_t v19 = [(WFStartWorkoutIntentAction *)self goalUnitTypeFromValue:v13];
      }
      else
      {
        v24 = objc_msgSend(v12, "wf_slotName");
        int v25 = [v24 isEqualToString:@"workoutLocationType"];

        if (!v25)
        {
          v27.receiver = self;
          v27.super_class = (Class)WFStartWorkoutIntentAction;
          [(WFHandleIntentAction *)&v27 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
          goto LABEL_10;
        }
        uint64_t v19 = [(WFStartWorkoutIntentAction *)self location];
      }
    }
  }
  v26 = (void *)v19;
  v16[2](v16, v19, 0);

LABEL_10:
}

- (id)parameterForSlot:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "wf_slotName");
  char v6 = [v5 isEqualToString:@"goalValue"];
  int v7 = [v5 isEqualToString:@"workoutGoalUnitType"];
  if ((v6 & 1) != 0 || v7)
  {
    uint64_t v8 = [(WFStartWorkoutIntentAction *)self goalParameter];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFStartWorkoutIntentAction;
    uint64_t v8 = [(WFHandleIntentAction *)&v11 parameterForSlot:v4];
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)appResource
{
  return 0;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 1;
}

+ (id)workoutActivityTypeToWorkoutIdentifier
{
  v5[77] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26F0757C8;
  v4[1] = &unk_26F0757E0;
  v5[0] = @"com.apple.intents.WorkoutNameIdentifier.AmericanFootball";
  v5[1] = @"com.apple.intents.WorkoutNameIdentifier.Archery";
  v4[2] = &unk_26F0757F8;
  v4[3] = &unk_26F075810;
  v5[2] = @"com.apple.intents.WorkoutNameIdentifier.AustralianFootball";
  v5[3] = @"com.apple.intents.WorkoutNameIdentifier.Badminton";
  v4[4] = &unk_26F075828;
  v4[5] = &unk_26F075840;
  v5[4] = @"com.apple.intents.WorkoutNameIdentifier.Barre";
  v5[5] = @"com.apple.intents.WorkoutNameIdentifier.Baseball";
  v4[6] = &unk_26F075858;
  v4[7] = &unk_26F075870;
  v5[6] = @"com.apple.intents.WorkoutNameIdentifier.Basketball";
  v5[7] = @"com.apple.intents.WorkoutNameIdentifier.Bowling";
  v4[8] = &unk_26F075888;
  v4[9] = &unk_26F0758A0;
  v5[8] = @"com.apple.intents.WorkoutNameIdentifier.Boxing";
  v5[9] = @"com.apple.intents.WorkoutNameIdentifier.Climbing";
  v4[10] = &unk_26F0758B8;
  v4[11] = &unk_26F0758D0;
  v5[10] = @"com.apple.intents.WorkoutNameIdentifier.Cooldown";
  v5[11] = @"com.apple.intents.WorkoutNameIdentifier.CoreTraining";
  v4[12] = &unk_26F0758E8;
  v4[13] = &unk_26F075900;
  v5[12] = @"com.apple.intents.WorkoutNameIdentifier.Cricket";
  v5[13] = @"com.apple.intents.WorkoutNameIdentifier.CrossCountrySkiing";
  v4[14] = &unk_26F075918;
  v4[15] = &unk_26F075930;
  v5[14] = @"com.apple.intents.WorkoutNameIdentifier.CrossTraining";
  v5[15] = @"com.apple.intents.WorkoutNameIdentifier.Curling";
  v4[16] = &unk_26F075948;
  v4[17] = &unk_26F075960;
  v5[16] = @"com.apple.intents.WorkoutNameIdentifier.Cycle";
  v5[17] = @"com.apple.intents.WorkoutNameIdentifier.Dance";
  v4[18] = &unk_26F075978;
  v4[19] = &unk_26F075990;
  v5[18] = @"com.apple.intents.WorkoutNameIdentifier.DiscSports";
  v5[19] = @"com.apple.intents.WorkoutNameIdentifier.DownhillSkiing";
  v4[20] = &unk_26F0759A8;
  v4[21] = &unk_26F0759C0;
  v5[20] = @"com.apple.intents.WorkoutNameIdentifier.Elliptical";
  v5[21] = @"com.apple.intents.WorkoutNameIdentifier.EquestrianSports";
  v4[22] = &unk_26F0759D8;
  v4[23] = &unk_26F0759F0;
  v5[22] = @"com.apple.intents.WorkoutNameIdentifier.Fencing";
  v5[23] = @"com.apple.intents.WorkoutNameIdentifier.Fishing";
  v4[24] = &unk_26F075A08;
  v4[25] = &unk_26F075A20;
  v5[24] = @"com.apple.intents.WorkoutNameIdentifier.FitnessGaming";
  v5[25] = @"com.apple.intents.WorkoutNameIdentifier.Flexibility";
  v4[26] = &unk_26F075A38;
  v4[27] = &unk_26F075A50;
  v5[26] = @"com.apple.intents.WorkoutNameIdentifier.FunctionalStrengthTraining";
  v5[27] = @"com.apple.intents.WorkoutNameIdentifier.Golf";
  v4[28] = &unk_26F075A68;
  v4[29] = &unk_26F075A80;
  v5[28] = @"com.apple.intents.WorkoutNameIdentifier.Gymnastics";
  v5[29] = @"com.apple.intents.WorkoutNameIdentifier.HandCycling";
  v4[30] = &unk_26F075A98;
  v4[31] = &unk_26F075AB0;
  v5[30] = @"com.apple.intents.WorkoutNameIdentifier.Handball";
  v5[31] = @"com.apple.intents.WorkoutNameIdentifier.HighIntensityIntervalTraining";
  v4[32] = &unk_26F075AC8;
  v4[33] = &unk_26F075AE0;
  v5[32] = @"com.apple.intents.WorkoutNameIdentifier.Hike";
  v5[33] = @"com.apple.intents.WorkoutNameIdentifier.Hockey";
  v4[34] = &unk_26F075AF8;
  v4[35] = &unk_26F075B10;
  v5[34] = @"com.apple.intents.WorkoutNameIdentifier.Hunting";
  v5[35] = @"com.apple.intents.WorkoutNameIdentifier.JumpRope";
  v4[36] = &unk_26F075B28;
  v4[37] = &unk_26F075B40;
  v5[36] = @"com.apple.intents.WorkoutNameIdentifier.Kickboxing";
  v5[37] = @"com.apple.intents.WorkoutNameIdentifier.Lacrosse";
  v4[38] = &unk_26F075B58;
  v4[39] = &unk_26F075B70;
  v5[38] = @"com.apple.intents.WorkoutNameIdentifier.MartialArts";
  v5[39] = @"com.apple.intents.WorkoutNameIdentifier.MindAndBody";
  v4[40] = &unk_26F075B88;
  v4[41] = &unk_26F0757B0;
  v5[40] = @"com.apple.intents.WorkoutNameIdentifier.MixedCardio";
  v5[41] = @"com.apple.intents.WorkoutNameIdentifier.Other";
  v4[42] = &unk_26F075BA0;
  v4[43] = &unk_26F075BB8;
  v5[42] = @"com.apple.intents.WorkoutNameIdentifier.PaddleSports";
  v5[43] = @"com.apple.intents.WorkoutNameIdentifier.Pickleball";
  v4[44] = &unk_26F075BD0;
  v4[45] = &unk_26F075BE8;
  v5[44] = @"com.apple.intents.WorkoutNameIdentifier.Pilates";
  v5[45] = @"com.apple.intents.WorkoutNameIdentifier.Play";
  v4[46] = &unk_26F075C00;
  v4[47] = &unk_26F075C18;
  v5[46] = @"com.apple.intents.WorkoutNameIdentifier.Racquetball";
  v5[47] = @"com.apple.intents.WorkoutNameIdentifier.PreparationAndRecovery";
  v4[48] = &unk_26F075C30;
  v4[49] = &unk_26F075C48;
  v5[48] = @"com.apple.intents.WorkoutNameIdentifier.Rower";
  v5[49] = @"com.apple.intents.WorkoutNameIdentifier.Rugby";
  v4[50] = &unk_26F075C60;
  v4[51] = &unk_26F075C78;
  v5[50] = @"com.apple.intents.WorkoutNameIdentifier.Run";
  v5[51] = @"com.apple.intents.WorkoutNameIdentifier.Sailing";
  v4[52] = &unk_26F075C90;
  v4[53] = &unk_26F075CA8;
  v5[52] = @"com.apple.intents.WorkoutNameIdentifier.SkatingSports";
  v5[53] = @"com.apple.intents.WorkoutNameIdentifier.SnowSports";
  v4[54] = &unk_26F075CC0;
  v4[55] = &unk_26F075CD8;
  v5[54] = @"com.apple.intents.WorkoutNameIdentifier.Snowboarding";
  v5[55] = @"com.apple.intents.WorkoutNameIdentifier.Soccer";
  v4[56] = &unk_26F075CF0;
  v4[57] = &unk_26F075D08;
  v5[56] = @"com.apple.intents.WorkoutNameIdentifier.SocialDance";
  v5[57] = @"com.apple.intents.WorkoutNameIdentifier.CardioDance";
  v4[58] = &unk_26F075D20;
  v4[59] = &unk_26F075D38;
  v5[58] = @"com.apple.intents.WorkoutNameIdentifier.Softball";
  v5[59] = @"com.apple.intents.WorkoutNameIdentifier.Squash";
  v4[60] = &unk_26F075D50;
  v4[61] = &unk_26F075D68;
  v5[60] = @"com.apple.intents.WorkoutNameIdentifier.StairsClimbing";
  v5[61] = @"com.apple.intents.WorkoutNameIdentifier.Stairs";
  v4[62] = &unk_26F075D80;
  v4[63] = &unk_26F075D98;
  v5[62] = @"com.apple.intents.WorkoutNameIdentifier.StepTraining";
  v5[63] = @"com.apple.intents.WorkoutNameIdentifier.SurfingSports";
  v4[64] = &unk_26F075DB0;
  v5[64] = @"com.apple.intents.WorkoutNameIdentifier.Swim";
  v4[65] = &unk_26F075DC8;
  v5[65] = @"com.apple.intents.WorkoutNameIdentifier.TableTennis";
  v4[66] = &unk_26F075DE0;
  v5[66] = @"com.apple.intents.WorkoutNameIdentifier.TaiChi";
  v4[67] = &unk_26F075DF8;
  v5[67] = @"com.apple.intents.WorkoutNameIdentifier.Tennis";
  v4[68] = &unk_26F075E10;
  v5[68] = @"com.apple.intents.WorkoutNameIdentifier.TrackAndField";
  v4[69] = &unk_26F075E28;
  v5[69] = @"com.apple.intents.WorkoutNameIdentifier.Volleyball";
  v4[70] = &unk_26F075E40;
  v5[70] = @"com.apple.intents.WorkoutNameIdentifier.Walk";
  v4[71] = &unk_26F075E58;
  v5[71] = @"com.apple.intents.WorkoutNameIdentifier.WaterFitness";
  v4[72] = &unk_26F075E70;
  v5[72] = @"com.apple.intents.WorkoutNameIdentifier.WaterPolo";
  v4[73] = &unk_26F075E88;
  v5[73] = @"com.apple.intents.WorkoutNameIdentifier.WaterSports";
  v4[74] = &unk_26F075EA0;
  v5[74] = @"com.apple.intents.WorkoutNameIdentifier.Wrestling";
  v4[75] = &unk_26F075EB8;
  v5[75] = @"com.apple.intents.WorkoutNameIdentifier.Yoga";
  v4[76] = &unk_26F075ED0;
  v5[76] = @"com.apple.intents.WorkoutNameIdentifier.TraditionalStrengthTraining";
  id v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:77];
  return v2;
}

+ (id)unitStringsToWorkoutGoalUnits
{
  return &unk_26F076A18;
}

@end