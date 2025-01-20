@interface CCUISatelliteModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_enabledForState:(unint64_t)a3;
- (BOOL)_inoperativeForState:(unint64_t)a3;
- (BOOL)_useAlternateBackgroundForState:(unint64_t)a3;
- (BOOL)_userInteractionEnabledForState:(unint64_t)a3;
- (BOOL)isObservingStateChanges;
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (BOOL)prefersContextMenuDisplayStyle;
- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule;
- (BOOL)showsMenuAsPrimaryAction;
- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule;
- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule;
- (CCUIRoundButton)glyphViewForExpandedConnectivityModule;
- (CCUISatelliteModuleViewController)initWithContentModuleContext:(id)a3;
- (CCUISatelliteMonitor)satelliteMonitor;
- (NSString)accessibilityIdentifier;
- (OS_dispatch_queue)queue;
- (id)_connectedMenuItems;
- (id)_debugDescriptionForState:(BOOL)a3;
- (id)_glyphImageForState:(unint64_t)a3;
- (id)_glyphStateForState:(unint64_t)a3;
- (id)_menuItemsForCurrentState;
- (id)_notConnectedMenuItems;
- (id)_offMenuItems;
- (id)_subtitleTextForState:(unint64_t)a3;
- (id)_tryDemoMenuItems;
- (id)contextMenu;
- (id)contextMenuItems;
- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3;
- (void)_buttonTapped;
- (void)_disconnectFromSatellite;
- (void)_openSOSBuddyApp;
- (void)_turnOff;
- (void)_updateGlyphImageWithState:(unint64_t)a3;
- (void)_updateState:(unint64_t)a3;
- (void)buttonTapped:(id)a3;
- (void)satelliteMonitor:(id)a3 didChangeState:(unint64_t)a4;
- (void)setButtonViewForCollapsedConnectivityModule:(id)a3;
- (void)setGlyphViewForExpandedConnectivityModule:(id)a3;
- (void)setObservingStateChanges:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSatelliteMonitor:(id)a3;
- (void)setTemplateViewForExpandedConnectivityModule:(id)a3;
- (void)startObservingStateChanges;
- (void)startObservingStateChangesIfNecessary;
- (void)stopObservingStateChanges;
- (void)stopObservingStateChangesIfNecessary;
- (void)updateState;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CCUISatelliteModuleViewController

