@interface DBLockOutController
- (BOOL)_shouldLockoutForHello;
- (BOOL)_shouldLockoutForUISync;
- (BOOL)isInvalidated;
- (BOOL)isLockedOut;
- (BOOL)receivedUISyncRequestLayout;
- (BSInvalidatable)lockOutLayoutElementAssertion;
- (DBBuddyMonitor)buddyMonitor;
- (DBDashboardStateProvider)dashboardStateProvider;
- (DBDisclosureMonitor)disclosureMonitor;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBKeybagMonitor)keybagMonitor;
- (DBLockOutController)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4 dashboardStateProvider:(id)a5 delegate:(id)a6;
- (DBLockOutViewController)lockOutViewController;
- (DBLockOutWindow)lockOutWindow;
- (DBLockoutControllerDelegate)delegate;
- (DBSiriMonitor)siriMonitor;
- (id)_windowBackgroundColorForCurrentMode;
- (id)wallpaperViewForLockOutViewController:(id)a3;
- (int64_t)lockOutMode;
- (void)_markHelloCompleted;
- (void)buddyMonitorDidChangeFinished:(id)a3;
- (void)didReceiveRequestLayoutCommand;
- (void)disclosureMonitorDidChangeActive:(id)a3;
- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3;
- (void)invalidate;
- (void)keybagMonitorLockStateDidChange:(id)a3;
- (void)lockOutViewController:(id)a3 didTapButtonOfType:(unint64_t)a4;
- (void)lockOutViewControllerWantsToDismiss:(id)a3;
- (void)setBuddyMonitor:(id)a3;
- (void)setDashboardStateProvider:(id)a3;
- (void)setDisclosureMonitor:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setKeybagMonitor:(id)a3;
- (void)setLockOutLayoutElementAssertion:(id)a3;
- (void)setLockOutMode:(int64_t)a3;
- (void)setLockOutViewController:(id)a3;
- (void)setLockOutWindow:(id)a3;
- (void)setReceivedUISyncRequestLayout:(BOOL)a3;
- (void)setSiriMonitor:(id)a3;
- (void)siriMonitorDidChangeEnabled:(id)a3;
- (void)thermalMonitorLevelDidChange:(id)a3;
- (void)updateLockOutModeAnimated:(BOOL)a3;
- (void)updateLockOutModeAnimated:(BOOL)a3 takeScreen:(BOOL)a4;
@end

@implementation DBLockOutController

- (DBLockOutController)initWithWindowScene:(id)a3 environmentConfiguration:(id)a4 dashboardStateProvider:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v46.receiver = self;
  v46.super_class = (Class)DBLockOutController;
  v14 = [(DBLockOutController *)&v46 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v13);
    objc_storeStrong((id *)&v15->_environmentConfiguration, a4);
    [v11 addObserver:v15];
    v16 = [v11 thermalMonitor];
    [v16 addObserver:v15];

    objc_storeStrong((id *)&v15->_dashboardStateProvider, a5);
    v17 = [v11 displayConfiguration];
    [v11 currentSafeViewAreaFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v15->_lockOutMode = 0;
    v26 = objc_alloc_init(DBBuddyMonitor);
    buddyMonitor = v15->_buddyMonitor;
    v15->_buddyMonitor = v26;

    [(DBBuddyMonitor *)v15->_buddyMonitor addObserver:v15];
    v28 = objc_alloc_init(DBDisclosureMonitor);
    disclosureMonitor = v15->_disclosureMonitor;
    v15->_disclosureMonitor = v28;

    [(DBDisclosureMonitor *)v15->_disclosureMonitor addObserver:v15];
    v30 = objc_alloc_init(DBKeybagMonitor);
    keybagMonitor = v15->_keybagMonitor;
    v15->_keybagMonitor = v30;

    [(DBKeybagMonitor *)v15->_keybagMonitor addObserver:v15];
    v32 = objc_alloc_init(DBSiriMonitor);
    siriMonitor = v15->_siriMonitor;
    v15->_siriMonitor = v32;

    [(DBSiriMonitor *)v15->_siriMonitor addObserver:v15];
    v34 = [DBLockOutWindow alloc];
    v35 = NSString;
    v36 = [v17 identity];
    v37 = [v35 stringWithFormat:@"lockout-%@", v36];
    uint64_t v38 = -[DBLockOutWindow _initWithFrame:debugName:windowScene:](v34, "_initWithFrame:debugName:windowScene:", v37, v10, v19, v21, v23, v25);
    lockOutWindow = v15->_lockOutWindow;
    v15->_lockOutWindow = (DBLockOutWindow *)v38;

    [(DBLockOutWindow *)v15->_lockOutWindow setLevel:*MEMORY[0x263F83C58] + 8.0];
    v40 = v15->_lockOutWindow;
    v41 = [(DBLockOutController *)v15 _windowBackgroundColorForCurrentMode];
    [(DBLockOutWindow *)v40 setBackgroundColor:v41];

    v42 = [(DBLockOutWindow *)v15->_lockOutWindow layer];
    [v42 setCornerCurve:*MEMORY[0x263F15A20]];

    [(DBLockOutWindow *)v15->_lockOutWindow setClipsToBounds:1];
    v43 = [[DBLockOutViewController alloc] initWithEnvironmentConfiguration:v11];
    lockOutViewController = v15->_lockOutViewController;
    v15->_lockOutViewController = v43;

    [(DBLockOutViewController *)v15->_lockOutViewController setDelegate:v15];
    [(DBLockOutWindow *)v15->_lockOutWindow setRootViewController:v15->_lockOutViewController];
    [(DBLockOutWindow *)v15->_lockOutWindow setHidden:1];
  }
  return v15;
}

