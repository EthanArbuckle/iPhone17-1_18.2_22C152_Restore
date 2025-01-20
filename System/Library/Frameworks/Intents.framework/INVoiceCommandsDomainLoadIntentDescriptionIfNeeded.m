@interface INVoiceCommandsDomainLoadIntentDescriptionIfNeeded
@end

@implementation INVoiceCommandsDomainLoadIntentDescriptionIfNeeded

void ___INVoiceCommandsDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v33 = [[INIntentSlotDescription alloc] initWithName:@"originDevice" tag:2 facadePropertyName:@"originDevice" dataPropertyName:@"originDevice" isExtended:0 isPrivate:0 valueType:203 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v40[0] = v33;
  v32 = [[INIntentSlotDescription alloc] initWithName:@"appTitle", 3, @"appTitles", @"appTitles", 0, 0, 202, 3, &unk_1EDBAAA10, &unk_1EDBAAA28, objc_opt_class(), sel_resolveAppTitlesForListShortcuts_withCompletion_, sel_resolveAppTitlesForListShortcuts_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v40[1] = v32;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v30 = _INIntentSchemaBuildIntentSlotDescriptionMap(v31);
  v3 = [(INIntentDescription *)v0 initWithName:@"ListShortcutsIntent" responseName:@"ListShortcutsIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.voice_commands.ListShortcutsIntent" isPrivate:0 handleSelector:sel_handleListShortcuts_completion_ confirmSelector:sel_confirmListShortcuts_completion_ slotsByName:v30];
  v41[0] = v3;
  v29 = [INIntentDescription alloc];
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v4 = [[INIntentSlotDescription alloc] initWithName:@"voiceCommand", 2, @"voiceCommand", @"voiceCommand", 0, 0, 12, 1, &unk_1EDBAAA40, &unk_1EDBAAA58, objc_opt_class(), sel_resolveVoiceCommandForRunVoiceCommand_withCompletion_, sel_resolveVoiceCommandForRunVoiceCommand_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v39[0] = v4;
  v5 = [[INIntentSlotDescription alloc] initWithName:@"originDevice" tag:3 facadePropertyName:@"originDevice" dataPropertyName:@"originDevice" isExtended:0 isPrivate:0 valueType:198 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v39[1] = v5;
  v6 = [[INIntentSlotDescription alloc] initWithName:@"executionResult", 4, @"executionResult", @"executionResult", 0, 0, 200, 1, &unk_1EDBAAA70, &unk_1EDBAAA88, objc_opt_class(), sel_resolveExecutionResultForRunVoiceCommand_withCompletion_, sel_resolveExecutionResultForRunVoiceCommand_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v39[2] = v6;
  v7 = [[INIntentSlotDescription alloc] initWithName:@"previousIntentIdentifier" tag:5 facadePropertyName:@"previousIntentIdentifier" dataPropertyName:@"previousIntentIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v39[3] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  v9 = _INIntentSchemaBuildIntentSlotDescriptionMap(v8);
  v10 = [(INIntentDescription *)v29 initWithName:@"RunVoiceCommandIntent" responseName:@"RunVoiceCommandIntentResponse" facadeClass:v28 dataClass:v27 type:@"sirikit.intent.voice_commands.RunVoiceCommandIntent" isPrivate:0 handleSelector:sel_handleRunVoiceCommand_completion_ confirmSelector:sel_confirmRunVoiceCommand_completion_ slotsByName:v9];
  v41[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];

  uint64_t v12 = [v11 count];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = v11;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v21 = [v20 name];
        [v13 setObject:v20 forKey:v21];

        v22 = [v20 type];
        [v14 setObject:v20 forKey:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v17);
  }

  uint64_t v23 = [v13 copy];
  v24 = (void *)sVoiceCommandsDomain_intentDescsByName;
  sVoiceCommandsDomain_intentDescsByName = v23;

  uint64_t v25 = [v14 copy];
  v26 = (void *)sVoiceCommandsDomain_intentDescsByType;
  sVoiceCommandsDomain_intentDescsByType = v25;
}

@end