@interface FLTopLevelViewModel
+ (id)_prefixFromBundleIdentifier:(id)a3;
+ (id)redirectURLForItem:(id)a3 withAction:(id)a4;
- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 clientIdentifier:(id)a4;
- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 controller:(id)a4;
- (FLTopLevelViewModel)initWithIdentifier:(id)a3;
- (NSString)localizedDeviceRowTitle;
- (id)_groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4 simpleAccountGrouping:(BOOL)a5;
- (id)allPendingItems;
- (id)extensionToItemMapFromItems:(id)a3;
- (id)groups;
- (id)groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4;
- (void)_configureTimerForItem:(id)a3;
- (void)_refreshItemsWithExtensionToItemMap:(id)a3 completion:(id)a4;
- (void)_removeTimerForItem:(id)a3;
- (void)_updateTimerItems:(id)a3;
- (void)allPendingItems;
- (void)dealloc;
- (void)mapItems:(id)a3 toGroups:(id)a4 unknownGroup:(id)a5 deviceGroup:(id)a6 simpleAccountGrouping:(BOOL)a7;
- (void)refreshItems:(id)a3 withCompletionHandler:(id)a4;
- (void)refreshItemsForItem:(id)a3 withCompletionHandler:(id)a4;
- (void)setItemChangeHandler:(id)a3;
- (void)setLocalizedDeviceRowTitle:(id)a3;
@end

@implementation FLTopLevelViewModel

