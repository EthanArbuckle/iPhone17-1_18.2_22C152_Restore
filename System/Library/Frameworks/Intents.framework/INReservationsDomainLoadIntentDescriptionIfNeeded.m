@interface INReservationsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INReservationsDomainLoadIntentDescriptionIfNeeded

void ___INReservationsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = [[INIntentSlotDescription alloc] initWithName:@"reservationContainerReference" tag:2 facadePropertyName:@"reservationContainerReference" dataPropertyName:@"reservationContainerReference" isExtended:0 isPrivate:0 valueType:12 valueStyle:1 defaultValueSelectorStrings:&unk_1EDBAA140 provideOptionsSelectorStrings:&unk_1EDBAA158 resolutionResultClass:objc_opt_class() resolveSelectors:0];
  v29[0] = v3;
  v4 = [[INIntentSlotDescription alloc] initWithName:@"reservationItemReferences" tag:3 facadePropertyName:@"reservationItemReferences" dataPropertyName:@"reservationItemReferences" isExtended:0 isPrivate:0 valueType:12 valueStyle:3 defaultValueSelectorStrings:&unk_1EDBAA170 provideOptionsSelectorStrings:&unk_1EDBAA188 resolutionResultClass:objc_opt_class() resolveSelectors:0];
  v29[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v6 = _INIntentSchemaBuildIntentSlotDescriptionMap(v5);
  v7 = [(INIntentDescription *)v0 initWithName:@"GetReservationDetailsIntent" responseName:@"GetReservationDetailsIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.GetReservationDetailsIntent" isPrivate:0 handleSelector:0 confirmSelector:0 slotsByName:v6];
  v30[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  uint64_t v9 = [v8 count];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 name];
        [v10 setObject:v17 forKey:v18];

        v19 = [v17 type];
        [v11 setObject:v17 forKey:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  uint64_t v20 = [v10 copy];
  v21 = (void *)sReservationsDomain_intentDescsByName;
  sReservationsDomain_intentDescsByName = v20;

  uint64_t v22 = [v11 copy];
  v23 = (void *)sReservationsDomain_intentDescsByType;
  sReservationsDomain_intentDescsByType = v22;
}

@end