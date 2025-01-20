@interface HFHumidifierDehumidifierServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (void)_formatDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6;
@end

@implementation HFHumidifierDehumidifierServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D720]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v135[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v105 = [MEMORY[0x263EFF9C0] set];
  v6 = [(HFServiceItem *)self service];
  v7 = objc_msgSend(v6, "hf_childServices");
  v110 = objc_msgSend(v7, "na_firstObjectPassingTest:", &__block_literal_global_123);

  v8 = (void *)MEMORY[0x263EFF9C0];
  v9 = [(HFServiceItem *)self service];
  v10 = [v8 setWithObject:v9];

  objc_msgSend(v10, "na_safeAddObject:", v110);
  v102 = v10;
  v109 = [(HFServiceItem *)self controlItemValueSourceForServices:v10];
  v11 = [(HFServiceItem *)self service];
  v12 = objc_msgSend(v11, "hf_childServices");
  uint64_t v13 = objc_msgSend(v12, "na_filter:", &__block_literal_global_7_4);

  v14 = (void *)MEMORY[0x263EFF9C0];
  v15 = [(HFServiceItem *)self service];
  v16 = [v14 setWithObject:v15];

  v101 = (void *)v13;
  [v16 unionSet:v13];
  v100 = v16;
  v108 = [(HFServiceItem *)self controlItemValueSourceForServices:v16];
  v134[0] = @"title";
  v17 = HFItemOptionalLocalizedString(@"HFControlShortTitleHumidity", v4);
  v135[0] = v17;
  v134[1] = @"controlItemPurpose";
  v18 = [NSNumber numberWithUnsignedInteger:2];
  v135[1] = v18;
  uint64_t v19 = [NSDictionary dictionaryWithObjects:v135 forKeys:v134 count:2];

  v106 = (void *)v5;
  v99 = (void *)v19;
  v98 = [[HFHumidifierDehumidifierThresholdControlItem alloc] initWithValueSource:v5 displayResults:v19];
  objc_msgSend(v105, "na_safeAddObject:");
  v95 = self;
  v20 = [(HFServiceItem *)self service];
  uint64_t v103 = *MEMORY[0x263F0C4F8];
  v21 = objc_msgSend(v20, "hf_characteristicOfType:");
  uint64_t v22 = [v21 metadata];

  v97 = (void *)v22;
  v23 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v22];
  v132 = @"title";
  v24 = HFItemOptionalLocalizedString(@"HFServiceHumidifierDehumidifierStateAuto", v4);
  v133 = v24;
  v25 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
  [(HFMultiStateValueSet *)v23 addValue:&unk_26C0F6C00 displayResults:v25];

  v130 = @"title";
  v26 = HFItemOptionalLocalizedString(@"HFServiceHumidifierDehumidifierStateHumidify", v4);
  v131 = v26;
  v27 = [NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
  [(HFMultiStateValueSet *)v23 addValue:&unk_26C0F6C18 displayResults:v27];

  v128 = @"title";
  v28 = HFItemOptionalLocalizedString(@"HFServiceHumidifierDehumidifierStateDehumidify", v4);
  v129 = v28;
  v29 = [NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
  [(HFMultiStateValueSet *)v23 addValue:&unk_26C0F6C30 displayResults:v29];

  v30 = +[HFUtilities comparatorWithSortedObjects:&unk_26C0F8200];
  [(HFMultiStateValueSet *)v23 setValueComparator:v30];

  v31 = [HFPowerStateControlItem alloc];
  v32 = (void *)MEMORY[0x263EFFA08];
  v33 = +[HFPowerStateTargetValueTuple fanStateTargetValueTuple];
  v34 = [v32 setWithObject:v33];
  v126 = @"title";
  v35 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v4);
  v127 = v35;
  v36 = [NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
  uint64_t v37 = [(HFPowerStateControlItem *)v31 initWithValueSource:v109 auxiliaryTargetValueTuples:v34 displayResults:v36];

  v38 = v105;
  v124[0] = @"title";
  id v39 = v4;
  v40 = HFItemOptionalLocalizedString(@"HFControlShortTitleHumidifierDehumidifierState", v4);
  v124[1] = @"controlItemPurpose";
  v125[0] = v40;
  v41 = [NSNumber numberWithUnsignedInteger:12];
  v125[1] = v41;
  uint64_t v42 = [NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];

  v43 = [HFTargetModeControlItem alloc];
  uint64_t v44 = v103;
  v96 = v23;
  v104 = (void *)v37;
  v94 = (void *)v42;
  v93 = [(HFTargetModeControlItem *)v43 initWithValueSource:v109 targetModeCharacteristicType:v44 targetModeValueSet:v23 primaryPowerStateControlItem:v37 displayResults:v42];
  objc_msgSend(v105, "addObject:");
  uint64_t v111 = *MEMORY[0x263F0C378];
  if (v110
    && (objc_msgSend(v110, "hf_characteristicOfType:", v111),
        v45 = objc_claimAutoreleasedReturnValue(),
        v45,
        v45))
  {
    v46 = v95;
    v47 = [(HFServiceItem *)v95 service];
    v48 = objc_msgSend(v47, "hf_characteristicOfType:", v111);

    v49 = v39;
    if (v48)
    {
      v50 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v92 = [(HFServiceItem *)v95 service];
        *(_DWORD *)buf = 138412546;
        v121 = v92;
        __int16 v122 = 2112;
        v123 = v110;
        _os_log_error_impl(&dword_20B986000, v50, OS_LOG_TYPE_ERROR, "Both the humidifier/dehumidifier service (%@) and the fan child service (%@) have a rotation speed characteristic. This is not a valid configuration. Arbitrarily choosing to use the child fan's characteristic,", buf, 0x16u);
      }
    }
    v51 = [MEMORY[0x263EFFA08] setWithObject:v110];
    v52 = [(HFServiceItem *)v95 controlItemValueSourceForServices:v51];

    v53 = objc_msgSend(v110, "hf_characteristicOfType:", *MEMORY[0x263F0C370]);
    v54 = [v53 metadata];
    v55 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionClockwise", v49);
    v56 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionCounterClockwise", v49);
    v57 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v54 firstValue:&unk_26C0F6C00 firstTitle:v55 secondValue:&unk_26C0F6C18 secondTitle:v56];

    if (v57)
    {
      v58 = [HFMultiStateControlItem alloc];
      v59 = [v53 characteristicType];
      v118 = @"title";
      v60 = HFItemOptionalLocalizedString(@"HFControlShortTitleRotationDirection", v49);
      v119 = v60;
      [NSDictionary dictionaryWithObjects:&v119 forKeys:&v118 count:1];
      v62 = v61 = v53;
      v63 = [(HFMultiStateControlItem *)v58 initWithValueSource:v52 characteristicType:v59 possibleValueSet:v57 displayResults:v62];
      objc_msgSend(v105, "na_safeAddObject:", v63);

      v53 = v61;
    }
    id v64 = v52;
    v65 = [HFPowerStateControlItem alloc];
    v116 = @"title";
    v66 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v49);
    v117 = v66;
    v67 = [NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];
    v68 = [(HFPowerStateControlItem *)v65 initWithValueSource:v64 displayResults:v67];

    v38 = v105;
    v69 = v106;
    if (v64) {
      goto LABEL_14;
    }
  }
  else
  {
    v68 = 0;
    v69 = v106;
    v49 = v4;
    v46 = v95;
  }
  v107 = v68;
  v70 = [(HFServiceItem *)v46 service];
  v71 = objc_msgSend(v70, "hf_characteristicOfType:", v111);

  if (!v71)
  {
    v72 = v49;
    v73 = v69;
    id v64 = 0;
    goto LABEL_19;
  }
  id v64 = v69;
  v68 = v104;

