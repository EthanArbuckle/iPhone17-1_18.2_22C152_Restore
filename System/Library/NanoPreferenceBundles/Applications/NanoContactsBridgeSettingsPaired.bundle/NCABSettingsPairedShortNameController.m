@interface NCABSettingsPairedShortNameController
- (NCABSettingsPairedShortNameController)init;
- (id)_getValueForKey:(id)a3;
- (id)preferNicknames;
- (id)shortNameEnabled;
- (id)shortNameFormat;
- (id)specifiers;
- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5;
- (void)setPreferNicknames:(id)a3;
- (void)setShortNameEnabled:(id)a3;
- (void)setShortNameFormat:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation NCABSettingsPairedShortNameController

- (NCABSettingsPairedShortNameController)init
{
  v14.receiver = self;
  v14.super_class = (Class)NCABSettingsPairedShortNameController;
  v2 = [(NCABSettingsPairedShortNameController *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    id v5 = objc_alloc((Class)NPSDomainAccessor);
    v6 = (NPSDomainAccessor *)[v5 initWithDomain:NSPersonNameDefaultNamePreferencesDomain];
    foundationDomainAccessor = v2->_foundationDomainAccessor;
    v2->_foundationDomainAccessor = v6;

    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v9 = [v8 getActivePairedDevice];

    if (v9)
    {
      NRWatchOSVersionForRemoteDevice();
      char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
      v2->_activePairedWatchRequiresLegacyKeys = IsGreaterThanOrEqual ^ 1;
      if ((IsGreaterThanOrEqual & 1) == 0)
      {
        v11 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.PeoplePicker"];
        peoplePickerDomainAccessor = v2->_peoplePickerDomainAccessor;
        v2->_peoplePickerDomainAccessor = v11;
      }
    }
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    id v5 = NanoContactsSettingsPairedBundle();
    v6 = objc_msgSend(v5, "localizedStringForKey:value:table:", @"Short Name");
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setShortNameEnabled:" get:"shortNameEnabled" detail:0 cell:6 edit:0];
    shortNameEnabledSpecifier = self->_shortNameEnabledSpecifier;
    self->_shortNameEnabledSpecifier = v7;

    v9 = self->_shortNameEnabledSpecifier;
    v10 = +[NSNumber numberWithBool:1];
    uint64_t v46 = PSDefaultValueKey;
    -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v10);

    v47 = v4;
    [v4 addObject:self->_shortNameEnabledSpecifier];
    v11 = [(NCABSettingsPairedShortNameController *)self shortNameFormat];
    v12 = (int *)[v11 integerValue];

    v13 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:6];
    shortNameFormatsSpecifiers = self->_shortNameFormatsSpecifiers;
    self->_shortNameFormatsSpecifiers = v13;

    v15 = +[PSSpecifier emptyGroupSpecifier];
    shortNameFormatsGroup = self->_shortNameFormatsGroup;
    self->_shortNameFormatsGroup = v15;

    v17 = self->_shortNameFormatsGroup;
    v18 = +[NSNumber numberWithBool:1];
    [(PSSpecifier *)v17 setProperty:v18 forKey:PSIsRadioGroupKey];

    v19 = self->_shortNameFormatsGroup;
    v20 = NanoContactsSettingsPairedBundle();
    v21 = [v20 localizedStringForKey:@"SHORT_NAME_FORMAT_EXPLANATORY" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    uint64_t v45 = PSFooterTextGroupKey;
    -[PSSpecifier setProperty:forKey:](v19, "setProperty:forKey:", v21);

    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:self->_shortNameFormatsGroup];
    v22 = NanoContactsSettingsPairedBundle();
    v23 = [v22 localizedStringForKey:@"SHORT_NAME_FORMAT_INITIAL_LAST" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v24 setUserInfo:&off_85E0];
    if (v12 == (int *)((char *)&dword_0 + 1)) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v24 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v24];
    v25 = NanoContactsSettingsPairedBundle();
    v26 = [v25 localizedStringForKey:@"SHORT_NAME_FORMAT_INITIAL_FIRST" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v27 = +[PSSpecifier preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v27 setUserInfo:&off_85F8];
    if (v12 == (int *)((char *)&dword_0 + 2)) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v27 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v27];
    v28 = NanoContactsSettingsPairedBundle();
    v29 = [v28 localizedStringForKey:@"SHORT_NAME_FORMAT_FIRST_ONLY" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v30 setUserInfo:&off_8610];
    if (v12 == (int *)((char *)&dword_0 + 3)) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v30 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v30];
    v31 = NanoContactsSettingsPairedBundle();
    v32 = [v31 localizedStringForKey:@"SHORT_NAME_FORMAT_LAST_ONLY" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v33 setUserInfo:&off_8628];
    if (v12 == &dword_4) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v33 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v33];
    v34 = [(NCABSettingsPairedShortNameController *)self shortNameEnabled];
    unsigned int v35 = [v34 BOOLValue];

    if (v35) {
      [v47 addObjectsFromArray:self->_shortNameFormatsSpecifiers];
    }
    v36 = +[PSSpecifier emptyGroupSpecifier];

    v37 = NanoContactsSettingsPairedBundle();
    v38 = [v37 localizedStringForKey:@"PREFER_NICKNAMES_EXPLANTORY" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    [v36 setProperty:v38 forKey:v45];

    [v47 addObject:v36];
    v39 = NanoContactsSettingsPairedBundle();
    v40 = [v39 localizedStringForKey:@"Prefer Nicknames" value:&stru_83B8 table:@"NanoContactsBridgeSettingsPaired"];
    v41 = +[PSSpecifier preferenceSpecifierNamed:v40 target:self set:"setPreferNicknames:" get:"preferNicknames" detail:0 cell:6 edit:0];

    v42 = +[NSNumber numberWithBool:1];
    [v41 setProperty:v42 forKey:v46];

    [v47 addObject:v41];
    v43 = *(void **)&self->PSListController_opaque[v48];
    *(void *)&self->PSListController_opaque[v48] = v47;

    uint64_t v3 = *(void **)&self->PSListController_opaque[v48];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NCABSettingsPairedShortNameController;
  [(NCABSettingsPairedShortNameController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [v6 section];
  v8 = [(NCABSettingsPairedShortNameController *)self indexPathForIndex:[(NCABSettingsPairedShortNameController *)self indexOfSpecifier:self->_shortNameFormatsGroup]];
  id v9 = [v8 section];

  if (v7 == v9)
  {
    v10 = [(NCABSettingsPairedShortNameController *)self specifierAtIndex:[(NCABSettingsPairedShortNameController *)self indexForIndexPath:v6]];
    v11 = [v10 userInfo];
    [(NCABSettingsPairedShortNameController *)self setShortNameFormat:v11];

    [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v10 forKey:PSRadioGroupCheckedSpecifierKey];
  }
}

- (void)setShortNameEnabled:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 BOOLValue];
  [(NCABSettingsPairedShortNameController *)self _setValue:v4 forKey:NSPersonNameDefaultShortNameEnabledKey syncWithClient:1];

  shortNameFormatsSpecifiers = self->_shortNameFormatsSpecifiers;
  if (v5)
  {
    shortNameEnabledSpecifier = self->_shortNameEnabledSpecifier;
    [(NCABSettingsPairedShortNameController *)self insertContiguousSpecifiers:shortNameFormatsSpecifiers afterSpecifier:shortNameEnabledSpecifier animated:1];
  }
  else
  {
    -[NCABSettingsPairedShortNameController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", shortNameFormatsSpecifiers, 1, v6);
  }
}

- (id)shortNameEnabled
{
  v2 = [(NCABSettingsPairedShortNameController *)self _getValueForKey:NSPersonNameDefaultShortNameEnabledKey];
  uint64_t v3 = v2;
  if (!v2) {
    v2 = &__kCFBooleanTrue;
  }
  id v4 = v2;

  return v4;
}

- (void)setShortNameFormat:(id)a3
{
  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 integerValue]);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NCABSettingsPairedShortNameController *)self _setValue:v4 forKey:NSPersonNameDefaultShortNameFormatKey syncWithClient:1];
}

