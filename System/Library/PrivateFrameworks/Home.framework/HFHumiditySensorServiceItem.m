@interface HFHumiditySensorServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFHumiditySensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D730]];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = *MEMORY[0x263F0C0E0];
  id v7 = a3;
  v8 = [v5 setWithObject:v6];
  v9 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v8 options:v7];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__HFHumiditySensorServiceItem__subclass_updateWithOptions___block_invoke;
  v12[3] = &unk_26408EAD8;
  v12[4] = self;
  v12[5] = a2;
  v10 = [v9 flatMap:v12];

  return v10;
}

id __59__HFHumiditySensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 readResponse];
  v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C0E0]];

  uint64_t v6 = [v5 characteristic];
  id v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v3 standardResults];

  v9 = (void *)[v8 mutableCopy];
  v10 = [*(id *)(a1 + 32) service];
  v11 = [v10 accessory];

  if (objc_msgSend(v11, "hf_isHomePod")
    && ((objc_msgSend(v11, "hf_isReadyToInstallSoftwareUpdate") & 1) != 0
     || objc_msgSend(v11, "hf_isSoftwareUpdateInProgress")))
  {
    v12 = HFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v29 = 138412546;
      uint64_t v30 = v13;
      __int16 v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Clearing display elements for SU for Homepod Humidity Sensor", (uint8_t *)&v29, 0x16u);
    }
    [v9 setObject:0 forKeyedSubscript:@"description"];
    [v9 setObject:0 forKeyedSubscript:@"detailedControlDescription"];
    [v9 setObject:0 forKeyedSubscript:@"badge"];
    [v9 setObject:0 forKeyedSubscript:@"descriptionBadge"];
  }
  if (v7)
  {
    v15 = [*(id *)(a1 + 32) descriptionForCharacteristic:v6 withValue:v7];
    if (v15)
    {
      v16 = [v9 objectForKeyedSubscript:@"description"];

      if (!v16) {
        [v9 setObject:v15 forKeyedSubscript:@"description"];
      }
    }
    v17 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v6 withValue:v7];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v17, @"controlDescription");
  }
  v18 = [*(id *)(a1 + 32) service];
  v19 = [v18 accessory];
  int v20 = [v19 isCalibrating];

  if (v20)
  {
    v21 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescriptionCalibrating", @"HFServiceDescriptionCalibrating", 1);
    [v9 setObject:v21 forKeyedSubscript:@"description"];

    v22 = HFLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      v24 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v29 = 138412802;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Sensor calibrating, resetting potential error descriptions: %@", (uint8_t *)&v29, 0x20u);
    }
    [v9 setObject:0 forKeyedSubscript:@"errorDescription"];
    [v9 setObject:0 forKeyedSubscript:@"longErrorDescription"];
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v9];
  v25 = (void *)MEMORY[0x263F58190];
  v26 = +[HFItemUpdateOutcome outcomeWithResults:v9];
  v27 = [v25 futureWithResult:v26];

  return v27;
}

@end