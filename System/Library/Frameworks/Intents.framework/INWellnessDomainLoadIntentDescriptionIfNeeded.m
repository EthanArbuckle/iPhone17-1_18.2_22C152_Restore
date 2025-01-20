@interface INWellnessDomainLoadIntentDescriptionIfNeeded
@end

@implementation INWellnessDomainLoadIntentDescriptionIfNeeded

void ___INWellnessDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v54[3] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v45 = [[INIntentSlotDescription alloc] initWithName:@"sampleUuids", 2, @"sampleUuids", @"sampleUuids", 0, 0, 30, 3, &unk_1EDBAAAA0, &unk_1EDBAAAB8, objc_opt_class(), sel_resolveSampleUuidsForDeleteHealthSample_withCompletion_, sel_resolveSampleUuidsForDeleteHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53 = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v42 = [(INIntentDescription *)v0 initWithName:@"DeleteHealthSampleIntent" responseName:@"DeleteHealthSampleIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.wellness.DeleteHealthSampleIntent" isPrivate:0 handleSelector:sel_handleDeleteHealthSample_completion_ confirmSelector:sel_confirmDeleteHealthSample_completion_ slotsByName:v43];
  v54[0] = v42;
  v32 = [INIntentDescription alloc];
  uint64_t v30 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  v41 = [[INIntentSlotDescription alloc] initWithName:@"objectType", 2, @"objectType", @"objectType", 0, 0, 172, 1, &unk_1EDBAAAD0, &unk_1EDBAAAE8, objc_opt_class(), sel_resolveObjectTypeForQueryHealthSample_withCompletion_, sel_resolveObjectTypeForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[0] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"recordDate", 3, @"recordDates", @"recordDates", 0, 0, 16, 3, &unk_1EDBAAB00, &unk_1EDBAAB18, objc_opt_class(), sel_resolveRecordDatesForQueryHealthSample_withCompletion_, sel_resolveRecordDatesForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[1] = v40;
  v39 = [[INIntentSlotDescription alloc] initWithName:@"unit", 4, @"unit", @"unit", 0, 0, 174, 1, &unk_1EDBAAB30, &unk_1EDBAAB48, objc_opt_class(), sel_resolveUnitForQueryHealthSample_withCompletion_, sel_resolveUnitForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[2] = v39;
  v38 = [[INIntentSlotDescription alloc] initWithName:@"questionType", 5, @"questionType", @"questionType", 0, 0, 177, 1, &unk_1EDBAAB60, &unk_1EDBAAB78, objc_opt_class(), sel_resolveQuestionTypeForQueryHealthSample_withCompletion_, sel_resolveQuestionTypeForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[3] = v38;
  v37 = [[INIntentSlotDescription alloc] initWithName:@"thresholdValues", 6, @"thresholdValues", @"thresholdValues", 0, 0, 173, 3, &unk_1EDBAAB90, &unk_1EDBAABA8, objc_opt_class(), sel_resolveThresholdValuesForQueryHealthSample_withCompletion_, sel_resolveThresholdValuesForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[4] = v37;
  v36 = [[INIntentSlotDescription alloc] initWithName:@"expectedResultType", 7, @"expectedResultType", @"expectedResultType", 0, 0, 178, 1, &unk_1EDBAABC0, &unk_1EDBAABD8, objc_opt_class(), sel_resolveExpectedResultTypeForQueryHealthSample_withCompletion_, sel_resolveExpectedResultTypeForQueryHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[5] = v36;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:6];
  v34 = _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v4 = [(INIntentDescription *)v32 initWithName:@"QueryHealthSampleIntent" responseName:@"QueryHealthSampleIntentResponse" facadeClass:v30 dataClass:v3 type:@"sirikit.intent.wellness.QueryHealthSampleIntent" isPrivate:0 handleSelector:sel_handleQueryHealthSample_completion_ confirmSelector:sel_confirmQueryHealthSample_completion_ slotsByName:v34];
  v54[1] = v4;
  v33 = [INIntentDescription alloc];
  uint64_t v31 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v5 = [[INIntentSlotDescription alloc] initWithName:@"recordDate", 2, @"recordDate", @"recordDate", 0, 0, 16, 1, &unk_1EDBAABF0, &unk_1EDBAAC08, objc_opt_class(), sel_resolveRecordDateForSaveHealthSample_withCompletion_, sel_resolveRecordDateForSaveHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v51[0] = v5;
  v6 = [[INIntentSlotDescription alloc] initWithName:@"objectType", 3, @"objectType", @"objectType", 0, 0, 172, 1, &unk_1EDBAAC20, &unk_1EDBAAC38, objc_opt_class(), sel_resolveObjectTypeForSaveHealthSample_withCompletion_, sel_resolveObjectTypeForSaveHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v51[1] = v6;
  v7 = [[INIntentSlotDescription alloc] initWithName:@"values", 4, @"values", @"values", 0, 0, 173, 3, &unk_1EDBAAC50, &unk_1EDBAAC68, objc_opt_class(), sel_resolveValuesForSaveHealthSample_withCompletion_, sel_resolveValuesForSaveHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v51[2] = v7;
  v8 = [[INIntentSlotDescription alloc] initWithName:@"unit", 5, @"unit", @"unit", 0, 0, 174, 1, &unk_1EDBAAC80, &unk_1EDBAAC98, objc_opt_class(), sel_resolveUnitForSaveHealthSample_withCompletion_, sel_resolveUnitForSaveHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v51[3] = v8;
  v9 = [[INIntentSlotDescription alloc] initWithName:@"sampleMetadata", 6, @"sampleMetadatas", @"sampleMetadatas", 0, 0, 175, 3, &unk_1EDBAACB0, &unk_1EDBAACC8, objc_opt_class(), sel_resolveSampleMetadatasForSaveHealthSample_withCompletion_, sel_resolveSampleMetadatasForSaveHealthSample_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v51[4] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];
  v11 = _INIntentSchemaBuildIntentSlotDescriptionMap(v10);
  v12 = [(INIntentDescription *)v33 initWithName:@"SaveHealthSampleIntent" responseName:@"SaveHealthSampleIntentResponse" facadeClass:v31 dataClass:v29 type:@"sirikit.intent.wellness.SaveHealthSampleIntent" isPrivate:0 handleSelector:sel_handleSaveHealthSample_completion_ confirmSelector:sel_confirmSaveHealthSample_completion_ slotsByName:v11];
  v54[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];

  uint64_t v14 = [v13 count];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v47 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v23 = [v22 name];
        [v15 setObject:v22 forKey:v23];

        v24 = [v22 type];
        [v16 setObject:v22 forKey:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [v15 copy];
  v26 = (void *)sWellnessDomain_intentDescsByName;
  sWellnessDomain_intentDescsByName = v25;

  uint64_t v27 = [v16 copy];
  v28 = (void *)sWellnessDomain_intentDescsByType;
  sWellnessDomain_intentDescsByType = v27;
}

@end