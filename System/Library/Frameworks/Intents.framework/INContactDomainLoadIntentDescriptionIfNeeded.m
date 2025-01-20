@interface INContactDomainLoadIntentDescriptionIfNeeded
@end

@implementation INContactDomainLoadIntentDescriptionIfNeeded

void ___INContactDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v51[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v42 = [[INIntentSlotDescription alloc] initWithName:@"contactIdentifiers", 2, @"contactIdentifiers", @"contactIdentifiers", 0, 0, 30, 3, &unk_1EDBA8970, &unk_1EDBA8988, objc_opt_class(), sel_resolveContactIdentifiersForSearchForContact_withCompletion_, sel_resolveContactIdentifiersForSearchForContact_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v50 = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v39 = [(INIntentDescription *)v0 initWithName:@"SearchForContactIntent" responseName:@"SearchForContactIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.contact.SearchForContactIntent" isPrivate:0 handleSelector:sel_handleSearchForContact_completion_ confirmSelector:sel_confirmSearchForContact_completion_ slotsByName:v40];
  v51[0] = v39;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v38 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v37 = [(INIntentDescription *)v3 initWithName:@"SearchForMeCardIntent" responseName:@"SearchForMeCardIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.contact.SearchForMeCardIntent" isPrivate:0 handleSelector:sel_handleSearchForMeCard_completion_ confirmSelector:sel_confirmSearchForMeCard_completion_ slotsByName:v38];
  v51[1] = v37;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v36 = [[INIntentSlotDescription alloc] initWithName:@"targetNickname", 2, @"targetNickname", @"targetNickname", 0, 0, 194, 1, &unk_1EDBA89A0, &unk_1EDBA89B8, objc_opt_class(), sel_resolveTargetNicknameForSetNickname_withCompletion_, sel_resolveTargetNicknameForSetNickname_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v49 = v36;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v34 = _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v9 = [(INIntentDescription *)v6 initWithName:@"SetNicknameIntent" responseName:@"SetNicknameIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.contact.SetNicknameIntent" isPrivate:0 handleSelector:sel_handleSetNickname_completion_ confirmSelector:sel_confirmSetNickname_completion_ slotsByName:v34];
  v51[2] = v9;
  v33 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = [[INIntentSlotDescription alloc] initWithName:@"contactIdentifiers", 2, @"contactIdentifiers", @"contactIdentifiers", 0, 0, 30, 3, &unk_1EDBA89D0, &unk_1EDBA89E8, objc_opt_class(), sel_resolveContactIdentifiersForSetRelationship_withCompletion_, sel_resolveContactIdentifiersForSetRelationship_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v48[0] = v12;
  v13 = [[INIntentSlotDescription alloc] initWithName:@"targetRelationship", 3, @"targetRelationship", @"targetRelationship", 0, 0, 193, 1, &unk_1EDBA8A00, &unk_1EDBA8A18, objc_opt_class(), sel_resolveTargetRelationshipForSetRelationship_withCompletion_, sel_resolveTargetRelationshipForSetRelationship_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v48[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  v15 = _INIntentSchemaBuildIntentSlotDescriptionMap(v14);
  v16 = [(INIntentDescription *)v33 initWithName:@"SetRelationshipIntent" responseName:@"SetRelationshipIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.contact.SetRelationshipIntent" isPrivate:0 handleSelector:sel_handleSetRelationship_completion_ confirmSelector:sel_confirmSetRelationship_completion_ slotsByName:v15];
  v51[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];

  uint64_t v18 = [v17 count];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v18];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = v17;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v27 = [v26 name];
        [v19 setObject:v26 forKey:v27];

        v28 = [v26 type];
        [v20 setObject:v26 forKey:v28];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v23);
  }

  uint64_t v29 = [v19 copy];
  v30 = (void *)sContactDomain_intentDescsByName;
  sContactDomain_intentDescsByName = v29;

  uint64_t v31 = [v20 copy];
  v32 = (void *)sContactDomain_intentDescsByType;
  sContactDomain_intentDescsByType = v31;
}

@end