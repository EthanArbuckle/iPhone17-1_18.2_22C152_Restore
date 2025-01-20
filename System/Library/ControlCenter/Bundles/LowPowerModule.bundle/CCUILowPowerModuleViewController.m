@interface CCUILowPowerModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isEAconnected;
- (BOOL)isSelected;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (CCUILowPowerModuleViewController)init;
- (id)_makeLocalizedMenuItem:(id)a3 handler:(id)a4;
- (id)glyphPackageDescription;
- (id)glyphState;
- (void)_configureMenu;
- (void)_observeSystemNotifications;
- (void)_unobserveSystemNotifications;
- (void)_updateState;
- (void)dealloc;
- (void)reconfigureView;
- (void)refreshStateAnimated:(BOOL)a3;
- (void)setLowPowerMode:(BOOL)a3;
- (void)setMobileChargeMode:(BOOL)a3;
- (void)toggleLowPowerMode;
- (void)toggleMobileChargeMode;
- (void)viewDidLoad;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation CCUILowPowerModuleViewController

- (CCUILowPowerModuleViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)CCUILowPowerModuleViewController;
  v2 = [(CCUILowPowerModuleViewController *)&v10 init];
  if (v2)
  {
    v3 = (_PMLowPowerMode *)objc_alloc_init(MEMORY[0x263F52788]);
    lowPowerMode = v2->_lowPowerMode;
    v2->_lowPowerMode = v3;

    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v5 = (void *)qword_26AFC7EE0;
    uint64_t v15 = qword_26AFC7EE0;
    if (!qword_26AFC7EE0)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = sub_24068B214;
      v11[3] = &unk_2650CDDE8;
      v11[4] = &v12;
      sub_24068B214((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    uint64_t v7 = [[v6 alloc] initWithClientName:@"BatteryModule"];
    smartChargeClient = v2->_smartChargeClient;
    v2->_smartChargeClient = (PowerUISmartChargeClient *)v7;

    [(CCUILowPowerModuleViewController *)v2 _observeSystemNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(CCUILowPowerModuleViewController *)self _unobserveSystemNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CCUILowPowerModuleViewController;
  [(CCUILowPowerModuleViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CCUILowPowerModuleViewController;
  [(CCUIMenuModuleViewController *)&v3 viewDidLoad];
  [(CCUILowPowerModuleViewController *)self reconfigureView];
  [(CCUILowPowerModuleViewController *)self refreshStateAnimated:0];
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUILowPowerModuleViewController;
  [(CCUIMenuModuleViewController *)&v5 willTransitionToExpandedContentMode:a3];
  v4 = [(CCUILowPowerModuleViewController *)self glyphPackageDescription];
  [(CCUIMenuModuleViewController *)self setGlyphPackageDescription:v4];

  [(CCUILowPowerModuleViewController *)self refreshStateAnimated:0];
}

- (void)reconfigureView
{
  objc_super v3 = [(CCUILowPowerModuleViewController *)self glyphPackageDescription];
  [(CCUIMenuModuleViewController *)self setGlyphPackageDescription:v3];

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:@"CONTROL_CENTER_TITLE" value:&stru_26F4CCA10 table:0];
  [(CCUIMenuModuleViewController *)self setTitle:v5];

  [(CCUIMenuModuleViewController *)self setIndentation:1];

  MEMORY[0x270F9A6D0](self, sel_setUseTrailingCheckmarkLayout_);
}

- (void)refreshStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_24068A4B4;
  v9[3] = &unk_2650CDD70;
  v9[4] = self;
  objc_super v5 = (void *)MEMORY[0x2455F3B90](v9, a2);
  if (v3)
  {
    v6 = (void *)MEMORY[0x263F33C78];
    uint64_t v7 = [(CCUILowPowerModuleViewController *)self viewIfLoaded];
    v8 = [v7 window];
    [v6 performWithoutAnimationWhileHiddenInWindow:v8 actions:v5];
  }
  else
  {
    [MEMORY[0x263F1CB60] performWithoutAnimation:v5];
  }
}

- (id)_makeLocalizedMenuItem:(id)a3 handler:(id)a4
{
  objc_super v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:v7 value:&stru_26F4CCA10 table:0];

  objc_super v10 = (void *)[objc_alloc(MEMORY[0x263F33CC0]) initWithTitle:v9 identifier:v9 handler:v6];

  return v10;
}

- (void)_configureMenu
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_24068A850;
  v23[3] = &unk_2650CDD98;
  objc_copyWeak(&v24, &location);
  v4 = [(CCUILowPowerModuleViewController *)self _makeLocalizedMenuItem:@"CONTROL_CENTER_TITLE" handler:v23];
  objc_msgSend(v4, "setSelected:", -[CCUILowPowerModuleViewController isSelected](self, "isSelected"));
  [v3 addObject:v4];
  smartChargeClient = self->_smartChargeClient;
  id v22 = 0;
  uint64_t v6 = [(PowerUISmartChargeClient *)smartChargeClient isMCMCurrentlyEnabled:&v22];
  id v7 = v22;
  if (v7)
  {
    v8 = *MEMORY[0x263F33C48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C48], OS_LOG_TYPE_ERROR)) {
      sub_24068B444(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    if ([(CCUILowPowerModuleViewController *)self isEAconnected])
    {
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = sub_24068A884;
      v20 = &unk_2650CDD98;
      objc_copyWeak(&v21, &location);
      v16 = [(CCUILowPowerModuleViewController *)self _makeLocalizedMenuItem:@"MENU_MCM_DISABLE" handler:&v17];
      objc_msgSend(v16, "setSelected:", v6 == 2, v17, v18, v19, v20);
      [v3 addObject:v16];

      objc_destroyWeak(&v21);
    }
    [(CCUIMenuModuleViewController *)self setMenuItems:v3];
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (id)glyphPackageDescription
{
  BOOL v2 = UIAccessibilityDarkerSystemColorsEnabled();
  id v3 = @"LowPower";
  if (v2) {
    id v3 = @"LowPower_IC";
  }
  v4 = (void *)MEMORY[0x263F33C68];
  objc_super v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = v3;
  id v7 = [v5 bundleForClass:objc_opt_class()];
  v8 = [v4 descriptionForPackageNamed:v6 inBundle:v7];

  [v8 setFlipsForRightToLeftLayoutDirection:1];

  return v8;
}

- (id)glyphState
{
  if ([(CCUIButtonModuleViewController *)self appearsSelected]) {
    return @"enabled";
  }
  else {
    return @"disabled";
  }
}

- (BOOL)isSelected
{
  return [(_PMLowPowerMode *)self->_lowPowerMode getPowerMode] == 1;
}

- (BOOL)isEAconnected
{
  smartChargeClient = self->_smartChargeClient;
  uint64_t v4 = 0;
  BOOL result = [(PowerUISmartChargeClient *)smartChargeClient shouldMCMBeDisplayed:&v4];
  if (v4) {
    return 0;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  return MEMORY[0x270F95FB8](@"s7nuHoZIYNoOHCqT9iyZkQ", a2);
}

- (void)_observeSystemNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateState name:*MEMORY[0x263F08450] object:0];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = sub_24068AB38();
  [v4 addObserver:self selector:sel__updateState name:v5 object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__updateForDarkerSystemColorsChange name:*MEMORY[0x263F1CDF0] object:0];
}

- (void)_unobserveSystemNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F08450] object:0];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  objc_super v5 = sub_24068AB38();
  [v4 removeObserver:self name:v5 object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F1CDF0] object:0];
}

