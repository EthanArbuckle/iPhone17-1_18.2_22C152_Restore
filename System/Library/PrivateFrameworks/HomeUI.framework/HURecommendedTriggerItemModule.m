@interface HURecommendedTriggerItemModule
+ (BOOL)shouldShowRecommendation:(id)a3;
+ (id)rankComparator;
- (BOOL)hideSectionHeaderTitle;
- (HFStaticItem)moreButtonItem;
- (HMHome)home;
- (HRERecommendationItemProvider)recommendationItemProvider;
- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3;
- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)_buildStaticItems;
- (id)_itemsToHideInSet:(id)a3;
- (id)buildItemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)configureBlock;
- (id)filter;
- (int64_t)maximumNumberOfShownRecommendations;
- (unint64_t)_effectiveRecommendationEngineOptionsWithOptions:(unint64_t)a3;
- (unint64_t)engineOptions;
- (void)setConfigureBlock:(id)a3;
- (void)setEngineOptions:(unint64_t)a3;
- (void)setFilter:(id)a3;
- (void)setHideSectionHeaderTitle:(BOOL)a3;
- (void)setMaximumNumberOfShownRecommendations:(int64_t)a3;
- (void)setMoreButtonItem:(id)a3;
- (void)setRecommendationItemProvider:(id)a3;
@end

@implementation HURecommendedTriggerItemModule

- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HURecommendedTriggerItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v9->_maximumNumberOfShownRecommendations = 3;
    v9->_hideSectionHeaderTitle = 0;
    v9->_engineOptions = 2;
  }

  return v9;
}

- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HURecommendedTriggerItemModule.m", 38, @"%s is unavailable; use %@ instead",
    "-[HURecommendedTriggerItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (void)setConfigureBlock:(id)a3
{
  id aBlock = a3;
  v4 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];

  if (v4)
  {
    v5 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
    [v5 setConfigureBlock:aBlock];
  }
  v6 = _Block_copy(aBlock);
  id configureBlock = self->_configureBlock;
  self->_id configureBlock = v6;
}

- (void)setEngineOptions:(unint64_t)a3
{
  self->_unint64_t engineOptions = [(HURecommendedTriggerItemModule *)self _effectiveRecommendationEngineOptionsWithOptions:a3];
  v4 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];

  if (v4)
  {
    unint64_t engineOptions = self->_engineOptions;
    id v6 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
    [v6 setEngineOptions:engineOptions];
  }
}

- (id)buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F6A300]);
  v4 = [(HURecommendedTriggerItemModule *)self home];
  v5 = (void *)[v3 initWithHome:v4 andServiceLikeItems:0];
  [(HURecommendedTriggerItemModule *)self setRecommendationItemProvider:v5];

  unint64_t v6 = [(HURecommendedTriggerItemModule *)self engineOptions];
  id v7 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
  [v7 setEngineOptions:v6];

  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __52__HURecommendedTriggerItemModule_buildItemProviders__block_invoke;
  v22 = &unk_1E6388B78;
  objc_copyWeak(&v23, &location);
  v8 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
  [v8 setFilter:&v19];

  v9 = [(HURecommendedTriggerItemModule *)self configureBlock];

  if (v9)
  {
    v10 = [(HURecommendedTriggerItemModule *)self configureBlock];
    objc_super v11 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
    [v11 setConfigureBlock:v10];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
  v13 = [(HURecommendedTriggerItemModule *)self _buildStaticItems];
  v14 = (void *)[v12 initWithItems:v13];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
  v17 = objc_msgSend(v15, "setWithObjects:", v16, v14, 0, v19, v20, v21, v22);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

uint64_t __52__HURecommendedTriggerItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [(id)objc_opt_class() shouldShowRecommendation:v3];
  unint64_t v6 = [WeakRetained filter];
  if (v6)
  {
    id v7 = [WeakRetained filter];
    int v8 = ((uint64_t (**)(void, id))v7)[2](v7, v3);
  }
  else
  {
    int v8 = 1;
  }

  if ((v5 & v8 & 1) == 0)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109634;
      v11[1] = v5;
      __int16 v12 = 1024;
      int v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Hiding recommendation, passesBasicFilter: %{BOOL}d passesClientFilter: %{BOOL}d recommendation: %@", (uint8_t *)v11, 0x18u);
    }
  }
  return v5 & v8;
}

