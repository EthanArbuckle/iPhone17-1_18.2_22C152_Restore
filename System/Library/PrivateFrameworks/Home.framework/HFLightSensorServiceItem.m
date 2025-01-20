@interface HFLightSensorServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFLightSensorServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D768]];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C0A0];
  id v6 = a3;
  v7 = [v4 setWithObject:v5];
  v8 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v7 options:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__HFLightSensorServiceItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_26408C9A8;
  v11[4] = self;
  v9 = [v8 flatMap:v11];

  return v9;
}

id __56__HFLightSensorServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C0A0]];

  id v6 = [v5 characteristic];
  v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v3 standardResults];

  v9 = (void *)[v8 mutableCopy];
  if (v7)
  {
    v10 = [*(id *)(a1 + 32) descriptionForCharacteristic:v6 withValue:v7];
    if (v10)
    {
      v11 = [v9 objectForKeyedSubscript:@"description"];

      if (!v11) {
        [v9 setObject:v10 forKeyedSubscript:@"description"];
      }
    }
    v12 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v6 withValue:v7];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v12, @"controlDescription");
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v9];
  v13 = (void *)MEMORY[0x263F58190];
  v14 = +[HFItemUpdateOutcome outcomeWithResults:v9];
  v15 = [v13 futureWithResult:v14];

  return v15;
}

@end