@interface NCABSettingsTinkerController
- (BPSTinkerSupport)tinkerSupportHelper;
- (CNUIFamilyMemberContactsController)familyMemberContactsController;
- (FAFamilyMember)tinkerFamilyMember;
- (NCABSettingsTinkerController)init;
- (NCABTinkerContactsManagementStateManager)contactsManagementStateManager;
- (id)_localizedContactsManagementStringWithTinkerUserName:(id)a3;
- (id)_localizedStringForKey:(id)a3 tinkerUserName:(id)a4;
- (id)specifiers;
- (void)_editContactsForFamilyMember;
- (void)_fetchFamilyMember:(id)a3;
- (void)_openScreenTimeForFamilyMember;
- (void)_openScreenTimeForFamilyMember:(id)a3;
- (void)dismissPresentedViewController:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setContactsManagementStateManager:(id)a3;
- (void)setFamilyMemberContactsController:(id)a3;
- (void)setTinkerFamilyMember:(id)a3;
- (void)setTinkerSupportHelper:(id)a3;
@end

@implementation NCABSettingsTinkerController

- (NCABSettingsTinkerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NCABSettingsTinkerController;
  v2 = [(NCABSettingsTinkerController *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = NCBST_Tinker_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446210;
      v10 = "-[NCABSettingsTinkerController init]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%{public}s - starting family member fetch", buf, 0xCu);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_5298;
    v5[3] = &unk_C418;
    objc_copyWeak(&v6, &location);
    [(NCABSettingsTinkerController *)v2 _fetchFamilyMember:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setTinkerFamilyMember:(id)a3
{
  v5 = (FAFamilyMember *)a3;
  p_tinkerFamilyMember = &self->_tinkerFamilyMember;
  if (self->_tinkerFamilyMember != v5)
  {
    objc_storeStrong((id *)&self->_tinkerFamilyMember, a3);
    [(NCABSettingsTinkerController *)self setContactsManagementStateManager:0];
    v7 = NCBST_Tinker_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = *p_tinkerFamilyMember;
      *(_DWORD *)buf = 136446466;
      v17 = "-[NCABSettingsTinkerController setTinkerFamilyMember:]";
      __int16 v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - reloading for familyMember: %@", buf, 0x16u);
    }

    [(NCABSettingsTinkerController *)self reloadSpecifiers];
    if (*p_tinkerFamilyMember)
    {
      v9 = [[NCABTinkerContactsManagementStateManager alloc] initWithFamilyMember:*p_tinkerFamilyMember autoEnableIfPossible:0];
      [(NCABSettingsTinkerController *)self setContactsManagementStateManager:v9];
      v10 = NCBST_Tinker_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v17 = "-[NCABSettingsTinkerController setTinkerFamilyMember:]";
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - fetching contactsManagementState", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v11 = [(NCABSettingsTinkerController *)self contactsManagementStateManager];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_5708;
      v13[3] = &unk_C440;
      objc_copyWeak(&v15, (id *)buf);
      v12 = v9;
      v14 = v12;
      [v11 fetchContactsManagementStateWithCompletionHandler:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"NCABST_GROUP_ID"];
    [v5 addObject:v6];
    v7 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];
    objc_super v8 = [(NCABSettingsTinkerController *)self contactsManagementStateManager];
    int v9 = [v8 lastKnownContactsManagementState];

    if (v7)
    {
      v10 = [v7 firstName];
      if (v10) {
        goto LABEL_8;
      }
      v11 = NCBST_Tinker_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_7158((uint64_t)v7, v11);
      }
    }
    v10 = 0;
LABEL_8:
    if (v9 > 4)
    {
      if ((v9 - 100) >= 2)
      {
        if (v9 != 5 && v9 != 102) {
          goto LABEL_19;
        }
        v13 = [(NCABSettingsTinkerController *)self familyMemberContactsController];
        [v13 countOfFamilyMemberContacts];

        v12 = [(NCABSettingsTinkerController *)self _localizedStringForKey:@"TK_CONTACTS_SETTINGS_EDIT_SATELLITE_CONTACTS" tinkerUserName:v10];
        v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];
        [v14 setIdentifier:@"NCABST_ACTION_ID"];
        id v15 = "_editContactsForFamilyMember";
        goto LABEL_17;
      }
    }
    else if ((v9 - 2) >= 3)
    {
      if (v9 >= 2)
      {
LABEL_19:
        v16 = *(void **)&self->PSListController_opaque[v3];
        *(void *)&self->PSListController_opaque[v3] = v5;

        v4 = *(void **)&self->PSListController_opaque[v3];
        goto LABEL_20;
      }
      v12 = [(NCABSettingsTinkerController *)self _localizedContactsManagementStringWithTinkerUserName:v10];
      [v6 setProperty:v12 forKey:PSFooterTextGroupKey];
LABEL_18:

      goto LABEL_19;
    }
    v12 = [(NCABSettingsTinkerController *)self _localizedStringForKey:@"TK_CONTACTS_SETUP_IN_SCREENTIME" tinkerUserName:v10];
    v14 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v14 setIdentifier:@"NCABST_ACTION_ID"];
    id v15 = "_openScreenTimeForFamilyMember";
LABEL_17:
    [v14 setButtonAction:v15];
    [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [v5 addObject:v14];

    goto LABEL_18;
  }
LABEL_20:

  return v4;
}

