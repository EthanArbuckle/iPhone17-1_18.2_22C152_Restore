@interface CNFRegListController
- (BOOL)_handleURLDictionary:(id)a3;
- (BOOL)_showWiFiAlertIfNecessary;
- (BOOL)appeared;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldRerootPreferences;
- (BOOL)shouldSelectResponderOnAppearance;
- (BOOL)showingChildController;
- (BOOL)wantsWiFiChooser;
- (CNFRegController)regController;
- (CNFRegListController)initWithParentController:(id)a3;
- (CNFRegListController)initWithRegController:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_existingLabelForSection:(int64_t)a3 header:(BOOL)a4;
- (id)_existingLabelForSpecifier:(id)a3 header:(BOOL)a4;
- (id)appearBlock;
- (id)customTitle;
- (id)logName;
- (id)specifierList;
- (id)specifiers;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_performAppearBlock;
- (void)_setLabel:(id)a3 forSpecifier:(id)a4 header:(BOOL)a5;
- (void)_setSpecifierEnabled:(id)a3 enabled:(BOOL)a4 animated:(BOOL)a5;
- (void)_setupEventHandlers;
- (void)_updateExistingLabelForSpecifier:(id)a3 header:(BOOL)a4;
- (void)_updateTableLabel:(id)a3 withTableView:(id)a4 isTopMostHeader:(BOOL)a5;
- (void)_updateTitle;
- (void)applicationDidResume;
- (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4;
- (void)changePasswordControllerDidCancel:(id)a3;
- (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)dealloc;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)removeAllHandlers;
- (void)setAppearBlock:(id)a3;
- (void)setRegController:(id)a3;
- (void)setShouldRerootPreferences:(BOOL)a3;
- (void)setShowingChildController:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)showAuthKitSignInIfNecessary;
- (void)systemApplicationDidBecomeActive;
- (void)systemApplicationDidEnterBackground;
- (void)systemApplicationDidResume;
- (void)systemApplicationDidSuspend;
- (void)systemApplicationWillEnterForeground;
- (void)systemApplicationWillResignActive;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegListController

- (CNFRegListController)initWithRegController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegListController;
  v5 = [(CNFRegListController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(CNFRegListController *)v5 setRegController:v4];
    if ((unint64_t)(CNFRegGlobalAppearanceStyle() - 5) <= 1) {
      [(CNFRegListController *)v6 setEdgeToEdgeCells:1];
    }
  }

  return v6;
}

- (CNFRegListController)initWithParentController:(id)a3
{
  id v4 = a3;
  v5 = [v4 regController];
  v6 = [(CNFRegListController *)self initWithRegController:v5];

  if (v6)
  {
    v7 = [v4 rootController];
    [(CNFRegListController *)v6 setRootController:v7];

    [(CNFRegListController *)v6 setParentController:v4];
    objc_super v8 = [v4 specifier];
    [(CNFRegListController *)v6 setSpecifier:v8];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F4A868] sharedInstance];
  [v3 removeListener:self];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [(CNFRegListController *)self _existingLabelForSpecifier:v9 header:1];
        [v10 clearSpecifier];
        v11 = [(CNFRegListController *)self _existingLabelForSpecifier:v9 header:0];
        [v11 clearSpecifier];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v12 dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v11 setSpecifier:v5];
  uint64_t v6 = [(CNFRegListController *)self regController];

  if (!v6)
  {
    uint64_t v7 = [v5 propertyForKey:@"ft-serviceType"];
    objc_super v8 = +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", [v7 integerValue]);
    [(CNFRegListController *)self setRegController:v8];
  }
  uint64_t v9 = [(CNFRegListController *)self regController];

  if (!v9)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CNFRegListController.m" lineNumber:100 description:@"Did not have a registration controller after setting specifier"];
  }
}

- (id)specifiers
{
  v3 = [(CNFRegListController *)self specifierList];
  [(CNFRegListController *)self _updateTitle];
  return v3;
}

