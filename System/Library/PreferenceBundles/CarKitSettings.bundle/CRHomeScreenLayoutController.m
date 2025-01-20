@interface CRHomeScreenLayoutController
+ (id)iconSortingComparator;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldAutorotate;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CRHomeScreenLayoutController)init;
- (CRHomeScreenPersistenceManager)persistenceManager;
- (CRPairedVehicleManager)vehicleManager;
- (CRVehicle)vehicle;
- (NSMutableArray)hiddenIcons;
- (NSMutableArray)icons;
- (OS_dispatch_queue)iconQueue;
- (PSSpecifier)disabledGroupSpecifier;
- (PSSpecifier)enabledGroupSpecifier;
- (id)_specifierForIcon:(id)a3;
- (id)iconAtIndexPath:(id)a3;
- (id)indexPathForIcon:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (unint64_t)_indexForInsertingItem:(id)a3 intoArray:(id)a4;
- (void)_fetchIcons;
- (void)_resetVehicleApplications;
- (void)_saveVehicleApplications;
- (void)resetVehicleApplications;
- (void)setDisabledGroupSpecifier:(id)a3;
- (void)setEnabledGroupSpecifier:(id)a3;
- (void)setHiddenIcons:(id)a3;
- (void)setIconQueue:(id)a3;
- (void)setIcons:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setVehicle:(id)a3;
- (void)setVehicleManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CRHomeScreenLayoutController

