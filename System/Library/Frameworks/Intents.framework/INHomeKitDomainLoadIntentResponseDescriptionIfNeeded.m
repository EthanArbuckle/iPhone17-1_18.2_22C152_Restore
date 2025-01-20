@interface INHomeKitDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INHomeKitDomainLoadIntentResponseDescriptionIfNeeded

void ___INHomeKitDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v45[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v38 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v37 = [(INIntentResponseDescription *)v0 initWithName:@"ConfigureHomeIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.home.ConfigureHomeIntentResponse" isPrivate:0 slotsByName:v38];
  v45[0] = v37;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = [[INIntentSlotDescription alloc] initWithName:@"entityResponses" tag:2 facadePropertyName:@"entityResponses" dataPropertyName:@"entityResponses" isExtended:0 isPrivate:0 valueType:50 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v44 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v8 = _INIntentSchemaBuildIntentSlotDescriptionMap(v7);
  v9 = [(INIntentResponseDescription *)v3 initWithName:@"ControlHomeIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.home.ControlHomeIntentResponse" isPrivate:0 slotsByName:v8];
  v45[1] = v9;
  v10 = [INIntentResponseDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = (void *)MEMORY[0x1E4F1CBF0];
  v14 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v15 = [(INIntentResponseDescription *)v10 initWithName:@"QueryHomeIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.home.QueryHomeIntentResponse" isPrivate:0 slotsByName:v14];
  v45[2] = v15;
  v16 = [INIntentResponseDescription alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v20 = [(INIntentResponseDescription *)v16 initWithName:@"ShowHomeIntentResponse" facadeClass:v17 dataClass:v18 type:@"sirikit.intent.home.ShowHomeIntentResponse" isPrivate:0 slotsByName:v19];
  v45[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];

  uint64_t v22 = [v21 count];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v22];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v25 = v21;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v31 = [v30 name];
        [v23 setObject:v30 forKey:v31];

        v32 = [v30 type];
        [v24 setObject:v30 forKey:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v23 copy];
  v34 = (void *)sHomeKitDomain_intentResponseDescsByName;
  sHomeKitDomain_intentResponseDescsByName = v33;

  uint64_t v35 = [v24 copy];
  v36 = (void *)sHomeKitDomain_intentResponseDescsByType;
  sHomeKitDomain_intentResponseDescsByType = v35;
}

@end