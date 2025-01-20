@interface HFUserItemProvider
- (BOOL)includeCurrentUser;
- (BOOL)includeGuestUsers;
- (BOOL)includeOtherUsers;
- (HFUserItemProvider)init;
- (HFUserItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)userItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)nameStyle;
- (void)setFilter:(id)a3;
- (void)setIncludeCurrentUser:(BOOL)a3;
- (void)setIncludeGuestUsers:(BOOL)a3;
- (void)setIncludeOtherUsers:(BOOL)a3;
- (void)setNameStyle:(unint64_t)a3;
- (void)setUserItems:(id)a3;
@end

@implementation HFUserItemProvider

- (HFUserItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUserItemProvider.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFUserItemProvider init]",
    v5);

  return 0;
}

- (HFUserItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    userItems = v7->_userItems;
    v7->_userItems = v8;

    v7->_includeCurrentUser = 0;
    v7->_includeOtherUsers = 1;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFUserItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)reloadItems
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__HFUserItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F990;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  if ([(HFUserItemProvider *)self includeOtherUsers])
  {
    id v4 = [(HFUserItemProvider *)self home];
    id v5 = [v4 users];
    if (v5)
    {
      v6 = [(HFUserItemProvider *)self home];
      v7 = [v6 users];
    }
    else
    {
      v7 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }
  if ([(HFUserItemProvider *)self includeCurrentUser])
  {
    v8 = [(HFUserItemProvider *)self home];
    v9 = [v8 currentUser];
    uint64_t v10 = [v7 arrayByAddingObject:v9];

    v7 = (void *)v10;
  }
  if (![(HFUserItemProvider *)self includeGuestUsers])
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __33__HFUserItemProvider_reloadItems__block_invoke_2;
    v19[3] = &unk_26408F748;
    v19[4] = self;
    uint64_t v11 = objc_msgSend(v7, "na_filter:", v19);

    v7 = (void *)v11;
  }
  objc_initWeak(&location, self);
  v12 = [(HFUserItemProvider *)self filter];
  v13 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v7 filter:v12 itemMap:v3];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __33__HFUserItemProvider_reloadItems__block_invoke_3;
  v16[3] = &unk_26408D198;
  objc_copyWeak(&v17, &location);
  v14 = [v13 flatMap:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v14;
}

HFUserItem *__33__HFUserItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
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

  v7 = [HFUserItem alloc];
  v8 = [*(id *)(a1 + 32) home];
  v9 = -[HFUserItem initWithHome:user:nameStyle:](v7, "initWithHome:user:nameStyle:", v8, v6, [*(id *)(a1 + 32) nameStyle]);

  return v9;
}

uint64_t __33__HFUserItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 home];
  int v5 = objc_msgSend(v4, "hf_userIsRestrictedGuest:", v3);

  return v5 ^ 1u;
}

id __33__HFUserItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v5 = [WeakRetained userItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained userItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFUserItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"user"];

  return v3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (BOOL)includeCurrentUser
{
  return self->_includeCurrentUser;
}

- (void)setIncludeCurrentUser:(BOOL)a3
{
  self->_includeCurrentUser = a3;
}

- (BOOL)includeOtherUsers
{
  return self->_includeOtherUsers;
}

- (void)setIncludeOtherUsers:(BOOL)a3
{
  self->_includeOtherUsers = a3;
}

- (BOOL)includeGuestUsers
{
  return self->_includeGuestUsers;
}

- (void)setIncludeGuestUsers:(BOOL)a3
{
  self->_includeGuestUsers = a3;
}

- (unint64_t)nameStyle
{
  return self->_nameStyle;
}

- (void)setNameStyle:(unint64_t)a3
{
  self->_nameStyle = a3;
}

- (HMHome)home
{
  return self->_home;
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
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end