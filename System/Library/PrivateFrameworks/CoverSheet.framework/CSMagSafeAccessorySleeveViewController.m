@interface CSMagSafeAccessorySleeveViewController
- (BCBatteryDeviceController)batteryDeviceController;
- (BOOL)chargingAnimationVisible;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasChargingAnimation;
- (BOOL)isStatic;
- (BOOL)showingChargingAnimation;
- (BrightnessSystemClient)brightnessClient;
- (CGRect)visibleBounds;
- (CSMagSafeAccessorySleeveView)sleeveView;
- (CSMagSafeAccessorySleeveViewController)initWithAccessory:(id)a3;
- (SBFDateProviding)dateProvider;
- (SBFLockScreenDateViewController)dateViewController;
- (SBFLockScreenDateViewController)secondaryDateViewController;
- (_UILegibilitySettings)legibilitySettings;
- (double)animationDurationBeforeDismissal;
- (double)chargingAnimationDuration;
- (id)_legibilitySettingsForAccessory:(id)a3;
- (id)accessoryView;
- (void)_removeOverrideFloor;
- (void)_updateOverrideFloor;
- (void)connectedDevicesDidChange:(id)a3;
- (void)setBatteryDeviceController:(id)a3;
- (void)setBrightnessClient:(id)a3;
- (void)setChargingAnimationVisible:(BOOL)a3;
- (void)setDateProvider:(id)a3;
- (void)setDateViewController:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSecondaryDateViewController:(id)a3;
- (void)setSleeveView:(id)a3;
- (void)setVisibleBounds:(CGRect)a3;
- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4;
- (void)updateFont:(id)a3 textColor:(id)a4 vibrancyConfiguration:(id)a5 numberingSystem:(id)a6;
- (void)updateViewWithBatteryCharging:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSMagSafeAccessorySleeveViewController

- (CSMagSafeAccessorySleeveViewController)initWithAccessory:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  v3 = [(CSMagSafeAccessoryViewController *)&v12 initWithAccessory:a3];
  if (v3)
  {
    v4 = [CSMagSafeAccessorySleeveView alloc];
    uint64_t v5 = -[CSMagSafeAccessorySleeveView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sleeveView = v3->_sleeveView;
    v3->_sleeveView = (CSMagSafeAccessorySleeveView *)v5;

    v3->_chargingAnimationVisible = 0;
    v7 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E4FA5F60]);
    dateViewController = v3->_dateViewController;
    v3->_dateViewController = v7;

    v9 = (SBFLockScreenDateViewController *)objc_alloc_init(MEMORY[0x1E4FA5F60]);
    secondaryDateViewController = v3->_secondaryDateViewController;
    v3->_secondaryDateViewController = v9;
  }
  return v3;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  [(CSCoverSheetViewControllerBase *)&v19 viewDidLoad];
  v3 = [(CSMagSafeAccessoryViewController *)self accessory];
  v4 = [(CSMagSafeAccessorySleeveViewController *)self _legibilitySettingsForAccessory:v3];

  uint64_t v5 = [(CSMagSafeAccessorySleeveViewController *)self view];
  [v5 addSubview:self->_sleeveView];

  v6 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
  [v6 setLegibilitySettings:self->_legibilitySettings];

  [(SBFLockScreenDateViewController *)self->_dateViewController setRestrictsVibrancy:1];
  v7 = [(SBFLockScreenDateViewController *)self->_secondaryDateViewController dateView];
  [v7 setLegibilitySettings:v4];

  [(SBFLockScreenDateViewController *)self->_secondaryDateViewController setRestrictsVibrancy:1];
  objc_initWeak(&location, self);
  dateViewController = self->_dateViewController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke;
  v15[3] = &unk_1E6ADA9C8;
  objc_copyWeak(&v17, &location);
  id v9 = v4;
  id v16 = v9;
  [(CSMagSafeAccessorySleeveViewController *)self bs_addChildViewController:dateViewController animated:0 transitionBlock:v15];
  secondaryDateViewController = self->_secondaryDateViewController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke_2;
  v12[3] = &unk_1E6ADA9C8;
  objc_copyWeak(&v14, &location);
  id v11 = v9;
  id v13 = v11;
  [(CSMagSafeAccessorySleeveViewController *)self bs_addChildViewController:secondaryDateViewController animated:0 transitionBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained sleeveView];
  v6 = [WeakRetained dateViewController];
  v7 = [v6 dateView];
  [v5 setDateView:v7];

  v8 = [WeakRetained sleeveView];
  [WeakRetained visibleBounds];
  objc_msgSend(v8, "setVisibleWindowFrame:");

  id v9 = [WeakRetained sleeveView];
  [v9 setLegibilitySettings:*(void *)(a1 + 32)];

  v4[2](v4);
}

void __53__CSMagSafeAccessorySleeveViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained sleeveView];
  v6 = [WeakRetained secondaryDateViewController];
  v7 = [v6 dateView];
  [v5 setSecondaryDateView:v7];

  v8 = [WeakRetained sleeveView];
  [WeakRetained visibleBounds];
  objc_msgSend(v8, "setVisibleWindowFrame:");

  id v9 = [WeakRetained sleeveView];
  [v9 setLegibilitySettings:*(void *)(a1 + 32)];

  v4[2](v4);
}

- (id)_legibilitySettingsForAccessory:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F43228];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 primaryColor];
  v7 = [v4 secondaryColor];

  v8 = (void *)[v5 initWithStyle:1 primaryColor:v6 secondaryColor:v7 shadowColor:0];

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v7, sel_viewWillAppear_);
  [(CSMagSafeAccessorySleeveViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_dateViewController toVisible:1 animated:v3];
  if (!self->_batteryDeviceController)
  {
    id v5 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    batteryDeviceController = self->_batteryDeviceController;
    self->_batteryDeviceController = v5;

    [(BCBatteryDeviceController *)self->_batteryDeviceController addBatteryDeviceObserver:self queue:MEMORY[0x1E4F14428]];
  }
  [(CSMagSafeAccessorySleeveViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_secondaryDateViewController toVisible:1 animated:v3];
  [(CSMagSafeAccessorySleeveViewController *)self _updateOverrideFloor];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:a3];
  [(CSMagSafeAccessorySleeveViewController *)self bs_endAppearanceTransitionForChildViewController:self->_dateViewController];
  [(CSMagSafeAccessorySleeveViewController *)self bs_endAppearanceTransitionForChildViewController:self->_secondaryDateViewController];
  sleeveView = self->_sleeveView;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CSMagSafeAccessorySleeveViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_1E6AD87F8;
  v5[4] = self;
  [(CSMagSafeAccessorySleeveView *)sleeveView performAnimation:0 completionHandler:v5];
}

void __56__CSMagSafeAccessorySleeveViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = +[CSAction actionWithType:3];
  [v1 sendAction:v2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(CSMagSafeAccessorySleeveViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_dateViewController toVisible:0 animated:v3];
  [(CSMagSafeAccessorySleeveViewController *)self bs_beginAppearanceTransitionForChildViewController:self->_secondaryDateViewController toVisible:0 animated:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:a3];
  [(CSMagSafeAccessorySleeveViewController *)self bs_endAppearanceTransitionForChildViewController:self->_dateViewController];
  [(CSMagSafeAccessorySleeveViewController *)self bs_endAppearanceTransitionForChildViewController:self->_secondaryDateViewController];
  batteryDeviceController = self->_batteryDeviceController;
  if (batteryDeviceController)
  {
    [(BCBatteryDeviceController *)batteryDeviceController removeBatteryDeviceObserver:self];
    objc_super v5 = self->_batteryDeviceController;
    self->_batteryDeviceController = 0;
  }
  [(CSMagSafeAccessorySleeveViewController *)self _removeOverrideFloor];
}

- (void)setDateProvider:(id)a3
{
  dateViewController = self->_dateViewController;
  id v5 = a3;
  [(SBFLockScreenDateViewController *)dateViewController setDateProvider:v5];
  [(SBFLockScreenDateViewController *)self->_secondaryDateViewController setDateProvider:v5];
}

- (void)setVisibleBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CSMagSafeAccessorySleeveView *)self->_sleeveView visibleWindowFrame];
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    self->_visibleBounds.origin.double x = x;
    self->_visibleBounds.origin.double y = y;
    self->_visibleBounds.size.double width = width;
    self->_visibleBounds.size.double height = height;
    sleeveView = self->_sleeveView;
    -[CSMagSafeAccessorySleeveView setVisibleWindowFrame:](sleeveView, "setVisibleWindowFrame:", x, y, width, height);
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    CGRect v11 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    objc_super v6 = [(SBFLockScreenDateViewController *)self->_dateViewController dateViewIfExists];
    [v6 setLegibilitySettings:self->_legibilitySettings];

    objc_super v7 = [(CSMagSafeAccessoryViewController *)self accessory];
    v8 = [(CSMagSafeAccessorySleeveViewController *)self _legibilitySettingsForAccessory:v7];

    id v9 = [(SBFLockScreenDateViewController *)self->_secondaryDateViewController dateViewIfExists];
    [v9 setLegibilitySettings:v8];

    CGRect v10 = [(CSMagSafeAccessorySleeveViewController *)self sleeveView];
    [v10 setLegibilitySettings:v8];

    id v5 = v11;
  }
}