LABEL_14:
  v107 = v68;
  v72 = v49;
  if (v64 && v68)
  {
    v73 = v69;
    v74 = [HFIncrementalStateControlItem alloc];
    v114 = @"title";
    v75 = HFItemOptionalLocalizedString(@"HFControlShortTitleLinkedFanRotationSpeed", v72);
    v115 = v75;
    v76 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
    v77 = [(HFIncrementalStateControlItem *)v74 initWithValueSource:v64 primaryStateControlItem:v68 incrementalCharacteristicType:v111 displayResults:v76];

    [v38 addObject:v77];
  }
  else
  {
    v73 = v69;
  }
LABEL_19:
  v78 = [[HFSwingModeControlItem alloc] initWithValueSource:v108];
  objc_msgSend(v38, "na_safeAddObject:", v78);

  v79 = [(HFServiceItem *)v46 service];
  v80 = objc_msgSend(v79, "hf_characteristicOfType:", *MEMORY[0x263F0C260]);

  v81 = [v80 metadata];
  v82 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsUnlocked", v72);
  HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsLocked", v72);
  v84 = v83 = v38;
  v85 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v81 firstValue:&unk_26C0F6C00 firstTitle:v82 secondValue:&unk_26C0F6C18 secondTitle:v84];

  if (v85)
  {
    v86 = [HFMultiStateControlItem alloc];
    v87 = [v80 characteristicType];
    v112 = @"title";
    v88 = HFItemOptionalLocalizedString(@"HFControlShortTitleLockPhysicalControls", v72);
    v113 = v88;
    v89 = [NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    v90 = [(HFMultiStateControlItem *)v86 initWithValueSource:v73 characteristicType:v87 possibleValueSet:v85 displayResults:v89];
    objc_msgSend(v83, "na_safeAddObject:", v90);
  }
  return v83;
}

