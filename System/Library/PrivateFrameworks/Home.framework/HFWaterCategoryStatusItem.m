@interface HFWaterCategoryStatusItem
+ (id)statusItemClasses;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
@end

@implementation HFWaterCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFWaterCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v12 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HFWaterCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __57__HFWaterCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"hidden"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_7;
  }
  id v6 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameWater", @"HFAccessoryTypeGroupNameWater", 1);
  [v3 setObject:v6 forKeyedSubscript:@"title"];

  [v3 setObject:@"Home.Status.Category.Water" forKeyedSubscript:@"userAccessDescription"];
  [v3 setObject:@"drop.fill" forKeyedSubscript:@"iconNames"];
  v7 = [HFImageIconDescriptor alloc];
  v8 = [v3 objectForKeyedSubscript:@"iconNames"];
  v9 = [(HFImageIconDescriptor *)v7 initWithSystemImageNamed:v8];
  [v3 setObject:v9 forKeyedSubscript:@"icon"];

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  if ([v10 BOOLValue])
  {

LABEL_7:
    v27 = [MEMORY[0x263F58190] futureWithResult:v3];
    goto LABEL_8;
  }
  v11 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v12 = [v11 integerValue];

  if (!v12) {
    goto LABEL_7;
  }
  v13 = [v3 objectForKeyedSubscript:@"representedHomeKitObjects"];
  uint64_t v14 = [v13 count];
  v15 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v16 = [v15 latestResults];
  v17 = [v16 objectForKeyedSubscript:@"state"];
  int v18 = [v17 isEqual:&unk_26C0F6AC8];

  if (v18)
  {
    v25 = [v15 latestResults];
    v26 = [v25 objectForKeyedSubscript:@"title"];
    [v3 setObject:v26 forKeyedSubscript:@"description"];
  }
  else
  {
    if (v14) {
      HFLocalizedStringWithFormat(@"HFWaterCategoryStatusDescription_On", @"%lu", v19, v20, v21, v22, v23, v24, v14);
    }
    else {
    v25 = _HFLocalizedStringWithDefaultValue(@"HFWaterCategoryStatusDescription_AllOff", @"HFWaterCategoryStatusDescription_AllOff", 1);
    }
    [v3 setObject:v25 forKeyedSubscript:@"description"];
  }

  [*(id *)(a1 + 40) applyInflectionToDescriptions:v3];
  v27 = [MEMORY[0x263F58190] futureWithResult:v3];

LABEL_8:
  return v27;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup waterAccessoryTypeGroup];
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_253 != -1) {
    dispatch_once(&_MergedGlobals_253, &__block_literal_global_3_13);
  }
  v2 = (void *)qword_26AB2F0F8;
  return v2;
}

void __46__HFWaterCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  v1 = (void *)qword_26AB2F0F8;
  qword_26AB2F0F8 = v0;
}

@end