- (id)_buildStaticItems
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HURecommendedTriggerItemModule *)self moreButtonItem];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v12 = *MEMORY[0x1E4F68AB8];
    int v5 = _HULocalizedStringWithDefaultValue(@"HURecommendedAutomationsShowMoreButtonTitle", @"HURecommendedAutomationsShowMoreButtonTitle", 1);
    v13[0] = v5;
    unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v7 = (void *)[v4 initWithResults:v6];
    [(HURecommendedTriggerItemModule *)self setMoreButtonItem:v7];
  }
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HURecommendedTriggerItemModule *)self moreButtonItem];
  v10 = [v8 setWithObject:v9];

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  unint64_t v6 = (void *)[[v4 alloc] initWithIdentifier:@"HURecommendedTriggerItemModuleSection"];
  if (![(HURecommendedTriggerItemModule *)self hideSectionHeaderTitle])
  {
    id v7 = _HULocalizedStringWithDefaultValue(@"HURecommendedAutomationsSectionTitle", @"HURecommendedAutomationsSectionTitle", 1);
    [v6 setHeaderTitle:v7];
  }
  int v8 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
  v9 = [v8 items];
  v10 = [v9 allObjects];
  objc_super v11 = [(id)objc_opt_class() rankComparator];
  uint64_t v12 = [v10 sortedArrayUsingComparator:v11];
  [v6 setItems:v12];

  int v13 = [v6 items];
  __int16 v14 = [(HURecommendedTriggerItemModule *)self moreButtonItem];
  id v15 = [v13 arrayByAddingObject:v14];
  [v6 setItems:v15];

  uint64_t v16 = (void *)MEMORY[0x1E4F69220];
  v20[0] = v6;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [v16 filterSections:v17 toDisplayedItems:v5];

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v6 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
  id v7 = [v6 items];
  int v8 = objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);
  uint64_t v9 = [v8 count];

  if ([(HURecommendedTriggerItemModule *)self maximumNumberOfShownRecommendations] == 0x7FFFFFFFFFFFFFFFLL|| v9 <= [(HURecommendedTriggerItemModule *)self maximumNumberOfShownRecommendations])
  {
    id v15 = [(HURecommendedTriggerItemModule *)self moreButtonItem];
    [v5 addObject:v15];
  }
  else
  {
    unint64_t v10 = [(HURecommendedTriggerItemModule *)self maximumNumberOfShownRecommendations];
    objc_super v11 = [(HURecommendedTriggerItemModule *)self recommendationItemProvider];
    uint64_t v12 = [v11 items];
    int v13 = [v12 allObjects];
    __int16 v14 = [(id)objc_opt_class() rankComparator];
    id v15 = [v13 sortedArrayUsingComparator:v14];

    while (v10 < [v15 count])
    {
      uint64_t v16 = [v15 objectAtIndex:v10];
      [v5 addObject:v16];

      ++v10;
    }
  }

  return v5;
}

- (unint64_t)_effectiveRecommendationEngineOptionsWithOptions:(unint64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFFFCLL | 2;
}

