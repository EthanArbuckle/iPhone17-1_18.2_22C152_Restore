@interface INGenericDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INGenericDomainLoadIntentResponseDescriptionIfNeeded

void ___INGenericDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v4 = [(INIntentResponseDescription *)v0 initWithName:@"GenericIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.GenericIntentResponse" isPrivate:1 slotsByName:v3];
  v26[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

  uint64_t v6 = [v5 count];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v6];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "name", (void)v21);
        [v7 setObject:v14 forKey:v15];

        v16 = [v14 type];
        [v8 setObject:v14 forKey:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v17 = [v7 copy];
  v18 = (void *)sGenericDomain_intentResponseDescsByName;
  sGenericDomain_intentResponseDescsByName = v17;

  uint64_t v19 = [v8 copy];
  v20 = (void *)sGenericDomain_intentResponseDescsByType;
  sGenericDomain_intentResponseDescsByType = v19;
}

@end