- (void)updateFont:(id)a3 textColor:(id)a4 vibrancyConfiguration:(id)a5 numberingSystem:(id)a6
{
  dateViewController = self->_dateViewController;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(SBFLockScreenDateViewController *)dateViewController dateView];
  [v15 setVibrancyConfiguration:v12];

  id v16 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
  [v16 setTextColor:v13];

  id v17 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
  [v17 setCustomTimeFont:v14];

  v18 = [(SBFLockScreenDateViewController *)self->_dateViewController dateView];
  [v18 setCustomTimeNumberingSystem:v11];

  objc_super v19 = [(SBFLockScreenDateViewController *)self->_secondaryDateViewController dateView];
  [v19 setVibrancyConfiguration:v12];

  v20 = [(SBFLockScreenDateViewController *)self->_secondaryDateViewController dateView];
  [v20 setCustomTimeFont:v14];

  id v21 = [(SBFLockScreenDateViewController *)self->_secondaryDateViewController dateView];
  [v21 setCustomTimeNumberingSystem:v11];
}

- (void)updateViewWithBatteryCharging:(BOOL)a3
{
}

- (BOOL)isStatic
{
  return 1;
}

- (BOOL)hasChargingAnimation
{
  return 1;
}

- (BOOL)showingChargingAnimation
{
  return self->_chargingAnimationVisible;
}

- (double)chargingAnimationDuration
{
  return 3.0;
}

- (id)accessoryView
{
  return self->_sleeveView;
}

- (double)animationDurationBeforeDismissal
{
  [(CSMagSafeAccessorySleeveView *)self->_sleeveView animationDurationBeforeDismissal];
  return result;
}

- (void)transitionChargingViewVisible:(BOOL)a3 chargingInfo:(id)a4
{
  self->_chargingAnimationVisible = a3;
}

- (BOOL)handleEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSMagSafeAccessorySleeveViewController;
  id v4 = a3;
  [(CSMagSafeAccessoryViewController *)&v7 handleEvent:v4];
  uint64_t v5 = objc_msgSend(v4, "type", v7.receiver, v7.super_class);

  if (v5 == 24)
  {
    [(CSMagSafeAccessorySleeveViewController *)self _updateOverrideFloor];
    return 1;
  }
  if (v5 == 25)
  {
    [(CSMagSafeAccessorySleeveViewController *)self _removeOverrideFloor];
    return 1;
  }
  return 0;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isInternal]) {
          -[CSMagSafeAccessorySleeveViewController updateViewWithBatteryCharging:](self, "updateViewWithBatteryCharging:", [v9 isCharging]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_updateOverrideFloor
{
  v12[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CSLockScreenDomain rootSettings];
  id v4 = [v3 chargingSettings];

  if ([v4 shouldUseBrightnessFloor])
  {
    if (!self->_brightnessClient)
    {
      uint64_t v5 = (BrightnessSystemClient *)objc_alloc_init(MEMORY[0x1E4F5B290]);
      brightnessClient = self->_brightnessClient;
      self->_brightnessClient = v5;
    }
    [v4 brightnessFloor];
    uint64_t v7 = self->_brightnessClient;
    *(float *)&double v8 = v8;
    v11[0] = @"nits";
    id v9 = [NSNumber numberWithFloat:v8];
    v11[1] = @"period";
    v12[0] = v9;
    v12[1] = &unk_1F306AA38;
    long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    [(BrightnessSystemClient *)v7 setProperty:v10 forKey:@"MinNits"];
  }
  else
  {
    [(CSMagSafeAccessorySleeveViewController *)self _removeOverrideFloor];
  }
}

- (void)_removeOverrideFloor
{
  v5[2] = *MEMORY[0x1E4F143B8];
  brightnessClient = self->_brightnessClient;
  v4[0] = @"nits";
  v4[1] = @"period";
  v5[0] = &unk_1F306AA48;
  v5[1] = &unk_1F306AA38;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  [(BrightnessSystemClient *)brightnessClient setProperty:v3 forKey:@"MinNits"];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (CGRect)visibleBounds
{
  double x = self->_visibleBounds.origin.x;
  double y = self->_visibleBounds.origin.y;
  double width = self->_visibleBounds.size.width;
  double height = self->_visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SBFLockScreenDateViewController)dateViewController
{
  return self->_dateViewController;
}

- (void)setDateViewController:(id)a3
{
}

- (SBFLockScreenDateViewController)secondaryDateViewController
{
  return self->_secondaryDateViewController;
}

- (void)setSecondaryDateViewController:(id)a3
{
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (void)setBatteryDeviceController:(id)a3
{
}

- (CSMagSafeAccessorySleeveView)sleeveView
{
  return self->_sleeveView;
}

- (void)setSleeveView:(id)a3
{
}

- (BOOL)chargingAnimationVisible
{
  return self->_chargingAnimationVisible;
}

- (void)setChargingAnimationVisible:(BOOL)a3
{
  self->_chargingAnimationVisible = a3;
}

- (BrightnessSystemClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brightnessClient, 0);
  objc_storeStrong((id *)&self->_sleeveView, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_secondaryDateViewController, 0);
  objc_storeStrong((id *)&self->_dateViewController, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);

  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end