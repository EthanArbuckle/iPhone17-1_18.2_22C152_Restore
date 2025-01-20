@interface INWorkoutsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INWorkoutsDomainLoadIntentDescriptionIfNeeded

void ___INWorkoutsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v70[5] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v59 = [[INIntentSlotDescription alloc] initWithName:@"workoutName", 2, @"workoutName", @"workoutName", 0, 0, 12, 1, &unk_1EDBAAD10, &unk_1EDBAAD28, objc_opt_class(), sel_resolveWorkoutNameForCancelWorkout_withCompletion_, sel_resolveWorkoutNameForCancelWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v69 = v59;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v57 = _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v56 = [(INIntentDescription *)v0 initWithName:@"CancelWorkoutIntent" responseName:@"CancelWorkoutIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.fitness.CancelWorkoutIntent" isPrivate:0 handleSelector:sel_handleCancelWorkout_completion_ confirmSelector:sel_confirmCancelWorkout_completion_ slotsByName:v57];
  v70[0] = v56;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v55 = [[INIntentSlotDescription alloc] initWithName:@"workoutName", 2, @"workoutName", @"workoutName", 0, 0, 12, 1, &unk_1EDBAAD40, &unk_1EDBAAD58, objc_opt_class(), sel_resolveWorkoutNameForEndWorkout_withCompletion_, sel_resolveWorkoutNameForEndWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v68 = v55;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  v53 = _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v52 = [(INIntentDescription *)v3 initWithName:@"EndWorkoutIntent" responseName:@"EndWorkoutIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.fitness.EndWorkoutIntent" isPrivate:0 handleSelector:sel_handleEndWorkout_completion_ confirmSelector:sel_confirmEndWorkout_completion_ slotsByName:v53];
  v70[1] = v52;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v51 = [[INIntentSlotDescription alloc] initWithName:@"workoutName", 2, @"workoutName", @"workoutName", 0, 0, 12, 1, &unk_1EDBAAD70, &unk_1EDBAAD88, objc_opt_class(), sel_resolveWorkoutNameForPauseWorkout_withCompletion_, sel_resolveWorkoutNameForPauseWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67 = v51;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
  v49 = _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v48 = [(INIntentDescription *)v6 initWithName:@"PauseWorkoutIntent" responseName:@"PauseWorkoutIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.fitness.PauseWorkoutIntent" isPrivate:0 handleSelector:sel_handlePauseWorkout_completion_ confirmSelector:sel_confirmPauseWorkout_completion_ slotsByName:v49];
  v70[2] = v48;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v47 = [[INIntentSlotDescription alloc] initWithName:@"workoutName", 2, @"workoutName", @"workoutName", 0, 0, 12, 1, &unk_1EDBAADA0, &unk_1EDBAADB8, objc_opt_class(), sel_resolveWorkoutNameForResumeWorkout_withCompletion_, sel_resolveWorkoutNameForResumeWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v66 = v47;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
  v45 = _INIntentSchemaBuildIntentSlotDescriptionMap(v46);
  v44 = [(INIntentDescription *)v9 initWithName:@"ResumeWorkoutIntent" responseName:@"ResumeWorkoutIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.fitness.ResumeWorkoutIntent" isPrivate:0 handleSelector:sel_handleResumeWorkout_completion_ confirmSelector:sel_confirmResumeWorkout_completion_ slotsByName:v45];
  v70[3] = v44;
  v42 = [INIntentDescription alloc];
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v43 = [[INIntentSlotDescription alloc] initWithName:@"workoutName", 2, @"workoutName", @"workoutName", 0, 0, 12, 1, &unk_1EDBAADD0, &unk_1EDBAADE8, objc_opt_class(), sel_resolveWorkoutNameForStartWorkout_withCompletion_, sel_resolveWorkoutNameForStartWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[0] = v43;
  v39 = [[INIntentSlotDescription alloc] initWithName:@"goalValue", 3, @"goalValue", @"goalValue", 0, 0, 21, 1, &unk_1EDBAAE00, &unk_1EDBAAE18, objc_opt_class(), sel_resolveGoalValueForStartWorkout_withCompletion_, sel_resolveGoalValueForStartWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[1] = v39;
  v38 = [[INIntentSlotDescription alloc] initWithName:@"workoutGoalUnitType", 4, @"workoutGoalUnitType", @"workoutGoalUnitType", 0, 0, 115, 1, &unk_1EDBAAE30, &unk_1EDBAAE48, objc_opt_class(), sel_resolveWorkoutGoalUnitTypeForStartWorkout_withCompletion_, sel_resolveWorkoutGoalUnitTypeForStartWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[2] = v38;
  v37 = [[INIntentSlotDescription alloc] initWithName:@"workoutLocationType", 5, @"workoutLocationType", @"workoutLocationType", 0, 0, 116, 1, &unk_1EDBAAE60, &unk_1EDBAAE78, objc_opt_class(), sel_resolveWorkoutLocationTypeForStartWorkout_withCompletion_, sel_resolveWorkoutLocationTypeForStartWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[3] = v37;
  v12 = [[INIntentSlotDescription alloc] initWithName:@"isOpenEnded", 6, @"isOpenEnded", @"isOpenEnded", 0, 0, 1, 1, &unk_1EDBAAE90, &unk_1EDBAAEA8, objc_opt_class(), sel_resolveIsOpenEndedForStartWorkout_withCompletion_, sel_resolveIsOpenEndedForStartWorkout_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[4] = v12;
  v13 = [[INIntentSlotDescription alloc] initWithName:@"associatedItems" tag:7 facadePropertyName:@"associatedItems" dataPropertyName:@"associatedItems" isExtended:0 isPrivate:1 valueType:117 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v65[5] = v13;
  v14 = [[INIntentSlotDescription alloc] initWithName:@"isBuiltInWorkoutType" tag:8 facadePropertyName:@"isBuiltInWorkoutType" dataPropertyName:@"isBuiltInWorkoutType" isExtended:0 isPrivate:1 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v65[6] = v14;
  v15 = [[INIntentSlotDescription alloc] initWithName:@"isVoiceOnly" tag:9 facadePropertyName:@"isVoiceOnly" dataPropertyName:@"isVoiceOnly" isExtended:0 isPrivate:1 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v65[7] = v15;
  v16 = [[INIntentSlotDescription alloc] initWithName:@"sequenceLabel" tag:10 facadePropertyName:@"sequenceLabel" dataPropertyName:@"sequenceLabel" isExtended:0 isPrivate:1 valueType:118 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v65[8] = v16;
  v17 = [[INIntentSlotDescription alloc] initWithName:@"customization" tag:11 facadePropertyName:@"customization" dataPropertyName:@"customization" isExtended:0 isPrivate:1 valueType:119 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v65[9] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:10];
  v19 = _INIntentSchemaBuildIntentSlotDescriptionMap(v18);
  v20 = [(INIntentDescription *)v42 initWithName:@"StartWorkoutIntent" responseName:@"StartWorkoutIntentResponse" facadeClass:v41 dataClass:v40 type:@"sirikit.intent.fitness.StartWorkoutIntent" isPrivate:0 handleSelector:sel_handleStartWorkout_completion_ confirmSelector:sel_confirmStartWorkout_completion_ slotsByName:v19];
  v70[4] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:5];

  uint64_t v22 = [v21 count];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v61 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        v31 = [v30 name];
        [v23 setObject:v30 forKey:v31];

        v32 = [v30 type];
        [v24 setObject:v30 forKey:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v23 copy];
  v34 = (void *)sWorkoutsDomain_intentDescsByName;
  sWorkoutsDomain_intentDescsByName = v33;

  uint64_t v35 = [v24 copy];
  v36 = (void *)sWorkoutsDomain_intentDescsByType;
  sWorkoutsDomain_intentDescsByType = v35;
}

@end