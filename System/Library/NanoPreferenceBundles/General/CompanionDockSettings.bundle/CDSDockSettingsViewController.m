@interface CDSDockSettingsViewController
- (BOOL)_hasMaximumNumberOfActiveApps;
- (BOOL)_isAppActiveWithBundleID:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)useMRUOrdering;
- (CDSDockSettingsViewController)init;
- (CSLAppSwitcherFavoritesSetting)favoritesSetting;
- (CSLAppSwitcherModeSetting)modeSetting;
- (CSLPRFDefaultAppDataProvider)appLibrary;
- (NSDictionary)apps;
- (NSMutableArray)activeBundleIDs;
- (NSMutableArray)favoritesListSpecifiers;
- (NSMutableArray)groupSpecifiers;
- (NSMutableArray)inactiveBundleIDs;
- (PSSpecifier)MRUOrderingSpecifier;
- (PSSpecifier)favoritesOrderingSpecifier;
- (PSSpecifier)orderingGroupSpecifier;
- (PSSpecifier)spinnerSpecifier;
- (id)_activeStateForSpecifier:(id)a3;
- (id)_tableIndexPathForAppWhenDeactivated:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)_indexForNthApp:(int64_t)a3 withActiveState:(BOOL)a4;
- (int64_t)_indexOfAppWithBundleID:(id)a3;
- (int64_t)maximumActiveBundleIDs;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (unint64_t)_indexForAppWhenDeactivated:(id)a3;
- (unint64_t)activeGroupSectionIndex;
- (unint64_t)inactiveGroupSectionIndex;
- (void)_loadDataWithCompletion:(id)a3;
- (void)_prepareSpecifiers;
- (void)_saveSettings;
- (void)_setActiveState:(BOOL)a3 forSpecifier:(id)a4 updateTable:(BOOL)a5;
- (void)_setActiveState:(id)a3 forSpecifier:(id)a4;
- (void)_settingsDidChange;
- (void)_showAlertWithTitle:(id)a3 message:(id)a4 specifier:(id)a5;
- (void)_showLimitReached:(id)a3;
- (void)_updateOrderingFooterForSelectedSpecifier;
- (void)appSwitcherFavoritesDidUpdate:(id)a3;
- (void)appSwitcherModeDidUpdate:(int64_t)a3;
- (void)dataProviderDidChange:(id)a3;
- (void)dealloc;
- (void)didSelectOrderingSpecifier:(id)a3;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setActiveBundleIDs:(id)a3;
- (void)setAppLibrary:(id)a3;
- (void)setApps:(id)a3;
- (void)setFavoritesListSpecifiers:(id)a3;
- (void)setFavoritesOrderingSpecifier:(id)a3;
- (void)setFavoritesSetting:(id)a3;
- (void)setGroupSpecifiers:(id)a3;
- (void)setInactiveBundleIDs:(id)a3;
- (void)setMRUOrderingSpecifier:(id)a3;
- (void)setMaximumActiveBundleIDs:(int64_t)a3;
- (void)setModeSetting:(id)a3;
- (void)setOrderingGroupSpecifier:(id)a3;
- (void)setSpinnerSpecifier:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CDSDockSettingsViewController

