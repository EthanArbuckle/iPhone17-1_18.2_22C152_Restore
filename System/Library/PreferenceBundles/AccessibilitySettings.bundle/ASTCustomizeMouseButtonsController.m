@interface ASTCustomizeMouseButtonsController
- (ASTCustomizeMouseButtonsController)init;
- (ASTMotionTrackingSettingsHelper)motionTrackingSettingsHelper;
- (AXCustomizableMouse)customizableMouse;
- (AXMouseEventListener)mouseEventListener;
- (AXSSMotionTrackingHIDInput)eyeTracker;
- (BOOL)_shouldAllowEditing;
- (BOOL)_shouldAllowEditingForRowAtIndexPath:(id)a3;
- (BOOL)shouldShowCustomActionsRequireASTAlert;
- (BOOL)showingAutoHideSettings;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)_buttonAction:(id)a3;
- (id)_specIdentifierForButtonNumber:(int64_t)a3;
- (id)_updatedMouseForExistingMouse:(id)a3;
- (id)getCurrentActionForHomeActionListController:(id)a3;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addMouseButton:(id)a3 specifier:(id)a4;
- (void)_settingsUpdated;
- (void)_stopFiltering:(id)a3;
- (void)_updateMouse;
- (void)_updateSpecifiersForAutoHideSettingsChange;
- (void)homeActionListController:(id)a3 selectedAction:(id)a4;
- (void)mouseEventListener:(id)a3 customizableMouse:(id)a4 interceptedMouseButton:(int64_t)a5;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEyeTracker:(id)a3;
- (void)setMotionTrackingSettingsHelper:(id)a3;
- (void)setShouldShowCustomActionsRequireASTAlert:(BOOL)a3;
- (void)setShowingAutoHideSettings:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation ASTCustomizeMouseButtonsController

- (ASTCustomizeMouseButtonsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)ASTCustomizeMouseButtonsController;
  v2 = [(ASTCustomizeMouseButtonsController *)&v12 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[AXSettings sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __42__ASTCustomizeMouseButtonsController_init__block_invoke;
    v9[3] = &unk_208798;
    objc_copyWeak(&v10, &location);
    [v3 registerUpdateBlock:v9 forRetrieveSelector:"assistiveTouchMouseCustomizedClickActions" withListener:v2];

    objc_destroyWeak(&v10);
    v4 = +[AXSettings sharedInstance];
    v2->_showingAutoHideSettings = [v4 assistiveTouchEyeTrackingAutoHideEnabled];

    v5 = +[AXSettings sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __42__ASTCustomizeMouseButtonsController_init__block_invoke_2;
    v7[3] = &unk_208798;
    objc_copyWeak(&v8, &location);
    [v5 registerUpdateBlock:v7 forRetrieveSelector:"assistiveTouchEyeTrackingAutoHideEnabled" withListener:v2];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __42__ASTCustomizeMouseButtonsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _settingsUpdated];
}

void __42__ASTCustomizeMouseButtonsController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSpecifiersForAutoHideSettingsChange];
}

