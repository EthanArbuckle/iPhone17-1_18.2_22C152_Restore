@interface HFMediaCategoryStatusItem
+ (id)statusItemClasses;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroup;
@end

@implementation HFMediaCategoryStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMediaCategoryStatusItem;
  v5 = [(HFAccessoryCategoryStatusItem *)&v12 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HFMediaCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  id v10 = v4;
  v11 = self;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

+ (id)statusItemClasses
{
  if (_MergedGlobals_244 != -1) {
    dispatch_once(&_MergedGlobals_244, &__block_literal_global_3_8);
  }
  v2 = (void *)qword_26AB2F008;
  return v2;
}

- (id)accessoryTypeGroup
{
  return +[HFAccessoryTypeGroup mediaAccessoryTypeGroup];
}

void __46__HFMediaCategoryStatusItem_statusItemClasses__block_invoke_2()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  v1 = (void *)qword_26AB2F008;
  qword_26AB2F008 = v0;
}

id __57__HFMediaCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [v3 objectForKeyedSubscript:@"hidden"];
  int v5 = [v4 BOOLValue];

  if (v5) {
    goto LABEL_8;
  }
  id v6 = _HFLocalizedStringWithDefaultValue(@"HFAccessoryTypeGroupNameSpeakersAndTVs", @"HFAccessoryTypeGroupNameSpeakersAndTVs", 1);
  [v3 setObject:v6 forKeyedSubscript:@"title"];

  [v3 setObject:@"Home.Status.Category.SpeakersAndTVs" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  [v3 setObject:@"tv.and.hifispeaker.fill.fill" forKeyedSubscript:@"iconNames"];
  v7 = [HFImageIconDescriptor alloc];
  v8 = [v3 objectForKeyedSubscript:@"iconNames"];
  v9 = [(HFImageIconDescriptor *)v7 initWithSystemImageNamed:v8];
  [v3 setObject:v9 forKeyedSubscript:@"icon"];

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  if ([v10 BOOLValue])
  {

LABEL_8:
    v25 = [MEMORY[0x263F58190] futureWithResult:v3];
    goto LABEL_9;
  }
  v11 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v12 = [v11 integerValue];

  if (!v12) {
    goto LABEL_8;
  }
  v13 = [v3 objectForKeyedSubscript:@"representedHomeKitObjects"];
  uint64_t v14 = [v13 count];
  v15 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v16 = [*(id *)(a1 + 40) _statusItemOfClass:objc_opt_class()];
  v17 = [v15 latestResults];
  v18 = [v17 objectForKeyedSubscript:@"state"];
  if ([v18 isEqual:&unk_26C0F6810])
  {

    if (!v14) {
      goto LABEL_19;
    }
  }
  else
  {
    v38 = v15;
    v27 = [v16 latestResults];
    v28 = [v27 objectForKeyedSubscript:@"state"];
    if ([v28 isEqual:&unk_26C0F6810])
    {
      BOOL v29 = 0;
    }
    else
    {
      [v38 latestResults];
      v30 = v36 = v16;
      [v30 objectForKeyedSubscript:@"dependentHomeKitObjects"];
      v31 = v37 = v13;
      BOOL v29 = [v31 count] != 0;

      v13 = v37;
      v16 = v36;
    }

    if (!v14)
    {
      v15 = v38;
      if (!v29)
      {
        v33 = @"HFMediaCategoryStatusDescription_AllOff";
        goto LABEL_23;
      }
LABEL_19:
      v33 = @"HFMediaCategoryStatusDescription_NonePlaying";
LABEL_23:
      uint64_t v34 = _HFLocalizedStringWithDefaultValue(v33, v33, 1);
      goto LABEL_24;
    }
    v15 = v38;
    if (!v29)
    {
      v32 = @"HFMediaCategoryStatusDescription_On";
      goto LABEL_21;
    }
  }
  v32 = @"HFMediaCategoryStatusDescription_Playing";
LABEL_21:
  uint64_t v34 = HFLocalizedStringWithFormat(v32, @"%lu", v19, v20, v21, v22, v23, v24, v14);
LABEL_24:
  v35 = (void *)v34;
  [v3 setObject:v34 forKeyedSubscript:@"description"];

  [*(id *)(a1 + 40) applyInflectionToDescriptions:v3];
  v25 = [MEMORY[0x263F58190] futureWithResult:v3];

LABEL_9:
  return v25;
}

@end