- (BOOL)isLockedOut
{
  return [(DBLockOutController *)self lockOutMode] != 1;
}

- (void)updateLockOutModeAnimated:(BOOL)a3
{
}

- (void)updateLockOutModeAnimated:(BOOL)a3 takeScreen:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  v7 = [(DBLockOutController *)self environmentConfiguration];
  v8 = [v7 thermalMonitor];
  char v9 = [v8 isThermalBlocked];

  if (v9)
  {
    unint64_t v10 = 4;
    goto LABEL_20;
  }
  id v11 = [(DBLockOutController *)self keybagMonitor];
  if ([v11 isLocked])
  {
    id v12 = [(DBLockOutController *)self environmentConfiguration];
    int v13 = [v12 isPairedVehicle];

    if (!v13) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v14 = [(DBLockOutController *)self keybagMonitor];
  char v15 = [v14 isBlocked];

  if (v15)
  {
LABEL_8:
    unint64_t v10 = 2;
    goto LABEL_20;
  }
  v16 = [(DBLockOutController *)self siriMonitor];
  int v17 = [v16 siriEnabled];

  if (v17)
  {
    double v18 = [(DBLockOutController *)self buddyMonitor];
    int v19 = [v18 buddyFinished];

    if (v19)
    {
      double v20 = [(DBLockOutController *)self disclosureMonitor];
      char v21 = [v20 active];

      if (v21)
      {
        unint64_t v10 = 7;
      }
      else if ([(DBLockOutController *)self _shouldLockoutForUISync])
      {
        unint64_t v10 = 8;
      }
      else if ([(DBLockOutController *)self _shouldLockoutForHello])
      {
        unint64_t v10 = 9;
      }
      else
      {
        unint64_t v10 = 1;
      }
    }
    else
    {
      unint64_t v10 = 6;
    }
  }
  else
  {
    unint64_t v10 = 3;
  }
LABEL_20:
  if ([(DBLockOutController *)self lockOutMode] != v10
    && ![(DBLockOutController *)self isInvalidated])
  {
    double v22 = DBLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = DBDescriptionForLockOutMode(v10);
      int v40 = 138412290;
      v41 = v23;
      _os_log_impl(&dword_22D6F0000, v22, OS_LOG_TYPE_DEFAULT, "[DBLockOutController] Setting new lock out mode: %@", (uint8_t *)&v40, 0xCu);
    }
    int64_t v24 = [(DBLockOutController *)self lockOutMode];
    [(DBLockOutController *)self setLockOutMode:v10];
    if ([(DBLockOutController *)self isLockedOut]) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 2;
    }
    v26 = [(DBLockOutController *)self dashboardStateProvider];
    [v26 setLockoutState:v25];

    v27 = [(DBLockOutController *)self delegate];
    [v27 lockOutController:self didChangeFromLockoutMode:v24 toLockOutMode:v10 animated:v5 takeScreen:v4];

    if ([(DBLockOutController *)self isLockedOut])
    {
      v28 = [(DBLockOutController *)self lockOutLayoutElementAssertion];
      if (v28)
      {
      }
      else if (![(DBLockOutController *)self isInvalidated])
      {
        v32 = DBLogForCategory(0);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_22D6F0000, v32, OS_LOG_TYPE_DEFAULT, "Activating layout element for lock out screen", (uint8_t *)&v40, 2u);
        }

        id v33 = objc_alloc(MEMORY[0x263F3F718]);
        v34 = (void *)[v33 initWithIdentifier:*MEMORY[0x263F3F560]];
        [v34 setLevel:3];
        [v34 setFillsDisplayBounds:1];
        v35 = [(DBLockOutController *)self environmentConfiguration];
        v36 = [v35 displayLayoutPublisher];
        v37 = [v36 addElement:v34];
        [(DBLockOutController *)self setLockOutLayoutElementAssertion:v37];

        goto LABEL_39;
      }
    }
    if (![(DBLockOutController *)self isLockedOut])
    {
      v29 = [(DBLockOutController *)self lockOutLayoutElementAssertion];

      if (v29)
      {
        v30 = DBLogForCategory(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_22D6F0000, v30, OS_LOG_TYPE_DEFAULT, "Invalidating layout element for lock out screen", (uint8_t *)&v40, 2u);
        }

        v31 = [(DBLockOutController *)self lockOutLayoutElementAssertion];
        [v31 invalidate];

        [(DBLockOutController *)self setLockOutLayoutElementAssertion:0];
      }
    }
