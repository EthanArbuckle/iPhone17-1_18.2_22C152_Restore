@interface INVisualCodeDomainLoadIntentDescriptionIfNeeded
@end

@implementation INVisualCodeDomainLoadIntentDescriptionIfNeeded

void ___INVisualCodeDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v3 = [[INIntentSlotDescription alloc] initWithName:@"visualCodeType", 2, @"visualCodeType", @"visualCodeType", 0, 0, 114, 1, &unk_1EDBAA9E0, &unk_1EDBAA9F8, objc_opt_class(), sel_resolveVisualCodeTypeForGetVisualCode_withCompletion_, sel_resolveVisualCodeTypeForGetVisualCode_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v33 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v5 = _INIntentSchemaBuildIntentSlotDescriptionMap(v4);
  v6 = [(INIntentDescription *)v0 initWithName:@"GetVisualCodeIntent" responseName:@"GetVisualCodeIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.GetVisualCodeIntent" isPrivate:0 handleSelector:sel_handleGetVisualCode_completion_ confirmSelector:sel_confirmGetVisualCode_completion_ slotsByName:v5];
  v34[0] = v6;
  v7 = [INIntentDescription alloc];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v11 = [(INIntentDescription *)v7 initWithName:@"ScanVisualCodeIntent" responseName:@"ScanVisualCodeIntentResponse" facadeClass:v8 dataClass:v9 type:@"sirikit.intent.ScanVisualCodeIntent" isPrivate:0 handleSelector:sel_handleScanVisualCode_completion_ confirmSelector:sel_confirmScanVisualCode_completion_ slotsByName:v10];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];

  uint64_t v13 = [v12 count];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v13];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v22 = [v21 name];
        [v14 setObject:v21 forKey:v22];

        v23 = [v21 type];
        [v15 setObject:v21 forKey:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  uint64_t v24 = [v14 copy];
  v25 = (void *)sVisualCodeDomain_intentDescsByName;
  sVisualCodeDomain_intentDescsByName = v24;

  uint64_t v26 = [v15 copy];
  v27 = (void *)sVisualCodeDomain_intentDescsByType;
  sVisualCodeDomain_intentDescsByType = v26;
}

@end