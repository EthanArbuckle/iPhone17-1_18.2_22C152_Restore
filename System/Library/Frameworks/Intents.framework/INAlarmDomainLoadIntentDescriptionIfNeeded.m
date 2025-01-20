@interface INAlarmDomainLoadIntentDescriptionIfNeeded
@end

@implementation INAlarmDomainLoadIntentDescriptionIfNeeded

void ___INAlarmDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v81[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v69 = [[INIntentSlotDescription alloc] initWithName:@"alarmSearch" tag:1 facadePropertyName:@"alarmSearch" dataPropertyName:@"alarmSearch" isExtended:0 isPrivate:0 valueType:180 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v80[0] = v69;
  v68 = [[INIntentSlotDescription alloc] initWithName:@"alarms", 2, @"alarms", @"alarms", 0, 0, 179, 3, &unk_1EDBA7A40, &unk_1EDBA7A58, objc_opt_class(), sel_resolveAlarmsForChangeAlarmStatus_withCompletion_, sel_resolveAlarmsForChangeAlarmStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v80[1] = v68;
  v67 = [[INIntentSlotDescription alloc] initWithName:@"operation", 3, @"operation", @"operation", 0, 0, 184, 1, &unk_1EDBA7A70, &unk_1EDBA7A88, objc_opt_class(), sel_resolveOperationForChangeAlarmStatus_withCompletion_, sel_resolveOperationForChangeAlarmStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v80[2] = v67;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
  v65 = _INIntentSchemaBuildIntentSlotDescriptionMap(v66);
  v64 = [(INIntentDescription *)v0 initWithName:@"ChangeAlarmStatusIntent" responseName:@"ChangeAlarmStatusIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.alarm.ChangeAlarmStatusIntent" isPrivate:0 handleSelector:sel_handleChangeAlarmStatus_completion_ confirmSelector:sel_confirmChangeAlarmStatus_completion_ slotsByName:v65];
  v81[0] = v64;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v63 = [[INIntentSlotDescription alloc] initWithName:@"relativeOffsetInMinutes" tag:1 facadePropertyName:@"relativeOffsetInMinutes" dataPropertyName:@"relativeOffsetInMinutes" isExtended:0 isPrivate:0 valueType:5 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v79[0] = v63;
  v62 = [[INIntentSlotDescription alloc] initWithName:@"time", 2, @"time", @"time", 0, 0, 16, 1, &unk_1EDBA7AA0, &unk_1EDBA7AB8, objc_opt_class(), sel_resolveTimeForCreateAlarm_withCompletion_, sel_resolveTimeForCreateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[1] = v62;
  v61 = [[INIntentSlotDescription alloc] initWithName:@"label", 3, @"label", @"label", 0, 0, 12, 1, &unk_1EDBA7AD0, &unk_1EDBA7AE8, objc_opt_class(), sel_resolveLabelForCreateAlarm_withCompletion_, sel_resolveLabelForCreateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[2] = v61;
  v60 = [[INIntentSlotDescription alloc] initWithName:@"alarmRepeatScheduleOptions", 4, @"alarmRepeatScheduleOptions", @"alarmRepeatScheduleOptions", 0, 0, 181, 3, &unk_1EDBA7B00, &unk_1EDBA7B18, objc_opt_class(), sel_resolveAlarmRepeatScheduleOptionsForCreateAlarm_withCompletion_, sel_resolveAlarmRepeatScheduleOptionsForCreateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v79[3] = v60;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:4];
  v58 = _INIntentSchemaBuildIntentSlotDescriptionMap(v59);
  v57 = [(INIntentDescription *)v3 initWithName:@"CreateAlarmIntent" responseName:@"CreateAlarmIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.alarm.CreateAlarmIntent" isPrivate:0 handleSelector:sel_handleCreateAlarm_completion_ confirmSelector:sel_confirmCreateAlarm_completion_ slotsByName:v58];
  v81[1] = v57;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v56 = [[INIntentSlotDescription alloc] initWithName:@"alarmSearch" tag:1 facadePropertyName:@"alarmSearch" dataPropertyName:@"alarmSearch" isExtended:0 isPrivate:0 valueType:180 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v78[0] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"alarms", 2, @"alarms", @"alarms", 0, 0, 179, 3, &unk_1EDBA7B30, &unk_1EDBA7B48, objc_opt_class(), sel_resolveAlarmsForDeleteAlarm_withCompletion_, sel_resolveAlarmsForDeleteAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v78[1] = v55;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  v53 = _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v52 = [(INIntentDescription *)v6 initWithName:@"DeleteAlarmIntent" responseName:@"DeleteAlarmIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.alarm.DeleteAlarmIntent" isPrivate:0 handleSelector:sel_handleDeleteAlarm_completion_ confirmSelector:sel_confirmDeleteAlarm_completion_ slotsByName:v53];
  v81[2] = v52;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v51 = [[INIntentSlotDescription alloc] initWithName:@"alarmSearch" tag:1 facadePropertyName:@"alarmSearch" dataPropertyName:@"alarmSearch" isExtended:0 isPrivate:0 valueType:180 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[0] = v51;
  v50 = [[INIntentSlotDescription alloc] initWithName:@"alarmSearchType" tag:2 facadePropertyName:@"alarmSearchType" dataPropertyName:@"alarmSearchType" isExtended:0 isPrivate:0 valueType:188 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[1] = v50;
  v49 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 179, 3, &unk_1EDBA7B60, &unk_1EDBA7B78, objc_opt_class(), sel_resolveAlarmsForSearchAlarm_withCompletion_, sel_resolveAlarmsForSearchAlarm_completion_, 0);
  v77[2] = v49;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
  v47 = _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v46 = [(INIntentDescription *)v9 initWithName:@"SearchAlarmIntent" responseName:@"SearchAlarmIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.alarm.SearchAlarmIntent" isPrivate:0 handleSelector:sel_handleSearchAlarm_completion_ confirmSelector:sel_confirmSearchAlarm_completion_ slotsByName:v47];
  v81[3] = v46;
  v12 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v45 = [[INIntentSlotDescription alloc] initWithName:@"alarms", 1, @"alarms", @"alarms", 0, 0, 179, 3, &unk_1EDBA7B90, &unk_1EDBA7BA8, objc_opt_class(), sel_resolveAlarmsForSnoozeAlarm_withCompletion_, sel_resolveAlarmsForSnoozeAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v76 = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v15 = [(INIntentDescription *)v12 initWithName:@"SnoozeAlarmIntent" responseName:@"SnoozeAlarmIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.alarm.SnoozeAlarmIntent" isPrivate:0 handleSelector:sel_handleSnoozeAlarm_completion_ confirmSelector:sel_confirmSnoozeAlarm_completion_ slotsByName:v43];
  v81[4] = v15;
  v42 = [INIntentDescription alloc];
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v16 = [[INIntentSlotDescription alloc] initWithName:@"alarmSearch" tag:1 facadePropertyName:@"alarmSearch" dataPropertyName:@"alarmSearch" isExtended:0 isPrivate:0 valueType:180 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[0] = v16;
  v17 = [[INIntentSlotDescription alloc] initWithName:@"alarm", 2, @"alarm", @"alarm", 0, 0, 179, 1, &unk_1EDBA7BC0, &unk_1EDBA7BD8, objc_opt_class(), sel_resolveAlarmForUpdateAlarm_withCompletion_, sel_resolveAlarmForUpdateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[1] = v17;
  v18 = [[INIntentSlotDescription alloc] initWithName:@"operation", 3, @"operation", @"operation", 0, 0, 183, 1, &unk_1EDBA7BF0, &unk_1EDBA7C08, objc_opt_class(), sel_resolveOperationForUpdateAlarm_withCompletion_, sel_resolveOperationForUpdateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[2] = v18;
  v19 = [[INIntentSlotDescription alloc] initWithName:@"proposedTime", 4, @"proposedTime", @"proposedTime", 0, 0, 16, 1, &unk_1EDBA7C20, &unk_1EDBA7C38, objc_opt_class(), sel_resolveProposedTimeForUpdateAlarm_withCompletion_, sel_resolveProposedTimeForUpdateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[3] = v19;
  v20 = [[INIntentSlotDescription alloc] initWithName:@"proposedLabel", 5, @"proposedLabel", @"proposedLabel", 0, 0, 12, 1, &unk_1EDBA7C50, &unk_1EDBA7C68, objc_opt_class(), sel_resolveProposedLabelForUpdateAlarm_withCompletion_, sel_resolveProposedLabelForUpdateAlarm_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v75[4] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];
  v22 = _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v23 = [(INIntentDescription *)v42 initWithName:@"UpdateAlarmIntent" responseName:@"UpdateAlarmIntentResponse" facadeClass:v41 dataClass:v40 type:@"sirikit.intent.alarm.UpdateAlarmIntent" isPrivate:0 handleSelector:sel_handleUpdateAlarm_completion_ confirmSelector:sel_confirmUpdateAlarm_completion_ slotsByName:v22];
  v81[5] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:6];

  uint64_t v25 = [v24 count];
  v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v25];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v28 = v24;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v71 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v34 = [v33 name];
        [v26 setObject:v33 forKey:v34];

        v35 = [v33 type];
        [v27 setObject:v33 forKey:v35];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v30);
  }

  uint64_t v36 = [v26 copy];
  v37 = (void *)sAlarmDomain_intentDescsByName;
  sAlarmDomain_intentDescsByName = v36;

  uint64_t v38 = [v27 copy];
  v39 = (void *)sAlarmDomain_intentDescsByType;
  sAlarmDomain_intentDescsByType = v38;
}

@end