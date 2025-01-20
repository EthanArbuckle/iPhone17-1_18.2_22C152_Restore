@interface INWorkflowDomainLoadIntentDescriptionIfNeeded
@end

@implementation INWorkflowDomainLoadIntentDescriptionIfNeeded

void ___INWorkflowDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = [[INIntentSlotDescription alloc] initWithName:@"workflow", 2, @"workflow", @"workflow", 0, 0, 12, 1, &unk_1EDBAACE0, &unk_1EDBAACF8, objc_opt_class(), sel_resolveWorkflowForRunWorkflow_withCompletion_, sel_resolveWorkflowForRunWorkflow_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v28 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v5 = _INIntentSchemaBuildIntentSlotDescriptionMap(v4);
  v6 = [(INIntentDescription *)v0 initWithName:@"RunWorkflowIntent" responseName:@"RunWorkflowIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.workflow.RunWorkflowIntent" isPrivate:0 handleSelector:sel_handleRunWorkflow_completion_ confirmSelector:sel_confirmRunWorkflow_completion_ slotsByName:v5];
  v29[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

  uint64_t v8 = [v7 count];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = [v16 name];
        [v9 setObject:v16 forKey:v17];

        v18 = [v16 type];
        [v10 setObject:v16 forKey:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  uint64_t v19 = [v9 copy];
  v20 = (void *)sWorkflowDomain_intentDescsByName;
  sWorkflowDomain_intentDescsByName = v19;

  uint64_t v21 = [v10 copy];
  v22 = (void *)sWorkflowDomain_intentDescsByType;
  sWorkflowDomain_intentDescsByType = v21;
}

@end