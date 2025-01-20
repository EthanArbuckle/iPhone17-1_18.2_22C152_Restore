@interface INTimersDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INTimersDomainLoadIntentResponseDescriptionIfNeeded

void ___INTimersDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v78[7] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v65 = [[INIntentSlotDescription alloc] initWithName:@"createdTimer" tag:1 facadePropertyName:@"createdTimer" dataPropertyName:@"createdTimer" isExtended:0 isPrivate:0 valueType:189 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77 = v65;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
  v63 = _INIntentSchemaBuildIntentSlotDescriptionMap(v64);
  v62 = [(INIntentResponseDescription *)v0 initWithName:@"CreateTimerIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.timer.CreateTimerIntentResponse" isPrivate:0 slotsByName:v63];
  v78[0] = v62;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v61 = [[INIntentSlotDescription alloc] initWithName:@"deletedTimers" tag:1 facadePropertyName:@"deletedTimers" dataPropertyName:@"deletedTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76 = v61;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v59 = _INIntentSchemaBuildIntentSlotDescriptionMap(v60);
  v58 = [(INIntentResponseDescription *)v3 initWithName:@"DeleteTimerIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.timer.DeleteTimerIntentResponse" isPrivate:0 slotsByName:v59];
  v78[1] = v58;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v57 = [[INIntentSlotDescription alloc] initWithName:@"pausedTimers" tag:1 facadePropertyName:@"pausedTimers" dataPropertyName:@"pausedTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75 = v57;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v55 = _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v54 = [(INIntentResponseDescription *)v6 initWithName:@"PauseTimerIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.timer.PauseTimerIntentResponse" isPrivate:0 slotsByName:v55];
  v78[2] = v54;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v53 = [[INIntentSlotDescription alloc] initWithName:@"resetTimers" tag:1 facadePropertyName:@"resetTimers" dataPropertyName:@"resetTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74 = v53;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  v51 = _INIntentSchemaBuildIntentSlotDescriptionMap(v52);
  v50 = [(INIntentResponseDescription *)v9 initWithName:@"ResetTimerIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.timer.ResetTimerIntentResponse" isPrivate:0 slotsByName:v51];
  v78[3] = v50;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v49 = [[INIntentSlotDescription alloc] initWithName:@"resumedTimers" tag:1 facadePropertyName:@"resumedTimers" dataPropertyName:@"resumedTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73 = v49;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
  v47 = _INIntentSchemaBuildIntentSlotDescriptionMap(v48);
  v46 = [(INIntentResponseDescription *)v12 initWithName:@"ResumeTimerIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.timer.ResumeTimerIntentResponse" isPrivate:0 slotsByName:v47];
  v78[4] = v46;
  v15 = [INIntentResponseDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v45 = [[INIntentSlotDescription alloc] initWithName:@"matchedTimers" tag:2 facadePropertyName:@"matchedTimers" dataPropertyName:@"matchedTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[0] = v45;
  v44 = [[INIntentSlotDescription alloc] initWithName:@"unmatchedTimers" tag:3 facadePropertyName:@"unmatchedTimers" dataPropertyName:@"unmatchedTimers" isExtended:0 isPrivate:0 valueType:189 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[1] = v44;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  v19 = _INIntentSchemaBuildIntentSlotDescriptionMap(v18);
  v20 = [(INIntentResponseDescription *)v15 initWithName:@"SearchForTimersIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.timer.SearchForTimersIntentResponse" isPrivate:0 slotsByName:v19];
  v78[5] = v20;
  v21 = [INIntentResponseDescription alloc];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v24 = [[INIntentSlotDescription alloc] initWithName:@"updatedTimer" tag:1 facadePropertyName:@"updatedTimer" dataPropertyName:@"updatedTimer" isExtended:0 isPrivate:0 valueType:189 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v71 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  v26 = _INIntentSchemaBuildIntentSlotDescriptionMap(v25);
  v27 = [(INIntentResponseDescription *)v21 initWithName:@"SetTimerAttributeIntentResponse" facadeClass:v22 dataClass:v23 type:@"sirikit.intent.timer.SetTimerAttributeIntentResponse" isPrivate:0 slotsByName:v26];
  v78[6] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:7];

  uint64_t v29 = [v28 count];
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v29];
  v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v29];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v32 = v28;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v67 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v38 = [v37 name];
        [v30 setObject:v37 forKey:v38];

        v39 = [v37 type];
        [v31 setObject:v37 forKey:v39];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v66 objects:v70 count:16];
    }
    while (v34);
  }

  uint64_t v40 = [v30 copy];
  v41 = (void *)sTimersDomain_intentResponseDescsByName;
  sTimersDomain_intentResponseDescsByName = v40;

  uint64_t v42 = [v31 copy];
  v43 = (void *)sTimersDomain_intentResponseDescsByType;
  sTimersDomain_intentResponseDescsByType = v42;
}

@end