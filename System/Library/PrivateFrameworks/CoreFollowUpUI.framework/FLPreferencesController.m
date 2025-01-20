@interface FLPreferencesController
+ (BOOL)shouldPreflightNetworkAccessForGroup:(id)a3 item:(id)a4;
- (FLPreferencesController)init;
- (FLPreferencesController)initWithViewModel:(id)a3;
- (PSListController)listViewController;
- (id)_deferredLoadSpecifierWithName:(id)a3;
- (id)_specifierForGroup:(id)a3;
- (id)_specifierGroupString:(unint64_t)a3;
- (id)_specifiersForItem:(id)a3 group:(id)a4;
- (id)_topLevelSpecifiersForGroup:(unint64_t)a3;
- (id)_urlBasedSpecifierWithName:(id)a3;
- (id)itemChangeObserver;
- (id)spyglassSpecifiers;
- (id)topLevelSpecifiers;
- (void)_handleActionForSpecifier:(id)a3;
- (void)_presentSpecifier:(id)a3 fromEventSource:(unint64_t)a4;
- (void)_refreshItemsAndPresentDetailForSpecifier:(id)a3;
- (void)_updateSpecifier:(id)a3 withCommonPropertiesForGroup:(id)a4;
- (void)_zeroActionFailure:(id)a3;
- (void)loadSpecifier:(id)a3;
- (void)performPreferencesActionForGroup:(id)a3 item:(id)a4 action:(id)a5 completion:(id)a6;
- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4;
- (void)setItemChangeObserver:(id)a3;
- (void)setListViewController:(id)a3;
- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4;
- (void)startSpinnerForSpecifier:(id)a3;
- (void)stopSpinnerForSpecifier:(id)a3;
@end

@implementation FLPreferencesController

- (id)topLevelSpecifiers
{
  return [(FLPreferencesController *)self _topLevelSpecifiersForGroup:2];
}

- (void)setListViewController:(id)a3
{
}

- (id)_topLevelSpecifiersForGroup:(unint64_t)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v4 = _FLSignpostCreate();
  v5 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FLPreferencesController _topLevelSpecifiersForGroup:].cold.4(v4, v5);
  }

  v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(FLPreferencesController *)self _specifierGroupString:a3];
    *(_DWORD *)buf = 138412290;
    v82 = v7;
    _os_log_impl(&dword_221DA3000, v6, OS_LOG_TYPE_DEFAULT, "Building top level specifiers for %@ specifiers", buf, 0xCu);
  }
  id v64 = [MEMORY[0x263EFF980] array];
  if (self->_groups) {
    goto LABEL_22;
  }
  primaryAccountID = self->_primaryAccountID;
  self->_primaryAccountID = 0;

  secondaryAccountIDs = self->_secondaryAccountIDs;
  self->_secondaryAccountIDs = 0;

  if (a3 != 2)
  {
    v10 = [(AIDAServiceOwnersManager *)self->_serviceOwnersManager accountForService:*MEMORY[0x263F26D28]];
    v11 = [v10 identifier];
    v12 = self->_primaryAccountID;
    self->_primaryAccountID = v11;

    if (!self->_primaryAccountID)
    {
      v13 = [(AIDAServiceOwnersManager *)self->_serviceOwnersManager accountForService:*MEMORY[0x263F26D48]];
      v14 = [v13 identifier];
      v15 = self->_primaryAccountID;
      self->_primaryAccountID = v14;
    }
    v16 = [MEMORY[0x263EFB210] defaultStore];
    v17 = objc_msgSend(v16, "dmc_visibleRemoteManagementAccounts");

    if ((unint64_t)[v17 count] >= 2)
    {
      v18 = _FLLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[FLPreferencesController _topLevelSpecifiersForGroup:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    v26 = [v17 valueForKey:@"identifier"];
    v27 = self->_secondaryAccountIDs;
    self->_secondaryAccountIDs = v26;
  }
  if (objc_opt_respondsToSelector())
  {
    v28 = [(FLViewModel *)self->_topViewModel groupsForPrimaryAccount:self->_primaryAccountID secondaryAccounts:self->_secondaryAccountIDs];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      p_super = _FLLogSystem();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[FLPreferencesController _topLevelSpecifiersForGroup:]((uint64_t *)&self->_topViewModel, p_super);
      }
      goto LABEL_21;
    }
    v28 = [(FLViewModel *)self->_topViewModel groups];
  }
  p_super = &self->_groups->super;
  self->_groups = v28;
LABEL_21:

LABEL_22:
  uint64_t v59 = v4;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obj = self->_groups;
  uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  unint64_t v31 = a3;
  if (!v30) {
    goto LABEL_59;
  }
  uint64_t v32 = v30;
  int v66 = 0;
  uint64_t v71 = *(void *)v77;
  uint64_t v69 = *MEMORY[0x263F352B8];
  uint64_t v68 = *MEMORY[0x263F352C0];
  uint64_t v67 = *MEMORY[0x263F352D8];
  uint64_t v62 = *MEMORY[0x263F352E0];
  uint64_t v61 = *MEMORY[0x263F600F8];
  uint64_t v60 = *MEMORY[0x263F352E8];
  v70 = self;
  while (2)
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v77 != v71) {
        objc_enumerationMutation(obj);
      }
      v34 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      v35 = [v34 items];
      if (![v35 count]) {
        goto LABEL_55;
      }
      v36 = [v34 identifier];
      int v37 = [v36 isEqualToString:v69];

      v38 = [v34 identifier];
      int v39 = [v38 isEqualToString:v68];

      v40 = [v34 identifier];
      int v41 = [v40 isEqualToString:v67];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v37)
        {
          v42 = [v34 accountID];
          int v43 = [v42 isEqualToString:v70->_primaryAccountID];

          if (v41) {
            goto LABEL_34;
          }
        }
        else
        {
          int v43 = 0;
          if (v41)
          {
LABEL_34:
            v44 = [v34 accountID];
            int v45 = [v44 isEqualToString:v70->_primaryAccountID];

            unint64_t v31 = a3;
            goto LABEL_36;
          }
        }
      }
      else
      {
        int v43 = 0;
      }
      int v45 = 0;
LABEL_36:
      if (v31) {
        int v46 = 1;
      }
      else {
        int v46 = v43;
      }
      if (((v46 | v39) & 1) == 0 && !v45)
      {

        goto LABEL_59;
      }
      if (v31 != 1 || ((v43 | v39 | v45) & 1) == 0)
      {
        char v47 = v37 | v41;
        v66 |= v37;
        if ((v66 & 1) == 0) {
          char v47 = v39 | v37 | v41;
        }
        if ((v47 & 1) == 0)
        {
          v48 = (void *)MEMORY[0x263F5FC40];
          v49 = [v34 identifier];
          v50 = [@"FollowUps" stringByAppendingFormat:@": %@", v49];
          v51 = [v34 groupTitle];
          v52 = [v48 groupSpecifierWithID:v50 name:v51];

          v53 = [v34 identifier];
          LODWORD(v49) = [v53 isEqualToString:v62];

          if (v49)
          {
            v54 = [NSString stringWithFormat:@"%@\n%@", v60, @"Items above require approval..."];
            goto LABEL_49;
          }
          v54 = [v34 footerText];
          if (v54) {
LABEL_49:
          }
            [v52 setProperty:v54 forKey:v61];
          unint64_t v31 = a3;

          [v64 addObject:v52];
        }
        if ([v34 shouldCoalesceItems])
        {
          v55 = [(FLPreferencesController *)v70 _specifierForGroup:v34];
          [v64 addObject:v55];
        }
        else
        {
          v72[0] = MEMORY[0x263EF8330];
          v72[1] = 3221225472;
          v72[2] = __55__FLPreferencesController__topLevelSpecifiersForGroup___block_invoke;
          v72[3] = &unk_2645F2790;
          id v73 = v64;
          v74 = v70;
          v75 = v34;
          [v35 enumerateObjectsUsingBlock:v72];
          v55 = v73;
        }
      }
LABEL_55:
    }
    uint64_t v32 = [(NSArray *)obj countByEnumeratingWithState:&v76 objects:v80 count:16];
    if (v32) {
      continue;
    }
    break;
  }
LABEL_59:

  unint64_t Nanoseconds = _FLSignpostGetNanoseconds();
  v57 = _FLSignpostLogSystem();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    [(FLPreferencesController *)Nanoseconds _topLevelSpecifiersForGroup:v57];
  }

  return v64;
}

- (id)_specifierGroupString:(unint64_t)a3
{
  v3 = @"all";
  if (a3 == 1) {
    v3 = @"general";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"account";
  }
}

- (FLPreferencesController)initWithViewModel:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FLPreferencesController;
  v6 = [(FLPreferencesController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_topViewModel, a3);
    id v8 = objc_alloc(MEMORY[0x263F26D88]);
    v9 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v10 = [v8 initWithAccountStore:v9];
    serviceOwnersManager = v7->_serviceOwnersManager;
    v7->_serviceOwnersManager = (AIDAServiceOwnersManager *)v10;

    uint64_t v12 = objc_opt_new();
    generatedSpecifiersByIdentifier = v7->_generatedSpecifiersByIdentifier;
    v7->_generatedSpecifiersByIdentifier = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (void)setItemChangeObserver:(id)a3
{
  id v4 = a3;
  topViewModel = self->_topViewModel;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__FLPreferencesController_setItemChangeObserver___block_invoke;
  v7[3] = &unk_2645F2628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(FLViewModel *)topViewModel setItemChangeHandler:v7];
}