- (CCUISatelliteModuleViewController)initWithContentModuleContext:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)CCUISatelliteModuleViewController;
  v3 = [(CCUIMenuModuleViewController *)&v28 initWithContentModuleContext:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CCUISatelliteModuleViewController *)v3 _glyphImageForState:1];
    v6 = [MEMORY[0x1E4FB1618] systemGreenColor];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v5 highlightColor:v6 useLightStyle:1];
    [v7 setUseAutomaticSymbolColors:1];
    [v7 addTarget:v4 action:sel__glyphViewForExpandedConnectivityModuleTapped forControlEvents:64];
    glyphViewForExpandedConnectivityModule = v4->_glyphViewForExpandedConnectivityModule;
    v4->_glyphViewForExpandedConnectivityModule = (CCUIRoundButton *)v7;
    id v9 = v7;

    [(CCUIMenuModuleViewController *)v4 setGlyphImage:v5];
    id v10 = objc_alloc_init(MEMORY[0x1E4F5AE28]);
    [v10 setCustomGlyphView:v9];
    [v10 setDelegate:v4];
    templateViewForExpandedConnectivityModule = v4->_templateViewForExpandedConnectivityModule;
    v4->_templateViewForExpandedConnectivityModule = (CCUIControlTemplateView *)v10;
    id v12 = v10;

    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"CONTROL_CENTER_STATUS_SATELLITE_NAME" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    [(CCUIMenuModuleViewController *)v4 setTitle:v14];
    [(CCUIControlTemplateView *)v4->_templateViewForExpandedConnectivityModule setTitle:v14];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v5 highlightColor:v6 useLightStyle:1];
    [v15 setUseIndependentAlpha:1];
    [v15 setDynamicLayoutEnabled:1];
    [v15 setUseAutomaticSymbolColors:1];
    [v15 addTarget:v4 action:sel__buttonViewForCollapsedConnectivityModuleTapped forControlEvents:64];
    buttonViewForCollapsedConnectivityModule = v4->_buttonViewForCollapsedConnectivityModule;
    v4->_buttonViewForCollapsedConnectivityModule = (CCUIRoundButton *)v15;
    id v17 = v15;

    v18 = [CCUISatelliteMonitor alloc];
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    uint64_t v20 = [(CCUISatelliteMonitor *)v18 initWithQueue:SerialWithQoS];
    satelliteMonitor = v4->_satelliteMonitor;
    v4->_satelliteMonitor = (CCUISatelliteMonitor *)v20;

    [(CCUISatelliteMonitor *)v4->_satelliteMonitor start];
    v22 = [MEMORY[0x1E4F4F730] serial];
    v23 = [v22 autoreleaseFrequency:1];
    v24 = [v23 serviceClass:25];
    uint64_t v25 = BSDispatchQueueCreate();
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v25;

    v4->_observingStateChanges = 0;
  }
  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISatelliteModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISatelliteModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUISatelliteModuleViewController *)self startObservingStateChangesIfNecessary];
  [(CCUISatelliteModuleViewController *)self _updateState:[(CCUISatelliteMonitor *)self->_satelliteMonitor state]];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUISatelliteModuleViewController;
  [(CCUIMenuModuleViewController *)&v4 viewWillDisappear:a3];
  [(CCUISatelliteModuleViewController *)self stopObservingStateChangesIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges) {
    [(CCUISatelliteModuleViewController *)self startObservingStateChanges];
  }
}

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges) {
    [(CCUISatelliteModuleViewController *)self stopObservingStateChanges];
  }
}

- (BOOL)prefersContextMenuDisplayStyle
{
  return 1;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"com.apple.ControlCenter.Satellite";
}

- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule
{
  return 1;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  BOOL v4 = [(CCUISatelliteModuleViewController *)self showsMenuAsPrimaryAction];
  if (!v4) {
    [(CCUISatelliteModuleViewController *)self _openSOSBuddyApp];
  }
  return v4;
}

- (void)updateState
{
  unint64_t v3 = [(CCUISatelliteMonitor *)self->_satelliteMonitor state];

  [(CCUISatelliteModuleViewController *)self _updateState:v3];
}

- (void)satelliteMonitor:(id)a3 didChangeState:(unint64_t)a4
{
}

- (BOOL)showsMenuAsPrimaryAction
{
  v2 = [(CCUISatelliteModuleViewController *)self contextMenuItems];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)contextMenuItems
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CCUISatelliteModuleViewController *)self _menuItemsForCurrentState];
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int64_t v10 = [(CCUISatelliteModuleViewController *)self _contextMenuItemStateFromMenuItem:v9];
        v11 = (void *)MEMORY[0x1E4FB13F0];
        id v12 = [v9 title];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __53__CCUISatelliteModuleViewController_contextMenuItems__block_invoke;
        v21[3] = &unk_1E6A89C78;
        v21[4] = v9;
        v13 = [v11 actionWithTitle:v12 image:0 identifier:0 handler:v21];

        [v13 setState:v10];
        v14 = [v9 subtitle];

        if (v14)
        {
          v15 = [v9 subtitle];
          [v13 setSubtitle:v15];
        }
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F5ADF8]) initWithMenuElement:v13];
        [v4 addObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  if ([v4 count]) {
    id v17 = v4;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  return v18;
}

uint64_t __53__CCUISatelliteModuleViewController_contextMenuItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (id)contextMenu
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CCUISatelliteModuleViewController *)self _menuItemsForCurrentState];
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
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
        int64_t v10 = [(CCUISatelliteModuleViewController *)self _contextMenuItemStateFromMenuItem:v9];
        v11 = (void *)MEMORY[0x1E4FB13F0];
        id v12 = [v9 title];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __48__CCUISatelliteModuleViewController_contextMenu__block_invoke;
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
    v16 = [MEMORY[0x1E4FB1970] menuWithChildren:v4];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __48__CCUISatelliteModuleViewController_contextMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performAction];
}

- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3
{
  return [a3 isSelected];
}

- (void)_openSOSBuddyApp
{
}

void __53__CCUISatelliteModuleViewController__openSOSBuddyApp__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"x-apple-sosbuddy://open"];
  uint64_t v1 = *MEMORY[0x1E4F626A0];
  v4[0] = *MEMORY[0x1E4F62688];
  v4[1] = v1;
  v5[0] = MEMORY[0x1E4F1CC38];
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[2] = *MEMORY[0x1E4F62658];
  v5[2] = *MEMORY[0x1E4F5AD50];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  BOOL v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v0 withOptions:v2];
}

- (void)_turnOff
{
}

- (void)_disconnectFromSatellite
{
}

- (id)_tryDemoMenuItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(CCUISatelliteMonitor *)self->_satelliteMonitor canShowDemo])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5AE38]);
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_TRY_DEMO" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__CCUISatelliteModuleViewController__tryDemoMenuItems__block_invoke;
    v9[3] = &unk_1E6A89CA0;
    v9[4] = self;
    uint64_t v6 = (void *)[v3 initWithTitle:v5 identifier:@"demo" handler:v9];

    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

uint64_t __54__CCUISatelliteModuleViewController__tryDemoMenuItems__block_invoke(uint64_t a1)
{
  return 1;
}

- (id)_offMenuItems
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(CCUISatelliteMonitor *)self->_satelliteMonitor isMessagingServiceAvailable])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F5AE38]);
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [v4 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_USE_MESSAGES_VIA_SATELLITE" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CCUISatelliteModuleViewController__offMenuItems__block_invoke;
    v9[3] = &unk_1E6A89CA0;
    v9[4] = self;
    uint64_t v6 = (void *)[v3 initWithTitle:v5 identifier:@"use messages" handler:v9];

    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

uint64_t __50__CCUISatelliteModuleViewController__offMenuItems__block_invoke(uint64_t a1)
{
  return 1;
}

- (id)_notConnectedMenuItems
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F5AE38]);
  BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_CONNECT" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __59__CCUISatelliteModuleViewController__notConnectedMenuItems__block_invoke;
  v17[3] = &unk_1E6A89CA0;
  v17[4] = self;
  uint64_t v6 = (void *)[v3 initWithTitle:v5 identifier:@"connect" handler:v17];

  id v7 = objc_alloc(MEMORY[0x1E4F5AE38]);
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_SHOW_OPTIONS" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__CCUISatelliteModuleViewController__notConnectedMenuItems__block_invoke_2;
  v16[3] = &unk_1E6A89CA0;
  v16[4] = self;
  int64_t v10 = (void *)[v7 initWithTitle:v9 identifier:@"show options" handler:v16];

  if ([(CCUISatelliteMonitor *)self->_satelliteMonitor isMessagingServiceAvailable])
  {
    v19[0] = v6;
    v19[1] = v10;
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = (void **)v19;
    uint64_t v13 = 2;
  }
  else
  {
    id v18 = v6;
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = &v18;
    uint64_t v13 = 1;
  }
  v14 = [v11 arrayWithObjects:v12 count:v13];

  return v14;
}

uint64_t __59__CCUISatelliteModuleViewController__notConnectedMenuItems__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __59__CCUISatelliteModuleViewController__notConnectedMenuItems__block_invoke_2(uint64_t a1)
{
  return 1;
}

