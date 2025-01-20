@interface CSListItemDiscoveryProvider
- (BOOL)listHasAdditionalContent;
- (CSListItemDiscoveryProvider)init;
- (CSListItemManaging)itemManager;
- (CSListItemSection)section;
- (NSMutableDictionary)discoveryTypeToDiscoverySuggestionAndListItems;
- (id)_customizeFocusDiscoveryViewWithDNDSemanticType:(int64_t)a3;
- (id)_discoveryTypeForSuggestion:(id)a3;
- (id)_explorePostersDiscoveryItemViewControllerForPlatter:(id)a3 firstDidAppearCompletion:(id)a4;
- (id)_explorePostersDiscoveryView;
- (id)_sleepMigrationDiscoveryView;
- (unint64_t)itemCount;
- (void)_handleDismissSuggestion:(id)a3 type:(id)a4;
- (void)_handleShowSuggestion:(id)a3 type:(id)a4 isPrototyping:(BOOL)a5;
- (void)_presentPlatterDiscoveryView:(id)a3 discoveryItemViewController:(id)a4 withSuggestion:(id)a5 type:(id)a6;
- (void)_prototypeTest_addItem;
- (void)_prototypeTest_registerRecipe;
- (void)_prototypeTest_removeItem;
- (void)_removeDiscoveryOfType:(id)a3;
- (void)didReceiveUserEducationSuggestionEvent:(id)a3;
- (void)explorePostersPlatterViewWasTapped:(id)a3;
- (void)handleRemovedItems:(id)a3;
- (void)onboardingPlatter:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)onboardingPlatterRequestsDismissal:(id)a3;
- (void)setDiscoveryTypeToDiscoverySuggestionAndListItems:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setListHasAdditionalContent:(BOOL)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)willPresentPosterSwitcher;
@end

@implementation CSListItemDiscoveryProvider

- (CSListItemDiscoveryProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSListItemDiscoveryProvider;
  v2 = [(CSListItemDiscoveryProvider *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    discoveryTypeToDiscoverySuggestionAndListItems = v2->_discoveryTypeToDiscoverySuggestionAndListItems;
    v2->_discoveryTypeToDiscoverySuggestionAndListItems = v3;

    v5 = [MEMORY[0x1E4F4B3C0] sharedInstance];
    [v5 registerObserver:v2];

    [(CSListItemDiscoveryProvider *)v2 _prototypeTest_registerRecipe];
    uint64_t v6 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.CoverSheetDiscoveryProvider"];
    stateService = v2->_stateService;
    v2->_stateService = (DNDStateService *)v6;

    [(DNDStateService *)v2->_stateService addStateUpdateListener:v2 withCompletionHandler:0];
  }
  return v2;
}

- (CSListItemSection)section
{
  v2 = [[CSListItemSection alloc] initWithIdentifier:@"Discovery"];

  return v2;
}

- (unint64_t)itemCount
{
  return [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems count];
}

- (void)willPresentPosterSwitcher
{
  v3 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:@"CSListItemDiscoveryTypeExplorePosters"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 discoverySuggestion];
    uint64_t v6 = [MEMORY[0x1E4F4B3C0] sharedInstance];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v5 feedbackType:9];
    [v6 logUserEducationSuggestionFeedback:v7];

    dispatch_time_t v8 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__CSListItemDiscoveryProvider_willPresentPosterSwitcher__block_invoke;
    block[3] = &unk_1E6AD87F8;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __56__CSListItemDiscoveryProvider_willPresentPosterSwitcher__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeDiscoveryOfType:@"CSListItemDiscoveryTypeExplorePosters"];
}

- (void)handleRemovedItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) identifier];
        v10 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:v9];
        v11 = [v10 discoverySuggestion];

        if (v11)
        {
          v12 = [MEMORY[0x1E4F4B3C0] sharedInstance];
          v13 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v11 feedbackType:3];
          [v12 logUserEducationSuggestionFeedback:v13];
        }
        [(CSListItemDiscoveryProvider *)self _removeDiscoveryOfType:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)didReceiveUserEducationSuggestionEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CSListItemDiscoveryProvider_didReceiveUserEducationSuggestionEvent___block_invoke;
  v6[3] = &unk_1E6AD9368;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__CSListItemDiscoveryProvider_didReceiveUserEducationSuggestionEvent___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [a1[4] userEducationSuggestion];
    id v4 = [a1[5] _discoveryTypeForSuggestion:v3];
    uint64_t v5 = [a1[4] userEducationSuggestionEventType];
    if (v5 == 1)
    {
      [v6 _handleDismissSuggestion:v3 type:v4];
    }
    else if (!v5)
    {
      [v6 _handleShowSuggestion:v3 type:v4 isPrototyping:0];
    }

    id WeakRetained = v6;
  }
}

