@interface HFTimeEventBuilderItem
- (HFEventTriggerBuilder)containingTriggerBuilder;
- (HFTimeEventBuilder)timeEventBuilder;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setContainingTriggerBuilder:(id)a3;
- (void)setTimeEventBuilder:(id)a3;
@end

@implementation HFTimeEventBuilderItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HFTimeEventBuilderItem;
  v4 = [(HFEventBuilderItem *)&v8 _subclass_updateWithOptions:a3];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__HFTimeEventBuilderItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_26408E470;
  v7[4] = self;
  v5 = [v4 flatMap:v7];

  return v5;
}

id __54__HFTimeEventBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[v3 mutableCopy];
  v5 = [v3 results];

  v6 = (void *)[v5 mutableCopy];
  v7 = [*(id *)(a1 + 32) timeEventBuilder];
  objc_super v8 = [*(id *)(a1 + 32) naturalLanguageOptions];
  v9 = [*(id *)(a1 + 32) containingTriggerBuilder];
  uint64_t v10 = [v9 recurrences];
  v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = MEMORY[0x263EFFA68];
  }
  v13 = [v7 naturalLanguageNameWithOptions:v8 recurrences:v12];
  [v6 setObject:v13 forKeyedSubscript:@"title"];

  v14 = [*(id *)(a1 + 32) timeEventBuilder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || ([*(id *)(a1 + 32) timeEventBuilder],
        v16 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v17 = objc_opt_isKindOfClass(),
        v16,
        (v17 & 1) != 0))
  {
    v18 = @"HFImageIconIdentifierTriggerTime";
    if (v18)
    {
      v19 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v18];
      [v6 setObject:v19 forKeyedSubscript:@"icon"];
    }
  }
  else
  {
    v18 = 0;
  }
  v20 = [[HFImageIconDescriptor alloc] initWithImageIdentifier:v18];
  [v6 setObject:v20 forKeyedSubscript:@"icon"];

  v21 = (void *)[v6 copy];
  [v4 setResults:v21];

  v22 = (void *)MEMORY[0x263F58190];
  v23 = (void *)[v4 copy];
  v24 = [v22 futureWithResult:v23];

  return v24;
}

- (HFTimeEventBuilder)timeEventBuilder
{
  v2 = [(HFEventBuilderItem *)self eventBuilders];
  id v3 = [v2 anyObject];

  return (HFTimeEventBuilder *)v3;
}

- (void)setTimeEventBuilder:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  [(HFEventBuilderItem *)self setEventBuilders:v4];
}

- (HFEventTriggerBuilder)containingTriggerBuilder
{
  return self->_containingTriggerBuilder;
}

- (void)setContainingTriggerBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end