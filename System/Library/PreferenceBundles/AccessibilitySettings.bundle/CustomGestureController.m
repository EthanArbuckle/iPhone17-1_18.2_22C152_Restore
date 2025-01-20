@interface CustomGestureController
- (BOOL)_shouldDisableCreateNewGestureButton;
- (BOOL)gestureRecorder:(id)a3 canSaveGestureWithName:(id)a4;
- (BOOL)shouldRecordRealTimeGesture;
- (NSArray)customGestureSpecifiers;
- (NSString)customGesturesExplanatoryText;
- (NSString)customGesturesTitle;
- (id)nameForItem:(id)a3;
- (id)setName:(id)a3 forItem:(id)a4;
- (id)specifierForKey:(id)a3 withSpecifiers:(id)a4;
- (id)specifiers;
- (unint64_t)maximumNumberOfCustomGestures;
- (void)_createCustomGesture;
- (void)_disableCreateNewGestureButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_hideSpecifiersDuringEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)gestureRecorder:(id)a3 saveGestureWithPropertyListRepresentation:(id)a4;
- (void)gestureRecorder:(id)a3 saveNamedReplayableGesture:(id)a4;
- (void)handleExternalSettingsChange;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive;
@end

@implementation CustomGestureController

- (id)nameForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 name];
  unsigned int v5 = [v3 hasLocalizableName];

  if (v5)
  {
    if (ASTBundle_onceToken != -1) {
      dispatch_once(&ASTBundle_onceToken, &__block_literal_global_402);
    }
    uint64_t v6 = [(id)ASTBundle__astBundle localizedStringForKey:v4 value:&stru_20F6B8 table:@"LocalizedStrings"];

    v4 = (void *)v6;
  }

  return v4;
}

- (id)setName:(id)a3 forItem:(id)a4
{
  id v5 = a4;
  [v5 setName:a3];
  [v5 setHasLocalizableName:0];

  return v5;
}

- (void)handleExternalSettingsChange
{
  if (([(CustomGestureController *)self isEditing] & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)CustomGestureController;
    [(AXNamedItemsListController *)&v3 handleExternalSettingsChange];
    [(CustomGestureController *)self _disableCreateNewGestureButton:[(CustomGestureController *)self _shouldDisableCreateNewGestureButton] animated:1];
  }
}

- (NSArray)customGestureSpecifiers
{
  objc_super v3 = +[NSMutableArray array];
  v4 = [(CustomGestureController *)self customGesturesTitle];
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  uint64_t v6 = PSKeyNameKey;
  [v5 setProperty:@"CustomGestureHeading" forKey:PSKeyNameKey];
  v7 = [(CustomGestureController *)self customGesturesExplanatoryText];

  if (v7)
  {
    v8 = [(CustomGestureController *)self customGesturesExplanatoryText];
    [v5 setProperty:v8 forKey:PSFooterTextGroupKey];
  }
  [v3 addObject:v5];
  v9 = [(AXNamedItemsListController *)self namedItemSpecifiers];
  [v3 addObjectsFromArray:v9];

  unsigned int v10 = [(CustomGestureController *)self _shouldDisableCreateNewGestureButton];
  v11 = settingsLocString(@"CreateCustomGesture", @"HandSettings");
  if (v10) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 1;
  }
  if (v10) {
    v13 = &kCFBooleanFalse;
  }
  else {
    v13 = &kCFBooleanTrue;
  }
  v14 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:v12 edit:0];

  [v14 setProperty:@"CreateCustomGesture" forKey:v6];
  [v14 setProperty:*v13 forKey:PSEnabledKey];
  [v14 setButtonAction:"_createCustomGesture"];
  CFStringRef v17 = @"path";
  CFStringRef v18 = @"CreateCustomGesture";
  v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v14 setProperty:v15 forKey:@"URLDictionary"];

  [v3 addObject:v14];

  return (NSArray *)v3;
}