- (void)_handleShowSuggestion:(id)a3 type:(id)a4 isPrototyping:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:v9];

  if (!v10)
  {
    uint64_t v14 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems count];
    if ([(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems count] == 1)
    {
      long long v15 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems allKeys];
      v12 = [v15 firstObject];
    }
    else
    {
      v12 = 0;
    }
    if ([v12 isEqualToString:@"CSListItemDiscoveryTypeSleepMigration"]) {
      int v16 = 1;
    }
    else {
      int v16 = [v12 isEqualToString:@"CSListItemDiscoveryTypeCustomizeFocus"];
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __72__CSListItemDiscoveryProvider__handleShowSuggestion_type_isPrototyping___block_invoke;
    v35[3] = &unk_1E6AD87F8;
    id v17 = v8;
    id v36 = v17;
    v18 = (void *)MEMORY[0x1D9487300](v35);
    int v19 = [v9 isEqualToString:@"CSListItemDiscoveryTypeSleepMigration"];
    if (v14) {
      int v20 = v16;
    }
    else {
      int v20 = 1;
    }
    int v21 = v20 | v5;
    if (v19 && v21)
    {
      uint64_t v22 = [(CSListItemDiscoveryProvider *)self _sleepMigrationDiscoveryView];
    }
    else
    {
      if (([v9 isEqualToString:@"CSListItemDiscoveryTypeCustomizeFocus"] & v21) != 1)
      {
        int v27 = [v9 isEqualToString:@"CSListItemDiscoveryTypeExplorePosters"];
        v13 = 0;
        if (v14) {
          int v28 = v5;
        }
        else {
          int v28 = 1;
        }
        if (v27)
        {
          if (v28)
          {
            v23 = [(CSListItemDiscoveryProvider *)self _explorePostersDiscoveryView];
            v13 = [(CSListItemDiscoveryProvider *)self _explorePostersDiscoveryItemViewControllerForPlatter:v23 firstDidAppearCompletion:v18];
            if (v23) {
              goto LABEL_23;
            }
          }
        }
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v32 = [(DNDStateService *)self->_stateService queryCurrentStateWithError:0];
        v33 = [v32 activeModeConfiguration];
        v34 = [v33 mode];

        if (v34)
        {
          v23 = -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:](self, "_customizeFocusDiscoveryViewWithDNDSemanticType:", [v34 semanticType]);
        }
        else
        {
          v23 = 0;
        }

LABEL_22:
        v13 = 0;
        if (v23)
        {
LABEL_23:
          v24 = SBLogDashBoard();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v38 = v9;
            _os_log_impl(&dword_1D839D000, v24, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will appear.", buf, 0xCu);
          }

          if (v17)
          {
            v25 = [MEMORY[0x1E4F4B3C0] sharedInstance];
            v26 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v17 feedbackType:0];
            [v25 logUserEducationSuggestionFeedback:v26];
          }
          if (!v13) {
            v13 = [[CSDiscoveryItemViewController alloc] initWithPlatterDiscoveryView:v23 firstDidAppearCompletion:v18];
          }
          [(CSListItemDiscoveryProvider *)self _presentPlatterDiscoveryView:v23 discoveryItemViewController:v13 withSuggestion:v17 type:v9];
          goto LABEL_40;
        }
LABEL_36:
        v29 = SBLogDashBoard();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          discoveryTypeToDiscoverySuggestionAndListItems = self->_discoveryTypeToDiscoverySuggestionAndListItems;
          *(_DWORD *)buf = 138543618;
          id v38 = v9;
          __int16 v39 = 2114;
          v40 = discoveryTypeToDiscoverySuggestionAndListItems;
          _os_log_impl(&dword_1D839D000, v29, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will not show. Other suggestions: %{public}@ ", buf, 0x16u);
        }

        if (!v17) {
          goto LABEL_41;
        }
        v23 = [MEMORY[0x1E4F4B3C0] sharedInstance];
        v31 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v17 feedbackType:5];
        [v23 logUserEducationSuggestionFeedback:v31];