- (BOOL)_shouldAllowEditing
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = +[AXSettings sharedInstance];
  v3 = [v2 assistiveTouchMouseCustomizedClickActions];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__ASTCustomizeMouseButtonsController__shouldAllowEditing__block_invoke;
  v5[3] = &unk_2099F0;
  v5[4] = &v6;
  [v3 enumerateObjectsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

id __57__ASTCustomizeMouseButtonsController__shouldAllowEditing__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = [a2 hasCustomActions];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)_shouldAllowEditingForRowAtIndexPath:(id)a3
{
  v3 = [(ASTCustomizeMouseButtonsController *)self specifierForIndexPath:a3];
  v4 = [v3 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASTCustomizeMouseButtonsController;
  [(ASTCustomizeMouseButtonsController *)&v6 viewWillAppear:a3];
  if ([(ASTCustomizeMouseButtonsController *)self _shouldAllowEditing])
  {
    v4 = [(ASTCustomizeMouseButtonsController *)self editButtonItem];
    BOOL v5 = [(ASTCustomizeMouseButtonsController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ASTCustomizeMouseButtonsController;
  [(ASTCustomizeMouseButtonsController *)&v13 viewDidAppear:a3];
  if ([(ASTCustomizeMouseButtonsController *)self shouldShowCustomActionsRequireASTAlert])
  {
    [(ASTCustomizeMouseButtonsController *)self setShouldShowCustomActionsRequireASTAlert:0];
    v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 laserEnabled];

    if (v5)
    {
      objc_super v6 = settingsLocString(@"ASTRequiredForCustomActionsAlertTitle", @"Accessibility-hello");
      v7 = settingsLocString(@"ASTRequiredForCustomActionsAlertMessage", @"Accessibility-hello");
      uint64_t v8 = +[UIAlertController alertControllerWithTitle:v6 message:v7 preferredStyle:1];

      char v9 = settingsLocString(@"ASTRequiredForCustomActionsAlertCancel", @"Accessibility-hello");
      id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:&__block_literal_global_15];

      [v8 addAction:v10];
      v11 = settingsLocString(@"ASTRequiredForCustomActionsAlertConfirm", @"Accessibility-hello");
      objc_super v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:&__block_literal_global_300];

      [v8 addAction:v12];
      [(ASTCustomizeMouseButtonsController *)self presentViewController:v8 animated:1 completion:0];
    }
  }
}

void __52__ASTCustomizeMouseButtonsController_viewDidAppear___block_invoke_2(id a1, UIAlertAction *a2)
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASTCustomizeMouseButtonsController;
  [(ASTCustomizeMouseButtonsController *)&v4 viewWillDisappear:a3];
  [(ASTCustomizeMouseButtonsController *)self _stopFiltering:0];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)ASTCustomizeMouseButtonsController;
  [(ASTCustomizeMouseButtonsController *)&v3 willResignActive];
  [(ASTCustomizeMouseButtonsController *)self _stopFiltering:0];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASTCustomizeMouseButtonsController;
  -[ASTCustomizeMouseButtonsController setEditing:animated:](&v9, "setEditing:animated:");
  [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table] setEditing:v5 animated:v4];
  v7 = [(ASTCustomizeMouseButtonsController *)self specifierForID:@"AX_ADD_BUTTON_IDENTIFIER"];
  uint64_t v8 = +[NSNumber numberWithInt:v5 ^ 1];
  [v7 setProperty:v8 forKey:PSEnabledKey];

  [(ASTCustomizeMouseButtonsController *)self reloadSpecifier:v7 animated:1];
}

