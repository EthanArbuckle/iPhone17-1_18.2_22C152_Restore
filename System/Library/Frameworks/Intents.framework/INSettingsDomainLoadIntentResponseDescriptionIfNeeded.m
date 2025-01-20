@interface INSettingsDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INSettingsDomainLoadIntentResponseDescriptionIfNeeded

void ___INSettingsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v81[6] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v69 = [[INIntentSlotDescription alloc] initWithName:@"settingResponseData" tag:1 facadePropertyName:@"settingResponseDatas" dataPropertyName:@"settingResponseDatas" isExtended:0 isPrivate:0 valueType:232 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v80[0] = v69;
  v68 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:2 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v80[1] = v68;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  v66 = _INIntentSchemaBuildIntentSlotDescriptionMap(v67);
  v65 = [(INIntentResponseDescription *)v0 initWithName:@"GetSettingIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.settings.GetSettingIntentResponse" isPrivate:0 slotsByName:v66];
  v81[0] = v65;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v64 = [[INIntentSlotDescription alloc] initWithName:@"punchoutUrl" tag:1 facadePropertyName:@"punchoutUrl" dataPropertyName:@"punchoutUrl" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v79[0] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:2 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v79[1] = v63;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v60 = [(INIntentResponseDescription *)v3 initWithName:@"OpenSettingIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.settings.OpenSettingIntentResponse" isPrivate:0 slotsByName:v61];
  v81[1] = v60;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v59 = [[INIntentSlotDescription alloc] initWithName:@"oldValue" tag:1 facadePropertyName:@"oldValue" dataPropertyName:@"oldValue" isExtended:0 isPrivate:0 valueType:234 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v78[0] = v59;
  v58 = [[INIntentSlotDescription alloc] initWithName:@"updatedValue" tag:2 facadePropertyName:@"updatedValue" dataPropertyName:@"updatedValue" isExtended:0 isPrivate:0 valueType:234 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v78[1] = v58;
  v57 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:3 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v78[2] = v57;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:3];
  v55 = _INIntentSchemaBuildIntentSlotDescriptionMap(v56);
  v54 = [(INIntentResponseDescription *)v6 initWithName:@"SetBinarySettingIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.settings.SetBinarySettingIntentResponse" isPrivate:0 slotsByName:v55];
  v81[2] = v54;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v53 = [[INIntentSlotDescription alloc] initWithName:@"oldValue" tag:1 facadePropertyName:@"oldValue" dataPropertyName:@"oldValue" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[0] = v53;
  v52 = [[INIntentSlotDescription alloc] initWithName:@"updatedValue" tag:2 facadePropertyName:@"updatedValue" dataPropertyName:@"updatedValue" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[1] = v52;
  v51 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:3 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v77[2] = v51;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
  v49 = _INIntentSchemaBuildIntentSlotDescriptionMap(v50);
  v48 = [(INIntentResponseDescription *)v9 initWithName:@"SetLabeledSettingIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.settings.SetLabeledSettingIntentResponse" isPrivate:0 slotsByName:v49];
  v81[3] = v48;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v47 = [[INIntentSlotDescription alloc] initWithName:@"oldValue" tag:1 facadePropertyName:@"oldValue" dataPropertyName:@"oldValue" isExtended:0 isPrivate:0 valueType:233 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[0] = v47;
  v46 = [[INIntentSlotDescription alloc] initWithName:@"updatedValue" tag:2 facadePropertyName:@"updatedValue" dataPropertyName:@"updatedValue" isExtended:0 isPrivate:0 valueType:233 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[1] = v46;
  v45 = [[INIntentSlotDescription alloc] initWithName:@"minValue" tag:3 facadePropertyName:@"minValue" dataPropertyName:@"minValue" isExtended:0 isPrivate:0 valueType:233 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[2] = v45;
  v44 = [[INIntentSlotDescription alloc] initWithName:@"maxValue" tag:4 facadePropertyName:@"maxValue" dataPropertyName:@"maxValue" isExtended:0 isPrivate:0 valueType:233 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[3] = v44;
  v43 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:5 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v76[4] = v43;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:5];
  v41 = _INIntentSchemaBuildIntentSlotDescriptionMap(v42);
  v15 = [(INIntentResponseDescription *)v12 initWithName:@"SetNumericSettingIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.settings.SetNumericSettingIntentResponse" isPrivate:0 slotsByName:v41];
  v81[4] = v15;
  v16 = [INIntentResponseDescription alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = [[INIntentSlotDescription alloc] initWithName:@"oldValue" tag:1 facadePropertyName:@"oldValue" dataPropertyName:@"oldValue" isExtended:0 isPrivate:0 valueType:16 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[0] = v19;
  v20 = [[INIntentSlotDescription alloc] initWithName:@"updatedValue" tag:2 facadePropertyName:@"updatedValue" dataPropertyName:@"updatedValue" isExtended:0 isPrivate:0 valueType:16 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[1] = v20;
  v21 = [[INIntentSlotDescription alloc] initWithName:@"errorDetail" tag:3 facadePropertyName:@"errorDetail" dataPropertyName:@"errorDetail" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v75[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  v23 = _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v24 = [(INIntentResponseDescription *)v16 initWithName:@"SetTemporalSettingIntentResponse" facadeClass:v17 dataClass:v18 type:@"sirikit.intent.settings.SetTemporalSettingIntentResponse" isPrivate:0 slotsByName:v23];
  v81[5] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:6];

  uint64_t v26 = [v25 count];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v26];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v29 = v25;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v71 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        v35 = [v34 name];
        [v27 setObject:v34 forKey:v35];

        v36 = [v34 type];
        [v28 setObject:v34 forKey:v36];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v31);
  }

  uint64_t v37 = [v27 copy];
  v38 = (void *)sSettingsDomain_intentResponseDescsByName;
  sSettingsDomain_intentResponseDescsByName = v37;

  uint64_t v39 = [v28 copy];
  v40 = (void *)sSettingsDomain_intentResponseDescsByType;
  sSettingsDomain_intentResponseDescsByType = v39;
}

@end