- (id)specifierList
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegListController;
  v2 = [(CNFRegListController *)&v4 specifiers];
  return v2;
}

- (id)customTitle
{
  return 0;
}

- (void)_updateTitle
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = [(CNFRegListController *)self customTitle];
  if (v3)
  {
    objc_super v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v3;
      _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Setting custom title: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v5 = v3;
      IMLogString();
    }
    -[CNFRegListController setTitle:](self, "setTitle:", v3, v5);
  }
}

- (void)setAppearBlock:(id)a3
{
  id v4 = a3;
  if (self->_appearBlock != v4)
  {
    id v7 = v4;
    id v5 = (void *)[v4 copy];
    id appearBlock = self->_appearBlock;
    self->_id appearBlock = v5;

    id v4 = v7;
    if (v7)
    {
      if (self->_appeared)
      {
        [(CNFRegListController *)self performSelector:sel__performAppearBlock withObject:0 afterDelay:0.0];
        id v4 = v7;
      }
    }
  }
}

- (void)_performAppearBlock
{
  uint64_t v4 = [(CNFRegListController *)self appearBlock];
  [(CNFRegListController *)self setAppearBlock:0];
  v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v3 = (void *)v4;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(CNFRegListController *)self regController];
  BOOL v6 = CNFRegCurrentStringTableMatchesType([v5 serviceType]);

  if (!v6)
  {
    id v7 = [(CNFRegListController *)self regController];
    CNFRegSetStringTableForServiceType([v7 serviceType]);

    [(CNFRegListController *)self reloadSpecifiers];
    uint64_t v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEBUG, "CNFRegListController: ViewWillAppear: Updating the string table and reloading specifiers.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v14 viewWillAppear:v3];
  uint64_t v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = @"not ";
    if (v3) {
      v10 = &stru_26D05D4F8;
    }
    *(_DWORD *)buf = 138412290;
    long long v16 = v10;
    _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEBUG, "View will appear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_super v11 = @"not ";
    if (v3) {
      objc_super v11 = &stru_26D05D4F8;
    }
    long long v13 = v11;
    IMLogString();
  }
  if ([(CNFRegListController *)self wantsWiFiChooser])
  {
    objc_super v12 = [(CNFRegListController *)self regController];
    [v12 startRequiringWifi];
  }
  [(CNFRegListController *)self setShowingChildController:0];
  self->_appeared = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewDidAppear:](&v12, sel_viewDidAppear_);
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEBUG, "View did appear, adding listener", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v6 = [MEMORY[0x263F4A868] sharedInstance];
  if (([v6 isActive] & 1) == 0) {
    [v6 setActive:1];
  }
  [v6 addListener:self];
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = @"not ";
    if (v3) {
      uint64_t v8 = &stru_26D05D4F8;
    }
    *(_DWORD *)buf = 138412290;
    objc_super v14 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEBUG, "View did appear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v9 = @"not ";
    if (v3) {
      uint64_t v9 = &stru_26D05D4F8;
    }
    objc_super v11 = v9;
    IMLogString();
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])
    && [(CNFRegListController *)self shouldRerootPreferences])
  {
    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:*MEMORY[0x263F60218] object:0];
    [(CNFRegListController *)self setShouldRerootPreferences:0];
  }
  [(CNFRegListController *)self _performAppearBlock];
  self->_appeared = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewWillDisappear:](&v12, sel_viewWillDisappear_);
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEBUG, "View will disappear, removing listener", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v6 = [MEMORY[0x263F4A868] sharedInstance];
  [v6 removeListener:self];

  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = @"not ";
    if (v3) {
      uint64_t v8 = &stru_26D05D4F8;
    }
    *(_DWORD *)buf = 138412290;
    objc_super v14 = v8;
    _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEBUG, "View will disappear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v9 = @"not ";
    if (v3) {
      uint64_t v9 = &stru_26D05D4F8;
    }
    objc_super v11 = v9;
    IMLogString();
  }
  if ([(CNFRegListController *)self wantsWiFiChooser])
  {
    v10 = [(CNFRegListController *)self regController];
    [v10 stopRequiringWifi];
  }
  [(CNFRegListController *)self setAppearBlock:0];
  self->_appeared = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = @"not ";
    if (v3) {
      BOOL v6 = &stru_26D05D4F8;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEBUG, "View did disappear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  self->_appeared = 0;
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v3 applicationDidResume];
  [(CNFRegListController *)self _performAppearBlock];
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 0;
}

