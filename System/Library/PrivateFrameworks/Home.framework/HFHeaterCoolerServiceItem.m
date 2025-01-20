@interface HFHeaterCoolerServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFHeaterCoolerServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D708]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v137[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = [MEMORY[0x263EFF9C0] set];
  v7 = [(HFServiceItem *)self service];
  v8 = objc_msgSend(v7, "hf_childServices");
  v111 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_166);

  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [(HFServiceItem *)self service];
  v11 = [v9 setWithObject:v10];

  objc_msgSend(v11, "na_safeAddObject:", v111);
  v105 = v11;
  uint64_t v12 = [(HFServiceItem *)self controlItemValueSourceForServices:v11];
  v13 = [(HFServiceItem *)self service];
  v14 = objc_msgSend(v13, "hf_childServices");
  uint64_t v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_3_23);

  v16 = (void *)MEMORY[0x263EFF9C0];
  v17 = [(HFServiceItem *)self service];
  v18 = [v16 setWithObject:v17];

  v103 = (void *)v15;
  [v18 unionSet:v15];
  v102 = v18;
  v110 = [(HFServiceItem *)self controlItemValueSourceForServices:v18];
  v136[0] = @"title";
  v19 = HFItemOptionalLocalizedString(@"HFControlShortTitleTemperature", v4);
  v137[0] = v19;
  v136[1] = @"controlItemPurpose";
  v20 = [NSNumber numberWithUnsignedInteger:2];
  v137[1] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:2];

  v101 = (void *)v21;
  id v113 = v6;
  v100 = [[HFHeaterCoolerThresholdControlItem alloc] initWithValueSource:v5 displayResults:v21];
  objc_msgSend(v6, "na_safeAddObject:");
  v22 = [HFTemperatureUnitControlItem alloc];
  v112 = (void *)v5;
  v99 = [(HFTemperatureUnitControlItem *)v22 initWithValueSource:v5 characteristicType:*MEMORY[0x263F0C578] displayResults:0];
  objc_msgSend(v6, "na_safeAddObject:");
  v96 = self;
  v23 = [(HFServiceItem *)self service];
  uint64_t v106 = *MEMORY[0x263F0C4D0];
  v24 = objc_msgSend(v23, "hf_characteristicOfType:");
  uint64_t v25 = [v24 metadata];

  v98 = (void *)v25;
  v26 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v25];
  v134 = @"title";
  v27 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeAuto", v4);
  v135 = v27;
  v28 = [NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
  [(HFMultiStateValueSet *)v26 addValue:&unk_26C0F7350 displayResults:v28];

  v132 = @"title";
  v29 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeHeat", v4);
  v133 = v29;
  v30 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
  [(HFMultiStateValueSet *)v26 addValue:&unk_26C0F7368 displayResults:v30];

  v130 = @"title";
  v31 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeCool", v4);
  v131 = v31;
  v32 = [NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  [(HFMultiStateValueSet *)v26 addValue:&unk_26C0F7380 displayResults:v32];

  v33 = +[HFUtilities comparatorWithSortedObjects:&unk_26C0F82A8];
  [(HFMultiStateValueSet *)v26 setValueComparator:v33];

  v34 = [HFPowerStateControlItem alloc];
  v35 = (void *)MEMORY[0x263EFFA08];
  v36 = +[HFPowerStateTargetValueTuple fanStateTargetValueTuple];
  v37 = [v35 setWithObject:v36];
  v128 = @"title";
  v38 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v4);
  v129 = v38;
  v39 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  uint64_t v40 = [(HFPowerStateControlItem *)v34 initWithValueSource:v12 auxiliaryTargetValueTuples:v37 displayResults:v39];

  v126[0] = @"title";
  v41 = v4;
  v42 = HFItemOptionalLocalizedString(@"HFControlShortTitleHeatingCoolingMode", v4);
  v126[1] = @"controlItemPurpose";
  v127[0] = v42;
  v43 = [NSNumber numberWithUnsignedInteger:12];
  v127[1] = v43;
  uint64_t v44 = [NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:2];

  v45 = [HFTargetModeControlItem alloc];
  v104 = (void *)v12;
  uint64_t v46 = v106;
  v97 = v26;
  v107 = (void *)v40;
  v95 = (void *)v44;
  v94 = [(HFTargetModeControlItem *)v45 initWithValueSource:v12 targetModeCharacteristicType:v46 targetModeValueSet:v26 primaryPowerStateControlItem:v40 displayResults:v44];
  objc_msgSend(v113, "addObject:");
  uint64_t v47 = *MEMORY[0x263F0C378];
  if (v111
    && (objc_msgSend(v111, "hf_characteristicOfType:", v47),
        v48 = objc_claimAutoreleasedReturnValue(),
        v48,
        v48))
  {
    v49 = v96;
    v50 = [(HFServiceItem *)v96 service];
    v51 = objc_msgSend(v50, "hf_characteristicOfType:", v47);

    v52 = v41;
    if (v51)
    {
      v53 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v91 = [(HFServiceItem *)v96 service];
        *(_DWORD *)buf = 138412546;
        v123 = v91;
        __int16 v124 = 2112;
        v125 = v111;
        _os_log_error_impl(&dword_20B986000, v53, OS_LOG_TYPE_ERROR, "Both the heater/cooler service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);
      }
    }
    v54 = [MEMORY[0x263EFFA08] setWithObject:v111];
    v55 = [(HFServiceItem *)v96 controlItemValueSourceForServices:v54];

    v108 = objc_msgSend(v111, "hf_characteristicOfType:", *MEMORY[0x263F0C370]);
    v56 = [v108 metadata];
    v57 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionClockwise", v41);
    v58 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionCounterClockwise", v52);
    v59 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v56 firstValue:&unk_26C0F7350 firstTitle:v57 secondValue:&unk_26C0F7368 secondTitle:v58];

    v60 = v112;
    unint64_t v61 = 0x263EFF000;
    if (v59)
    {
      v93 = [HFMultiStateControlItem alloc];
      v92 = [v108 characteristicType];
      v120 = @"title";
      v62 = HFItemOptionalLocalizedString(@"HFControlShortTitleRotationDirection", v52);
      v121 = v62;
      [NSDictionary dictionaryWithObjects:&v121 forKeys:&v120 count:1];
      v64 = v63 = v55;
      v65 = [(HFMultiStateControlItem *)v93 initWithValueSource:v63 characteristicType:v92 possibleValueSet:v59 displayResults:v64];
      objc_msgSend(v113, "na_safeAddObject:", v65);

      v55 = v63;
      v49 = v96;
      v60 = v112;

      unint64_t v61 = 0x263EFF000uLL;
    }
    id v66 = v55;
    v67 = [HFPowerStateControlItem alloc];
    v118 = @"title";
    v68 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v52);
    v119 = v68;
    v69 = [*(id *)(v61 + 2352) dictionaryWithObjects:&v119 forKeys:&v118 count:1];
    uint64_t v70 = [(HFPowerStateControlItem *)v67 initWithValueSource:v66 displayResults:v69];

    v109 = (void *)v70;
    id v71 = (id)v70;
    if (v66) {
      goto LABEL_15;
    }
  }
  else
  {
    v109 = 0;
    v60 = v112;
    unint64_t v61 = 0x263EFF000uLL;
    v52 = v41;
    v49 = v96;
  }
  v72 = [(HFServiceItem *)v49 service];
  objc_msgSend(v72, "hf_characteristicOfType:", v47);
  id v66 = (id)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    id v66 = v60;
    id v71 = v107;

    if (v66)
    {
      v109 = v71;
LABEL_15:
      v73 = [HFIncrementalStateControlItem alloc];
      v116 = @"title";
      v74 = HFItemOptionalLocalizedString(@"HFControlShortTitleLinkedFanRotationSpeed", v52);
      v117 = v74;
      v75 = [*(id *)(v61 + 2352) dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      v76 = [(HFIncrementalStateControlItem *)v73 initWithValueSource:v66 primaryStateControlItem:v71 incrementalCharacteristicType:v47 displayResults:v75];

      v77 = v113;
      [v113 addObject:v76];

      goto LABEL_18;
    }
    v109 = v71;
  }
  v77 = v113;
