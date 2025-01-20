@interface SCATExternalSwitchSourceController
- (AXSwitchRegistrar)switchRegistrar;
- (BOOL)addLongPressSwitch;
- (BOOL)cachedIdleTimerPref;
- (BOOL)isVisible;
- (BOOL)switchRegistrarShouldFilterEvents:(id)a3;
- (BOOL)switchRegistrarShouldProcessGamepadEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessKeyboardKeyEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessMFIButtonEvent:(id)a3;
- (BOOL)switchRegistrarShouldProcessMIDIEvent:(id)a3;
- (SCATAlertCoordinator)switchAlertCoordinator;
- (SCATExternalSwitchSourceController)init;
- (id)_labelOfType:(int64_t)a3 text:(id)a4;
- (void)_showSoftwareKeyboard:(BOOL)a3;
- (void)_showSwitchAlreadyInUse;
- (void)dealloc;
- (void)loadView;
- (void)setAddLongPressSwitch:(BOOL)a3;
- (void)setCachedIdleTimerPref:(BOOL)a3;
- (void)setSwitchAlertCoordinator:(id)a3;
- (void)setSwitchRegistrar:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)switchRegistrar:(id)a3 didUpdateSwitch:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation SCATExternalSwitchSourceController

- (SCATExternalSwitchSourceController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCATExternalSwitchSourceController;
  v2 = [(SCATExternalSwitchSourceController *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXSwitchRegistrar);
    [(SCATExternalSwitchSourceController *)v2 setSwitchRegistrar:v3];

    v4 = [(SCATExternalSwitchSourceController *)v2 switchRegistrar];
    [v4 setDelegate:v2];

    v5 = [[SCATAlertCoordinator alloc] initWithViewController:v2];
    [(SCATExternalSwitchSourceController *)v2 setSwitchAlertCoordinator:v5];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
  [v3 endFilteringEvents];

  v4 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
  [v4 setDelegate:0];

  [(SCATExternalSwitchSourceController *)self setSwitchRegistrar:0];
  [(SCATExternalSwitchSourceController *)self setSwitchAlertCoordinator:0];
  v5.receiver = self;
  v5.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v5 dealloc];
}

- (void)loadView
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v49 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v49 setAutoresizingMask:18];
  objc_super v7 = +[UIColor systemGroupedBackgroundColor];
  [v49 setBackgroundColor:v7];

  [(SCATExternalSwitchSourceController *)self setView:v49];
  id v8 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v49 addSubview:v8];
  v9 = AXParameterizedLocalizedString();
  v10 = [(SCATExternalSwitchSourceController *)self _labelOfType:0 text:v9];

  v11 = AXParameterizedLocalizedString();
  v12 = [(SCATExternalSwitchSourceController *)self _labelOfType:1 text:v11];

  [v8 addSubview:v10];
  [v8 addSubview:v12];
  v13 = [v10 topAnchor];
  v14 = [v8 safeAreaLayoutGuide];
  v15 = [v14 topAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [v10 leftAnchor];
  v18 = [v8 safeAreaLayoutGuide];
  v19 = [v18 leftAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [v10 rightAnchor];
  v22 = [v8 safeAreaLayoutGuide];
  v23 = [v22 rightAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [v12 topAnchor];
  v26 = [v10 bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:15.0];
  [v27 setActive:1];

  v28 = [v12 leftAnchor];
  v29 = [v8 safeAreaLayoutGuide];
  v30 = [v29 leftAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];

  v32 = [v12 rightAnchor];
  v33 = [v8 safeAreaLayoutGuide];
  v34 = [v33 rightAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [v12 bottomAnchor];
  v37 = [v8 safeAreaLayoutGuide];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v39 setActive:1];

  v40 = [v8 centerYAnchor];
  v41 = [v49 centerYAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [v8 leftAnchor];
  v44 = [v49 leftAnchor];
  v45 = [v43 constraintEqualToAnchor:v44 constant:20.0];
  [v45 setActive:1];

  v46 = [v8 rightAnchor];
  v47 = [v49 rightAnchor];
  v48 = [v46 constraintEqualToAnchor:v47 constant:-20.0];
  [v48 setActive:1];
}

- (id)_labelOfType:(int64_t)a3 text:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setNumberOfLines:0];
  [v6 setText:v5];

  [v6 setTextAlignment:1];
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    objc_super v7 = &UIFontTextStyleSubheadline1;
  }
  else
  {
    objc_super v7 = &UIFontTextStyleHeadline1;
  }
  id v8 = +[UIFont preferredFontForTextStyle:*v7];
  [v6 setFont:v8];

LABEL_6:

  return v6;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v4 viewDidLoad];
  -[SCATExternalSwitchSourceController setCachedIdleTimerPref:](self, "setCachedIdleTimerPref:", [UIApp isIdleTimerDisabled]);
  [UIApp setIdleTimerDisabled:1];
  id v3 = AXParameterizedLocalizedString();
  [(SCATExternalSwitchSourceController *)self setTitle:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v6 viewWillAppear:a3];
  [(SCATExternalSwitchSourceController *)self setVisible:1];
  [(SCATExternalSwitchSourceController *)self _showSoftwareKeyboard:1];
  objc_super v4 = [(SCATExternalSwitchSourceController *)self presentedViewController];

  if (!v4)
  {
    id v5 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
    [v5 beginFilteringEvents];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v5 viewWillDisappear:a3];
  [(SCATExternalSwitchSourceController *)self setVisible:0];
  [(SCATExternalSwitchSourceController *)self _showSoftwareKeyboard:0];
  objc_super v4 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
  [v4 endFilteringEvents];

  objc_msgSend(UIApp, "setIdleTimerDisabled:", -[SCATExternalSwitchSourceController cachedIdleTimerPref](self, "cachedIdleTimerPref"));
}

