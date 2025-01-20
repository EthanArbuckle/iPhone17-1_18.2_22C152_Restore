@interface INWellnessDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INWellnessDomainLoadIntentResponseDescriptionIfNeeded

void ___INWellnessDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v48[3] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v39 = [(INIntentResponseDescription *)v0 initWithName:@"DeleteHealthSampleIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.wellness.DeleteHealthSampleIntentResponse" isPrivate:0 slotsByName:v40];
  v48[0] = v39;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v38 = [[INIntentSlotDescription alloc] initWithName:@"resultValues" tag:1 facadePropertyName:@"resultValues" dataPropertyName:@"resultValues" isExtended:0 isPrivate:0 valueType:176 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v47 = v38;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v36 = _INIntentSchemaBuildIntentSlotDescriptionMap(v37);
  v35 = [(INIntentResponseDescription *)v3 initWithName:@"QueryHealthSampleIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.wellness.QueryHealthSampleIntentResponse" isPrivate:0 slotsByName:v36];
  v48[1] = v35;
  v33 = [INIntentResponseDescription alloc];
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  v34 = [[INIntentSlotDescription alloc] initWithName:@"sampleUuids" tag:1 facadePropertyName:@"sampleUuids" dataPropertyName:@"sampleUuids" isExtended:0 isPrivate:0 valueType:30 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[0] = v34;
  v6 = [[INIntentSlotDescription alloc] initWithName:@"recordDate" tag:2 facadePropertyName:@"recordDate" dataPropertyName:@"recordDate" isExtended:0 isPrivate:0 valueType:16 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[1] = v6;
  v7 = [[INIntentSlotDescription alloc] initWithName:@"defaultUnit" tag:3 facadePropertyName:@"defaultUnit" dataPropertyName:@"defaultUnit" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[2] = v7;
  v8 = [[INIntentSlotDescription alloc] initWithName:@"valuesDefaultUnit" tag:4 facadePropertyName:@"valuesDefaultUnits" dataPropertyName:@"valuesDefaultUnits" isExtended:0 isPrivate:0 valueType:173 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[3] = v8;
  v9 = [[INIntentSlotDescription alloc] initWithName:@"userProvidedUnit" tag:5 facadePropertyName:@"userProvidedUnit" dataPropertyName:@"userProvidedUnit" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[4] = v9;
  v10 = [[INIntentSlotDescription alloc] initWithName:@"valuesUserProvidedUnit" tag:6 facadePropertyName:@"valuesUserProvidedUnits" dataPropertyName:@"valuesUserProvidedUnits" isExtended:0 isPrivate:0 valueType:173 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[5] = v10;
  v11 = [[INIntentSlotDescription alloc] initWithName:@"punchoutUrl" tag:7 facadePropertyName:@"punchoutUrl" dataPropertyName:@"punchoutUrl" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[6] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
  v13 = _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v14 = [(INIntentResponseDescription *)v33 initWithName:@"SaveHealthSampleIntentResponse" facadeClass:v32 dataClass:v31 type:@"sirikit.intent.wellness.SaveHealthSampleIntentResponse" isPrivate:0 slotsByName:v13];
  v48[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];

  uint64_t v16 = [v15 count];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v16];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v15;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v42 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v25 = [v24 name];
        [v17 setObject:v24 forKey:v25];

        v26 = [v24 type];
        [v18 setObject:v24 forKey:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v21);
  }

  uint64_t v27 = [v17 copy];
  v28 = (void *)sWellnessDomain_intentResponseDescsByName;
  sWellnessDomain_intentResponseDescsByName = v27;

  uint64_t v29 = [v18 copy];
  v30 = (void *)sWellnessDomain_intentResponseDescsByType;
  sWellnessDomain_intentResponseDescsByType = v29;
}

@end