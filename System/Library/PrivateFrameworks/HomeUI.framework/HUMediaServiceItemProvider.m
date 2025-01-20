@interface HUMediaServiceItemProvider
+ (id)itemComparator;
- (HMHome)home;
- (HUMediaServiceItemProvider)initWithHome:(id)a3 delegate:(id)a4;
- (HUMediaServiceItemProviderDelegate)delegate;
- (NSMutableSet)items;
- (id)_fetchMediaServicesFuture;
- (id)reloadItems;
- (void)_notifyMediaServicesUpdated;
- (void)mediaServicesDidUpdate:(id)a3;
- (void)registerForExternalUpdates;
- (void)setDelegate:(id)a3;
- (void)unregisterForExternalUpdates;
@end

@implementation HUMediaServiceItemProvider

+ (id)itemComparator
{
  return &__block_literal_global_258;
}

uint64_t __44__HUMediaServiceItemProvider_itemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 latestResults];
  uint64_t v7 = *MEMORY[0x1E4F68AB8];
  v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v9 = [v5 latestResults];
  v10 = [v9 objectForKeyedSubscript:v7];

  uint64_t v11 = objc_opt_class();
  id v12 = v4;
  if (!v12) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  v14 = v12;
  if (!v13)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v15 handleFailureInFunction:v16, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v11, objc_opt_class() file lineNumber description];

LABEL_7:
    v14 = 0;
  }

  uint64_t v17 = objc_opt_class();
  id v18 = v5;
  if (v18)
  {
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    v20 = v18;
    if (v19) {
      goto LABEL_15;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v21 handleFailureInFunction:v22, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v17, objc_opt_class() file lineNumber description];
  }
  v20 = 0;
LABEL_15:

  v23 = [v14 mediaService];
  int v24 = [v23 isServiceRemovable];

  if (v24)
  {
    v25 = [v20 mediaService];
    int v26 = [v25 isServiceRemovable];

    if (v26)
    {
      uint64_t v27 = 0;
      if (v8 && v10) {
        uint64_t v27 = [v8 compare:v10];
      }
    }
    else
    {
      uint64_t v27 = 1;
    }
  }
  else
  {
    uint64_t v27 = -1;
  }

  return v27;
}

- (HUMediaServiceItemProvider)initWithHome:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUMediaServiceItemProvider;
  v9 = [(HFItemProvider *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    uint64_t v11 = objc_opt_new();
    items = v10->_items;
    v10->_items = (NSMutableSet *)v11;
  }
  return v10;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HUMediaServiceItemProvider *)self _fetchMediaServicesFuture];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1E6391290;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_4;
  v11[3] = &unk_1E6391268;
  id v5 = (id *)(a1 + 40);
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v6 = [v4 reloadItemsWithObjects:v3 keyAdaptor:&__block_literal_global_4_3 itemAdaptor:&__block_literal_global_7_2 filter:0 itemMap:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_6;
  v9[3] = &unk_1E6385B38;
  objc_copyWeak(&v10, v5);
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);

  return v7;
}

uint64_t __41__HUMediaServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 mediaService];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

HUMediaServiceItem *__41__HUMediaServiceItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained items];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__HUMediaServiceItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1E6386108;
  id v6 = v3;
  id v12 = v6;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v11);
  id v7 = (HUMediaServiceItem *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = [HUMediaServiceItem alloc];
    v9 = [WeakRetained home];
    id v7 = [(HUMediaServiceItem *)v8 initWithMediaService:v6 home:v9];
  }

  return v7;
}

uint64_t __41__HUMediaServiceItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
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

  id v7 = [v6 mediaService];
  id v8 = [v7 bundleIdentifier];
  v9 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v10 = [v8 isEqualToString:v9];

  return v10;
}

id __41__HUMediaServiceItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained items];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained items];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (void)registerForExternalUpdates
{
  id v3 = [MEMORY[0x1E4F692B8] sharedManager];
  [v3 addMediaServiceManagerObserver:self];
}

- (void)unregisterForExternalUpdates
{
  id v3 = [MEMORY[0x1E4F692B8] sharedManager];
  [v3 removeMediaServiceManagerObserver:self];
}

- (void)mediaServicesDidUpdate:(id)a3
{
  if (a3) {
    [(HUMediaServiceItemProvider *)self _notifyMediaServicesUpdated];
  }
}

- (id)_fetchMediaServicesFuture
{
  id v3 = [MEMORY[0x1E4F692B8] sharedManager];
  id v4 = [(HUMediaServiceItemProvider *)self home];
  id v5 = [v3 mediaServicesForHome:v4];

  id v6 = (void *)MEMORY[0x1E4F7A0D8];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__HUMediaServiceItemProvider__fetchMediaServicesFuture__block_invoke;
  v16[3] = &unk_1E6385108;
  id v7 = v5;
  id v17 = v7;
  id v8 = [v6 futureWithBlock:v16];
  if (!v7
    || ([MEMORY[0x1E4F692B8] sharedManager],
        v9 = objc_claimAutoreleasedReturnValue(),
        [(HUMediaServiceItemProvider *)self home],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v9 isRefreshNeededForHome:v10],
        v10,
        v9,
        v11))
  {
    id v12 = [MEMORY[0x1E4F692B8] sharedManager];
    v13 = [(HUMediaServiceItemProvider *)self home];
    id v14 = (id)[v12 fetchMediaServicesForHome:v13];
  }

  return v8;
}

uint64_t __55__HUMediaServiceItemProvider__fetchMediaServicesFuture__block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWithResult:*(void *)(a1 + 32)];
}

- (void)_notifyMediaServicesUpdated
{
  id v3 = [(HUMediaServiceItemProvider *)self delegate];
  int v4 = [v3 conformsToProtocol:&unk_1F1A3A708];

  if (v4)
  {
    id v5 = [(HUMediaServiceItemProvider *)self delegate];
    [v5 mediaServiceItemProviderDidUpdateServices:self];
  }
}

- (NSMutableSet)items
{
  return self->_items;
}

- (HMHome)home
{
  return self->_home;
}

- (HUMediaServiceItemProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaServiceItemProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end