+ (BOOL)shouldShowRecommendation:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "hu_triggerBuilderIfAny");
  char v5 = [v4 requiresFMFDeviceToRun];

  unint64_t v6 = [v3 home];
  id v7 = [v3 home];
  int v8 = [v7 currentUser];
  uint64_t v9 = [v6 homeAccessControlForUser:v8];
  uint64_t v10 = [v9 presenceComputationStatus];

  objc_super v11 = objc_msgSend(v3, "hu_triggerBuilderIfAny");
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  objc_opt_class();
  id v15 = [v14 locationInterface];
  uint64_t v16 = [v15 locationEventBuilder];
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (v18)
  {
    uint64_t v19 = [v18 region];
    BOOL v20 = v19 != 0;
  }
  else
  {
    BOOL v20 = 1;
  }
  v21 = objc_msgSend(v3, "hu_asTriggerRecommendation");
  v22 = [v21 triggerBuilders];
  char v23 = objc_msgSend(v22, "na_any:", &__block_literal_global_111);

  if ([MEMORY[0x1E4F69758] supportsBeingCurrentLocationDevice])
  {
    v24 = [MEMORY[0x1E4F69250] sharedDispatcher];
    [v24 authorizationStatus];

    char v34 = HFLocationServicesAvailableForAuthorizationStatus();
    v25 = (void *)MEMORY[0x1E4F2EA28];
    [v3 home];
    LOBYTE(v24) = v23;
    id v26 = v14;
    BOOL v27 = v20;
    uint64_t v28 = v10;
    v30 = char v29 = v5;
    LOBYTE(v25) = objc_msgSend(v25, "hf_presenceDisableReasonsForHome:", v30);

    char v5 = v29;
    uint64_t v10 = v28;
    BOOL v20 = v27;
    id v14 = v26;
    char v23 = (char)v24;
    char v31 = v34;
    if ((v25 & 2) != 0) {
      char v31 = 0;
    }
  }
  else
  {
    char v31 = 1;
  }
  BOOL v32 = ((v10 != 3) | ~v5) & (v31 | ~v23) & v20;

  return v32;
}

uint64_t __59__HURecommendedTriggerItemModule_shouldShowRecommendation___block_invoke(uint64_t a1, void *a2)
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

  unint64_t v6 = [v5 eventBuilders];
  uint64_t v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_30_1);

  return v7;
}

uint64_t __59__HURecommendedTriggerItemModule_shouldShowRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F1AD9210];
}

+ (id)rankComparator
{
  if (_MergedGlobals_4_1 != -1) {
    dispatch_once(&_MergedGlobals_4_1, &__block_literal_global_83_0);
  }
  id v2 = (void *)qword_1EA12DFD8;

  return v2;
}

void __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_2()
{
  v0 = (void *)qword_1EA12DFD8;
  qword_1EA12DFD8 = (uint64_t)&__block_literal_global_86_1;
}

uint64_t __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4;
  BOOL v20 = &unk_1E6385480;
  id v12 = v8;
  id v21 = v12;
  id v13 = v11;
  id v22 = v13;
  if (!v13 || (uint64_t v14 = __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4((uint64_t)&v17)) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F69220], "defaultItemComparator", v17, v18, v19, v20, v21, v22);
    id v15 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v14 = ((uint64_t (**)(void, id, id))v15)[2](v15, v6, v9);
  }
  return v14;
}

uint64_t __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recommendation];
  id v3 = [*(id *)(a1 + 40) recommendation];
  id v4 = NSNumber;
  [v2 sortingPriority];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = NSNumber;
  [v3 sortingPriority];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v5 compare:v7];

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItem)moreButtonItem
{
  return self->_moreButtonItem;
}

- (void)setMoreButtonItem:(id)a3
{
}

- (int64_t)maximumNumberOfShownRecommendations
{
  return self->_maximumNumberOfShownRecommendations;
}

- (void)setMaximumNumberOfShownRecommendations:(int64_t)a3
{
  self->_maximumNumberOfShownRecommendations = a3;
}

- (BOOL)hideSectionHeaderTitle
{
  return self->_hideSectionHeaderTitle;
}

- (void)setHideSectionHeaderTitle:(BOOL)a3
{
  self->_hideSectionHeaderTitle = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (HRERecommendationItemProvider)recommendationItemProvider
{
  return self->_recommendationItemProvider;
}

- (void)setRecommendationItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationItemProvider, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_moreButtonItem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end