- (void)willBecomeActive
{
  v5.receiver = self;
  v5.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v5 willBecomeActive];
  if ([(SCATExternalSwitchSourceController *)self isVisible])
  {
    [(SCATExternalSwitchSourceController *)self _showSoftwareKeyboard:1];
    id v3 = [(SCATExternalSwitchSourceController *)self presentedViewController];

    if (!v3)
    {
      objc_super v4 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
      [v4 beginFilteringEvents];
    }
  }
}

- (void)willResignActive
{
  v4.receiver = self;
  v4.super_class = (Class)SCATExternalSwitchSourceController;
  [(SCATExternalSwitchSourceController *)&v4 willResignActive];
  [(SCATExternalSwitchSourceController *)self _showSoftwareKeyboard:0];
  id v3 = [(SCATExternalSwitchSourceController *)self switchRegistrar];
  [v3 endFilteringEvents];
}

- (void)_showSoftwareKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = +[UIKeyboardImpl sharedInstance];
  id v5 = v4;
  if (v3) {
    [v4 showKeyboardWithoutSuppressionPolicy];
  }
  else {
    [v4 dismissKeyboard];
  }
}

- (BOOL)switchRegistrarShouldFilterEvents:(id)a3
{
  if (![(SCATExternalSwitchSourceController *)self isVisible]) {
    return 0;
  }
  objc_super v4 = [(SCATExternalSwitchSourceController *)self presentedViewController];
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)switchRegistrarShouldProcessKeyboardKeyEvent:(id)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v4 - *(double *)&switchRegistrarShouldProcessKeyboardKeyEvent___LastEventTime < 1.5) {
    return 0;
  }
  switchRegistrarShouldProcessKeyboardKeyEvent___LastEventTime = *(void *)&v4;
  objc_super v6 = [(SCATExternalSwitchSourceController *)self presentedViewController];
  BOOL v5 = v6 == 0;

  return v5;
}

- (BOOL)switchRegistrarShouldProcessMFIButtonEvent:(id)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v4 - *(double *)&switchRegistrarShouldProcessMFIButtonEvent___LastEventTime < 1.5) {
    return 0;
  }
  switchRegistrarShouldProcessMFIButtonEvent___LastEventTime = *(void *)&v4;
  objc_super v6 = [(SCATExternalSwitchSourceController *)self presentedViewController];
  BOOL v5 = v6 == 0;

  return v5;
}