- (void)systemApplicationDidEnterBackground
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidEnterBackground", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)systemApplicationWillEnterForeground
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationWillEnterForeground", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)systemApplicationDidBecomeActive
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidBecomeActive", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)systemApplicationWillResignActive
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationWillResignActive", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)systemApplicationDidSuspend
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidSuspend", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (void)systemApplicationDidResume
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v3 = 0;
    _os_log_impl(&dword_21ED18000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidResume", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog()) {
      IMLogString();
    }
  }
}

- (BOOL)_showWiFiAlertIfNecessary
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  objc_super v3 = [(CNFRegListController *)self regController];
  uint64_t v4 = [v3 serviceType];

  if (!v4 || v4 == 2)
  {
    BOOL v5 = 0;
    BOOL v6 = @"com.apple.facetime";
  }
  else
  {
    BOOL v5 = v4 != 1;
    if (v4 == 1) {
      BOOL v6 = @"com.apple.MobileSMS";
    }
    else {
      BOOL v6 = 0;
    }
  }
  objc_super v7 = [(CNFRegListController *)self regController];
  if ([v7 deviceCanTakeNetworkAction])
  {
    if (v5)
    {
LABEL_13:
      BOOL v10 = 0;
      goto LABEL_33;
    }
    uint64_t v8 = [(CNFRegListController *)self regController];
    if ([v8 serviceType] == 1)
    {
LABEL_12:

      goto LABEL_13;
    }
    uint64_t v9 = [MEMORY[0x263F3BB18] sharedInstance];
    if ([v9 nonWifiAvailableForBundleId:v6])
    {

      goto LABEL_12;
    }
    objc_super v11 = [MEMORY[0x263F3BB18] sharedInstance];
    char v12 = [v11 wifiAllowedForBundleId:v6];

    if (v12) {
      goto LABEL_13;
    }
  }
  long long v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v14 = [MEMORY[0x263F3BB18] sharedInstance];
    if ([v14 nonWifiAvailableForBundleId:v6]) {
      uint64_t v15 = @"YES";
    }
    else {
      uint64_t v15 = @"NO";
    }
    long long v16 = [MEMORY[0x263F3BB18] sharedInstance];
    if ([v16 wifiAllowedForBundleId:v6]) {
      uint64_t v17 = @"YES";
    }
    else {
      uint64_t v17 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Showing alert nonWifiAvailableForBUndleID:%@ %@, wifiAllowedForBUndleID %@", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    uint64_t v18 = [MEMORY[0x263F3BB18] sharedInstance];
    if ([v18 nonWifiAvailableForBundleId:v6]) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    v20 = [MEMORY[0x263F3BB18] sharedInstance];
    if ([v20 wifiAllowedForBundleId:v6]) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    v24 = v19;
    v25 = v21;
    v23 = v6;
    IMLogString();
  }
  objc_msgSend(v7, "showNetworkAlert:", self, v23, v24, v25);
  BOOL v10 = 1;
LABEL_33:

  return v10;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  if (![(CNFRegListController *)self _handleURLDictionary:v4])
  {
    v5.receiver = self;
    v5.super_class = (Class)CNFRegListController;
    [(CNFRegListController *)&v5 handleURL:v4];
  }
}

