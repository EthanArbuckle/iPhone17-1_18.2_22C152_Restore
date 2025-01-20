@interface INSettingsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INSettingsDomainLoadIntentDescriptionIfNeeded

void ___INSettingsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v83[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v71 = [[INIntentSlotDescription alloc] initWithName:@"settingMetadata", 2, @"settingMetadata", @"settingMetadata", 0, 0, 230, 1, &unk_1EDBAA2F0, &unk_1EDBAA308, objc_opt_class(), sel_resolveSettingMetadataForGetSetting_withCompletion_, sel_resolveSettingMetadataForGetSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[0] = v71;
  v70 = [[INIntentSlotDescription alloc] initWithName:@"confirmationValue", 3, @"confirmationValue", @"confirmationValue", 0, 0, 234, 1, &unk_1EDBAA320, &unk_1EDBAA338, objc_opt_class(), sel_resolveConfirmationValueForGetSetting_withCompletion_, sel_resolveConfirmationValueForGetSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v82[1] = v70;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  v68 = _INIntentSchemaBuildIntentSlotDescriptionMap(v69);
  v67 = [(INIntentDescription *)v0 initWithName:@"GetSettingIntent" responseName:@"GetSettingIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.settings.GetSettingIntent" isPrivate:0 handleSelector:sel_handleGetSetting_completion_ confirmSelector:sel_confirmGetSetting_completion_ slotsByName:v68];
  v83[0] = v67;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v66 = [[INIntentSlotDescription alloc] initWithName:@"settingMetadata", 2, @"settingMetadata", @"settingMetadata", 0, 0, 230, 1, &unk_1EDBAA350, &unk_1EDBAA368, objc_opt_class(), sel_resolveSettingMetadataForOpenSetting_withCompletion_, sel_resolveSettingMetadataForOpenSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v81[0] = v66;
  v65 = [[INIntentSlotDescription alloc] initWithName:@"searchQuery", 3, @"searchQuery", @"searchQuery", 0, 0, 12, 1, &unk_1EDBAA380, &unk_1EDBAA398, objc_opt_class(), sel_resolveSearchQueryForOpenSetting_withCompletion_, sel_resolveSearchQueryForOpenSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v81[1] = v65;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v63 = _INIntentSchemaBuildIntentSlotDescriptionMap(v64);
  v62 = [(INIntentDescription *)v3 initWithName:@"OpenSettingIntent" responseName:@"OpenSettingIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.settings.OpenSettingIntent" isPrivate:0 handleSelector:sel_handleOpenSetting_completion_ confirmSelector:sel_confirmOpenSetting_completion_ slotsByName:v63];
  v83[1] = v62;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v61 = [[INIntentSlotDescription alloc] initWithName:@"settingMetadata", 2, @"settingMetadata", @"settingMetadata", 0, 0, 230, 1, &unk_1EDBAA3B0, &unk_1EDBAA3C8, objc_opt_class(), sel_resolveSettingMetadataForSetBinarySetting_withCompletion_, sel_resolveSettingMetadataForSetBinarySetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v80[0] = v61;
  v60 = [[INIntentSlotDescription alloc] initWithName:@"binaryValue", 3, @"binaryValue", @"binaryValue", 0, 0, 234, 1, &unk_1EDBAA3E0, &unk_1EDBAA3F8, objc_opt_class(), sel_resolveBinaryValueForSetBinarySetting_withCompletion_, sel_resolveBinaryValueForSetBinarySetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v80[1] = v60;
  v59 = [[INIntentSlotDescription alloc] initWithName:@"temporalEventTrigger", 4, @"temporalEventTrigger", @"temporalEventTrigger", 0, 0, 137, 1, &unk_1EDBAA410, &unk_1EDBAA428, objc_opt_class(), sel_resolveTemporalEventTriggerForSetBinarySetting_withCompletion_, sel_resolveTemporalEventTriggerForSetBinarySetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v80[2] = v59;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
  v57 = _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v56 = [(INIntentDescription *)v6 initWithName:@"SetBinarySettingIntent" responseName:@"SetBinarySettingIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.settings.SetBinarySettingIntent" isPrivate:0 handleSelector:sel_handleSetBinarySetting_completion_ confirmSelector:sel_confirmSetBinarySetting_completion_ slotsByName:v57];
  v83[2] = v56;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v55 = [[INIntentSlotDescription alloc] initWithName:@"settingMetadata", 2, @"settingMetadata", @"settingMetadata", 0, 0, 230, 1, &unk_1EDBAA440, &unk_1EDBAA458, objc_opt_class(), sel_resolveSettingMetadataForSetLabeledSetting_withCompletion_, sel_resolveSettingMetadataForSetLabeledSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[0] = v55;
  v54 = [[INIntentSlotDescription alloc] initWithName:@"labeledValue", 3, @"labeledValue", @"labeledValue", 0, 0, 7, 1, &unk_1EDBAA470, &unk_1EDBAA488, objc_opt_class(), sel_resolveLabeledValueForSetLabeledSetting_withCompletion_, sel_resolveLabeledValueForSetLabeledSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[1] = v54;
  v12 = @"temporalEventTrigger";
  v53 = [[INIntentSlotDescription alloc] initWithName:@"temporalEventTrigger", 4, @"temporalEventTrigger", @"temporalEventTrigger", 0, 0, 137, 1, &unk_1EDBAA4A0, &unk_1EDBAA4B8, objc_opt_class(), sel_resolveTemporalEventTriggerForSetLabeledSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetLabeledSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[2] = v53;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:3];
  v51 = _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v50 = [(INIntentDescription *)v9 initWithName:@"SetLabeledSettingIntent" responseName:@"SetLabeledSettingIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.settings.SetLabeledSettingIntent" isPrivate:0 handleSelector:sel_handleSetLabeledSetting_completion_ confirmSelector:sel_confirmSetLabeledSetting_completion_ slotsByName:v51];
  v83[3] = v50;
  v42 = [INIntentDescription alloc];
  uint64_t v40 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 230, 1, &unk_1EDBAA4D0, &unk_1EDBAA4E8, objc_opt_class(), sel_resolveSettingMetadataForSetNumericSetting_withCompletion_, sel_resolveSettingMetadataForSetNumericSetting_completion_, 0);
  v78[0] = v49;
  v48 = [[INIntentSlotDescription alloc] initWithName:@"numericValue", 3, @"numericValue", @"numericValue", 0, 0, 233, 1, &unk_1EDBAA500, &unk_1EDBAA518, objc_opt_class(), sel_resolveNumericValueForSetNumericSetting_withCompletion_, sel_resolveNumericValueForSetNumericSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v78[1] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"boundedValue", 4, @"boundedValue", @"boundedValue", 0, 0, 235, 1, &unk_1EDBAA530, &unk_1EDBAA548, objc_opt_class(), sel_resolveBoundedValueForSetNumericSetting_withCompletion_, sel_resolveBoundedValueForSetNumericSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v78[2] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"action", 5, @"action", @"action", 0, 0, 236, 1, &unk_1EDBAA560, &unk_1EDBAA578, objc_opt_class(), sel_resolveActionForSetNumericSetting_withCompletion_, sel_resolveActionForSetNumericSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v78[3] = v46;
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", v12, 6, v12, v12, 0, 0, 137, 1, &unk_1EDBAA590, &unk_1EDBAA5A8, objc_opt_class(), sel_resolveTemporalEventTriggerForSetNumericSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetNumericSetting_completion_, 0);
  v78[4] = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:5];
  v13 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v14 = [(INIntentDescription *)v42 initWithName:@"SetNumericSettingIntent" responseName:@"SetNumericSettingIntentResponse" facadeClass:v40 dataClass:v38 type:@"sirikit.intent.settings.SetNumericSettingIntent" isPrivate:0 handleSelector:sel_handleSetNumericSetting_completion_ confirmSelector:sel_confirmSetNumericSetting_completion_ slotsByName:v13];
  v83[4] = v14;
  v43 = [INIntentDescription alloc];
  uint64_t v41 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v15 = [[INIntentSlotDescription alloc] initWithName:@"settingMetadata", 2, @"settingMetadata", @"settingMetadata", 0, 0, 230, 1, &unk_1EDBAA5C0, &unk_1EDBAA5D8, objc_opt_class(), sel_resolveSettingMetadataForSetTemporalSetting_withCompletion_, sel_resolveSettingMetadataForSetTemporalSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v77[0] = v15;
  v16 = [[INIntentSlotDescription alloc] initWithName:@"timeValue", 3, @"timeValue", @"timeValue", 0, 0, 16, 1, &unk_1EDBAA5F0, &unk_1EDBAA608, objc_opt_class(), sel_resolveTimeValueForSetTemporalSetting_withCompletion_, sel_resolveTimeValueForSetTemporalSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v77[1] = v16;
  v17 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", v12, 4, v12, v12, 0, 0, 137, 1, &unk_1EDBAA620, &unk_1EDBAA638, objc_opt_class(), sel_resolveTemporalEventTriggerForSetTemporalSetting_withCompletion_, sel_resolveTemporalEventTriggerForSetTemporalSetting_completion_, 0);
  v77[2] = v17;
  v18 = [[INIntentSlotDescription alloc] initWithName:@"action", 5, @"action", @"action", 0, 0, 236, 1, &unk_1EDBAA650, &unk_1EDBAA668, objc_opt_class(), sel_resolveActionForSetTemporalSetting_withCompletion_, sel_resolveActionForSetTemporalSetting_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v77[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:4];
  v20 = _INIntentSchemaBuildIntentSlotDescriptionMap(v19);
  v21 = [(INIntentDescription *)v43 initWithName:@"SetTemporalSettingIntent" responseName:@"SetTemporalSettingIntentResponse" facadeClass:v41 dataClass:v39 type:@"sirikit.intent.settings.SetTemporalSettingIntent" isPrivate:0 handleSelector:sel_handleSetTemporalSetting_completion_ confirmSelector:sel_confirmSetTemporalSetting_completion_ slotsByName:v20];
  v83[5] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:6];

  uint64_t v23 = [v22 count];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v23];
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v23];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v26 = v22;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v73 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        v32 = [v31 name];
        [v24 setObject:v31 forKey:v32];

        v33 = [v31 type];
        [v25 setObject:v31 forKey:v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v76 count:16];
    }
    while (v28);
  }

  uint64_t v34 = [v24 copy];
  v35 = (void *)sSettingsDomain_intentDescsByName;
  sSettingsDomain_intentDescsByName = v34;

  uint64_t v36 = [v25 copy];
  v37 = (void *)sSettingsDomain_intentDescsByType;
  sSettingsDomain_intentDescsByType = v36;
}

@end