- (id)_connectedMenuItems
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F5AE38]);
  BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_DISCONNECT" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __56__CCUISatelliteModuleViewController__connectedMenuItems__block_invoke;
  v17[3] = &unk_1E6A89CA0;
  v17[4] = self;
  uint64_t v6 = (void *)[v3 initWithTitle:v5 identifier:@"disconnect" handler:v17];

  id v7 = objc_alloc(MEMORY[0x1E4F5AE38]);
  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CONTROL_CENTER_SATELLITE_MENU_SHOW_OPTIONS" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__CCUISatelliteModuleViewController__connectedMenuItems__block_invoke_2;
  v16[3] = &unk_1E6A89CA0;
  v16[4] = self;
  int64_t v10 = (void *)[v7 initWithTitle:v9 identifier:@"show options" handler:v16];

  if ([(CCUISatelliteMonitor *)self->_satelliteMonitor isMessagingServiceAvailable])
  {
    v19[0] = v6;
    v19[1] = v10;
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = (void **)v19;
    uint64_t v13 = 2;
  }
  else
  {
    id v18 = v6;
    v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = &v18;
    uint64_t v13 = 1;
  }
  v14 = [v11 arrayWithObjects:v12 count:v13];

  return v14;
}

uint64_t __56__CCUISatelliteModuleViewController__connectedMenuItems__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __56__CCUISatelliteModuleViewController__connectedMenuItems__block_invoke_2(uint64_t a1)
{
  return 1;
}

- (id)_menuItemsForCurrentState
{
  unint64_t v3 = [(CCUISatelliteMonitor *)self->_satelliteMonitor state];
  BOOL v4 = (void *)MEMORY[0x1E4F1CBF0];
  switch(v3)
  {
    case 1uLL:
      BOOL v4 = [(CCUISatelliteModuleViewController *)self _tryDemoMenuItems];
      break;
    case 2uLL:
      BOOL v4 = [(CCUISatelliteModuleViewController *)self _offMenuItems];
      break;
    case 3uLL:
      BOOL v4 = [(CCUISatelliteModuleViewController *)self _notConnectedMenuItems];
      break;
    case 5uLL:
      BOOL v4 = [(CCUISatelliteModuleViewController *)self _connectedMenuItems];
      break;
    default:
      break;
  }

  return v4;
}

- (void)_updateState:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setHidden:0];
    BOOL v5 = [(CCUISatelliteModuleViewController *)self _inoperativeForState:a3];
    BOOL v6 = [(CCUISatelliteModuleViewController *)self _enabledForState:a3];
    BOOL v18 = [(CCUISatelliteModuleViewController *)self _userInteractionEnabledForState:a3];
    id v7 = [(CCUISatelliteModuleViewController *)self _glyphStateForState:a3];
    v8 = [(CCUISatelliteModuleViewController *)self _subtitleTextForState:a3];
    BOOL v9 = [(CCUISatelliteModuleViewController *)self _useAlternateBackgroundForState:a3];
    [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setHighlighted:0];
    [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setEnabled:1];
    [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setEnabled:v6];
    BOOL v17 = v5;
    uint64_t v10 = v6 & !v5;
    [(CCUIButtonModuleViewController *)self setSelected:v10];
    [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setSelected:v10];
    [(CCUIButtonModuleViewController *)self setGlyphState:v7];
    [(CCUIButtonModuleViewController *)self setValueText:v8];
    [(CCUIButtonModuleViewController *)self setSelectedValueText:v8];
    [(CCUIMenuModuleViewController *)self setSubtitle:v8];
    [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSubtitle:v8];
    v11 = [(CCUISatelliteModuleViewController *)self _glyphImageForState:a3];
    [(CCUIMenuModuleViewController *)self setGlyphImage:v11];
    [(CCUISatelliteModuleViewController *)self _updateGlyphImageWithState:a3];
    [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setUseAlternateBackground:v9];
    [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setUseAlternateBackground:v9];
    [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setUserInteractionEnabled:v18];
    [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setUserInteractionEnabled:v18];
    [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setShowsMenuAffordance:[(CCUISatelliteModuleViewController *)self showsMenuAsPrimaryAction]];
    id v12 = [(CCUISatelliteModuleViewController *)self view];
    [v12 setNeedsLayout];

    uint64_t v13 = (void *)*MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = [(CCUISatelliteModuleViewController *)self _debugDescriptionForState:1];
      *(_DWORD *)buf = 138544387;
      long long v20 = v15;
      __int16 v21 = 1024;
      BOOL v22 = v17;
      __int16 v23 = 1024;
      BOOL v24 = v9;
      __int16 v25 = 1024;
      BOOL v26 = v6;
      __int16 v27 = 2113;
      objc_super v28 = v8;
      _os_log_impl(&dword_1D7B17000, v14, OS_LOG_TYPE_DEFAULT, "[Satellite] Satellite state updated to %{public}@ [ inoperative: %d enabled: %d useAlternateBackground: %d subtitle: %{private}@ ]", buf, 0x28u);
    }
  }
  else
  {
    v16 = *MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7B17000, v16, OS_LOG_TYPE_DEFAULT, "[Satellite] Hiding view", buf, 2u);
    }
    [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setHidden:1];
  }
}