- (id)_groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4 simpleAccountGrouping:(BOOL)a5
{
  BOOL v59 = a5;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = _FLSignpostCreate();
  uint64_t v60 = v10;
  v11 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:](v9, v11);
  }

  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  v13 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.account"];
  v14 = FLLoc(@"ACCOUNT_MULTI_FOLLOW_LIST_TITLE");
  [(FLGroupViewModelImpl *)v13 setRowTitle:v14];

  [(FLGroupViewModelImpl *)v13 setAccountID:v7];
  [(FLGroupViewModelImpl *)v13 setNeedsAccountID:0];
  v61 = v13;
  [v12 addObject:v13];
  v15 = -[FLGroupViewModelImpl initWithIdentifier:]([FLGroupViewModelImpl alloc], "initWithIdentifier:");
  [(FLGroupViewModelImpl *)v15 setAccountID:v7];
  [(FLGroupViewModelImpl *)v15 setNeedsAccountID:0];
  v16 = FLLoc(@"SERVICES_MULTI_FOLLOW_LIST_TITLE");
  [(FLGroupViewModelImpl *)v15 setRowTitle:v16];

  v57 = v15;
  [v12 addObject:v15];
  if (v7)
  {
    v17 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.none"];
    [(FLGroupViewModelImpl *)v17 setAccountID:v7];
    [(FLGroupViewModelImpl *)v17 setNeedsAccountID:1];
    [v12 addObject:v17];
  }
  if (v8 && [v8 count])
  {
    v18 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.account"];
    v19 = FLLoc(@"ACCOUNT_MULTI_FOLLOW_LIST_TITLE");
    [(FLGroupViewModelImpl *)v18 setRowTitle:v19];

    v20 = [v8 firstObject];
    [(FLGroupViewModelImpl *)v18 setAccountID:v20];

    [(FLGroupViewModelImpl *)v18 setNeedsAccountID:1];
    [v12 addObject:v18];
  }
  v21 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.none"];
  v63 = v8;
  v22 = [v8 firstObject];
  [(FLGroupViewModelImpl *)v21 setAccountID:v22];

  [(FLGroupViewModelImpl *)v21 setNeedsAccountID:0];
  v56 = v21;
  [v12 addObject:v21];
  v23 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.device"];
  v24 = [(FLTopLevelViewModel *)self localizedDeviceRowTitle];
  uint64_t v62 = v9;
  if (v24)
  {
    [(FLGroupViewModelImpl *)v23 setRowTitle:v24];
  }
  else
  {
    v25 = FLLoc(@"MULTI_FOLLOW_LIST_TITLE");
    [(FLGroupViewModelImpl *)v23 setRowTitle:v25];
  }
  v64 = v7;

  v65 = v23;
  [v12 addObject:v23];
  v26 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.ndo"];
  uint64_t v27 = FLLoc(@"NDO_MULTI_FOLLOW_LIST_TITLE");
  [(FLGroupViewModelImpl *)v26 setRowTitle:v27];

  v55 = v26;
  [v12 addObject:v26];
  v28 = +[FLEnvironment currentEnvironment];
  LOBYTE(v27) = [v28 isInternal];

  if (v27)
  {
    v29 = [[FLGroupViewModelImpl alloc] initWithIdentifier:@"com.apple.followup.group.unknown"];
    [(FLGroupViewModelImpl *)v29 setGroupTitle:@"Internal Only - APPROVAL REQUIRED:"];
    [(FLGroupViewModelImpl *)v29 groupTitle];
    v31 = v30 = self;
    [(FLGroupViewModelImpl *)v29 setRowTitle:v31];

    self = v30;
    v32 = v12;
    v54 = v29;
    [v12 addObject:v29];
  }
  else
  {
    v32 = v12;
    v54 = 0;
  }
  v58 = self;
  v33 = [(FLTopLevelViewModel *)self allPendingItems];
  v34 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"com.apple.followup.group.account", @"com.apple.followup.group.device", @"com.apple.followup.group.unknown", @"com.apple.followup.group.services", @"com.apple.followup.group.ndo", @"com.apple.followup.group.none", 0);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v35 = v33;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v67 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v41 = [v40 groupIdentifier];
        char v42 = [v34 containsObject:v41];

        if ((v42 & 1) == 0)
        {
          v43 = [FLGroupViewModelImpl alloc];
          v44 = [v40 groupIdentifier];
          v45 = [(FLGroupViewModelImpl *)v43 initWithIdentifier:v44];
          [v32 addObject:v45];

          v46 = [v40 groupIdentifier];
          [v34 addObject:v46];

          v47 = _FLLogSystem();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v48 = [v40 groupIdentifier];
            *(_DWORD *)buf = 138412290;
            v71 = v48;
            _os_log_impl(&dword_1BE24A000, v47, OS_LOG_TYPE_DEFAULT, "Adding dynamic group: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v37);
  }

  [(FLTopLevelViewModel *)v58 mapItems:v35 toGroups:v32 unknownGroup:v54 deviceGroup:v65 simpleAccountGrouping:v59];
  v49 = _FLLogSystem();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v32;
    _os_log_impl(&dword_1BE24A000, v49, OS_LOG_TYPE_DEFAULT, "Groups created: %@", buf, 0xCu);
  }

  unint64_t Nanoseconds = _FLSignpostGetNanoseconds(v62, v60);
  v51 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
    -[FLTopLevelViewModel _groupsForPrimaryAccount:secondaryAccounts:simpleAccountGrouping:](Nanoseconds, v62, v51);
  }

  v52 = (void *)[v32 copy];

  return v52;
}

- (void)mapItems:(id)a3 toGroups:(id)a4 unknownGroup:(id)a5 deviceGroup:(id)a6 simpleAccountGrouping:(BOOL)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = _FLLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v11;
    _os_log_impl(&dword_1BE24A000, v15, OS_LOG_TYPE_DEFAULT, "Starting to build groups from %@", buf, 0xCu);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __88__FLTopLevelViewModel_mapItems_toGroups_unknownGroup_deviceGroup_simpleAccountGrouping___block_invoke;
  v19[3] = &unk_1E637B2F8;
  BOOL v23 = a7;
  id v20 = v12;
  id v21 = v14;
  id v22 = v13;
  id v16 = v13;
  id v17 = v14;
  id v18 = v12;
  [v11 enumerateObjectsUsingBlock:v19];
}

- (NSString)localizedDeviceRowTitle
{
  return self->_localizedDeviceRowTitle;
}

