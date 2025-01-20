@interface ContactsShortNameController
- (id)preferNicknames;
- (id)shortNameEnabled;
- (id)shortNameFormat;
- (id)specifiers;
- (void)provideSettingsNavigationDonation;
- (void)setPreferNicknames:(id)a3;
- (void)setShortNameEnabled:(id)a3;
- (void)setShortNameFormat:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ContactsShortNameController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContactsShortNameController;
  [(ContactsShortNameController *)&v4 viewDidAppear:a3];
  [(ContactsShortNameController *)self provideSettingsNavigationDonation];
}

- (void)setShortNameEnabled:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  ABPersonSetShortNameFormatEnabled();
  shortNameFormatsSpecifiers = self->_shortNameFormatsSpecifiers;
  if (v4)
  {
    shortNameEnabledSpecifier = self->_shortNameEnabledSpecifier;
    [(ContactsShortNameController *)self insertContiguousSpecifiers:shortNameFormatsSpecifiers afterSpecifier:shortNameEnabledSpecifier animated:1];
  }
  else
  {
    -[ContactsShortNameController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", shortNameFormatsSpecifiers, 1, v5);
  }
}

- (id)shortNameEnabled
{
  uint64_t ShortNameFormatEnabled = ABPersonGetShortNameFormatEnabled();

  return +[NSNumber numberWithBool:ShortNameFormatEnabled];
}

- (void)setShortNameFormat:(id)a3
{
  id v3 = [a3 intValue];

  _ABPersonSetShortNameFormat(v3);
}

- (id)shortNameFormat
{
  uint64_t ShortNameFormat = ABPersonGetShortNameFormat();

  return +[NSNumber numberWithInt:ShortNameFormat];
}

- (void)setPreferNicknames:(id)a3
{
  id v3 = [a3 BOOLValue];

  _ABPersonSetShortNamePreferNicknames(v3);
}