- (FLPreferencesController)init
{
  id v3 = objc_alloc(MEMORY[0x263F353B8]);
  id v4 = (void *)[v3 initWithBundleIdentifier:*MEMORY[0x263F35290] clientIdentifier:0];
  id v5 = [(FLPreferencesController *)self initWithViewModel:v4];

  return v5;
}

void __55__FLPreferencesController__topLevelSpecifiersForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _specifiersForItem:a2 group:*(void *)(a1 + 48)];
  [v2 addObjectsFromArray:v3];
}

- (id)_specifiersForItem:(id)a3 group:(id)a4
{
  v49[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F352D8]];

  if (v9)
  {
    uint64_t v10 = +[FLPreferencesFollowUpItemListSpeficierFactory detailSpecifiersForFollowUpItem:v6 target:self selector:sel__handleActionForSpecifier_];
  }
  else
  {
    int v11 = [v6 displayStyle];
    uint64_t v12 = [v6 extensionIdentifier];
    v13 = [v6 title];
    if (v12 || (v11 & 2) != 0)
    {
      uint64_t v14 = [(FLPreferencesController *)self _deferredLoadSpecifierWithName:v13];
    }
    else
    {
      uint64_t v14 = [(FLPreferencesController *)self _urlBasedSpecifierWithName:v13];
    }
    objc_super v15 = (void *)v14;

    v16 = (void *)*MEMORY[0x263F35298];
    v17 = [v6 uniqueIdentifier];
    v18 = [v16 stringByAppendingString:v17];
    [v15 setIdentifier:v18];

    if (([v6 displayStyle] & 0x10) == 0) {
      [v15 setProperty:&unk_26D45E688 forKey:*MEMORY[0x263F5FF18]];
    }
    v49[0] = v6;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
    [v15 setProperty:v19 forKey:*MEMORY[0x263F35278]];

    uint64_t v20 = [v6 representingBundlePath];
    if (v20)
    {
      uint64_t v21 = (void *)v20;
      uint64_t v22 = [v6 bundleIconName];

      if (v22)
      {
        uint64_t v23 = [v6 bundleIconName];
        [v15 setProperty:v23 forKey:*MEMORY[0x263F5FF28]];

        uint64_t v24 = (void *)MEMORY[0x263F086E0];
        uint64_t v25 = [v6 representingBundlePath];
        v26 = [v24 bundleWithPath:v25];

        v27 = _FLLogSystem();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [v6 bundleIconName];
          *(_DWORD *)buf = 138412546;
          int v46 = v28;
          __int16 v47 = 2112;
          v48 = v26;
          _os_log_impl(&dword_221DA3000, v27, OS_LOG_TYPE_DEFAULT, "Creating CFU with bundle icon: %@ <%@>", buf, 0x16u);
        }
        [v15 setupIconImageWithBundle:v26];
      }
    }
    v29 = _FLLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "displayStyle"));
      *(_DWORD *)buf = 138412290;
      int v46 = v30;
      _os_log_impl(&dword_221DA3000, v29, OS_LOG_TYPE_DEFAULT, "Creating CFU with display style: %@", buf, 0xCu);
    }
    if ((v11 & 2) != 0
      || ([MEMORY[0x263F35370] currentEnvironment],
          unint64_t v31 = objc_claimAutoreleasedReturnValue(),
          int v32 = [v31 followUpZeroActionsForTheWorld],
          v31,
          v32))
    {
      [v15 setProperty:v6 forKey:*MEMORY[0x263F352A8]];
      v33 = [v6 actions];
      v34 = [v33 firstObject];
      [v15 setProperty:v34 forKey:*MEMORY[0x263F352A0]];
    }
    v35 = [v6 extensionIdentifier];

    if (!v35)
    {
      id v36 = objc_alloc(MEMORY[0x263F353A8]);
      id v44 = v6;
      int v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
      v38 = (void *)[v36 initWithItems:v37];

      [v15 setProperty:v38 forKey:*MEMORY[0x263F352B0]];
    }
    [(FLPreferencesController *)self _updateSpecifier:v15 withCommonPropertiesForGroup:v7];
    if (v15)
    {
      int v39 = [v15 identifier];

      if (v39)
      {
        generatedSpecifiersByIdentifier = self->_generatedSpecifiersByIdentifier;
        int v41 = [v15 identifier];
        [(NSMutableDictionary *)generatedSpecifiersByIdentifier setObject:v15 forKeyedSubscript:v41];
      }
    }
    int v43 = v15;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
  }

  return v10;
}

