@interface HFThermostatServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFThermostatServiceItem

- (id)createControlItemsWithOptions:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  v6 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v7 = [HFTemperatureThresholdControlItem alloc];
  v48 = @"title";
  v8 = HFItemOptionalLocalizedString(@"HFControlShortTitleTemperature", v4);
  v49[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  uint64_t v10 = [(HFTemperatureThresholdControlItem *)v7 initWithValueSource:v6 displayResults:v9];

  v37 = (void *)v10;
  objc_msgSend(v5, "na_safeAddObject:", v10);
  v11 = [HFSimpleIncrementalControlItem alloc];
  v12 = [(HFSimpleIncrementalControlItem *)v11 initWithValueSource:v6 characteristicType:*MEMORY[0x263F0C530] displayResults:0];
  [v5 addObject:v12];
  v13 = [HFTemperatureUnitControlItem alloc];
  v36 = [(HFTemperatureUnitControlItem *)v13 initWithValueSource:v6 characteristicType:*MEMORY[0x263F0C578] displayResults:0];
  objc_msgSend(v5, "addObject:");
  v14 = [(HFServiceItem *)self service];
  uint64_t v35 = *MEMORY[0x263F0C4D8];
  v15 = objc_msgSend(v14, "hf_characteristicOfType:");
  v16 = [v15 metadata];

  v17 = [[HFMultiStateValueSet alloc] initWithCharacteristicMetadata:v16];
  v46 = @"title";
  v18 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeOff", v4);
  v47 = v18;
  v19 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  [(HFMultiStateValueSet *)v17 addValue:&unk_26C0F5EC8 displayResults:v19];

  v44 = @"title";
  v20 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeHeat", v4);
  v45 = v20;
  v21 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  [(HFMultiStateValueSet *)v17 addValue:&unk_26C0F5EE0 displayResults:v21];

  v42 = @"title";
  v22 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeCool", v4);
  v43 = v22;
  v23 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  [(HFMultiStateValueSet *)v17 addValue:&unk_26C0F5EF8 displayResults:v23];

  v40 = @"title";
  v24 = HFItemOptionalLocalizedString(@"HFServiceThermostatModeAuto", v4);
  v41 = v24;
  v25 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  [(HFMultiStateValueSet *)v17 addValue:&unk_26C0F5F10 displayResults:v25];

  v26 = [(HFMultiStateValueSet *)v17 allValues];
  unint64_t v27 = [v26 count];

  if (v27 >= 2)
  {
    v28 = +[HFUtilities comparatorWithSortedObjects:&unk_26C0F80B0];
    [(HFMultiStateValueSet *)v17 setValueComparator:v28];

    v29 = [HFMultiStateControlItem alloc];
    v38[0] = @"title";
    v30 = HFItemOptionalLocalizedString(@"HFControlShortTitleHeatingCoolingMode", v4);
    v38[1] = @"controlItemPurpose";
    v39[0] = v30;
    v39[1] = &unk_26C0F5F28;
    [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    v32 = v31 = v12;
    v33 = [(HFMultiStateControlItem *)v29 initWithValueSource:v6 characteristicType:v35 possibleValueSet:v17 displayResults:v32];

    v12 = v31;
    [v5 addObject:v33];
  }
  return v5;
}

id __55__HFThermostatServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C110]];
  uint64_t v6 = [v5 valueWithExpectedClass:objc_opt_class()];

  v7 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C4D8]];
  v26 = [v7 valueWithExpectedClass:objc_opt_class()];

  v8 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C068]];
  v25 = [v8 valueWithExpectedClass:objc_opt_class()];

  v9 = [v3 standardResults];

  uint64_t v10 = (void *)[v9 mutableCopy];
  v11 = +[HFFormatterManager sharedInstance];
  v12 = [v11 temperatureFormatter];

  [v12 setInputIsCelsius:1];
  id v28 = 0;
  id v29 = 0;
  id v27 = 0;
  v13 = [*(id *)(a1 + 32) service];
  +[HFThermostatItemUtilities getDescription:&v29 controlDescription:&v28 optionalDescriptions:&v27 forResponse:v4 primaryService:v13 temperatureFormatter:v12];
  id v14 = v29;
  id v15 = v28;
  id v16 = v27;

  if (v14)
  {
    v17 = [v10 objectForKeyedSubscript:@"description"];

    if (!v17) {
      [v10 setObject:v14 forKeyedSubscript:@"description"];
    }
  }
  objc_msgSend(v10, "na_safeSetObject:forKey:", v15, @"controlDescription");
  [v10 addEntriesFromDictionary:v16];
  v18 = [v12 stringForObjectValue:v6];
  v24 = (void *)v6;
  v19 = -[HFTemperatureIconDescriptor initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:]([HFTemperatureIconDescriptor alloc], "initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:", v18, [v25 integerValue], objc_msgSend(v26, "integerValue"));
  [v10 setObject:v19 forKeyedSubscript:@"icon"];

  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"tempreatureUnitDependency"];
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v10];
  v20 = (void *)MEMORY[0x263F58190];
  v21 = +[HFItemUpdateOutcome outcomeWithResults:v10];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D870]];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v16[6] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C550];
  v16[0] = *MEMORY[0x263F0C110];
  v16[1] = v5;
  uint64_t v6 = *MEMORY[0x263F0C4D8];
  v16[2] = *MEMORY[0x263F0C068];
  v16[3] = v6;
  uint64_t v7 = *MEMORY[0x263F0C1A0];
  v16[4] = *MEMORY[0x263F0C020];
  v16[5] = v7;
  v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  uint64_t v10 = [v8 arrayWithObjects:v16 count:6];
  v11 = [v4 setWithArray:v10];

  v12 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v11 options:v9];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__HFThermostatServiceItem__subclass_updateWithOptions___block_invoke;
  v15[3] = &unk_26408C9A8;
  v15[4] = self;
  v13 = [v12 flatMap:v15];

  return v13;
}

@end