- (id)preferNicknames
{
  uint64_t ShortNamePreferNicknames = ABPersonGetShortNamePreferNicknames();

  return +[NSNumber numberWithBool:ShortNamePreferNicknames];
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v48 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Short Name" value:&stru_10D88 table:@"Contacts"];
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setShortNameEnabled:" get:"shortNameEnabled" detail:0 cell:6 edit:0];
    shortNameEnabledSpecifier = self->_shortNameEnabledSpecifier;
    self->_shortNameEnabledSpecifier = v7;

    v9 = self->_shortNameEnabledSpecifier;
    v10 = +[NSNumber numberWithBool:1];
    uint64_t v49 = PSDefaultValueKey;
    -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v10);

    v50 = v4;
    [v4 addObject:self->_shortNameEnabledSpecifier];
    v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:6];
    shortNameFormatsSpecifiers = self->_shortNameFormatsSpecifiers;
    self->_shortNameFormatsSpecifiers = v11;

    v13 = +[PSSpecifier emptyGroupSpecifier];
    shortNameFormatsGroup = self->_shortNameFormatsGroup;
    self->_shortNameFormatsGroup = v13;

    v15 = self->_shortNameFormatsGroup;
    v16 = +[NSNumber numberWithBool:1];
    [(PSSpecifier *)v15 setProperty:v16 forKey:PSIsRadioGroupKey];

    v17 = self->_shortNameFormatsGroup;
    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"SHORT_NAME_FORMAT_EXPLANATORY" value:&stru_10D88 table:@"Contacts"];
    uint64_t v47 = PSFooterTextGroupKey;
    -[PSSpecifier setProperty:forKey:](v17, "setProperty:forKey:", v19);

    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:self->_shortNameFormatsGroup];
    v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"SHORT_NAME_FORMAT_INITIAL_LAST" value:&stru_10D88 table:@"Contacts"];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v23 = +[NSNumber numberWithInt:0];
    [v22 setUserInfo:v23];

    if (!ABPersonGetShortNameFormat()) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v22 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v22];
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"SHORT_NAME_FORMAT_INITIAL_FIRST" value:&stru_10D88 table:@"Contacts"];
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v27 = +[NSNumber numberWithInt:1];
    [v26 setUserInfo:v27];

    if (ABPersonGetShortNameFormat() == 1) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v26 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v26];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"SHORT_NAME_FORMAT_FIRST_ONLY" value:&stru_10D88 table:@"Contacts"];
    v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v31 = +[NSNumber numberWithInt:2];
    [v30 setUserInfo:v31];

    if (ABPersonGetShortNameFormat() == 2) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v30 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v30];
    v32 = +[NSBundle bundleForClass:objc_opt_class()];
    v33 = [v32 localizedStringForKey:@"SHORT_NAME_FORMAT_LAST_ONLY" value:&stru_10D88 table:@"Contacts"];
    v34 = +[PSSpecifier preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:3 edit:0];

    v35 = +[NSNumber numberWithInt:3];
    [v34 setUserInfo:v35];

    if (ABPersonGetShortNameFormat() == 3) {
      [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v34 forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [(NSMutableArray *)self->_shortNameFormatsSpecifiers addObject:v34];
    v36 = [(ContactsShortNameController *)self shortNameEnabled];
    unsigned int v37 = [v36 BOOLValue];

    if (v37) {
      [v50 addObjectsFromArray:self->_shortNameFormatsSpecifiers];
    }
    v38 = +[PSSpecifier emptyGroupSpecifier];

    v39 = +[NSBundle bundleForClass:objc_opt_class()];
    v40 = [v39 localizedStringForKey:@"PREFER_NICKNAMES_EXPLANTORY" value:&stru_10D88 table:@"Contacts"];
    [v38 setProperty:v40 forKey:v47];

    [v50 addObject:v38];
    v41 = +[NSBundle bundleForClass:objc_opt_class()];
    v42 = [v41 localizedStringForKey:@"Prefer Nicknames" value:&stru_10D88 table:@"Contacts"];
    v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:self set:"setPreferNicknames:" get:"preferNicknames" detail:0 cell:6 edit:0];

    v44 = +[NSNumber numberWithBool:1];
    [v43 setProperty:v44 forKey:v49];

    [v50 addObject:v43];
    v45 = *(void **)&self->PSListController_opaque[v48];
    *(void *)&self->PSListController_opaque[v48] = v50;

    id v3 = *(void **)&self->PSListController_opaque[v48];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ContactsShortNameController;
  [(ContactsShortNameController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [v6 section];
  v8 = [(ContactsShortNameController *)self indexPathForIndex:[(ContactsShortNameController *)self indexOfSpecifier:self->_shortNameFormatsGroup]];
  id v9 = [v8 section];

  if (v7 == v9)
  {
    v10 = [(ContactsShortNameController *)self specifierAtIndex:[(ContactsShortNameController *)self indexForIndexPath:v6]];
    v11 = [v10 userInfo];
    [(ContactsShortNameController *)self setShortNameFormat:v11];

    [(PSSpecifier *)self->_shortNameFormatsGroup setProperty:v10 forKey:PSRadioGroupCheckedSpecifierKey];
  }
}

- (void)provideSettingsNavigationDonation
{
  v19 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.MobileAddressBook"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  id v4 = +[NSLocale currentLocale];
  uint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"Short Name" table:@"Contacts" locale:v4 bundleURL:v6];

  id v8 = objc_alloc((Class)_NSLocalizedStringResource);
  id v9 = +[NSLocale currentLocale];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 bundleURL];
  id v12 = [v8 initWithKey:@"CONTACTS" table:@"Contacts" locale:v9 bundleURL:v11];

  id v13 = objc_alloc((Class)_NSLocalizedStringResource);
  v14 = +[NSLocale currentLocale];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  id v17 = [v13 initWithKey:@"Short Name" table:@"Contacts" locale:v14 bundleURL:v16];

  v20[0] = v12;
  v20[1] = v17;
  v18 = +[NSArray arrayWithObjects:v20 count:2];
  [(ContactsShortNameController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.MobileAddressBook" title:v7 localizedNavigationComponents:v18 deepLink:v19];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortNameFormatsSpecifiers, 0);
  objc_storeStrong((id *)&self->_shortNameFormatsGroup, 0);

  objc_storeStrong((id *)&self->_shortNameEnabledSpecifier, 0);
}

@end