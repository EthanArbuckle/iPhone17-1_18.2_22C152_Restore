@interface HUBannerItemModule
+ (Class)_statusBannerItemClassForStatusItemClass:(Class)a3;
- (BOOL)forceShowBanners;
- (HFTransformItemProvider)statusBannerItemProvider;
- (HUBannerItemModule)initWithContext:(id)a3 itemUpdater:(id)a4;
- (HUBannerItemProvider)bannerItemProvider;
- (HUDashboardContext)context;
- (HUDropInBannerItemProvider)dropInBannerItemProvider;
- (NSSet)hiddenBanners;
- (id)_itemsToHideInSet:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)didUpdateDropInAvailability:(id)a3;
- (void)setBannerItemProvider:(id)a3;
- (void)setDropInBannerItemProvider:(id)a3;
- (void)setForceShowBanners:(BOOL)a3;
- (void)setHiddenBanners:(id)a3;
- (void)setStatusBannerItemProvider:(id)a3;
@end

@implementation HUBannerItemModule

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F69758] shouldHideBanners])
  {
    v5 = [(HFItemModule *)self allItems];
    v6 = (void *)[v5 mutableCopy];

    [v6 intersectSet:v4];
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"bannersSection"];
  v25 = self;
  v5 = [(HFItemModule *)self allItems];
  v28 = v4;
  v6 = objc_msgSend(v5, "na_setByIntersectingWithSet:", v4);

  v26 = v6;
  v7 = [v6 allObjects];
  v8 = +[HUBannerItemProvider bannerItemComparator];
  v9 = [v7 sortedArrayUsingComparator:v8];

  v10 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v17 = [v16 latestResults];
        v18 = [v17 objectForKeyedSubscript:@"bannerItemCategory"];
        uint64_t v19 = [v18 unsignedIntegerValue];

        if (v19)
        {
          if ((v13 & 1) == 0) {
            [v10 addObject:v16];
          }
          goto LABEL_12;
        }
        [v10 addObject:v16];
        char v13 = 1;
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
  v21 = objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v20);
  [(HUBannerItemModule *)v25 setHiddenBanners:v21];

  [v27 setItems:v10];
  v22 = [v27 items];
  if ([v22 count])
  {
    v34 = v27;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  }
  else
  {
    v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (void)setHiddenBanners:(id)a3
{
}

BOOL __40__HUBannerItemModule_buildItemProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = [(id)objc_opt_class() _statusBannerItemClassForStatusItemClass:a2] != 0;

  return v4;
}

+ (Class)_statusBannerItemClassForStatusItemClass:(Class)a3
{
  if (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
    || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) == 0
    && (([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
     || ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0
     || [(objc_class *)a3 isEqual:objc_opt_class()]))
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }

  return (Class)v4;
}

id __40__HUBannerItemModule_buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_opt_class();
  v6 = (objc_class *)[v5 _statusBannerItemClassForStatusItemClass:objc_opt_class()];

  if (v6) {
    uint64_t v7 = [[v6 alloc] initWithSourceItem:v3];
  }
  else {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F696A8]) initWithSourceItem:v3 transformationBlock:&__block_literal_global_103_0];
  }
  v8 = (void *)v7;

  return v8;
}

