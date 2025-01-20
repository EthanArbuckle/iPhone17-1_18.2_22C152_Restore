@interface CCUIVPNModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isObservingStateChanges;
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUIConnectivityManager)connectivityManager;
- (CCUIControlTemplateView)templateViewForExpandedConnectivityModule;
- (CCUIRoundButton)buttonViewForCollapsedConnectivityModule;
- (CCUIRoundButton)glyphViewForExpandedConnectivityModule;
- (CCUIVPNModuleViewController)init;
- (NSString)accessibilityIdentifier;
- (id)_glyphImage;
- (void)_toggleState;
- (void)_updateGlyphImages;
- (void)_updateState;
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

@implementation CCUIVPNModuleViewController

- (CCUIVPNModuleViewController)init
{
  v19.receiver = self;
  v19.super_class = (Class)CCUIVPNModuleViewController;
  v2 = [(CCUIVPNModuleViewController *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CCUIVPNModuleViewController *)v2 _glyphImage];
    v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F5AE48]) initWithGlyphImage:v4 highlightColor:v5 useLightStyle:1];
    [v6 setUseAutomaticSymbolColors:1];
    [v6 addTarget:v3 action:sel__glyphViewForExpandedConnectivityModuleTapped forControlEvents:64];
    glyphViewForExpandedConnectivityModule = v3->_glyphViewForExpandedConnectivityModule;
    v3->_glyphViewForExpandedConnectivityModule = (CCUIRoundButton *)v6;
    id v8 = v6;

    [(CCUIButtonModuleViewController *)v3 setGlyphImage:v4];
    id v9 = objc_alloc_init(MEMORY[0x1E4F5AE28]);
    [v9 setCustomGlyphView:v8];
    templateViewForExpandedConnectivityModule = v3->_templateViewForExpandedConnectivityModule;
    v3->_templateViewForExpandedConnectivityModule = (CCUIControlTemplateView *)v9;
    id v11 = v9;

    v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"CONTROL_CENTER_STATUS_VPN_NAME" value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

    [(CCUIButtonModuleViewController *)v3 setTitle:v13];
    [(CCUIControlTemplateView *)v3->_templateViewForExpandedConnectivityModule setTitle:v13];
    [(CCUIControlTemplateView *)v3->_templateViewForExpandedConnectivityModule setDelegate:v3];
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
  v4.super_class = (Class)CCUIVPNModuleViewController;
  [(CCUIButtonModuleViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [(CCUIButtonModuleViewController *)self setSelectedGlyphColor:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIVPNModuleViewController;
  [(CCUIVPNModuleViewController *)&v4 viewWillAppear:a3];
  [(CCUIVPNModuleViewController *)self startObservingStateChangesIfNecessary];
  [(CCUIVPNModuleViewController *)self _updateState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIVPNModuleViewController;
  [(CCUIVPNModuleViewController *)&v4 viewWillDisappear:a3];
  [(CCUIVPNModuleViewController *)self stopObservingStateChangesIfNecessary];
}

- (BOOL)_canShowWhileLocked
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
    id v3 = [(CCUIVPNModuleViewController *)self connectivityManager];
    [v3 addVPNViewControllerObservingStateChanges:self];
    self->_observingStateChanges = 1;
  }
}

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges)
  {
    id v3 = [(CCUIVPNModuleViewController *)self connectivityManager];
    [v3 removeVPNViewControllerObservingStateChanges:self];
    self->_observingStateChanges = 0;
  }
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)@"vpn-button";
}

- (BOOL)providesTemplateViewDelegateForExpandedConnectivityModule
{
  v2 = [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule delegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  return 0;
}

- (id)_glyphImage
{
  v2 = [(CCUIButtonModuleViewController *)self contentMetrics];
  BOOL v3 = [v2 symbolConfiguration];
  objc_super v4 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  v5 = [v3 configurationByApplyingConfiguration:v4];

  v6 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"network.connected.to.line.below.fill" withConfiguration:v5];
  v7 = [v6 imageFlippedForRightToLeftLayoutDirection];

  return v7;
}

- (void)_updateGlyphImages
{
  id v5 = [(CCUIVPNModuleViewController *)self _glyphImage];
  [(CCUIButtonModuleViewController *)self setGlyphImage:v5];
  BOOL v3 = [(CCUIVPNModuleViewController *)self buttonViewForCollapsedConnectivityModule];
  [v3 setGlyphImage:v5];
  objc_super v4 = [(CCUIVPNModuleViewController *)self glyphViewForExpandedConnectivityModule];
  [v4 setGlyphImage:v5];
}

- (void)_toggleState
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7B17000, a2, OS_LOG_TYPE_ERROR, "[VPN] Error togging VPN: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CCUIVPNModuleViewController *)self connectivityManager];
  uint64_t v4 = [v3 vpnConnectivityManager];
  uint64_t v5 = [v4 visibilityStyle];
  uint64_t v6 = [v4 connectivityState];
  switch(v6)
  {
    case 0:
    case 4:
      v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"CONTROL_CENTER_STATUS_VPN_OFF";
      goto LABEL_7;
    case 1:
      v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"CONTROL_CENTER_STATUS_VPN_CONNECTING";
      goto LABEL_7;
    case 2:
    case 5:
      v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"CONTROL_CENTER_STATUS_VPN_ON";
      goto LABEL_7;
    case 3:
      v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = v7;
      id v9 = @"CONTROL_CENTER_STATUS_VPN_DISCONNECTING";
LABEL_7:
      v10 = [v7 localizedStringForKey:v9 value:&stru_1F2F34F20 table:@"ControlCenterUI+SystemModules"];

      break;
    default:
      v10 = 0;
      break;
  }
  [(CCUIButtonModuleViewController *)self setValueText:v10];
  [(CCUIButtonModuleViewController *)self setSelectedValueText:v10];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSubtitle:v10];
  [(CCUIVPNModuleViewController *)self _updateGlyphImages];
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setEnabled:v5 != 0];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setEnabled:v5 != 0];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setEnabled:v5 != 0];
  BOOL v12 = v6 == 2 || v6 == 5;
  [(CCUIControlTemplateView *)self->_templateViewForExpandedConnectivityModule setSelected:0];
  [(CCUIRoundButton *)self->_buttonViewForCollapsedConnectivityModule setSelected:v12];
  [(CCUIRoundButton *)self->_glyphViewForExpandedConnectivityModule setSelected:v12];
  [(CCUIButtonModuleViewController *)self setSelected:v12];
  v13 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    v14 = NSNumber;
    v15 = v13;
    id v16 = [v14 numberWithBool:v5 == 0];
    v17 = [NSNumber numberWithBool:v12];
    int v18 = 138543874;
    objc_super v19 = v10;
    __int16 v20 = 2114;
    v21 = v16;
    __int16 v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_1D7B17000, v15, OS_LOG_TYPE_DEFAULT, "[VPN] Updated VPN control (subtitle: %{public}@, inoperative: %{public}@, enabled: %{public}@)", (uint8_t *)&v18, 0x20u);
  }
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
}

@end