@interface HFTemperatureSensorServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFTemperatureSensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D858]];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F0C110];
  id v7 = a3;
  v8 = [v5 setWithObject:v6];
  v9 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v8 options:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HFTemperatureSensorServiceItem__subclass_updateWithOptions___block_invoke;
  v12[3] = &unk_26408EAD8;
  v12[4] = self;
  v12[5] = a2;
  v10 = [v9 flatMap:v12];

  return v10;
}

id __62__HFTemperatureSensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 readResponse];
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C110]];

  uint64_t v6 = [v5 characteristic];
  id v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v3 standardResults];

  v9 = (void *)[v8 mutableCopy];
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"tempreatureUnitDependency"];
  v10 = [*(id *)(a1 + 32) service];
  v11 = [v10 accessory];
  int v12 = [v11 isCalibrating];

  if (v12)
  {
    v13 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionCalibrating", @"HFServiceDescriptionCalibrating", 1);
    [v9 setObject:v13 forKeyedSubscript:@"description"];

    v14 = HFLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v32 = 138412802;
      uint64_t v33 = v15;
      __int16 v34 = 2112;
      v35 = v16;
      __int16 v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Sensor calibrating, resetting potential error descriptions: %@", (uint8_t *)&v32, 0x20u);
    }
    [v9 setObject:0 forKeyedSubscript:@"errorDescription"];
    [v9 setObject:0 forKeyedSubscript:@"longErrorDescription"];
  }
  if (v7)
  {
    v17 = [*(id *)(a1 + 32) service];
    v18 = [v17 accessory];

    if (objc_msgSend(v18, "hf_isHomePod")
      && ((objc_msgSend(v18, "hf_isReadyToInstallSoftwareUpdate") & 1) != 0
       || objc_msgSend(v18, "hf_isSoftwareUpdateInProgress")))
    {
      v19 = HFLogForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = NSStringFromSelector(*(SEL *)(a1 + 40));
        int v32 = 138412546;
        uint64_t v33 = v20;
        __int16 v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ Clearing display elements for SU for Homepod Temperature Sensor", (uint8_t *)&v32, 0x16u);
      }
      [v9 setObject:0 forKeyedSubscript:@"description"];
      [v9 setObject:0 forKeyedSubscript:@"detailedControlDescription"];
      [v9 setObject:0 forKeyedSubscript:@"badge"];
      [v9 setObject:0 forKeyedSubscript:@"descriptionBadge"];
    }
    v22 = [v9 objectForKeyedSubscript:@"description"];

    if (!v22)
    {
      v23 = +[HFFormatterManager sharedInstance];
      v24 = [v23 temperatureFormatter];

      [v24 setInputIsCelsius:1];
      v25 = [v24 stringForObjectValue:v7];
      [v9 setObject:v25 forKeyedSubscript:@"description"];
    }
    v26 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v6 withValue:v7];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v26, @"controlDescription");

    [*(id *)(a1 + 32) applyInflectionToDescriptions:v9];
    v27 = (void *)MEMORY[0x263F58190];
    v28 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    v29 = [v27 futureWithResult:v28];
  }
  else
  {
    v30 = (void *)MEMORY[0x263F58190];
    v18 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    v29 = [v30 futureWithResult:v18];
  }

  return v29;
}

@end