- (void)_updateGlyphImageWithState:(unint64_t)a3
{
  id v6 = [(CCUISatelliteModuleViewController *)self _glyphImageForState:a3];
  [(CCUIMenuModuleViewController *)self setGlyphImage:v6];
  BOOL v4 = [(CCUISatelliteModuleViewController *)self buttonViewForCollapsedConnectivityModule];
  [v4 setGlyphImage:v6];
  BOOL v5 = [(CCUISatelliteModuleViewController *)self glyphViewForExpandedConnectivityModule];
  [v5 setGlyphImage:v6];
}

- (id)_subtitleTextForState:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_NOT_AVAILABLE";
      goto LABEL_9;
    case 2uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_OFF";
      goto LABEL_9;
    case 3uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_NOT_CONNECTED";
      goto LABEL_9;
    case 4uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_CONNECTING";
      goto LABEL_9;
    case 5uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_CONNECTED";
      goto LABEL_9;
    case 6uLL:
      unint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      BOOL v4 = v3;
      BOOL v5 = @"CONTROL_CENTER_STATUS_SATELLITE_DISCONNECTING";
LABEL_9:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)_glyphStateForState:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"hidden";
  }
  else {
    return off_1E6A89CC0[a3 - 1];
  }
}

- (id)_glyphImageForState:(unint64_t)a3
{
  if (a3 > 6) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = off_1E6A89CF0[a3];
  }
  BOOL v4 = [(CCUIButtonModuleViewController *)self contentMetrics];
  BOOL v5 = [v4 symbolConfiguration];
  id v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:v3 withConfiguration:v5];
  id v7 = [v6 imageFlippedForRightToLeftLayoutDirection];

  return v7;
}

- (BOOL)_useAlternateBackgroundForState:(unint64_t)a3
{
  return a3 == 3;
}

- (BOOL)_inoperativeForState:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_enabledForState:(unint64_t)a3
{
  return a3 - 4 < 3;
}

- (BOOL)_userInteractionEnabledForState:(unint64_t)a3
{
  return a3 - 1 < 6;
}

- (void)startObservingStateChanges
{
  self->_observingStateChanges = 1;
  [(CCUISatelliteMonitor *)self->_satelliteMonitor setDelegate:self];
}

- (void)stopObservingStateChanges
{
  self->_observingStateChanges = 0;
  [(CCUISatelliteMonitor *)self->_satelliteMonitor setDelegate:0];
}

- (void)_buttonTapped
{
  if ([(CCUISatelliteMonitor *)self->_satelliteMonitor state] == 2)
  {
    [(CCUISatelliteModuleViewController *)self _openSOSBuddyApp];
  }
}

- (void)buttonTapped:(id)a3
{
  BOOL v4 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1D7B17000, v4, OS_LOG_TYPE_DEFAULT, "[Satellite] button tapped", v5, 2u);
  }
  [(CCUISatelliteModuleViewController *)self _buttonTapped];
}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3) {
    return @"on";
  }
  else {
    return @"off";
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CCUISatelliteMonitor)satelliteMonitor
{
  return self->_satelliteMonitor;
}

- (void)setSatelliteMonitor:(id)a3
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
  objc_storeStrong((id *)&self->_satelliteMonitor, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end