@interface CSGrantedDelegateDetailsController
- (CSGrantedDelegateDetailsController)init;
- (id)enabledWriteAccess:(id)a3;
- (id)initInAddDelegateMode:(BOOL)a3;
- (id)specifiers;
- (void)modalCancelPressed:(id)a3;
- (void)modalSavePressed:(id)a3;
- (void)removeDelegateTapped:(id)a3;
- (void)setEnabledWriteAccess:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
@end

@implementation CSGrantedDelegateDetailsController

- (id)initInAddDelegateMode:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSGrantedDelegateDetailsController;
  v4 = [(CSGrantedDelegateDetailsController *)&v15 init];
  if (v4)
  {
    v5 = (EKEventStore *)objc_alloc_init((Class)EKEventStore);
    eventStore = v4->_eventStore;
    v4->_eventStore = v5;

    v4->_addDelegateMode = v3;
    if (v3)
    {
      id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v4 action:"modalCancelPressed:"];
      v8 = [(CSGrantedDelegateDetailsController *)v4 navigationItem];
      [v8 setLeftBarButtonItem:v7];

      id v9 = objc_alloc((Class)UIBarButtonItem);
      v10 = +[NSBundle bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"Save" value:&stru_1CE38 table:@"MobileCalSettings"];
      id v12 = [v9 initWithTitle:v11 style:2 target:v4 action:"modalSavePressed:"];
      v13 = [(CSGrantedDelegateDetailsController *)v4 navigationItem];
      [v13 setRightBarButtonItem:v12];
    }
  }
  return v4;
}

- (CSGrantedDelegateDetailsController)init
{
  return (CSGrantedDelegateDetailsController *)[(CSGrantedDelegateDetailsController *)self initInAddDelegateMode:0];
}

- (void)setSpecifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CSGrantedDelegateDetailsController;
  id v4 = a3;
  [(CSGrantedDelegateDetailsController *)&v14 setSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", @"CSDelegateClassInstanceKey", v14.receiver, v14.super_class);

  objc_storeWeak((id *)&self->_delegateFromSpecifier, v5);
  v6 = [(CSGrantedDelegateDetailsController *)self specifier];
  id v7 = [v6 propertyForKey:@"CSSourceKey"];
  source = self->_source;
  self->_source = v7;

  id v9 = [(CSGrantedDelegateDetailsController *)self specifier];
  v10 = [v9 propertyForKey:@"CSGrantedDelegateKey"];
  grantedDelegate = self->_grantedDelegate;
  self->_grantedDelegate = v10;

  id v12 = [(CalGrantedDelegate *)self->_grantedDelegate displayName];
  v13 = [(CSGrantedDelegateDetailsController *)self navigationItem];
  [v13 setTitle:v12];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = +[NSMutableArray array];
    id v7 = +[PSSpecifier emptyGroupSpecifier];
    v8 = [(CSGrantedDelegateDetailsController *)self enabledWriteAccess:0];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      CFStringRef v10 = @"Enable write access for delegate explanatory note (switch on)";
      CFStringRef v11 = @"This account can create, edit and delete events and calendars on your behalf.";
    }
    else
    {
      CFStringRef v10 = @"Enable write access for delegate explanatory note (switch off)";
      CFStringRef v11 = @"This account can view your calendars and the details of non-private events.";
    }
    id v12 = [v5 localizedStringForKey:v10 value:v11 table:@"MobileCalSettings"];
    [v7 setProperty:v12 forKey:PSFooterTextGroupKey];

    [v6 addObject:v7];
    v13 = [v5 localizedStringForKey:@"Enable write access specifier name" value:@"Enable Write Access" table:@"MobileCalSettings"];
    objc_super v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:"setEnabledWriteAccess:specifier:" get:"enabledWriteAccess:" detail:0 cell:6 edit:0];
    readWriteSwitch = self->_readWriteSwitch;
    self->_readWriteSwitch = v14;

    [v6 addObject:self->_readWriteSwitch];
    if (!self->_addDelegateMode)
    {
      v16 = +[PSSpecifier emptyGroupSpecifier];
      [v6 addObject:v16];

      uint64_t v17 = [v5 localizedStringForKey:@"Remove delegate name" value:@"Remove Delegate" table:@"MobileCalSettings"];

      v18 = +[PSSpecifier deleteButtonSpecifierWithName:v17 target:self action:"removeDelegateTapped:"];
      removeDelegateButton = self->_removeDelegateButton;
      self->_removeDelegateButton = v18;

      [v6 addObject:self->_removeDelegateButton];
      v13 = (void *)v17;
    }
    v20 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setEnabledWriteAccess:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_currentPermission, a3);
  if ([v6 BOOLValue]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [(CalGrantedDelegate *)self->_grantedDelegate setPermission:v7];
  if (!self->_addDelegateMode)
  {
    eventStore = self->_eventStore;
    grantedDelegate = self->_grantedDelegate;
    source = self->_source;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_544C;
    v12[3] = &unk_1C900;
    v12[4] = self;
    [(EKEventStore *)eventStore updateGrantedDelegate:grantedDelegate action:2 source:source completion:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateFromSpecifier);
    [WeakRetained didModifyDelegate:self->_grantedDelegate];
  }
  [(CSGrantedDelegateDetailsController *)self reloadSpecifiers];
}

