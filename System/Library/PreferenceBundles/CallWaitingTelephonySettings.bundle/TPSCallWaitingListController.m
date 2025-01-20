@interface TPSCallWaitingListController
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCallWaitingController)callWaitingController;
- (id)mainSwitchOn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)callWaitingController:(id)a3 didChangeState:(int64_t)a4 error:(id)a5;
- (void)configureCell:(id)a3;
- (void)configureCell:(id)a3 forSpecifier:(id)a4;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
@end

@implementation TPSCallWaitingListController

- (TPSCallWaitingController)callWaitingController
{
  callWaitingController = self->_callWaitingController;
  if (!callWaitingController)
  {
    v4 = [TPSCallWaitingController alloc];
    v5 = [(TPSCallWaitingListController *)self subscriptionContext];
    v6 = [(TPSCallWaitingController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_callWaitingController;
    self->_callWaitingController = v6;

    [(TPSCallWaitingController *)self->_callWaitingController setDelegate:self];
    callWaitingController = self->_callWaitingController;
  }

  return callWaitingController;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->TPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(TPSCallWaitingListController *)self subscriptionContext];
    if (v5)
    {
      v6 = +[NSMutableArray array];
      v7 = [(TPSCallWaitingListController *)self mainSwitchSpecifier];
      [v6 addObject:v7];

      id v8 = [v6 copy];
      v9 = *(void **)&self->TPSListController_opaque[v3];
      *(void *)&self->TPSListController_opaque[v3] = v8;
    }
    v4 = *(void **)&self->TPSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TPSCallWaitingListController;
  v5 = [(TPSCallWaitingListController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(TPSCallWaitingListController *)self configureCell:v5];

  return v5;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    v4 = +[TPSCallWaitingStrings localizedStringForKey:@"MAIN_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setMainSwitchOn:specifier:" get:"mainSwitchOn:" detail:0 cell:6 edit:0];
    v6 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v5;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }

  return mainSwitchSpecifier;
}

- (id)mainSwitchOn:(id)a3
{
  uint64_t v3 = [(TPSCallWaitingListController *)self callWaitingController];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 state] == (char *)&dword_0 + 2);

  return v4;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v12 = a3;
  uint64_t v6 = PSControlKey;
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "BOOLValue"), 1);
  v9 = [(TPSCallWaitingListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  if ([v12 BOOLValue]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = [(TPSCallWaitingListController *)self callWaitingController];
  [v11 requestStateChange:v10];
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v6;
    v5 = [v4 specifier];
    [(TPSCallWaitingListController *)self configureCell:v4 forSpecifier:v5];
  }
}

- (void)configureCell:(id)a3 forSpecifier:(id)a4
{
  id v9 = a3;
  v5 = [v9 specifier];
  id v6 = [(TPSCallWaitingListController *)self mainSwitchSpecifier];

  if (v5 == v6)
  {
    id v7 = v9;
    id v8 = [(TPSCallWaitingListController *)self callWaitingController];
    objc_msgSend(v7, "setLoading:", objc_msgSend(v8, "state") == 0);
  }
}

- (void)callWaitingController:(id)a3 didChangeState:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    if (os_variant_has_internal_diagnostics()) {
      +[UIAlertController tps_tapToRadarAlertControllerWithError:v7];
    }
    else {
    id v6 = +[UIAlertController tps_alertControllerWithError:v7];
    }
    if (v6) {
      [(TPSCallWaitingListController *)self presentViewController:v6 animated:1 completion:0];
    }
  }
  [(TPSCallWaitingListController *)self reloadSpecifiers];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_callWaitingController, 0);
}

@end