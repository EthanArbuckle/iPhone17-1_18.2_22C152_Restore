@interface CCUIAirDropModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAirDropRestricted;
- (BOOL)_isEduModeEnabled;
- (BOOL)isObservingStateChanges;
- (BOOL)prefersContextMenuDisplayStyle;
- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)showsMenuAsPrimaryAction;
- (CCUIAirDropModuleViewController)init;
- (CCUIConnectivityManager)connectivityManager;
- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule;
- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule;
- (CCUIRoundButton)glyphViewForExpandedConnectivityModule;
- (NSString)accessibilityIdentifier;
- (SFAirDropDiscoveryController)airDropDiscoveryController;
- (id)_availableMenuItems;
- (id)_everyoneMenuItemTextKey;
- (id)_glyphImage;
- (id)contextMenu;
- (id)contextMenuItems;
- (id)menuDisplayName;
- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3;
- (void)_handleButtonTap;
- (void)_updateGlyphImages;
- (void)_updateState;
- (void)setAirDropDiscoveryController:(id)a3;
- (void)setButtonViewForCollapsedConnectivityModule:(id)a3;
- (void)setConnectivityManager:(id)a3;
- (void)setGlyphViewForExpandedConnectivityModule:(id)a3;
- (void)setObservingStateChanges:(BOOL)a3;
- (void)setTemplateViewForExpandedConnectivityModule:(id)a3;
- (void)startObservingStateChangesIfNecessary;
- (void)stopObservingStateChangesIfNecessary;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUIAirDropModuleViewController

- (CCUIAirDropModuleViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)CCUIAirDropModuleViewController;
  v2 = [(CCUIAirDropModuleViewController *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CCUIAirDropModuleViewController *)v2 _glyphImage];
    v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v4 highlightColor:v5 useLightStyle:1];
    [v6 setUseAutomaticSymbolColors:1];
    [v6 addTarget:v3 action:sel__glyphViewForExpandedConnectivityModuleTapped forControlEvents:64];
    glyphViewForExpandedConnectivityModule = v3->_glyphViewForExpandedConnectivityModule;
    v3->_glyphViewForExpandedConnectivityModule = (CCUIRoundButton *)v6;
    id v8 = v6;

    [(CCUIMenuModuleViewController *)v3 setGlyphImage:v4];
    id v9 = objc_alloc_init(MEMORY[0x1E4F5AE28]);
    [v9 setCustomGlyphView:v8];
    templateViewForExpandedConnectivityModule = v3->_templateViewForExpandedConnectivityModule;
    v3->_templateViewForExpandedConnectivityModule = (CCUIControlTemplateView *)v9;
    id v11 = v9;

    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"CONTROL_CENTER_STATUS_AIRDROP_NAME" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    [(CCUIMenuModuleViewController *)v3 setTitle:v13];
    [(CCUIControlTemplateView *)v3->_templateViewForExpandedConnectivityModule setTitle:v13];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v4 highlightColor:v5 useLightStyle:1];
    [v14 setUseIndependentAlpha:1];
    [v14 setDynamicLayoutEnabled:1];
    [v14 setUseAutomaticSymbolColors:1];
    [v14 addTarget:v3 action:sel__buttonViewForCollapsedConnectivityModuleTapped forControlEvents:64];
    buttonViewForCollapsedConnectivityModule = v3->_buttonViewForCollapsedConnectivityModule;
    v3->_buttonViewForCollapsedConnectivityModule = (CCUIRoundButton *)v14;
    id v16 = v14;

    v17 = +[CCUIConnectivityManager sharedInstance];

    objc_storeWeak((id *)&v3->_connectivityManager, v17);
    v3->_observingStateChanges = 0;
  }
  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIAirDropModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIAirDropModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIAirDropModuleViewController *)self startObservingStateChangesIfNecessary];
  [(CCUIAirDropModuleViewController *)self _updateState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIAirDropModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillDisappear:a3];
  [(CCUIAirDropModuleViewController *)self stopObservingStateChangesIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return 0;
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges)
  {
    v3 = (SFAirDropDiscoveryController *)objc_alloc_init(NSClassFromString(&cfstr_Sfairdropdisco.isa));
    airDropDiscoveryController = self->_airDropDiscoveryController;
    self->_airDropDiscoveryController = v3;

    [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController setDelegate:self];
    [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController setAlertControllerDelegate:self];
    v5 = [MEMORY[0x1E4F74230] sharedConnection];
    [v5 registerObserver:self];

    self->_observingStateChanges = 1;
  }
}

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges)
  {
    [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController setDelegate:0];
    [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController setAlertControllerDelegate:0];
    airDropDiscoveryController = self->_airDropDiscoveryController;
    self->_airDropDiscoveryController = 0;

    objc_super v4 = [MEMORY[0x1E4F74230] sharedConnection];
    [v4 unregisterObserver:self];

    self->_observingStateChanges = 0;
  }
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"airdrop-button";
}

- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule
{
  return 0;
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 1;
}

- (id)menuDisplayName
{
  return &stru_1F2F34F20;
}

- (id)contextMenuItems
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(CCUIAirDropModuleViewController *)self _availableMenuItems];
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int64_t v10 = [(CCUIAirDropModuleViewController *)self _contextMenuItemStateFromMenuItem:v9];
        id v11 = (void *)MEMORY[0x1E4FB13F0];
        v12 = [v9 title];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __51__CCUIAirDropModuleViewController_contextMenuItems__block_invoke;
        v19[3] = &unk_1E6A89C78;
        v19[4] = v9;
        v13 = [v11 actionWithTitle:v12 image:0 identifier:0 handler:v19];

        [v13 setState:v10];
        v14 = [v9 subtitle];

        if (v14)
        {
          v15 = [v9 subtitle];
          [v13 setSubtitle:v15];
        }
        id v16 = (void *)[objc_alloc(MEMORY[0x1E4F5ADF8]) initWithMenuElement:v13];
        [v4 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  return v4;
}

uint64_t __51__CCUIAirDropModuleViewController_contextMenuItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (id)contextMenu
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(CCUIAirDropModuleViewController *)self _availableMenuItems];
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int64_t v10 = [(CCUIAirDropModuleViewController *)self _contextMenuItemStateFromMenuItem:v9];
        id v11 = (void *)MEMORY[0x1E4FB13F0];
        v12 = [v9 title];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46__CCUIAirDropModuleViewController_contextMenu__block_invoke;
        v19[3] = &unk_1E6A89C78;
        v19[4] = v9;
        v13 = [v11 actionWithTitle:v12 image:0 identifier:0 handler:v19];

        [v13 setState:v10];
        v14 = [v9 subtitle];

        if (v14)
        {
          v15 = [v9 subtitle];
          [v13 setSubtitle:v15];
        }
        [v4 addObject:v13];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  if ([v4 count])
  {
    id v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v4];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

uint64_t __46__CCUIAirDropModuleViewController_contextMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (id)_glyphImage
{
  v2 = [(CCUIButtonModuleViewController *)self contentMetrics];
  v3 = [v2 symbolConfiguration];
  objc_super v4 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  uint64_t v5 = [v3 configurationByApplyingConfiguration:v4];

  uint64_t v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"airdrop" withConfiguration:v5];
  uint64_t v7 = [v6 imageFlippedForRightToLeftLayoutDirection];

  return v7;
}

- (void)_updateGlyphImages
{
  id v5 = [(CCUIAirDropModuleViewController *)self _glyphImage];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v5];
  v3 = [(CCUIAirDropModuleViewController *)self buttonViewForCollapsedConnectivityModule];
  [v3 setGlyphImage:v5];
  objc_super v4 = [(CCUIAirDropModuleViewController *)self glyphViewForExpandedConnectivityModule];
  [v4 setGlyphImage:v5];
}

- (void)_handleButtonTap
{
  BOOL v3 = [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController discoverableMode] == 0;
  airDropDiscoveryController = self->_airDropDiscoveryController;

  [(SFAirDropDiscoveryController *)airDropDiscoveryController setDiscoverableMode:2 * v3];
}

- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3
{
  return [a3 isSelected];
}

- (id)_everyoneMenuItemTextKey
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(SFAirDropDiscoveryController *)self->_airDropDiscoveryController isTimeLimitedEveryoneMode] & 1) != 0)
  {
    return @"CONTROL_CENTER_AIRDROP_EVERYONE_TIME_LIMIT";
  }
  else
  {
    return @"CONTROL_CENTER_AIRDROP_EVERYONE_ONE_LINE";
  }
}