- (id)_specifierForGroup:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v5 = [v4 items];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__FLPreferencesController__specifierForGroup___block_invoke;
  v18[3] = &unk_2645F27B8;
  v18[4] = &v19;
  [v5 enumerateObjectsUsingBlock:v18];

  if (*((unsigned char *)v20 + 24))
  {
    id v6 = [v4 rowTitle];
    id v7 = [(FLPreferencesController *)self _deferredLoadSpecifierWithName:v6];
  }
  else
  {
    id v8 = [v4 rowTitle];
    id v7 = [(FLPreferencesController *)self _urlBasedSpecifierWithName:v8];

    id v9 = objc_alloc(MEMORY[0x263F353A8]);
    uint64_t v10 = [v4 items];
    id v6 = (void *)[v9 initWithItems:v10];

    [v7 setProperty:v6 forKey:*MEMORY[0x263F352B0]];
  }

  int v11 = [v4 identifier];
  uint64_t v12 = [(id)*MEMORY[0x263F35298] stringByAppendingString:v11];
  [v7 setIdentifier:v12];

  v13 = NSNumber;
  uint64_t v14 = [v4 items];
  objc_super v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  [v7 setProperty:v15 forKey:*MEMORY[0x263F5FF18]];

  v16 = [v4 items];
  [v7 setProperty:v16 forKey:*MEMORY[0x263F35278]];

  [(FLPreferencesController *)self _updateSpecifier:v7 withCommonPropertiesForGroup:v4];
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __46__FLPreferencesController__specifierForGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 extensionIdentifier];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)_deferredLoadSpecifierWithName:(id)a3
{
  id v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:2 edit:0];
  [v3 setControllerLoadAction:sel_loadSpecifier_];

  return v3;
}

- (id)_urlBasedSpecifierWithName:(id)a3
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = a3;
  id v5 = [v3 preferenceSpecifierNamed:v4 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

  return v5;
}

- (void)_updateSpecifier:(id)a3 withCommonPropertiesForGroup:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_class();
  id v7 = [v5 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F352C0]];

  if (v8)
  {
    id v9 = [v15 propertyForKey:*MEMORY[0x263F35278]];
    if ([v9 count] == 1)
    {
      uint64_t v10 = [v9 firstObject];
      int v11 = [v10 informativeFooterText];

      if (v11)
      {
        int v11 = [v10 informativeFooterText];
      }
      if ([v10 displayExpirationDate])
      {
        uint64_t v12 = [v10 formattedExpirationDate];

        int v11 = (void *)v12;
      }

      if (!v11) {
        goto LABEL_11;
      }
    }
    else
    {
      int v11 = [v5 subtitleText];
      if (!v11)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    uint64_t v6 = objc_opt_class();
    [v15 setProperty:v11 forKey:*MEMORY[0x263F602C8]];
    goto LABEL_11;
  }
LABEL_12:
  v13 = v15;
  if (v6)
  {
    [v15 setProperty:v6 forKey:*MEMORY[0x263F5FFE0]];
    v13 = v15;
  }
  [v13 setProperty:&unk_26D45E6A0 forKey:*MEMORY[0x263F5FEE8]];
  uint64_t v14 = [v5 rowTitle];
  [v15 setProperty:v14 forKey:*MEMORY[0x263F602D0]];

  [v15 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
}

- (id)spyglassSpecifiers
{
  if (!self->_spyglassAllowList)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"verifyPrimaryEmail", @"com.apple.AAFollowUpIdentifier.StartUsing", @"com.apple.AAFollowUpIdentifier.VerifyTerms", 0);
    id v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    spyglassAllowList = self->_spyglassAllowList;
    self->_spyglassAllowList = v3;
  }
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSSet count](self->_spyglassAllowList, "count"));
  uint64_t v6 = [(FLViewModel *)self->_topViewModel allPendingItems];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__FLPreferencesController_spyglassSpecifiers__block_invoke;
  v19[3] = &unk_2645F2718;
  v19[4] = self;
  id v7 = v5;
  id v20 = v7;
  [v6 enumerateObjectsUsingBlock:v19];
  int v8 = [v7 allKeys];
  if ([v8 containsObject:@"verifyPrimaryEmail"])
  {
    id v9 = @"verifyPrimaryEmail";
    goto LABEL_9;
  }
  if ([v8 containsObject:@"com.apple.AAFollowUpIdentifier.StartUsing"])
  {
    id v9 = @"com.apple.AAFollowUpIdentifier.StartUsing";
    goto LABEL_9;
  }
  if ([v8 containsObject:@"com.apple.AAFollowUpIdentifier.VerifyTerms"])
  {
    id v9 = @"com.apple.AAFollowUpIdentifier.VerifyTerms";
LABEL_9:
    uint64_t v10 = [v7 valueForKey:v9];
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  if (![v8 count])
  {
    uint64_t v10 = 0;
    goto LABEL_18;
  }
  v17 = [v8 firstObject];
  uint64_t v10 = [v7 valueForKey:v17];

  if (!v10) {
    goto LABEL_18;
  }
LABEL_10:
  if (!self->_spyglassController)
  {
    int v11 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
    spyglassController = self->_spyglassController;
    self->_spyglassController = v11;

    v13 = [(FLPreferencesController *)self listViewController];
    [(FLPreferencesFollowUpItemListViewController *)self->_spyglassController setPresentationContext:v13];
  }
  uint64_t v14 = [v10 actions];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [(FLPreferencesFollowUpItemListViewController *)self->_spyglassController detailSpecifiersForFollowUpItem:v10];
    goto LABEL_19;
  }
