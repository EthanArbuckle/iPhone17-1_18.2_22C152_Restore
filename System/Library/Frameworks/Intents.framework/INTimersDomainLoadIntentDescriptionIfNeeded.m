@interface INTimersDomainLoadIntentDescriptionIfNeeded
@end

@implementation INTimersDomainLoadIntentDescriptionIfNeeded

void ___INTimersDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v88[7] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v75 = [[INIntentSlotDescription alloc] initWithName:@"label", 3, @"label", @"label", 0, 0, 12, 1, &unk_1EDBAA680, &unk_1EDBAA698, objc_opt_class(), sel_resolveLabelForCreateTimer_withCompletion_, sel_resolveLabelForCreateTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[0] = v75;
  v74 = [[INIntentSlotDescription alloc] initWithName:@"duration", 2, @"duration", @"duration", 0, 0, 3, 1, &unk_1EDBAA6B0, &unk_1EDBAA6C8, objc_opt_class(), sel_resolveDurationForCreateTimer_withCompletion_, sel_resolveDurationForCreateTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[1] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"type", 4, @"type", @"type", 0, 0, 191, 1, &unk_1EDBAA6E0, &unk_1EDBAA6F8, objc_opt_class(), sel_resolveTypeForCreateTimer_withCompletion_, sel_resolveTypeForCreateTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v87[2] = v73;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  v71 = _INIntentSchemaBuildIntentSlotDescriptionMap(v72);
  v70 = [(INIntentDescription *)v0 initWithName:@"CreateTimerIntent" responseName:@"CreateTimerIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.timer.CreateTimerIntent" isPrivate:0 handleSelector:sel_handleCreateTimer_completion_ confirmSelector:sel_confirmCreateTimer_completion_ slotsByName:v71];
  v88[0] = v70;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v69 = [[INIntentSlotDescription alloc] initWithName:@"targetTimer", 3, @"targetTimer", @"targetTimer", 0, 0, 189, 1, &unk_1EDBAA710, &unk_1EDBAA728, objc_opt_class(), sel_resolveTargetTimerForDeleteTimer_withCompletion_, sel_resolveTargetTimerForDeleteTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[0] = v69;
  v68 = [[INIntentSlotDescription alloc] initWithName:@"deleteMultiple", 2, @"deleteMultiple", @"deleteMultiple", 0, 0, 1, 1, &unk_1EDBAA740, &unk_1EDBAA758, objc_opt_class(), sel_resolveDeleteMultipleForDeleteTimer_withCompletion_, sel_resolveDeleteMultipleForDeleteTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v86[1] = v68;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:2];
  v66 = _INIntentSchemaBuildIntentSlotDescriptionMap(v67);
  v65 = [(INIntentDescription *)v3 initWithName:@"DeleteTimerIntent" responseName:@"DeleteTimerIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.timer.DeleteTimerIntent" isPrivate:0 handleSelector:sel_handleDeleteTimer_completion_ confirmSelector:sel_confirmDeleteTimer_completion_ slotsByName:v66];
  v88[1] = v65;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v64 = [[INIntentSlotDescription alloc] initWithName:@"targetTimer", 3, @"targetTimer", @"targetTimer", 0, 0, 189, 1, &unk_1EDBAA770, &unk_1EDBAA788, objc_opt_class(), sel_resolveTargetTimerForPauseTimer_withCompletion_, sel_resolveTargetTimerForPauseTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v85[0] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"pauseMultiple", 2, @"pauseMultiple", @"pauseMultiple", 0, 0, 1, 1, &unk_1EDBAA7A0, &unk_1EDBAA7B8, objc_opt_class(), sel_resolvePauseMultipleForPauseTimer_withCompletion_, sel_resolvePauseMultipleForPauseTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v85[1] = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v60 = [(INIntentDescription *)v6 initWithName:@"PauseTimerIntent" responseName:@"PauseTimerIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.timer.PauseTimerIntent" isPrivate:0 handleSelector:sel_handlePauseTimer_completion_ confirmSelector:sel_confirmPauseTimer_completion_ slotsByName:v61];
  v88[2] = v60;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v59 = [[INIntentSlotDescription alloc] initWithName:@"targetTimer", 3, @"targetTimer", @"targetTimer", 0, 0, 189, 1, &unk_1EDBAA7D0, &unk_1EDBAA7E8, objc_opt_class(), sel_resolveTargetTimerForResetTimer_withCompletion_, sel_resolveTargetTimerForResetTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[0] = v59;
  v58 = [[INIntentSlotDescription alloc] initWithName:@"resetMultiple", 2, @"resetMultiple", @"resetMultiple", 0, 0, 1, 1, &unk_1EDBAA800, &unk_1EDBAA818, objc_opt_class(), sel_resolveResetMultipleForResetTimer_withCompletion_, sel_resolveResetMultipleForResetTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v84[1] = v58;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
  v56 = _INIntentSchemaBuildIntentSlotDescriptionMap(v57);
  v55 = [(INIntentDescription *)v9 initWithName:@"ResetTimerIntent" responseName:@"ResetTimerIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.timer.ResetTimerIntent" isPrivate:0 handleSelector:sel_handleResetTimer_completion_ confirmSelector:sel_confirmResetTimer_completion_ slotsByName:v56];
  v88[3] = v55;
  v12 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v54 = [[INIntentSlotDescription alloc] initWithName:@"targetTimer", 3, @"targetTimer", @"targetTimer", 0, 0, 189, 1, &unk_1EDBAA830, &unk_1EDBAA848, objc_opt_class(), sel_resolveTargetTimerForResumeTimer_withCompletion_, sel_resolveTargetTimerForResumeTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v83[0] = v54;
  v53 = [[INIntentSlotDescription alloc] initWithName:@"resumeMultiple", 2, @"resumeMultiple", @"resumeMultiple", 0, 0, 1, 1, &unk_1EDBAA860, &unk_1EDBAA878, objc_opt_class(), sel_resolveResumeMultipleForResumeTimer_withCompletion_, sel_resolveResumeMultipleForResumeTimer_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v83[1] = v53;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
  v51 = _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v50 = [(INIntentDescription *)v12 initWithName:@"ResumeTimerIntent" responseName:@"ResumeTimerIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.timer.ResumeTimerIntent" isPrivate:0 handleSelector:sel_handleResumeTimer_completion_ confirmSelector:sel_confirmResumeTimer_completion_ slotsByName:v51];
  v88[4] = v50;
  v15 = [INIntentDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v49 = [[INIntentSlotDescription alloc] initWithName:@"label", 2, @"label", @"label", 0, 0, 12, 1, &unk_1EDBAA890, &unk_1EDBAA8A8, objc_opt_class(), sel_resolveLabelForSearchForTimers_withCompletion_, sel_resolveLabelForSearchForTimers_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[0] = v49;
  v48 = [[INIntentSlotDescription alloc] initWithName:@"duration", 3, @"duration", @"duration", 0, 0, 3, 1, &unk_1EDBAA8C0, &unk_1EDBAA8D8, objc_opt_class(), sel_resolveDurationForSearchForTimers_withCompletion_, sel_resolveDurationForSearchForTimers_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[1] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"state", 4, @"state", @"state", 0, 0, 190, 1, &unk_1EDBAA8F0, &unk_1EDBAA908, objc_opt_class(), sel_resolveStateForSearchForTimers_withCompletion_, sel_resolveStateForSearchForTimers_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[2] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"type", 5, @"type", @"type", 0, 0, 191, 1, &unk_1EDBAA920, &unk_1EDBAA938, objc_opt_class(), sel_resolveTypeForSearchForTimers_withCompletion_, sel_resolveTypeForSearchForTimers_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[3] = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:4];
  v44 = _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v18 = [(INIntentDescription *)v15 initWithName:@"SearchForTimersIntent" responseName:@"SearchForTimersIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.timer.SearchForTimersIntent" isPrivate:0 handleSelector:sel_handleSearchForTimers_completion_ confirmSelector:sel_confirmSearchForTimers_completion_ slotsByName:v44];
  v88[5] = v18;
  v43 = [INIntentDescription alloc];
  uint64_t v42 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = [[INIntentSlotDescription alloc] initWithName:@"targetTimer", 2, @"targetTimer", @"targetTimer", 0, 0, 189, 1, &unk_1EDBAA950, &unk_1EDBAA968, objc_opt_class(), sel_resolveTargetTimerForSetTimerAttribute_withCompletion_, sel_resolveTargetTimerForSetTimerAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v81[0] = v20;
  v21 = [[INIntentSlotDescription alloc] initWithName:@"toDuration", 3, @"toDuration", @"toDuration", 0, 0, 3, 1, &unk_1EDBAA980, &unk_1EDBAA998, objc_opt_class(), sel_resolveToDurationForSetTimerAttribute_withCompletion_, sel_resolveToDurationForSetTimerAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v81[1] = v21;
  v22 = [[INIntentSlotDescription alloc] initWithName:@"toLabel", 4, @"toLabel", @"toLabel", 0, 0, 12, 1, &unk_1EDBAA9B0, &unk_1EDBAA9C8, objc_opt_class(), sel_resolveToLabelForSetTimerAttribute_withCompletion_, sel_resolveToLabelForSetTimerAttribute_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v81[2] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:3];
  v24 = _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v25 = [(INIntentDescription *)v43 initWithName:@"SetTimerAttributeIntent" responseName:@"SetTimerAttributeIntentResponse" facadeClass:v42 dataClass:v19 type:@"sirikit.intent.timer.SetTimerAttributeIntent" isPrivate:0 handleSelector:sel_handleSetTimerAttribute_completion_ confirmSelector:sel_confirmSetTimerAttribute_completion_ slotsByName:v24];
  v88[6] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:7];

  uint64_t v27 = [v26 count];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v27];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v27];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v30 = v26;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v77 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v36 = [v35 name];
        [v28 setObject:v35 forKey:v36];

        v37 = [v35 type];
        [v29 setObject:v35 forKey:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v76 objects:v80 count:16];
    }
    while (v32);
  }

  uint64_t v38 = [v28 copy];
  v39 = (void *)sTimersDomain_intentDescsByName;
  sTimersDomain_intentDescsByName = v38;

  uint64_t v40 = [v29 copy];
  v41 = (void *)sTimersDomain_intentDescsByType;
  sTimersDomain_intentDescsByType = v40;
}

@end