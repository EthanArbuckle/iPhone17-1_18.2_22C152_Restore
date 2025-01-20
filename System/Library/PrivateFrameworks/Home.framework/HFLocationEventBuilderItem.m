@interface HFLocationEventBuilderItem
- (HFLocationEventBuilder)locationEventBuilder;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setLocationEventBuilder:(id)a3;
@end

@implementation HFLocationEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFLocationEventBuilderItem;
  v4 = [(HFEventBuilderItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  v5 = [v3 results];

  v6 = (void *)[v5 mutableCopy];
  v7 = [*(id *)(a1 + 32) locationEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v9 = @"HFImageIconIdentifierTriggerLocation";
  }
  else
  {
    v10 = [*(id *)(a1 + 32) locationEventBuilder];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      v12 = [*(id *)(a1 + 32) locationEventBuilder];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2;
      v20[3] = &unk_26408D648;
      id v21 = v12;
      id v13 = v12;
      __58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v20);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  v14 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v9];
  [v6 setObject:v14 forKeyedSubscript:@"icon"];

  v15 = (void *)[v6 copy];
  [v4 setResults:v15];

  v16 = (void *)MEMORY[0x263F58190];
  v17 = (void *)[v4 copy];
  v18 = [v16 futureWithResult:v17];

  return v18;
}

__CFString *__58__HFLocationEventBuilderItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) locationEventType];
  if (v1 <= 2) {
    v2 = *off_26409ABB8[v1];
  }
  return v2;
}

- (HFLocationEventBuilder)locationEventBuilder
{
  v2 = [(HFEventBuilderItem *)self eventBuilders];
  id v3 = [v2 anyObject];

  return (HFLocationEventBuilder *)v3;
}

- (void)setLocationEventBuilder:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(HFEventBuilderItem *)self setEventBuilders:v4];
}

@end