- (CDSDockSettingsViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CDSDockSettingsViewController;
  v2 = [(CDSDockSettingsViewController *)&v11 init];
  if (v2)
  {
    v3 = (CSLAppSwitcherModeSetting *)objc_alloc_init((Class)CSLAppSwitcherModeSetting);
    modeSetting = v2->_modeSetting;
    v2->_modeSetting = v3;

    [(CSLAppSwitcherModeSetting *)v2->_modeSetting setDelegate:v2];
    v5 = (CSLAppSwitcherFavoritesSetting *)objc_alloc_init((Class)CSLAppSwitcherFavoritesSetting);
    favoritesSetting = v2->_favoritesSetting;
    v2->_favoritesSetting = v5;

    [(CSLAppSwitcherFavoritesSetting *)v2->_favoritesSetting setDelegate:v2];
    v7 = (CSLPRFDefaultAppDataProvider *)objc_alloc_init((Class)CSLPRFDefaultAppDataProvider);
    appLibrary = v2->_appLibrary;
    v2->_appLibrary = v7;

    [(CSLPRFDefaultAppDataProvider *)v2->_appLibrary setDelegate:v2];
    v9 = +[MCProfileConnection sharedConnection];
    [v9 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[MCProfileConnection sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CDSDockSettingsViewController;
  [(CDSDockSettingsViewController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    [(CDSDockSettingsViewController *)self _prepareSpecifiers];
    objc_super v4 = *(void **)&self->PSEditableListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CDSDockSettingsViewController;
  [(CDSDockSettingsViewController *)&v4 viewDidLoad];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_33D8;
  v3[3] = &unk_81E8;
  v3[4] = self;
  [(CDSDockSettingsViewController *)self _loadDataWithCompletion:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDSDockSettingsViewController;
  [(CDSDockSettingsViewController *)&v6 viewWillAppear:a3];
  [(CDSDockSettingsViewController *)self reloadSpecifiers];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DOCK_GROUP_NAME" value:&stru_8320 table:@"CompanionDockSettings"];
  [(CDSDockSettingsViewController *)self setTitle:v5];
}

- (unint64_t)activeGroupSectionIndex
{
  uint64_t v3 = [(CDSDockSettingsViewController *)self getGroupSpecifierForSpecifierID:@"ActiveGroup"];
  objc_super v4 = [(CDSDockSettingsViewController *)self indexPathForSpecifier:v3];
  id v5 = [v4 section];

  return (unint64_t)v5;
}

- (unint64_t)inactiveGroupSectionIndex
{
  uint64_t v3 = [(CDSDockSettingsViewController *)self getGroupSpecifierForSpecifierID:@"InactiveGroup"];
  objc_super v4 = [(CDSDockSettingsViewController *)self indexPathForSpecifier:v3];
  id v5 = [v4 section];

  return (unint64_t)v5;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  v8 = [(CDSDockSettingsViewController *)self specifierAtIndexPath:v22];
  id v9 = [(CDSDockSettingsViewController *)self activeGroupSectionIndex];
  id v10 = [v7 section];
  id v11 = [v22 section];
  if (v11 != [v7 section]
    && v10 == v9
    && [(CDSDockSettingsViewController *)self _hasMaximumNumberOfActiveApps])
  {
    [(CDSDockSettingsViewController *)self _showLimitReached:0];
    goto LABEL_14;
  }
  v12 = [v8 app];
  v13 = v12;
  if (v10 == v9)
  {
    inactiveBundleIDs = self->_inactiveBundleIDs;
    v17 = [v12 bundleIdentifier];
    [(NSMutableArray *)inactiveBundleIDs removeObject:v17];

    activeBundleIDs = self->_activeBundleIDs;
    v19 = [v13 bundleIdentifier];
    [(NSMutableArray *)activeBundleIDs removeObject:v19];

    v20 = self->_activeBundleIDs;
    v21 = [v13 bundleIdentifier];
    -[NSMutableArray insertObject:atIndex:](v20, "insertObject:atIndex:", v21, [v7 row]);

    [(CDSDockSettingsViewController *)self _saveSettings];
    if ([v22 section] == v9 && objc_msgSend(v7, "section") == v9) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    goto LABEL_12;
  }
  [(CDSDockSettingsViewController *)self _setActiveState:0 forSpecifier:v8 updateTable:0];
  id v14 = [v22 section];
  if (v14 != [v7 section])
  {
    uint64_t v15 = 0;
LABEL_12:
    +[CSLPRFAppSwitcherEditing logAppSwitcherEditingAction:v15 fromSource:2];
  }
  [(CDSDockSettingsViewController *)self reloadSpecifiers];

LABEL_14:
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CDSDockSettingsViewController *)self activeGroupSectionIndex];
  if ([v10 section] == v11)
  {
    id v12 = v10;
  }
  else
  {
    id v13 = [(CDSDockSettingsViewController *)self inactiveGroupSectionIndex];
    if (([v10 section] != v13 || objc_msgSend(v9, "section") != v13)
      && ([v10 section] == v13 || objc_msgSend(v10, "section") == v11))
    {
      v19.receiver = self;
      v19.super_class = (Class)CDSDockSettingsViewController;
      id v14 = [(CDSDockSettingsViewController *)&v19 tableView:v8 cellForRowAtIndexPath:v9];
      uint64_t v15 = [v14 specifier];
      v16 = [v15 app];
      v17 = [(CDSDockSettingsViewController *)self _tableIndexPathForAppWhenDeactivated:v16];

      goto LABEL_10;
    }
    id v12 = v9;
  }
  v17 = v12;
LABEL_10:

  return v17;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = [(CDSDockSettingsViewController *)self specifierAtIndexPath:a4];
  objc_super v6 = [v5 app];
  id v7 = [(CDSDockSettingsViewController *)self table];
  unsigned int v8 = [v7 isEditing];

  if (v8)
  {
    id v9 = [v6 bundleIdentifier];
    if ([(CDSDockSettingsViewController *)self _isAppActiveWithBundleID:v9]) {
      int64_t v10 = 1;
    }
    else {
      int64_t v10 = 2;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DOCK_REMOVE" value:&stru_8320 table:@"CompanionDockSettings"];

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int64_t v10 = [(CDSDockSettingsViewController *)self specifierAtIndexPath:v9];
  if (a4 != 2 || ![(CDSDockSettingsViewController *)self _hasMaximumNumberOfActiveApps])
  {
    v15.receiver = self;
    v15.super_class = (Class)CDSDockSettingsViewController;
    [(CDSDockSettingsViewController *)&v15 tableView:v8 commitEditingStyle:a4 forRowAtIndexPath:v9];
    id v11 = [v10 app];
    id v12 = [v11 bundleIdentifier];
    unsigned int v13 = [(CDSDockSettingsViewController *)self _isAppActiveWithBundleID:v12];

    uint64_t v14 = 1;
    [(CDSDockSettingsViewController *)self _setActiveState:v13 ^ 1 forSpecifier:v10 updateTable:1];
    if (a4 != 2)
    {
      if (a4 != 1)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v14 = 0;
    }
    +[CSLPRFAppSwitcherEditing logAppSwitcherEditingAction:v14 fromSource:2];
    goto LABEL_8;
  }
  [(CDSDockSettingsViewController *)self _showLimitReached:v10];
LABEL_9:
}

- (void)dataProviderDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_3BA8;
  v3[3] = &unk_81E8;
  v3[4] = self;
  [(CDSDockSettingsViewController *)self _loadDataWithCompletion:v3];
}

- (void)_showLimitReached:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v5 localizedStringForKey:@"DOCK_LIMIT_TITLE" value:&stru_8320 table:@"CompanionDockSettings"];

  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"DOCK_LIMIT_MESSAGE" value:&stru_8320 table:@"CompanionDockSettings"];
  id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, self->_maximumActiveBundleIDs);

  [(CDSDockSettingsViewController *)self _showAlertWithTitle:v9 message:v8 specifier:v4];
}

- (void)_showAlertWithTitle:(id)a3 message:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  id v9 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  int64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"DOCK_OK" value:&stru_8320 table:@"CompanionDockSettings"];
  uint64_t v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_3E58;
  v17 = &unk_8210;
  id v18 = v8;
  objc_super v19 = self;
  id v12 = v8;
  unsigned int v13 = +[UIAlertAction actionWithTitle:v11 style:1 handler:&v14];
  objc_msgSend(v9, "addAction:", v13, v14, v15, v16, v17);

  [(CDSDockSettingsViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_saveSettings
{
  if (self->_maximumActiveBundleIDs) {
    [(CSLAppSwitcherFavoritesSetting *)self->_favoritesSetting setFavorites:self->_activeBundleIDs];
  }
}

- (void)_loadDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLAppSwitcherFavoritesSetting *)self->_favoritesSetting favorites];
  self->_maximumActiveBundleIDs = (int64_t)[(CSLAppSwitcherFavoritesSetting *)self->_favoritesSetting maximumFavorites];
  appLibrary = self->_appLibrary;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3F90;
  v9[3] = &unk_8278;
  v9[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [(CSLPRFDefaultAppDataProvider *)appLibrary loadAppsWithCompletion:v9];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4368;
  v4[3] = &unk_81E8;
  v4[4] = self;
  -[CDSDockSettingsViewController _loadDataWithCompletion:](self, "_loadDataWithCompletion:", v4, a4);
}