- (BOOL)switchRegistrarShouldProcessMIDIEvent:(id)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v4 - *(double *)&switchRegistrarShouldProcessMIDIEvent___LastEventTime >= 1.5)
  {
    switchRegistrarShouldProcessMIDIEvent___LastEventTime = *(void *)&v4;
    objc_super v6 = [(SCATExternalSwitchSourceController *)self presentedViewController];
    BOOL v5 = v6 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  id v8 = +[NSNumber numberWithBool:v5];
  AXPrintLine();

  return v5;
}

- (BOOL)switchRegistrarShouldProcessGamepadEvent:(id)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  if (v4 - *(double *)&switchRegistrarShouldProcessGamepadEvent___LastEventTime < 1.5) {
    return 0;
  }
  switchRegistrarShouldProcessGamepadEvent___LastEventTime = *(void *)&v4;
  objc_super v6 = [(SCATExternalSwitchSourceController *)self presentedViewController];
  BOOL v5 = v6 == 0;

  return v5;
}

- (void)_showSwitchAlreadyInUse
{
}

void __61__SCATExternalSwitchSourceController__showSwitchAlreadyInUse__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) switchRegistrar];
  [v2 endFilteringEvents];

  BOOL v3 = [*(id *)(a1 + 32) switchAlertCoordinator];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __61__SCATExternalSwitchSourceController__showSwitchAlreadyInUse__block_invoke_2;
  v4[3] = &unk_2087C0;
  v4[4] = *(void *)(a1 + 32);
  [v3 showSwichAlreadyInUseAlert:v4];
}

void __61__SCATExternalSwitchSourceController__showSwitchAlreadyInUse__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) switchRegistrar];
  [v1 beginFilteringEvents];
}

- (void)switchRegistrar:(id)a3 didUpdateSwitch:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformBlockOnMainThread();
}

void __70__SCATExternalSwitchSourceController_switchRegistrar_didUpdateSwitch___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) switchRegistrar];
  [v2 endFilteringEvents];

  BOOL v3 = [*(id *)(a1 + 32) switchAlertCoordinator];
  id v4 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __70__SCATExternalSwitchSourceController_switchRegistrar_didUpdateSwitch___block_invoke_2;
  v6[3] = &unk_20C148;
  id v7 = v4;
  objc_copyWeak(&v8, &location);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __70__SCATExternalSwitchSourceController_switchRegistrar_didUpdateSwitch___block_invoke_3;
  v5[3] = &unk_2087C0;
  v5[4] = *(void *)(a1 + 32);
  [v3 showSwitchNamingAlertWithSwitch:v7 message:0 successHandler:v6 cancelHandler:v5];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__SCATExternalSwitchSourceController_switchRegistrar_didUpdateSwitch___block_invoke_2(uint64_t a1)
{
  id v1 = (id *)a1;
  v9 = [[SCATSwitchActionsController alloc] initWithSwitch:*(void *)(a1 + 32)];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [(SCATSwitchActionsController *)v9 setParentController:WeakRetained];

  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 rootController];
  [(SCATSwitchActionsController *)v9 setRootController:v4];

  id v5 = AXParameterizedLocalizedString();
  id v6 = objc_loadWeakRetained(v1);
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v5 target:v6 set:0 get:0 detail:0 cell:-1 edit:0];
  [(SCATSwitchActionsController *)v9 setSpecifier:v7];

  id v8 = objc_loadWeakRetained(v1);
  [v8 showController:v9 animate:1];
}

void __70__SCATExternalSwitchSourceController_switchRegistrar_didUpdateSwitch___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) switchRegistrar];
  [v1 beginFilteringEvents];
}

- (BOOL)addLongPressSwitch
{
  return self->_addLongPressSwitch;
}

- (void)setAddLongPressSwitch:(BOOL)a3
{
  self->_addLongPressSwitch = a3;
}

- (AXSwitchRegistrar)switchRegistrar
{
  return self->_switchRegistrar;
}

- (void)setSwitchRegistrar:(id)a3
{
}

- (SCATAlertCoordinator)switchAlertCoordinator
{
  return self->_switchAlertCoordinator;
}

- (void)setSwitchAlertCoordinator:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)cachedIdleTimerPref
{
  return self->_cachedIdleTimerPref;
}

- (void)setCachedIdleTimerPref:(BOOL)a3
{
  self->_cachedIdleTimerPref = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchAlertCoordinator, 0);

  objc_storeStrong((id *)&self->_switchRegistrar, 0);
}

@end