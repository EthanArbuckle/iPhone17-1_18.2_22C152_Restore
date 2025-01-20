@interface CSChargingViewController
- (BOOL)handleEvent:(id)a3;
- (CSChargingViewController)init;
- (CSChargingViewController)initWithChargingInfo:(id)a3;
- (double)durationBeforeDismissal;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationType;
- (void)_createNewChargingViewForDoubleBattery:(id)a3;
- (void)_updateChargingViewIfNecessary;
- (void)_updateChargingViewLegibility;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)connectedDevicesDidChange:(id)a3;
- (void)performDismissalAnimationWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CSChargingViewController

- (CSChargingViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSChargingViewController;
  v2 = [(CSChargingViewController *)&v8 init];
  if (v2)
  {
    v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    batteryController = v2->_batteryController;
    v2->_batteryController = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    displayedBatteryDevices = v2->_displayedBatteryDevices;
    v2->_displayedBatteryDevices = (NSMutableSet *)v5;
  }
  return v2;
}

- (CSChargingViewController)initWithChargingInfo:(id)a3
{
  id v5 = a3;
  v6 = [(CSChargingViewController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_chargingInfo, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CSChargingViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewDidLoad];
  [(CSChargingViewController *)self _updateChargingViewIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSChargingViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(CSChargingViewController *)self _updateChargingViewLegibility];
  [(CSBatteryChargingView *)self->_chargingView performAnimation:0 completionHandler:0];
}

- (void)aggregateAppearance:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[CSComponent statusBar];
  v6 = [v5 priority:40];
  v7 = [v6 hidden:1];
  [v4 addComponent:v7];

  objc_super v8 = +[CSComponent dateView];
  v9 = [v8 priority:40];
  v10 = [v9 hidden:1];
  [v4 addComponent:v10];

  v11 = +[CSComponent backgroundContent];
  v12 = [v11 priority:40];
  v13 = [v12 hidden:1];
  [v4 addComponent:v13];

  v14 = +[CSComponent pageContent];
  v15 = [v14 priority:40];
  v16 = [v15 hidden:1];
  [v4 addComponent:v16];

  v17 = +[CSComponent pageControl];
  v18 = [v17 priority:40];
  v19 = [v18 hidden:1];
  [v4 addComponent:v19];

  v20 = +[CSComponent proudLock];
  v21 = [v20 priority:40];
  v22 = [v21 hidden:1];
  [v4 addComponent:v22];

  v23 = +[CSComponent quickActions];
  v24 = [v23 priority:40];
  v25 = [v24 hidden:1];
  [v4 addComponent:v25];

  v26 = +[CSComponent controlCenterGrabber];
  v27 = [v26 priority:40];
  v28 = [v27 hidden:1];
  [v4 addComponent:v28];

  v29 = +[CSComponent poseidon];
  v30 = [v29 priority:40];
  v31 = [v30 hidden:1];
  [v4 addComponent:v31];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v32 = self->_displayedBatteryDevices;
  uint64_t v33 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v42;
    uint64_t v36 = *MEMORY[0x1E4F4F9D8];
    while (2)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v32);
        }
        if ([*(id *)(*((void *)&v41 + 1) + 8 * i) productIdentifier] == v36)
        {

          v32 = +[CSComponent homeAffordance];
          v38 = [(NSMutableSet *)v32 priority:40];
          v39 = [v38 hidden:1];
          [v4 addComponent:v39];

          goto LABEL_11;
        }
      }
      uint64_t v34 = [(NSMutableSet *)v32 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v40.receiver = self;
  v40.super_class = (Class)CSChargingViewController;
  [(CSCoverSheetViewControllerBase *)&v40 aggregateAppearance:v4];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSChargingViewController;
  id v3 = a3;
  [(CSCoverSheetViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "setIdleTimerMode:", 3, v4.receiver, v4.super_class);
  [v3 setRestrictedCapabilities:0x8000000];
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CSChargingViewController;
  if ([(CSCoverSheetViewControllerBase *)&v7 handleEvent:v4]
    && ([v4 isConsumable] & 1) != 0)
  {
    char v5 = [v4 isConsumable];
  }
  else
  {
    if ([v4 type] == 1) {
      [(CSChargingViewController *)self _updateChargingViewLegibility];
    }
    char v5 = 0;
  }

  return v5;
}

- (void)_updateChargingViewLegibility
{
  chargingView = self->_chargingView;
  id v4 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  id v3 = [v4 legibilitySettings];
  [(CSBatteryChargingView *)chargingView setLegibilitySettings:v3];
}

- (double)durationBeforeDismissal
{
  BOOL v3 = [(CSBatteryChargingInfo *)self->_chargingInfo isChargingWithInternalWirelessAccessory];
  id v4 = [(CSBatteryChargingInfo *)self->_chargingInfo externalBatteryDevice];

  if (v3)
  {
    double result = 3.65;
    if (v4) {
      return 4.75;
    }
  }
  else
  {
    if (!v4) {
      return *MEMORY[0x1E4FA6F00];
    }
    v6 = [(CSBatteryChargingInfo *)self->_chargingInfo externalBatteryDevice];
    uint64_t v7 = [v6 accessoryCategory];

    objc_super v8 = [(CSBatteryChargingInfo *)self->_chargingInfo externalBatteryDevice];
    uint64_t v9 = [v8 productIdentifier];
    uint64_t v10 = *MEMORY[0x1E4F4F9D8];

    double result = 4.75;
    if (v7 != 4 || v9 != v10) {
      return *MEMORY[0x1E4FA6F00];
    }
  }
  return result;
}

- (void)performDismissalAnimationWithCompletionHandler:(id)a3
{
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 600;
}

- (int64_t)presentationStyle
{
  return 2;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "isPowerSource", (void)v9))
        {

          [(CSChargingViewController *)self _updateChargingViewIfNecessary];
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)_updateChargingViewIfNecessary
{
  id v24 = [(CSBatteryChargingInfo *)self->_chargingInfo externalBatteryDevice];
  BOOL v3 = +[CSLockScreenDomain rootSettings];
  id v4 = [v3 chargingSettings];
  int v5 = [v4 shouldFakeA149Attach];

  if (v5
    && [(CSBatteryChargingInfo *)self->_chargingInfo isChargingWithInternalWirelessAccessory])
  {
    int v6 = 1;
    BOOL v7 = 1;
    id v8 = v24;
  }
  else
  {
    uint64_t v9 = [v24 productIdentifier];
    id v8 = v24;
    int v6 = 0;
    BOOL v7 = v9 == *MEMORY[0x1E4F4F9D8];
  }
  BOOL v10 = v8 != 0;
  BOOL v11 = [(CSBatteryChargingView *)self->_chargingView batteryCount] < 2;
  if ((!self->_chargingView || ((v10 ^ v11) & 1) == 0)
    && ([(NSMutableSet *)self->_displayedBatteryDevices containsObject:v24] & 1) == 0)
  {
    if (v7)
    {
      kdebug_trace();
      kdebug_trace();
    }
    if (v24) {
      [(NSMutableSet *)self->_displayedBatteryDevices addObject:v24];
    }
    -[CSChargingViewController _createNewChargingViewForDoubleBattery:](self, "_createNewChargingViewForDoubleBattery:");
  }
  long long v12 = [(BCBatteryDeviceController *)self->_batteryController sb_deviceInternalBattery];
  chargingView = self->_chargingView;
  uint64_t v14 = CSChargePercentageLabelForBattery(v12);
  [(CSBatteryChargingView *)chargingView setPrimaryBatteryText:v14 forBattery:v12];

  if (v24) {
    int v15 = 1;
  }
  else {
    int v15 = v6;
  }
  if (v15 == 1)
  {
    if (v6) {
      v16 = v12;
    }
    else {
      v16 = v24;
    }
    if (v7)
    {
      v17 = NSString;
      v18 = (void *)MEMORY[0x1E4F28B50];
      id v19 = v16;
      v20 = [v18 bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"BATTERY_PACK_CHARGE" value:&stru_1F3020248 table:@"CoverSheet"];
      v22 = CSSimpleChargePercentageLabelForBattery(v19);
      v23 = objc_msgSend(v17, "stringWithFormat:", v21, v22);
    }
    else
    {
      v23 = CSChargePercentageLabelForBattery(v16);
    }
    [(CSBatteryChargingView *)self->_chargingView setSecondaryBatteryText:v23 forBattery:v16];
  }
}