LABEL_18:
  v16 = (void *)MEMORY[0x263EFFA68];
LABEL_19:

  return v16;
}

void __45__FLPreferencesController_spyglassSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  id v8 = v3;
  id v5 = [v3 uniqueIdentifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4 || ([v8 displayStyle] & 4) != 0)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = [v8 uniqueIdentifier];
    [v6 setObject:v8 forKey:v7];
  }
}

- (void)loadSpecifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL activityIndicatorActive = self->_activityIndicatorActive;
  uint64_t v6 = _FLLogSystem();
  id v7 = v6;
  if (activityIndicatorActive)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[FLPreferencesController loadSpecifier:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v4;
      _os_log_impl(&dword_221DA3000, v7, OS_LOG_TYPE_DEFAULT, "Loading specifier: %@", buf, 0xCu);
    }

    [(FLPreferencesController *)self startSpinnerForSpecifier:v4];
    id v7 = [v4 propertyForKey:*MEMORY[0x263F35278]];
    uint64_t v15 = [v7 firstObject];
    v16 = [v15 groupIdentifier];
    int v17 = [v16 isEqualToString:*MEMORY[0x263F352B8]];

    if (v17)
    {
      v18 = [FLNetworkStatePrompter alloc];
      uint64_t v19 = [(FLPreferencesController *)self listViewController];
      id v20 = [(FLNetworkStatePrompter *)v18 initWithPresenter:v19];

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __41__FLPreferencesController_loadSpecifier___block_invoke;
      v21[3] = &unk_2645F2740;
      v21[4] = self;
      id v22 = v4;
      [(FLNetworkStatePrompter *)v20 preflightNetworkStateWithCompletionHandler:v21];
    }
    else
    {
      [(FLPreferencesController *)self _refreshItemsAndPresentDetailForSpecifier:v4];
    }
  }
}

uint64_t __41__FLPreferencesController_loadSpecifier___block_invoke(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (a2) {
    return [v3 _refreshItemsAndPresentDetailForSpecifier:v4];
  }
  else {
    return [v3 stopSpinnerForSpecifier:v4];
  }
}

- (void)_refreshItemsAndPresentDetailForSpecifier:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _FLLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_221DA3000, v5, OS_LOG_TYPE_DEFAULT, "Starting to refresh items for specifier: %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 propertyForKey:*MEMORY[0x263F35278]];
  topViewModel = self->_topViewModel;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke;
  v9[3] = &unk_2645F27E0;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(FLViewModel *)topViewModel refreshItems:v6 withCompletionHandler:v9];
}

void __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke_2;
  block[3] = &unk_2645F24E8;
  id v4 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__FLPreferencesController__refreshItemsAndPresentDetailForSpecifier___block_invoke_2(id *a1)
{
  [a1[4] stopSpinnerForSpecifier:a1[5]];
  id v10 = [a1[6] objectForKeyedSubscript:*MEMORY[0x263F352F0]];
  if ([v10 count])
  {
    id v2 = a1[5];
    id v3 = [a1[5] identifier];

    if (v3)
    {
      id v4 = (void *)*((void *)a1[4] + 6);
      id v5 = [a1[5] identifier];
      uint64_t v6 = [v4 objectForKeyedSubscript:v5];
      id v7 = v6;
      if (!v6) {
        id v7 = a1[5];
      }
      id v8 = v7;

      id v2 = v8;
    }
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F353A8]) initWithItems:v10];
    [v2 setProperty:v9 forKey:*MEMORY[0x263F352B0]];
    [a1[4] _presentSpecifier:v2 fromEventSource:3];
  }
  else
  {
    [a1[4] _handleEmptyRefreshResult:a1[6]];
  }
}

