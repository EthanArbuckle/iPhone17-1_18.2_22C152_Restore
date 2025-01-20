@interface INCalendarEventDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INCalendarEventDomainLoadIntentResponseDescriptionIfNeeded

void ___INCalendarEventDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v57[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v47 = [[INIntentSlotDescription alloc] initWithName:@"createdEvent" tag:1 facadePropertyName:@"createdEvent" dataPropertyName:@"createdEvent" isExtended:0 isPrivate:0 valueType:239 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v56[0] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"conflictingEventIdentifiers" tag:2 facadePropertyName:@"conflictingEventIdentifiers" dataPropertyName:@"conflictingEventIdentifiers" isExtended:0 isPrivate:0 valueType:7 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v56[1] = v46;
  v45 = [[INIntentSlotDescription alloc] initWithName:@"confirmationReason" tag:3 facadePropertyName:@"confirmationReason" dataPropertyName:@"confirmationReason" isExtended:0 isPrivate:0 valueType:242 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v56[2] = v45;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
  v43 = _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v42 = [(INIntentResponseDescription *)v0 initWithName:@"CreateEventIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.calendar.CreateEventIntentResponse" isPrivate:0 slotsByName:v43];
  v57[0] = v42;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v41 = [[INIntentSlotDescription alloc] initWithName:@"confirmationReason" tag:3 facadePropertyName:@"confirmationReason" dataPropertyName:@"confirmationReason" isExtended:0 isPrivate:0 valueType:244 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v55 = v41;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v39 = _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v38 = [(INIntentResponseDescription *)v3 initWithName:@"DeleteEventIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.calendar.DeleteEventIntentResponse" isPrivate:0 slotsByName:v39];
  v57[1] = v38;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v37 = [[INIntentSlotDescription alloc] initWithName:@"events" tag:1 facadePropertyName:@"events" dataPropertyName:@"events" isExtended:0 isPrivate:0 valueType:239 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v54 = v37;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  v35 = _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v9 = [(INIntentResponseDescription *)v6 initWithName:@"FindEventsIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.calendar.FindEventsIntentResponse" isPrivate:0 slotsByName:v35];
  v57[2] = v9;
  v10 = [INIntentResponseDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = [[INIntentSlotDescription alloc] initWithName:@"updatedEvent" tag:1 facadePropertyName:@"updatedEvent" dataPropertyName:@"updatedEvent" isExtended:0 isPrivate:0 valueType:239 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[0] = v13;
  v14 = [[INIntentSlotDescription alloc] initWithName:@"conflictingEventIdentifiers" tag:2 facadePropertyName:@"conflictingEventIdentifiers" dataPropertyName:@"conflictingEventIdentifiers" isExtended:0 isPrivate:0 valueType:7 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[1] = v14;
  v15 = [[INIntentSlotDescription alloc] initWithName:@"confirmationReason" tag:3 facadePropertyName:@"confirmationReason" dataPropertyName:@"confirmationReason" isExtended:0 isPrivate:0 valueType:243 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v53[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  v17 = _INIntentSchemaBuildIntentSlotDescriptionMap(v16);
  v18 = [(INIntentResponseDescription *)v10 initWithName:@"UpdateEventIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.calendar.UpdateEventIntentResponse" isPrivate:0 slotsByName:v17];
  v57[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];

  uint64_t v20 = [v19 count];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v20];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v20];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v23 = v19;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v29 = [v28 name];
        [v21 setObject:v28 forKey:v29];

        v30 = [v28 type];
        [v22 setObject:v28 forKey:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v25);
  }

  uint64_t v31 = [v21 copy];
  v32 = (void *)sCalendarEventDomain_intentResponseDescsByName;
  sCalendarEventDomain_intentResponseDescsByName = v31;

  uint64_t v33 = [v22 copy];
  v34 = (void *)sCalendarEventDomain_intentResponseDescsByType;
  sCalendarEventDomain_intentResponseDescsByType = v33;
}

@end