@interface HFFanServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFFanServiceItem

- (id)createControlItemsWithOptions:(id)a3
{
  v69[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = [HFPowerStateControlItem alloc];
  uint64_t v7 = [(HFPowerStateControlItem *)v6 initWithValueSource:v5 displayResults:MEMORY[0x263EFFA78]];
  v68[0] = @"title";
  v8 = HFItemOptionalLocalizedString(@"HFControlShortTitleRotationSpeed", v4);
  v69[0] = v8;
  v68[1] = @"controlItemPurpose";
  v9 = [NSNumber numberWithUnsignedInteger:10];
  v69[1] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

  v11 = [HFIncrementalStateControlItem alloc];
  v57 = (void *)v10;
  uint64_t v12 = [(HFIncrementalStateControlItem *)v11 initWithValueSource:v5 primaryStateControlItem:v7 incrementalCharacteristicType:*MEMORY[0x263F0C378] displayResults:v10];
  v13 = (void *)MEMORY[0x263EFF9C0];
  v58 = (void *)v7;
  v67[0] = v7;
  v67[1] = v12;
  v56 = (void *)v12;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:2];
  v59 = [v13 setWithArray:v14];

  v60 = self;
  v15 = [(HFServiceItem *)self service];
  v16 = objc_msgSend(v15, "hf_characteristicOfType:", *MEMORY[0x263F0C370]);

  v17 = [v16 metadata];
  v18 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionClockwise", v4);
  v19 = HFItemOptionalLocalizedString(@"HFCharacteristicValueRotationDirectionCounterClockwise", v4);
  uint64_t v20 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v17 firstValue:&unk_26C0F61C8 firstTitle:v18 secondValue:&unk_26C0F61E0 secondTitle:v19];

  if (v20)
  {
    v21 = [HFMultiStateControlItem alloc];
    v22 = [v16 characteristicType];
    v65[0] = @"title";
    v23 = HFItemOptionalLocalizedString(@"HFControlShortTitleRotationDirection", v4);
    v65[1] = @"controlItemPurpose";
    v66[0] = v23;
    v24 = [NSNumber numberWithUnsignedInteger:4];
    v66[1] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:2];
    v26 = [(HFMultiStateControlItem *)v21 initWithValueSource:v5 characteristicType:v22 possibleValueSet:v20 displayResults:v25];
    objc_msgSend(v59, "na_safeAddObject:", v26);
  }
  v54 = (void *)v20;
  v55 = v16;
  v27 = [(HFServiceItem *)v60 service];
  objc_msgSend(v27, "hf_characteristicOfType:", *MEMORY[0x263F0C4B8]);
  v29 = v28 = (void *)v5;

  v30 = [v29 metadata];
  v31 = HFItemOptionalLocalizedString(@"HFCharacteristicValueFanTargetStateManual", v4);
  v32 = HFItemOptionalLocalizedString(@"HFCharacteristicValueFanTargetStateAuto", v4);
  uint64_t v33 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v30 firstValue:&unk_26C0F61C8 firstTitle:v31 secondValue:&unk_26C0F61E0 secondTitle:v32];

  if (v33)
  {
    v34 = [HFMultiStateControlItem alloc];
    v35 = [v29 characteristicType];
    v63 = @"title";
    v36 = HFItemOptionalLocalizedString(@"HFControlShortTitleFanMode", v4);
    v64 = v36;
    v37 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    v38 = [(HFMultiStateControlItem *)v34 initWithValueSource:v28 characteristicType:v35 possibleValueSet:v33 displayResults:v37];
    objc_msgSend(v59, "na_safeAddObject:", v38);
  }
  v52 = (void *)v33;
  v53 = v29;
  v39 = [[HFSwingModeControlItem alloc] initWithValueSource:v28];
  objc_msgSend(v59, "na_safeAddObject:", v39);

  v40 = [(HFServiceItem *)v60 service];
  v41 = objc_msgSend(v40, "hf_characteristicOfType:", *MEMORY[0x263F0C260]);

  v42 = [v41 metadata];
  v43 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsUnlocked", v4);
  v44 = HFItemOptionalLocalizedString(@"HFCharacteristicValueLockPhysicalControlsLocked", v4);
  v45 = +[HFMultiStateValueSet binaryValueSetWithCharacteristicMetadata:v42 firstValue:&unk_26C0F61C8 firstTitle:v43 secondValue:&unk_26C0F61E0 secondTitle:v44];

  if (v45)
  {
    v46 = [HFMultiStateControlItem alloc];
    v47 = objc_msgSend(v41, "characteristicType", v52, v29);
    v61 = @"title";
    v48 = HFItemOptionalLocalizedString(@"HFControlShortTitleLockPhysicalControls", v4);
    v62 = v48;
    v49 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v50 = [(HFMultiStateControlItem *)v46 initWithValueSource:v28 characteristicType:v47 possibleValueSet:v45 displayResults:v49];
    objc_msgSend(v59, "na_safeAddObject:", v50);
  }
  return v59;
}

