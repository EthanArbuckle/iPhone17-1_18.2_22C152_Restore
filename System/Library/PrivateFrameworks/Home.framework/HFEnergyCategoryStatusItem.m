@interface HFEnergyCategoryStatusItem
+ (id)statusItemClasses;
- (BOOL)hidesWithNoAccessories;
- (NSString)energyAdviceDisplayDescription;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
- (void)setEnergyAdviceDisplayDescription:(id)a3;
@end

@implementation HFEnergyCategoryStatusItem

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup energyAccessoryTypeGroup];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFEnergyCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v11 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__HFEnergyCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

- (BOOL)hidesWithNoAccessories
{
  return 0;
}

id __58__HFEnergyCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"currentHomeDependency"];
  objc_opt_class();
  id v4 = [v3 results];
  v5 = [v4 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  v8 = (void *)[v7 mutableCopy];
  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF9C0] set];
  }
  id v10 = v9;

  objc_super v11 = [*(id *)(a1 + 32) home];
  [v10 addObject:v11];

  v12 = (void *)[v10 copy];
  [v3 setObject:v12 forKeyedSubscript:@"dependentHomeKitObjects"];

  v13 = [v3 objectForKeyedSubscript:@"hidden"];
  char v14 = [v13 BOOLValue];

  if ((v14 & 1) == 0)
  {
    v15 = [*(id *)(a1 + 32) home];
    char v16 = objc_msgSend(v15, "hf_isHomeEnergyVisible");

    if ((v16 & 1) != 0
      && ([*(id *)(a1 + 32) home],
          v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = objc_msgSend(v17, "hf_isHomeEnergyHomeEmpty"),
          v17,
          !v18))
    {
      v19 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameEnergy", @"HFAccessoryTypeGroupNameEnergy", 1);
      [v3 setObject:v19 forKeyedSubscript:@"title"];

      [v3 setObject:@"Home.Status.Category.Energy" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
      [v3 setObject:@"bolt.fill" forKeyedSubscript:@"iconNames"];
      v20 = [HFImageIconDescriptor alloc];
      v21 = [v3 objectForKeyedSubscript:@"iconNames"];
      v22 = [(HFImageIconDescriptor *)v20 initWithSystemImageNamed:v21];
      [v3 setObject:v22 forKeyedSubscript:@"icon"];

      v23 = [*(id *)(a1 + 32) energyAdviceDisplayDescription];

      if (v23)
      {
        v24 = [*(id *)(a1 + 32) energyAdviceDisplayDescription];
        [v3 setObject:v24 forKeyedSubscript:@"description"];
      }
      [*(id *)(a1 + 32) applyInflectionToDescriptions:v3];
      v25 = [*(id *)(a1 + 40) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
      [v25 BOOLValue];
    }
    else
    {
      [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
  }
  v26 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v26;
}

- (NSString)energyAdviceDisplayDescription
{
  return self->_energyAdviceDisplayDescription;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_290 != -1) {
    dispatch_once(&_MergedGlobals_290, &__block_literal_global_3_24);
  }
  v2 = (void *)qword_26AB2F958;
  return v2;
}

- (void)setEnergyAdviceDisplayDescription:(id)a3
{
}

void __47__HFEnergyCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v0 = (void *)qword_26AB2F958;
  qword_26AB2F958 = MEMORY[0x263EFFA68];
}

- (void).cxx_destruct
{
}

@end