@interface AMUIBatteryChargingViewController
- (AMUIBatteryChargingView)chargingView;
- (AMUIBatteryChargingViewController)init;
- (BCBatteryDeviceController)batteryController;
- (BOOL)_canShowWhileLocked;
- (BSAbsoluteMachTimer)chargingAnimationDismissalTimer;
- (id)_internalBattery;
- (void)_createNewChargingViewIfNecessary;
- (void)_updateChargingViewIfNecessary;
- (void)_updateChargingViewLegibility;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)performChargingAnimation:(id)a3;
- (void)setBatteryController:(id)a3;
- (void)setChargingAnimationDismissalTimer:(id)a3;
- (void)setChargingView:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMUIBatteryChargingViewController

- (AMUIBatteryChargingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AMUIBatteryChargingViewController;
  v2 = [(AMUIBatteryChargingViewController *)&v6 init];
  if (v2)
  {
    v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x263F29D90]);
    batteryController = v2->_batteryController;
    v2->_batteryController = v3;

    [(BCBatteryDeviceController *)v2->_batteryController addBatteryDeviceObserver:v2 queue:MEMORY[0x263EF83A0]];
  }
  return v2;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_chargingAnimationDismissalTimer invalidate];
  chargingAnimationDismissalTimer = self->_chargingAnimationDismissalTimer;
  self->_chargingAnimationDismissalTimer = 0;

  [(BCBatteryDeviceController *)self->_batteryController removeBatteryDeviceObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)AMUIBatteryChargingViewController;
  [(AMUIBatteryChargingViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIBatteryChargingViewController;
  [(AMUIBatteryChargingViewController *)&v3 viewDidLoad];
  [(AMUIBatteryChargingViewController *)self _createNewChargingViewIfNecessary];
  [(AMUIBatteryChargingViewController *)self _updateChargingViewIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)performChargingAnimation:(id)a3
{
  id v4 = a3;
  [(AMUIBatteryChargingViewController *)self _updateChargingViewLegibility];
  [(AMUIBatteryChargingView *)self->_chargingView presentChargingViewWithCompletionHandler:v4];
}

- (void)_updateChargingViewIfNecessary
{
  id v3 = [(AMUIBatteryChargingViewController *)self _internalBattery];
  [(AMUIBatteryChargingView *)self->_chargingView updateWithBattery:v3];
}

- (void)_createNewChargingViewIfNecessary
{
  if (!self->_chargingView)
  {
    id v14 = +[AMUIBatteryChargingUIConfiguration defaultConfiguration];
    id v3 = +[AMUIBatteryChargingView batteryChargingRingViewWithConfiguration:v14];
    id v4 = [(AMUIBatteryChargingViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    -[AMUIBatteryChargingView setFrame:](v3, "setFrame:", v6, v8, v10, v12);
    [(AMUIBatteryChargingView *)v3 setAutoresizingMask:18];
    [(AMUIBatteryChargingViewController *)self setView:v3];
    chargingView = self->_chargingView;
    self->_chargingView = v3;

    [(AMUIBatteryChargingViewController *)self _updateChargingViewLegibility];
  }
}

- (void)_updateChargingViewLegibility
{
  chargingView = self->_chargingView;
  id v3 = (id)[objc_alloc(MEMORY[0x263F1CCD0]) initWithStyle:1];
  [(AMUIBatteryChargingView *)chargingView setLegibilitySettings:v3];
}

- (id)_internalBattery
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(BCBatteryDeviceController *)self->_batteryController connectedDevices];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "isInternal", (void)v8))
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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

          [(AMUIBatteryChargingViewController *)self _updateChargingViewIfNecessary];
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

- (BCBatteryDeviceController)batteryController
{
  return self->_batteryController;
}

- (void)setBatteryController:(id)a3
{
}

- (AMUIBatteryChargingView)chargingView
{
  return self->_chargingView;
}

- (void)setChargingView:(id)a3
{
}

- (BSAbsoluteMachTimer)chargingAnimationDismissalTimer
{
  return self->_chargingAnimationDismissalTimer;
}

- (void)setChargingAnimationDismissalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingAnimationDismissalTimer, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);

  objc_storeStrong((id *)&self->_batteryController, 0);
}

@end