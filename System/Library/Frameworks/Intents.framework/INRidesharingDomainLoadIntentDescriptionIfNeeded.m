@interface INRidesharingDomainLoadIntentDescriptionIfNeeded
@end

@implementation INRidesharingDomainLoadIntentDescriptionIfNeeded

void ___INRidesharingDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v48[3] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v39 = [(INIntentDescription *)v0 initWithName:@"GetRideStatusIntent" responseName:@"GetRideStatusIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.ride.GetRideStatusIntent" isPrivate:0 handleSelector:sel_handleGetRideStatus_completion_ confirmSelector:sel_confirmGetRideStatus_completion_ slotsByName:v40];
  v48[0] = v39;
  v33 = [INIntentDescription alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v38 = [[INIntentSlotDescription alloc] initWithName:@"pickupLocation", 2, @"pickupLocation", @"pickupLocation", 0, 0, 27, 1, &unk_1EDBAA1A0, &unk_1EDBAA1B8, objc_opt_class(), sel_resolvePickupLocationForListRideOptions_withCompletion_, sel_resolvePickupLocationForListRideOptions_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v47[0] = v38;
  v37 = [[INIntentSlotDescription alloc] initWithName:@"dropOffLocation", 3, @"dropOffLocation", @"dropOffLocation", 0, 0, 27, 1, &unk_1EDBAA1D0, &unk_1EDBAA1E8, objc_opt_class(), sel_resolveDropOffLocationForListRideOptions_withCompletion_, sel_resolveDropOffLocationForListRideOptions_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v47[1] = v37;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v35 = _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v5 = [(INIntentDescription *)v33 initWithName:@"ListRideOptionsIntent" responseName:@"ListRideOptionsIntentResponse" facadeClass:v3 dataClass:v4 type:@"sirikit.intent.ride.ListRideOptionsIntent" isPrivate:0 handleSelector:sel_handleListRideOptions_completion_ confirmSelector:sel_confirmListRideOptions_completion_ slotsByName:v35];
  v48[1] = v5;
  v34 = [INIntentDescription alloc];
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v32 = [[INIntentSlotDescription alloc] initWithName:@"pickupLocation", 2, @"pickupLocation", @"pickupLocation", 0, 0, 27, 1, &unk_1EDBAA200, &unk_1EDBAA218, objc_opt_class(), sel_resolvePickupLocationForRequestRide_withCompletion_, sel_resolvePickupLocationForRequestRide_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v46[0] = v32;
  v6 = [[INIntentSlotDescription alloc] initWithName:@"dropOffLocation", 3, @"dropOffLocation", @"dropOffLocation", 0, 0, 27, 1, &unk_1EDBAA230, &unk_1EDBAA248, objc_opt_class(), sel_resolveDropOffLocationForRequestRide_withCompletion_, sel_resolveDropOffLocationForRequestRide_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v46[1] = v6;
  v7 = [[INIntentSlotDescription alloc] initWithName:@"rideOptionName", 4, @"rideOptionName", @"rideOptionName", 0, 0, 12, 1, &unk_1EDBAA260, &unk_1EDBAA278, objc_opt_class(), sel_resolveRideOptionNameForRequestRide_withCompletion_, sel_resolveRideOptionNameForRequestRide_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v46[2] = v7;
  v8 = [[INIntentSlotDescription alloc] initWithName:@"partySize", 5, @"partySize", @"partySize", 0, 0, 24, 1, &unk_1EDBAA290, &unk_1EDBAA2A8, objc_opt_class(), sel_resolvePartySizeForRequestRide_withCompletion_, sel_resolvePartySizeForRequestRide_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v46[3] = v8;
  v9 = [[INIntentSlotDescription alloc] initWithName:@"paymentMethod" tag:8 facadePropertyName:@"paymentMethod" dataPropertyName:@"paymentMethod" isExtended:0 isPrivate:0 valueType:54 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46[4] = v9;
  v10 = [[INIntentSlotDescription alloc] initWithName:@"scheduledPickupTime", 10, @"scheduledPickupTime", @"scheduledPickupTime", 0, 0, 16, 1, &unk_1EDBAA2C0, &unk_1EDBAA2D8, objc_opt_class(), sel_resolveScheduledPickupTimeForRequestRide_withCompletion_, sel_resolveScheduledPickupTimeForRequestRide_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v46[5] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:6];
  v12 = _INIntentSchemaBuildIntentSlotDescriptionMap(v11);
  v13 = [(INIntentDescription *)v34 initWithName:@"RequestRideIntent" responseName:@"RequestRideIntentResponse" facadeClass:v31 dataClass:v30 type:@"sirikit.intent.ride.RequestRideIntent" isPrivate:0 handleSelector:sel_handleRequestRide_completion_ confirmSelector:sel_confirmRequestRide_completion_ slotsByName:v12];
  v48[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];

  uint64_t v15 = [v14 count];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v15];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v15];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v24 = [v23 name];
        [v16 setObject:v23 forKey:v24];

        v25 = [v23 type];
        [v17 setObject:v23 forKey:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [v16 copy];
  v27 = (void *)sRidesharingDomain_intentDescsByName;
  sRidesharingDomain_intentDescsByName = v26;

  uint64_t v28 = [v17 copy];
  v29 = (void *)sRidesharingDomain_intentDescsByType;
  sRidesharingDomain_intentDescsByType = v28;
}

@end