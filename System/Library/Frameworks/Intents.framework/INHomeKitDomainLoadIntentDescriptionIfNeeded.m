@interface INHomeKitDomainLoadIntentDescriptionIfNeeded
@end

@implementation INHomeKitDomainLoadIntentDescriptionIfNeeded

void ___INHomeKitDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v56[4] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v46 = [[INIntentSlotDescription alloc] initWithName:@"entities", 2, @"entities", @"entities", 0, 0, 46, 3, &unk_1EDBA8C70, &unk_1EDBA8C88, objc_opt_class(), sel_resolveEntitiesForConfigureHome_withCompletion_, sel_resolveEntitiesForConfigureHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v55 = v46;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v44 = _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v43 = [(INIntentDescription *)v0 initWithName:@"ConfigureHomeIntent" responseName:@"ConfigureHomeIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.home.ConfigureHomeIntent" isPrivate:0 handleSelector:sel_handleConfigureHome_completion_ confirmSelector:sel_confirmConfigureHome_completion_ slotsByName:v44];
  v56[0] = v43;
  v36 = [INIntentDescription alloc];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v42 = [[INIntentSlotDescription alloc] initWithName:@"userTask", 5, @"userTask", @"userTask", 0, 0, 48, 1, &unk_1EDBA8CA0, &unk_1EDBA8CB8, objc_opt_class(), sel_resolveUserTaskForControlHome_withCompletion_, sel_resolveUserTaskForControlHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v54[0] = v42;
  v41 = [[INIntentSlotDescription alloc] initWithName:@"filters", 6, @"filters", @"filters", 0, 0, 49, 3, &unk_1EDBA8CD0, &unk_1EDBA8CE8, objc_opt_class(), sel_resolveFiltersForControlHome_withCompletion_, sel_resolveFiltersForControlHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v54[1] = v41;
  v40 = [[INIntentSlotDescription alloc] initWithName:@"time", 7, @"time", @"time", 0, 0, 16, 1, &unk_1EDBA8D00, &unk_1EDBA8D18, objc_opt_class(), sel_resolveTimeForControlHome_withCompletion_, sel_resolveTimeForControlHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v54[2] = v40;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  v38 = _INIntentSchemaBuildIntentSlotDescriptionMap(v39);
  v37 = [(INIntentDescription *)v36 initWithName:@"ControlHomeIntent" responseName:@"ControlHomeIntentResponse" facadeClass:v3 dataClass:v4 type:@"sirikit.intent.home.ControlHomeIntent" isPrivate:0 handleSelector:sel_handleControlHome_completion_ confirmSelector:sel_confirmControlHome_completion_ slotsByName:v38];
  v56[1] = v37;
  v5 = [INIntentDescription alloc];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v35 = [[INIntentSlotDescription alloc] initWithName:@"entities", 2, @"entities", @"entities", 0, 0, 46, 3, &unk_1EDBA8D30, &unk_1EDBA8D48, objc_opt_class(), sel_resolveEntitiesForQueryHome_withCompletion_, sel_resolveEntitiesForQueryHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v53 = v35;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  v33 = _INIntentSchemaBuildIntentSlotDescriptionMap(v34);
  v8 = [(INIntentDescription *)v5 initWithName:@"QueryHomeIntent" responseName:@"QueryHomeIntentResponse" facadeClass:v6 dataClass:v7 type:@"sirikit.intent.home.QueryHomeIntent" isPrivate:0 handleSelector:sel_handleQueryHome_completion_ confirmSelector:sel_confirmQueryHome_completion_ slotsByName:v33];
  v56[2] = v8;
  v32 = [INIntentDescription alloc];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = [[INIntentSlotDescription alloc] initWithName:@"filters", 2, @"filters", @"filters", 0, 0, 49, 3, &unk_1EDBA8D60, &unk_1EDBA8D78, objc_opt_class(), sel_resolveFiltersForShowHome_withCompletion_, sel_resolveFiltersForShowHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[0] = v11;
  v12 = [[INIntentSlotDescription alloc] initWithName:@"time", 3, @"time", @"time", 0, 0, 16, 1, &unk_1EDBA8D90, &unk_1EDBA8DA8, objc_opt_class(), sel_resolveTimeForShowHome_withCompletion_, sel_resolveTimeForShowHome_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v52[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v14 = _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v15 = [(INIntentDescription *)v32 initWithName:@"ShowHomeIntent" responseName:@"ShowHomeIntentResponse" facadeClass:v9 dataClass:v10 type:@"sirikit.intent.home.ShowHomeIntent" isPrivate:0 handleSelector:sel_handleShowHome_completion_ confirmSelector:sel_confirmShowHome_completion_ slotsByName:v14];
  v56[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];

  uint64_t v17 = [v16 count];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v17];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v17];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v26 = [v25 name];
        [v18 setObject:v25 forKey:v26];

        v27 = [v25 type];
        [v19 setObject:v25 forKey:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v22);
  }

  uint64_t v28 = [v18 copy];
  v29 = (void *)sHomeKitDomain_intentDescsByName;
  sHomeKitDomain_intentDescsByName = v28;

  uint64_t v30 = [v19 copy];
  v31 = (void *)sHomeKitDomain_intentDescsByType;
  sHomeKitDomain_intentDescsByType = v30;
}

@end