- (id)specifiers
{
  if (!self->_customizableMouse)
  {
    objc_super v3 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
    BOOL v4 = [v3 objectForKey:@"AX_CUSTOMIZABLE_MOUSE_KEY"];

    uint64_t v5 = [(ASTCustomizeMouseButtonsController *)self _updatedMouseForExistingMouse:v4];
    objc_super v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = v4;
    }
    uint64_t v8 = v7;
    customizableMouse = self->_customizableMouse;
    self->_customizableMouse = v8;
  }
  if (!self->_mouseEventListener)
  {
    id v10 = +[AXMouseEventListener sharedInstance];
    mouseEventListener = self->_mouseEventListener;
    self->_mouseEventListener = v10;

    [(AXMouseEventListener *)self->_mouseEventListener addObserver:self];
  }
  uint64_t v12 = OBJC_IVAR___PSViewController__specifier;
  objc_super v13 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSViewController__specifier] userInfo];
  v14 = [v13 objectForKey:@"AX_CUSTOMIZABLE_MOUSE_BEHAVES_LIKE_EYETRACKER"];
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    v16 = [*(id *)&self->AXUISettingsBaseListController_opaque[v12] userInfo];
    v17 = [v16 objectForKey:@"AX_CUSTOMIZABLE_MOUSE_ASSOCIATED_EYETRACKER"];

    if (v17) {
      [(ASTCustomizeMouseButtonsController *)self setEyeTracker:v17];
    }
  }
  uint64_t v18 = OBJC_IVAR___PSListController__specifiers;
  v19 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v19)
  {
    v53 = +[NSMutableArray array];
    v20 = [*(id *)&self->AXUISettingsBaseListController_opaque[v12] userInfo];
    v21 = [v20 objectForKey:@"AX_CUSTOMIZABLE_MOUSE_IS_CONNECTED_KEY"];
    unsigned int v22 = [v21 BOOLValue];

    if (v22)
    {
      v23 = settingsLocString(@"AddNewButtonToCustomize", @"HandSettings");
      v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v24 setButtonAction:"_addMouseButton:specifier:"];
      [v24 setIdentifier:@"AX_ADD_BUTTON_IDENTIFIER"];
      [v53 addObject:v24];
    }
    v25 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
    v26 = +[AXSettings sharedInstance];
    unsigned int v27 = [v26 laserEnabled];

    if (v27)
    {
      v28 = settingsLocString(@"CustomizeButtonsFooterText", @"Accessibility-hello");
      [v25 setProperty:v28 forKey:PSFooterTextGroupKey];
    }
    [v53 addObject:v25];
    v29 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
    unsigned int v30 = [v29 hasCustomActions];

    if (v30)
    {
      v51 = v25;
      uint64_t v52 = v18;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v31 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
      v32 = [v31 buttonsWithCustomActions];

      id v33 = [v32 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v55;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v55 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v38 = settingsLocString(@"CustomButtonName", @"HandSettings");
            v39 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, [v37 integerValue]);

            v40 = +[PSSpecifier preferenceSpecifierNamed:v39 target:self set:0 get:"_buttonAction:" detail:objc_opt_class() cell:2 edit:0];
            v41 = -[ASTCustomizeMouseButtonsController _specIdentifierForButtonNumber:](self, "_specIdentifierForButtonNumber:", [v37 integerValue]);
            [v40 setIdentifier:v41];

            [v40 setProperty:&off_229438 forKey:@"HomeAction"];
            [v40 setProperty:v37 forKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
            [v53 addObject:v40];
          }
          id v34 = [v32 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }
        while (v34);
      }

      v25 = v51;
      uint64_t v18 = v52;
    }
    v42 = [(ASTCustomizeMouseButtonsController *)self eyeTracker];

    if (v42)
    {
      v43 = [(ASTCustomizeMouseButtonsController *)self motionTrackingSettingsHelper];

      if (!v43)
      {
        v44 = [ASTMotionTrackingSettingsHelper alloc];
        v45 = [(ASTCustomizeMouseButtonsController *)self eyeTracker];
        v46 = [(ASTMotionTrackingSettingsHelper *)v44 initWithEyeTracker:v45];
        [(ASTCustomizeMouseButtonsController *)self setMotionTrackingSettingsHelper:v46];
      }
      v47 = [(ASTCustomizeMouseButtonsController *)self motionTrackingSettingsHelper];
      v48 = [v47 specifiers];
      [v53 axSafelyAddObjectsFromArray:v48];
    }
    v49 = *(void **)&self->AXUISettingsBaseListController_opaque[v18];
    *(void *)&self->AXUISettingsBaseListController_opaque[v18] = v53;

    v19 = *(void **)&self->AXUISettingsBaseListController_opaque[v18];
  }

  return v19;
}

- (id)selectSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASTCustomizeMouseButtonsController;
  BOOL v4 = [(ASTCustomizeMouseButtonsController *)&v6 selectSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }

  return v4;
}