- (void)_presentSpecifier:(id)a3 fromEventSource:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = _FLLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a4;
    _os_log_impl(&dword_221DA3000, v7, OS_LOG_TYPE_DEFAULT, "Presenting specifier: %@ with eventSource: %lu", buf, 0x16u);
  }

  id v8 = [v6 propertyForKey:*MEMORY[0x263F352A8]];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F353B0] sharedTelemetryController];
    [v9 captureItemView:v8];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v21 = __Block_byref_object_copy__2;
    id v22 = __Block_byref_object_dispose__2;
    uint64_t v23 = objc_alloc_init(FLSpecifierTapHandler);
    [*(id *)(*(void *)&buf[8] + 40) setDelegate:self];
    id v10 = *(void **)(*(void *)&buf[8] + 40);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke;
    v17[3] = &unk_2645F2808;
    v17[4] = self;
    id v18 = v8;
    uint64_t v19 = buf;
    [v10 actionTapped:v6 eventSource:a4 withCompletionHandler:v17];

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v11 = [v6 propertyForKey:*MEMORY[0x263F35278]];
    [v11 enumerateObjectsUsingBlock:&__block_literal_global_2];
    id v12 = [(FLPreferencesController *)self listViewController];
    uint64_t v13 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
    [(FLPreferencesFollowUpItemListViewController *)v13 setSpecifier:v6];
    [(FLPreferencesFollowUpItemListViewController *)v13 setParentController:v12];
    uint64_t v14 = [v12 splitViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v16 = [v12 splitViewController];
      [v16 showInitialViewController:v13];
    }
    else
    {
      [v12 showController:v13];
    }
  }
}

void __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _zeroActionFailure:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __61__FLPreferencesController__presentSpecifier_fromEventSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F353B0];
  id v3 = a2;
  id v4 = [v2 sharedTelemetryController];
  [v4 captureItemView:v3];
}

- (void)_handleActionForSpecifier:(id)a3
{
}

- (void)_zeroActionFailure:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F35370] currentEnvironment];
  int v6 = [v5 isInternal];

  if (v6)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __46__FLPreferencesController__zeroActionFailure___block_invoke;
    v16 = &unk_2645F2650;
    id v17 = v4;
    id v7 = +[FLAlertControllerAction actionWithTitle:@"Tap-To-Radar" style:1 handler:&v13];
    v18[0] = v7;
    id v8 = +[FLAlertControllerAction actionWithTitle:@"Dismiss", 0, 0, v13, v14, v15, v16 style handler];
    v18[1] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    id v10 = [NSString stringWithFormat:@"Follow Up Error [INTERNAL]"];
    uint64_t v11 = [NSString stringWithFormat:@"Did you notice an error? If so, file a radar."];
    id v12 = [(FLPreferencesController *)self listViewController];
    +[FLAlertControllerHelper presentAlertWithTitle:v10 message:v11 actions:v9 presentingController:v12];
  }
}

void __46__FLPreferencesController__zeroActionFailure___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F353C0];
  id v2 = NSString;
  id v4 = [*(id *)(a1 + 32) clientIdentifier];
  id v3 = [v2 stringWithFormat:@"CFU access failure: %@", v4];
  [v1 tapToRadarWithTitle:v3 initialMessage:0];
}

- (void)startPresentingForHandler:(id)a3 withRemoteController:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = _FLLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_221DA3000, v6, OS_LOG_TYPE_DEFAULT, "Start presenting identifier: %@", (uint8_t *)&v8, 0xCu);
  }

  [v5 setModalPresentationStyle:5];
  id v7 = [(FLPreferencesController *)self listViewController];
  [v7 presentViewController:v5 animated:1 completion:0];
}

- (void)preflightNetworkConnectivityForHandler:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  int v6 = [FLNetworkStatePrompter alloc];
  id v7 = [(FLPreferencesController *)self listViewController];
  int v8 = [(FLNetworkStatePrompter *)v6 initWithPresenter:v7];

  [(FLNetworkStatePrompter *)v8 preflightNetworkStateWithCompletionHandler:v5];
}

uint64_t __49__FLPreferencesController_setItemChangeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)startSpinnerForSpecifier:(id)a3
{
  self->_BOOL activityIndicatorActive = 1;
  objc_msgSend(a3, "fl_startSpinner");
}

- (void)stopSpinnerForSpecifier:(id)a3
{
  self->_BOOL activityIndicatorActive = 0;
  id v4 = a3;
  objc_msgSend(v4, "fl_stopSpinner");
  id v7 = [(FLPreferencesController *)self listViewController];
  id v5 = [v7 table];
  int v6 = [v7 indexPathForSpecifier:v4];

  [v5 deselectRowAtIndexPath:v6 animated:0];
}