- (CRHomeScreenLayoutController)init
{
  v13.receiver = self;
  v13.super_class = (Class)CRHomeScreenLayoutController;
  v2 = [(CRHomeScreenLayoutController *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"HOME_SCREEN_RESET" value:&stru_24F60 table:@"Localizable"];
    id v6 = [v3 initWithTitle:v5 style:0 target:v2 action:"resetVehicleApplications"];
    v7 = [(CRHomeScreenLayoutController *)v2 navigationItem];
    [v7 setRightBarButtonItem:v6];

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.CarPlaySettings.icons", v9);
    iconQueue = v2->_iconQueue;
    v2->_iconQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)CRHomeScreenLayoutController;
  [(CRHomeScreenLayoutController *)&v18 viewDidLoad];
  id v3 = self;
  v19 = v3;
  v4 = +[NSArray arrayWithObjects:&v19 count:1];
  id v5 = [(CRHomeScreenLayoutController *)self registerForTraitChanges:v4 withAction:"userInterfaceStyleChanged"];

  id v6 = [(CRHomeScreenLayoutController *)self specifier];
  v7 = [v6 userInfo];
  [(CRHomeScreenLayoutController *)self setVehicle:v7];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"CUSTOMIZE_TITLE" value:&stru_24F60 table:@"Localizable"];
  [(CRHomeScreenLayoutController *)self setTitle:v9];

  id v10 = objc_alloc_init((Class)CRPairedVehicleManager);
  [(CRHomeScreenLayoutController *)self setVehicleManager:v10];
  v11 = [(CRHomeScreenLayoutController *)self vehicle];
  v12 = [v11 identifier];
  objc_super v13 = [v12 UUIDString];

  v14 = [CRHomeScreenPersistenceManager alloc];
  v15 = [(CRHomeScreenLayoutController *)self vehicle];
  v16 = [v15 certificateSerialNumber];
  v17 = [(CRHomeScreenPersistenceManager *)v14 initWithVehicleId:v13 certificateSerial:v16];

  [(CRHomeScreenLayoutController *)self setPersistenceManager:v17];
  [(CRHomeScreenLayoutController *)self _fetchIcons];
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] setEditing:1 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRHomeScreenLayoutController;
  [(CRHomeScreenLayoutController *)&v4 viewDidDisappear:a3];
  [(CRHomeScreenLayoutController *)self _saveVehicleApplications];
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)_fetchIcons
{
  id v3 = [(CRHomeScreenLayoutController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] == (char *)&dword_0 + 1;
  id v5 = [(CRHomeScreenLayoutController *)self persistenceManager];
  [v5 setDrawIconBorders:v4];

  id v6 = [(CRHomeScreenLayoutController *)self persistenceManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9724;
  v7[3] = &unk_249E0;
  v7[4] = self;
  [v6 fetchIconStateWithCompletion:v7];
}

- (void)_saveVehicleApplications
{
  id v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9960;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_resetVehicleApplications
{
  id v3 = [(CRHomeScreenLayoutController *)self navigationItem];
  BOOL v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  id v5 = [(CRHomeScreenLayoutController *)self persistenceManager];
  [v5 resetIconState];

  [(CRHomeScreenLayoutController *)self _fetchIcons];
  id v7 = [(CRHomeScreenLayoutController *)self navigationItem];
  id v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:1];
}

- (void)resetVehicleApplications
{
  id v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  objc_initWeak(&location, self);
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"HOME_SCREEN_RESET_CONFIRM" value:&stru_24F60 table:@"Localizable"];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_9E40;
  objc_super v13 = &unk_24A08;
  objc_copyWeak(&v14, &location);
  id v6 = +[UIAlertAction actionWithTitle:v5 style:2 handler:&v10];
  objc_msgSend(v3, "addAction:", v6, v10, v11, v12, v13);

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"HOME_SCREEN_RESET_CANCEL" value:&stru_24F60 table:@"Localizable"];
  v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
  [v3 addAction:v9];

  [(CRHomeScreenLayoutController *)self presentViewController:v3 animated:1 completion:0];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)_specifierForIcon:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)PSSpecifier);
  id v6 = [v4 displayName];

  id v7 = [v5 initWithName:v6 target:self set:0 get:0 detail:0 cell:3 edit:0];

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSMutableArray array];
    id v6 = [(CRHomeScreenLayoutController *)self enabledGroupSpecifier];

    if (!v6)
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"CUSTOMIZE_ENABLED_APPS_SECTION_TITLE" value:&stru_24F60 table:@"Localizable"];
      v9 = +[PSSpecifier groupSpecifierWithName:v8];
      [(CRHomeScreenLayoutController *)self setEnabledGroupSpecifier:v9];
    }
    id v10 = [(CRHomeScreenLayoutController *)self enabledGroupSpecifier];
    [v5 addObject:v10];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [(CRHomeScreenLayoutController *)self icons];
    id v12 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [(CRHomeScreenLayoutController *)self _specifierForIcon:*(void *)(*((void *)&v34 + 1) + 8 * (void)v15)];
          [v5 addObject:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v13);
    }

    v17 = [(CRHomeScreenLayoutController *)self disabledGroupSpecifier];

    if (!v17)
    {
      objc_super v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"CUSTOMIZE_HIDDEN_APPS_SECTION_TITLE" value:&stru_24F60 table:@"Localizable"];
      v20 = +[PSSpecifier groupSpecifierWithName:v19];
      [(CRHomeScreenLayoutController *)self setDisabledGroupSpecifier:v20];
    }
    v21 = [(CRHomeScreenLayoutController *)self disabledGroupSpecifier];
    [v5 addObject:v21];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v22 = [(CRHomeScreenLayoutController *)self hiddenIcons];
    id v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [(CRHomeScreenLayoutController *)self _specifierForIcon:*(void *)(*((void *)&v30 + 1) + 8 * (void)v26)];
          [v5 addObject:v27];

          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    v28 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRHomeScreenLayoutController;
  id v7 = a4;
  v8 = [(CRHomeScreenLayoutController *)&v20 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = [(CRHomeScreenLayoutController *)self iconAtIndexPath:v7];

  id v10 = [v9 iconImage];

  uint64_t v11 = [v8 imageView];
  id v12 = v11;
  if (v10)
  {
    id v13 = [v9 iconImage];
    [v12 setImage:v13];
  }
  else
  {
    [v11 setImage:0];

    iconQueue = self->_iconQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A43C;
    block[3] = &unk_249B8;
    id v17 = v9;
    objc_super v18 = self;
    id v19 = v6;
    dispatch_async(iconQueue, block);

    id v12 = v17;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 0;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v20 = [(CRHomeScreenLayoutController *)self iconAtIndexPath:v7];
  if (a4 == 2)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_hiddenIcons, "removeObjectAtIndex:", [v7 row]);
    [(NSMutableArray *)self->_icons addObject:v20];
    v8 = [(CRHomeScreenLayoutController *)self disabledGroupSpecifier];
    v9 = (char *)[(CRHomeScreenLayoutController *)self indexOfSpecifier:v8];
    id v10 = [v7 row];

    uint64_t v11 = &v9[(void)v10];
    id v12 = [(CRHomeScreenLayoutController *)self enabledGroupSpecifier];
    id v13 = (char *)[(CRHomeScreenLayoutController *)self indexOfSpecifier:v12];
    uint64_t v14 = &v13[(void)[(NSMutableArray *)self->_icons count]];
  }
  else
  {
    -[NSMutableArray removeObjectAtIndex:](self->_icons, "removeObjectAtIndex:", [v7 row]);
    unint64_t v15 = [(CRHomeScreenLayoutController *)self _indexForInsertingItem:v20 intoArray:self->_hiddenIcons];
    [(NSMutableArray *)self->_hiddenIcons insertObject:v20 atIndex:v15];
    v16 = [(CRHomeScreenLayoutController *)self enabledGroupSpecifier];
    id v17 = (char *)[(CRHomeScreenLayoutController *)self indexOfSpecifier:v16];
    id v18 = [v7 row];

    uint64_t v11 = &v17[(void)v18];
    id v12 = [(CRHomeScreenLayoutController *)self disabledGroupSpecifier];
    uint64_t v14 = (char *)[(CRHomeScreenLayoutController *)self indexOfSpecifier:v12] + v15;
  }

  [(CRHomeScreenLayoutController *)self beginUpdates];
  [(CRHomeScreenLayoutController *)self removeSpecifierAtIndex:v11 + 1 animated:1];
  id v19 = [(CRHomeScreenLayoutController *)self _specifierForIcon:v20];
  [(CRHomeScreenLayoutController *)self insertSpecifier:v19 atIndex:v14 animated:1];

  [(CRHomeScreenLayoutController *)self endUpdates];
  [(CRHomeScreenLayoutController *)self _saveVehicleApplications];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CRHomeScreenLayoutController *)self iconAtIndexPath:v5];
  if ([v6 isEditable])
  {
    if ([v5 section]) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"CUSTOMIZE_APP_REMOVE" value:&stru_24F60 table:@"Localizable"];

  return v5;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [(CRHomeScreenLayoutController *)self iconAtIndexPath:v7];
  id v10 = v8;
  uint64_t v11 = v10;
  if ([v10 section] == (char *)&dword_0 + 1)
  {
    if ([v9 isEditable])
    {
      id v12 = +[NSIndexPath indexPathForRow:[(CRHomeScreenLayoutController *)self _indexForInsertingItem:v9 intoArray:self->_hiddenIcons] inSection:1];
    }
    else
    {
      id v12 = v7;
    }
    uint64_t v11 = v12;
  }

  return v11;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = [(CRHomeScreenLayoutController *)self iconAtIndexPath:v7];
  if ([v7 section]) {
    v9 = &OBJC_IVAR___CRHomeScreenLayoutController__hiddenIcons;
  }
  else {
    v9 = &OBJC_IVAR___CRHomeScreenLayoutController__icons;
  }
  id v10 = *(void **)&self->PSListController_opaque[*v9];
  id v11 = [v7 row];

  [v10 removeObjectAtIndex:v11];
  if ([v13 section]) {
    id v12 = &OBJC_IVAR___CRHomeScreenLayoutController__hiddenIcons;
  }
  else {
    id v12 = &OBJC_IVAR___CRHomeScreenLayoutController__icons;
  }
  objc_msgSend(*(id *)&self->PSListController_opaque[*v12], "insertObject:atIndex:", v8, objc_msgSend(v13, "row"));
  [(CRHomeScreenLayoutController *)self reloadSpecifiers];
  [(CRHomeScreenLayoutController *)self _saveVehicleApplications];
}

