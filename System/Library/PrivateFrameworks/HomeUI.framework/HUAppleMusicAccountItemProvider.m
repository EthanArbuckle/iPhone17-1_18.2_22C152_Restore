@interface HUAppleMusicAccountItemProvider
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUAppleMusicAccountItemProvider)initWithMediaProfileContainer:(id)a3;
- (NSMutableSet)items;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation HUAppleMusicAccountItemProvider

- (HUAppleMusicAccountItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicAccountItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaProfileContainer, a3);
    uint64_t v8 = objc_opt_new();
    items = v7->_items;
    v7->_items = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x1E4F692A0] sharedDispatcher];
  v4 = [v3 appleMusicMagicAuthCapableAccounts];

  id v5 = [(HUAppleMusicAccountItemProvider *)self filter];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1E638D878;
  objc_copyWeak(&v12, &location);
  v6 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_162 itemAdaptor:&__block_literal_global_4_1 filter:v5 itemMap:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_5;
  v9[3] = &unk_1E6385B38;
  objc_copyWeak(&v10, &location);
  v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

uint64_t __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 account];
  v3 = [v2 identifier];

  return v3;
}

HUAppleMusicAccountItem *__46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained items];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E638D850;
  id v6 = v3;
  id v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  v7 = (HUAppleMusicAccountItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    uint64_t v8 = [HUAppleMusicAccountItem alloc];
    v9 = [WeakRetained mediaProfileContainer];
    v7 = [(HUAppleMusicAccountItem *)v8 initWithMediaProfileContainer:v9 account:v6];
  }

  return v7;
}

uint64_t __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 account];
  v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

id __46__HUAppleMusicAccountItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained items];
  uint64_t v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained items];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUAppleMusicAccountItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (NSMutableSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end