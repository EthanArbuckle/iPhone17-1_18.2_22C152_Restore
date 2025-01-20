@interface AssistiveTouchCustomizeController
- (ASTCustomizeCell)customizeCell;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_cleanupIconPickerTableView;
- (void)_iconPickerDone:(id)a3;
- (void)_resetCustomization:(id)a3 specifier:(id)a4;
- (void)customCell:(id)a3 wantsAccessibilityHUDShownForItem:(id)a4;
- (void)customCell:(id)a3 wantsPickerDisplayedForIconKey:(id)a4 andLocation:(id)a5 cell:(id)a6;
- (void)dealloc;
- (void)didUpdateCustomizeCellHeight;
- (void)loadView;
- (void)stepperCellCountChanged:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)willResignActive;
@end

@implementation AssistiveTouchCustomizeController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = settingsLocString(@"CUSTOMIZE_TOP_LEVEL_MENU_NAVIGATION_BAR", @"HandSettings");
    [(AssistiveTouchCustomizeController *)self setTitle:v6];

    v7 = settingsLocString(@"CUSTOMIZE_TITLE", @"HandSettings");
    v8 = +[PSSpecifier groupSpecifierWithName:v7];

    [v5 addObject:v8];
    v9 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = PSCellClassKey;
    [v9 setProperty:v10 forKey:PSCellClassKey];
    uint64_t v12 = PSIDKey;
    [v9 setProperty:@"ASTCustomizeCell" forKey:PSIDKey];
    [v5 addObject:v9];
    v13 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v13 setProperty:objc_opt_class() forKey:v11];
    [v13 setProperty:@"ASTStepperCell" forKey:v12];
    [v5 addObject:v13];
    v14 = +[PSSpecifier emptyGroupSpecifier];

    [v5 addObject:v14];
    v15 = settingsLocString(@"RESET_CUSTOMIZE", @"HandSettings");
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v16 setProperty:@"Reset" forKey:v12];
    [v16 setButtonAction:"_resetCustomization:specifier:"];
    v17 = +[NSNumber numberWithInt:2];
    [v16 setProperty:v17 forKey:PSAlignmentKey];

    [v5 addObject:v16];
    v18 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)loadView
{
  +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", AXAssistiveTouchIconTypeTap, AXAssistiveTouchIconTypeTorch, AXAssistiveTouchIconTypeAssistiveTouch, AXAssistiveTouchIconTypeClassicInvert, AXAssistiveTouchIconTypeColorFilters, AXAssistiveTouchIconTypeMagnifier, AXAssistiveTouchIconTypeVoiceOver, AXAssistiveTouchIconTypeSmartInvert, AXAssistiveTouchIconTypeZoom, AXAssistiveTouchIconTypeZoomController, AXAssistiveTouchIconTypeSwitchControl, AXAssistiveTouchIconTypeFullKeyboardAccess, AXAssistiveTouchIconTypeConfirmApplePay, AXAssistiveTouchIconTypeEyeTrackingBubbleMode, AXAssistiveTouchIconTypeEyeTrackingAutoHide, 0);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __45__AssistiveTouchCustomizeController_loadView__block_invoke;
  v5[3] = &unk_20AA98;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v6;
  [(AssistiveTouchCustomizeBaseActionPickerController *)self setIconFilter:v5];
  v4.receiver = self;
  v4.super_class = (Class)AssistiveTouchCustomizeController;
  [(AssistiveTouchCustomizeBaseActionPickerController *)&v4 loadView];
  [*(id *)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] setSeparatorStyle:1];
}

uint64_t __45__AssistiveTouchCustomizeController_loadView__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)_resetCustomization:(id)a3 specifier:(id)a4
{
  objc_super v4 = +[AXSettings sharedInstance];
  [v4 setAssistiveTouchMainScreenCustomization:0];

  v5 = +[AXSettings sharedInstance];
  [v5 setAssistiveTouchOrbAction:0];

  id v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchSingleTapAction:0];

  v7 = +[AXSettings sharedInstance];
  [v7 setAssistiveTouchDoubleTapAction:0];

  id v8 = +[AXSettings sharedInstance];
  [v8 setAssistiveTouchLongPressAction:0];
}

- (void)stepperCellCountChanged:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[AXSettings sharedInstance];
  id v7 = [v4 assistiveTouchMainScreenCustomization];

  [v3 buttonCount];
  v5 = AXAssistiveTouchChangeIconCount();
  id v6 = +[AXSettings sharedInstance];
  [v6 setAssistiveTouchMainScreenCustomization:v5];
}

- (void)dealloc
{
  [(AssistiveTouchCustomizeController *)self _cleanupIconPickerTableView];
  v3.receiver = self;
  v3.super_class = (Class)AssistiveTouchCustomizeController;
  [(AssistiveTouchCustomizeController *)&v3 dealloc];
}