LABEL_18:
  v78 = [[HFSwingModeControlItem alloc] initWithValueSource:v110];
  objc_msgSend(v77, "na_safeAddObject:", v78);

  v79 = [(HFServiceItem *)v49 service];
  v80 = objc_msgSend(v79, "hf_characteristicOfType:", *MEMORY[0x263F0C260]);

  v81 = [v80 metadata];
  v82 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsUnlocked", v52);
  v83 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsLocked", v52);
  v84 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v81 firstValue:&unk_26C0F7350 firstTitle:v82 secondValue:&unk_26C0F7368 secondTitle:v83];

  if (v84)
  {
    v85 = [HFMultiStateControlItem alloc];
    v86 = [v80 characteristicType];
    v114 = @"title";
    v87 = HFItemOptionalLocalizedString(@"HFControlShortTitleLockPhysicalControls", v52);
    v115 = v87;
    v88 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
    v89 = [(HFMultiStateControlItem *)v85 initWithValueSource:v112 characteristicType:v86 possibleValueSet:v84 displayResults:v88];
    objc_msgSend(v77, "na_safeAddObject:", v89);
  }
  return v113;
}

uint64_t __59__HFHeaterCoolerServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

uint64_t __59__HFHeaterCoolerServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D7E8]];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0BEF8];
  uint64_t v6 = *MEMORY[0x263F0C110];
  uint64_t v7 = *MEMORY[0x263F0C058];
  uint64_t v8 = *MEMORY[0x263F0C4D0];
  uint64_t v9 = *MEMORY[0x263F0C020];
  uint64_t v10 = *MEMORY[0x263F0C1A0];
  id v11 = a3;
  uint64_t v12 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, 0);
  v13 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v12 options:v11];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__HFHeaterCoolerServiceItem__subclass_updateWithOptions___block_invoke;
  v16[3] = &unk_26408C9A8;
  v16[4] = self;
  v14 = [v13 flatMap:v16];

  return v14;
}

