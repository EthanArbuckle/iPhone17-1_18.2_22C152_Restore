@interface INCalendarEventDomainLoadIntentDescriptionIfNeeded
@end

@implementation INCalendarEventDomainLoadIntentDescriptionIfNeeded

void ___INCalendarEventDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v68[4] = *MEMORY[0x1E4F143B8];
  v51 = [INIntentDescription alloc];
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  v58 = [[INIntentSlotDescription alloc] initWithName:@"title", 2, @"title", @"title", 0, 0, 7, 1, &unk_1EDBA7C80, &unk_1EDBA7C98, objc_opt_class(), sel_resolveTitleForCreateEvent_withCompletion_, sel_resolveTitleForCreateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[0] = v58;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"dateTimeRange", 3, @"dateTimeRange", @"dateTimeRange", 0, 0, 16, 1, &unk_1EDBA7CB0, &unk_1EDBA7CC8, objc_opt_class(), sel_resolveDateTimeRangeForCreateEvent_withCompletion_, sel_resolveDateTimeRangeForCreateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[1] = v57;
  v56 = [[INIntentSlotDescription alloc] initWithName:@"participants", 4, @"participants", @"participants", 0, 0, 10, 3, &unk_1EDBA7CE0, &unk_1EDBA7CF8, objc_opt_class(), sel_resolveParticipantsForCreateEvent_withCompletion_, sel_resolveParticipantsForCreateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[2] = v56;
  v55 = [[INIntentSlotDescription alloc] initWithName:@"location", 5, @"location", @"location", 0, 0, 27, 1, &unk_1EDBA7D10, &unk_1EDBA7D28, objc_opt_class(), sel_resolveLocationForCreateEvent_withCompletion_, sel_resolveLocationForCreateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v67[3] = v55;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  v53 = _INIntentSchemaBuildIntentSlotDescriptionMap(v54);
  v52 = [(INIntentDescription *)v51 initWithName:@"CreateEventIntent" responseName:@"CreateEventIntentResponse" facadeClass:v0 dataClass:v1 type:@"sirikit.intent.calendar.CreateEventIntent" isPrivate:0 handleSelector:sel_handleCreateEvent_completion_ confirmSelector:sel_confirmCreateEvent_completion_ slotsByName:v53];
  v68[0] = v52;
  v2 = [INIntentDescription alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v50 = [[INIntentSlotDescription alloc] initWithName:@"targetEventIdentifier", 2, @"targetEventIdentifier", @"targetEventIdentifier", 0, 0, 7, 1, &unk_1EDBA7D40, &unk_1EDBA7D58, objc_opt_class(), sel_resolveTargetEventIdentifierForDeleteEvent_withCompletion_, sel_resolveTargetEventIdentifierForDeleteEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v66[0] = v50;
  v49 = [[INIntentSlotDescription alloc] initWithName:@"deleteAllOccurrences", 3, @"deleteAllOccurrences", @"deleteAllOccurrences", 0, 0, 1, 1, &unk_1EDBA7D70, &unk_1EDBA7D88, objc_opt_class(), sel_resolveDeleteAllOccurrencesForDeleteEvent_withCompletion_, sel_resolveDeleteAllOccurrencesForDeleteEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v66[1] = v49;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v47 = _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v46 = [(INIntentDescription *)v2 initWithName:@"DeleteEventIntent" responseName:@"DeleteEventIntentResponse" facadeClass:v3 dataClass:v4 type:@"sirikit.intent.calendar.DeleteEventIntent" isPrivate:0 handleSelector:sel_handleDeleteEvent_completion_ confirmSelector:sel_confirmDeleteEvent_completion_ slotsByName:v47];
  v68[1] = v46;
  v37 = [INIntentDescription alloc];
  uint64_t v35 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v45 = [[INIntentSlotDescription alloc] initWithName:@"searchQuery", 2, @"searchQuery", @"searchQuery", 0, 0, 7, 1, &unk_1EDBA7DA0, &unk_1EDBA7DB8, objc_opt_class(), sel_resolveSearchQueryForFindEvents_withCompletion_, sel_resolveSearchQueryForFindEvents_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[0] = v45;
  v44 = [[INIntentSlotDescription alloc] initWithName:@"dateTimeRange", 3, @"dateTimeRange", @"dateTimeRange", 0, 0, 16, 1, &unk_1EDBA7DD0, &unk_1EDBA7DE8, objc_opt_class(), sel_resolveDateTimeRangeForFindEvents_withCompletion_, sel_resolveDateTimeRangeForFindEvents_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[1] = v44;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"participants", 4, @"participants", @"participants", 0, 0, 10, 3, &unk_1EDBA7E00, &unk_1EDBA7E18, objc_opt_class(), sel_resolveParticipantsForFindEvents_withCompletion_, sel_resolveParticipantsForFindEvents_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[2] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"location", 5, @"location", @"location", 0, 0, 27, 1, &unk_1EDBA7E30, &unk_1EDBA7E48, objc_opt_class(), sel_resolveLocationForFindEvents_withCompletion_, sel_resolveLocationForFindEvents_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[3] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"requestedEventAttribute", 6, @"requestedEventAttribute", @"requestedEventAttribute", 0, 0, 241, 1, &unk_1EDBA7E60, &unk_1EDBA7E78, objc_opt_class(), sel_resolveRequestedEventAttributeForFindEvents_withCompletion_, sel_resolveRequestedEventAttributeForFindEvents_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v65[4] = v41;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:5];
  v39 = _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v38 = [(INIntentDescription *)v37 initWithName:@"FindEventsIntent" responseName:@"FindEventsIntentResponse" facadeClass:v35 dataClass:v5 type:@"sirikit.intent.calendar.FindEventsIntent" isPrivate:0 handleSelector:sel_handleFindEvents_completion_ confirmSelector:sel_confirmFindEvents_completion_ slotsByName:v39];
  v68[2] = v38;
  v34 = [INIntentDescription alloc];
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v36 = [[INIntentSlotDescription alloc] initWithName:@"targetEventIdentifier", 2, @"targetEventIdentifier", @"targetEventIdentifier", 0, 0, 7, 1, &unk_1EDBA7E90, &unk_1EDBA7EA8, objc_opt_class(), sel_resolveTargetEventIdentifierForUpdateEvent_withCompletion_, sel_resolveTargetEventIdentifierForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[0] = v36;
  v31 = [[INIntentSlotDescription alloc] initWithName:@"setTitle", 3, @"setTitle", @"setTitle", 0, 0, 7, 1, &unk_1EDBA7EC0, &unk_1EDBA7ED8, objc_opt_class(), sel_resolveSetTitleForUpdateEvent_withCompletion_, sel_resolveSetTitleForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[1] = v31;
  v6 = [[INIntentSlotDescription alloc] initWithName:@"setDateTimeRange", 4, @"setDateTimeRange", @"setDateTimeRange", 0, 0, 16, 1, &unk_1EDBA7EF0, &unk_1EDBA7F08, objc_opt_class(), sel_resolveSetDateTimeRangeForUpdateEvent_withCompletion_, sel_resolveSetDateTimeRangeForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[2] = v6;
  v7 = [[INIntentSlotDescription alloc] initWithName:@"setLocation", 5, @"setLocation", @"setLocation", 0, 0, 27, 1, &unk_1EDBA7F20, &unk_1EDBA7F38, objc_opt_class(), sel_resolveSetLocationForUpdateEvent_withCompletion_, sel_resolveSetLocationForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[3] = v7;
  v8 = [[INIntentSlotDescription alloc] initWithName:@"addParticipants", 6, @"addParticipants", @"addParticipants", 0, 0, 10, 3, &unk_1EDBA7F50, &unk_1EDBA7F68, objc_opt_class(), sel_resolveAddParticipantsForUpdateEvent_withCompletion_, sel_resolveAddParticipantsForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[4] = v8;
  v9 = [[INIntentSlotDescription alloc] initWithName:@"removeParticipants", 7, @"removeParticipants", @"removeParticipants", 0, 0, 10, 3, &unk_1EDBA7F80, &unk_1EDBA7F98, objc_opt_class(), sel_resolveRemoveParticipantsForUpdateEvent_withCompletion_, sel_resolveRemoveParticipantsForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[5] = v9;
  v10 = [[INIntentSlotDescription alloc] initWithName:@"updateAllOccurrences", 8, @"updateAllOccurrences", @"updateAllOccurrences", 0, 0, 1, 1, &unk_1EDBA7FB0, &unk_1EDBA7FC8, objc_opt_class(), sel_resolveUpdateAllOccurrencesForUpdateEvent_withCompletion_, sel_resolveUpdateAllOccurrencesForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[6] = v10;
  v11 = [[INIntentSlotDescription alloc] initWithName:@"removeLocation", 9, @"removeLocation", @"removeLocation", 0, 0, 1, 1, &unk_1EDBA7FE0, &unk_1EDBA7FF8, objc_opt_class(), sel_resolveRemoveLocationForUpdateEvent_withCompletion_, sel_resolveRemoveLocationForUpdateEvent_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v64[7] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:8];
  v13 = _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v14 = [(INIntentDescription *)v34 initWithName:@"UpdateEventIntent" responseName:@"UpdateEventIntentResponse" facadeClass:v33 dataClass:v32 type:@"sirikit.intent.calendar.UpdateEventIntent" isPrivate:0 handleSelector:sel_handleUpdateEvent_completion_ confirmSelector:sel_confirmUpdateEvent_completion_ slotsByName:v13];
  v68[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];

  uint64_t v16 = [v15 count];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v25 = [v24 name];
        [v17 setObject:v24 forKey:v25];

        v26 = [v24 type];
        [v18 setObject:v24 forKey:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [v17 copy];
  v28 = (void *)sCalendarEventDomain_intentDescsByName;
  sCalendarEventDomain_intentDescsByName = v27;

  uint64_t v29 = [v18 copy];
  v30 = (void *)sCalendarEventDomain_intentDescsByType;
  sCalendarEventDomain_intentDescsByType = v29;
}

@end