- (void)_createNewChargingViewForDoubleBattery:(id)a3
{
  chargingView = self->_chargingView;
  id v5 = a3;
  [(CSBatteryChargingView *)chargingView removeFromSuperview];
  [(CSCoverSheetViewControllerBase *)self unregisterView:self->_chargingView];
  int v6 = self->_chargingView;
  self->_chargingView = 0;

  uint64_t v7 = [v5 productIdentifier];
  uint64_t v8 = *MEMORY[0x1E4F4F9D8];
  if (v5 && v7 != v8)
  {
    uint64_t v9 = +[CSBatteryChargingView batteryChargingViewWithDoubleBattery];
LABEL_10:
    uint64_t v14 = (CSBatteryChargingView *)v9;
    goto LABEL_14;
  }
  if ([(CSBatteryChargingInfo *)self->_chargingInfo isChargingWithInternalWirelessAccessory])
  {
    kdebug_trace();
    BOOL v10 = +[CSLockScreenDomain rootSettings];
    BOOL v11 = [v10 chargingSettings];
    int v12 = [v11 shouldFakeA149Attach];

    if (v7 == v8 || v12)
    {
      uint64_t v13 = +[CSMagSafeAccessoryConfiguration batteryCaseConfiguration];
    }
    else
    {
      uint64_t v13 = +[CSMagSafeAccessoryConfiguration defaultConfiguration];
    }
    int v15 = (void *)v13;
    uint64_t v14 = +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:v13];
  }
  else
  {
    if (v7 != v8)
    {
      uint64_t v9 = +[CSBatteryChargingView batteryChargingViewWithSingleBattery];
      goto LABEL_10;
    }
    v16 = +[CSMagSafeAccessoryConfiguration batteryCaseConfiguration];
    uint64_t v14 = +[CSBatteryChargingView batteryChargingRingViewWithConfiguration:v16];
  }
LABEL_14:
  [(CSBatteryChargingView *)v14 setBatteryVisible:1];
  v17 = [(CSChargingViewController *)self view];
  [v17 bounds];
  -[CSBatteryChargingView setFrame:](v14, "setFrame:");

  [(CSBatteryChargingView *)v14 setAutoresizingMask:18];
  v18 = [(CSChargingViewController *)self view];
  [v18 addSubview:v14];

  id v19 = self->_chargingView;
  self->_chargingView = v14;
  v20 = v14;

  [(CSChargingViewController *)self _updateChargingViewLegibility];
  [(CSCoverSheetViewControllerBase *)self registerView:self->_chargingView forRole:2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedBatteryDevices, 0);
  objc_storeStrong((id *)&self->_chargingInfo, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);

  objc_storeStrong((id *)&self->_batteryController, 0);
}

@end