- (id)allPendingItems
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE24A000, v3, OS_LOG_TYPE_DEFAULT, "allPendingItems", buf, 2u);
  }

  *(void *)buf = 0;
  v34 = buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  controller = self->_controller;
  id v32 = 0;
  v24 = [(FLFollowUpController *)controller pendingFollowUpItems:&v32];
  id v25 = v32;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __38__FLTopLevelViewModel_allPendingItems__block_invoke;
  v31[3] = &unk_1E637B140;
  v31[4] = self;
  v31[5] = buf;
  v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v31];
  v6 = [v24 filteredArrayUsingPredicate:v5];

  if (v25)
  {
    id v7 = _FLLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(FLTopLevelViewModel *)(uint64_t)v25 allPendingItems];
    }
  }
  if (v34[24]) {
    [(FLFollowUpController *)self->_controller updateBadgesForTimer];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = [v11 expirationDate];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          [(FLTopLevelViewModel *)self _removeTimerForItem:v11];
        }
        else
        {
          timersByID = self->_timersByID;
          v15 = [v11 uniqueIdentifier];
          id v16 = [(NSMutableDictionary *)timersByID objectForKeyedSubscript:v15];

          if (v16)
          {
            id v17 = self->_timersByID;
            id v18 = [v11 uniqueIdentifier];
            v19 = [(NSMutableDictionary *)v17 objectForKeyedSubscript:v18];
            id v20 = [v19 fireDate];
            id v21 = [v11 _midnightAdjustedDate];
            char v22 = [v20 isEqualToDate:v21];

            if (v22) {
              continue;
            }
            [(FLTopLevelViewModel *)self _removeTimerForItem:v11];
          }
          [(FLTopLevelViewModel *)self _configureTimerForItem:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(buf, 8);

  return obj;
}

- (void)setItemChangeHandler:(id)a3
{
}

- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[FLFollowUpController alloc] initWithClientIdentifier:v6];

  uint64_t v9 = [(FLTopLevelViewModel *)self initWithBundleIdentifier:v7 controller:v8];
  return v9;
}

- (FLTopLevelViewModel)initWithBundleIdentifier:(id)a3 controller:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)FLTopLevelViewModel;
  uint64_t v9 = [(FLTopLevelViewModel *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a4);
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    id v11 = objc_alloc_init(FLItemChangeObserver);
    observer = v10->_observer;
    v10->_observer = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    timersByID = v10->_timersByID;
    v10->_timersByID = (NSMutableDictionary *)v13;

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v10 selector:sel__updateTimerItems_ name:@"com.apple.PreferencesApp.willBecomeActive" object:0];
  }
  return v10;
}

- (id)groupsForPrimaryAccount:(id)a3 secondaryAccounts:(id)a4
{
  return [(FLTopLevelViewModel *)self _groupsForPrimaryAccount:a3 secondaryAccounts:a4 simpleAccountGrouping:0];
}

- (void)setLocalizedDeviceRowTitle:(id)a3
{
}

- (FLTopLevelViewModel)initWithIdentifier:(id)a3
{
  return [(FLTopLevelViewModel *)self initWithBundleIdentifier:0 clientIdentifier:a3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.PreferencesApp.willBecomeActive" object:0];

  v4.receiver = self;
  v4.super_class = (Class)FLTopLevelViewModel;
  [(FLTopLevelViewModel *)&v4 dealloc];
}

uint64_t __38__FLTopLevelViewModel_allPendingItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isExpired])
  {
    objc_super v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "Item expired, not returning to UI %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v5 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_13;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 24))
  {
LABEL_8:
    uint64_t v5 = 1;
    goto LABEL_13;
  }
  id v6 = [v3 targetBundleIdentifier];
  if ([v6 isEqualToString:*(void *)(*(void *)(a1 + 32) + 24)])
  {
    char v7 = [v3 displayStyle];

    if ((v7 & 8) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v8 = _FLLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_1BE24A000, v8, OS_LOG_TYPE_DEFAULT, "Item %@ did not match, discarding...", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = 0;
LABEL_13:

  return v5;
}

- (void)_updateTimerItems:(id)a3
{
  if ([(NSMutableDictionary *)self->_timersByID count])
  {
    objc_super v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BE24A000, v4, OS_LOG_TYPE_DEFAULT, "_updateItemTimers called", v5, 2u);
    }

    [(FLItemChangeObserver *)self->_observer timerUpdated];
  }
}

