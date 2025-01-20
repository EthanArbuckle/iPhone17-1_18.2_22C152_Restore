@interface HFScheduleRuleItemProvider
- (HFScheduleBuilder)scheduleBuilder;
- (HFScheduleRuleItemProvider)init;
- (HFScheduleRuleItemProvider)initWithHome:(id)a3;
- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3;
- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3 home:(id)a4;
- (HMHome)home;
- (NSMutableSet)items;
- (id)_scheduleRulesFromHome:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setScheduleBuilder:(id)a3;
@end

@implementation HFScheduleRuleItemProvider

- (NSMutableSet)items
{
  return self->_items;
}

- (id)invalidationReasons
{
  v6.receiver = self;
  v6.super_class = (Class)HFScheduleRuleItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"home"];
  [v3 addObject:@"user"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFScheduleRuleItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_scheduleBuilder, a3);
    uint64_t v11 = objc_opt_new();
    items = v10->_items;
    v10->_items = (NSMutableSet *)v11;
  }
  return v10;
}

- (HFScheduleRuleItemProvider)initWithHome:(id)a3
{
  return [(HFScheduleRuleItemProvider *)self initWithScheduleBuilder:0 home:a3];
}

- (id)reloadItems
{
  v3 = [(HFScheduleRuleItemProvider *)self home];
  if (v3)
  {
    v4 = [(HFScheduleRuleItemProvider *)self home];
    [(HFScheduleRuleItemProvider *)self _scheduleRulesFromHome:v4];
  }
  else
  {
    v4 = [(HFScheduleRuleItemProvider *)self scheduleBuilder];
    [v4 rules];
  v5 = };

  objc_super v6 = [v5 allObjects];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26409AD28;
  v11[4] = self;
  id v7 = [(HFItemProvider *)self reloadItemsWithObjects:v6 keyAdaptor:&__block_literal_global_208 itemAdaptor:&__block_literal_global_11_9 filter:0 itemMap:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_264090AC8;
  v10[4] = self;
  id v8 = [v7 flatMap:v10];

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (id)_scheduleRulesFromHome:(id)a3
{
  id v3 = a3;
  v4 = [v3 currentUser];
  v5 = [v3 homeAccessControlForUser:v4];

  objc_super v6 = [v5 restrictedGuestAccessSettings];
  id v7 = [v6 guestAccessSchedule];
  id v8 = +[HFScheduleBuilder scheduleBuilderFromHomeAccessSchedule:v7];
  v9 = [v8 rules];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFFA08] set];
  }
  v12 = v11;

  return v12;
}

id __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 items];
  objc_super v6 = [v4 removedItems];
  [v5 minusSet:v6];

  id v7 = [*(id *)(a1 + 32) items];
  id v8 = [v4 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

- (HFScheduleRuleItemProvider)initWithScheduleBuilder:(id)a3
{
  return [(HFScheduleRuleItemProvider *)self initWithScheduleBuilder:a3 home:0];
}

- (HFScheduleRuleItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithScheduleBuilder_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFScheduleRuleItemProvider.m", 44, @"%s is unavailable; use %@ instead",
    "-[HFScheduleRuleItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFScheduleRuleItemProvider *)self scheduleBuilder];
  objc_super v6 = [(HFScheduleRuleItemProvider *)self home];
  id v7 = (void *)[v4 initWithScheduleBuilder:v5 home:v6];

  return v7;
}

uint64_t __41__HFScheduleRuleItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

HFScheduleRuleItem *__41__HFScheduleRuleItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) items];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_4;
  v8[3] = &unk_26408EC60;
  id v5 = v3;
  id v9 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  objc_super v6 = (HFScheduleRuleItem *)objc_claimAutoreleasedReturnValue();

  if (!v6) {
    objc_super v6 = [[HFScheduleRuleItem alloc] initWithScheduleRule:v5];
  }

  return v6;
}

BOOL __41__HFScheduleRuleItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
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

  id v7 = [v6 rule];
  BOOL v8 = v7 == *(void **)(a1 + 32);

  return v8;
}

- (HFScheduleBuilder)scheduleBuilder
{
  return self->_scheduleBuilder;
}

- (void)setScheduleBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end