- (BOOL)useMRUOrdering
{
  return [(CSLAppSwitcherModeSetting *)self->_modeSetting mode] == (char *)&dword_0 + 1;
}

- (BOOL)_hasMaximumNumberOfActiveApps
{
  return [(NSMutableArray *)self->_activeBundleIDs count] == self->_maximumActiveBundleIDs;
}

- (BOOL)_isAppActiveWithBundleID:(id)a3
{
  return [(NSMutableArray *)self->_activeBundleIDs containsObject:a3];
}

- (void)_settingsDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_445C;
  v2[3] = &unk_81E8;
  v2[4] = self;
  [(CDSDockSettingsViewController *)self _loadDataWithCompletion:v2];
}

- (void)_updateOrderingFooterForSelectedSpecifier
{
  orderingGroupSpecifier = self->_orderingGroupSpecifier;
  if (!orderingGroupSpecifier) {
    return;
  }
  id v4 = [(PSSpecifier *)orderingGroupSpecifier propertyForKey:PSRadioGroupCheckedSpecifierKey];
  id v9 = v4;
  if (v4 == self->_favoritesOrderingSpecifier)
  {
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = v6;
    CFStringRef v8 = @"DOCK_ORDERING_FAVORITES_SELECTED_FOOTER";
LABEL_8:
    id v5 = [v6 localizedStringForKey:v8 value:&stru_8320 table:@"CompanionDockSettings"];

    goto LABEL_9;
  }
  if (v4 == self->_MRUOrderingSpecifier)
  {
    objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = v6;
    CFStringRef v8 = @"DOCK_ORDERING_MRU_SELECTED_FOOTER";
    goto LABEL_8;
  }
  id v5 = &stru_8320;
LABEL_9:
  [(PSSpecifier *)self->_orderingGroupSpecifier setProperty:v5 forKey:PSFooterTextGroupKey];
}