- (BOOL)_handleURLDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v15 = v4;
  char v14 = 0;
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + (int)*MEMORY[0x263F5FE40]));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_super v7 = [WeakRetained methodSignatureForSelector:sel__cnfreg_overrideForController_withDictionary_];
      uint64_t v8 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v7];
      long long v13 = self;
      [v8 setTarget:WeakRetained];
      [v8 setSelector:sel__cnfreg_overrideForController_withDictionary_];
      [v8 setArgument:&v13 atIndex:2];
      [v8 setArgument:&v15 atIndex:3];
      [v8 invoke];
      [v8 getReturnValue:&v14];
      uint64_t v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v14) {
          BOOL v10 = @"YES";
        }
        else {
          BOOL v10 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v10;
        __int16 v18 = 2112;
        id v19 = v15;
        _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEFAULT, "Handling url dictionary {%@} : %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
    }
    id v4 = v15;
    BOOL v11 = v14 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)changePasswordControllerDidCancel:(id)a3
{
}

- (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v10 length] && objc_msgSend(v11, "length"))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v21 = self;
    char v12 = [(CNFRegListController *)self regController];
    long long v13 = [v12 appleIDAccounts];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          __int16 v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v19 = [v18 loginDisplayString];
          int v20 = [v19 isEqualToString:v9];

          if (v20) {
            [v18 updateAuthorizationCredentials:v10 token:v11];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }

    self = v21;
  }
  [(CNFRegListController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4
{
}

- (BOOL)wantsWiFiChooser
{
  return ![(CNFRegListController *)self showingChildController];
}

- (id)logName
{
  return @"RegList";
}

- (void)_setSpecifierEnabled:(id)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a4;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F600A8];
  id v12 = v6;
  uint64_t v8 = [v6 propertyForKey:*MEMORY[0x263F600A8]];
  id v9 = v8;
  if (!v8 || [v8 BOOLValue] != v5)
  {
    id v10 = [NSNumber numberWithBool:v5];
    [v12 setProperty:v10 forKey:v7];
    id v11 = [v12 propertyForKey:*MEMORY[0x263F602B0]];
    [v11 setCellEnabled:v5];
    [v11 setNeedsDisplay];
  }
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v20 loadView];
  objc_super v3 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v3 styleUsesCustomTableStyle])
  {
    id v4 = [v3 tableBackgroundColor];

    BOOL v5 = (int *)MEMORY[0x263F5FDD0];
    if (v4)
    {
      id v6 = [v3 tableBackgroundColor];
      uint64_t v7 = *v5;
      [*(id *)((char *)&self->super.super.super.super.super.isa + v7) setBackgroundColor:v6];

      [*(id *)((char *)&self->super.super.super.super.super.isa + v7) setBackgroundView:0];
    }
    if ([v3 styleUsesCustomSeparatorStyle])
    {
      uint64_t v8 = *v5;
      [*(id *)((char *)&self->super.super.super.super.super.isa + v8) _setDrawsTopShadowInGroupedSections:0];
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "setSeparatorStyle:", objc_msgSend(v3, "tableSeparatorStyle"));
      id v9 = [v3 tableSeparatorColor];

      if (v9)
      {
        id v10 = [v3 tableSeparatorColor];
        [*(id *)((char *)&self->super.super.super.super.super.isa + v8) setSeparatorColor:v10];
      }
      id v11 = [v3 tableSeparatorTopShadowColor];

      if (v11)
      {
        id v12 = [v3 tableSeparatorTopShadowColor];
        [*(id *)((char *)&self->super.super.super.super.super.isa + v8) setSeparatorTopShadowColor:v12];
      }
      long long v13 = [v3 tableSeparatorBottomShadowColor];

      if (v13)
      {
        uint64_t v14 = [v3 tableSeparatorBottomShadowColor];
        [*(id *)((char *)&self->super.super.super.super.super.isa + v8) setSeparatorBottomShadowColor:v14];
      }
    }
    uint64_t v15 = [v3 tableSectionBorderColor];

    if (v15)
    {
      uint64_t v16 = [v3 tableSectionBorderColor];
      [*(id *)((char *)&self->super.super.super.super.super.isa + *v5) setSectionBorderColor:v16];
    }
  }
  uint64_t v17 = [v3 customBackgroundColor];

  if (v17)
  {
    __int16 v18 = [v3 customBackgroundColor];
    id v19 = [(CNFRegListController *)self view];
    [v19 setBackgroundColor:v18];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v50 = a4;
  id v6 = a5;
  uint64_t v7 = [v50 tag];
  int v8 = v7;
  uint64_t v9 = v7 << 32;
  if (v7 << 32 == 0x800000000)
  {
    id v10 = [v50 editableTextField];
    [v10 setClearButtonMode:1];
  }
  id v11 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v11 styleUsesCustomTableStyle])
  {
    if (objc_opt_respondsToSelector()) {
      char v12 = [v50 usesStandardBackgroundImage];
    }
    else {
      char v12 = 0;
    }
    if (v9 != 0xD00000000 || (v12 & 1) != 0)
    {
      long long v13 = [v11 tableCellBackgroundColor];
      [v50 setBackgroundColor:v13];
    }
    else
    {
      long long v13 = [v11 tableCellButtonImage];
      if (v13)
      {
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
        [v50 setBackgroundView:v14];
      }
      uint64_t v15 = [v11 tableCellButtonImageSelected];
      uint64_t v16 = v50;
      if (v15)
      {
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v15];
        [v50 setSelectedBackgroundView:v17];

        uint64_t v16 = v50;
      }
      [v16 setBackgroundColor:0];
    }
    __int16 v18 = [v11 tableCellTextLabelColor];

    if (v18)
    {
      id v19 = [v11 tableCellTextLabelColor];
      objc_super v20 = [v50 textLabel];
      [v20 setTextColor:v19];
    }
    v21 = [v11 tableCellTextLabelBackgroundColor];

    if (v21)
    {
      long long v22 = [v11 tableCellTextLabelBackgroundColor];
      long long v23 = [v50 textLabel];
      [v23 setBackgroundColor:v22];
    }
    long long v24 = [v11 tableCellDetailLabelColor];

    if (v24)
    {
      long long v25 = [v11 tableCellDetailLabelColor];
      v26 = [v50 detailTextLabel];
      [v26 setTextColor:v25];
    }
    uint64_t v27 = v8;
    __int16 v28 = [v11 tableCellDetailLabelBackgroundColor];

    if (v28)
    {
      v29 = [v11 tableCellDetailLabelBackgroundColor];
      __int16 v30 = [v50 detailTextLabel];
      [v30 setBackgroundColor:v29];
    }
    if ((v27 | 4) == 0xC)
    {
      v31 = [v11 tableCellEditableTextPlaceholderColor];

      if (v31)
      {
        uint64_t v32 = [v11 tableCellEditableTextPlaceholderColor];
        v33 = [v50 editableTextField];
        v34 = [v33 _placeholderLabel];
        [v34 setTextColor:v32];
      }
      v35 = [v11 tableCellEditableTextFieldClearButton];

      if (v35)
      {
        v36 = [v50 editableTextField];
        v37 = [v36 _clearButton];
        v38 = [v11 tableCellEditableTextFieldClearButton];
        [v37 setImage:v38 forState:0];
      }
      v39 = [v11 tableCellEditableTextFieldClearButtonPressed];

      if (v39)
      {
        v40 = [v50 editableTextField];
        v41 = [v40 _clearButton];
        v42 = [v11 tableCellEditableTextFieldClearButtonPressed];
        [v41 setImage:v42 forState:1];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v43 = v50;
        v44 = [v11 tableCellEditableTextColor];

        if (v44)
        {
          v45 = [v11 tableCellEditableTextColor];
          v46 = [v43 editableTextField];
          [v46 setTextColor:v45];
        }
        v47 = [v11 tableCellCheckmarkImage];
        [v43 setCustomCheckmarkImage:v47];

        v48 = [v11 tableCellCheckmarkImageSelected];
        [v43 setCustomCheckmarkImageSelected:v48];

        if ([v6 row])
        {
          [v43 setShadowImage:0];
        }
        else
        {
          v49 = [v11 tableSectionShadowImage];
          [v43 setShadowImage:v49];
        }
        [v43 setNeedsLayout];
      }
    }
  }
}

