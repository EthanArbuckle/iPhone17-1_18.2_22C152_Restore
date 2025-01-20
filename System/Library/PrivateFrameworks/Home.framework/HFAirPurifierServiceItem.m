@interface HFAirPurifierServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFAirPurifierServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D618]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v106[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v92 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v5 = [MEMORY[0x263EFF9C0] set];
  v6 = [(HFServiceItem *)self service];
  v7 = objc_msgSend(v6, "hf_childServices");
  v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_83);

  v9 = (void *)MEMORY[0x263EFF9C0];
  v10 = [(HFServiceItem *)self service];
  v11 = [v9 setWithObject:v10];

  objc_msgSend(v11, "na_safeAddObject:", v8);
  v89 = v11;
  uint64_t v12 = [(HFServiceItem *)self controlItemValueSourceForServices:v11];
  v13 = [(HFServiceItem *)self service];
  v14 = objc_msgSend(v13, "hf_childServices");
  uint64_t v15 = objc_msgSend(v14, "na_filter:", &__block_literal_global_3_9);

  v16 = (void *)MEMORY[0x263EFF9C0];
  v17 = [(HFServiceItem *)self service];
  v18 = [v16 setWithObject:v17];

  v87 = (void *)v15;
  [v18 unionSet:v15];
  v86 = v18;
  v91 = [(HFServiceItem *)self controlItemValueSourceForServices:v18];
  v105[0] = @"title";
  v19 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v4);
  v106[0] = v19;
  v105[1] = @"controlItemPurpose";
  v20 = [NSNumber numberWithUnsignedInteger:10];
  v106[1] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:2];

  v22 = (void *)MEMORY[0x263EFFA08];
  v23 = +[HFPowerStateTargetValueTuple fanStateTargetValueTuple];
  v24 = [HFPowerStateTargetValueTuple alloc];
  uint64_t v81 = *MEMORY[0x263F0C498];
  v25 = -[HFPowerStateTargetValueTuple initWithCharacteristicType:onTargetValue:offTargetValue:](v24, "initWithCharacteristicType:onTargetValue:offTargetValue:");
  uint64_t v26 = objc_msgSend(v22, "setWithObjects:", v23, v25, 0);

  v88 = (void *)v12;
  v84 = (void *)v26;
  v85 = (void *)v21;
  v27 = [[HFPowerStateControlItem alloc] initWithValueSource:v12 auxiliaryTargetValueTuples:v26 displayResults:v21];
  [v5 addObject:v27];

  uint64_t v28 = *MEMORY[0x263F0C378];
  v90 = v8;
  if (v8)
  {
    v29 = objc_msgSend(v8, "hf_characteristicOfType:", v28);

    if (v29)
    {
      v30 = [(HFServiceItem *)self service];
      v31 = objc_msgSend(v30, "hf_characteristicOfType:", v28);

      if (v31)
      {
        v32 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v79 = [(HFServiceItem *)self service];
          *(_DWORD *)buf = 138412546;
          v102 = v79;
          __int16 v103 = 2112;
          v104 = v8;
          _os_log_error_impl(&dword_20B986000, v32, OS_LOG_TYPE_ERROR, "Both the air purifier service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);
        }
      }
      v80 = v5;
      v33 = [MEMORY[0x263EFFA08] setWithObject:v8];
      id v34 = [(HFServiceItem *)self controlItemValueSourceForServices:v33];

      v35 = objc_msgSend(v8, "hf_characteristicOfType:", *MEMORY[0x263F0C370]);
      v36 = [v35 metadata];
      v37 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionClockwise", v4);
      v38 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionCounterClockwise", v4);
      v39 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v36 firstValue:&unk_26C0F69A8 firstTitle:v37 secondValue:&unk_26C0F6990 secondTitle:v38];

      if (v39)
      {
        v40 = [HFMultiStateControlItem alloc];
        v41 = [v35 characteristicType];
        v99 = @"title";
        v42 = HFItemOptionalLocalizedString(@"HFControlShortTitleRotationDirection", v4);
        v100 = v42;
        v43 = [NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
        v44 = [(HFMultiStateControlItem *)v40 initWithValueSource:v34 characteristicType:v41 possibleValueSet:v39 displayResults:v43];
        objc_msgSend(v80, "na_safeAddObject:", v44);
      }
      v5 = v80;
      if (v34) {
        goto LABEL_12;
      }
    }
  }
  v45 = [(HFServiceItem *)self service];
  v46 = objc_msgSend(v45, "hf_characteristicOfType:", v28);

  if (v46 && (id v34 = v92) != 0)
  {
LABEL_12:
    v97[0] = @"title";
    v47 = HFItemOptionalLocalizedString(@"HFControlShortTitleLinkedFanRotationSpeed", v4);
    v98[0] = v47;
    v97[1] = @"controlDescription";
    v48 = HFItemOptionalLocalizedString(@"HFControlShortTitleLinkedFanRotationSpeed", v4);
    v98[1] = v48;
    v97[2] = @"controlItemPurpose";
    v49 = [NSNumber numberWithUnsignedInteger:4];
    v98[2] = v49;
    v50 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:3];

    v51 = [HFPowerStateControlItem alloc];
    v52 = [(HFPowerStateControlItem *)v51 initWithValueSource:v34 displayResults:MEMORY[0x263EFFA78]];
    v83 = v34;
    v53 = [[HFIncrementalStateControlItem alloc] initWithValueSource:v34 primaryStateControlItem:v52 incrementalCharacteristicType:v28 displayResults:v50];
    [v5 addObject:v53];
  }
  else
  {
    v83 = 0;
  }
  v54 = [(HFServiceItem *)self service];
  v55 = objc_msgSend(v54, "hf_characteristicOfType:", v81);

  v56 = [v55 metadata];
  v57 = HFItemOptionalLocalizedString(@"HFCharacteristicValueAirPurifierTargetStateManual", v4);
  v58 = HFItemOptionalLocalizedString(@"HFCharacteristicValueAirPurifierTargetStateAuto", v4);
  v59 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v56 firstValue:&unk_26C0F69A8 firstTitle:v57 secondValue:&unk_26C0F6990 secondTitle:v58];

  if (v59)
  {
    v60 = [HFMultiStateControlItem alloc];
    v61 = [v55 characteristicType];
    v95 = @"title";
    v62 = HFItemOptionalLocalizedString(@"HFControlShortTitleAirPurifierState", v4);
    v96 = v62;
    v63 = [NSDictionary dictionaryWithObjects:&v96 forKeys:&v95 count:1];
    v64 = [(HFMultiStateControlItem *)v60 initWithValueSource:v92 characteristicType:v61 possibleValueSet:v59 displayResults:v63];
    objc_msgSend(v5, "na_safeAddObject:", v64);
  }
  v82 = v55;
  v65 = [[HFSwingModeControlItem alloc] initWithValueSource:v91];
  objc_msgSend(v5, "na_safeAddObject:", v65);

  v66 = [(HFServiceItem *)self service];
  v67 = objc_msgSend(v66, "hf_characteristicOfType:", *MEMORY[0x263F0C260]);

  v68 = [v67 metadata];
  v69 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsUnlocked", v4);
  HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsLocked", v4);
  v71 = v70 = v5;
  v72 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v68 firstValue:&unk_26C0F69A8 firstTitle:v69 secondValue:&unk_26C0F6990 secondTitle:v71];

  if (v72)
  {
    v73 = [HFMultiStateControlItem alloc];
    v74 = [v67 characteristicType];
    v93 = @"title";
    v75 = HFItemOptionalLocalizedString(@"HFControlShortTitleLockPhysicalControls", v4);
    v94 = v75;
    v76 = [NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
    v77 = [(HFMultiStateControlItem *)v73 initWithValueSource:v92 characteristicType:v74 possibleValueSet:v72 displayResults:v76];
    objc_msgSend(v70, "na_safeAddObject:", v77);
  }
  return v70;
}

