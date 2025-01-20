@interface HUHomeHubSharedHomeWarningItemManager
- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 homes:(id)a4;
- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (NSSet)homes;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)itemForHome:(id)a3;
- (void)setHomes:(id)a3;
@end

@implementation HUHomeHubSharedHomeWarningItemManager

- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 homes:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeHubSharedHomeWarningItemManager;
  v8 = [(HFItemManager *)&v11 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_homes, a4);
  }

  return v9;
}

- (HUHomeHubSharedHomeWarningItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v7 = NSStringFromSelector(sel_initWithDelegate_homes_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeHubSharedHomeWarningItemManager.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUHomeHubSharedHomeWarningItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(HUHomeHubSharedHomeWarningItemManager *)self homes];
    *(_DWORD *)buf = 136315394;
    v14 = "-[HUHomeHubSharedHomeWarningItemManager _buildItemProvidersForHome:]";
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%s fetched homes: %@.", buf, 0x16u);
  }
  v6 = [(HUHomeHubSharedHomeWarningItemManager *)self homes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__HUHomeHubSharedHomeWarningItemManager__buildItemProvidersForHome___block_invoke;
  v11[3] = &unk_1E6390CA8;
  v11[4] = self;
  id v7 = objc_msgSend(v6, "na_map:", v11);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v7];
  v12 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  return v9;
}

uint64_t __68__HUHomeHubSharedHomeWarningItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) itemForHome:a2];
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"homesSectionIdentifier"];
  v8 = [(HFItemManager *)self allItems];
  v9 = [v8 allObjects];
  v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
  objc_super v11 = [v9 sortedArrayUsingComparator:v10];
  [v7 setItems:v11];

  [v6 addObject:v7];
  v12 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v5];

  return v12;
}

- (id)itemForHome:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3)
  {
    id v5 = [v3 name];
    v6 = [v3 owner];
    id v7 = [v6 name];

    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[HUHomeHubSharedHomeWarningItemManager itemForHome:]";
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%s fetched home: %@.", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v4, "na_safeSetObject:forKey:", v5, *MEMORY[0x1E4F68AB8]);
    objc_msgSend(v4, "na_safeSetObject:forKey:", v7, *MEMORY[0x1E4F68990]);
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "length") == 0);
    objc_msgSend(v4, "na_safeSetObject:forKey:", v9, *MEMORY[0x1E4F68B10]);

    v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"homekit"];
    objc_super v11 = objc_msgSend(MEMORY[0x1E4F428B8], "hu_keyColor");
    v12 = [v10 imageWithTintColor:v11];

    objc_msgSend(v4, "na_safeSetObject:forKey:", v12, *MEMORY[0x1E4F689F8]);
  }
  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v14 = (void *)[v4 copy];
  __int16 v15 = (void *)[v13 initWithResults:v14];

  return v15;
}

- (NSSet)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end