@interface INGeoDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INGeoDomainLoadIntentResponseDescriptionIfNeeded

void ___INGeoDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v76[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v64 = [[INIntentSlotDescription alloc] initWithName:@"parkingLocation" tag:1 facadePropertyName:@"parkingLocation" dataPropertyName:@"parkingLocation" isExtended:0 isPrivate:0 valueType:27 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[0] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"parkingNote" tag:2 facadePropertyName:@"parkingNote" dataPropertyName:@"parkingNote" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[1] = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v60 = [(INIntentResponseDescription *)v0 initWithName:@"DeleteParkingLocationIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.geo.DeleteParkingLocationIntentResponse" isPrivate:0 slotsByName:v61];
  v76[0] = v60;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v59 = [[INIntentSlotDescription alloc] initWithName:@"transportType" tag:1 facadePropertyName:@"transportTypes" dataPropertyName:@"transportTypes" isExtended:0 isPrivate:0 valueType:228 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74[0] = v59;
  v58 = [[INIntentSlotDescription alloc] initWithName:@"location" tag:2 facadePropertyName:@"location" dataPropertyName:@"location" isExtended:0 isPrivate:0 valueType:27 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74[1] = v58;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"supportedType" tag:3 facadePropertyName:@"supportedTypes" dataPropertyName:@"supportedTypes" isExtended:0 isPrivate:0 valueType:229 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v74[2] = v57;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
  v55 = _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v54 = [(INIntentResponseDescription *)v3 initWithName:@"ReportIncidentIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.geo.ReportIncidentIntentResponse" isPrivate:0 slotsByName:v55];
  v76[1] = v54;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v53 = [[INIntentSlotDescription alloc] initWithName:@"parkingLocation" tag:1 facadePropertyName:@"parkingLocation" dataPropertyName:@"parkingLocation" isExtended:0 isPrivate:0 valueType:27 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73[0] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"parkingNote" tag:2 facadePropertyName:@"parkingNote" dataPropertyName:@"parkingNote" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v73[1] = v52;
  v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  v50 = _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v49 = [(INIntentResponseDescription *)v6 initWithName:@"RetrieveParkingLocationIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.geo.RetrieveParkingLocationIntentResponse" isPrivate:0 slotsByName:v50];
  v76[2] = v49;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v48 = [[INIntentSlotDescription alloc] initWithName:@"parkingLocation" tag:1 facadePropertyName:@"parkingLocation" dataPropertyName:@"parkingLocation" isExtended:0 isPrivate:0 valueType:27 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[0] = v48;
  v47 = [[INIntentSlotDescription alloc] initWithName:@"parkingNote" tag:2 facadePropertyName:@"parkingNote" dataPropertyName:@"parkingNote" isExtended:0 isPrivate:0 valueType:30 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v72[1] = v47;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
  v45 = _INIntentSchemaBuildIntentSlotDescriptionMap(v46);
  v44 = [(INIntentResponseDescription *)v9 initWithName:@"SaveParkingLocationIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.geo.SaveParkingLocationIntentResponse" isPrivate:0 slotsByName:v45];
  v76[3] = v44;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v43 = [[INIntentSlotDescription alloc] initWithName:@"recipient" tag:1 facadePropertyName:@"recipients" dataPropertyName:@"recipients" isExtended:0 isPrivate:0 valueType:10 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v71[0] = v43;
  v42 = [[INIntentSlotDescription alloc] initWithName:@"medium" tag:2 facadePropertyName:@"mediums" dataPropertyName:@"mediums" isExtended:0 isPrivate:0 valueType:227 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v71[1] = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  v15 = _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v16 = [(INIntentResponseDescription *)v12 initWithName:@"ShareETAIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.geo.ShareETAIntentResponse" isPrivate:0 slotsByName:v15];
  v76[4] = v16;
  v17 = [INIntentResponseDescription alloc];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = [[INIntentSlotDescription alloc] initWithName:@"recipient" tag:1 facadePropertyName:@"recipients" dataPropertyName:@"recipients" isExtended:0 isPrivate:0 valueType:10 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v70[0] = v20;
  v21 = [[INIntentSlotDescription alloc] initWithName:@"medium" tag:2 facadePropertyName:@"mediums" dataPropertyName:@"mediums" isExtended:0 isPrivate:0 valueType:227 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v70[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  v23 = _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v24 = [(INIntentResponseDescription *)v17 initWithName:@"StopShareETAIntentResponse" facadeClass:v18 dataClass:v19 type:@"sirikit.intent.geo.StopShareETAIntentResponse" isPrivate:0 slotsByName:v23];
  v76[5] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:6];

  uint64_t v26 = [v25 count];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v29 = v25;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v66 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v35 = [v34 name];
        [v27 setObject:v34 forKey:v35];

        v36 = [v34 type];
        [v28 setObject:v34 forKey:v36];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v31);
  }

  uint64_t v37 = [v27 copy];
  v38 = (void *)sGeoDomain_intentResponseDescsByName;
  sGeoDomain_intentResponseDescsByName = v37;

  uint64_t v39 = [v28 copy];
  v40 = (void *)sGeoDomain_intentResponseDescsByType;
  sGeoDomain_intentResponseDescsByType = v39;
}

@end