- (void)_configureTimerForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F1CB00]);
  id v6 = [v4 _midnightAdjustedDate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__FLTopLevelViewModel__configureTimerForItem___block_invoke;
  v12[3] = &unk_1E637B168;
  id v7 = v4;
  id v13 = v7;
  objc_copyWeak(&v14, &location);
  id v8 = (void *)[v5 initWithFireDate:v6 interval:0 repeats:v12 block:0.0];

  uint64_t v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v9 addTimer:v8 forMode:*MEMORY[0x1E4F1C3A0]];

  timersByID = self->_timersByID;
  id v11 = [v7 uniqueIdentifier];
  [(NSMutableDictionary *)timersByID setObject:v8 forKeyedSubscript:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __46__FLTopLevelViewModel__configureTimerForItem___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1BE24A000, v2, OS_LOG_TYPE_DEFAULT, "Timer fired for removing item %@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[2] timerUpdated];
    [v5[1] updateBadgesForTimer];
    id v6 = v5[4];
    id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
    [v6 setObject:0 forKeyedSubscript:v7];
  }
}

- (void)_removeTimerForItem:(id)a3
{
  timersByID = self->_timersByID;
  id v5 = a3;
  id v6 = [v5 uniqueIdentifier];
  id v9 = [(NSMutableDictionary *)timersByID objectForKeyedSubscript:v6];

  [v9 invalidate];
  id v7 = self->_timersByID;
  int v8 = [v5 uniqueIdentifier];

  [(NSMutableDictionary *)v7 setObject:0 forKeyedSubscript:v8];
}

- (void)refreshItemsForItem:(id)a3 withCompletionHandler:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13[0] = a3;
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  id v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__FLTopLevelViewModel_refreshItemsForItem_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E637B190;
  id v12 = v6;
  id v10 = v6;
  [(FLTopLevelViewModel *)self refreshItems:v9 withCompletionHandler:v11];
}

void __65__FLTopLevelViewModel_refreshItemsForItem_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = FLItemRefreshResultSuccess;
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:v5];
  (*(void (**)(uint64_t, BOOL, id))(v4 + 16))(v4, [v7 count] == 1, v6);
}

- (void)refreshItems:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FLTopLevelViewModel *)self extensionToItemMapFromItems:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E637B1B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(FLTopLevelViewModel *)self _refreshItemsWithExtensionToItemMap:v8 completion:v11];
}

void __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 predicateWithBlock:&__block_literal_global_11];
  id v11 = [v5 filteredArrayUsingPredicate:v9];

  id v10 = [v8 objectForKeyedSubscript:FLItemRefreshResultSuccess];
  [v10 addObjectsFromArray:v11];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __58__FLTopLevelViewModel_refreshItems_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 extensionIdentifier];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)extensionToItemMapFromItems:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__FLTopLevelViewModel_extensionToItemMapFromItems___block_invoke;
  v8[3] = &unk_1E637B1E0;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __51__FLTopLevelViewModel_extensionToItemMapFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [v5 extensionIdentifier];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
    [v4 addObject:v5];
  }
}

