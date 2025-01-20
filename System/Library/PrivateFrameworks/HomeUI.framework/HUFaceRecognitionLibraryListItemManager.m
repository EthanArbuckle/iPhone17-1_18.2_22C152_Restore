@interface HUFaceRecognitionLibraryListItemManager
- (BOOL)didSendAnalyticsEvent;
- (HFDemoModeFaceRecognitionDataSource)demoDataSource;
- (HFItem)allowFacialRecognitionItem;
- (HFItemProvider)recentEventsItemProvider;
- (HFStaticItem)knownToHomeItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFUserPhotosLibraryItemProvider)userPhotosLibraryItemProvider;
- (HMHome)overrideHome;
- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3;
- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUFaceRecognitionLibraryListItemManager)initWithHome:(id)a3 delegate:(id)a4;
- (NSArray)coalescedPersonEvents;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (unint64_t)recentsLimit;
- (void)sendAnalyticsEvent;
- (void)setAllowFacialRecognitionItem:(id)a3;
- (void)setCoalescedPersonEvents:(id)a3;
- (void)setDemoDataSource:(id)a3;
- (void)setDidSendAnalyticsEvent:(BOOL)a3;
- (void)setKnownToHomeItem:(id)a3;
- (void)setRecentEventsItemProvider:(id)a3;
- (void)setRecentsLimit:(unint64_t)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setUserPhotosLibraryItemProvider:(id)a3;
@end

@implementation HUFaceRecognitionLibraryListItemManager

- (HUFaceRecognitionLibraryListItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HUFaceRecognitionLibraryListItemManager.m", 52, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionLibraryListItemManager;
  v10 = [(HFItemManager *)&v23 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_overrideHome, a3);
    if (([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) != 0
      || [MEMORY[0x1E4F69758] isRunningInStoreDemoMode])
    {
      v12 = (HFDemoModeFaceRecognitionDataSource *)objc_alloc_init(MEMORY[0x1E4F690E0]);
      demoDataSource = v11->_demoDataSource;
      v11->_demoDataSource = v12;
    }
    v11->_didSendAnalyticsEvent = 0;
    v11->_recentsLimit = 50;
    objc_initWeak(&location, v11);
    id v14 = objc_alloc(MEMORY[0x1E4F695C0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke;
    v19[3] = &unk_1E63861A0;
    objc_copyWeak(&v21, &location);
    id v20 = v8;
    uint64_t v15 = [v14 initWithResultsBlock:v19];
    knownToHomeItem = v11->_knownToHomeItem;
    v11->_knownToHomeItem = (HFStaticItem *)v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    int v3 = 1;
  }
  else {
    int v3 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  v4 = [*(id *)(a1 + 32) personManagerSettings];
  char v5 = [v4 isFaceClassificationEnabled];

  v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  v7 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionKnownToHouseCellTitle", @"HUFaceRecognitionKnownToHouseCellTitle", 1);
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  id v8 = HFLocalizedString();
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68900]];

  if (v3)
  {
    v10 = NSString;
    v11 = [WeakRetained demoDataSource];
    v12 = [v11 knownToHouseholdEntries];
    v13 = objc_msgSend(v10, "stringWithFormat:", @"%lu", objc_msgSend(v12, "count"));
    [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68990]];
  }
  else
  {
    if (v5)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
      uint64_t v15 = [WeakRetained overrideHome];
      v16 = [v15 personManager];
      v17 = [v14 completionHandlerAdapter];
      [v16 fetchAllPersonsWithCompletion:v17];

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_2;
      v21[3] = &unk_1E6389D90;
      id v22 = v6;
      v18 = [v14 flatMap:v21];
      v19 = [v18 recover:&__block_literal_global_38_2];

      goto LABEL_10;
    }
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v19 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];
LABEL_10:

  return v19;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = objc_msgSend(a2, "na_filter:", &__block_literal_global_93);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v3, "count"));
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F68990]];

  char v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "count") == 0);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68A20]];

  v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v6;
}

