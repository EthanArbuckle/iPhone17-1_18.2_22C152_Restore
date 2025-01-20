@interface HUPrimaryUserItemProvider
- (HFMediaProfileContainer)mediaProfileContainer;
- (HMHome)home;
- (HUPrimaryUserItemProvider)init;
- (HUPrimaryUserItemProvider)initWithHome:(id)a3 mediaProfileContainer:(id)a4;
- (NSMutableSet)userItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setUserItems:(id)a3;
@end

@implementation HUPrimaryUserItemProvider

- (HUPrimaryUserItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUPrimaryUserItemProvider.m", 23, @"%s is unavailable; use %@ instead",
    "-[HUPrimaryUserItemProvider init]",
    v5);

  return 0;
}

- (HUPrimaryUserItemProvider)initWithHome:(id)a3 mediaProfileContainer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUPrimaryUserItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_mediaProfileContainer, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    userItems = v10->_userItems;
    v10->_userItems = v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUPrimaryUserItemProvider *)self home];
  v6 = [(HUPrimaryUserItemProvider *)self mediaProfileContainer];
  id v7 = (void *)[v4 initWithHome:v5 mediaProfileContainer:v6];

  return v7;
}

- (id)reloadItems
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUPrimaryUserItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E638A780;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  id v4 = [(HUPrimaryUserItemProvider *)self home];
  v5 = objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");

  objc_initWeak(&location, self);
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__HUPrimaryUserItemProvider_reloadItems__block_invoke_2;
  v9[3] = &unk_1E6385B38;
  objc_copyWeak(&v10, &location);
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

HUPrimaryUserItem *__40__HUPrimaryUserItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [HUPrimaryUserItem alloc];
  id v8 = [*(id *)(a1 + 32) home];
  v9 = [*(id *)(a1 + 32) mediaProfileContainer];
  id v10 = [(HUPrimaryUserItem *)v7 initWithHome:v8 mediaProfileContainer:v9 user:v6];

  return v10;
}

id __40__HUPrimaryUserItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained userItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained userItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUPrimaryUserItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686B0];
  v8[0] = *MEMORY[0x1E4F68700];
  v8[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (NSMutableSet)userItems
{
  return self->_userItems;
}

- (void)setUserItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userItems, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end