- (id)_localizedStringForKey:(id)a3 tinkerUserName:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"%@_USERNAME", a3];
    v7 = NanoContactsSettingsTinkerBundle();
    objc_super v8 = [v7 localizedStringForKey:v6 value:&stru_C620 table:@"NanoContactsBridgeSettingsTinker"];
    int v9 = +[NSString stringWithValidatedFormat:v8, @"%@", 0, v5 validFormatSpecifiers error];
  }
  else
  {
    id v6 = +[NSString stringWithFormat:@"%@_NO_USERNAME", a3];
    v7 = NanoContactsSettingsTinkerBundle();
    int v9 = [v7 localizedStringForKey:v6 value:&stru_C620 table:@"NanoContactsBridgeSettingsTinker"];
  }

  return v9;
}

- (id)_localizedContactsManagementStringWithTinkerUserName:(id)a3
{
  id v4 = a3;
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  id v6 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v7 = [v5 getAllDevicesWithArchivedAltAccountDevicesMatching:v6];
  objc_super v8 = [v7 firstObject];

  int v9 = [v8 valueForProperty:NRDevicePropertyIsArchived];
  if ([v9 BOOLValue]) {
    v10 = 0;
  }
  else {
    v10 = v8;
  }
  id v11 = v10;

  id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CBF3763A-5F42-4463-B714-39903987FE90"];
  unsigned int v13 = [v11 supportsCapability:v12];

  v14 = @"TK_CONTACTS_SETTINGS_EDIT_ON_DEVICE_PHONEAPP";
  if (v13) {
    v14 = @"TK_CONTACTS_SETTINGS_EDIT_ON_DEVICE_CONTACTSAPP";
  }
  id v15 = v14;

  v16 = [(NCABSettingsTinkerController *)self _localizedStringForKey:v15 tinkerUserName:v4];

  return v16;
}

- (void)_openScreenTimeForFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dsid];
  id v5 = +[NSString stringWithValidatedFormat:@"prefs:root=SCREEN_TIME&path=CHILD_%@", @"%@", 0, v4 validFormatSpecifiers error];

  id v6 = +[NSURL URLWithString:v5];
  v7 = NCBST_Tinker_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v10 = "-[NCABSettingsTinkerController _openScreenTimeForFamilyMember:]";
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s - Opening URL %{public}@ for familyMember %@", buf, 0x20u);
  }

  objc_super v8 = +[LSApplicationWorkspace defaultWorkspace];
  [v8 openSensitiveURL:v6 withOptions:0];
}