- (id)buildItemProviders
{
  id v3 = objc_opt_new();
  BOOL v4 = [HUBannerItemProvider alloc];
  v5 = [(HUBannerItemModule *)self context];
  v6 = [v5 home];
  uint64_t v7 = [(HUBannerItemProvider *)v4 initWithHome:v6];
  [(HUBannerItemModule *)self setBannerItemProvider:v7];

  if ([(HUBannerItemModule *)self forceShowBanners])
  {
    v8 = [(HUBannerItemModule *)self bannerItemProvider];
    id v9 = (id)[v8 reloadItems];

    v10 = [(HUBannerItemModule *)self bannerItemProvider];
    uint64_t v11 = [v10 items];
    objc_msgSend(v11, "na_each:", &__block_literal_global_145);
  }
  uint64_t v12 = [(HUBannerItemModule *)self bannerItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v12);

  char v13 = [HUDropInBannerItemProvider alloc];
  uint64_t v14 = [(HUBannerItemModule *)self context];
  v15 = [v14 home];
  v16 = [(HUDropInBannerItemProvider *)v13 initWithHome:v15 delegate:self];
  [(HUBannerItemModule *)self setDropInBannerItemProvider:v16];

  v17 = [(HUBannerItemModule *)self dropInBannerItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v17);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__HUBannerItemModule_buildItemProviders__block_invoke_2;
  aBlock[3] = &unk_1E638CF88;
  objc_copyWeak(&v32, &location);
  v18 = _Block_copy(aBlock);
  id v19 = objc_alloc(MEMORY[0x1E4F695E8]);
  v20 = [(HUBannerItemModule *)self context];
  v21 = [v20 home];
  v22 = [(HUBannerItemModule *)self context];
  v23 = [v22 room];
  v24 = (void *)[v19 initWithHome:v21 room:v23 filter:v18];

  id v25 = objc_alloc(MEMORY[0x1E4F696B0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __40__HUBannerItemModule_buildItemProviders__block_invoke_3;
  v29[3] = &unk_1E638CFB0;
  objc_copyWeak(&v30, &location);
  v26 = (void *)[v25 initWithSourceProvider:v24 transformationBlock:v29];
  [(HUBannerItemModule *)self setStatusBannerItemProvider:v26];

  v27 = [(HUBannerItemModule *)self statusBannerItemProvider];
  objc_msgSend(v3, "na_safeAddObject:", v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v3;
}

- (HUDashboardContext)context
{
  return self->_context;
}

- (HUBannerItemProvider)bannerItemProvider
{
  return self->_bannerItemProvider;
}

- (HFTransformItemProvider)statusBannerItemProvider
{
  return self->_statusBannerItemProvider;
}

- (void)setStatusBannerItemProvider:(id)a3
{
}

- (void)setDropInBannerItemProvider:(id)a3
{
}

- (void)setBannerItemProvider:(id)a3
{
}

- (BOOL)forceShowBanners
{
  return self->_forceShowBanners;
}

- (HUDropInBannerItemProvider)dropInBannerItemProvider
{
  return self->_dropInBannerItemProvider;
}

- (HUBannerItemModule)initWithContext:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUBannerItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_context, a3);
  }

  return v9;
}

void __40__HUBannerItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v5 = v2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v5;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  [v4 setForceShowBanner:1];
}

id __40__HUBannerItemModule_buildItemProviders__block_invoke_4()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F68B10];
  v3[0] = MEMORY[0x1E4F1CC38];
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];

  return v0;
}

- (void)didUpdateDropInAvailability:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v20 = 138412546;
    v21 = self;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v20, 0x16u);
  }
  v8 = [(HFItemModule *)self itemUpdater];
  id v9 = (void *)MEMORY[0x1E4F69230];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v11 = [(HUBannerItemModule *)self dropInBannerItemProvider];
  uint64_t v12 = [v10 setWithObject:v11];
  char v13 = [v9 requestToReloadItemProviders:v12 senderSelector:a2];
  id v14 = (id)[v8 performItemUpdateRequest:v13];

  v15 = [v5 items];

  int v16 = objc_msgSend(v15, "na_any:", &__block_literal_global_114_0);
  if (v16)
  {
    v17 = HFLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromSelector(a2);
      int v20 = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "%@: %@ Posting banner size has updated notification...", (uint8_t *)&v20, 0x16u);
    }
    id v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 postNotificationName:@"HUBannerSizeHasUpdatedNotification" object:self];
  }
}

uint64_t __50__HUBannerItemModule_didUpdateDropInAvailability___block_invoke(uint64_t a1, void *a2)
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

  v6 = [v5 latestResults];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  uint64_t v8 = [v7 BOOLValue] ^ 1;

  return v8;
}

- (NSSet)hiddenBanners
{
  return self->_hiddenBanners;
}

- (void)setForceShowBanners:(BOOL)a3
{
  self->_forceShowBanners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBannerItemProvider, 0);
  objc_storeStrong((id *)&self->_dropInBannerItemProvider, 0);
  objc_storeStrong((id *)&self->_hiddenBanners, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_bannerItemProvider, 0);
}

@end