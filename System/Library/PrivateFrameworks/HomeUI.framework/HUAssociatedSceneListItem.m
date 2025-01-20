@interface HUAssociatedSceneListItem
- (HFServiceLikeItem)serviceLikeItem;
- (HMHome)home;
- (HUAssociatedSceneListItem)initWithHome:(id)a3 serviceLikeItem:(id)a4 context:(unint64_t)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)context;
@end

@implementation HUAssociatedSceneListItem

- (HUAssociatedSceneListItem)initWithHome:(id)a3 serviceLikeItem:(id)a4 context:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUAssociatedSceneListItem;
  v11 = [(HUAssociatedSceneListItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_home, a3);
    objc_storeStrong((id *)&v12->_serviceLikeItem, a4);
    v12->_context = a5;
  }

  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6385648;
  v10[4] = self;
  v5 = objc_msgSend(&unk_1F19B5678, "na_map:", v10);
  v6 = [v4 combineAllFutures:v5];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke_2;
  v9[3] = &unk_1E6385620;
  v9[4] = self;
  v7 = [v6 flatMap:v9];

  return v7;
}

id __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  v4 = [*(id *)(a1 + 32) serviceLikeItem];
  v5 = [*(id *)(a1 + 32) home];
  v6 = +[HUAccessorySceneListContentItemManager computeNumberOfItemsToDisplayForContentSource:v3 serviceLikeItem:v4 home:v5];

  return v6;
}

id __57__HUAssociatedSceneListItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 unsignedIntegerValue];

  v6 = [v3 objectAtIndexedSubscript:1];

  uint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [*(id *)(a1 + 32) context];
  id v9 = objc_alloc_init(MEMORY[0x1E4F692F0]);
  id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  if (v5) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  char v13 = v11 && v7 == 0;
  objc_super v14 = [*(id *)(a1 + 32) home];
  char v15 = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

  v16 = (__CFString *)MEMORY[0x1E4F1CC38];
  v17 = (void *)MEMORY[0x1E4F68B10];
  if ((v15 & 1) == 0 && (v13 & 1) == 0)
  {
    if (v8) {
      BOOL v18 = v5 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18) {
      v19 = @"HUAssociatedSceneItemTitleSuggestedScenes";
    }
    else {
      v19 = @"HUAssociatedSceneItemTitleIncludedScenes";
    }
    if (v18) {
      uint64_t v20 = v7;
    }
    else {
      uint64_t v20 = v5;
    }
    v21 = _HULocalizedStringWithDefaultValue(v19, v19, 1);
    [v9 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    v22 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%lu", v20);
    [v9 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F68980]];

    v16 = @"AccessoryDetails.SuggestedScenes";
    v17 = (void *)MEMORY[0x1E4F68928];
  }
  [v9 setObject:v16 forKeyedSubscript:*v17];
  v23 = [MEMORY[0x1E4F7A0D8] futureWithResult:v9];

  return v23;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
}

@end