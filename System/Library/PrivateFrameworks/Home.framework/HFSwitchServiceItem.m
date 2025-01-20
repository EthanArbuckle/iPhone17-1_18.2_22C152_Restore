@interface HFSwitchServiceItem
+ (id)supportedServiceTypes;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
@end

@implementation HFSwitchServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D828]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [HFPowerStateControlItem alloc];
  v13 = @"title";
  v8 = HFItemOptionalLocalizedString(@"HFControlShortTitlePower", v4);

  v14[0] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = [(HFPowerStateControlItem *)v7 initWithValueSource:v5 displayResults:v9];
  v11 = [v6 setWithObject:v10];

  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C328];
  id v6 = a3;
  v7 = [v4 setWithObject:v5];
  v8 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v7 options:v6];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__HFSwitchServiceItem__subclass_updateWithOptions___block_invoke;
  v11[3] = &unk_26408C9A8;
  v11[4] = self;
  v9 = [v8 flatMap:v11];

  return v9;
}

id __51__HFSwitchServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 readResponse];
  uint64_t v5 = [v4 responseForCharacteristicType:*MEMORY[0x263F0C328]];

  id v6 = [v5 characteristic];
  v7 = [v5 valueWithExpectedClass:objc_opt_class()];
  v8 = [v3 standardResults];

  v9 = (void *)[v8 mutableCopy];
  if (v7)
  {
    v10 = [*(id *)(a1 + 32) controlDescriptionForCharacteristic:v6 withValue:v7];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v10, @"controlDescription");
    v11 = [*(id *)(a1 + 32) descriptionForCharacteristic:v6 withValue:v7];
    objc_msgSend(v9, "na_safeSetObject:forKey:", v11, @"description");
  }
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v9];
  v12 = (void *)MEMORY[0x263F58190];
  v13 = +[HFItemUpdateOutcome outcomeWithResults:v9];
  v14 = [v12 futureWithResult:v13];

  return v14;
}

@end