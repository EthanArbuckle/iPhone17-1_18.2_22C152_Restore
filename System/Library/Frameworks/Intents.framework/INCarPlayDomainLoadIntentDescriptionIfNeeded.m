@interface INCarPlayDomainLoadIntentDescriptionIfNeeded
@end

@implementation INCarPlayDomainLoadIntentDescriptionIfNeeded

void ___INCarPlayDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  v132[11] = *MEMORY[0x1E4F143B8];
  v0 = [INIntentDescription alloc];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  v116 = [[INIntentSlotDescription alloc] initWithName:@"carName", 2, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA82E0, &unk_1EDBA82F8, objc_opt_class(), sel_resolveCarNameForActivateCarSignal_withCompletion_, sel_resolveCarNameForActivateCarSignal_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v131[0] = v116;
  v115 = [[INIntentSlotDescription alloc] initWithName:@"signals", 3, @"signals", @"signals", 0, 0, 143, 3, &unk_1EDBA8310, &unk_1EDBA8328, objc_opt_class(), sel_resolveSignalsForActivateCarSignal_withCompletion_, sel_resolveSignalsForActivateCarSignal_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v131[1] = v115;
  v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
  v113 = _INIntentSchemaBuildIntentSlotDescriptionMap(v114);
  v112 = [(INIntentDescription *)v0 initWithName:@"ActivateCarSignalIntent" responseName:@"ActivateCarSignalIntentResponse" facadeClass:v1 dataClass:v2 type:@"sirikit.intent.car_commands.ActivateCarSignalIntent" isPrivate:0 handleSelector:sel_handleActivateCarSignal_completion_ confirmSelector:sel_confirmActivateCarSignal_completion_ slotsByName:v113];
  v132[0] = v112;
  v3 = [INIntentDescription alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v111 = [[INIntentSlotDescription alloc] initWithName:@"carName", 2, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA8340, &unk_1EDBA8358, objc_opt_class(), sel_resolveCarNameForGetCarLockStatus_withCompletion_, sel_resolveCarNameForGetCarLockStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v130 = v111;
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
  v109 = _INIntentSchemaBuildIntentSlotDescriptionMap(v110);
  v108 = [(INIntentDescription *)v3 initWithName:@"GetCarLockStatusIntent" responseName:@"GetCarLockStatusIntentResponse" facadeClass:v4 dataClass:v5 type:@"sirikit.intent.car_commands.GetCarLockStatusIntent" isPrivate:0 handleSelector:sel_handleGetCarLockStatus_completion_ confirmSelector:sel_confirmGetCarLockStatus_completion_ slotsByName:v109];
  v132[1] = v108;
  v6 = [INIntentDescription alloc];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v107 = [[INIntentSlotDescription alloc] initWithName:@"carName", 2, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA8370, &unk_1EDBA8388, objc_opt_class(), sel_resolveCarNameForGetCarPowerLevelStatus_withCompletion_, sel_resolveCarNameForGetCarPowerLevelStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v129 = v107;
  v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
  v105 = _INIntentSchemaBuildIntentSlotDescriptionMap(v106);
  v104 = [(INIntentDescription *)v6 initWithName:@"GetCarPowerLevelStatusIntent" responseName:@"GetCarPowerLevelStatusIntentResponse" facadeClass:v7 dataClass:v8 type:@"sirikit.intent.car_commands.GetCarPowerLevelStatusIntent" isPrivate:0 handleSelector:sel_handleGetCarPowerLevelStatus_completion_ confirmSelector:sel_confirmGetCarPowerLevelStatus_completion_ slotsByName:v105];
  v132[2] = v104;
  v9 = [INIntentDescription alloc];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v103 = _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E4F1CBF0]);
  v102 = [(INIntentDescription *)v9 initWithName:@"ListCarsIntent" responseName:@"ListCarsIntentResponse" facadeClass:v10 dataClass:v11 type:@"sirikit.intent.car_commands.ListCarsIntent" isPrivate:0 handleSelector:sel_handleListCars_completion_ confirmSelector:sel_confirmListCars_completion_ slotsByName:v103];
  v132[3] = v102;
  v12 = [INIntentDescription alloc];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v101 = [[INIntentSlotDescription alloc] initWithName:@"profileNumber", 2, @"profileNumber", @"profileNumber", 0, 0, 24, 1, &unk_1EDBA83A0, &unk_1EDBA83B8, objc_opt_class(), sel_resolveProfileNumberForSaveProfileInCar_withCompletion_, sel_resolveProfileNumberForSaveProfileInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v128[0] = v101;
  v100 = [[INIntentSlotDescription alloc] initWithName:@"profileName", 3, @"profileName", @"profileName", 0, 0, 30, 1, &unk_1EDBA83D0, &unk_1EDBA83E8, objc_opt_class(), sel_resolveProfileNameForSaveProfileInCar_withCompletion_, sel_resolveProfileNameForSaveProfileInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v128[1] = v100;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
  v98 = _INIntentSchemaBuildIntentSlotDescriptionMap(v99);
  v97 = [(INIntentDescription *)v12 initWithName:@"SaveProfileInCarIntent" responseName:@"SaveProfileInCarIntentResponse" facadeClass:v13 dataClass:v14 type:@"sirikit.intent.car_commands.SaveProfileInCarIntent" isPrivate:0 handleSelector:sel_handleSaveProfileInCar_completion_ confirmSelector:sel_confirmSaveProfileInCar_completion_ slotsByName:v98];
  v132[4] = v97;
  v15 = [INIntentDescription alloc];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v96 = [[INIntentSlotDescription alloc] initWithName:@"audioSource", 2, @"audioSource", @"audioSource", 0, 0, 121, 1, &unk_1EDBA8400, &unk_1EDBA8418, objc_opt_class(), sel_resolveAudioSourceForSetAudioSourceInCar_withCompletion_, sel_resolveAudioSourceForSetAudioSourceInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v127[0] = v96;
  v95 = [[INIntentSlotDescription alloc] initWithName:@"relativeAudioSourceReference", 3, @"relativeAudioSourceReference", @"relativeAudioSourceReference", 0, 0, 124, 1, &unk_1EDBA8430, &unk_1EDBA8448, objc_opt_class(), sel_resolveRelativeAudioSourceReferenceForSetAudioSourceInCar_withCompletion_, sel_resolveRelativeAudioSourceReferenceForSetAudioSourceInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v127[1] = v95;
  v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
  v93 = _INIntentSchemaBuildIntentSlotDescriptionMap(v94);
  v92 = [(INIntentDescription *)v15 initWithName:@"SetAudioSourceInCarIntent" responseName:@"SetAudioSourceInCarIntentResponse" facadeClass:v16 dataClass:v17 type:@"sirikit.intent.car_commands.SetAudioSourceInCarIntent" isPrivate:0 handleSelector:sel_handleSetAudioSourceInCar_completion_ confirmSelector:sel_confirmSetAudioSourceInCar_completion_ slotsByName:v93];
  v132[5] = v92;
  v18 = [INIntentDescription alloc];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v91 = [[INIntentSlotDescription alloc] initWithName:@"locked", 2, @"locked", @"locked", 0, 0, 1, 1, &unk_1EDBA8460, &unk_1EDBA8478, objc_opt_class(), sel_resolveLockedForSetCarLockStatus_withCompletion_, sel_resolveLockedForSetCarLockStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v126[0] = v91;
  v90 = [[INIntentSlotDescription alloc] initWithName:@"carName", 3, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA8490, &unk_1EDBA84A8, objc_opt_class(), sel_resolveCarNameForSetCarLockStatus_withCompletion_, sel_resolveCarNameForSetCarLockStatus_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v126[1] = v90;
  v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
  v88 = _INIntentSchemaBuildIntentSlotDescriptionMap(v89);
  v87 = [(INIntentDescription *)v18 initWithName:@"SetCarLockStatusIntent" responseName:@"SetCarLockStatusIntentResponse" facadeClass:v19 dataClass:v20 type:@"sirikit.intent.car_commands.SetCarLockStatusIntent" isPrivate:0 handleSelector:sel_handleSetCarLockStatus_completion_ confirmSelector:sel_confirmSetCarLockStatus_completion_ slotsByName:v88];
  v132[6] = v87;
  v21 = [INIntentDescription alloc];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  v86 = [[INIntentSlotDescription alloc] initWithName:@"enableFan", 2, @"enableFan", @"enableFan", 0, 0, 1, 1, &unk_1EDBA84C0, &unk_1EDBA84D8, objc_opt_class(), sel_resolveEnableFanForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableFanForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[0] = v86;
  v85 = [[INIntentSlotDescription alloc] initWithName:@"enableAirConditioner", 3, @"enableAirConditioner", @"enableAirConditioner", 0, 0, 1, 1, &unk_1EDBA84F0, &unk_1EDBA8508, objc_opt_class(), sel_resolveEnableAirConditionerForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableAirConditionerForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[1] = v85;
  v84 = [[INIntentSlotDescription alloc] initWithName:@"enableClimateControl", 4, @"enableClimateControl", @"enableClimateControl", 0, 0, 1, 1, &unk_1EDBA8520, &unk_1EDBA8538, objc_opt_class(), sel_resolveEnableClimateControlForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableClimateControlForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[2] = v84;
  v83 = [[INIntentSlotDescription alloc] initWithName:@"enableAutoMode", 5, @"enableAutoMode", @"enableAutoMode", 0, 0, 1, 1, &unk_1EDBA8550, &unk_1EDBA8568, objc_opt_class(), sel_resolveEnableAutoModeForSetClimateSettingsInCar_withCompletion_, sel_resolveEnableAutoModeForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[3] = v83;
  v82 = [[INIntentSlotDescription alloc] initWithName:@"airCirculationMode", 6, @"airCirculationMode", @"airCirculationMode", 0, 0, 120, 1, &unk_1EDBA8580, &unk_1EDBA8598, objc_opt_class(), sel_resolveAirCirculationModeForSetClimateSettingsInCar_withCompletion_, sel_resolveAirCirculationModeForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[4] = v82;
  v81 = [[INIntentSlotDescription alloc] initWithName:@"fanSpeedIndex", 7, @"fanSpeedIndex", @"fanSpeedIndex", 0, 0, 24, 1, &unk_1EDBA85B0, &unk_1EDBA85C8, objc_opt_class(), sel_resolveFanSpeedIndexForSetClimateSettingsInCar_withCompletion_, sel_resolveFanSpeedIndexForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[5] = v81;
  v80 = [[INIntentSlotDescription alloc] initWithName:@"fanSpeedPercentage", 8, @"fanSpeedPercentage", @"fanSpeedPercentage", 0, 0, 21, 1, &unk_1EDBA85E0, &unk_1EDBA85F8, objc_opt_class(), sel_resolveFanSpeedPercentageForSetClimateSettingsInCar_withCompletion_, sel_resolveFanSpeedPercentageForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[6] = v80;
  v79 = [[INIntentSlotDescription alloc] initWithName:@"relativeFanSpeedSetting", 9, @"relativeFanSpeedSetting", @"relativeFanSpeedSetting", 0, 0, 125, 1, &unk_1EDBA8610, &unk_1EDBA8628, objc_opt_class(), sel_resolveRelativeFanSpeedSettingForSetClimateSettingsInCar_withCompletion_, sel_resolveRelativeFanSpeedSettingForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[7] = v79;
  v78 = [[INIntentSlotDescription alloc] initWithName:@"temperature", 11, @"temperature", @"temperature", 0, 0, 32, 1, &unk_1EDBA8640, &unk_1EDBA8658, objc_opt_class(), sel_resolveTemperatureForSetClimateSettingsInCar_withCompletion_, sel_resolveTemperatureForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[8] = v78;
  v77 = [[INIntentSlotDescription alloc] initWithName:@"relativeTemperatureSetting", 12, @"relativeTemperatureSetting", @"relativeTemperatureSetting", 0, 0, 125, 1, &unk_1EDBA8670, &unk_1EDBA8688, objc_opt_class(), sel_resolveRelativeTemperatureSettingForSetClimateSettingsInCar_withCompletion_, sel_resolveRelativeTemperatureSettingForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[9] = v77;
  v76 = [[INIntentSlotDescription alloc] initWithName:@"climateZone", 13, @"climateZone", @"climateZone", 0, 0, 123, 1, &unk_1EDBA86A0, &unk_1EDBA86B8, objc_opt_class(), sel_resolveClimateZoneForSetClimateSettingsInCar_withCompletion_, sel_resolveClimateZoneForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[10] = v76;
  v75 = [[INIntentSlotDescription alloc] initWithName:@"carName", 14, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA86D0, &unk_1EDBA86E8, objc_opt_class(), sel_resolveCarNameForSetClimateSettingsInCar_withCompletion_, sel_resolveCarNameForSetClimateSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v125[11] = v75;
  v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v125 count:12];
  v73 = _INIntentSchemaBuildIntentSlotDescriptionMap(v74);
  v72 = [(INIntentDescription *)v21 initWithName:@"SetClimateSettingsInCarIntent" responseName:@"SetClimateSettingsInCarIntentResponse" facadeClass:v22 dataClass:v23 type:@"sirikit.intent.car_commands.SetClimateSettingsInCarIntent" isPrivate:0 handleSelector:sel_handleSetClimateSettingsInCar_completion_ confirmSelector:sel_confirmSetClimateSettingsInCar_completion_ slotsByName:v73];
  v132[7] = v72;
  v24 = [INIntentDescription alloc];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  v71 = [[INIntentSlotDescription alloc] initWithName:@"enable", 2, @"enable", @"enable", 0, 0, 1, 1, &unk_1EDBA8700, &unk_1EDBA8718, objc_opt_class(), sel_resolveEnableForSetDefrosterSettingsInCar_withCompletion_, sel_resolveEnableForSetDefrosterSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v124[0] = v71;
  v70 = [[INIntentSlotDescription alloc] initWithName:@"defroster", 3, @"defroster", @"defroster", 0, 0, 122, 1, &unk_1EDBA8730, &unk_1EDBA8748, objc_opt_class(), sel_resolveDefrosterForSetDefrosterSettingsInCar_withCompletion_, sel_resolveDefrosterForSetDefrosterSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v124[1] = v70;
  v69 = [[INIntentSlotDescription alloc] initWithName:@"carName", 4, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA8760, &unk_1EDBA8778, objc_opt_class(), sel_resolveCarNameForSetDefrosterSettingsInCar_withCompletion_, sel_resolveCarNameForSetDefrosterSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v124[2] = v69;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:3];
  v67 = _INIntentSchemaBuildIntentSlotDescriptionMap(v68);
  v66 = [(INIntentDescription *)v24 initWithName:@"SetDefrosterSettingsInCarIntent" responseName:@"SetDefrosterSettingsInCarIntentResponse" facadeClass:v25 dataClass:v26 type:@"sirikit.intent.car_commands.SetDefrosterSettingsInCarIntent" isPrivate:0 handleSelector:sel_handleSetDefrosterSettingsInCar_completion_ confirmSelector:sel_confirmSetDefrosterSettingsInCar_completion_ slotsByName:v67];
  v132[8] = v66;
  v27 = [INIntentDescription alloc];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v65 = [[INIntentSlotDescription alloc] initWithName:@"profileNumber", 2, @"profileNumber", @"profileNumber", 0, 0, 24, 1, &unk_1EDBA8790, &unk_1EDBA87A8, objc_opt_class(), sel_resolveProfileNumberForSetProfileInCar_withCompletion_, sel_resolveProfileNumberForSetProfileInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v123[0] = v65;
  v64 = [[INIntentSlotDescription alloc] initWithName:@"profileName", 3, @"profileName", @"profileName", 0, 0, 30, 1, &unk_1EDBA87C0, &unk_1EDBA87D8, objc_opt_class(), sel_resolveProfileNameForSetProfileInCar_withCompletion_, sel_resolveProfileNameForSetProfileInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v123[1] = v64;
  v63 = [[INIntentSlotDescription alloc] initWithName:@"defaultProfile" tag:4 facadePropertyName:@"defaultProfile" dataPropertyName:@"defaultProfile" isExtended:0 isPrivate:0 valueType:1 valueStyle:1 defaultValueSelectorStrings:0 provideOptionsSelectorStrings:0 resolutionResultClass:0 resolveSelectors:0];
  v123[2] = v63;
  v62 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", 12, 1, &unk_1EDBA87F0, &unk_1EDBA8808, objc_opt_class(), sel_resolveCarNameForSetProfileInCar_withCompletion_, sel_resolveCarNameForSetProfileInCar_completion_, 0);
  v123[3] = v62;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:4];
  v60 = _INIntentSchemaBuildIntentSlotDescriptionMap(v61);
  v59 = [(INIntentDescription *)v27 initWithName:@"SetProfileInCarIntent" responseName:@"SetProfileInCarIntentResponse" facadeClass:v28 dataClass:v29 type:@"sirikit.intent.car_commands.SetProfileInCarIntent" isPrivate:0 handleSelector:sel_handleSetProfileInCar_completion_ confirmSelector:sel_confirmSetProfileInCar_completion_ slotsByName:v60];
  v132[9] = v59;
  v58 = [INIntentDescription alloc];
  uint64_t v56 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  v57 = [[INIntentSlotDescription alloc] initWithName:@"enableHeating", 2, @"enableHeating", @"enableHeating", 0, 0, 1, 1, &unk_1EDBA8820, &unk_1EDBA8838, objc_opt_class(), sel_resolveEnableHeatingForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableHeatingForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[0] = v57;
  v30 = [[INIntentSlotDescription alloc] initWithName:@"enableCooling", 3, @"enableCooling", @"enableCooling", 0, 0, 1, 1, &unk_1EDBA8850, &unk_1EDBA8868, objc_opt_class(), sel_resolveEnableCoolingForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableCoolingForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[1] = v30;
  v31 = [[INIntentSlotDescription alloc] initWithName:@"enableMassage", 4, @"enableMassage", @"enableMassage", 0, 0, 1, 1, &unk_1EDBA8880, &unk_1EDBA8898, objc_opt_class(), sel_resolveEnableMassageForSetSeatSettingsInCar_withCompletion_, sel_resolveEnableMassageForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[2] = v31;
  v32 = [[INIntentSlotDescription alloc] initWithName:@"seat", 5, @"seat", @"seat", 0, 0, 123, 1, &unk_1EDBA88B0, &unk_1EDBA88C8, objc_opt_class(), sel_resolveSeatForSetSeatSettingsInCar_withCompletion_, sel_resolveSeatForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[3] = v32;
  v33 = [[INIntentSlotDescription alloc] initWithName:@"level", 6, @"level", @"level", 0, 0, 24, 1, &unk_1EDBA88E0, &unk_1EDBA88F8, objc_opt_class(), sel_resolveLevelForSetSeatSettingsInCar_withCompletion_, sel_resolveLevelForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[4] = v33;
  v34 = [[INIntentSlotDescription alloc] initWithName:@"relativeLevelSetting", 7, @"relativeLevelSetting", @"relativeLevelSetting", 0, 0, 125, 1, &unk_1EDBA8910, &unk_1EDBA8928, objc_opt_class(), sel_resolveRelativeLevelSettingForSetSeatSettingsInCar_withCompletion_, sel_resolveRelativeLevelSettingForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[5] = v34;
  v35 = [[INIntentSlotDescription alloc] initWithName:@"carName", 8, @"carName", @"carName", 0, 0, 12, 1, &unk_1EDBA8940, &unk_1EDBA8958, objc_opt_class(), sel_resolveCarNameForSetSeatSettingsInCar_withCompletion_, sel_resolveCarNameForSetSeatSettingsInCar_completion_, 0 tag facadePropertyName dataPropertyName isExtended isPrivate valueType valueStyle defaultValueSelectorStrings provideOptionsSelectorStrings resolutionResultClass resolveSelectors];
  v122[6] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:7];
  v37 = _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v38 = [(INIntentDescription *)v58 initWithName:@"SetSeatSettingsInCarIntent" responseName:@"SetSeatSettingsInCarIntentResponse" facadeClass:v56 dataClass:v55 type:@"sirikit.intent.car_commands.SetSeatSettingsInCarIntent" isPrivate:0 handleSelector:sel_handleSetSeatSettingsInCar_completion_ confirmSelector:sel_confirmSetSeatSettingsInCar_completion_ slotsByName:v37];
  v132[10] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:11];

  uint64_t v40 = [v39 count];
  v41 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v40];
  v42 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v40];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v43 = v39;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v117 objects:v121 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v118;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v118 != v46) {
          objc_enumerationMutation(v43);
        }
        v48 = *(void **)(*((void *)&v117 + 1) + 8 * i);
        v49 = [v48 name];
        [v41 setObject:v48 forKey:v49];

        v50 = [v48 type];
        [v42 setObject:v48 forKey:v50];
      }
      uint64_t v45 = [v43 countByEnumeratingWithState:&v117 objects:v121 count:16];
    }
    while (v45);
  }

  uint64_t v51 = [v41 copy];
  v52 = (void *)sCarPlayDomain_intentDescsByName;
  sCarPlayDomain_intentDescsByName = v51;

  uint64_t v53 = [v42 copy];
  v54 = (void *)sCarPlayDomain_intentDescsByType;
  sCarPlayDomain_intentDescsByType = v53;
}

@end