- (void)_cleanupIconPickerTableView
{
  self->_iconPickerTableViewController = 0;
  _objc_release_x1();
}

- (void)willResignActive
{
}

- (void)customCell:(id)a3 wantsPickerDisplayedForIconKey:(id)a4 andLocation:(id)a5 cell:(id)a6
{
  id v26 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(AssistiveTouchCustomizeController *)self _cleanupIconPickerTableView];
  v13 = [[ASTIconPickerTableViewController alloc] initWithStyle:0];
  iconPickerTableViewController = self->_iconPickerTableViewController;
  self->_iconPickerTableViewController = v13;

  [(ASTIconPickerTableViewController *)self->_iconPickerTableViewController setIconPickerDelegate:self];
  [(AssistiveTouchCustomizeBaseActionPickerController *)self setSelectedPopoverIcon:v12];

  [(AssistiveTouchCustomizeBaseActionPickerController *)self setSelectedPopoverLocation:v11];
  if (AXDeviceIsPad())
  {
    v15 = (UIPopoverController *)[objc_alloc((Class)UIPopoverController) initWithContentViewController:self->_iconPickerTableViewController];
    iconPickerPopoverController = self->_iconPickerPopoverController;
    self->_iconPickerPopoverController = v15;

    v17 = self->_iconPickerPopoverController;
    v18 = [v10 borderView];
    v19 = [v10 borderView];
    [v19 bounds];
    objc_msgSend(v18, "convertRect:toView:", v26);
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v17, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v26, 1, 1);

    [(UIPopoverController *)self->_iconPickerPopoverController setDelegate:self];
  }
  else
  {
    id v20 = [objc_alloc((Class)UINavigationController) initWithNavigationBarClass:0 toolbarClass:0];
    [v20 pushViewController:self->_iconPickerTableViewController animated:1];
    v21 = [v20 navigationBar];
    v22 = [v21 topItem];
    [v22 setTitle:0];

    id v23 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_iconPickerDone:"];
    v24 = [v20 navigationBar];
    v25 = [v24 topItem];
    [v25 setRightBarButtonItem:v23];

    [v20 setModalPresentationStyle:0];
    [(AssistiveTouchCustomizeController *)self presentViewController:v20 animated:1 completion:0];
  }
}

- (void)customCell:(id)a3 wantsAccessibilityHUDShownForItem:(id)a4
{
}

- (void)didUpdateCustomizeCellHeight
{
  objc_super v3 = [(AssistiveTouchCustomizeController *)self table];
  [v3 beginUpdates];

  id v4 = [(AssistiveTouchCustomizeController *)self table];
  [v4 endUpdates];
}

- (void)_iconPickerDone:(id)a3
{
  id v4 = [(ASTIconPickerTableViewController *)self->_iconPickerTableViewController parentViewController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __53__AssistiveTouchCustomizeController__iconPickerDone___block_invoke;
  v5[3] = &unk_2087C0;
  void v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

id __53__AssistiveTouchCustomizeController__iconPickerDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupIconPickerTableView];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v12 = 0;
  v11.receiver = self;
  v11.super_class = (Class)AssistiveTouchCustomizeController;
  id v8 = [(AssistiveTouchCustomizeController *)&v11 tableView:v6 cellForRowAtIndexPath:v7];
  v9 = __UIAccessibilitySafeClass();

  if (v12) {
    abort();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v9 setStepperDelegate:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 setDelegate:self];
      objc_storeStrong((id *)&self->_customizeCell, v9);
    }
  }
  [v9 setCellEnabled:1];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AssistiveTouchCustomizeController;
  [(AssistiveTouchCustomizeController *)&v4 tableView:a3 didSelectRowAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  objc_super v4 = [(AssistiveTouchCustomizeController *)self specifierForIndexPath:a4];
  v5 = [v4 propertyForKey:PSIDKey];
  if ([v5 isEqualToString:@"Reset"])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v4 propertyForKey:@"HomeAction"];
    char v6 = v7 != 0;
  }
  return v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AssistiveTouchCustomizeController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:PSIDKey];
  unsigned int v10 = [v9 isEqualToString:@"ASTCustomizeCell"];

  if (v10)
  {
    double v11 = UITableViewAutomaticDimension;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AssistiveTouchCustomizeController;
    [(AssistiveTouchCustomizeController *)&v14 tableView:v6 heightForRowAtIndexPath:v7];
    double v11 = v12;
  }

  return v11;
}

- (ASTCustomizeCell)customizeCell
{
  return self->_customizeCell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconPickerTableViewController, 0);
  objc_storeStrong((id *)&self->_customizeCell, 0);

  objc_storeStrong((id *)&self->_iconPickerPopoverController, 0);
}

@end