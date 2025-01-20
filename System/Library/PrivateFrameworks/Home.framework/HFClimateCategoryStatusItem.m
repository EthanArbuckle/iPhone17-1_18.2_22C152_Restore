@interface HFClimateCategoryStatusItem
+ (id)statusItemClasses;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
@end

@implementation HFClimateCategoryStatusItem

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup climateAccessoryTypeGroup];
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFClimateCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v12 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__HFClimateCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __59__HFClimateCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"hidden"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_7;
  }
  id v6 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameClimate", @"HFAccessoryTypeGroupNameClimate", 1);
  [v3 setObject:v6 forKeyedSubscript:@"title"];

  [v3 setObject:@"Home.Status.Category.Climate" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  [v3 setObject:@"fanblades.fill" forKeyedSubscript:@"iconNames"];
  v7 = [HFImageIconDescriptor alloc];
  v8 = [v3 objectForKeyedSubscript:@"iconNames"];
  v9 = [(HFImageIconDescriptor *)v7 initWithSystemImageNamed:v8];
  [v3 setObject:v9 forKeyedSubscript:@"icon"];

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  if ([v10 BOOLValue])
  {

LABEL_7:
    v30 = [MEMORY[0x263F58190] futureWithResult:v3];
    goto LABEL_8;
  }
  v11 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v12 = [v11 integerValue];

  if (!v12) {
    goto LABEL_7;
  }
  v34 = [v3 objectForKeyedSubscript:@"representedHomeKitObjects"];
  uint64_t v33 = [v34 count];
  v13 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v14 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v15 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v16 = [v13 latestResults];
  v17 = [v16 objectForKeyedSubscript:@"description"];

  v18 = [v14 latestResults];
  v19 = [v18 objectForKeyedSubscript:@"shortTitle"];

  v20 = [v15 latestResults];
  v21 = [v20 objectForKeyedSubscript:@"description"];

  if (v17)
  {
    v28 = v3;
    v29 = v17;
  }
  else if (v19)
  {
    v28 = v3;
    v29 = v19;
  }
  else
  {
    if (!v21)
    {
      if (v33) {
        HFLocalizedStringWithFormat(@"HFClimateCategoryStatusDescription_On", @"%lu", v22, v23, v24, v25, v26, v27, v33);
      }
      else {
      v32 = _HFLocalizedStringWithDefaultValue(@"HFClimateCategoryStatusDescription_AllOff", @"HFClimateCategoryStatusDescription_AllOff", 1);
      }
      [v3 setObject:v32 forKeyedSubscript:@"description"];

      goto LABEL_16;
    }
    v28 = v3;
    v29 = v21;
  }
  [v28 setObject:v29 forKeyedSubscript:@"description"];
LABEL_16:
  [*(id *)(a1 + 40) applyInflectionToDescriptions:v3];
  v30 = [MEMORY[0x263F58190] futureWithResult:v3];

LABEL_8:
  return v30;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_233 != -1) {
    dispatch_once(&_MergedGlobals_233, &__block_literal_global_3_7);
  }
  v2 = (void *)qword_26AB2EEB8;
  return v2;
}

void __48__HFClimateCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v2[6] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:6];
  v1 = (void *)qword_26AB2EEB8;
  qword_26AB2EEB8 = v0;
}

@end