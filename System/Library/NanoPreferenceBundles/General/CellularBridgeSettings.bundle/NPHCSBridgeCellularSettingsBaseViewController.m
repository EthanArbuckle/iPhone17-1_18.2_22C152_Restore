@interface NPHCSBridgeCellularSettingsBaseViewController
- (BOOL)canBeShownFromSuspendedState;
- (id)parentController;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation NPHCSBridgeCellularSettingsBaseViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)NPHCSBridgeCellularSettingsBaseViewController;
  [(NPHCSBridgeCellularSettingsBaseViewController *)&v2 viewDidLoad];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (void)setParentController:(id)a3
{
}

- (id)parentController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentController);

  return WeakRetained;
}

- (void)setRootController:(id)a3
{
}

- (id)rootController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootController);

  return WeakRetained;
}

- (void)setSpecifier:(id)a3
{
  if (self->_specifier != a3) {
    objc_storeStrong((id *)&self->_specifier, a3);
  }

  _objc_release_x1();
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:a3];
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (v4)
  {
    [(NPHCSBridgeCellularSettingsBaseViewController *)self showViewController:v8 sender:self];
    v6 = v8;
  }
  else
  {
    v7 = [(NPHCSBridgeCellularSettingsBaseViewController *)self navigationController];
    [v7 pushViewController:v8 animated:0];

    v6 = v7;
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_rootController);

  objc_destroyWeak((id *)&self->_parentController);
}

@end