+ (id)iconSortingComparator
{
  return &stru_24A48;
}

- (unint64_t)_indexForInsertingItem:(id)a3 intoArray:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 count];
  id v8 = [(id)objc_opt_class() iconSortingComparator];
  id v9 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, v7, 1024, v8);

  return (unint64_t)v9;
}

- (id)iconAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 section];
  if (!v5)
  {
    id v6 = &OBJC_IVAR___CRHomeScreenLayoutController__icons;
    goto LABEL_5;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = &OBJC_IVAR___CRHomeScreenLayoutController__hiddenIcons;
LABEL_5:
    id v7 = objc_msgSend(*(id *)&self->PSListController_opaque[*v6], "objectAtIndex:", objc_msgSend(v4, "row"));
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)indexPathForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_icons indexOfObject:v4];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(NSMutableArray *)self->_hiddenIcons indexOfObject:v4];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    id v8 = v6;
    uint64_t v9 = 1;
  }
  else
  {
    id v8 = v5;
    uint64_t v9 = 0;
  }
  id v7 = +[NSIndexPath indexPathForRow:v8 inSection:v9];
LABEL_7:

  return v7;
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
}

- (CRHomeScreenPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (PSSpecifier)enabledGroupSpecifier
{
  return self->_enabledGroupSpecifier;
}

- (void)setEnabledGroupSpecifier:(id)a3
{
}

- (PSSpecifier)disabledGroupSpecifier
{
  return self->_disabledGroupSpecifier;
}

- (void)setDisabledGroupSpecifier:(id)a3
{
}

- (NSMutableArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
}

- (NSMutableArray)hiddenIcons
{
  return self->_hiddenIcons;
}

- (void)setHiddenIcons:(id)a3
{
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
}

- (OS_dispatch_queue)iconQueue
{
  return self->_iconQueue;
}

- (void)setIconQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconQueue, 0);
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_hiddenIcons, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_disabledGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_enabledGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);

  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end