LABEL_40:
LABEL_41:

        goto LABEL_42;
      }
      uint64_t v22 = -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:](self, "_customizeFocusDiscoveryViewWithDNDSemanticType:", [v17 modeSemanticType]);
    }
    v23 = (void *)v22;
    goto LABEL_22;
  }
  v11 = SBLogDashBoard();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v9;
    _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Will not show because this type is currently presented. ", buf, 0xCu);
  }

  if (v8)
  {
    v12 = [MEMORY[0x1E4F4B3C0] sharedInstance];
    v13 = (CSDiscoveryItemViewController *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v8 feedbackType:5];
    [v12 logUserEducationSuggestionFeedback:v13];
LABEL_42:
  }
}

void __72__CSListItemDiscoveryProvider__handleShowSuggestion_type_isPrototyping___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F4B3C0] sharedInstance];
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:*(void *)(a1 + 32) feedbackType:1];
    [v2 logUserEducationSuggestionFeedback:v3];
  }
  id v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type:]: Did Appear.", v5, 2u);
  }
}

- (void)_handleDismissSuggestion:(id)a3 type:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    [(CSListItemDiscoveryProvider *)self _removeDiscoveryOfType:v5];
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Dismissed suggestion", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    id v6 = SBLogDashBoard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CSListItemDiscoveryProvider _handleDismissSuggestion:type:](v6);
    }
  }
}

- (id)_discoveryTypeForSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = 0;
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = @"CSListItemDiscoveryTypeSleepMigration";
    }
    else {
      id v4 = 0;
    }
  }
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = @"CSListItemDiscoveryTypeCustomizeFocus";
    }
  }
  if (CSFeatureEnabled(0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = @"CSListItemDiscoveryTypeExplorePosters";
    }
  }

  return v4;
}

- (void)_presentPlatterDiscoveryView:(id)a3 discoveryItemViewController:(id)a4 withSuggestion:(id)a5 type:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [[CSListItem alloc] initWithIdentifier:v13 groupingIdentifier:v13 sectionIdentifier:@"Discovery"];
  id v27 = objc_alloc_init(MEMORY[0x1E4FB38E8]);
  long long v15 = objc_alloc_init(CSDiscoverySuggestionAndListItemTuple);
  [(CSDiscoverySuggestionAndListItemTuple *)v15 setListItem:v14];
  [(CSDiscoverySuggestionAndListItemTuple *)v15 setDiscoverySuggestion:v12];
  [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems setObject:v15 forKey:v13];
  objc_initWeak(location, self);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__1;
  v45 = __Block_byref_object_dispose__1;
  [v10 defaultAction];
  v26 = v11;
  id v46 = (id)objc_claimAutoreleasedReturnValue();
  if (v42[5])
  {
    v25 = (void *)MEMORY[0x1E4F426E8];
    int v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"DISCOVERY_LIST_ITEM_OPEN_ACTION_TITLE" value:&stru_1F3020248 table:@"CoverSheet"];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke;
    v32[3] = &unk_1E6AD9B08;
    objc_copyWeak(&v40, location);
    id v33 = v13;
    v34 = v15;
    id v35 = v12;
    id v36 = self;
    v37 = v14;
    __int16 v39 = &v41;
    id v38 = v11;
    v18 = [v25 actionWithTitle:v17 image:0 identifier:0 handler:v32];

    [v27 setDefaultAction:v18];
    objc_destroyWeak(&v40);
  }
  int v19 = (void *)MEMORY[0x1E4F426E8];
  int v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v21 = [v20 localizedStringForKey:@"DISCOVERY_LIST_ITEM_CLEAR_ACTION_TITLE" value:&stru_1F3020248 table:@"CoverSheet"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_2;
  v28[3] = &unk_1E6AD9B30;
  objc_copyWeak(&v31, location);
  id v22 = v13;
  id v29 = v22;
  id v23 = v12;
  id v30 = v23;
  v24 = [v19 actionWithTitle:v21 image:0 identifier:0 handler:v28];

  [v10 setClearAction:v24];
  [v10 setUsesBackgroundView:0];
  objc_msgSend(v27, "setMaterialRecipe:", objc_msgSend(v10, "materialRecipe"));
  [(CSListItem *)v14 setConfiguration:v27];
  [(CSListItem *)v14 setContentHost:v26];
  [(CSListItemManaging *)self->_itemManager addItem:v14];

  objc_destroyWeak(&v31);
  _Block_object_dispose(&v41, 8);

  objc_destroyWeak(location);
}

