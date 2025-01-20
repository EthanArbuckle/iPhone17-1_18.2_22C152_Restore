@interface HKBridgeSharingDisabledController
- (HKBridgeSharingDisabledController)initWithActiveTinkerDevice:(id)a3;
- (id)_startSharingTinkerDataGroupSpecifier;
- (id)_startSharingTinkerDataSpecifier;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_fetchFamilyCircle;
- (void)_fetchFamilyCircleWithCompletion:(id)a3;
- (void)_fetchGuardianMemberWithCompletion:(id)a3;
- (void)_fetchTinkerMemberWithCompletion:(id)a3;
- (void)startSharingTinkerData:(id)a3;
@end

@implementation HKBridgeSharingDisabledController

- (HKBridgeSharingDisabledController)initWithActiveTinkerDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKBridgeSharingDisabledController;
  v6 = [(HKBridgeSharingDisabledController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activeTinkerDevice, a3);
    [(HKBridgeSharingDisabledController *)v7 _fetchFamilyCircle];
  }

  return v7;
}

- (void)_fetchFamilyCircle
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_C6EC;
  v2[3] = &unk_18730;
  v2[4] = self;
  [(HKBridgeSharingDisabledController *)self _fetchFamilyCircleWithCompletion:v2];
}

- (id)specifiers
{
  if (self->_tinkerMember && self->_guardianMember)
  {
    v3 = [(HKBridgeSharingDisabledController *)self _startSharingTinkerDataGroupSpecifier];
    v11[0] = v3;
    v4 = [(HKBridgeSharingDisabledController *)self _startSharingTinkerDataSpecifier];
    v11[1] = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:v11 count:2];
    uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
    v7 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v5;
  }
  else
  {
    uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
    v8 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = &__NSArray0__struct;
  }
  objc_super v9 = *(void **)&self->PSListController_opaque[v6];

  return v9;
}

- (id)_startSharingTinkerDataGroupSpecifier
{
  v2 = +[PSSpecifier groupSpecifierWithID:@"StartSharingTinkerDataGroupIdentifier"];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"REQUEST_TINKER_HEALTH_DATA_FOOTNOTE" value:&stru_18860 table:@"Localizable-tinker"];
  [v2 setObject:v4 forKeyedSubscript:PSFooterTextGroupKey];

  return v2;
}

- (id)_startSharingTinkerDataSpecifier
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"REQUEST_TINKER_USER_%@_HEALTH_DATA" value:&stru_18860 table:@"Localizable-tinker"];
  uint64_t v5 = [(FAFamilyMember *)self->_tinkerMember firstName];
  uint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];
  [v7 setButtonAction:"startSharingTinkerData:"];
  [v7 setIdentifier:@"StartSharingTinkerDataIdentifier"];

  return v7;
}

- (void)startSharingTinkerData:(id)a3
{
  v4 = [[HKBridgeTinkerSharingSetupDelegate alloc] initWithPresentingController:self tinkerDevice:self->_activeTinkerDevice tinkerMember:self->_tinkerMember guardianMember:self->_guardianMember];
  setupDelegate = self->_setupDelegate;
  self->_setupDelegate = v4;

  id v6 = [objc_alloc((Class)HKTinkerSharingOptInController) initWithStyle:2 delegate:self->_setupDelegate];
  id v7 = objc_alloc_init((Class)UINavigationController);
  v8 = [v7 interactivePopGestureRecognizer];
  [v8 setEnabled:0];

  id v15 = v6;
  objc_super v9 = +[NSArray arrayWithObjects:&v15 count:1];
  [v7 setViewControllers:v9];

  _HKInitializeLogging();
  v10 = (void *)HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    LODWORD(v14) = 138543362;
    *(void *)((char *)&v14 + 4) = objc_opt_class();
    id v12 = *(id *)((char *)&v14 + 4);
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Presenting sharing setup flow from BridgeHealthSettings", (uint8_t *)&v14, 0xCu);
  }
  v13 = [(HKBridgeSharingDisabledController *)self navigationController];
  [v13 presentViewController:v7 animated:1 completion:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HKBridgeSharingDisabledController;
  v4 = [(HKBridgeSharingDisabledController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)_fetchFamilyCircleWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_CF14;
  v21[4] = sub_CF24;
  id v22 = 0;
  dispatch_group_enter(v5);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_CF2C;
  v18[3] = &unk_18758;
  v20 = v21;
  id v6 = v5;
  v19 = v6;
  [(HKBridgeSharingDisabledController *)self _fetchTinkerMemberWithCompletion:v18];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = sub_CF14;
  v16[4] = sub_CF24;
  id v17 = 0;
  dispatch_group_enter(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_CF8C;
  v13[3] = &unk_18758;
  id v15 = v16;
  objc_super v7 = v6;
  long long v14 = v7;
  [(HKBridgeSharingDisabledController *)self _fetchGuardianMemberWithCompletion:v13];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CFEC;
  block[3] = &unk_18780;
  id v10 = v4;
  v11 = v21;
  id v12 = v16;
  id v8 = v4;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v21, 8);
}

- (void)_fetchTinkerMemberWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = +[BPSTinkerSupport sharedInstance];
  id v6 = [v5 cachedTinkerFamilyMemeber];
  if (v6)
  {
    v4[2](v4, v6);
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_D0F8;
    v7[3] = &unk_187A8;
    v7[4] = self;
    id v8 = v4;
    [v5 getActiveTinkerFamilyMemberWithCompletion:v7];
  }
}

- (void)_fetchGuardianMemberWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = +[BPSTinkerSupport sharedInstance];
  id v6 = [v5 cachedPairingParentFamilyMember];

  if (v6)
  {
    v4[2](v4, v6);
  }
  else
  {
    objc_super v7 = +[BPSTinkerSupport sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_D288;
    v8[3] = &unk_187A8;
    v8[4] = self;
    objc_super v9 = v4;
    [v7 getActiveTinkerFamilyMemberWithCompletion:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupDelegate, 0);
  objc_storeStrong((id *)&self->_guardianMember, 0);
  objc_storeStrong((id *)&self->_tinkerMember, 0);

  objc_storeStrong((id *)&self->_activeTinkerDevice, 0);
}

@end