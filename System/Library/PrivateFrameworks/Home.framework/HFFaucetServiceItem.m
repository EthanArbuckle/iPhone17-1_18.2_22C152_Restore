@interface HFFaucetServiceItem
+ (id)supportedServiceTypes;
- (BOOL)_shouldSubsumeValveInOverallActiveState;
- (BOOL)containsActions;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)servicesToReadForCharacteristicType:(id)a3;
@end

@implementation HFFaucetServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D6D8]];
}

- (BOOL)_shouldSubsumeValveInOverallActiveState
{
  v2 = [(HFServiceItem *)self service];
  v3 = objc_msgSend(v2, "hf_childServicesOfType:", *MEMORY[0x263F0D880]);
  BOOL v4 = (unint64_t)[v3 count] < 2;

  return v4;
}

- (id)servicesToReadForCharacteristicType:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFFaucetServiceItem;
  id v4 = a3;
  v5 = [(HFServiceItem *)&v11 servicesToReadForCharacteristicType:v4];
  int v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F0BEF8], v11.receiver, v11.super_class);

  if (v6)
  {
    v7 = [(HFServiceItem *)self service];
    v8 = objc_msgSend(v7, "hf_childServicesOfType:", *MEMORY[0x263F0D880]);
    uint64_t v9 = objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v8);

    v5 = (void *)v9;
  }
  return v5;
}

- (id)createControlItemsWithOptions:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  int v6 = [v4 set];
  v7 = [(HFServiceItem *)self service];
  v8 = objc_msgSend(v7, "hf_childServices");
  uint64_t v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_15);

  v10 = (void *)MEMORY[0x263EFF9C0];
  objc_super v11 = [(HFServiceItem *)self service];
  v12 = [v10 setWithObject:v11];

  objc_msgSend(v12, "na_safeAddObject:", v9);
  v13 = [(HFServiceItem *)self service];
  uint64_t v14 = *MEMORY[0x263F0D880];
  v15 = objc_msgSend(v13, "hf_childServicesOfType:", *MEMORY[0x263F0D880]);
  [v12 unionSet:v15];

  if ([(HFFaucetServiceItem *)self _shouldSubsumeValveInOverallActiveState])
  {
    uint64_t v16 = 0;
  }
  else
  {
    v17 = [HFChildServiceFilter alloc];
    v18 = [MEMORY[0x263EFFA08] setWithObject:v14];
    v19 = [(HFChildServiceFilter *)v17 initWithChildServiceTypes:v18];

    v20 = [HFChildServiceControlItem alloc];
    v21 = [(HFServiceItem *)self valueSource];
    v22 = [(HFServiceItem *)self service];
    v23 = [(HFChildServiceControlItem *)v20 initWithBaseValueSource:v21 parentService:v22 childServiceFilter:v19 displayResults:0];

    objc_msgSend(v6, "na_safeAddObject:", v23);
    uint64_t v16 = 1;
  }
  v24 = [(HFServiceItem *)self controlItemValueSourceForServices:v12];
  v25 = [HFFaucetActiveStateControlItem alloc];
  v36 = @"title";
  v26 = HFItemOptionalLocalizedString(@"HFControlTitleFaucetActive", v5);
  v37[0] = v26;
  v27 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
  v28 = [(HFFaucetActiveStateControlItem *)v25 initWithValueSource:v24 valveControlMode:v16 displayResults:v27];
  [v6 addObject:v28];

  v29 = [HFHeaterCoolerThresholdControlItem alloc];
  v34 = @"title";
  v30 = HFItemOptionalLocalizedString(@"HFControlTitleFaucetTemperature", v5);

  v35 = v30;
  v31 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v32 = [(HFHeaterCoolerThresholdControlItem *)v29 initWithValueSource:v24 displayResults:v31];

  objc_msgSend(v6, "na_safeAddObject:", v32);
  return v6;
}

uint64_t __53__HFFaucetServiceItem_createControlItemsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 serviceType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F0D708]];

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  int v6 = [v4 set];
  v7 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v6 options:v5];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFFaucetServiceItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_26408C9A8;
  v10[4] = self;
  v8 = [v7 flatMap:v10];

  return v8;
}

id __51__HFFaucetServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 standardResults];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:&unk_26C0F5FE8 forKeyedSubscript:@"controlSummaryStyle"];
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v4];
  id v5 = (void *)MEMORY[0x263F58190];
  int v6 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v7 = [v5 futureWithResult:v6];

  return v7;
}

- (BOOL)containsActions
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F58190];
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  id v5 = [v3 futureWithResult:v4];

  return v5;
}

@end