@interface HFLightCategoryStatusItem
+ (id)statusItemClasses;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
@end

@implementation HFLightCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFLightCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v12 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HFLightCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __57__HFLightCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"hidden"];
  int v5 = [v4 BOOLValue];

  if (!v5)
  {
    id v6 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameLights", @"HFAccessoryTypeGroupNameLights", 1);
    [v3 setObject:v6 forKeyedSubscript:@"title"];

    [v3 setObject:@"Home.Status.Category.Lights" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
    [v3 setObject:@"lightbulb.fill" forKeyedSubscript:@"iconNames"];
    v7 = [HFImageIconDescriptor alloc];
    v8 = [v3 objectForKeyedSubscript:@"iconNames"];
    v9 = [(HFImageIconDescriptor *)v7 initWithSystemImageNamed:v8];
    [v3 setObject:v9 forKeyedSubscript:@"icon"];

    id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
    if ([v10 BOOLValue])
    {
    }
    else
    {
      v11 = [v3 objectForKeyedSubscript:@"state"];
      uint64_t v12 = [v11 integerValue];

      if (v12)
      {
        v13 = [v3 objectForKeyedSubscript:@"representedHomeKitObjects"];
        uint64_t v14 = [v13 count];
        if (v14) {
          HFLocalizedStringWithFormat(@"HFLightCategoryStatusDescription_On", @"%lu", v15, v16, v17, v18, v19, v20, v14);
        }
        else {
        v23 = _HFLocalizedStringWithDefaultValue(@"HFLightCategoryStatusDescription_AllOff", @"HFLightCategoryStatusDescription_AllOff", 1);
        }
        [v3 setObject:v23 forKeyedSubscript:@"description"];

        [*(id *)(a1 + 40) applyInflectionToDescriptions:v3];
        v21 = [MEMORY[0x263F58190] futureWithResult:v3];

        goto LABEL_8;
      }
    }
  }
  v21 = [MEMORY[0x263F58190] futureWithResult:v3];
LABEL_8:

  return v21;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup lightAccessoryTypeGroup];
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_318 != -1) {
    dispatch_once(&_MergedGlobals_318, &__block_literal_global_3_33);
  }
  v2 = (void *)qword_26AB2FDA0;
  return v2;
}

void __46__HFLightCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];
  v1 = (void *)qword_26AB2FDA0;
  qword_26AB2FDA0 = v0;
}

@end