- (void)performPreferencesActionForGroup:(id)a3 item:(id)a4 action:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = v12 != 0;
  if (!v12) {
    [v10 shouldCoalesceItems];
  }
  uint64_t v15 = [v10 identifier];
  uint64_t v16 = *MEMORY[0x263F352D8];
  char v17 = [v15 isEqualToString:*MEMORY[0x263F352D8]];

  id v44 = (void (**)(void, void))v13;
  if (v11)
  {
    unint64_t v18 = [v11 displayStyle];
    if (v12)
    {
      uint64_t v19 = (v18 >> 1) & 1;
LABEL_7:
      int v20 = objc_msgSend(v10, "shouldCoalesceItems", v12);
      goto LABEL_12;
    }
    if ((v18 & 2) != 0)
    {
      uint64_t v21 = [v11 actions];
      uint64_t v43 = [v21 firstObject];

      LOBYTE(v19) = 1;
      int v20 = objc_msgSend(v10, "shouldCoalesceItems", v43);
      goto LABEL_12;
    }
    LOBYTE(v19) = 0;
  }
  else
  {
    LOBYTE(v19) = 0;
    if (v12) {
      goto LABEL_7;
    }
  }
  int v20 = objc_msgSend(v10, "shouldCoalesceItems", 0);
LABEL_12:
  if (v20)
  {
    id v22 = [v10 items];
    char v23 = objc_msgSend(v22, "na_any:", &__block_literal_global_89);

    if (v23)
    {
      BOOL v14 = 0;
LABEL_20:
      objc_initWeak(location, self->_topViewModel);
      v28 = (void *)MEMORY[0x263F58190];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2;
      v57[3] = &unk_2645F2898;
      id v29 = v11;
      id v58 = v29;
      id v30 = v10;
      id v59 = v30;
      char v61 = v17;
      objc_copyWeak(&v60, location);
      unint64_t v31 = [v28 lazyFutureWithBlock:v57];
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__2;
      v55[4] = __Block_byref_object_dispose__2;
      id v56 = 0;
      if (v14)
      {
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_4;
        v47[3] = &unk_2645F2988;
        v50 = v55;
        id v48 = v29;
        int v32 = v42;
        id v49 = v42;
        [v31 flatMap:v47];
        v34 = v33 = v44;
        v35 = &v48;
        id v36 = v49;
      }
      else
      {
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_94;
        v51[3] = &unk_2645F28E8;
        v52[0] = v30;
        v52[1] = self;
        id v53 = v29;
        v33 = v44;
        v54 = v44;
        [v31 flatMap:v51];
        v34 = int v32 = v42;
        v35 = (id *)v52;

        id v36 = v53;
      }

      v45[0] = MEMORY[0x263EF8330];
      v45[1] = 3221225472;
      v45[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_8;
      v45[3] = &unk_2645F29B0;
      int v46 = v33;
      id v38 = (id)[v34 addCompletionBlock:v45];

      _Block_object_dispose(v55, 8);
      objc_destroyWeak(&v60);

      objc_destroyWeak(location);
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v24 = [v10 identifier];
    char v25 = [v24 isEqualToString:v16];

    if (v25) {
      goto LABEL_20;
    }
    v26 = [v11 extensionIdentifier];
    char v27 = v26 ? 1 : v19;

    BOOL v14 = v19;
    if (v27) {
      goto LABEL_20;
    }
  }
  if ([v10 shouldCoalesceItems])
  {
    int v37 = [(FLPreferencesController *)self _specifierForGroup:v10];
  }
  else
  {
    int v39 = [(FLPreferencesController *)self _specifiersForItem:v11 group:v10];
    int v37 = [v39 lastObject];
  }
  int v32 = v42;
  v33 = v44;
  v40 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
  [(FLPreferencesFollowUpItemListViewController *)v40 setSpecifier:v37];
  int v41 = [[FLPreferencesTapActionResult alloc] initWithViewControllerToPresent:v40 presentationStyle:0];
  ((void (**)(void, FLPreferencesTapActionResult *))v33)[2](v33, v41);

LABEL_28:
}

BOOL __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 extensionIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    id v4 = _FLLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if ([*(id *)(a1 + 40) shouldCoalesceItems])
  {
    uint64_t v12 = [*(id *)(a1 + 40) items];
LABEL_9:
    id v13 = (void *)v12;
    goto LABEL_10;
  }
  if (*(void *)(a1 + 32))
  {
    v17[0] = *(void *)(a1 + 32);
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    goto LABEL_9;
  }
  id v13 = (void *)MEMORY[0x263EFFA68];
LABEL_10:
  if (*(unsigned char *)(a1 + 56))
  {
    [v3 finishWithResult:v13];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_92;
    v15[3] = &unk_2645F2870;
    id v16 = v3;
    [WeakRetained refreshItems:v13 withCompletionHandler:v15];
  }
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:*MEMORY[0x263F352F0]];
  uint64_t v6 = v5;
  if (v10)
  {
    [*(id *)(a1 + 32) finishWithError:v10];
  }
  else
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 finishWithResult:v6];
    }
    else
    {
      uint64_t v9 = FLError();
      [v8 finishWithError:v9];
    }
  }
}