BOOL __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 name];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v2;
    _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error fetching persons: %@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC38];
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v6 = [v4 futureWithResult:v5];

  return v6;
}

- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionLibraryListItemManager.m", 102, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionLibraryListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3
{
  char v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionLibraryListItemManager.m", 107, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionLibraryListItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    int v6 = 1;
  }
  else {
    int v6 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __70__HUFaceRecognitionLibraryListItemManager__buildItemProvidersForHome___block_invoke;
  v33 = &unk_1E6386518;
  id v8 = v4;
  id v34 = v8;
  char v35 = v6;
  uint64_t v9 = (void *)[v7 initWithResultsBlock:&v30];
  [(HUFaceRecognitionLibraryListItemManager *)self setAllowFacialRecognitionItem:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = [(HUFaceRecognitionLibraryListItemManager *)self allowFacialRecognitionItem];
  v13 = [(HUFaceRecognitionLibraryListItemManager *)self knownToHomeItem];
  id v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, 0, v30, v31, v32, v33);
  uint64_t v15 = (void *)[v10 initWithItems:v14];
  [(HUFaceRecognitionLibraryListItemManager *)self setStaticItemProvider:v15];

  v16 = [(HUFaceRecognitionLibraryListItemManager *)self staticItemProvider];
  [v5 addObject:v16];

  if ((v6 & 1) == 0)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F69750]) initWithHome:v8];
    [(HUFaceRecognitionLibraryListItemManager *)self setUserPhotosLibraryItemProvider:v17];

    v18 = [(HUFaceRecognitionLibraryListItemManager *)self userPhotosLibraryItemProvider];
    [v5 addObject:v18];
  }
  v19 = [(HUFaceRecognitionLibraryListItemManager *)self recentEventsItemProvider];

  if (!v19)
  {
    if (v6)
    {
      id v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v37 = 1;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "isDemoMode %{BOOL}d", buf, 8u);
      }

      id v21 = objc_alloc(MEMORY[0x1E4F690E8]);
      id v22 = [(HFItemManager *)self home];
      objc_super v23 = (void *)[v21 initForMode:0 home:v22];
      [(HUFaceRecognitionLibraryListItemManager *)self setRecentEventsItemProvider:v23];
    }
    else
    {
      v24 = [(HFItemManager *)self home];
      int v25 = objc_msgSend(v24, "hf_currentUserIsAdministrator");

      if (!v25)
      {
LABEL_14:
        v28 = [(HUFaceRecognitionLibraryListItemManager *)self recentEventsItemProvider];
        objc_msgSend(v5, "na_safeAddObject:", v28);

        goto LABEL_15;
      }
      v26 = [HUFaceRecognitionRecentEventsItemProvider alloc];
      v27 = [(HFItemManager *)self home];
      id v22 = [(HUFaceRecognitionRecentEventsItemProvider *)v26 initWithHome:v27];

      [(HUFaceRecognitionLibraryListItemManager *)self setRecentEventsItemProvider:v22];
      [(HUFaceRecognitionRecentEventsItemProvider *)v22 setFetchLimit:[(HUFaceRecognitionLibraryListItemManager *)self recentsLimit]];
    }

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

id __70__HUFaceRecognitionLibraryListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) personManagerSettings];
  [v2 isFaceClassificationEnabled];

  BOOL v3 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v15 = *MEMORY[0x1E4F68AB8];
  id v4 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionSettingSwitchTitle", @"HUFaceRecognitionSettingSwitchTitle", 1);
  uint64_t v5 = *MEMORY[0x1E4F68AC0];
  v21[0] = v4;
  v21[1] = @"HUFaceRecognitionSettingSwitchTitle";
  uint64_t v6 = *MEMORY[0x1E4F68BC0];
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  id v7 = [NSNumber numberWithInteger:HFPrimaryStateFromBOOL()];
  uint64_t v8 = *MEMORY[0x1E4F68A70];
  v21[2] = v7;
  v21[3] = MEMORY[0x1E4F1CC38];
  uint64_t v9 = *MEMORY[0x1E4F68A08];
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  void v21[4] = v10;
  uint64_t v20 = *MEMORY[0x1E4F68900];
  id v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0, v15, v16, v17);
  v21[5] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v15 count:6];
  v13 = [v3 futureWithResult:v12];

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v41 = a3;
  uint64_t v5 = [v4 array];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionSettingSwitchSection"];
  id v7 = [(HUFaceRecognitionLibraryListItemManager *)self allowFacialRecognitionItem];
  v42[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  [v6 setItems:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F28B18];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionSettingSwitchFooter", @"HUFaceRecognitionSettingSwitchFooter", 1);
  id v11 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionSettingFooterLearnMoreSubstring", @"HUFaceRecognitionSettingFooterLearnMoreSubstring", 1);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_faceRecognitionPrivacyURL");
  uint64_t v13 = objc_msgSend(v9, "hf_attributedLinkStringForString:linkString:linkURL:", v10, v11, v12);

  v40 = (void *)v13;
  [v6 setAttributedFooterTitle:v13];
  [v5 addObject:v6];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionLibrariesSection"];
  uint64_t v15 = [(HUFaceRecognitionLibraryListItemManager *)self userPhotosLibraryItemProvider];
  uint64_t v16 = [v15 items];
  uint64_t v17 = [v16 allObjects];

  uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
  v39 = v17;
  uint64_t v19 = [v17 sortedArrayUsingComparator:&__block_literal_global_66_1];
  objc_msgSend(v18, "na_safeAddObjectsFromArray:", v19);

  uint64_t v20 = [(HUFaceRecognitionLibraryListItemManager *)self knownToHomeItem];
  objc_msgSend(v18, "na_safeAddObject:", v20);

  [v14 setItems:v18];
  id v21 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionLibrariesSectionTitle", @"HUFaceRecognitionLibrariesSectionTitle", 1);
  [v14 setHeaderTitle:v21];

  [v5 addObject:v14];
  id v22 = [(HUFaceRecognitionLibraryListItemManager *)self recentEventsItemProvider];
  objc_super v23 = [v22 items];
  v24 = [v23 allObjects];
  int v25 = +[HUFaceRecognitionRecentEventsItemProvider cameraSignificantEventDateComparator];
  v26 = [v24 sortedArrayUsingComparator:v25];

  int v27 = 1;
  if (([MEMORY[0x1E4F69758] isPressDemoModeEnabled] & 1) == 0) {
    int v27 = [MEMORY[0x1E4F69758] isRunningInStoreDemoMode];
  }
  v28 = [(HFItemManager *)self home];
  v29 = [v28 personManagerSettings];
  int v30 = [v29 isFaceClassificationEnabled];
  if (v26) {
    int v31 = v27;
  }
  else {
    int v31 = 0;
  }
  if (v30 | v31) {
    v32 = v26;
  }
  else {
    v32 = (void *)MEMORY[0x1E4F1CBF0];
  }

  id v33 = v32;
  [(HUFaceRecognitionLibraryListItemManager *)self setCoalescedPersonEvents:v33];
  id v34 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUFaceRecognitionRecentVisitorsSectionIdentifier"];
  [v34 setItems:v33];

  char v35 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionRecentVisitorsSectionTitle", @"HUFaceRecognitionRecentVisitorsSectionTitle", 1);
  [v34 setHeaderTitle:v35];

  v36 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionRecentVisitorsSectionFooter", @"HUFaceRecognitionRecentVisitorsSectionFooter", 1);
  [v34 setFooterTitle:v36];

  [v5 addObject:v34];
  int v37 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v41];

  return v37;
}

