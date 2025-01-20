@interface CCSComplicationController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CCSComplicationController)init;
- (NCSSettingsManager)settingsManager;
- (NSMutableArray)groupSpecifiers;
- (NSMutableDictionary)appIcons;
- (id)_iconForSpecifier:(id)a3;
- (id)_specifiersFromSettingsManager;
- (id)activeStateForSpecifier:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)findIndexOfComplicationWithIdentifier:(id)a3;
- (int64_t)findIndexOfNthComplication:(int64_t)a3 withActiveState:(BOOL)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (void)setActiveState:(id)a3 forSpecifier:(id)a4;
- (void)setActiveState:(id)a3 forSpecifier:(id)a4 save:(BOOL)a5;
- (void)setAppIcons:(id)a3;
- (void)setGroupSpecifiers:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CCSComplicationController

- (CCSComplicationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CCSComplicationController;
  v2 = [(CCSComplicationController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    appIcons = v2->_appIcons;
    v2->_appIcons = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NCSSettingsManager sharedSettingsManager];
    settingsManager = v2->_settingsManager;
    v2->_settingsManager = (NCSSettingsManager *)v5;

    [(NCSSettingsManager *)v2->_settingsManager setDelegate:v2];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CCSComplicationController *)self _specifiersFromSettingsManager];
    v6 = *(void **)&self->PSEditableListController_opaque[v3];
    *(void *)&self->PSEditableListController_opaque[v3] = v5;

    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    objc_super v8 = [v7 localizedStringForKey:@"NANO_COMPLICATION_GROUP_NAME" value:&stru_42F8 table:@"CompanionComplicationSettings"];
    [(CCSComplicationController *)self setTitle:v8];

    v4 = *(void **)&self->PSEditableListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CCSComplicationController;
  [(CCSComplicationController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCSComplicationController;
  [(CCSComplicationController *)&v5 viewWillAppear:a3];
  v4 = [(CCSComplicationController *)self table];
  [v4 setEditing:0];
}

- (id)_iconForSpecifier:(id)a3
{
  v4 = [a3 complication];
  appIcons = self->_appIcons;
  v6 = [v4 complicationIdentifier];
  v7 = [(NSMutableDictionary *)appIcons objectForKeyedSubscript:v6];

  return v7;
}

- (void)setActiveState:(id)a3 forSpecifier:(id)a4 save:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a4;
  id v8 = a3;
  v9 = [v15 complication];
  id v10 = [v8 BOOLValue];

  [v9 setActive:v10];
  if (v5)
  {
    [(CCSComplicationController *)self removeSpecifier:v15 animated:1];
    if ([v9 isActive])
    {
      [(CCSComplicationController *)self insertSpecifier:v15 atEndOfGroup:0 animated:1];
    }
    else
    {
      v11 = [(NSMutableArray *)self->_groupSpecifiers objectAtIndexedSubscript:1];
      [(CCSComplicationController *)self insertSpecifier:v15 afterSpecifier:v11 animated:1];
    }
    v12 = [v15 identifier];
    int64_t v13 = [(CCSComplicationController *)self findIndexOfComplicationWithIdentifier:v12];

    if ([v9 isActive]) {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v14 = 0;
    }
    -[NCSSettingsManager moveComplicationDefinitionFromIndex:toIndex:](self->_settingsManager, "moveComplicationDefinitionFromIndex:toIndex:", v13, -[CCSComplicationController findIndexOfNthComplication:withActiveState:](self, "findIndexOfNthComplication:withActiveState:", v14, [v9 isActive]));
  }
}

- (void)setActiveState:(id)a3 forSpecifier:(id)a4
{
  [(CCSComplicationController *)self setActiveState:a3 forSpecifier:a4 save:1];

  [(CCSComplicationController *)self reloadSpecifiers];
}

- (id)activeStateForSpecifier:(id)a3
{
  uint64_t v3 = [a3 complication];
  v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isActive]);

  return v4;
}

