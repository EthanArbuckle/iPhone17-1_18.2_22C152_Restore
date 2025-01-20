@interface INRadioDomainLoadIntentDescriptionIfNeeded
@end

@implementation INRadioDomainLoadIntentDescriptionIfNeeded

void ___INRadioDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v26 = [INIntentDescription alloc];
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v0 = [[INIntentSlotDescription alloc] initWithName:@"radioType", 2, @"radioType", @"radioType", 0, 0, 149, 1, &unk_1EDBAA050, &unk_1EDBAA068, objc_opt_class(), sel_resolveRadioTypeForSetRadioStation_withCompletion_, sel_resolveRadioTypeForSetRadioStation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v32[0] = v0;
  v1 = [[INIntentSlotDescription alloc] initWithName:@"frequency", 3, @"frequency", @"frequency", 0, 0, 21, 1, &unk_1EDBAA080, &unk_1EDBAA098, objc_opt_class(), sel_resolveFrequencyForSetRadioStation_withCompletion_, sel_resolveFrequencyForSetRadioStation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v32[1] = v1;
  v2 = [[INIntentSlotDescription alloc] initWithName:@"stationName", 4, @"stationName", @"stationName", 0, 0, 30, 1, &unk_1EDBAA0B0, &unk_1EDBAA0C8, objc_opt_class(), sel_resolveStationNameForSetRadioStation_withCompletion_, sel_resolveStationNameForSetRadioStation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v32[2] = v2;
  v3 = [[INIntentSlotDescription alloc] initWithName:@"channel", 5, @"channel", @"channel", 0, 0, 30, 1, &unk_1EDBAA0E0, &unk_1EDBAA0F8, objc_opt_class(), sel_resolveChannelForSetRadioStation_withCompletion_, sel_resolveChannelForSetRadioStation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v32[3] = v3;
  v4 = [[INIntentSlotDescription alloc] initWithName:@"presetNumber", 6, @"presetNumber", @"presetNumber", 0, 0, 24, 1, &unk_1EDBAA110, &unk_1EDBAA128, objc_opt_class(), sel_resolvePresetNumberForSetRadioStation_withCompletion_, sel_resolvePresetNumberForSetRadioStation_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v32[4] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
  v6 = _INIntentSchemaBuildIntentSlotDescriptionMap(v5);
  v7 = [(INIntentDescription *)v26 initWithName:@"SetRadioStationIntent" responseName:@"SetRadioStationIntentResponse" facadeClass:v25 dataClass:v24 type:@"sirikit.intent.media_player.SetRadioStationIntent" isPrivate:0 handleSelector:sel_handleSetRadioStation_completion_ confirmSelector:sel_confirmSetRadioStation_completion_ slotsByName:v6];
  v33[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

  uint64_t v9 = [v8 count];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v9];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v18 = [v17 name];
        [v10 setObject:v17 forKey:v18];

        v19 = [v17 type];
        [v11 setObject:v17 forKey:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  uint64_t v20 = [v10 copy];
  v21 = (void *)sRadioDomain_intentDescsByName;
  sRadioDomain_intentDescsByName = v20;

  uint64_t v22 = [v11 copy];
  v23 = (void *)sRadioDomain_intentDescsByType;
  sRadioDomain_intentDescsByType = v22;
}

@end