- (id)_buttonAction:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
  uint64_t v5 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
  objc_super v6 = objc_msgSend(v5, "customActionForButtonNumber:", objc_msgSend(v4, "integerValue"));

  if (v6)
  {
    v7 = AXUIAssistiveTouchStringForName();
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  }
  else
  {
    uint64_t v8 = AXParameterizedLocalizedString();
  }

  return v8;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(ASTCustomizeMouseButtonsController *)self specifierForIndexPath:a4];
  uint64_t v5 = [v4 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v10 = [(ASTCustomizeMouseButtonsController *)self specifierForIndexPath:a5];
    v7 = [v10 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
    uint64_t v8 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
    objc_msgSend(v8, "setCustomAction:forButtonNumber:", 0, objc_msgSend(v7, "integerValue"));

    [(ASTCustomizeMouseButtonsController *)self _updateMouse];
    [(ASTCustomizeMouseButtonsController *)self removeSpecifier:v10 animated:1];
    if (![(ASTCustomizeMouseButtonsController *)self _shouldAllowEditing])
    {
      objc_super v9 = [(ASTCustomizeMouseButtonsController *)self navigationItem];
      [v9 setRightBarButtonItem:0];

      [(ASTCustomizeMouseButtonsController *)self setEditing:0 animated:1];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(ASTCustomizeMouseButtonsController *)self _shouldAllowEditingForRowAtIndexPath:a4];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(ASTCustomizeMouseButtonsController *)self _shouldAllowEditingForRowAtIndexPath:a4];
}

- (id)_specIdentifierForButtonNumber:(int64_t)a3
{
  BOOL v4 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
  uint64_t v5 = [v4 identifier];
  int64_t v6 = +[NSString stringWithFormat:@"%@-%li", v5, a3];

  return v6;
}

- (void)_addMouseButton:(id)a3 specifier:(id)a4
{
  uint64_t v5 = settingsLocString(@"AddNewButtonToCustomizeAlertTitle", @"HandSettings");
  int64_t v6 = settingsLocString(@"AddNewButtonToCustomizeAlertInstructions", @"HandSettings");
  v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  uint64_t v8 = settingsLocString(@"CANCEL", @"Accessibility");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __64__ASTCustomizeMouseButtonsController__addMouseButton_specifier___block_invoke;
  v11[3] = &unk_208B68;
  v11[4] = self;
  objc_super v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v11];

  [v7 addAction:v9];
  id v10 = [(ASTCustomizeMouseButtonsController *)self mouseEventListener];
  [v10 beginFilteringButtonEvents];

  [(ASTCustomizeMouseButtonsController *)self presentViewController:v7 animated:1 completion:0];
}

void __64__ASTCustomizeMouseButtonsController__addMouseButton_specifier___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mouseEventListener];
  [v1 endFilteringButtonEvents];
}

- (void)_stopFiltering:(id)a3
{
  v7 = (void (**)(void))a3;
  BOOL v4 = [(ASTCustomizeMouseButtonsController *)self mouseEventListener];
  [v4 endFilteringButtonEvents];

  uint64_t v5 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];

  if (v5)
  {
    int64_t v6 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:v7];
  }
  else if (v7)
  {
    v7[2]();
  }
}

- (void)_settingsUpdated
{
  objc_super v3 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
  id obj = [(ASTCustomizeMouseButtonsController *)self _updatedMouseForExistingMouse:v3];

  if (obj) {
    objc_storeStrong((id *)&self->_customizableMouse, obj);
  }
  [(ASTCustomizeMouseButtonsController *)self reloadSpecifiers];
}