- (void)_prepareSpecifiers
{
  v33 = +[NSMutableArray array];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DOCK_ORDERING_GROUP_NAME" value:&stru_8320 table:@"CompanionDockSettings"];
  id v5 = +[PSSpecifier groupSpecifierWithID:@"OrderingOptionGroup" name:v4];
  orderingGroupSpecifier = self->_orderingGroupSpecifier;
  self->_orderingGroupSpecifier = v5;

  [(PSSpecifier *)self->_orderingGroupSpecifier setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v8 = [v7 localizedStringForKey:@"DOCK_ORDERING_FAVORITES" value:&stru_8320 table:@"CompanionDockSettings"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  favoritesOrderingSpecifier = self->_favoritesOrderingSpecifier;
  self->_favoritesOrderingSpecifier = v9;

  uint64_t v11 = PSEnabledKey;
  [(PSSpecifier *)self->_favoritesOrderingSpecifier setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v13 = [v12 localizedStringForKey:@"DOCK_ORDERING_MRU" value:&stru_8320 table:@"CompanionDockSettings"];
  uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:3 edit:0];
  MRUOrderingSpecifier = self->_MRUOrderingSpecifier;
  self->_MRUOrderingSpecifier = v14;

  [(PSSpecifier *)self->_MRUOrderingSpecifier setProperty:&__kCFBooleanTrue forKey:v11];
  v16 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
  spinnerSpecifier = self->_spinnerSpecifier;
  self->_spinnerSpecifier = v16;

  if ([(CDSDockSettingsViewController *)self useMRUOrdering]) {
    uint64_t v18 = 280;
  }
  else {
    uint64_t v18 = 272;
  }
  id v19 = *(id *)&self->PSEditableListController_opaque[v18];
  [(PSSpecifier *)self->_orderingGroupSpecifier setProperty:v19 forKey:PSRadioGroupCheckedSpecifierKey];
  [(CDSDockSettingsViewController *)self _updateOrderingFooterForSelectedSpecifier];
  [v33 addObject:self->_orderingGroupSpecifier];
  [v33 addObject:self->_MRUOrderingSpecifier];
  [v33 addObject:self->_favoritesOrderingSpecifier];
  v20 = (NSMutableArray *)objc_opt_new();
  groupSpecifiers = self->_groupSpecifiers;
  self->_groupSpecifiers = v20;

  id v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  favoritesListSpecifiers = self->_favoritesListSpecifiers;
  self->_favoritesListSpecifiers = v22;

  v24 = +[NSBundle bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"DOCK_FAVORITES_INCLUDED_SECTION_HEADER" value:&stru_8320 table:@"CompanionDockSettings"];
  v26 = +[PSSpecifier groupSpecifierWithID:@"ActiveGroup" name:v25];

  [v33 addObject:v26];
  [(NSMutableArray *)self->_groupSpecifiers addObject:v26];
  if ([(CDSDockSettingsViewController *)self useMRUOrdering])
  {
    [v33 removeObject:v26];
    [(CDSDockSettingsViewController *)self setEditingButtonHidden:1 animated:0];
  }
  else
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_4B00;
    v34[3] = &unk_82A0;
    v34[4] = self;
    v27 = objc_retainBlock(v34);
    [(NSMutableArray *)self->_activeBundleIDs enumerateObjectsUsingBlock:v27];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"DOCK_DO_NOT_INCLUDE_HEADER" value:&stru_8320 table:@"CompanionDockSettings"];
    v30 = +[PSSpecifier groupSpecifierWithID:@"InactiveGroup" name:v29];

    [(NSMutableArray *)self->_favoritesListSpecifiers addObject:v30];
    [(NSMutableArray *)self->_groupSpecifiers addObject:v30];
    [(NSMutableArray *)self->_inactiveBundleIDs enumerateObjectsUsingBlock:v27];
    [v33 addObjectsFromArray:self->_favoritesListSpecifiers];
    [(CDSDockSettingsViewController *)self setEditingButtonHidden:0 animated:0];
  }
  v31 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers] = v33;
  id v32 = v33;
}

