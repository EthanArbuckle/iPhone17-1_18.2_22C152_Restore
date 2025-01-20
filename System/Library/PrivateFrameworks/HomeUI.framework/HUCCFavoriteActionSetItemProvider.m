@interface HUCCFavoriteActionSetItemProvider
- (HMHome)home;
- (HUCCFavoriteActionSetItemProvider)init;
- (HUCCFavoriteActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4;
- (NSMutableSet)actionSetItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)actionSetItemStyle;
- (unint64_t)maximumNumberOfItems;
- (void)setActionSetItems:(id)a3;
- (void)setMaximumNumberOfItems:(unint64_t)a3;
@end

@implementation HUCCFavoriteActionSetItemProvider

id __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained actionSetItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained actionSetItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (NSMutableSet)actionSetItems
{
  return self->_actionSetItems;
}

- (void)setMaximumNumberOfItems:(unint64_t)a3
{
  self->_maximumNumberOfItems = a3;
}

- (id)reloadItems
{
  id v3 = (void *)MEMORY[0x1E4F69218];
  v4 = [(HUCCFavoriteActionSetItemProvider *)self home];
  v5 = objc_msgSend(v3, "favoriteActionSetsForHome:withLimit:", v4, -[HUCCFavoriteActionSetItemProvider maximumNumberOfItems](self, "maximumNumberOfItems"));

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6385A98;
  objc_copyWeak(&v13, &location);
  v6 = _Block_copy(aBlock);
  v7 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_1E6385B38;
  objc_copyWeak(&v11, &location);
  v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

id __48__HUCCFavoriteActionSetItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = objc_alloc(MEMORY[0x1E4F68EB8]);
  uint64_t v6 = [WeakRetained actionSetItemStyle];
  v7 = [WeakRetained home];
  v8 = objc_msgSend(v7, "hf_characteristicValueManager");
  v9 = (void *)[v5 initWithActionSet:v3 actionSetItemStyle:v6 valueSource:v8];

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (unint64_t)maximumNumberOfItems
{
  return self->_maximumNumberOfItems;
}

- (unint64_t)actionSetItemStyle
{
  return self->_actionSetItemStyle;
}

- (HUCCFavoriteActionSetItemProvider)initWithHome:(id)a3 actionSetItemStyle:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUCCFavoriteActionSetItemProvider;
  v8 = [(HFItemProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    actionSetItems = v9->_actionSetItems;
    v9->_actionSetItems = (NSMutableSet *)v10;

    v9->_maximumNumberOfItems = -1;
    v9->_actionSetItemStyle = a4;
  }

  return v9;
}

- (HUCCFavoriteActionSetItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_actionSetItemStyle_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCCFavoriteActionSetItemProvider.m", 24, @"%s is unavailable; use %@ instead",
    "-[HUCCFavoriteActionSetItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUCCFavoriteActionSetItemProvider *)self home];
  uint64_t v6 = objc_msgSend(v4, "initWithHome:actionSetItemStyle:", v5, -[HUCCFavoriteActionSetItemProvider actionSetItemStyle](self, "actionSetItemStyle"));

  return v6;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUCCFavoriteActionSetItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686C0];
  v8[0] = *MEMORY[0x1E4F686B8];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (void)setActionSetItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetItems, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end