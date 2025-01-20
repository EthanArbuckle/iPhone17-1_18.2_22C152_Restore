@interface ICSettingsAutoSortChecklistController
- (id)settingsBundle;
- (id)specifiers;
- (id)stateSpecifierNamed:(id)a3 isChecked:(BOOL)a4 group:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICSettingsAutoSortChecklistController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSettingsAutoSortChecklistController;
  [(ICSettingsAutoSortChecklistController *)&v4 viewDidAppear:a3];
  [(ICSettingsAutoSortChecklistController *)self ic_submitNavigationEventForIdentifier:@"SORT_CHECKED_ITEMS" titleStringKey:@"SORT_CHECKED_ITEMS_SETTINGS" navigationComponents:&off_1F1F0];
}

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  objc_super v4 = +[PSSpecifier emptyGroupSpecifier];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  [v3 addObject:v4];
  id v5 = +[ICSettingsUtilities BOOLForKey:@"ICChecklistAutoSortEnabledDefaultsKey"];
  v6 = [(ICSettingsAutoSortChecklistController *)self settingsBundle];
  v7 = [v6 localizedStringForKey:@"AUTO_SORT_CHECKLIST_OFF" value:@"Manually" table:@"Settings"];
  v8 = [(ICSettingsAutoSortChecklistController *)self stateSpecifierNamed:v7 isChecked:v5 ^ 1 group:v4];

  CFStringRef v19 = @"ICAutoSortSpecifierOn";
  v20 = &__kCFBooleanFalse;
  v9 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v8 setUserInfo:v9];

  [v3 addObject:v8];
  v10 = [(ICSettingsAutoSortChecklistController *)self settingsBundle];
  v11 = [v10 localizedStringForKey:@"AUTO_SORT_CHECKLIST_ON" value:@"Automatically" table:@"Settings"];
  v12 = [(ICSettingsAutoSortChecklistController *)self stateSpecifierNamed:v11 isChecked:v5 group:v4];

  CFStringRef v17 = @"ICAutoSortSpecifierOn";
  v18 = &__kCFBooleanTrue;
  v13 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v12 setUserInfo:v13];

  [v3 addObject:v12];
  v14 = [(ICSettingsAutoSortChecklistController *)self settingsBundle];
  v15 = [v14 localizedStringForKey:@"SORT_CHECKED_ITEMS_FOOTER" value:@"Automatically move checklist items to the bottom of the list as they are checked." table:@"Settings"];
  [v4 setProperty:v15 forKey:PSFooterTextGroupKey];

  [(ICSettingsAutoSortChecklistController *)self setSpecifiers:v3];

  return v3;
}

- (id)settingsBundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)stateSpecifierNamed:(id)a3 isChecked:(BOOL)a4 group:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  if (v5) {
    [v8 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSettingsAutoSortChecklistController;
  [(ICSettingsAutoSortChecklistController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(ICSettingsAutoSortChecklistController *)self specifierAtIndexPath:v6];
  objc_opt_class();
  id v8 = [v7 userInfo];
  v9 = ICDynamicCast();

  if (![v6 section] || objc_msgSend(v6, "section") == (char *)&dword_0 + 1)
  {
    v10 = [v9 objectForKeyedSubscript:@"ICAutoSortSpecifierOn"];
    id v11 = [v10 BOOLValue];

    +[ICInstrumentationUtilities incrementAutoSortSelectionChangeCountForState:v11];
    +[ICSettingsUtilities setBool:v11 forKey:@"ICChecklistAutoSortEnabledDefaultsKey"];
  }
  [(ICSettingsAutoSortChecklistController *)self reloadSpecifiers];
}

@end