uint64_t __76__HUFaceRecognitionLibraryListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 user];
  uint64_t v6 = [v5 name];
  id v7 = [v4 user];

  uint64_t v8 = [v7 name];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)_homeFuture
{
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  BOOL v3 = [(HUFaceRecognitionLibraryListItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)setRecentsLimit:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v6 = [(HUFaceRecognitionLibraryListItemManager *)self recentEventsItemProvider];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8 && self->_recentsLimit != a3)
  {
    self->_recentsLimit = a3;
    [v8 setFetchLimit:a3];
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = a3;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Setting limit %lu on recents", buf, 0xCu);
    }

    id v12 = v8;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    id v11 = [(HFItemManager *)self reloadAndUpdateItemsForProviders:v10 senderSelector:a2];
  }
}

- (void)sendAnalyticsEvent
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(HUFaceRecognitionLibraryListItemManager *)self didSendAnalyticsEvent])
  {
    [(HUFaceRecognitionLibraryListItemManager *)self setDidSendAnalyticsEvent:1];
    BOOL v3 = objc_opt_new();
    id v4 = NSNumber;
    uint64_t v5 = [(HUFaceRecognitionLibraryListItemManager *)self coalescedPersonEvents];
    uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v24 = v3;
    objc_msgSend(v3, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E4F682A0]);

    int v25 = objc_opt_new();
    v26 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(HUFaceRecognitionLibraryListItemManager *)self coalescedPersonEvents];
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    uint64_t v10 = *MEMORY[0x1E4F688C8];
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * v11);
        objc_opt_class();
        uint64_t v13 = [v12 latestResults];
        unint64_t v14 = [v13 objectForKeyedSubscript:v10];
        if (objc_opt_isKindOfClass()) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;

        uint64_t v17 = [v16 person];

        if (v17)
        {
          uint64_t v18 = [v17 name];
          uint64_t v19 = [v18 length];

          if (v19) {
            goto LABEL_15;
          }
          uint64_t v20 = v25;
          id v21 = v17;
        }
        else
        {
          uint64_t v20 = v26;
          id v21 = v12;
        }
        [v20 addObject:v21];
LABEL_15:

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v8)
      {
LABEL_17:

        id v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        objc_msgSend(v24, "na_safeSetObject:forKey:", v22, *MEMORY[0x1E4F68298]);

        objc_super v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
        objc_msgSend(v24, "na_safeSetObject:forKey:", v23, *MEMORY[0x1E4F682A8]);

        [MEMORY[0x1E4F68EE0] sendEvent:7 withData:v24];
        return;
      }
    }
  }
}

- (HFItem)allowFacialRecognitionItem
{
  return self->_allowFacialRecognitionItem;
}

- (void)setAllowFacialRecognitionItem:(id)a3
{
}

- (HFStaticItem)knownToHomeItem
{
  return self->_knownToHomeItem;
}

- (void)setKnownToHomeItem:(id)a3
{
}

- (unint64_t)recentsLimit
{
  return self->_recentsLimit;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HFUserPhotosLibraryItemProvider)userPhotosLibraryItemProvider
{
  return self->_userPhotosLibraryItemProvider;
}

- (void)setUserPhotosLibraryItemProvider:(id)a3
{
}

- (HFItemProvider)recentEventsItemProvider
{
  return self->_recentEventsItemProvider;
}

- (void)setRecentEventsItemProvider:(id)a3
{
}

- (HFDemoModeFaceRecognitionDataSource)demoDataSource
{
  return self->_demoDataSource;
}

- (void)setDemoDataSource:(id)a3
{
}

- (NSArray)coalescedPersonEvents
{
  return self->_coalescedPersonEvents;
}

- (void)setCoalescedPersonEvents:(id)a3
{
}

- (BOOL)didSendAnalyticsEvent
{
  return self->_didSendAnalyticsEvent;
}

- (void)setDidSendAnalyticsEvent:(BOOL)a3
{
  self->_didSendAnalyticsEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedPersonEvents, 0);
  objc_storeStrong((id *)&self->_demoDataSource, 0);
  objc_storeStrong((id *)&self->_recentEventsItemProvider, 0);
  objc_storeStrong((id *)&self->_userPhotosLibraryItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_knownToHomeItem, 0);

  objc_storeStrong((id *)&self->_allowFacialRecognitionItem, 0);
}

@end