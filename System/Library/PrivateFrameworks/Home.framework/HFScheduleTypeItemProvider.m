@interface HFScheduleTypeItemProvider
- (HFScheduleBuilder)scheduleBuilder;
- (HFScheduleTypeItemProvider)init;
- (HFScheduleTypeItemProvider)initWithScheduleBuilder:(id)a3;
- (NSMutableSet)items;
- (id)reloadItems;
- (id)scheduleTypes;
- (unint64_t)selectedType;
- (void)setScheduleBuilder:(id)a3;
- (void)setSelectedType:(unint64_t)a3;
- (void)updateSelectedType:(unint64_t)a3;
@end

@implementation HFScheduleTypeItemProvider

- (HFScheduleTypeItemProvider)initWithScheduleBuilder:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFScheduleTypeItemProvider;
  v6 = [(HFItemProvider *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scheduleBuilder, a3);
    uint64_t v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;

    v10 = [(HFScheduleTypeItemProvider *)v7 scheduleBuilder];
    v7->_selectedType = [v10 estimatedScheduleType];
  }
  return v7;
}

- (HFScheduleTypeItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithUser_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFScheduleTypeItemProvider.m", 81, @"%s is unavailable; use %@ instead",
    "-[HFScheduleTypeItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFScheduleTypeItemProvider *)self scheduleTypes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_3;
  v9[3] = &unk_26409B568;
  objc_copyWeak(&v10, &location);
  v4 = [(HFItemProvider *)self reloadItemsWithObjects:v3 keyAdaptor:&__block_literal_global_218 itemAdaptor:&__block_literal_global_51_5 filter:0 itemMap:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_5;
  v7[3] = &unk_26408D198;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v5;
}

id __41__HFScheduleTypeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 type];
  return [v2 numberWithUnsignedInteger:v3];
}

HFScheduleTypeItem *__41__HFScheduleTypeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained items];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_4;
  v12[3] = &unk_26408EC60;
  id v6 = v3;
  id v13 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v12);
  v7 = (HFScheduleTypeItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = [HFScheduleTypeItem alloc];
    uint64_t v9 = [v6 unsignedIntegerValue];
    id v10 = [WeakRetained scheduleBuilder];
    v7 = [(HFScheduleTypeItem *)v8 initWithScheduleType:v9 scheduleBuilder:v10];
  }
  return v7;
}

BOOL __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 type];
    BOOL v8 = v7 == [*(id *)(a1 + 32) unsignedIntegerValue];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

id __41__HFScheduleTypeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained items];
  BOOL v8 = [v3 removedItems];
  [v7 minusSet:v8];

  uint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (void)updateSelectedType:(unint64_t)a3
{
  -[HFScheduleTypeItemProvider setSelectedType:](self, "setSelectedType:");
  id v5 = [(HFScheduleTypeItemProvider *)self items];
  id v6 = [v5 allObjects];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__HFScheduleTypeItemProvider_updateSelectedType___block_invoke;
  v7[3] = &__block_descriptor_40_e16_v16__0__HFItem_8l;
  void v7[4] = a3;
  objc_msgSend(v6, "na_each:", v7);
}

void __49__HFScheduleTypeItemProvider_updateSelectedType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  objc_msgSend(v5, "setSelected:", objc_msgSend(v5, "type") == *(void *)(a1 + 32));
}

- (id)scheduleTypes
{
  return (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26C0F7AE8, &unk_26C0F7B00, &unk_26C0F7B18, 0);
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void)setScheduleBuilder:(id)a3
{
}

- (unint64_t)selectedType
{
  return self->_selectedType;
}

- (void)setSelectedType:(unint64_t)a3
{
  self->_selectedType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end