uint64_t __58__HFAirPurifierServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

uint64_t __58__HFAirPurifierServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D7E8]];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C030];
  uint64_t v6 = *MEMORY[0x263F0BEF8];
  uint64_t v7 = *MEMORY[0x263F0C168];
  id v8 = a3;
  v9 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, 0);
  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v8];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

id __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C030]];

  v38 = v5;
  uint64_t v6 = [v5 valueWithExpectedClass:objc_opt_class()];
  uint64_t v7 = [v3 readResponse];
  uint64_t v8 = *MEMORY[0x263F0BEF8];
  v9 = [*(id *)(a1 + 32) service];
  v10 = [v7 responseForCharacteristicType:v8 inService:v9];

  v37 = v10;
  v11 = [v10 valueWithExpectedClass:objc_opt_class()];
  uint64_t v12 = [v3 readResponse];
  v13 = [v12 responseForCharacteristicType:*MEMORY[0x263F0C168]];
  v14 = [v13 valueWithExpectedClass:objc_opt_class()];

  uint64_t v15 = [*(id *)(a1 + 32) service];
  v16 = objc_msgSend(v15, "hf_childServices");
  v17 = objc_msgSend(v16, "na_firstObjectPassingTest:", &__block_literal_global_47_0);

  if (v17)
  {
    v18 = [v3 readResponse];
    v19 = [v18 responseForCharacteristicType:v8 inService:v17];
    v39 = [v19 valueWithExpectedClass:objc_opt_class()];
  }
  else
  {
    v39 = 0;
  }
  v20 = [v3 standardResults];
  uint64_t v21 = (void *)[v20 mutableCopy];

  if (!v6) {
    goto LABEL_19;
  }
  if (![v11 isEqual:MEMORY[0x263EFFA80]]
    || ![v39 isEqual:MEMORY[0x263EFFA88]])
  {
    if ([v11 isEqual:MEMORY[0x263EFFA88]]
      && [v6 isEqual:&unk_26C0F69A8])
    {
      v23 = @"HFServiceDescriptionAirPurifierTurningOn";
    }
    else
    {
      if (![v11 isEqual:MEMORY[0x263EFFA80]]
        || ([v6 isEqual:&unk_26C0F69A8] & 1) != 0)
      {
        v24 = *(void **)(a1 + 32);
        v25 = [v38 characteristic];
        uint64_t v26 = [v24 controlDescriptionForCharacteristic:v25 withValue:v6];
        objc_msgSend(v21, "na_safeSetObject:forKey:", v26, @"controlDescription");

        v27 = *(void **)(a1 + 32);
        uint64_t v28 = [v38 characteristic];
        v22 = [v27 descriptionForCharacteristic:v28 withValue:v6];

        goto LABEL_16;
      }
      v23 = @"HFServiceDescriptionAirPurifierTurningOff";
    }
    v29 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    [v21 setObject:v29 forKeyedSubscript:@"controlDescription"];

    v22 = _HFLocalizedStringWithDefaultValue(v23, v23, 1);
    [v21 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isInStateTransition"];
    goto LABEL_16;
  }
  v22 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionAirPurifierFanOnlyMode", @"HFServiceDescriptionAirPurifierFanOnlyMode", 1);
LABEL_16:
  v30 = [v21 objectForKeyedSubscript:@"description"];

  if (!v30) {
    [v21 setObject:v22 forKeyedSubscript:@"description"];
  }

LABEL_19:
  if (v14 && [v14 integerValue] == 1)
  {
    v31 = [v21 objectForKeyedSubscript:@"detailedControlDescription"];

    if (!v31)
    {
      v32 = _HFLocalizedStringWithDefaultValue(@"HFServiceDetailedControlDescriptionChangeFilterSoon", @"HFServiceDetailedControlDescriptionChangeFilterSoon", 1);
      [v21 setObject:v32 forKeyedSubscript:@"detailedControlDescription"];
    }
    [v21 setObject:&unk_26C0F69C0 forKeyedSubscript:@"badge"];
    [v21 setObject:&unk_26C0F69D8 forKeyedSubscript:@"descriptionBadge"];
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v21];
  v33 = (void *)MEMORY[0x263F58190];
  id v34 = +[HFItemUpdateOutcome outcomeWithResults:v21];
  v35 = [v33 futureWithResult:v34];

  return v35;
}

uint64_t __56__HFAirPurifierServiceItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

@end