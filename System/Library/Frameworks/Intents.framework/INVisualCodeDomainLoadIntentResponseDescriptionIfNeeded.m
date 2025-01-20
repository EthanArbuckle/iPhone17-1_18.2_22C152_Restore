@interface INVisualCodeDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INVisualCodeDomainLoadIntentResponseDescriptionIfNeeded

void ___INVisualCodeDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = [[INIntentSlotDescription alloc] initWithName:@"visualCodeImage" tag:1 facadePropertyName:@"visualCodeImage" dataPropertyName:@"visualCodeImage" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v33 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v5 = _INIntentSchemaBuildIntentSlotDescriptionMap(v4);
  v6 = [(INIntentResponseDescription *)v0 initWithName:@"GetVisualCodeIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.GetVisualCodeIntentResponse" isPrivate:0 slotsByName:v5];
  v34[0] = v6;
  v7 = [INIntentResponseDescription alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v11 = [(INIntentResponseDescription *)v7 initWithName:@"ScanVisualCodeIntentResponse" facadeClass:v8 dataClass:v9 type:@"sirikit.intent.ScanVisualCodeIntentResponse" isPrivate:0 slotsByName:v10];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];

  uint64_t v13 = [v12 count];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v22 = [v21 name];
        [v14 setObject:v21 forKey:v22];

        v23 = [v21 type];
        [v15 setObject:v21 forKey:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  uint64_t v24 = [v14 copy];
  v25 = (void *)sVisualCodeDomain_intentResponseDescsByName;
  sVisualCodeDomain_intentResponseDescsByName = v24;

  uint64_t v26 = [v15 copy];
  v27 = (void *)sVisualCodeDomain_intentResponseDescsByType;
  sVisualCodeDomain_intentResponseDescsByType = v26;
}

@end