- (id)_specifiersFromSettingsManager
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = (NSMutableArray *)objc_opt_new();
  groupSpecifiers = self->_groupSpecifiers;
  self->_groupSpecifiers = v4;

  v6 = &_Block_object_dispose_ptr;
  v7 = +[PSSpecifier groupSpecifierWithID:@"ActiveGroup"];
  [v3 addObject:v7];
  [(NSMutableArray *)self->_groupSpecifiers addObject:v7];
  if ([(NCSSettingsManager *)self->_settingsManager hasSettings])
  {
    id v8 = objc_opt_new();
    v9 = objc_opt_new();
    settingsManager = self->_settingsManager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1C94;
    v26[3] = &unk_4190;
    id v11 = v8;
    id v27 = v11;
    id v12 = v9;
    id v28 = v12;
    [(NCSSettingsManager *)settingsManager enumerateComplicationDefinitionsUsingBlock:v26];
    if (v11) {
      [v11 sortUsingComparator:&stru_41D0];
    }
    if (v12) {
      [v12 sortUsingComparator:&stru_41D0];
    }
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1E48;
    v23 = &unk_4248;
    v24 = self;
    id v13 = v3;
    id v25 = v13;
    uint64_t v14 = objc_retainBlock(&v20);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14, v20, v21, v22, v23, v24);
    if ([v11 count] || objc_msgSend(v12, "count"))
    {
      if ([v12 count])
      {
        id v15 = +[NSBundle bundleForClass:objc_opt_class()];
        v16 = [v15 localizedStringForKey:@"NANO_COMPLICATION_DO_NOT_INCLUDE_HEADER" value:&stru_42F8 table:@"CompanionComplicationSettings"];

        v6 = &_Block_object_dispose_ptr;
      }
      else
      {
        v16 = &stru_42F8;
      }
      v17 = [v6[42] groupSpecifierWithID:@"InactiveGroup" name:v16];
      [v13 addObject:v17];
      [(NSMutableArray *)self->_groupSpecifiers addObject:v17];

      [v12 enumerateObjectsUsingBlock:v14];
      uint64_t v18 = 0;
      goto LABEL_14;
    }
    [v12 enumerateObjectsUsingBlock:v14];
  }
  id v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"NANO_COMPLICATION_NO_COMPLICATIONS" value:&stru_42F8 table:@"CompanionComplicationSettings"];
  [v7 setProperty:v12 forKey:PSFooterTextGroupKey];
  uint64_t v18 = 1;
LABEL_14:

  [(CCSComplicationController *)self setEditingButtonHidden:v18 animated:0];

  return v3;
}

- (int64_t)findIndexOfComplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  settingsManager = self->_settingsManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2328;
  v9[3] = &unk_4270;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NCSSettingsManager *)settingsManager enumerateComplicationDefinitionsUsingBlock:v9];
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int64_t)findIndexOfNthComplication:(int64_t)a3 withActiveState:(BOOL)a4
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  settingsManager = self->_settingsManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24CC;
  v7[3] = &unk_4298;
  BOOL v8 = a4;
  v7[4] = v13;
  v7[5] = &v9;
  v7[6] = &v14;
  v7[7] = a3;
  [(NCSSettingsManager *)settingsManager enumerateComplicationDefinitionsUsingBlock:v7];
  int64_t v5 = v15[3];
  if (!*((unsigned char *)v10 + 24)) {
    v15[3] = --v5;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  return v5;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(CCSComplicationController *)self specifierAtIndexPath:a4];
  int64_t v5 = [v4 complication];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isActive]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = 2;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  int64_t v5 = [v4 localizedStringForKey:@"NANO_COMPLICATION_REMOVE" value:&stru_42F8 table:@"CompanionComplicationSettings"];

  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CCSComplicationController *)self specifierAtIndexPath:v8];
  v13.receiver = self;
  v13.super_class = (Class)CCSComplicationController;
  [(CCSComplicationController *)&v13 tableView:v9 commitEditingStyle:a4 forRowAtIndexPath:v8];

  uint64_t v11 = [v10 complication];
  char v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 isActive] ^ 1);
  [(CCSComplicationController *)self setActiveState:v12 forSpecifier:v10 save:1];

  [(CCSComplicationController *)self reloadSpecifiers];
}

- (NCSSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (NSMutableArray)groupSpecifiers
{
  return self->_groupSpecifiers;
}

- (void)setGroupSpecifiers:(id)a3
{
}

- (NSMutableDictionary)appIcons
{
  return self->_appIcons;
}

- (void)setAppIcons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcons, 0);
  objc_storeStrong((id *)&self->_groupSpecifiers, 0);

  objc_storeStrong((id *)&self->_settingsManager, 0);
}

@end