uint64_t __69__HFHumidifierDehumidifierServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

uint64_t __69__HFHumidifierDehumidifierServiceItem_createControlItemsWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D7E8]];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0BEF8];
  uint64_t v6 = *MEMORY[0x263F0C0E0];
  uint64_t v7 = *MEMORY[0x263F0C088];
  uint64_t v8 = *MEMORY[0x263F0C4F8];
  uint64_t v9 = *MEMORY[0x263F0C1C8];
  uint64_t v10 = *MEMORY[0x263F0C148];
  uint64_t v11 = *MEMORY[0x263F0C5B8];
  id v12 = a3;
  uint64_t v13 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, 0);
  v14 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v13 options:v12];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__HFHumidifierDehumidifierServiceItem__subclass_updateWithOptions___block_invoke;
  v17[3] = &unk_26408C9A8;
  v17[4] = self;
  v15 = [v14 flatMap:v17];

  return v15;
}

id __67__HFHumidifierDehumidifierServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v3 standardResults];

  uint64_t v6 = (void *)[v5 mutableCopy];
  uint64_t v30 = a1;
  id v31 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  id v32 = 0;
  id v33 = 0;
  [v7 _formatDescription:&v33 controlDescription:&v32 optionalDescriptions:&v31 forResponse:v4];
  id v8 = v33;
  id v9 = v32;
  id v10 = v31;
  if (v8)
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"description"];

    if (!v11) {
      [v6 setObject:v8 forKeyedSubscript:@"description"];
    }
  }
  objc_msgSend(v6, "na_safeSetObject:forKey:", v9, @"controlDescription");
  [v6 addEntriesFromDictionary:v10];
  id v12 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C088]];
  uint64_t v13 = [v12 valueWithExpectedClass:objc_opt_class()];

  v14 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C5B8]];
  uint64_t v15 = [v14 valueWithExpectedClass:objc_opt_class()];
  v16 = (void *)v15;
  if (v13)
  {
    if (v15)
    {
      v17 = [v6 objectForKeyedSubscript:@"detailedControlDescription"];

      if (!v17)
      {
        v18 = [v14 characteristic];
        uint64_t v19 = [v18 metadata];
        v29 = objc_msgSend(v19, "hf_percentageForCharacteristicValue:", v16);

        if ([v13 integerValue] == 2 && (objc_msgSend(v29, "doubleValue"), v20 <= 0.2)
          || [v13 integerValue] == 3 && (objc_msgSend(v29, "doubleValue"), v21 >= 0.8))
        {
          uint64_t v22 = *(void **)(v30 + 32);
          v23 = [v14 characteristic];
          v24 = [v22 controlDescriptionForCharacteristic:v23 withValue:v16];
          [v6 setObject:v24 forKeyedSubscript:@"detailedControlDescription"];
        }
      }
    }
  }
  [*(id *)(v30 + 32) applyInflectionToDescriptions:v6];
  v25 = (void *)MEMORY[0x263F58190];
  v26 = +[HFItemUpdateOutcome outcomeWithResults:v6];
  v27 = [v25 futureWithResult:v26];

  return v27;
}