- (id)_existingLabelForSpecifier:(id)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (char *)a3;
  id v6 = v5;
  if (v5 && !*(void *)&v5[*MEMORY[0x263F5FE10]])
  {
    int v8 = (void *)MEMORY[0x263F60128];
    if (!v4) {
      int v8 = (void *)MEMORY[0x263F60108];
    }
    uint64_t v9 = [v5 propertyForKey:*v8];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v7 = v9;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_existingLabelForSection:(int64_t)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(CNFRegListController *)self indexOfGroup:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    int v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v6];
    id v7 = [(CNFRegListController *)self _existingLabelForSpecifier:v8 header:v4];
  }
  return v7;
}

- (void)_updateExistingLabelForSpecifier:(id)a3 header:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (char *)a3;
  int v8 = v7;
  if (v7)
  {
    char v12 = v7;
    if (*(void *)&v7[*MEMORY[0x263F5FE10]])
    {
      id v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"CNFRegListController.m" lineNumber:586 description:@"Attempted to set a label on a non-group cell"];

      int v8 = v12;
    }
    uint64_t v9 = [(CNFRegListController *)self _existingLabelForSpecifier:v8 header:v4];
    [v9 updateLabelText];
    if (v9)
    {
      uint64_t v10 = (int)*MEMORY[0x263F5FDD0];
      [*(id *)((char *)&self->super.super.super.super.super.isa + v10) beginUpdates];
      [*(id *)((char *)&self->super.super.super.super.super.isa + v10) endUpdates];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_setLabel:(id)a3 forSpecifier:(id)a4 header:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  uint64_t v9 = (char *)a4;
  uint64_t v10 = v9;
  if (v9)
  {
    if (*(void *)&v9[*MEMORY[0x263F5FE10]])
    {
      uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"CNFRegListController.m" lineNumber:607 description:@"Attempted to set a label on a non-group cell"];
    }
    id v11 = (id *)MEMORY[0x263F60118];
    if (!v5) {
      id v11 = (id *)MEMORY[0x263F600C0];
    }
    id v12 = *v11;
    if (v5) {
      [v10 name];
    }
    else {
    id v13 = [v10 propertyForKey:*MEMORY[0x263F600F8]];
    }
    if (v15 && [v15 length])
    {
      if (v13 != v15 && ([v15 isEqualToString:v13] & 1) == 0)
      {
        if (v5) {
          [v10 setName:v15];
        }
        else {
          [v10 setProperty:v15 forKey:*MEMORY[0x263F600F8]];
        }
        [(CNFRegListController *)self _updateExistingLabelForSpecifier:v10 header:v5];
      }
    }
    else
    {
      if (v5) {
        [v10 setName:0];
      }
      else {
        [v10 removePropertyForKey:*MEMORY[0x263F600F8]];
      }
      [v10 removePropertyForKey:v12];
    }
  }
}