LABEL_39:
    lockOutWindow = self->_lockOutWindow;
    v39 = [(DBLockOutController *)self _windowBackgroundColorForCurrentMode];
    [(DBLockOutWindow *)lockOutWindow setBackgroundColor:v39];
  }
}

- (void)invalidate
{
  v3 = [(DBLockOutController *)self lockOutWindow];
  [v3 setHidden:1];

  [(DBLockOutController *)self setLockOutWindow:0];
  [(DBLockOutController *)self setLockOutViewController:0];
  BOOL v4 = [(DBLockOutController *)self lockOutLayoutElementAssertion];

  if (v4)
  {
    BOOL v5 = DBLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating layout element for lock out screen", v7, 2u);
    }

    v6 = [(DBLockOutController *)self lockOutLayoutElementAssertion];
    [v6 invalidate];

    [(DBLockOutController *)self setLockOutLayoutElementAssertion:0];
  }
  [(DBLockOutController *)self setInvalidated:1];
}

- (id)_windowBackgroundColorForCurrentMode
{
  if ([(DBLockOutController *)self lockOutMode] == 9)
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263F825C8] tableBackgroundColor];
  }
  return v2;
}

- (BOOL)_shouldLockoutForHello
{
  v3 = [(DBLockOutController *)self environmentConfiguration];
  if (![v3 supportsGaugeCluster]) {
    goto LABEL_5;
  }
  BOOL v4 = [(DBLockOutController *)self environmentConfiguration];
  int v5 = [v4 supportsDisplayPlugin];

  if (!v5) {
    return 0;
  }
  v6 = [(DBLockOutController *)self environmentConfiguration];
  v3 = [v6 vehicle];

  if (v3)
  {
    v7 = [v3 finishedWelcome];
    BOOL v8 = v7 == 0;
  }
  else
  {
LABEL_5:
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldLockoutForUISync
{
  v3 = [(DBLockOutController *)self environmentConfiguration];
  if ([v3 supportsGaugeCluster])
  {
    BOOL v4 = [(DBLockOutController *)self environmentConfiguration];
    int v5 = [v4 supportsDisplayPlugin];

    if (v5) {
      return ![(DBLockOutController *)self receivedUISyncRequestLayout];
    }
  }
  else
  {
  }
  return 0;
}

- (void)keybagMonitorLockStateDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DBLockOutController_keybagMonitorLockStateDidChange___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__DBLockOutController_keybagMonitorLockStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (void)thermalMonitorLevelDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__DBLockOutController_thermalMonitorLevelDidChange___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__DBLockOutController_thermalMonitorLevelDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (void)disclosureMonitorDidChangeActive:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DBLockOutController_disclosureMonitorDidChangeActive___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__DBLockOutController_disclosureMonitorDidChangeActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (id)wallpaperViewForLockOutViewController:(id)a3
{
  BOOL v4 = [(DBLockOutController *)self delegate];
  int v5 = [v4 wallpaperViewForLockOutController:self];

  return v5;
}

- (void)lockOutViewController:(id)a3 didTapButtonOfType:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0x3E8uLL:
    case 0x3EAuLL:
      v7 = DBLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v7, OS_LOG_TYPE_INFO, "[LockOut] Action: requesting car UI", buf, 2u);
      }

      BOOL v8 = [(DBLockOutController *)self environmentConfiguration];
      char v9 = [v8 session];
      [v9 requestCarUI];

      goto LABEL_13;
    case 0x3E9uLL:
      BOOL v8 = DBLogForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_INFO, "[LockOut] Action: enabling siri", v14, 2u);
      }
      goto LABEL_13;
    case 0x3EBuLL:
      id v11 = DBLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_INFO, "[LockOut] Action: disclosure safe", v13, 2u);
      }

      BOOL v8 = [(DBLockOutController *)self disclosureMonitor];
      [v8 markSafe];
      goto LABEL_13;
    case 0x3ECuLL:
      unint64_t v10 = DBLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_22D6F0000, v10, OS_LOG_TYPE_INFO, "[LockOut] Action: features off", v12, 2u);
      }

      BOOL v8 = [(DBLockOutController *)self disclosureMonitor];
      [v8 turnFeaturesOff];