- (id)_updatedMouseForExistingMouse:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  BOOL v4 = +[AXSettings sharedInstance];
  uint64_t v5 = [v4 assistiveTouchMouseCustomizedClickActions];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  objc_super v13 = __68__ASTCustomizeMouseButtonsController__updatedMouseForExistingMouse___block_invoke;
  v14 = &unk_209A58;
  id v6 = v3;
  id v15 = v6;
  v16 = &v17;
  [v5 enumerateObjectsUsingBlock:&v11];

  v7 = (void *)v18[5];
  if (!v7)
  {
    id v8 = objc_msgSend(&__NSDictionary0__struct, "mutableCopy", v11, v12, v13, v14);
    [v6 setButtonMap:v8];

    v7 = v6;
  }
  id v9 = v7;

  _Block_object_dispose(&v17, 8);

  return v9;
}

void __68__ASTCustomizeMouseButtonsController__updatedMouseForExistingMouse___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEqualToMouse:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_updateMouse
{
  id v4 = +[AXSettings sharedInstance];
  id v3 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
  [v4 updateCustomizableMouse:v3];
}

- (void)_updateSpecifiersForAutoHideSettingsChange
{
  id v3 = +[AXSettings sharedInstance];
  if ([v3 assistiveTouchEyeTrackingAutoHideEnabled])
  {
    unsigned __int8 v4 = [(ASTCustomizeMouseButtonsController *)self showingAutoHideSettings];

    if ((v4 & 1) == 0)
    {
      uint64_t v5 = [(ASTCustomizeMouseButtonsController *)self motionTrackingSettingsHelper];
      id v6 = [v5 autoHideTimeoutAndSliderContiguousSpecs];
      [(ASTCustomizeMouseButtonsController *)self insertContiguousSpecifiers:v6 afterSpecifierID:@"AutoHideSwitchSpecifierKey" animated:1];

      id v7 = self;
      uint64_t v8 = 1;
LABEL_11:
      [(ASTCustomizeMouseButtonsController *)v7 setShowingAutoHideSettings:v8];
      return;
    }
  }
  else
  {
  }
  id v12 = +[AXSettings sharedInstance];
  if (([v12 assistiveTouchEyeTrackingAutoHideEnabled] & 1) == 0)
  {
    unsigned int v9 = [(ASTCustomizeMouseButtonsController *)self showingAutoHideSettings];

    if (!v9) {
      return;
    }
    id v10 = [(ASTCustomizeMouseButtonsController *)self motionTrackingSettingsHelper];
    v11 = [v10 autoHideTimeoutAndSliderContiguousSpecs];
    [(ASTCustomizeMouseButtonsController *)self removeContiguousSpecifiers:v11 animated:1];

    id v7 = self;
    uint64_t v8 = 0;
    goto LABEL_11;
  }
}

- (void)mouseEventListener:(id)a3 customizableMouse:(id)a4 interceptedMouseButton:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
  unsigned int v11 = [v10 isEqualToMouse:v9];

  if (v11)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    id v12 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];
      id v15 = [v14 actions];
      v16 = (char *)[v15 count];

      if (v16 == (unsigned char *)&dword_0 + 1)
      {
        uint64_t v17 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];
        uint64_t v18 = [v17 view];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke;
        v21[3] = &unk_209A80;
        v21[4] = v22;
        [v18 _enumerateDescendentViews:v21];
      }
      else
      {
        uint64_t v17 = AXLogSettings();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          uint64_t v19 = [(ASTCustomizeMouseButtonsController *)self presentedViewController];
          -[ASTCustomizeMouseButtonsController mouseEventListener:customizableMouse:interceptedMouseButton:](v19, buf, v17);
        }
      }
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke_2;
    v20[3] = &unk_209AA8;
    v20[4] = self;
    v20[5] = v22;
    v20[6] = a5;
    [(ASTCustomizeMouseButtonsController *)self _stopFiltering:v20];
    _Block_object_dispose(v22, 8);
  }
}

void __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 safeBoolForKey:@"isHighlighted"];
    *a3 = 1;
  }
}