- (void)_updateState
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24068AD88;
  block[3] = &unk_2650CDD70;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)toggleLowPowerMode
{
  [(CCUILowPowerModuleViewController *)self isSelected];

  MEMORY[0x270F9A6D0](self, sel_setLowPowerMode_);
}

- (void)setLowPowerMode:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CCUILowPowerModuleViewController *)self isSelected] != a3)
  {
    objc_initWeak(&location, self);
    lowPowerMode = self->_lowPowerMode;
    uint64_t v6 = *MEMORY[0x263F52790];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_24068AED4;
    v7[3] = &unk_2650CDDC0;
    BOOL v9 = v3;
    objc_copyWeak(&v8, &location);
    [(_PMLowPowerMode *)lowPowerMode setPowerMode:v3 fromSource:v6 withCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)toggleMobileChargeMode
{
  smartChargeClient = self->_smartChargeClient;
  id v14 = 0;
  uint64_t v4 = [(PowerUISmartChargeClient *)smartChargeClient isMCMCurrentlyEnabled:&v14];
  id v5 = v14;
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F33C48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C48], OS_LOG_TYPE_ERROR)) {
      sub_24068B444(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    [(CCUILowPowerModuleViewController *)self setMobileChargeMode:v4 != 1];
  }
}

- (void)setMobileChargeMode:(BOOL)a3
{
  smartChargeClient = self->_smartChargeClient;
  if (a3)
  {
    uint64_t v15 = 0;
    uint64_t v4 = (id *)&v15;
    [(PowerUISmartChargeClient *)smartChargeClient enableMCM:&v15];
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v4 = (id *)&v14;
    [(PowerUISmartChargeClient *)smartChargeClient temporarilyDisableMCM:&v14];
  }
  id v5 = *v4;
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x263F33C48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F33C48], OS_LOG_TYPE_ERROR)) {
      sub_24068B4F4(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartChargeClient, 0);

  objc_storeStrong((id *)&self->_lowPowerMode, 0);
}

@end