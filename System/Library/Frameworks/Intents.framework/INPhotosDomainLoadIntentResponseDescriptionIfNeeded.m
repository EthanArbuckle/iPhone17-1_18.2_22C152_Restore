@interface INPhotosDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INPhotosDomainLoadIntentResponseDescriptionIfNeeded

void ___INPhotosDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v29 = [[INIntentSlotDescription alloc] initWithName:@"searchResultsCount" tag:7 facadePropertyName:@"searchResultsCount" dataPropertyName:@"searchResultsCount" isExtended:0 isPrivate:0 valueType:5 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v36 = v29;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v4 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v5 = [(INIntentResponseDescription *)v0 initWithName:@"SearchForPhotosIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.photos.SearchForPhotosIntentResponse" isPrivate:0 slotsByName:v4];
  v37[0] = v5;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = [[INIntentSlotDescription alloc] initWithName:@"searchResultsCount" tag:7 facadePropertyName:@"searchResultsCount" dataPropertyName:@"searchResultsCount" isExtended:0 isPrivate:0 valueType:5 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v35 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v11 = _INIntentSchemaBuildIntentSlotDescriptionMap(v10);
  v12 = [(INIntentResponseDescription *)v6 initWithName:@"StartPhotoPlaybackIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.photos.StartPhotoPlaybackIntentResponse" isPrivate:0 slotsByName:v11];
  v37[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];

  uint64_t v14 = [v13 count];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v14];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v23 = [v22 name];
        [v15 setObject:v22 forKey:v23];

        v24 = [v22 type];
        [v16 setObject:v22 forKey:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v19);
  }

  uint64_t v25 = [v15 copy];
  v26 = (void *)sPhotosDomain_intentResponseDescsByName;
  sPhotosDomain_intentResponseDescsByName = v25;

  uint64_t v27 = [v16 copy];
  v28 = (void *)sPhotosDomain_intentResponseDescsByType;
  sPhotosDomain_intentResponseDescsByType = v27;
}

@end