@interface HFClimateStatusItem
+ (id)sortKey;
+ (id)statusItemClasses;
- (BOOL)shouldEncapsulateItem:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFClimateStatusItem

+ (id)statusItemClasses
{
  if (_MergedGlobals_257 != -1) {
    dispatch_once(&_MergedGlobals_257, &__block_literal_global_3_15);
  }
  v2 = (void *)qword_26AB2F148;
  return v2;
}

void __40__HFClimateStatusItem_statusItemClasses__block_invoke_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)qword_26AB2F148;
  qword_26AB2F148 = v2;
}

+ (id)sortKey
{
  return _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyClimate", @"HFStatusSortKeyClimate", 1);
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HFClimateStatusItem;
  v3 = [(HFAbstractGroupedStatusItem *)&v6 _subclass_updateWithOptions:a3];
  uint64_t v4 = [v3 flatMap:&__block_literal_global_11_4];

  return v4;
}

id __51__HFClimateStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[a2 mutableCopy];
  v3 = [v2 objectForKeyedSubscript:@"hidden"];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = (void *)MEMORY[0x263F58190];
  if (v4)
  {
    objc_super v6 = [MEMORY[0x263F58190] futureWithResult:v2];
  }
  else
  {
    v10 = @"hidden";
    v11[0] = MEMORY[0x263EFFA88];
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = +[HFItemUpdateOutcome outcomeWithResults:v7];
    objc_super v6 = [v5 futureWithResult:v8];
  }
  return v6;
}

@end