void __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained discoveryTypeToDiscoverySuggestionAndListItems];
    id v5 = [v4 objectForKey:*(void *)(a1 + 32)];
    id v6 = *(void **)(a1 + 40);

    if (v5 == v6)
    {
      int v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v8;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: User triggered default action.", buf, 0xCu);
      }

      if (*(void *)(a1 + 48))
      {
        uint64_t v9 = [MEMORY[0x1E4F4B3C0] sharedInstance];
        id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:*(void *)(a1 + 48) feedbackType:7];
        [v9 logUserEducationSuggestionFeedback:v10];
      }
      uint64_t v11 = *(void *)(a1 + 64);
      id v12 = *(void **)(*(void *)(a1 + 56) + 24);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_64;
      v15[3] = &unk_1E6AD9AE0;
      long long v14 = *(_OWORD *)(a1 + 72);
      id v13 = (id)v14;
      long long v16 = v14;
      [v12 item:v11 requestsAuthenticationAndPerformBlock:v15];
    }
  }
}

uint64_t __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_64(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(*(void *)(result + 40) + 8) + 40) performWithSender:*(void *)(result + 32) target:0];
  }
  return result;
}

void __108__CSListItemDiscoveryProvider__presentPlatterDiscoveryView_discoveryItemViewController_withSuggestion_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeDiscoveryOfType:*(void *)(a1 + 32)];
  if (*(void *)(a1 + 40))
  {
    v2 = [MEMORY[0x1E4F4B3C0] sharedInstance];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:*(void *)(a1 + 40) feedbackType:3];
    [v2 logUserEducationSuggestionFeedback:v3];
  }
}

- (void)_removeDiscoveryOfType:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CSListItemDiscoveryProvider__removeDiscoveryOfType___block_invoke;
  v6[3] = &unk_1E6AD88C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __54__CSListItemDiscoveryProvider__removeDiscoveryOfType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 discoverySuggestion];
    if (v4)
    {
      id v5 = SBLogDashBoard();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v11 = 138543362;
        uint64_t v12 = v6;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Removing suggestion from list", (uint8_t *)&v11, 0xCu);
      }

      id v7 = [MEMORY[0x1E4F4B3C0] sharedInstance];
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F4B3E8]) initWithUserEducationSuggestion:v4 feedbackType:4];
      [v7 logUserEducationSuggestionFeedback:v8];
    }
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 24);
    id v10 = [v3 listItem];
    [v9 removeItem:v10];

    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (id)_sleepMigrationDiscoveryView
{
  v2 = objc_alloc_init(CSDiscoveryItemPlatterSleepMigration);

  return v2;
}

- (id)_customizeFocusDiscoveryViewWithDNDSemanticType:(int64_t)a3
{
  id v5 = [(DNDStateService *)self->_stateService queryCurrentStateWithError:0];
  uint64_t v6 = [v5 activeModeConfiguration];
  id v7 = [v6 mode];

  if (v7 && [v7 semanticType] == a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F62298] onboardingPlatterDiscoveryViewForMode:v7];
    [v8 setDelegate:self];
  }
  else
  {
    uint64_t v9 = SBLogDashBoard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CSListItemDiscoveryProvider _customizeFocusDiscoveryViewWithDNDSemanticType:](v9);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_explorePostersDiscoveryView
{
  id v3 = objc_alloc_init(CSDiscoveryItemExplorePostersPlatterView);
  [(CSDiscoveryItemExplorePostersPlatterView *)v3 setDelegate:self];

  return v3;
}

- (id)_explorePostersDiscoveryItemViewControllerForPlatter:(id)a3 firstDidAppearCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CSDiscoveryItemExplorePostersViewController alloc] initWithPlatter:v6 firstDidAppearCompletion:v5];

  return v7;
}

- (void)onboardingPlatter:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  discoveryTypeToDiscoverySuggestionAndListItems = self->_discoveryTypeToDiscoverySuggestionAndListItems;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(NSMutableDictionary *)discoveryTypeToDiscoverySuggestionAndListItems objectForKey:@"CSListItemDiscoveryTypeCustomizeFocus"];
  id v13 = [v12 listItem];

  [(CSListItemManaging *)self->_itemManager item:v13 requestsModalPresentationOfViewController:v11 animated:v6 completion:v10];
}

- (void)onboardingPlatterRequestsDismissal:(id)a3
{
}

- (void)explorePostersPlatterViewWasTapped:(id)a3
{
}