id __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_3;
  v11[3] = &unk_2645F28C0;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v15 = v3;
  id v16 = *(id *)(a1 + 56);
  id v8 = v3;
  uint64_t v9 = [v4 lazyFutureWithBlock:v11];

  return v9;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_3(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) shouldCoalesceItems];
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v8 = [v3 _specifierForGroup:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = [v3 _specifiersForItem:*(void *)(a1 + 48) group:*(void *)(a1 + 32)];
    id v8 = [v4 lastObject];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F353A8]) initWithItems:*(void *)(a1 + 56)];
  [v8 setProperty:v5 forKey:*MEMORY[0x263F352B0]];
  uint64_t v6 = objc_alloc_init(FLPreferencesFollowUpItemListViewController);
  [(FLPreferencesFollowUpItemListViewController *)v6 setSpecifier:v8];
  uint64_t v7 = [[FLPreferencesTapActionResult alloc] initWithViewControllerToPresent:v6 presentationStyle:0];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

id __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_4(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x263F58190];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_5;
  v5[3] = &unk_2645F2960;
  uint64_t v8 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 lazyFutureWithBlock:v5];

  return v3;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[FLHeadlessActionHandler handlerWithItem:a1[4]];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  id v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_6;
  v17[3] = &unk_2645F2910;
  id v8 = v3;
  id v18 = v8;
  uint64_t v19 = v20;
  [v7 setExtensionRequestedViewControllerPresentation:v17];
  uint64_t v9 = a1[5];
  id v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_7;
  v13[3] = &unk_2645F2938;
  id v15 = v20;
  id v11 = v8;
  uint64_t v12 = a1[6];
  id v14 = v11;
  uint64_t v16 = v12;
  [v10 handleAction:v9 completion:v13];

  _Block_object_dispose(v20, 8);
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[FLPreferencesTapActionResult alloc] initWithViewControllerToPresent:v3 presentationStyle:1];

  [*(id *)(a1 + 32) finishWithResult:v4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_7(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v2 = [[FLPreferencesTapActionResult alloc] initWithViewControllerToPresent:0 presentationStyle:1];
    [*(id *)(a1 + 32) finishWithResult:v2];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = [[FLPreferencesTapActionResult alloc] initWithViewControllerToPresent:0 presentationStyle:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

+ (BOOL)shouldPreflightNetworkAccessForGroup:(id)a3 item:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F352B8]];

  if (v8)
  {
    if (v6) {
      unint64_t v9 = ((unint64_t)[v6 displayStyle] >> 1) & 1;
    }
    else {
      LOBYTE(v9) = 0;
    }
    if ([v5 shouldCoalesceItems])
    {
      id v10 = [v5 items];
      LOBYTE(v9) = objc_msgSend(v10, "na_any:", &__block_literal_global_100);
    }
    else
    {
      id v10 = [v6 extensionIdentifier];
      if (v10) {
        LOBYTE(v9) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

BOOL __69__FLPreferencesController_shouldPreflightNetworkAccessForGroup_item___block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 extensionIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PSListController)listViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listViewController);

  return (PSListController *)WeakRetained;
}

- (id)itemChangeObserver
{
  return self->_itemChangeObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemChangeObserver, 0);
  objc_destroyWeak((id *)&self->_listViewController);
  objc_storeStrong((id *)&self->_secondaryAccountIDs, 0);
  objc_storeStrong((id *)&self->_primaryAccountID, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_generatedSpecifiersByIdentifier, 0);
  objc_storeStrong((id *)&self->_spyglassAllowList, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_spyglassController, 0);

  objc_storeStrong((id *)&self->_topViewModel, 0);
}

- (void)_topLevelSpecifiersForGroup:(os_log_t)log .cold.1(unint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 2048;
  double v6 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_221DA3000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: GenerateTopSpecifiers", (uint8_t *)&v3, 0x16u);
}

- (void)_topLevelSpecifiersForGroup:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_221DA3000, a2, OS_LOG_TYPE_ERROR, "Unhandled state, no method of obtaining groups from %@", (uint8_t *)&v3, 0xCu);
}

- (void)_topLevelSpecifiersForGroup:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_topLevelSpecifiersForGroup:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221DA3000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: GenerateTopSpecifiers", (uint8_t *)&v2, 0xCu);
}

- (void)loadSpecifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__FLPreferencesController_performPreferencesActionForGroup_item_action_completion___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end