- (id)enabledWriteAccess:(id)a3
{
  currentPermission = self->_currentPermission;
  if (currentPermission)
  {
    id v4 = currentPermission;
  }
  else
  {
    +[NSNumber numberWithInt:[(CalGrantedDelegate *)self->_grantedDelegate permission] == (char *)&dword_0 + 2];
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)removeDelegateTapped:(id)a3
{
  if (!self->_addDelegateMode)
  {
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = +[UIDevice currentDevice];
    unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

    unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v8 = [v4 localizedStringForKey:@"Remove delegate name" value:@"Remove Delegate" table:@"MobileCalSettings"];
    }
    else
    {
      v8 = &stru_1CE38;
    }
    unsigned int v9 = [v4 localizedStringForKey:@"Confirm delete delegate alert sheet description" value:@"Removing this delegate will remove their read and write access to your account." table:@"MobileCalSettings"];
    CFStringRef v10 = +[UIDevice currentDevice];
    unint64_t v11 = (unint64_t)[v10 userInterfaceIdiom];

    id v12 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:(v11 & 0xFFFFFFFFFFFFFFFBLL) == 1];

    if (v7 == 1) {
    v13 = [v4 localizedStringForKey:@"Confirm delete delegate alert sheet delete button" value:@"Remove Delegate" table:@"MobileCalSettings"];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_57C0;
    v17[3] = &unk_1C928;
    v17[4] = self;
    objc_super v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v17];
    [v12 addAction:v14];

    objc_super v15 = [v4 localizedStringForKey:@"Confirm delete delegate alert sheet cancel button" value:@"Cancel" table:@"MobileCalSettings"];
    v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:&stru_1C968];
    [v12 addAction:v16];

    [(CSGrantedDelegateDetailsController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (void)modalCancelPressed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateFromSpecifier);
  [WeakRetained didDismissViewControllerSavingNewDelegate:0];

  [(CSGrantedDelegateDetailsController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)modalSavePressed:(id)a3
{
  [(EKEventStore *)self->_eventStore updateGrantedDelegate:self->_grantedDelegate action:0 source:self->_source completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateFromSpecifier);
  [WeakRetained didModifyDelegate:self->_grantedDelegate];

  id v5 = objc_loadWeakRetained((id *)&self->_delegateFromSpecifier);
  [v5 didDismissViewControllerSavingNewDelegate:1];

  [(CSGrantedDelegateDetailsController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDelegate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_destroyWeak((id *)&self->_delegateFromSpecifier);
  objc_storeStrong((id *)&self->_currentPermission, 0);
  objc_storeStrong((id *)&self->_removeDelegateButton, 0);
  objc_storeStrong((id *)&self->_readWriteSwitch, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end