+ (id)supportedServiceTypes
{
  return (id)objc_msgSend(MEMORY[0x263F0E708], "hf_fanServiceTypes");
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = *MEMORY[0x263F0C378];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v5, 0);
  v8 = [(HFServiceItem *)self service];
  v9 = (void *)*MEMORY[0x263F0C328];
  uint64_t v10 = objc_msgSend(v8, "hf_characteristicOfType:", *MEMORY[0x263F0C328]);

  if (v10
    || ([(HFServiceItem *)self service],
        v11 = objc_claimAutoreleasedReturnValue(),
        v9 = (void *)*MEMORY[0x263F0BEF8],
        objc_msgSend(v11, "hf_characteristicOfType:", *MEMORY[0x263F0BEF8]),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        v12))
  {
    id v13 = v9;
  }
  else
  {
    v18 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(HFServiceItem *)self service];
      uint64_t v20 = objc_msgSend(v19, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "Fan (%@) has neither a powerState nor an active characteristic type!", buf, 0xCu);
    }
    id v13 = 0;
  }
  objc_msgSend(v7, "na_safeAddObject:", v13);
  v14 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v7 options:v6];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __48__HFFanServiceItem__subclass_updateWithOptions___block_invoke;
  v21[3] = &unk_26408F700;
  id v22 = v13;
  v23 = self;
  id v15 = v13;
  v16 = [v14 flatMap:v21];

  return v16;
}

id __48__HFFanServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*(void *)(a1 + 32)];
  v37 = [v5 characteristic];
  uint64_t v6 = [v5 valueWithExpectedClass:objc_opt_class()];
  uint64_t v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C378]];
  v8 = [v7 characteristic];
  v34 = v7;
  uint64_t v9 = [v7 valueWithExpectedClass:objc_opt_class()];
  uint64_t v10 = [v3 standardResults];
  v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v3 displayMetadata];

  uint64_t v13 = [v12 primaryState];
  v35 = (void *)v9;
  v36 = (void *)v6;
  uint64_t v33 = v4;
  if (!v9)
  {
    if (v6)
    {
      uint64_t v18 = a1;
      v24 = [*(id *)(a1 + 40) controlDescriptionForCharacteristic:v37 withValue:v6];
      v25 = [v11 objectForKeyedSubscript:@"description"];

      if (!v25)
      {
        v32 = v5;
        id v15 = [*(id *)(a1 + 40) descriptionForCharacteristic:v37 withValue:v6];
        [v11 setObject:v15 forKeyedSubscript:@"description"];
        v17 = 0;
        v21 = v8;
        v23 = v33;
        id v22 = v34;
        goto LABEL_21;
      }
      v17 = 0;
      v21 = v8;
    }
    else
    {
      v24 = 0;
      v17 = 0;
      v21 = v8;
      uint64_t v18 = a1;
    }
    v23 = v33;
    id v22 = v34;
    goto LABEL_22;
  }
  v32 = v5;
  v14 = &unk_26C0F61F8;
  if (v13 == 2) {
    v14 = (void *)v9;
  }
  id v15 = v14;
  v16 = [v8 metadata];
  v17 = objc_msgSend(v16, "hf_percentageForCharacteristicValue:", v15);

  [v11 setObject:v17 forKeyedSubscript:@"subPriority"];
  uint64_t v18 = a1;
  v19 = [*(id *)(a1 + 40) descriptionForCharacteristic:v8 withValue:v15];
  uint64_t v20 = [v11 objectForKeyedSubscript:@"description"];

  v21 = v8;
  if (v20)
  {
    v23 = v33;
    id v22 = v34;
  }
  else
  {
    id v22 = v34;
    if (v19 && v13 == 2)
    {
      [v11 setObject:v19 forKeyedSubscript:@"description"];
      v23 = v33;
LABEL_19:
      uint64_t v27 = objc_msgSend(*(id *)(v18 + 40), "controlDescriptionForCharacteristic:withValue:", v21, v15, v32);
      goto LABEL_20;
    }
    if (v36)
    {
      uint64_t v26 = objc_msgSend(*(id *)(v18 + 40), "descriptionForCharacteristic:withValue:", v37);

      objc_msgSend(v11, "na_safeSetObject:forKey:", v26, @"description");
      v19 = (void *)v26;
    }
    v23 = v33;
  }
  if (v13 != 1) {
    goto LABEL_19;
  }
  uint64_t v27 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTitleIncrementalStateOff", @"HFCharacteristicTitleIncrementalStateOff", 1);
LABEL_20:
  v24 = (void *)v27;

LABEL_21:
  uint64_t v5 = v32;
LABEL_22:
  objc_msgSend(v11, "na_safeSetObject:forKey:", v24, @"controlDescription", v32);
  [*(id *)(v18 + 40) applyInflectionToDescriptions:v11];
  v28 = (void *)MEMORY[0x263F58190];
  v29 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  v30 = [v28 futureWithResult:v29];

  return v30;
}

@end