@interface INReservationsDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INReservationsDomainLoadIntentResponseDescriptionIfNeeded

void ___INReservationsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = [[INIntentSlotDescription alloc] initWithName:@"reservations" tag:1 facadePropertyName:@"reservations" dataPropertyName:@"reservations" isExtended:0 isPrivate:0 valueType:224 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v28 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v5 = _INIntentSchemaBuildIntentSlotDescriptionMap(v4);
  v6 = [(INIntentResponseDescription *)v0 initWithName:@"GetReservationDetailsIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.GetReservationDetailsIntentResponse" isPrivate:0 slotsByName:v5];
  v29[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

  uint64_t v8 = [v7 count];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = [v16 name];
        [v9 setObject:v16 forKey:v17];

        v18 = [v16 type];
        [v10 setObject:v16 forKey:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [v9 copy];
  v20 = (void *)sReservationsDomain_intentResponseDescsByName;
  sReservationsDomain_intentResponseDescsByName = v19;

  uint64_t v21 = [v10 copy];
  v22 = (void *)sReservationsDomain_intentResponseDescsByType;
  sReservationsDomain_intentResponseDescsByType = v21;
}

@end