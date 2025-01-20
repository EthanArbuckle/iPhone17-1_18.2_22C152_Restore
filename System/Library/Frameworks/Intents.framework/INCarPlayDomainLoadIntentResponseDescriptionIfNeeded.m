@interface INCarPlayDomainLoadIntentResponseDescriptionIfNeeded
@end

@implementation INCarPlayDomainLoadIntentResponseDescriptionIfNeeded

void ___INCarPlayDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  v106[11] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentResponseDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v96 = [[INIntentSlotDescription alloc] initWithName:@"signals" tag:1 facadePropertyName:@"signals" dataPropertyName:@"signals" isExtended:0 isPrivate:0 valueType:143 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v105 = v96;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  v94 = _INIntentSchemaBuildIntentSlotDescriptionMap(v95);
  v93 = [(INIntentResponseDescription *)v0 initWithName:@"ActivateCarSignalIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.car_commands.ActivateCarSignalIntentResponse" isPrivate:0 slotsByName:v94];
  v106[0] = v93;
  v3 = [INIntentResponseDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v92 = [[INIntentSlotDescription alloc] initWithName:@"locked" tag:1 facadePropertyName:@"locked" dataPropertyName:@"locked" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v104 = v92;
  v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
  v90 = _INIntentSchemaBuildIntentSlotDescriptionMap(v91);
  v89 = [(INIntentResponseDescription *)v3 initWithName:@"GetCarLockStatusIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.car_commands.GetCarLockStatusIntentResponse" isPrivate:0 slotsByName:v90];
  v106[1] = v89;
  v6 = [INIntentResponseDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v88 = [[INIntentSlotDescription alloc] initWithName:@"carIdentifier" tag:17 facadePropertyName:@"carIdentifier" dataPropertyName:@"carIdentifier" isExtended:0 isPrivate:0 valueType:7 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[0] = v88;
  v87 = [[INIntentSlotDescription alloc] initWithName:@"fuelPercentRemaining" tag:1 facadePropertyName:@"fuelPercentRemaining" dataPropertyName:@"fuelPercentRemaining" isExtended:0 isPrivate:0 valueType:21 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[1] = v87;
  v86 = [[INIntentSlotDescription alloc] initWithName:@"chargePercentRemaining" tag:2 facadePropertyName:@"chargePercentRemaining" dataPropertyName:@"chargePercentRemaining" isExtended:0 isPrivate:0 valueType:21 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[2] = v86;
  v85 = [[INIntentSlotDescription alloc] initWithName:@"distanceRemaining" tag:3 facadePropertyName:@"distanceRemaining" dataPropertyName:@"distanceRemaining" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[3] = v85;
  v84 = [[INIntentSlotDescription alloc] initWithName:@"charging" tag:4 facadePropertyName:@"charging" dataPropertyName:@"charging" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[4] = v84;
  v83 = [[INIntentSlotDescription alloc] initWithName:@"minutesToFull" tag:5 facadePropertyName:@"minutesToFull" dataPropertyName:@"minutesToFull" isExtended:0 isPrivate:0 valueType:24 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[5] = v83;
  v82 = [[INIntentSlotDescription alloc] initWithName:@"maximumDistance" tag:6 facadePropertyName:@"maximumDistance" dataPropertyName:@"maximumDistance" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[6] = v82;
  v81 = [[INIntentSlotDescription alloc] initWithName:@"distanceRemainingElectric" tag:7 facadePropertyName:@"distanceRemainingElectric" dataPropertyName:@"distanceRemainingElectric" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[7] = v81;
  v80 = [[INIntentSlotDescription alloc] initWithName:@"maximumDistanceElectric" tag:8 facadePropertyName:@"maximumDistanceElectric" dataPropertyName:@"maximumDistanceElectric" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[8] = v80;
  v79 = [[INIntentSlotDescription alloc] initWithName:@"distanceRemainingFuel" tag:9 facadePropertyName:@"distanceRemainingFuel" dataPropertyName:@"distanceRemainingFuel" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[9] = v79;
  v78 = [[INIntentSlotDescription alloc] initWithName:@"maximumDistanceFuel" tag:10 facadePropertyName:@"maximumDistanceFuel" dataPropertyName:@"maximumDistanceFuel" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[10] = v78;
  v77 = [[INIntentSlotDescription alloc] initWithName:@"consumptionFormulaArguments" tag:15 facadePropertyName:@"consumptionFormulaArguments" dataPropertyName:@"consumptionFormulaArguments" isExtended:0 isPrivate:0 valueType:237 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[11] = v77;
  v76 = [[INIntentSlotDescription alloc] initWithName:@"chargingFormulaArguments" tag:16 facadePropertyName:@"chargingFormulaArguments" dataPropertyName:@"chargingFormulaArguments" isExtended:0 isPrivate:0 valueType:237 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[12] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"dateOfLastStateUpdate" tag:18 facadePropertyName:@"dateOfLastStateUpdate" dataPropertyName:@"dateOfLastStateUpdate" isExtended:0 isPrivate:0 valueType:14 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[13] = v75;
  v74 = [[INIntentSlotDescription alloc] initWithName:@"activeConnector" tag:19 facadePropertyName:@"activeConnector" dataPropertyName:@"activeConnector" isExtended:0 isPrivate:0 valueType:148 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[14] = v74;
  v73 = [[INIntentSlotDescription alloc] initWithName:@"maximumBatteryCapacity" tag:20 facadePropertyName:@"maximumBatteryCapacity" dataPropertyName:@"maximumBatteryCapacity" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[15] = v73;
  v72 = [[INIntentSlotDescription alloc] initWithName:@"currentBatteryCapacity" tag:21 facadePropertyName:@"currentBatteryCapacity" dataPropertyName:@"currentBatteryCapacity" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[16] = v72;
  v71 = [[INIntentSlotDescription alloc] initWithName:@"minimumBatteryCapacity" tag:22 facadePropertyName:@"minimumBatteryCapacity" dataPropertyName:@"minimumBatteryCapacity" isExtended:0 isPrivate:0 valueType:0 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v103[17] = v71;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:18];
  v69 = _INIntentSchemaBuildIntentSlotDescriptionMap(v70);
  v68 = [(INIntentResponseDescription *)v6 initWithName:@"GetCarPowerLevelStatusIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.car_commands.GetCarPowerLevelStatusIntentResponse" isPrivate:0 slotsByName:v69];
  v106[2] = v68;
  v9 = [INIntentResponseDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v67 = [[INIntentSlotDescription alloc] initWithName:@"cars" tag:1 facadePropertyName:@"cars" dataPropertyName:@"cars" isExtended:0 isPrivate:0 valueType:144 valueStyle:3 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v102 = v67;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v65 = _INIntentSchemaBuildIntentSlotDescriptionMap(v66);
  v64 = [(INIntentResponseDescription *)v9 initWithName:@"ListCarsIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.car_commands.ListCarsIntentResponse" isPrivate:0 slotsByName:v65];
  v106[3] = v64;
  v12 = [INIntentResponseDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = (void *)MEMORY[0x1E4F1CBF0];
  v63 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v62 = [(INIntentResponseDescription *)v12 initWithName:@"SaveProfileInCarIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.car_commands.SaveProfileInCarIntentResponse" isPrivate:0 slotsByName:v63];
  v106[4] = v62;
  v16 = [INIntentResponseDescription alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v61 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v60 = [(INIntentResponseDescription *)v16 initWithName:@"SetAudioSourceInCarIntentResponse" facadeClass:v17 dataClass:v18 type:@"sirikit.intent.car_commands.SetAudioSourceInCarIntentResponse" isPrivate:0 slotsByName:v61];
  v106[5] = v60;
  v19 = [INIntentResponseDescription alloc];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v59 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v58 = [(INIntentResponseDescription *)v19 initWithName:@"SetCarLockStatusIntentResponse" facadeClass:v20 dataClass:v21 type:@"sirikit.intent.car_commands.SetCarLockStatusIntentResponse" isPrivate:0 slotsByName:v59];
  v106[6] = v58;
  v22 = [INIntentResponseDescription alloc];
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v25 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v26 = [(INIntentResponseDescription *)v22 initWithName:@"SetClimateSettingsInCarIntentResponse" facadeClass:v23 dataClass:v24 type:@"sirikit.intent.car_commands.SetClimateSettingsInCarIntentResponse" isPrivate:0 slotsByName:v25];
  v106[7] = v26;
  v27 = [INIntentResponseDescription alloc];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v31 = [(INIntentResponseDescription *)v27 initWithName:@"SetDefrosterSettingsInCarIntentResponse" facadeClass:v28 dataClass:v29 type:@"sirikit.intent.car_commands.SetDefrosterSettingsInCarIntentResponse" isPrivate:0 slotsByName:v30];
  v106[8] = v31;
  v32 = [INIntentResponseDescription alloc];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  v35 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v36 = [(INIntentResponseDescription *)v32 initWithName:@"SetProfileInCarIntentResponse" facadeClass:v33 dataClass:v34 type:@"sirikit.intent.car_commands.SetProfileInCarIntentResponse" isPrivate:0 slotsByName:v35];
  v106[9] = v36;
  v37 = [INIntentResponseDescription alloc];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = _INIntentSchemaBuildIntentSlotDescriptionMap(v15);
  v41 = [(INIntentResponseDescription *)v37 initWithName:@"SetSeatSettingsInCarIntentResponse" facadeClass:v38 dataClass:v39 type:@"sirikit.intent.car_commands.SetSeatSettingsInCarIntentResponse" isPrivate:0 slotsByName:v40];
  v106[10] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:11];

  uint64_t v43 = [v42 count];
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v43];
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v43];
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v46 = v42;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v97 objects:v101 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v98 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        v52 = [v51 name];
        [v44 setObject:v51 forKey:v52];

        v53 = [v51 type];
        [v45 setObject:v51 forKey:v53];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v97 objects:v101 count:16];
    }
    while (v48);
  }

  uint64_t v54 = [v44 copy];
  v55 = (void *)sCarPlayDomain_intentResponseDescsByName;
  sCarPlayDomain_intentResponseDescsByName = v54;

  uint64_t v56 = [v45 copy];
  v57 = (void *)sCarPlayDomain_intentResponseDescsByType;
  sCarPlayDomain_intentResponseDescsByType = v56;
}

@end