- (id)specifierForKey:(id)a3 withSpecifiers:(id)a4
{
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    uint64_t v10 = PSKeyNameKey;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "propertyForKey:", v10, (void)v17);
        unsigned __int8 v14 = [v13 isEqualToString:v5];

        if (v14)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_shouldDisableCreateNewGestureButton
{
  if ([(CustomGestureController *)self maximumNumberOfCustomGestures])
  {
    objc_super v3 = [(CustomGestureController *)self _customGestures];
    id v4 = [v3 count];
    if (v4 >= (id)[(CustomGestureController *)self maximumNumberOfCustomGestures]) {
      unsigned __int8 v5 = 1;
    }
    else {
      unsigned __int8 v5 = [(CustomGestureController *)self isEditing];
    }

    return v5;
  }
  else
  {
    return [(CustomGestureController *)self isEditing];
  }
}

- (void)_disableCreateNewGestureButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(CustomGestureController *)self specifiers];
  id v12 = [(CustomGestureController *)self specifierForKey:@"CreateCustomGesture" withSpecifiers:v6];

  id v7 = [v12 propertyForKey:PSTableCellKey];
  BOOL v8 = !v4;
  BOOL v9 = !v4;
  if (v4) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = &kCFBooleanFalse;
  if (v9) {
    v11 = &kCFBooleanTrue;
  }
  [v12 setProperty:*v11 forKey:PSEnabledKey];
  [v7 setCellEnabled:v8];
  [v7 setAccessoryType:v8];
  [v12 setCellType:v10];
}

- (void)_hideSpecifiersDuringEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!self->_hiddenSpecifiers)
  {
    BOOL v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    hiddenSpecifiers = self->_hiddenSpecifiers;
    self->_hiddenSpecifiers = v9;

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    id v11 = [(NSMutableArray *)self->_hiddenSpecifiers copy];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    unsigned __int8 v14 = __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke_3;
    id v15 = &unk_2094C8;
    v16 = self;
    id v17 = v11;
    BOOL v18 = v4;
    id v8 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v12);
    [(NSMutableArray *)self->_hiddenSpecifiers removeAllObjects];
    [(CustomGestureController *)self _disableCreateNewGestureButton:[(CustomGestureController *)self _shouldDisableCreateNewGestureButton] animated:v4];

    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  [(CustomGestureController *)self _disableCreateNewGestureButton:[(CustomGestureController *)self _shouldDisableCreateNewGestureButton] animated:v4];
  id v7 = [(CustomGestureController *)self specifiers];
  id v8 = +[NSMutableArray arrayWithArray:v7];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke;
  v21[3] = &unk_209F10;
  v21[4] = self;
  [v8 enumerateObjectsUsingBlock:v21];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke_2;
  block[3] = &unk_2088F8;
  block[4] = self;
  BOOL v20 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_6:
}

void __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_super v3 = [v5 propertyForKey:PSKeyNameKey];
  unsigned __int8 v4 = [*(id *)(a1 + 32) _isGestureNameSpecifier:v5];
  if (([v3 isEqualToString:@"CustomGestureHeading"] & 1) == 0
    && (v4 & 1) == 0
    && ([v3 isEqualToString:@"CreateCustomGesture"] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 216) addObject:v5];
  }
}

id __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeContiguousSpecifiers:*(void *)(*(void *)(a1 + 32) + 216) animated:*(unsigned __int8 *)(a1 + 40)];
}

void __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specifiers];
  unsigned __int8 v3 = objc_msgSend(v2, "ax_containsObjectUsingBlock:", &__block_literal_global_22);

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
    [v4 insertContiguousSpecifiers:v5 atIndex:0 animated:v6];
  }
}