id __57__HFHeaterCoolerServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C110]];
  uint64_t v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  uint64_t v7 = +[HFTemperatureItemUtilities currentHeatingCoolingModeValueInResponse:v4];
  v24 = +[HFTemperatureItemUtilities targetHeatingCoolingModeValueInResponse:v4];
  uint64_t v8 = [v3 standardResults];

  uint64_t v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = +[HFFormatterManager sharedInstance];
  id v11 = [v10 temperatureFormatter];

  [v11 setInputIsCelsius:1];
  id v27 = 0;
  id v28 = 0;
  uint64_t v25 = a1;
  id v26 = 0;
  uint64_t v12 = [*(id *)(a1 + 32) service];
  +[HFThermostatItemUtilities getDescription:&v28 controlDescription:&v27 optionalDescriptions:&v26 forResponse:v4 primaryService:v12 temperatureFormatter:v11];
  id v13 = v28;
  id v14 = v27;
  id v15 = v26;

  if (v13)
  {
    v16 = [v9 objectForKeyedSubscript:@"description"];

    if (!v16) {
      [v9 setObject:v13 forKeyedSubscript:@"description"];
    }
  }
  objc_msgSend(v9, "na_safeSetObject:forKey:", v14, @"controlDescription");
  [v9 addEntriesFromDictionary:v15];
  v17 = [v11 stringForObjectValue:v6];
  v23 = (void *)v6;
  v18 = -[HFTemperatureIconDescriptor initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:]([HFTemperatureIconDescriptor alloc], "initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:", v17, [v7 integerValue], objc_msgSend(v24, "integerValue"));
  [v9 setObject:v18 forKeyedSubscript:@"icon"];

  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"tempreatureUnitDependency"];
  [*(id *)(v25 + 32) applyInflectionToDescriptions:v9];
  v19 = (void *)MEMORY[0x263F58190];
  v20 = +[HFItemUpdateOutcome outcomeWithResults:v9];
  uint64_t v21 = [v19 futureWithResult:v20];

  return v21;
}

@end