- (id)shortNameFormat
{
  v2 = [(NCABSettingsPairedShortNameController *)self _getValueForKey:NSPersonNameDefaultShortNameFormatKey];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[NSPersonNameComponentsFormatter _defaultShortNameFormat]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v5 = v4;

  return v5;
}

- (void)setPreferNicknames:(id)a3
{
}

- (id)preferNicknames
{
  v2 = [(NCABSettingsPairedShortNameController *)self _getValueForKey:NSPersonNameDefaultShouldPreferNicknamesKey];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[NSPersonNameComponentsFormatter _shouldPreferNicknames]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  unsigned int v5 = v4;

  return v5;
}

- (id)_getValueForKey:(id)a3
{
  foundationDomainAccessor = self->_foundationDomainAccessor;
  id v5 = a3;
  id v6 = [(NPSDomainAccessor *)foundationDomainAccessor synchronize];
  id v7 = [(NPSDomainAccessor *)self->_foundationDomainAccessor objectForKey:v5];

  return v7;
}

- (void)_setValue:(id)a3 forKey:(id)a4 syncWithClient:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(NPSDomainAccessor *)self->_foundationDomainAccessor setObject:v8 forKey:v9];
  id v10 = [(NPSDomainAccessor *)self->_foundationDomainAccessor synchronize];
  if (v5)
  {
    if (self->_activePairedWatchRequiresLegacyKeys)
    {
      id v14 = v9;
      id v15 = v8;
      v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      +[NCABSettingsPairedController mapFoundationPreferenceKeysAndValues:v11 toLegacyDomainAccessor:self->_peoplePickerDomainAccessor withSyncManager:self->_syncManager];
    }
    else
    {
      syncManager = self->_syncManager;
      uint64_t v13 = NSPersonNameDefaultNamePreferencesDomain;
      v11 = +[NSSet setWithObject:v9];
      [(NPSManager *)syncManager synchronizeNanoDomain:v13 keys:v11];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundationDomainAccessor, 0);
  objc_storeStrong((id *)&self->_peoplePickerDomainAccessor, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_shortNameFormatsSpecifiers, 0);
  objc_storeStrong((id *)&self->_shortNameFormatsGroup, 0);

  objc_storeStrong((id *)&self->_shortNameEnabledSpecifier, 0);
}

@end