- (void)_setActiveState:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  -[CDSDockSettingsViewController _setActiveState:forSpecifier:updateTable:](self, "_setActiveState:forSpecifier:updateTable:", [a3 BOOLValue], v6, 1);

  [(CDSDockSettingsViewController *)self reloadSpecifiers];
}

- (id)_activeStateForSpecifier:(id)a3
{
  id v4 = [a3 app];
  activeBundleIDs = self->_activeBundleIDs;
  id v6 = [v4 bundleIdentifier];
  id v7 = [(NSMutableArray *)activeBundleIDs containsObject:v6];

  CFStringRef v8 = +[NSNumber numberWithBool:v7];

  return v8;
}

- (void)_setActiveState:(BOOL)a3 forSpecifier:(id)a4 updateTable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (v6 && [(CDSDockSettingsViewController *)self _hasMaximumNumberOfActiveApps])
  {
    [(CDSDockSettingsViewController *)self _showLimitReached:v8];
    goto LABEL_17;
  }
  id v9 = [v8 app];
  id v10 = [v9 bundleIdentifier];

  if (v10)
  {
    if (v6)
    {
      inactiveBundleIDs = self->_inactiveBundleIDs;
      id v12 = [v9 bundleIdentifier];
      [(NSMutableArray *)inactiveBundleIDs removeObject:v12];

      activeBundleIDs = self->_activeBundleIDs;
      uint64_t v14 = [v9 bundleIdentifier];
      LOBYTE(activeBundleIDs) = [(NSMutableArray *)activeBundleIDs containsObject:v14];

      if ((activeBundleIDs & 1) == 0)
      {
        uint64_t v15 = self->_activeBundleIDs;
        v16 = [v9 bundleIdentifier];
        [(NSMutableArray *)v15 addObject:v16];
LABEL_10:
      }
    }
    else
    {
      v17 = self->_activeBundleIDs;
      uint64_t v18 = [v9 bundleIdentifier];
      [(NSMutableArray *)v17 removeObject:v18];

      id v19 = self->_inactiveBundleIDs;
      v20 = [v9 bundleIdentifier];
      LOBYTE(v19) = [(NSMutableArray *)v19 containsObject:v20];

      if ((v19 & 1) == 0)
      {
        unint64_t v21 = [(CDSDockSettingsViewController *)self _indexForAppWhenDeactivated:v9];
        id v22 = self->_inactiveBundleIDs;
        v16 = [v9 bundleIdentifier];
        [(NSMutableArray *)v22 insertObject:v16 atIndex:v21];
        goto LABEL_10;
      }
    }
  }
  if (v5)
  {
    [(CDSDockSettingsViewController *)self removeSpecifier:v8];
    v23 = [v8 identifier];
    int64_t v24 = [(CDSDockSettingsViewController *)self _indexOfAppWithBundleID:v23];

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_579C((uint64_t)v8, v6);
      }
    }
    else
    {
      [(CDSDockSettingsViewController *)self insertSpecifier:v8 atIndex:v24 animated:1];
    }
  }
  [(CDSDockSettingsViewController *)self _saveSettings];