- (void)_updateTableLabel:(id)a3 withTableView:(id)a4 isTopMostHeader:(BOOL)a5
{
  if (a3)
  {
    BOOL v5 = a5;
    id v7 = a3;
    objc_msgSend(v7, "setCnfreg_tableView:", a4);
    [v7 setIsTopmostHeader:v5];
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNFRegListController *)self _existingLabelForSection:a4 header:1];
  [(CNFRegListController *)self _updateTableLabel:v7 withTableView:v6 isTopMostHeader:a4 == 0];
  v14.receiver = self;
  v14.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v14 tableView:v6 heightForHeaderInSection:a4];
  if (a4 && v7)
  {
    double v9 = v8;
  }
  else
  {
    uint64_t v10 = [(CNFRegListController *)self _existingLabelForSection:a4 header:1];

    [(CNFRegListController *)self _updateTableLabel:v10 withTableView:v6 isTopMostHeader:a4 == 0];
    v13.receiver = self;
    v13.super_class = (Class)CNFRegListController;
    [(CNFRegListController *)&v13 tableView:v6 heightForHeaderInSection:a4];
    double v9 = v11;
    id v7 = (void *)v10;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(CNFRegListController *)self _existingLabelForSection:a4 header:0];
  [(CNFRegListController *)self _updateTableLabel:v7 withTableView:v6 isTopMostHeader:0];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  [(CNFRegListController *)&v12 tableView:v6 heightForFooterInSection:a4];
  if (!v7)
  {
    id v7 = [(CNFRegListController *)self _existingLabelForSection:a4 header:0];
    [(CNFRegListController *)self _updateTableLabel:v7 withTableView:v6 isTopMostHeader:0];
    v11.receiver = self;
    v11.super_class = (Class)CNFRegListController;
    [(CNFRegListController *)&v11 tableView:v6 heightForFooterInSection:a4];
  }
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegListController;
  id v7 = [(CNFRegListController *)&v9 tableView:v6 viewForHeaderInSection:a4];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CNFRegListController *)self _updateTableLabel:v7 withTableView:v6 isTopMostHeader:a4 == 0];
    }
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegListController;
  id v7 = [(CNFRegListController *)&v9 tableView:v6 viewForFooterInSection:a4];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CNFRegListController *)self _updateTableLabel:v7 withTableView:v6 isTopMostHeader:0];
    }
  }

  return v7;
}

