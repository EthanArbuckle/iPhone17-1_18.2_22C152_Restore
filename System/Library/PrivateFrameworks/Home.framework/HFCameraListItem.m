@interface HFCameraListItem
- (BOOL)onlyShowsFavorites;
- (HFCameraListItem)init;
- (HFCameraListItem)initWithHome:(id)a3 room:(id)a4;
- (HMHome)home;
- (HMRoom)room;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setOnlyShowsFavorites:(BOOL)a3;
@end

@implementation HFCameraListItem

- (HFCameraListItem)initWithHome:(id)a3 room:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFCameraListItem;
  v9 = [(HFCameraListItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
  }

  return v10;
}

- (HFCameraListItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_room_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCameraListItem.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFCameraListItem init]",
    v5);

  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  v5 = [HFCameraItemProvider alloc];
  v6 = [(HFCameraListItem *)self home];
  id v7 = [(HFCameraItemProvider *)v5 initWithHome:v6];

  id v8 = [(HFCameraListItem *)self room];
  [(HFCameraItemProvider *)v7 setRoom:v8];

  [(HFCameraItemProvider *)v7 setOnlyShowsFavorites:[(HFCameraListItem *)self onlyShowsFavorites]];
  v9 = [(HFCameraItemProvider *)v7 reloadItems];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __48__HFCameraListItem__subclass_updateWithOptions___block_invoke;
  v19[3] = &unk_26408CDF0;
  id v10 = v4;
  id v20 = v10;
  id v11 = (id)[v9 addFailureBlock:v19];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_264093D70;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  id v13 = (id)[v9 addSuccessBlock:v17];
  v14 = v18;
  id v15 = v12;

  return v15;
}

uint64_t __48__HFCameraListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9C0] set];
  v5 = [v19 addedItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = _HFLocalizedStringWithDefaultValue(@"HFCameraListTitle", @"HFCameraListTitle", 1);
    [v3 setObject:v7 forKeyedSubscript:@"title"];

    id v8 = [v19 addedItems];
    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_80);

    if ([v9 count])
    {
      id v10 = [v9 allObjects];
      [v4 addObjectsFromArray:v10];
    }
  }
  else
  {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  id v11 = [*(id *)(a1 + 32) home];
  int v12 = objc_msgSend(v11, "hf_shouldBlockCurrentUserFromHome");

  if (v12) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  id v13 = [*(id *)(a1 + 32) home];
  [v4 addObject:v13];

  v14 = [*(id *)(a1 + 32) room];

  if (v14)
  {
    id v15 = [*(id *)(a1 + 32) room];
    [v4 addObject:v15];
  }
  [v3 setObject:v4 forKeyedSubscript:@"dependentHomeKitObjects"];
  v16 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v3 setObject:v16 forKeyedSubscript:@"dependentHomeKitClasses"];

  v17 = *(void **)(a1 + 40);
  id v18 = +[HFItemUpdateOutcome outcomeWithResults:v3];
  [v17 finishWithResult:v18];
}

id __48__HFCameraListItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 profile];
  id v7 = [v6 accessory];

  return v7;
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