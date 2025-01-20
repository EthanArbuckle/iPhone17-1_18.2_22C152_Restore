@interface INMessagesDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INMessagesDomainLoadIntentResponseDescriptionIfNeeded

void ___INMessagesDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v64[7] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E4F1CBF0];
  v56 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v55 = [(INIntentResponseDescription *)v0 initWithName:@"EditMessageIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.messages.EditMessageIntentResponse" isPrivate:0 slotsByName:v56];
  v64[0] = v55;
  v4 = [INIntentResponseDescription alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v54 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v53 = [(INIntentResponseDescription *)v4 initWithName:@"PlayAudioMessageIntentResponse" facadeClass:v5 dataClass:v6 type:@"sirikit.intent.messages.PlayAudioMessageIntentResponse" isPrivate:0 slotsByName:v54];
  v64[1] = v53;
  v7 = [INIntentResponseDescription alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v52 = _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v51 = [(INIntentResponseDescription *)v7 initWithName:@"PlayMessageSoundIntentResponse" facadeClass:v8 dataClass:v9 type:@"sirikit.intent.messages.PlayMessageSoundIntentResponse" isPrivate:0 slotsByName:v52];
  v64[2] = v51;
  v10 = [INIntentResponseDescription alloc];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v50 = [[INIntentSlotDescription alloc] initWithName:@"messages" tag:2 facadePropertyName:@"messages" dataPropertyName:@"messages" isExtended:0 isPrivate:0 valueType:29 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v63 = v50;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
  v48 = _INIntentSchemaBuildIntentSlotDescriptionMap(v49);
  v47 = [(INIntentResponseDescription *)v10 initWithName:@"SearchForMessagesIntentResponse" facadeClass:v11 dataClass:v12 type:@"sirikit.intent.messages.SearchForMessagesIntentResponse" isPrivate:0 slotsByName:v48];
  v64[3] = v47;
  v13 = [INIntentResponseDescription alloc];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = [[INIntentSlotDescription alloc] initWithName:@"sentMessages" tag:2 facadePropertyName:@"sentMessages" dataPropertyName:@"sentMessages" isExtended:0 isPrivate:0 valueType:29 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v62 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v18 = _INIntentSchemaBuildIntentSlotDescriptionMap(v17);
  v19 = [(INIntentResponseDescription *)v13 initWithName:@"SendMessageIntentResponse" facadeClass:v14 dataClass:v15 type:@"sirikit.intent.messages.SendMessageIntentResponse" isPrivate:0 slotsByName:v18];
  v64[4] = v19;
  v20 = [INIntentResponseDescription alloc];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = (void *)MEMORY[0x1E4F1CBF0];
  v24 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v25 = [(INIntentResponseDescription *)v20 initWithName:@"SetMessageAttributeIntentResponse" facadeClass:v21 dataClass:v22 type:@"sirikit.intent.messages.SetMessageAttributeIntentResponse" isPrivate:0 slotsByName:v24];
  v64[5] = v25;
  v26 = [INIntentResponseDescription alloc];
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v29 = _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v30 = [(INIntentResponseDescription *)v26 initWithName:@"UnsendMessagesIntentResponse" facadeClass:v27 dataClass:v28 type:@"sirikit.intent.messages.UnsendMessagesIntentResponse" isPrivate:0 slotsByName:v29];
  v64[6] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:7];

  uint64_t v32 = [v31 count];
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v32];
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v32];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v35 = v31;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v41 = [v40 name];
        [v33 setObject:v40 forKey:v41];

        v42 = [v40 type];
        [v34 setObject:v40 forKey:v42];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v37);
  }

  uint64_t v43 = [v33 copy];
  v44 = (void *)sMessagesDomain_intentResponseDescsByName;
  sMessagesDomain_intentResponseDescsByName = v43;

  uint64_t v45 = [v34 copy];
  v46 = (void *)sMessagesDomain_intentResponseDescsByType;
  sMessagesDomain_intentResponseDescsByType = v45;
}

@end