LABEL_17:
}

- (int64_t)_indexOfAppWithBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_activeBundleIDs indexOfObject:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(NSMutableArray *)self->_inactiveBundleIDs indexOfObject:v4];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      CFStringRef v7 = 0;
    }
    else {
      CFStringRef v7 = @"InactiveGroup";
    }
  }
  else
  {
    id v6 = v5;
    CFStringRef v7 = @"ActiveGroup";
  }
  id v8 = [(CDSDockSettingsViewController *)self rangeOfSpecifiersInGroupID:v7];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    int64_t v9 = (int64_t)v6;
  }
  else {
    int64_t v9 = (int64_t)v8 + (void)v6 + 1;
  }

  return v9;
}

- (int64_t)_indexForNthApp:(int64_t)a3 withActiveState:(BOOL)a4
{
  int64_t v4 = a3;
  if (!a4) {
    return (int64_t)[(NSMutableArray *)self->_activeBundleIDs count] + a3;
  }
  return v4;
}

- (unint64_t)_indexForAppWhenDeactivated:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_inactiveBundleIDs;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    CFStringRef v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      id v10 = 0;
      uint64_t v15 = &v7[(void)v8];
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [(NSDictionary *)self->_apps objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * (void)v10)];
        id v12 = [v4 compare:v11];

        if (v12 == (id)-1)
        {
          unint64_t v13 = (unint64_t)&v10[(void)v8];
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      CFStringRef v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      unint64_t v13 = (unint64_t)v15;
      id v8 = v15;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
LABEL_12:

  return v13;
}

- (id)_tableIndexPathForAppWhenDeactivated:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CDSDockSettingsViewController *)self inactiveGroupSectionIndex];
  unint64_t v6 = [(CDSDockSettingsViewController *)self _indexForAppWhenDeactivated:v4];

  return +[NSIndexPath indexPathForRow:v6 inSection:v5];
}