void __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = [*(id *)(a1 + 32) customizableMouse];
    id v3 = [v2 customActionForButtonNumber:*(void *)(a1 + 48)];

    if (!v3)
    {
      unsigned __int8 v4 = [*(id *)(a1 + 32) customizableMouse];
      [v4 setDefaultActionForButtonNumber:*(void *)(a1 + 48)];
    }
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke_3;
    v6[3] = &unk_208ED8;
    uint64_t v5 = *(void *)(a1 + 48);
    v6[4] = *(void *)(a1 + 32);
    v6[5] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

void __98__ASTCustomizeMouseButtonsController_mouseEventListener_customizableMouse_interceptedMouseButton___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMouse];
  id v4 = [*(id *)(a1 + 32) _specIdentifierForButtonNumber:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(a1 + 32), "specifierForID:");
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) selectSpecifier:v2];
    if (v3) {
      [*(id *)(a1 + 32) showController:v3 animate:1];
    }
  }
}

- (id)getCurrentActionForHomeActionListController:(id)a3
{
  id v4 = a3;
  if ([v4 homeActionType] == (char *)&dword_4 + 1)
  {
    uint64_t v5 = [v4 specifier];
    id v6 = [v5 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
    id v7 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
    id v8 = objc_msgSend(v7, "customActionForButtonNumber:", objc_msgSend(v6, "integerValue"));
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)homeActionListController:(id)a3 selectedAction:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if ([v16 homeActionType] == (char *)&dword_4 + 1)
  {
    id v7 = [v16 specifier];
    id v8 = [v7 propertyForKey:@"AX_MOUSE_BUTTON_NUMBER_KEY"];
    id v9 = [v8 integerValue];

    id v10 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
    unsigned int v11 = [v10 customActionForButtonNumber:v9];
    unsigned __int8 v12 = [v11 isEqualToString:v6];

    if ((v12 & 1) == 0)
    {
      objc_super v13 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
      [v13 setCustomAction:v6 forButtonNumber:v9];

      [(ASTCustomizeMouseButtonsController *)self _updateMouse];
      v14 = [(ASTCustomizeMouseButtonsController *)self customizableMouse];
      if ([v14 customActionsRequireAssistiveTouch]) {
        BOOL v15 = _AXSAssistiveTouchEnabled() == 0;
      }
      else {
        BOOL v15 = 0;
      }
      [(ASTCustomizeMouseButtonsController *)self setShouldShowCustomActionsRequireASTAlert:v15];
    }
  }
}

- (AXMouseEventListener)mouseEventListener
{
  return self->_mouseEventListener;
}

- (AXCustomizableMouse)customizableMouse
{
  return self->_customizableMouse;
}

- (BOOL)shouldShowCustomActionsRequireASTAlert
{
  return self->_shouldShowCustomActionsRequireASTAlert;
}

- (void)setShouldShowCustomActionsRequireASTAlert:(BOOL)a3
{
  self->_shouldShowCustomActionsRequireASTAlert = a3;
}

- (ASTMotionTrackingSettingsHelper)motionTrackingSettingsHelper
{
  return self->_motionTrackingSettingsHelper;
}

- (void)setMotionTrackingSettingsHelper:(id)a3
{
}

- (BOOL)showingAutoHideSettings
{
  return self->_showingAutoHideSettings;
}

- (void)setShowingAutoHideSettings:(BOOL)a3
{
  self->_showingAutoHideSettings = a3;
}

- (AXSSMotionTrackingHIDInput)eyeTracker
{
  return self->_eyeTracker;
}

- (void)setEyeTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeTracker, 0);
  objc_storeStrong((id *)&self->_motionTrackingSettingsHelper, 0);
  objc_storeStrong((id *)&self->_customizableMouse, 0);

  objc_storeStrong((id *)&self->_mouseEventListener, 0);
}

- (void)mouseEventListener:(void *)a1 customizableMouse:(uint8_t *)buf interceptedMouseButton:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "Unexpected alert shown in customize mouse buttons controller: %@", buf, 0xCu);
}

@end