BOOL __65__CustomGestureController__hideSpecifiersDuringEditing_animated___block_invoke_4(id a1, PSSpecifier *a2)
{
  v2 = [(PSSpecifier *)a2 propertyForKey:PSKeyNameKey];
  unsigned __int8 v3 = [v2 isEqualToString:@"CustomGestureHeading"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  unsigned __int8 v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CustomGestureController *)self customGestureSpecifiers];
    uint64_t v6 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->super.AXUISettingsBaseListController_opaque[v3] = v5;

    unsigned __int8 v4 = *(void **)&self->super.AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)_createCustomGesture
{
  if (!self->_gestureRecorderMainViewController)
  {
    id v3 = objc_alloc((Class)AXGestureRecorderMainViewController);
    if ([(CustomGestureController *)self shouldRecordRealTimeGesture]) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = (AXGestureRecorderMainViewController *)[v3 initWithType:v4];
    gestureRecorderMainViewController = self->_gestureRecorderMainViewController;
    self->_gestureRecorderMainViewController = v5;

    [(AXGestureRecorderMainViewController *)self->_gestureRecorderMainViewController setDelegate:self];
  }
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_gestureRecorderMainViewController];
  [v7 setModalPresentationStyle:0];
  [v7 _setIgnoreAppSupportedOrientations:1];
  [(CustomGestureController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CustomGestureController *)self specifierForIndexPath:v6];
  BOOL v9 = [v8 propertyForKey:PSKeyNameKey];
  unsigned int v10 = [v9 isEqualToString:@"CreateCustomGesture"];

  if (v10)
  {
    [v7 deselectRowAtIndexPath:v6 animated:1];

    [(CustomGestureController *)self _createCustomGesture];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CustomGestureController;
    [(AXNamedItemsListController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
  }
}

- (void)willResignActive
{
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CustomGestureController *)self willBecomeActive];
  v5.receiver = self;
  v5.super_class = (Class)CustomGestureController;
  [(AXNamedItemsListController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(CustomGestureController *)self willResignActive];
  v5.receiver = self;
  v5.super_class = (Class)CustomGestureController;
  [(CustomGestureController *)&v5 viewWillDisappear:v3];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CustomGestureController *)self isEditing] != a3)
  {
    if (v5)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v7 = [(CustomGestureController *)self table];
      id v8 = [v7 visibleCells];

      id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        id v10 = v9;
        char v11 = 0;
        uint64_t v12 = *(void *)v17;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v8);
            }
            unsigned __int8 v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ([v14 isEditing])
            {
              char v11 = 1;
              [v14 setEditing:0 animated:1];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);

        if ((v11 & 1) == 0) {
          goto LABEL_15;
        }
        id v8 = [(CustomGestureController *)self table];
        [v8 reloadData];
      }
    }
LABEL_15:
    v15.receiver = self;
    v15.super_class = (Class)CustomGestureController;
    [(CustomGestureController *)&v15 setEditing:v5 animated:v4];
    [(CustomGestureController *)self _hideSpecifiersDuringEditing:v5 animated:v4];
  }
}

- (NSString)customGesturesTitle
{
  return 0;
}

- (NSString)customGesturesExplanatoryText
{
  return 0;
}

- (unint64_t)maximumNumberOfCustomGestures
{
  return 0;
}

- (BOOL)shouldRecordRealTimeGesture
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CustomGestureController;
  [(AXNamedItemsListController *)&v6 tableView:a3 commitEditingStyle:a4 forRowAtIndexPath:a5];
  [(CustomGestureController *)self _disableCreateNewGestureButton:[(CustomGestureController *)self _shouldDisableCreateNewGestureButton] animated:0];
}

- (BOOL)gestureRecorder:(id)a3 canSaveGestureWithName:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    [(AXNamedItemsListController *)self valueInSettings];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          char v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "name", (void)v15);
          unsigned __int8 v12 = [v11 isEqualToString:v5];

          if (v12)
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)gestureRecorder:(id)a3 saveGestureWithPropertyListRepresentation:(id)a4
{
  id v8 = +[AXNamedReplayableGesture gestureWithLegacyFormatDictionary:a4];
  id v5 = [(AXNamedItemsListController *)self valueInSettings];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 arrayByAddingObject:v8];
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v8, 0);
  }
  [(AXNamedItemsListController *)self setValueInSettings:v7];
}

- (void)gestureRecorder:(id)a3 saveNamedReplayableGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(AXNamedItemsListController *)self valueInSettings];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 arrayByAddingObject:v5];

    id v5 = v7;
  }
  else
  {
    id v8 = +[NSArray arrayWithObject:v5];
  }

  [(AXNamedItemsListController *)self setValueInSettings:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecorderMainViewController, 0);

  objc_storeStrong((id *)&self->_hiddenSpecifiers, 0);
}

@end