- (void)didSelectOrderingSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CDSDockSettingsViewController *)self MRUOrderingSpecifier];

  if ((v5 == v4) != [(CDSDockSettingsViewController *)self useMRUOrdering])
  {
    [(CSLAppSwitcherModeSetting *)self->_modeSetting setMode:v5 == v4];
    [(CDSDockSettingsViewController *)self reloadSpecifiers];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CDSDockSettingsViewController *)self specifierAtIndexPath:v7];
  uint64_t v9 = [(CDSDockSettingsViewController *)self favoritesOrderingSpecifier];
  if (v8 == (void *)v9)
  {

    goto LABEL_7;
  }
  id v10 = (void *)v9;
  uint64_t v11 = [(CDSDockSettingsViewController *)self MRUOrderingSpecifier];
  if (v8 == (void *)v11)
  {

    goto LABEL_7;
  }
  id v12 = (void *)v11;
  unint64_t v13 = [(CDSDockSettingsViewController *)self spinnerSpecifier];

  if (v8 == v13)
  {
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  v16.receiver = self;
  v16.super_class = (Class)CDSDockSettingsViewController;
  BOOL v14 = [(CDSDockSettingsViewController *)&v16 tableView:v6 canEditRowAtIndexPath:v7];
LABEL_8:

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CDSDockSettingsViewController;
  id v6 = a4;
  [(CDSDockSettingsViewController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[CDSDockSettingsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v10.receiver, v10.super_class);

  id v8 = [(CDSDockSettingsViewController *)self getGroupSpecifierForSpecifier:v7];
  uint64_t v9 = [(CDSDockSettingsViewController *)self orderingGroupSpecifier];

  if (v8 == v9)
  {
    [(CDSDockSettingsViewController *)self didSelectOrderingSpecifier:v7];
    [(CDSDockSettingsViewController *)self _updateOrderingFooterForSelectedSpecifier];
  }
}

- (void)appSwitcherModeDidUpdate:(int64_t)a3
{
}

- (void)appSwitcherFavoritesDidUpdate:(id)a3
{
}

- (CSLAppSwitcherModeSetting)modeSetting
{
  return self->_modeSetting;
}

- (void)setModeSetting:(id)a3
{
}

- (CSLAppSwitcherFavoritesSetting)favoritesSetting
{
  return self->_favoritesSetting;
}

- (void)setFavoritesSetting:(id)a3
{
}

- (NSMutableArray)groupSpecifiers
{
  return self->_groupSpecifiers;
}

- (void)setGroupSpecifiers:(id)a3
{
}

- (NSMutableArray)favoritesListSpecifiers
{
  return self->_favoritesListSpecifiers;
}

- (void)setFavoritesListSpecifiers:(id)a3
{
}

- (CSLPRFDefaultAppDataProvider)appLibrary
{
  return self->_appLibrary;
}

- (void)setAppLibrary:(id)a3
{
}

- (NSDictionary)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (NSMutableArray)activeBundleIDs
{
  return self->_activeBundleIDs;
}

- (void)setActiveBundleIDs:(id)a3
{
}

- (NSMutableArray)inactiveBundleIDs
{
  return self->_inactiveBundleIDs;
}

- (void)setInactiveBundleIDs:(id)a3
{
}

- (int64_t)maximumActiveBundleIDs
{
  return self->_maximumActiveBundleIDs;
}

- (void)setMaximumActiveBundleIDs:(int64_t)a3
{
  self->_maximumActiveBundleIDs = a3;
}

- (PSSpecifier)orderingGroupSpecifier
{
  return self->_orderingGroupSpecifier;
}

- (void)setOrderingGroupSpecifier:(id)a3
{
}

- (PSSpecifier)favoritesOrderingSpecifier
{
  return self->_favoritesOrderingSpecifier;
}

- (void)setFavoritesOrderingSpecifier:(id)a3
{
}

- (PSSpecifier)MRUOrderingSpecifier
{
  return self->_MRUOrderingSpecifier;
}

- (void)setMRUOrderingSpecifier:(id)a3
{
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_MRUOrderingSpecifier, 0);
  objc_storeStrong((id *)&self->_favoritesOrderingSpecifier, 0);
  objc_storeStrong((id *)&self->_orderingGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_inactiveBundleIDs, 0);
  objc_storeStrong((id *)&self->_activeBundleIDs, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_favoritesListSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifiers, 0);
  objc_storeStrong((id *)&self->_favoritesSetting, 0);

  objc_storeStrong((id *)&self->_modeSetting, 0);
}

@end