@interface HFActionSetListItem
- (BOOL)onlyShowsFavorites;
- (HFActionSetListItem)init;
- (HFActionSetListItem)initWithHome:(id)a3 room:(id)a4;
- (HMHome)home;
- (HMRoom)room;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setOnlyShowsFavorites:(BOOL)a3;
@end

@implementation HFActionSetListItem

- (HFActionSetListItem)initWithHome:(id)a3 room:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFActionSetListItem;
  v9 = [(HFActionSetListItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
  }

  return v10;
}

- (HFActionSetListItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFActionSetListItem.m" lineNumber:36 description:@"Use -initWithHome:room:"];

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  v5 = [HFActionSetItemProvider alloc];
  v6 = [(HFActionSetListItem *)self home];
  id v7 = [(HFActionSetItemProvider *)v5 initWithHome:v6 actionSetItemStyle:0];

  id v8 = [(HFActionSetListItem *)self room];
  [(HFActionSetItemProvider *)v7 setRoom:v8];

  [(HFActionSetItemProvider *)v7 setOnlyShowsFavorites:[(HFActionSetListItem *)self onlyShowsFavorites]];
  v9 = [(HFActionSetItemProvider *)v7 reloadItems];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __51__HFActionSetListItem__subclass_updateWithOptions___block_invoke;
  v19[3] = &unk_26408CDF0;
  id v10 = v4;
  id v20 = v10;
  id v11 = (id)[v9 addFailureBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __51__HFActionSetListItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_264093D70;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  id v13 = (id)[v9 addSuccessBlock:v17];
  v14 = v18;
  id v15 = v12;

  return v15;
}

uint64_t __51__HFActionSetListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __51__HFActionSetListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a2;
  id v19 = [v3 dictionary];
  v5 = [v4 addedItems];

  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v7 = _HFLocalizedStringWithDefaultValue(@"HFActionSetListTitle", @"HFActionSetListTitle", 1);
    [v19 setObject:v7 forKeyedSubscript:@"title"];
  }
  else
  {
    [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  id v8 = [*(id *)(a1 + 32) home];
  int v9 = objc_msgSend(v8, "hf_shouldBlockCurrentUserFromHome");

  if (v9) {
    [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  id v10 = [MEMORY[0x263EFF9C0] set];
  id v11 = [*(id *)(a1 + 32) home];
  [v10 addObject:v11];

  id v12 = [*(id *)(a1 + 32) room];

  if (v12)
  {
    id v13 = [*(id *)(a1 + 32) room];
    v14 = [v13 accessories];
    [v10 addObjectsFromArray:v14];

    id v15 = [*(id *)(a1 + 32) room];
    [v10 addObject:v15];
  }
  [v19 setObject:v10 forKeyedSubscript:@"dependentHomeKitObjects"];
  v16 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v19 setObject:v16 forKeyedSubscript:@"dependentHomeKitClasses"];

  v17 = *(void **)(a1 + 40);
  id v18 = +[HFItemUpdateOutcome outcomeWithResults:v19];
  [v17 finishWithResult:v18];
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end