- (void)_prototypeTest_registerRecipe
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4F94120];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke;
  v6[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v7, &location);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke_2;
  v4[3] = &unk_1E6AD92C8;
  objc_copyWeak(&v5, &location);
  id v3 = [v2 recipeWithTitle:@"Add Discover Platter" increaseAction:v6 decreaseAction:v4];
  +[PTDomain registerTestRecipe:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_prototypeTest_addItem");
    id WeakRetained = v2;
  }
}

void __60__CSListItemDiscoveryProvider__prototypeTest_registerRecipe__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_prototypeTest_removeItem");
    id WeakRetained = v2;
  }
}

- (void)_prototypeTest_addItem
{
  id v3 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:@"CSListItemDiscoveryTypeCustomizeFocus"];

  if (v3)
  {
    id v4 = @"CSListItemDiscoveryTypeSleepMigration";
  }
  else
  {
    id v5 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:@"CSListItemDiscoveryTypeExplorePosters"];

    if (v5) {
      id v4 = @"CSListItemDiscoveryTypeCustomizeFocus";
    }
    else {
      id v4 = @"CSListItemDiscoveryTypeExplorePosters";
    }
  }

  [(CSListItemDiscoveryProvider *)self _handleShowSuggestion:0 type:v4 isPrototyping:1];
}

- (void)_prototypeTest_removeItem
{
  if ([(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems count])
  {
    id v3 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems allKeys];
    id v4 = [v3 firstObject];

    [(CSListItemDiscoveryProvider *)self _handleDismissSuggestion:0 type:v4];
  }
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [v5 state];
  id v7 = [v6 activeModeConfiguration];
  uint64_t v8 = [v7 mode];

  id v31 = v5;
  uint64_t v9 = [v5 previousState];
  id v10 = [v9 activeModeConfiguration];
  id v11 = [v10 mode];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v12 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    uint64_t v32 = *(void *)v35;
    id v33 = v8;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * v16);
        if (v8)
        {
          uint64_t v18 = [v11 semanticType];
          if (v18 == [v8 semanticType])
          {
            uint64_t v19 = [(NSMutableDictionary *)self->_discoveryTypeToDiscoverySuggestionAndListItems objectForKey:v17];
            int v20 = [v19 discoverySuggestion];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              goto LABEL_13;
            }
            id v21 = v20;
            id v22 = v12;
            id v23 = self;
            v24 = v11;
            uint64_t v25 = [v8 semanticType];
            uint64_t v26 = v14;
            uint64_t v27 = [v21 modeSemanticType];

            BOOL v28 = v25 == v27;
            uint64_t v14 = v26;
            id v11 = v24;
            self = v23;
            uint64_t v12 = v22;
            uint64_t v15 = v32;
            uint64_t v8 = v33;
            if (v28) {
              goto LABEL_13;
            }
          }
        }
        id v29 = SBLogDashBoard();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v39 = v17;
          _os_log_impl(&dword_1D839D000, v29, OS_LOG_TYPE_DEFAULT, "[Discovery UI, type: '%{public}@']: Removing due to mode change.", buf, 0xCu);
        }

        [(CSListItemDiscoveryProvider *)self _removeDiscoveryOfType:v17];
LABEL_13:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v30 = [v12 countByEnumeratingWithState:&v34 objects:v40 count:16];
      uint64_t v14 = v30;
    }
    while (v30);
  }
}

- (CSListItemManaging)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (BOOL)listHasAdditionalContent
{
  return self->_listHasAdditionalContent;
}

- (void)setListHasAdditionalContent:(BOOL)a3
{
  self->_listHasAdditionalContent = a3;
}

- (NSMutableDictionary)discoveryTypeToDiscoverySuggestionAndListItems
{
  return self->_discoveryTypeToDiscoverySuggestionAndListItems;
}

- (void)setDiscoveryTypeToDiscoverySuggestionAndListItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryTypeToDiscoverySuggestionAndListItems, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_storeStrong((id *)&self->_stateService, 0);
}

- (void)_handleDismissSuggestion:(os_log_t)log type:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "[Discovery UI, type: '%{public}@']: Error. System system cannot dismiss from suggestion event. Suggestion isn't currently presented.", (uint8_t *)&v1, 0xCu);
}

- (void)_customizeFocusDiscoveryViewWithDNDSemanticType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D839D000, log, OS_LOG_TYPE_ERROR, "[Discovery UI, type: 'CSListItemDiscoveryTypeCustomizeFocus']: Current mode semantic type does not match suggestion's semantic type.", v1, 2u);
}

@end