@interface INMediaDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INMediaDomainLoadIntentResponseDescriptionIfNeeded

void ___INMediaDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v47[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v39 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v38 = [(INIntentResponseDescription *)v0 initWithName:@"AddMediaIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.media.AddMediaIntentResponse" isPrivate:0 slotsByName:v39];
  v47[0] = v38;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v37 = [[INIntentSlotDescription alloc] initWithName:@"nowPlayingInfo" tag:1 facadePropertyName:@"nowPlayingInfo" dataPropertyName:@"nowPlayingInfo" isExtended:0 isPrivate:0 valueType:35 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v46 = v37;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v6 = _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v7 = [(INIntentResponseDescription *)v3 initWithName:@"PlayMediaIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.media.PlayMediaIntentResponse" isPrivate:0 slotsByName:v6];
  v47[1] = v7;
  v8 = [INIntentResponseDescription alloc];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = [[INIntentSlotDescription alloc] initWithName:@"mediaItems" tag:1 facadePropertyName:@"mediaItems" dataPropertyName:@"mediaItems" isExtended:0 isPrivate:0 valueType:153 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v45 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  v13 = _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v14 = [(INIntentResponseDescription *)v8 initWithName:@"SearchForMediaIntentResponse" facadeClass:v9 dataClass:v10 type:@"sirikit.intent.media.SearchForMediaIntentResponse" isPrivate:0 slotsByName:v13];
  v47[2] = v14;
  v15 = [INIntentResponseDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v19 = [(INIntentResponseDescription *)v15 initWithName:@"UpdateMediaAffinityIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.media.UpdateMediaAffinityIntentResponse" isPrivate:0 slotsByName:v18];
  v47[3] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];

  uint64_t v21 = [v20 count];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v21];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v21];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = v20;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v30 = [v29 name];
        [v22 setObject:v29 forKey:v30];

        v31 = [v29 type];
        [v23 setObject:v29 forKey:v31];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v26);
  }

  uint64_t v32 = [v22 copy];
  v33 = (void *)sMediaDomain_intentResponseDescsByName;
  sMediaDomain_intentResponseDescsByName = v32;

  uint64_t v34 = [v23 copy];
  v35 = (void *)sMediaDomain_intentResponseDescsByType;
  sMediaDomain_intentResponseDescsByType = v34;
}

@end