- (void)_refreshItemsWithExtensionToItemMap:(id)a3 completion:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  v33 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  dispatch_group_t v8 = dispatch_group_create();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke;
  aBlock[3] = &unk_1E637B230;
  id v28 = v7;
  id v52 = v28;
  id v9 = v5;
  id v53 = v9;
  id v29 = v6;
  id v54 = v29;
  id v10 = v8;
  v55 = v10;
  id v11 = _Block_copy(aBlock);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v34 = v9;
  id obj = [v9 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        dispatch_group_enter(v10);
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        id v18 = _FLLogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v57 = v16;
          _os_log_impl(&dword_1BE24A000, v18, OS_LOG_TYPE_DEFAULT, "Starting to refresh items for: %@", buf, 0xCu);
        }

        v19 = [[FLHeadlessExtensionLoader alloc] initWithIdentifier:v16];
        id v20 = +[FLHeadlessExtensionLoader sharedExtensionQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_29;
        block[3] = &unk_1E637B280;
        v43 = v19;
        uint64_t v44 = v16;
        CFAbsoluteTime v46 = Current;
        id v45 = v11;
        id v21 = v19;
        dispatch_async(v20, block);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
    }
    while (v13);
  }

  char v22 = dispatch_get_global_queue(25, 0);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_33;
  v36[3] = &unk_1E637B2D0;
  v36[4] = self;
  id v37 = v29;
  id v38 = v33;
  id v39 = v30;
  id v40 = v28;
  id v41 = v31;
  id v23 = v31;
  id v24 = v28;
  id v25 = v30;
  id v26 = v33;
  id v27 = v29;
  dispatch_group_notify(v10, v22, v36);
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[FLHeadlessExtensionLoader sharedExtensionQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2;
  v8[3] = &unk_1E637B208;
  uint64_t v14 = a3;
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = v5;
  id v12 = a1[6];
  id v13 = a1[7];
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[9];
  BOOL v3 = (void *)a1[5];
  if (v2 == 1) {
    id v4 = (void *)a1[4];
  }
  else {
    id v4 = (void *)a1[7];
  }
  id v5 = [v3 objectForKeyedSubscript:a1[6]];
  [v4 addObjectsFromArray:v5];

  id v6 = a1[8];

  dispatch_group_leave(v6);
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) remoteInterface];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 32) remoteInterface];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_30;
    v6[3] = &unk_1E637B258;
    id v4 = *(void **)(a1 + 48);
    v6[4] = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 56);
    id v8 = v4;
    id v7 = *(id *)(a1 + 32);
    [v3 followUpPerformUpdateWithCompletionHandler:v6];
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

uint64_t __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_30(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _FLLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56)];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BE24A000, v2, OS_LOG_TYPE_DEFAULT, "Refreshed items for %@ took %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_33(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) allPendingItems];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = objc_msgSend(v2, "fl_map:", &__block_literal_global_38);
  id v5 = [v3 setWithArray:v4];

  int v6 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_3;
  v12[3] = &unk_1E637B2A8;
  id v7 = v5;
  id v13 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  [v6 enumerateObjectsUsingBlock:v12];
  v18[0] = FLItemRefreshResultSuccess;
  v18[1] = FLItemRefreshResultFailure;
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v19[0] = *(void *)(a1 + 48);
  v19[1] = v8;
  v18[2] = FLItemRefreshResultRemoved;
  v19[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v11 = _FLLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v17 = v10;
    _os_log_impl(&dword_1BE24A000, v11, OS_LOG_TYPE_DEFAULT, "Refresh completed with result: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_2_35(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

void __70__FLTopLevelViewModel__refreshItemsWithExtensionToItemMap_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v6 uniqueIdentifier];
  LODWORD(v3) = [v3 containsObject:v4];

  uint64_t v5 = 48;
  if (v3) {
    uint64_t v5 = 40;
  }
  [*(id *)(a1 + v5) addObject:v6];
}

- (id)groups
{
  return [(FLTopLevelViewModel *)self _groupsForPrimaryAccount:0 secondaryAccounts:0 simpleAccountGrouping:1];
}

void __88__FLTopLevelViewModel_mapItems_toGroups_unknownGroup_deviceGroup_simpleAccountGrouping___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 groupIdentifier];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v6)
  {

    if (v4) {
      goto LABEL_21;
    }
    uint64_t v8 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  id v21 = v3;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v24;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v24 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
      id v12 = objc_msgSend(v11, "identifier", v21);
      int v13 = [v12 isEqualToString:v4];

      if (v13)
      {
        if (*(unsigned char *)(v22 + 56)) {
          goto LABEL_8;
        }
        id v15 = [v21 accountIdentifier];

        if (v15)
        {
          uint64_t v16 = [v11 accountID];
          objc_super v17 = [v21 accountIdentifier];
          char v18 = [v16 isEqualToString:v17];

          if (v18) {
            goto LABEL_8;
          }
        }
        else if (([v11 needsAccountID] & 1) == 0)
        {
LABEL_8:
          id v14 = v11;

          uint64_t v8 = v14;
        }
      }
      ++v10;
    }
    while (v7 != v10);
    uint64_t v19 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    uint64_t v7 = v19;
  }
  while (v19);

  if (!v4)
  {
    id v3 = v21;
LABEL_24:
    id v20 = *(void **)(v22 + 48);
LABEL_25:
    [v20 addItem:v3];

    goto LABEL_26;
  }
  id v3 = v21;
  if (v8)
  {
    id v20 = v8;
    goto LABEL_25;
  }