- (void)_openScreenTimeForFamilyMember
{
  id v3 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];
  [(NCABSettingsTinkerController *)self _openScreenTimeForFamilyMember:v3];
}

- (CNUIFamilyMemberContactsController)familyMemberContactsController
{
  if (!self->_familyMemberContactsController)
  {
    id v3 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];

    if (v3)
    {
      id v4 = objc_alloc((Class)CNUIFamilyMemberContactsController);
      id v5 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];
      id v6 = (CNUIFamilyMemberContactsController *)[v4 initWithFamilyMember:v5 familyMemberContactsPresentation:self];
      familyMemberContactsController = self->_familyMemberContactsController;
      self->_familyMemberContactsController = v6;
    }
  }
  objc_super v8 = self->_familyMemberContactsController;

  return v8;
}

- (void)_editContactsForFamilyMember
{
  id v3 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];

  if (v3)
  {
    id v4 = NCBST_Tinker_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NCABSettingsTinkerController *)self familyMemberContactsController];
      id v6 = [(NCABSettingsTinkerController *)self tinkerFamilyMember];
      int v8 = 136446722;
      int v9 = "-[NCABSettingsTinkerController _editContactsForFamilyMember]";
      __int16 v10 = 2112;
      __int16 v11 = v5;
      __int16 v12 = 2112;
      __int16 v13 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - showing CNUIFamilyMemberContactsController: %@, familyMember: %@", (uint8_t *)&v8, 0x20u);
    }
    v7 = [(NCABSettingsTinkerController *)self familyMemberContactsController];
    [v7 performInteraction:3];
  }
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = NCBST_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136446466;
    __int16 v11 = "-[NCABSettingsTinkerController presentViewController:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [(NCABSettingsTinkerController *)self navigationController];
  v7 = [v6 navigationBar];
  int v8 = [v7 tintColor];
  int v9 = [v4 view];
  [v9 setTintColor:v8];

  [(NCABSettingsTinkerController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)dismissPresentedViewController:(id)a3
{
  id v4 = a3;
  id v5 = NCBST_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446466;
    v7 = "-[NCABSettingsTinkerController dismissPresentedViewController:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%{public}s: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NCABSettingsTinkerController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_fetchFamilyMember:(id)a3
{
  id v9 = (void (**)(id, void *, void))a3;
  id v4 = [(NCABSettingsTinkerController *)self tinkerSupportHelper];

  if (!v4)
  {
    id v5 = +[BPSTinkerSupport sharedInstance];
    [(NCABSettingsTinkerController *)self setTinkerSupportHelper:v5];
  }
  int v6 = [(NCABSettingsTinkerController *)self tinkerSupportHelper];
  v7 = [v6 cachedTinkerFamilyMemeber];

  if (v7)
  {
    v9[2](v9, v7, 0);
  }
  else
  {
    __int16 v8 = [(NCABSettingsTinkerController *)self tinkerSupportHelper];
    [v8 getActiveTinkerFamilyMemberWithCompletion:v9];
  }
}

- (BPSTinkerSupport)tinkerSupportHelper
{
  return self->_tinkerSupportHelper;
}

- (void)setTinkerSupportHelper:(id)a3
{
}

- (void)setFamilyMemberContactsController:(id)a3
{
}

- (FAFamilyMember)tinkerFamilyMember
{
  return self->_tinkerFamilyMember;
}

- (NCABTinkerContactsManagementStateManager)contactsManagementStateManager
{
  return self->_contactsManagementStateManager;
}

- (void)setContactsManagementStateManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsManagementStateManager, 0);
  objc_storeStrong((id *)&self->_tinkerFamilyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsController, 0);

  objc_storeStrong((id *)&self->_tinkerSupportHelper, 0);
}

@end