@interface HFUserPhotosLibraryItemProvider
- (HFUserPhotosLibraryItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSMutableSet)userPhotosLibraryItems;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setHome:(id)a3;
- (void)setUserPhotosLibraryItems:(id)a3;
@end

@implementation HFUserPhotosLibraryItemProvider

- (HFUserPhotosLibraryItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFUserPhotosLibraryItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    userPhotosLibraryItems = v7->_userPhotosLibraryItems;
    v7->_userPhotosLibraryItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_264097C60;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = [(HFUserPhotosLibraryItemProvider *)self home];
  id v5 = objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");
  v6 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:v3];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_2;
  v10[3] = &unk_264090AC8;
  v10[4] = self;
  v7 = [v6 flatMap:v10];
  uint64_t v8 = [v7 recover:&__block_literal_global_152];

  return v8;
}

HFUserPhotosLibraryItem *__46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
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
    v7 = [HFUserPhotosLibraryItem alloc];
    uint64_t v8 = [*(id *)(a1 + 32) home];
    v9 = [(HFUserPhotosLibraryItem *)v7 initWithUser:v6 inHome:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 userPhotosLibraryItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  v7 = [*(id *)(a1 + 32) userPhotosLibraryItems];
  uint64_t v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

id __46__HFUserPhotosLibraryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = HFLogForCategory(0x2AuLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_error_impl(&dword_20B986000, v3, OS_LOG_TYPE_ERROR, "Person fetch failed with error %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [MEMORY[0x263F58190] futureWithNoResult];

  return v4;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFUserPhotosLibraryItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"user"];

  return v3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSMutableSet)userPhotosLibraryItems
{
  return self->_userPhotosLibraryItems;
}

- (void)setUserPhotosLibraryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPhotosLibraryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end