@interface INAlarmDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INAlarmDomainLoadIntentResponseDescriptionIfNeeded

void ___INAlarmDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v63[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v54 = [[INIntentSlotDescription alloc] initWithName:@"modifiedAlarms" tag:1 facadePropertyName:@"modifiedAlarms" dataPropertyName:@"modifiedAlarms" isExtended:0 isPrivate:0 valueType:179 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v62 = v54;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v52 = _INIntentSchemaBuildIntentSlotDescriptionMap(v53);
  v51 = [(INIntentResponseDescription *)v0 initWithName:@"ChangeAlarmStatusIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.alarm.ChangeAlarmStatusIntentResponse" isPrivate:0 slotsByName:v52];
  v63[0] = v51;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v50 = [[INIntentSlotDescription alloc] initWithName:@"createdAlarm" tag:1 facadePropertyName:@"createdAlarm" dataPropertyName:@"createdAlarm" isExtended:0 isPrivate:0 valueType:179 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v61[0] = v50;
  v49 = [[INIntentSlotDescription alloc] initWithName:@"successCode" tag:2 facadePropertyName:@"successCode" dataPropertyName:@"successCode" isExtended:0 isPrivate:0 valueType:185 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v61[1] = v49;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v47 = _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v46 = [(INIntentResponseDescription *)v3 initWithName:@"CreateAlarmIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.alarm.CreateAlarmIntentResponse" isPrivate:0 slotsByName:v47];
  v63[1] = v46;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  v45 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v44 = [(INIntentResponseDescription *)v6 initWithName:@"DeleteAlarmIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.alarm.DeleteAlarmIntentResponse" isPrivate:0 slotsByName:v45];
  v63[2] = v44;
  v10 = [INIntentResponseDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v42 = [(INIntentResponseDescription *)v10 initWithName:@"SearchAlarmIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.alarm.SearchAlarmIntentResponse" isPrivate:0 slotsByName:v43];
  v63[3] = v42;
  v13 = [INIntentResponseDescription alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v17 = [(INIntentResponseDescription *)v13 initWithName:@"SnoozeAlarmIntentResponse" facadeClass:v14 dataClass:v15 type:@"sirikit.intent.alarm.SnoozeAlarmIntentResponse" isPrivate:0 slotsByName:v16];
  v63[4] = v17;
  v18 = [INIntentResponseDescription alloc];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v21 = [[INIntentSlotDescription alloc] initWithName:@"updatedAlarm" tag:1 facadePropertyName:@"updatedAlarm" dataPropertyName:@"updatedAlarm" isExtended:0 isPrivate:0 valueType:179 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v60[0] = v21;
  v22 = [[INIntentSlotDescription alloc] initWithName:@"conflictAlarms" tag:2 facadePropertyName:@"conflictAlarms" dataPropertyName:@"conflictAlarms" isExtended:0 isPrivate:0 valueType:179 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v60[1] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v24 = _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v25 = [(INIntentResponseDescription *)v18 initWithName:@"UpdateAlarmIntentResponse" facadeClass:v19 dataClass:v20 type:@"sirikit.intent.alarm.UpdateAlarmIntentResponse" isPrivate:0 slotsByName:v24];
  v63[5] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:6];

  uint64_t v27 = [v26 count];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v27];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v27];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v30 = v26;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v56 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v36 = [v35 name];
        [v28 setObject:v35 forKey:v36];

        v37 = [v35 type];
        [v29 setObject:v35 forKey:v37];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v32);
  }

  uint64_t v38 = [v28 copy];
  v39 = (void *)sAlarmDomain_intentResponseDescsByName;
  sAlarmDomain_intentResponseDescsByName = v38;

  uint64_t v40 = [v29 copy];
  v41 = (void *)sAlarmDomain_intentResponseDescsByType;
  sAlarmDomain_intentResponseDescsByType = v40;
}

@end