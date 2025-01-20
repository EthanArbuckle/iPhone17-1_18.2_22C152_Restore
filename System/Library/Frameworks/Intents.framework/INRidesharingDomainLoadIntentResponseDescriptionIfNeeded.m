@interface INRidesharingDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INRidesharingDomainLoadIntentResponseDescriptionIfNeeded

void ___INRidesharingDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v47[3] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v38 = [[INIntentSlotDescription alloc] initWithName:@"rideStatus" tag:1 facadePropertyName:@"rideStatus" dataPropertyName:@"rideStatus" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46 = v38;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v36 = _INIntentSchemaBuildIntentSlotDescriptionMap(v37);
  v35 = [(INIntentResponseDescription *)v0 initWithName:@"GetRideStatusIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.ride.GetRideStatusIntentResponse" isPrivate:0 slotsByName:v36];
  v47[0] = v35;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v34 = [[INIntentSlotDescription alloc] initWithName:@"rideOptions" tag:1 facadePropertyName:@"rideOptions" dataPropertyName:@"rideOptions" isExtended:0 isPrivate:0 valueType:0 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v45[0] = v34;
  v33 = [[INIntentSlotDescription alloc] initWithName:@"paymentMethods" tag:2 facadePropertyName:@"paymentMethods" dataPropertyName:@"paymentMethods" isExtended:0 isPrivate:0 valueType:54 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v45[1] = v33;
  v32 = [[INIntentSlotDescription alloc] initWithName:@"expirationDate" tag:4 facadePropertyName:@"expirationDate" dataPropertyName:@"expirationDate" isExtended:0 isPrivate:0 valueType:34 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v45[2] = v32;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v7 = _INIntentSchemaBuildIntentSlotDescriptionMap(v6);
  v8 = [(INIntentResponseDescription *)v3 initWithName:@"ListRideOptionsIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.ride.ListRideOptionsIntentResponse" isPrivate:0 slotsByName:v7];
  v47[1] = v8;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = [[INIntentSlotDescription alloc] initWithName:@"rideStatus" tag:1 facadePropertyName:@"rideStatus" dataPropertyName:@"rideStatus" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v44 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v14 = _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v15 = [(INIntentResponseDescription *)v9 initWithName:@"RequestRideIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.ride.RequestRideIntentResponse" isPrivate:0 slotsByName:v14];
  v47[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];

  uint64_t v17 = [v16 count];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v17];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v17];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v26 = [v25 name];
        [v18 setObject:v25 forKey:v26];

        v27 = [v25 type];
        [v19 setObject:v25 forKey:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v22);
  }

  uint64_t v28 = [v18 copy];
  v29 = (void *)sRidesharingDomain_intentResponseDescsByName;
  sRidesharingDomain_intentResponseDescsByName = v28;

  uint64_t v30 = [v19 copy];
  v31 = (void *)sRidesharingDomain_intentResponseDescsByType;
  sRidesharingDomain_intentResponseDescsByType = v30;
}

@end