- (void)_formatDescription:(id *)a3 controlDescription:(id *)a4 optionalDescriptions:(id *)a5 forResponse:(id)a6
{
  v127[2] = *MEMORY[0x263EF8340];
  id v10 = a6;
  uint64_t v120 = 0;
  v121 = &v120;
  uint64_t v122 = 0x3032000000;
  v123 = __Block_byref_object_copy__17;
  v124 = __Block_byref_object_dispose__17;
  id v125 = 0;
  uint64_t v114 = 0;
  v115 = &v114;
  uint64_t v116 = 0x3032000000;
  v117 = __Block_byref_object_copy__17;
  v118 = __Block_byref_object_dispose__17;
  id v119 = 0;
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x3032000000;
  uint64_t v111 = __Block_byref_object_copy__17;
  v112 = __Block_byref_object_dispose__17;
  id v113 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke;
  aBlock[3] = &unk_264095E08;
  aBlock[4] = &v120;
  aBlock[5] = &v114;
  aBlock[8] = a4;
  aBlock[9] = a5;
  aBlock[6] = &v108;
  aBlock[7] = a3;
  v102 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = [(HFServiceItem *)self service];
  id v12 = objc_msgSend(v11, "hf_childServices");
  v104 = objc_msgSend(v12, "na_firstObjectPassingTest:", &__block_literal_global_68_2);

  uint64_t v13 = [v10 responseForCharacteristicType:*MEMORY[0x263F0C088]];
  v106 = [v13 valueWithExpectedClass:objc_opt_class()];

  v14 = [v10 responseForCharacteristicType:*MEMORY[0x263F0C4F8]];
  uint64_t v15 = [v14 valueWithExpectedClass:objc_opt_class()];

  v16 = [(HFServiceItem *)self service];
  uint64_t v17 = *MEMORY[0x263F0BEF8];
  v18 = [v10 responseForCharacteristicType:*MEMORY[0x263F0BEF8] inService:v16];
  v105 = [v18 valueWithExpectedClass:objc_opt_class()];

  if (v104)
  {
    uint64_t v19 = objc_msgSend(v10, "responseForCharacteristicType:inService:", v17);
    uint64_t v103 = [v19 valueWithExpectedClass:objc_opt_class()];

    if (!v15) {
      goto LABEL_49;
    }
  }
  else
  {
    uint64_t v103 = 0;
    if (!v15) {
      goto LABEL_49;
    }
  }
  if (v106 && v105)
  {
    v101 = (void *)[@"HFServiceDescriptionHumidifier" mutableCopy];
    if ([v15 integerValue])
    {
      unint64_t v20 = [v106 integerValue];
      if (v20 >= 2)
      {
        if (v20 == 2)
        {
          double v21 = @"Humidify";
        }
        else
        {
          if (v20 != 3)
          {
            NSLog(&cfstr_UnexpectedCurr_0.isa, v106);
LABEL_48:

            goto LABEL_49;
          }
          double v21 = @"Dehumidify";
        }
        goto LABEL_21;
      }
      if ([v105 BOOLValue])
      {
        uint64_t v23 = [v15 integerValue];
        switch(v23)
        {
          case 0:
LABEL_22:
            uint64_t v22 = 1;
            goto LABEL_28;
          case 1:
            double v21 = @"TargetHumidify";
            break;
          case 2:
            double v21 = @"TargetDehumidify";
            break;
          default:
            NSLog(&cfstr_UnexpectedTarg_0.isa, v15);
            goto LABEL_48;
        }
LABEL_21:
        [v101 appendString:v21];
        goto LABEL_22;
      }
      if ([v103 BOOLValue]) {
        v24 = @"FanOnly";
      }
      else {
        v24 = @"Off";
      }
    }
    else
    {
      if ([v105 BOOLValue])
      {
        [v101 appendString:@"Auto"];
        uint64_t v22 = 2;
        goto LABEL_28;
      }
      v24 = @"Off";
    }
    [v101 appendString:v24];
    uint64_t v22 = 0;
LABEL_28:
    unint64_t v97 = +[HFTargetRangeUtilities rangeModeForTargetHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForTargetHumidifierDehumidifierState:", [v15 integerValue]);
    unint64_t v25 = +[HFTargetRangeUtilities rangeModeForCurrentHumidifierDehumidifierState:](HFTargetRangeUtilities, "rangeModeForCurrentHumidifierDehumidifierState:", [v106 integerValue]);
    v100 = [v10 responseForCharacteristicType:*MEMORY[0x263F0C148]];
    v26 = [v100 value];
    if (v26)
    {
      v27 = [HFRelativePercentValue alloc];
      v28 = [v100 valueWithExpectedClass:objc_opt_class()];
      v29 = [v100 characteristic];
      v99 = [(HFRelativePercentValue *)v27 initWithValue:v28 forCharacteristic:v29];
    }
    else
    {
      v99 = 0;
    }

    uint64_t v30 = [v10 responseForCharacteristicType:*MEMORY[0x263F0C1C8]];
    id v31 = [v30 value];
    if (v31)
    {
      id v32 = [HFRelativePercentValue alloc];
      id v33 = [v30 valueWithExpectedClass:objc_opt_class()];
      v34 = [v30 characteristic];
      v35 = [(HFRelativePercentValue *)v32 initWithValue:v33 forCharacteristic:v34];
    }
    else
    {
      v35 = 0;
    }

    v36 = +[HFTargetRangeUtilities targetRelativePercentValueWithTargetMode:v97 currentMode:v25 rawTargetResponse:0 minimumThresholdResponse:v30 maximumThresholdResponse:v100];
    uint64_t v37 = +[HFFormatterManager sharedInstance];
    v38 = [v37 percentFormatter];

    if (v36)
    {
      id v39 = [v38 stringForRelativePercentValue:v36];
      if (v22)
      {
LABEL_36:
        if (v22 != 1 && v35 && v99)
        {
          [v101 appendString:@"WithHumidityRange"];
          v40 = [v38 stringForRelativePercentValue:v35];
          v41 = [v38 stringForRelativePercentValue:v99];
          uint64_t v48 = HFLocalizedStringWithFormat(v101, @"%@%@", v42, v43, v44, v45, v46, v47, (uint64_t)v40);
          v49 = (void *)v121[5];
          v121[5] = v48;

          v50 = [v38 stringForRelativePercentValue:v35];
          v96 = [v38 stringForRelativePercentValue:v99];
          uint64_t v57 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionHumidifierAutoWithHumidityRange", @"%@%@", v51, v52, v53, v54, v55, v56, (uint64_t)v50);
          v58 = (void *)v115[5];
          v115[5] = v57;

          v126[0] = @"humidifyThresholdDescription";
          v59 = [v38 stringForRelativePercentValue:v35];
          v98 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionHumidifierHumidifyWithHumidity", @"%@", v60, v61, v62, v63, v64, v65, (uint64_t)v59);
          v126[1] = @"dehumidifyThresholdDescription";
          v127[0] = v98;
          v66 = [v38 stringForRelativePercentValue:v99];
          v73 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionHumidifierDehumidifyWithHumidity", @"%@", v67, v68, v69, v70, v71, v72, (uint64_t)v66);
          v127[1] = v73;
          uint64_t v74 = [NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:2];
          v75 = (void *)v109[5];
          v109[5] = v74;
        }
        else
        {
          [v101 appendString:@"WithHumidity"];
          uint64_t v91 = HFLocalizedStringWithFormat(v101, @"%@", v85, v86, v87, v88, v89, v90, (uint64_t)v39);
          v92 = (void *)v121[5];
          v121[5] = v91;

          v93 = v35;
          v94 = v115;
          id v95 = (id)v121[5];
          v59 = (void *)v94[5];
          v94[5] = (uint64_t)v95;
          v35 = v93;
        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      id v39 = &stru_26C081158;
      if (v22) {
        goto LABEL_36;
      }
    }
    uint64_t v76 = _HFLocalizedStringWithDefaultValue(v101, v101, 1);
    v77 = (void *)v121[5];
    v121[5] = v76;

    if (v36 && v39)
    {
      uint64_t v84 = HFLocalizedStringWithFormat(@"HFServiceControlDescriptionHumidifierOff", @"%@", v78, v79, v80, v81, v82, v83, (uint64_t)v39);
    }
    else
    {
      uint64_t v84 = _HFLocalizedStringWithDefaultValue(@"HFServiceControlDescriptionHumidifierOffNoTargetHumidity", @"HFServiceControlDescriptionHumidifierOffNoTargetHumidity", 1);
    }
    v59 = (void *)v115[5];
    v115[5] = v84;
    goto LABEL_47;
  }
LABEL_49:

  if (v102) {
    v102[2](v102);
  }

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(&v114, 8);

  _Block_object_dispose(&v120, 8);
}

void __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    **(void **)(a1 + 56) = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  if (*(void *)(a1 + 64))
  {
    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v2) {
      v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    **(void **)(a1 + 64) = v2;
  }
  if (*(void *)(a1 + 72))
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v3)
    {
      **(void **)(a1 + 72) = v3;
    }
    else
    {
      id v4 = [NSDictionary dictionary];
      **(void **)(a1 + 72) = v4;
    }
  }
}

uint64_t __110__HFHumidifierDehumidifierServiceItem__formatDescription_controlDescription_optionalDescriptions_forResponse___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D890]];

  return v3;
}

@end