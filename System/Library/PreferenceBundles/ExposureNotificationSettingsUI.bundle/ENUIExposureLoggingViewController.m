@interface ENUIExposureLoggingViewController
+ (BOOL)isServiceRestricted:(id)a3;
- (BOOL)enableDeleteButton;
- (BOOL)shouldReloadSpecifiersOnResume;
- (ENStatusChangeObserver)statusChangeObserver;
- (ENUIExposureLoggingViewController)initWithStore:(id)a3;
- (ENUIExposureNotificationsStore)store;
- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter;
- (id)additionalLocalizedStringToDisplayForStatus:(int64_t)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)lastKnownStatus;
- (void)_showControllerForSpecifier:(id)a3;
- (void)_showLearnMore:(id)a3;
- (void)addDeleteButton:(id)a3;
- (void)addExposureChecksLink:(id)a3;
- (void)addMasterSwitchGroupToSettings:(id)a3;
- (void)deleteExposureLog;
- (void)deleteExposureLogTapped:(id)a3;
- (void)setAdapter:(id)a3;
- (void)setEnableDeleteButton:(BOOL)a3;
- (void)setLastKnownStatus:(int64_t)a3;
- (void)setStatusChangeObserver:(id)a3;
- (void)setStore:(id)a3;
- (void)updateMasterSwitchGroupFooterReload:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ENUIExposureLoggingViewController