- (id)_availableMenuItems
{
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_airDropDiscoveryController;
  id v4 = objc_alloc(MEMORY[0x1E4F5AE38]);
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"CONTROL_CENTER_AIRDROP_RECEIVING_OFF_ONE_LINE" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke;
  v32[3] = &unk_1E6A89CA0;
  uint64_t v7 = v3;
  v33 = v7;
  id v8 = (void *)[v4 initWithTitle:v6 identifier:@"off" handler:v32];

  if (![(SFAirDropDiscoveryController *)v7 discoverableMode]) {
    [v8 setSelected:1];
  }
  id v9 = objc_alloc(MEMORY[0x1E4F5AE38]);
  int64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"CONTROL_CENTER_AIRDROP_CONTACTS_ONE_LINE" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke_2;
  v30[3] = &unk_1E6A89CA0;
  v12 = v7;
  v31 = v12;
  v13 = (void *)[v9 initWithTitle:v11 identifier:@"contacts" handler:v30];

  if ([(SFAirDropDiscoveryController *)v12 discoverableMode] == 1) {
    [v13 setSelected:1];
  }
  id v14 = objc_alloc(MEMORY[0x1E4F5AE38]);
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v16 = [(CCUIAirDropModuleViewController *)self _everyoneMenuItemTextKey];
  v17 = [v15 localizedStringForKey:v16 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke_3;
  v28 = &unk_1E6A89CA0;
  v18 = v12;
  v29 = v18;
  objc_super v19 = (void *)[v14 initWithTitle:v17 identifier:@"everyone" handler:&v25];

  if ([(SFAirDropDiscoveryController *)v18 discoverableMode] == 2) {
    [v19 setSelected:1];
  }
  if ([(CCUIAirDropModuleViewController *)self _isEduModeEnabled])
  {
    v35[0] = v8;
    v35[1] = v19;
    long long v20 = (void *)MEMORY[0x1E4F1C978];
    long long v21 = v35;
    uint64_t v22 = 2;
  }
  else
  {
    v34[0] = v8;
    v34[1] = v13;
    v34[2] = v19;
    long long v20 = (void *)MEMORY[0x1E4F1C978];
    long long v21 = v34;
    uint64_t v22 = 3;
  }
  long long v23 = [v20 arrayWithObjects:v21 count:v22];

  return v23;
}

uint64_t __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __54__CCUIAirDropModuleViewController__availableMenuItems__block_invoke_3(uint64_t a1)
{
  return 1;
}

- (BOOL)_isAirDropRestricted
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isAirDropAllowed] ^ 1;

  return v3;
}

- (BOOL)_isEduModeEnabled
{
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  if ([v2 isMultiUser])
  {
    char v3 = [v2 currentUser];
    BOOL v4 = [v3 userType] == 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updateState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CCUIAirDropModuleViewController *)self _isAirDropRestricted] ^ 1;
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setEnabled:v3];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setEnabled:v3];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setEnabled:v3];
  uint64_t v4 = [(SFAirDropDiscoveryController *)self->_airDropDiscoveryController discoverableMode];
  uint64_t v5 = v4;
  if (v4 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    id v8 = @"CONTROL_CENTER_AIRDROP_EVERYONE_ONE_LINE";
  }
  else if (v4 == 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    id v8 = @"CONTROL_CENTER_AIRDROP_CONTACTS_ONE_LINE";
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = v6;
    id v8 = @"CONTROL_CENTER_AIRDROP_RECEIVING_OFF_ONE_LINE";
  }
  id v9 = [v6 localizedStringForKey:v8 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

  [(CCUIButtonModuleViewController *)self setValueText:v9];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v9];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSubtitle:v9];
  [(CCUIAirDropModuleViewController *)self _updateGlyphImages];
  unint64_t v10 = v5 - 1;
  BOOL v11 = (unint64_t)(v5 - 1) < 2;
  [(CCUIButtonModuleViewController *)self setSelected:v11];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setSelected:v11];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setSelected:v11];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setShowsMenuAffordance:v3];
  v12 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSNumber;
    id v14 = v12;
    v15 = [v13 numberWithBool:v10 < 2];
    int v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_1D7B17000, v14, OS_LOG_TYPE_DEFAULT, "[AirDrop Module] State updated to %{public}@", (uint8_t *)&v16, 0xCu);
  }
}

- (SFAirDropDiscoveryController)airDropDiscoveryController
{
  return self->_airDropDiscoveryController;
}

- (void)setAirDropDiscoveryController:(id)a3
{
}

- (CCUIConnectivityManager)connectivityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectivityManager);

  return (CCUIConnectivityManager *)WeakRetained;
}

- (void)setConnectivityManager:(id)a3
{
}

- (BOOL)isObservingStateChanges
{
  return self->_observingStateChanges;
}

- (void)setObservingStateChanges:(BOOL)a3
{
  self->_observingStateChanges = a3;
}

- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule
{
  return self->_buttonViewForCollapsedConnectivityModule;
}

- (void)setButtonViewForCollapsedConnectivityModule:(id)a3
{
}

- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule
{
  return self->_templateViewForExpandedConnectivityModule;
}

- (void)setTemplateViewForExpandedConnectivityModule:(id)a3
{
}

- (CCUIRoundButton)glyphViewForExpandedConnectivityModule
{
  return self->_glyphViewForExpandedConnectivityModule;
}

- (void)setGlyphViewForExpandedConnectivityModule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViewForExpandedConnectivityModule, 0);
  objc_storeStrong((id *)&self->_templateViewForExpandedConnectivityModule, 0);
  objc_storeStrong((id *)&self->_buttonViewForCollapsedConnectivityModule, 0);
  objc_destroyWeak((id *)&self->_connectivityManager);

  objc_storeStrong((id *)&self->_airDropDiscoveryController, 0);
}

@end