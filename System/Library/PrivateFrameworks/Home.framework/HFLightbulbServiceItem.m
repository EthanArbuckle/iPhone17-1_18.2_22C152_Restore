@interface HFLightbulbServiceItem
+ (id)supportedServiceTypes;
- (BOOL)containsActions;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)lightProfile;
@end

@implementation HFLightbulbServiceItem

id __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [v2 readResponse];
  v4 = [v3 responseForCharacteristicType:*MEMORY[0x263F0C328]];
  v5 = [v4 characteristic];
  v6 = [v4 valueWithExpectedClass:objc_opt_class()];
  v7 = [v3 responseForCharacteristicType:*MEMORY[0x263F0BF68]];
  v35 = [v7 characteristic];
  v33 = v7;
  v8 = [v7 valueWithExpectedClass:objc_opt_class()];
  v34 = v6;
  if (+[HFUtilities hasInternalDiagnostics])
  {
    v9 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v38 = v11;
      __int16 v39 = 2112;
      v40 = v34;
      __int16 v41 = 2112;
      v42 = v8;
      __int16 v43 = 2112;
      uint64_t v44 = v12;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "%@ read power state %@, brightness %@ in item: %@", buf, 0x2Au);

      v6 = v34;
    }
  }
  if (v8 && ![v8 intValue] && objc_msgSend(v6, "BOOLValue"))
  {
    v13 = HFLogForCategory(0x39uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      v38 = v15;
      __int16 v39 = 2112;
      v40 = v8;
      __int16 v41 = 2112;
      v42 = &unk_26C0F7920;
      __int16 v43 = 2112;
      uint64_t v44 = v16;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "%@ overriding brightness from %@ to %@ in item: %@", buf, 0x2Au);

      v6 = v34;
    }

    v8 = &unk_26C0F7920;
  }
  v17 = [v2 standardResults];
  v18 = (void *)[v17 mutableCopy];

  v19 = [v2 displayMetadata];

  uint64_t v20 = [v19 primaryState];
  if (v8)
  {
    v21 = &unk_26C0F7950;
    if (v20 == 2) {
      v21 = v8;
    }
    id v22 = v21;
    v23 = [v35 metadata];
    v24 = objc_msgSend(v23, "hf_percentageForCharacteristicValue:", v22);

    [v18 setObject:v24 forKeyedSubscript:@"subPriority"];
    v25 = [*(id *)(a1 + 32) descriptionForCharacteristic:v35 withValue:v22];
    v26 = [v18 objectForKeyedSubscript:@"description"];

    if (!v26)
    {
      if (v25 && v20 == 2)
      {
        [v18 setObject:v25 forKeyedSubscript:@"description"];
        goto LABEL_22;
      }
      if (v34)
      {
        uint64_t v32 = objc_msgSend(*(id *)(a1 + 32), "descriptionForCharacteristic:withValue:", v5);

        objc_msgSend(v18, "na_safeSetObject:forKey:", v32, @"description");
        v25 = (void *)v32;
      }
    }
    if (v20 == 1)
    {
      v27 = _HFLocalizedStringWithDefaultValue(@"HFCharacteristicTitleIncrementalStateOff", @"HFCharacteristicTitleIncrementalStateOff", 1);
LABEL_23:

      goto LABEL_24;
    }
LABEL_22:
    v27 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v35 withValue:v22];
    goto LABEL_23;
  }
  if (v6)
  {
    v27 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v5 withValue:v6];
    id v22 = [*(id *)(a1 + 32) descriptionForCharacteristic:v5 withValue:v6];
    objc_msgSend(v18, "na_safeSetObject:forKey:", v22, @"description");
    v24 = 0;
LABEL_24:

    v6 = v34;
    goto LABEL_25;
  }
  v27 = 0;
  v24 = 0;
LABEL_25:
  objc_msgSend(v18, "na_safeSetObject:forKey:", v27, @"controlDescription");
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v18];
  v28 = (void *)MEMORY[0x263F58190];
  v29 = +[HFItemUpdateOutcome outcomeWithResults:v18];
  v30 = [v28 futureWithResult:v29];

  return v30;
}