- (ENUIExposureLoggingViewController)initWithStore:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ENUIExposureLoggingViewController;
  v6 = [(ENUIExposureLoggingViewController *)&v29 init];
  if (v6)
  {
    uint64_t v7 = +[ENUITCCUtilities exposureServiceKey];
    serviceKey = v6->_serviceKey;
    v6->_serviceKey = (NSString *)v7;

    v6->_enableDeleteButton = 0;
    objc_storeStrong((id *)&v6->_store, a3);
    uint64_t v9 = +[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter];
    adapter = v6->_adapter;
    v6->_adapter = (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)v9;

    v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    store = v6->_store;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_3C90;
    v26[3] = &unk_2C730;
    v13 = v6;
    v27 = v13;
    v14 = v11;
    v28 = v14;
    [(ENUIExposureNotificationsStore *)store fetchExposureLogsExistWithCompletion:v26];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_3D14;
    block[3] = &unk_2C758;
    v15 = v13;
    v25 = v15;
    dispatch_group_notify(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    id location = 0;
    objc_initWeak(&location, v15);
    v15->_lastKnownStatus = (int64_t)[(_TtC28HealthExposureNotificationUI16ENManagerAdapter *)v6->_adapter exposureNotificationStatus];
    id v16 = objc_alloc((Class)ENStatusChangeObserver);
    v17 = v6->_adapter;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_3D1C;
    v21[3] = &unk_2C780;
    objc_copyWeak(&v22, &location);
    v18 = (ENStatusChangeObserver *)[v16 initWithAdapter:v17 didChangeHandler:v21];
    statusChangeObserver = v15->_statusChangeObserver;
    v15->_statusChangeObserver = v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)setLastKnownStatus:(int64_t)a3
{
  if (self->_lastKnownStatus != a3)
  {
    self->_lastKnownStatus = a3;
    [(ENUIExposureLoggingViewController *)self updateMasterSwitchGroupFooterReload:1];
  }
}

- (ENUIExposureNotificationsStore)store
{
  return self->_store;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ENUIExposureLoggingViewController;
  [(ENUIExposureLoggingViewController *)&v5 viewWillAppear:a3];
  v4 = [(ENUIExposureLoggingViewController *)self statusChangeObserver];
  [v4 setActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ENUIExposureLoggingViewController;
  [(ENUIExposureLoggingViewController *)&v5 viewDidDisappear:a3];
  v4 = [(ENUIExposureLoggingViewController *)self statusChangeObserver];
  [v4 setActive:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    [(ENUIExposureLoggingViewController *)self addMasterSwitchGroupToSettings:v5];
    [(ENUIExposureLoggingViewController *)self addExposureChecksLink:v5];
    [(ENUIExposureLoggingViewController *)self addDeleteButton:v5];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)additionalLocalizedStringToDisplayForStatus:(int64_t)a3
{
  v4 = 0;
  switch(a3)
  {
    case 1:
      break;
    default:
      v4 = ENUILocalizedString();
      break;
  }
  return v4;
}

- (void)updateMasterSwitchGroupFooterReload:(BOOL)a3
{
  if (self->_masterGroup)
  {
    BOOL v3 = a3;
    ENUILocalizedString();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = [(ENUIExposureLoggingViewController *)self additionalLocalizedStringToDisplayForStatus:[(ENUIExposureLoggingViewController *)self lastKnownStatus]];
    if ([v6 length])
    {
      uint64_t v7 = +[NSString stringWithFormat:@"%@\n\n%@", v6, v9];

      id v9 = (id)v7;
    }
    [v5 setObject:@"EXPOSURE_NOTIFICATIONS_GROUP" forKeyedSubscript:PSIDKey];
    [v5 setObject:v9 forKeyedSubscript:PSFooterTextGroupKey];
    if (v3)
    {
      [(ENUIExposureLoggingViewController *)self insertSpecifier:v5 afterSpecifier:self->_masterGroup];
      [(ENUIExposureLoggingViewController *)self removeSpecifier:self->_masterGroup];
    }
    masterGroup = self->_masterGroup;
    self->_masterGroup = (PSSpecifier *)v5;
  }
}

- (void)addMasterSwitchGroupToSettings:(id)a3
{
  id v6 = a3;
  v4 = +[PSSpecifier emptyGroupSpecifier];
  masterGroup = self->_masterGroup;
  self->_masterGroup = v4;

  [(PSSpecifier *)self->_masterGroup setObject:@"EXPOSURE_NOTIFICATIONS_GROUP" forKeyedSubscript:PSIDKey];
  [(ENUIExposureLoggingViewController *)self updateMasterSwitchGroupFooterReload:0];
  [v6 addObject:self->_masterGroup];
}

- (void)addDeleteButton:(id)a3
{
  id v12 = a3;
  v4 = +[PSSpecifier emptyGroupSpecifier];
  deleteGroup = self->_deleteGroup;
  self->_deleteGroup = v4;

  uint64_t v6 = PSIDKey;
  [(PSSpecifier *)self->_deleteGroup setObject:@"DELETE_GROUP" forKeyedSubscript:PSIDKey];
  uint64_t v7 = ENUILocalizedString();
  [(PSSpecifier *)self->_deleteGroup setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

  v8 = ENUILocalizedString();
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];
  deleteButton = self->_deleteButton;
  self->_deleteButton = v9;

  [(PSSpecifier *)self->_deleteButton setObject:@"DELETE_EXPOSURE_LOG_BUTTON" forKeyedSubscript:v6];
  v11 = +[NSNumber numberWithBool:self->_enableDeleteButton];
  [(PSSpecifier *)self->_deleteButton setObject:v11 forKeyedSubscript:PSEnabledKey];

  [(PSSpecifier *)self->_deleteButton setButtonAction:"deleteExposureLogTapped:"];
  [v12 addObject:self->_deleteGroup];
  [v12 addObject:self->_deleteButton];
}

- (void)addExposureChecksLink:(id)a3
{
  if (self->_enableDeleteButton)
  {
    id v4 = a3;
    id v5 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v6 = PSIDKey;
    [v5 setObject:@"EXPOSURE_CHECKS_GROUP" forKeyedSubscript:PSIDKey];
    uint64_t v7 = ENUILocalizedString();
    [v5 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];

    [v4 addObject:v5];
    v8 = ENUILocalizedString();
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
    store = self->_store;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_4538;
    v12[3] = &unk_2C7A8;
    id v13 = v9;
    v14 = self;
    id v11 = v9;
    [(ENUIExposureNotificationsStore *)store fetchExposureCheckSessionsWithCompletion:v12];
    [v11 setObject:@"EXPOSURE_CHECKS" forKeyedSubscript:v6];
    [v4 addObject:v11];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)ENUIExposureLoggingViewController;
  id v6 = a4;
  uint64_t v7 = [(ENUIExposureLoggingViewController *)&v16 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[ENUIExposureLoggingViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v16.receiver, v16.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 objectForKeyedSubscript:PSIDKey];
    unsigned int v10 = [v9 isEqualToString:@"DELETE_EXPOSURE_LOG_BUTTON"];

    if (v10)
    {
      id v11 = v7;
      if ([v11 type] == (char *)&dword_C + 1)
      {
        id v12 = +[UIColor redColor];
        id v13 = [v11 textLabel];
        [v13 setTextColor:v12];

        goto LABEL_7;
      }
    }
  }
  id v14 = v7;
LABEL_7:

  return v7;
}

- (void)deleteExposureLogTapped:(id)a3
{
  id v4 = ENUILocalizedString();
  id v5 = +[UIAlertController alertControllerWithTitle:0 message:v4 preferredStyle:0];

  id v6 = ENUILocalizedString();
  uint64_t v7 = +[UIAlertAction actionWithTitle:v6 style:1 handler:0];
  [v5 addAction:v7];

  v8 = ENUILocalizedString();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_4844;
  v10[3] = &unk_2C7D0;
  v10[4] = self;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v10];
  [v5 addAction:v9];

  [(ENUIExposureLoggingViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)deleteExposureLog
{
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v3 = [(ENUIExposureLoggingViewController *)self store];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4934;
  v4[3] = &unk_2C820;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [v3 resetDataWithFlags:85 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ENUIExposureLoggingViewController *)self specifierAtIndex:[(ENUIExposureLoggingViewController *)self indexForIndexPath:v5]];
  uint64_t v7 = [v6 identifier];
  unsigned int v8 = [v7 isEqualToString:@"EXPOSURE_CHECKS"];

  if (!v8)
  {
    id v14 = v5;
    goto LABEL_15;
  }
  id v9 = objc_alloc_init((Class)LAContext);
  id v24 = 0;
  unsigned __int8 v10 = [v9 canEvaluatePolicy:2 error:&v24];
  id v11 = v24;
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    v15 = [v11 domain];
    if ([v15 isEqualToString:LAErrorDomain])
    {
      id v16 = [v12 code];

      if (v16 == (id)-5)
      {
        v17 = ENUILogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          id v19 = v18;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] No passcode set, allowing access to Exposure Checks", buf, 0xCu);
        }
        [(ENUIExposureLoggingViewController *)self _showControllerForSpecifier:v6];
        goto LABEL_14;
      }
    }
    else
    {
    }
    v20 = ENUILogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1CFE4();
    }

    goto LABEL_14;
  }
  id v13 = ENUILocalizedString();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_4DB0;
  v22[3] = &unk_2C730;
  v22[4] = self;
  id v23 = v6;
  [v9 evaluatePolicy:2 localizedReason:v13 reply:v22];

LABEL_14:
  id v14 = 0;
LABEL_15:

  return v14;
}

- (void)_showControllerForSpecifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v6 = [(ENUIExposureLoggingViewController *)self selectSpecifier:v4];

  id v5 = v6;
  if (v6)
  {
    [(ENUIExposureLoggingViewController *)self showController:v6 animate:1];
    id v5 = v6;
  }
}

- (void)_showLearnMore:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.contacttracing"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  id v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  id v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 containsObject:v3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)setStore:(id)a3
{
}

- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)adapter
{
  return self->_adapter;
}

- (void)setAdapter:(id)a3
{
}

- (ENStatusChangeObserver)statusChangeObserver
{
  return self->_statusChangeObserver;
}

- (void)setStatusChangeObserver:(id)a3
{
}

- (int64_t)lastKnownStatus
{
  return self->_lastKnownStatus;
}

- (BOOL)enableDeleteButton
{
  return self->_enableDeleteButton;
}

- (void)setEnableDeleteButton:(BOOL)a3
{
  self->_enableDeleteButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusChangeObserver, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_deleteGroup, 0);
  objc_storeStrong((id *)&self->_masterGroup, 0);

  objc_storeStrong((id *)&self->_serviceKey, 0);
}

@end