LABEL_13:

      break;
    default:
      break;
  }
}

- (void)lockOutViewControllerWantsToDismiss:(id)a3
{
  if ([a3 lockOutMode] == 9) {
    [(DBLockOutController *)self _markHelloCompleted];
  }
  [(DBLockOutController *)self updateLockOutModeAnimated:1];
}

- (void)environmentConfigurationPairedVehiclesDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__DBLockOutController_environmentConfigurationPairedVehiclesDidChange___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __71__DBLockOutController_environmentConfigurationPairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (void)siriMonitorDidChangeEnabled:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DBLockOutController_siriMonitorDidChangeEnabled___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__DBLockOutController_siriMonitorDidChangeEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (void)buddyMonitorDidChangeFinished:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DBLockOutController_buddyMonitorDidChangeFinished___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__DBLockOutController_buddyMonitorDidChangeFinished___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLockOutModeAnimated:1];
}

- (void)didReceiveRequestLayoutCommand
{
  [(DBLockOutController *)self setReceivedUISyncRequestLayout:1];
  [(DBLockOutController *)self updateLockOutModeAnimated:1];
}

- (void)_markHelloCompleted
{
  v2 = [(DBLockOutController *)self environmentConfiguration];
  id v4 = [v2 vehicle];

  [v4 setFinishedWelcome:MEMORY[0x263EFFA88]];
  id v3 = objc_alloc_init(MEMORY[0x263F30EA0]);
  [v3 saveVehicle:v4 completion:&__block_literal_global_29];
}

void __42__DBLockOutController__markHelloCompleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = DBLogForCategory(0);
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_DEFAULT, "marked welcome completed", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __42__DBLockOutController__markHelloCompleted__block_invoke_cold_1((uint64_t)v4, v6);
  }
}

- (int64_t)lockOutMode
{
  return self->_lockOutMode;
}

- (void)setLockOutMode:(int64_t)a3
{
  self->_lockOutMode = a3;
}

- (DBLockOutWindow)lockOutWindow
{
  return self->_lockOutWindow;
}

- (void)setLockOutWindow:(id)a3
{
}

- (DBLockOutViewController)lockOutViewController
{
  return self->_lockOutViewController;
}

- (void)setLockOutViewController:(id)a3
{
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBDashboardStateProvider)dashboardStateProvider
{
  return self->_dashboardStateProvider;
}

- (void)setDashboardStateProvider:(id)a3
{
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (DBBuddyMonitor)buddyMonitor
{
  return self->_buddyMonitor;
}

- (void)setBuddyMonitor:(id)a3
{
}

- (DBDisclosureMonitor)disclosureMonitor
{
  return self->_disclosureMonitor;
}

- (void)setDisclosureMonitor:(id)a3
{
}

- (DBKeybagMonitor)keybagMonitor
{
  return self->_keybagMonitor;
}

- (void)setKeybagMonitor:(id)a3
{
}

- (DBSiriMonitor)siriMonitor
{
  return self->_siriMonitor;
}

- (void)setSiriMonitor:(id)a3
{
}

- (BOOL)receivedUISyncRequestLayout
{
  return self->_receivedUISyncRequestLayout;
}

- (void)setReceivedUISyncRequestLayout:(BOOL)a3
{
  self->_receivedUISyncRequestLayout = a3;
}

- (DBLockoutControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBLockoutControllerDelegate *)WeakRetained;
}

- (BSInvalidatable)lockOutLayoutElementAssertion
{
  return self->_lockOutLayoutElementAssertion;
}

- (void)setLockOutLayoutElementAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutLayoutElementAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriMonitor, 0);
  objc_storeStrong((id *)&self->_keybagMonitor, 0);
  objc_storeStrong((id *)&self->_disclosureMonitor, 0);
  objc_storeStrong((id *)&self->_buddyMonitor, 0);
  objc_storeStrong((id *)&self->_dashboardStateProvider, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
  objc_storeStrong((id *)&self->_lockOutViewController, 0);
  objc_storeStrong((id *)&self->_lockOutWindow, 0);
}

void __42__DBLockOutController__markHelloCompleted__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "failed to save vehicle to mark welcome completed: %@", (uint8_t *)&v2, 0xCu);
}

@end