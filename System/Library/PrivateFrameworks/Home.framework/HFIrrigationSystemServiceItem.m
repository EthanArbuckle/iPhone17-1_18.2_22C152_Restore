@interface HFIrrigationSystemServiceItem
+ (id)supportedServiceTypes;
- (BOOL)containsActions;
- (id)_childValveServiceFilter;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)currentStateActionBuildersForHome:(id)a3;
- (id)servicesToReadForCharacteristicType:(id)a3;
@end

@implementation HFIrrigationSystemServiceItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = *MEMORY[0x263F0C200];
  v14[0] = *MEMORY[0x263F0BEF8];
  v14[1] = v5;
  v14[2] = *MEMORY[0x263F0C340];
  v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:v14 count:3];
  v9 = [v4 setWithArray:v8];

  v10 = [(HFServiceItem *)self performStandardUpdateWithCharacteristicTypes:v9 options:v7];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__HFIrrigationSystemServiceItem__subclass_updateWithOptions___block_invoke;
  v13[3] = &unk_26408C9A8;
  v13[4] = self;
  v11 = [v10 flatMap:v13];

  return v11;
}

- (id)servicesToReadForCharacteristicType:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFIrrigationSystemServiceItem;
  id v4 = a3;
  uint64_t v5 = [(HFServiceItem *)&v11 servicesToReadForCharacteristicType:v4];
  int v6 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x263F0BEF8], v11.receiver, v11.super_class);

  if (v6)
  {
    id v7 = [(HFServiceItem *)self service];
    v8 = objc_msgSend(v7, "hf_childServicesOfType:", *MEMORY[0x263F0D880]);
    uint64_t v9 = objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v8);

    uint64_t v5 = (void *)v9;
  }
  return v5;
}

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D740]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  id v4 = [(HFIrrigationSystemServiceItem *)self _childValveServiceFilter];
  uint64_t v5 = [(HFServiceItem *)self service];
  int v6 = [v4 filteredChildServicesForParentService:v5];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [HFChildServiceControlItem alloc];
    uint64_t v9 = [(HFServiceItem *)self valueSource];
    v10 = [(HFServiceItem *)self service];
    objc_super v11 = [(HFChildServiceControlItem *)v8 initWithBaseValueSource:v9 parentService:v10 childServiceFilter:v4 displayResults:0];

    v12 = [MEMORY[0x263EFFA08] setWithObject:v11];
  }
  else
  {
    v12 = [MEMORY[0x263EFFA08] set];
  }

  return v12;
}

- (id)_childValveServiceFilter
{
  v2 = [HFChildServiceFilter alloc];
  v3 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D880]];
  id v4 = [(HFChildServiceFilter *)v2 initWithChildServiceTypes:v3];

  return v4;
}

id __61__HFIrrigationSystemServiceItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 standardResults];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:&unk_26C0F67F8 forKeyedSubscript:@"controlSummaryStyle"];
  uint64_t v5 = [*(id *)(a1 + 32) service];
  int v6 = objc_msgSend(v5, "hf_childServicesOfType:", *MEMORY[0x263F0D880]);
  if ([v6 count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) _childValveServiceFilter];
    v8 = [*(id *)(a1 + 32) service];
    uint64_t v9 = [v7 filteredChildServicesForParentService:v8];
    uint64_t v10 = [v9 count];

    if (v10) {
      goto LABEL_6;
    }
    uint64_t v5 = _HFLocalizedStringWithDefaultValue(@"HFServiceDescription.IrrigationSystem, NoValvesConfigured, Context:Control", @"HFServiceDescription.IrrigationSystem, NoValvesConfigured, Context:Control", 1);
    [v4 setObject:v5 forKeyedSubscript:@"controlDescription"];
  }
  else
  {
  }
LABEL_6:
  [*(id *)(a1 + 32) applyInflectionToDescriptions:v4];
  objc_super v11 = (void *)MEMORY[0x263F58190];
  v12 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v13 = [v11 futureWithResult:v12];

  return v13;
}

- (BOOL)containsActions
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  v3 = (void *)MEMORY[0x263F58190];
  id v4 = objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
  uint64_t v5 = [v3 futureWithResult:v4];

  return v5;
}

@end