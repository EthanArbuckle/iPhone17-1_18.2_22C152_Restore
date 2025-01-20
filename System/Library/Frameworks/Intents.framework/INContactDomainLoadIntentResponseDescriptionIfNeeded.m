@interface INContactDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INContactDomainLoadIntentResponseDescriptionIfNeeded

void ___INContactDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v53[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v43 = [[INIntentSlotDescription alloc] initWithName:@"matchedContacts" tag:1 facadePropertyName:@"matchedContacts" dataPropertyName:@"matchedContacts" isExtended:0 isPrivate:0 valueType:195 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v52 = v43;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  v41 = _INIntentSchemaBuildIntentSlotDescriptionMap(v42);
  v40 = [(INIntentResponseDescription *)v0 initWithName:@"SearchForContactIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.contact.SearchForContactIntentResponse" isPrivate:0 slotsByName:v41];
  v53[0] = v40;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v39 = [[INIntentSlotDescription alloc] initWithName:@"meCard" tag:1 facadePropertyName:@"meCard" dataPropertyName:@"meCard" isExtended:0 isPrivate:0 valueType:195 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v51 = v39;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v37 = _INIntentSchemaBuildIntentSlotDescriptionMap(v38);
  v36 = [(INIntentResponseDescription *)v3 initWithName:@"SearchForMeCardIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.contact.SearchForMeCardIntentResponse" isPrivate:0 slotsByName:v37];
  v53[1] = v36;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v35 = [[INIntentSlotDescription alloc] initWithName:@"meCard" tag:1 facadePropertyName:@"meCard" dataPropertyName:@"meCard" isExtended:0 isPrivate:0 valueType:195 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v50 = v35;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v10 = _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v11 = [(INIntentResponseDescription *)v6 initWithName:@"SetNicknameIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.contact.SetNicknameIntentResponse" isPrivate:0 slotsByName:v10];
  v53[2] = v11;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = [[INIntentSlotDescription alloc] initWithName:@"meCard" tag:1 facadePropertyName:@"meCard" dataPropertyName:@"meCard" isExtended:0 isPrivate:0 valueType:195 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v49 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v17 = _INIntentSchemaBuildIntentSlotDescriptionMap(v16);
  v18 = [(INIntentResponseDescription *)v12 initWithName:@"SetRelationshipIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.contact.SetRelationshipIntentResponse" isPrivate:0 slotsByName:v17];
  v53[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:4];

  uint64_t v20 = [v19 count];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v20];
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v20];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v23 = v19;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v29 = [v28 name];
        [v21 setObject:v28 forKey:v29];

        v30 = [v28 type];
        [v22 setObject:v28 forKey:v30];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v25);
  }

  uint64_t v31 = [v21 copy];
  v32 = (void *)sContactDomain_intentResponseDescsByName;
  sContactDomain_intentResponseDescsByName = v31;

  uint64_t v33 = [v22 copy];
  v34 = (void *)sContactDomain_intentResponseDescsByType;
  sContactDomain_intentResponseDescsByType = v33;
}

@end