LABEL_21:
  [*(id *)(v22 + 40) addItem:v3];
LABEL_26:
}

+ (id)redirectURLForItem:(id)a3 withAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 groupIdentifier];
  uint64_t v9 = [v6 uniqueIdentifier];
  uint64_t v10 = [FLTopLevelViewModel alloc];
  id v11 = [v6 targetBundleIdentifier];
  id v12 = [(FLTopLevelViewModel *)v10 initWithBundleIdentifier:v11 clientIdentifier:0];

  int v13 = [(FLTopLevelViewModel *)v12 groups];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __53__FLTopLevelViewModel_redirectURLForItem_withAction___block_invoke;
  long long v23 = &unk_1E637B320;
  id v14 = v8;
  id v24 = v14;
  id v29 = a1;
  id v15 = v6;
  id v25 = v15;
  uint64_t v28 = &v30;
  id v16 = v9;
  id v26 = v16;
  id v17 = v7;
  id v27 = v17;
  [v13 enumerateObjectsUsingBlock:&v20];
  char v18 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v31[5], v20, v21, v22, v23);

  _Block_object_dispose(&v30, 8);

  return v18;
}

void __53__FLTopLevelViewModel_redirectURLForItem_withAction___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    uint64_t v9 = _FLLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v6 identifier];
      id v11 = NSNumber;
      id v12 = [v6 items];
      int v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "shouldCoalesceItems"));
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v10;
      __int16 v33 = 2112;
      v34 = v13;
      __int16 v35 = 2112;
      char v36 = v14;
      _os_log_impl(&dword_1BE24A000, v9, OS_LOG_TYPE_DEFAULT, "Group: %@ - %@ - %@", buf, 0x20u);
    }
    id v15 = *(void **)(a1 + 72);
    id v16 = [*(id *)(a1 + 40) targetBundleIdentifier];
    id v17 = [v15 _prefixFromBundleIdentifier:v16];

    if (v17)
    {
      if ([v6 shouldCoalesceItems]) {
        uint64_t v18 = *(void *)(a1 + 32);
      }
      else {
        uint64_t v18 = *(void *)(a1 + 48);
      }
      uint64_t v19 = [v17 stringByAppendingString:v18];
      uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;

      uint64_t v22 = *(void **)(a1 + 56);
      long long v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v24 = *(void *)(a1 + 48);
      if (v22)
      {
        id v25 = [v22 identifier];
        uint64_t v26 = [v23 stringByAppendingFormat:@"&itemId=%@&notificationActionId=%@&animated=true", v24, v25];
        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
        uint64_t v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;
      }
      else
      {
        uint64_t v29 = [v23 stringByAppendingFormat:@"&itemId=%@&animated=true", *(void *)(a1 + 48)];
        uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
        id v25 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = v29;
      }
    }
    *a4 = 1;
  }
}

+ (id)_prefixFromBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.Preferences"])
  {
    id v4 = FLFollowUpPreferencesUrlPrefix;
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"com.apple.Bridge"])
  {
    id v4 = FLFollowUpBridgeUrlPrefix;
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDeviceRowTitle, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)allPendingItems
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BE24A000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch pending items, not much we can do here... so lets just log it  %@", (uint8_t *)&v2, 0xCu);
}

- (void)_groupsForPrimaryAccount:(unint64_t)a1 secondaryAccounts:(uint64_t)a2 simpleAccountGrouping:(os_log_t)log .cold.1(unint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  double v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_1BE24A000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: Building groups", (uint8_t *)&v3, 0x16u);
}

- (void)_groupsForPrimaryAccount:(uint64_t)a1 secondaryAccounts:(NSObject *)a2 simpleAccountGrouping:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BE24A000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: Building groups", (uint8_t *)&v2, 0xCu);
}

@end