- (void)showAuthKitSignInIfNecessary
{
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEBUG, "Asked to show AuthKit Sign In", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v4 = [(CNFRegListController *)self regController];
  uint64_t v5 = [v4 serviceType];

  if (v5 == 2)
  {
LABEL_9:
    uint64_t v6 = [MEMORY[0x263F4A608] facetimeService];
    goto LABEL_11;
  }
  if (v5 != 1)
  {
    if (v5)
    {
      objc_super v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)objc_super v13 = 0;
        _os_log_impl(&dword_21ED18000, v9, OS_LOG_TYPE_DEBUG, "Unsupported FTCServiceType provided from regController. Likely programming error.", v13, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  uint64_t v6 = [MEMORY[0x263F4A608] iMessageService];
LABEL_11:
  id v7 = (void *)v6;
  if (v6)
  {
    uint64_t v11 = 0;
    if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:v6 inProgressRegisteringNonPhoneAccount:&v11])
    {
      double v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 postNotificationName:@"CNFSettingsViewControllerNeedsContainerUpdate" object:0];
    }
    return;
  }
LABEL_20:
  uint64_t v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v12 = 0;
    _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEBUG, "No IMService found for regController. Will now show Apple ID Splash.", v12, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
}

- (void)_setupEventHandlers
{
  objc_super v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_21ED18000, v3, OS_LOG_TYPE_DEBUG, "Setting up event handlers", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFRegListController *)self removeAllHandlers];
}

- (void)removeAllHandlers
{
  id v2 = [(CNFRegListController *)self regController];
  [v2 removeAllHandlers];
}

- (id)appearBlock
{
  return self->_appearBlock;
}

- (BOOL)showingChildController
{
  return self->_showingChildController;
}

- (void)setShowingChildController:(BOOL)a3
{
  self->_showingChildController = a3;
}

- (BOOL)shouldRerootPreferences
{
  return self->_shouldRerootPreferences;
}

- (void)setShouldRerootPreferences:(BOOL)a3
{
  self->_shouldRerootPreferences = a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regController, 0);
  objc_storeStrong(&self->_appearBlock, 0);
}

@end