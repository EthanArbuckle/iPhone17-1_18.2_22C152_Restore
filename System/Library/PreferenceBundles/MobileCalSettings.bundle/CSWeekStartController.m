@interface CSWeekStartController
- (id)specifiers;
- (void)showLanguageAndRegionSettings:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CSWeekStartController

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CSWeekStartController;
  [(CSWeekStartController *)&v17 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.mobilecal/startWeekOn"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Start Week On" table:@"MobileCalSettings" locale:v6 bundleURL:v8];

  id v10 = objc_alloc((Class)_NSLocalizedStringResource);
  v11 = +[NSLocale currentLocale];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 bundleURL];
  id v14 = [v10 initWithKey:@"Calendar" table:@"MobileCalSettings" locale:v11 bundleURL:v13];

  id v18 = v14;
  v15 = +[NSArray arrayWithObjects:&v18 count:1];
  [(CSWeekStartController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobilecal" title:v9 localizedNavigationComponents:v15 deepLink:v4];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"_weekStartChanged" name:CUIKPreferencesNotification_WeekStart object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CSWeekStartController;
  [(CSWeekStartController *)&v5 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CUIKPreferencesNotification_WeekStart object:0];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v46 = OBJC_IVAR___PSListController__specifiers;
    v4 = +[CUIKPreferences sharedPreferences];
    objc_super v5 = [v4 weekStart];
    v47 = (char *)[v5 integerValue];

    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = [v6 localizedStringForKey:@"Mirror System Setting" value:&stru_1CE38 table:@"MobileCalSettings"];
    id v9 = +[PSSpecifier groupSpecifierWithName:v8];
    systemWeekStartGroup = self->_systemWeekStartGroup;
    self->_systemWeekStartGroup = v9;

    uint64_t v45 = PSIsRadioGroupKey;
    -[PSSpecifier setProperty:forKey:](self->_systemWeekStartGroup, "setProperty:forKey:", &__kCFBooleanTrue);
    v11 = self->_systemWeekStartGroup;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [(PSSpecifier *)v11 setProperty:v13 forKey:PSFooterCellClassGroupKey];

    uint64_t v14 = [v6 localizedStringForKey:@"When selected, Calendar will use the setting from %@.", &stru_1CE38, @"MobileCalSettings" value table];
    uint64_t v15 = [v6 localizedStringForKey:@"Language & Region" value:&stru_1CE38 table:@"MobileCalSettings"];
    v44 = (void *)v14;
    v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v15);
    [(PSSpecifier *)self->_systemWeekStartGroup setProperty:v16 forKey:PSFooterHyperlinkViewTitleKey];
    v42 = v16;
    v43 = (void *)v15;
    v49.location = (NSUInteger)[v16 rangeOfString:v15];
    objc_super v17 = self->_systemWeekStartGroup;
    id v18 = NSStringFromRange(v49);
    [(PSSpecifier *)v17 setProperty:v18 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v19 = self->_systemWeekStartGroup;
    v20 = +[NSValue valueWithNonretainedObject:self];
    [(PSSpecifier *)v19 setProperty:v20 forKey:PSFooterHyperlinkViewTargetKey];

    [(PSSpecifier *)self->_systemWeekStartGroup setProperty:@"showLanguageAndRegionSettings:" forKey:PSFooterHyperlinkViewActionKey];
    [v7 addObject:self->_systemWeekStartGroup];
    v21 = +[NSCalendar currentCalendar];
    uint64_t v22 = [v6 localizedStringForKey:@"System Setting (%@)" value:&stru_1CE38 table:@"MobileCalSettings"];
    v41 = v21;
    [v21 firstWeekday];
    v23 = CUIKStringForDayOfWeek();
    v40 = (void *)v22;
    v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v23);

    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:0 set:0 get:0 detail:0 cell:3 edit:0];
    systemWeekStartItem = self->_systemWeekStartItem;
    self->_systemWeekStartItem = v25;

    uint64_t v27 = PSRadioGroupCheckedSpecifierKey;
    if (!v47) {
      [(PSSpecifier *)self->_systemWeekStartGroup setProperty:self->_systemWeekStartItem forKey:PSRadioGroupCheckedSpecifierKey];
    }
    [v7 addObject:self->_systemWeekStartItem];
    v28 = [v6 localizedStringForKey:@"Calendar App Only" value:&stru_1CE38 table:@"MobileCalSettings"];
    v29 = +[PSSpecifier groupSpecifierWithName:v28];
    customWeekStartGroup = self->_customWeekStartGroup;
    self->_customWeekStartGroup = v29;

    [(PSSpecifier *)self->_customWeekStartGroup setProperty:&__kCFBooleanTrue forKey:v45];
    v31 = self->_customWeekStartGroup;
    v32 = [v6 localizedStringForKey:@"This setting will apply in Calendar only. Other apps will use the system setting." value:&stru_1CE38 table:@"MobileCalSettings"];
    [(PSSpecifier *)v31 setProperty:v32 forKey:PSFooterTextGroupKey];

    [v7 addObject:self->_customWeekStartGroup];
    v33 = +[NSMutableArray arrayWithCapacity:7];
    customWeekStartItems = self->_customWeekStartItems;
    self->_customWeekStartItems = v33;

    v35 = 0;
    do
    {
      v36 = CUIKStringForDayOfWeek();
      v37 = +[PSSpecifier preferenceSpecifierNamed:v36 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      if (v47 - 1 == v35) {
        [(PSSpecifier *)self->_customWeekStartGroup setProperty:v37 forKey:v27];
      }
      ++v35;
      [v7 addObject:v37];
      [(NSMutableArray *)self->_customWeekStartItems addObject:v37];
    }
    while (v35 != (unsigned char *)&dword_4 + 3);
    v38 = *(void **)&self->PSListController_opaque[v46];
    *(void *)&self->PSListController_opaque[v46] = v7;

    v3 = *(void **)&self->PSListController_opaque[v46];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CSWeekStartController;
  [(CSWeekStartController *)&v15 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = [(CSWeekStartController *)self indexPathForSpecifier:self->_systemWeekStartItem];
  id v8 = [v7 section];

  id v9 = [(NSMutableArray *)self->_customWeekStartItems firstObject];
  id v10 = [(CSWeekStartController *)self indexPathForSpecifier:v9];
  id v11 = [v10 section];

  if ([v6 section] == v8)
  {
    v12 = +[CUIKPreferences sharedPreferences];
    v13 = (char *)[v6 row];
LABEL_5:
    uint64_t v14 = +[NSNumber numberWithInteger:v13];
    [v12 setWeekStart:v14];

    goto LABEL_6;
  }
  if ([v6 section] == v11)
  {
    v12 = +[CUIKPreferences sharedPreferences];
    v13 = (char *)[v6 row] + 1;
    goto LABEL_5;
  }
LABEL_6:
  [(CSWeekStartController *)self reloadSpecifiers];
}

- (void)showLanguageAndRegionSettings:(id)a3
{
  +[NSURL URLWithString:@"prefs:root=General&path=INTERNATIONAL"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customWeekStartItems, 0);
  objc_storeStrong((id *)&self->_customWeekStartGroup, 0);
  objc_storeStrong((id *)&self->_systemWeekStartItem, 0);

  objc_storeStrong((id *)&self->_systemWeekStartGroup, 0);
}

@end