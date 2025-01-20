@interface HFControlPanelItemProvider
+ (BOOL)prefersNonBlockingReloads;
- (HFCharacteristicValueSource)valueSource;
- (HFControlPanelItemProvider)init;
- (HFControlPanelItemProvider)initWithItem:(id)a3 valueSource:(id)a4;
- (NSCopying)item;
- (NSSet)controlPanelItems;
- (id)controlPanelItemComparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setControlPanelItems:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation HFControlPanelItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HFControlPanelItemProvider)initWithItem:(id)a3 valueSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFControlPanelItemProvider;
  v8 = [(HFItemProvider *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    item = v8->_item;
    v8->_item = (NSCopying *)v9;

    objc_storeStrong((id *)&v8->_valueSource, a4);
    uint64_t v11 = [MEMORY[0x263EFFA08] set];
    controlPanelItems = v8->_controlPanelItems;
    v8->_controlPanelItems = (NSSet *)v11;
  }
  return v8;
}

- (HFControlPanelItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItem_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFControlPanelItemProvider.m", 51, @"%s is unavailable; use %@ instead",
    "-[HFControlPanelItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFControlPanelItemProvider *)self item];
  id v6 = [(HFControlPanelItemProvider *)self valueSource];
  id v7 = (void *)[v4 initWithItem:v5 valueSource:v6];

  return v7;
}

- (id)reloadItems
{
  v3 = [(HFControlPanelItemProvider *)self valueSource];
  id v4 = +[HFStaticReadPolicy policyWithDecision:0];
  [v3 beginTransactionWithReason:@"disableControlPanelReads" readPolicy:v4 logger:0];

  v5 = objc_opt_new();
  id v6 = [(HFControlPanelItemProvider *)self item];
  id v7 = [v6 latestResults];
  objc_msgSend(v5, "na_safeSetObject:forKey:", v7, HFItemUpdateOptionPreviousResults);

  v8 = [(HFControlPanelItemProvider *)self item];
  uint64_t v9 = [v8 updateWithOptions:v5];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__HFControlPanelItemProvider_reloadItems__block_invoke;
  v13[3] = &unk_26408E470;
  v13[4] = self;
  v10 = [v9 flatMap:v13];

  uint64_t v11 = [(HFControlPanelItemProvider *)self valueSource];
  [v11 commitTransactionWithReason:@"disableControlPanelReads"];

  return v10;
}

id __41__HFControlPanelItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKeyedSubscript:@"childItems"];
  id v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_86);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFFA08] set];
  }
  id v7 = v6;

  v8 = +[HFControlPanelItem standardControlPanelItemsForControlItems:v7];
  uint64_t v9 = [*(id *)(a1 + 32) filter];

  if (v9)
  {
    v10 = [*(id *)(a1 + 32) filter];
    uint64_t v11 = objc_msgSend(v8, "na_filter:", v10);

    v8 = (void *)v11;
  }
  v12 = [*(id *)(a1 + 32) controlPanelItems];
  v13 = objc_msgSend(v12, "na_setByDiffingWithSet:", v8);

  objc_super v14 = [*(id *)(a1 + 32) controlPanelItems];
  v15 = +[HFSetDiff diffFromSet:v14 toSet:v13];

  v16 = [HFItemProviderReloadResults alloc];
  v17 = [v15 additions];
  v18 = [v15 deletions];
  v19 = [v15 updates];
  v20 = [(HFItemProviderReloadResults *)v16 initWithAddedItems:v17 removedItems:v18 existingItems:v19];

  [*(id *)(a1 + 32) setControlPanelItems:v13];
  v21 = [MEMORY[0x263F58190] futureWithResult:v20];

  return v21;
}

uint64_t __41__HFControlPanelItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFControlPanelItemProvider;
  id v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"service";
  v7[1] = @"serviceGroup";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (id)controlPanelItemComparator
{
  return &__block_literal_global_24_3;
}

uint64_t __56__HFControlPanelItemProvider_controlPanelItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 sortPriority];
  if (v6 != [v5 sortPriority])
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "sortPriority"));
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "sortPriority"));
LABEL_9:
    uint64_t v12 = [v8 compare:v10];
    goto LABEL_10;
  }
  id v7 = [v4 latestResults];
  v8 = [v7 objectForKeyedSubscript:@"title"];

  uint64_t v9 = [v5 latestResults];
  v10 = [v9 objectForKeyedSubscript:@"title"];

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

- (NSCopying)item
{
  return self->_item;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSSet)controlPanelItems
{
  return self->_controlPanelItems;
}

- (void)setControlPanelItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPanelItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end