- (id)createControlItemsWithOptions:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v7 = [HFPowerStateControlItem alloc];
  v26 = @"title";
  v8 = _HFLocalizedStringWithDefaultValue(@"HFControlShortTitlePower", @"HFControlShortTitlePower", 1);
  v27[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
  v10 = [(HFPowerStateControlItem *)v7 initWithValueSource:v6 displayResults:v9];

  objc_msgSend(v5, "na_safeAddObject:", v10);
  v24[0] = @"title";
  v11 = HFItemOptionalLocalizedString(@"HFControlShortTitleColor", v4);
  v24[1] = @"controlItemPurpose";
  v25[0] = v11;
  v25[1] = &unk_26C0F7938;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  v13 = [[HFColorControlItem alloc] initWithValueSource:v6 displayResults:v12];
  v14 = (void *)MEMORY[0x263EFF9A0];
  v15 = HFItemOptionalLocalizedString(@"HFControlShortTitleBrightness", v4);

  uint64_t v16 = [v14 dictionaryWithObject:v15 forKey:@"title"];

  v17 = [(HFControlItem *)v13 characteristicOptions];
  v18 = [v17 allCharacteristicTypes];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    uint64_t v20 = [MEMORY[0x263F1C550] clearColor];
    [v16 setObject:v20 forKeyedSubscript:@"tintColor"];

    objc_msgSend(v5, "na_safeAddObject:", v13);
  }
  v21 = [HFLightbulbControlItem alloc];
  id v22 = [(HFIncrementalStateControlItem *)v21 initWithValueSource:v6 primaryStateControlItem:v10 incrementalCharacteristicType:*MEMORY[0x263F0BF68] displayResults:v16];
  objc_msgSend(v5, "na_safeAddObject:", v22);

  return v5;
}

+ (id)supportedServiceTypes
{
  if (_MergedGlobals_308 != -1) {
    dispatch_once(&_MergedGlobals_308, &__block_literal_global_4_15);
  }
  id v2 = (void *)qword_26AB2FC48;
  return v2;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  if (qword_26AB2FC50 != -1) {
    dispatch_once(&qword_26AB2FC50, &__block_literal_global_25_13);
  }
  id v5 = (id)qword_26AB2FC58;
  v6 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v5 options:v4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_3;
  v9[3] = &unk_26408C9A8;
  v9[4] = self;
  v7 = [v6 flatMap:v9];

  return v7;
}

uint64_t __47__HFLightbulbServiceItem_supportedServiceTypes__block_invoke_2()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D780]];
  uint64_t v1 = qword_26AB2FC48;
  qword_26AB2FC48 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __54__HFLightbulbServiceItem__subclass_updateWithOptions___block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F0C328], *MEMORY[0x263F0BF68], *MEMORY[0x263F0C398], *MEMORY[0x263F0BFF8], *MEMORY[0x263F0C1C0], 0);
  uint64_t v1 = qword_26AB2FC58;
  qword_26AB2FC58 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)containsActions
{
  return 1;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFLightbulbServiceItem;
  id v5 = [(HFServiceItem *)&v16 currentStateActionBuildersForHome:v4];
  v6 = [(HFLightbulbServiceItem *)self lightProfile];
  v7 = [v6 settings];
  char v8 = [v7 supportedFeatures];

  if (v8)
  {
    v9 = [(HFItemBuilder *)[HFNaturalLightingActionBuilder alloc] initWithHome:v4];
    [(HFNaturalLightingActionBuilder *)v9 setLightProfile:v6];
    v10 = [v6 settings];
    -[HFNaturalLightingActionBuilder setNaturalLightEnabled:](v9, "setNaturalLightEnabled:", [v10 isNaturalLightingEnabled]);
  }
  else
  {
    v9 = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__HFLightbulbServiceItem_currentStateActionBuildersForHome___block_invoke;
  v14[3] = &unk_2640967E0;
  v15 = v9;
  v11 = v9;
  uint64_t v12 = [v5 flatMap:v14];

  return v12;
}

id __60__HFLightbulbServiceItem_currentStateActionBuildersForHome___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  objc_msgSend(v3, "na_safeAddObject:", *(void *)(a1 + 32));
  id v4 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v4;
}

- (id)lightProfile
{
  id v2 = [(HFServiceItem *)self service];
  v3 = objc_msgSend(v2, "hf_lightProfiles");

  if ((unint64_t)[v3 count] >= 2) {
    NSLog(&cfstr_OnlyExpectedOn.isa, v3);
  }
  id v4 = [v3 anyObject];

  return v4;
}

@end