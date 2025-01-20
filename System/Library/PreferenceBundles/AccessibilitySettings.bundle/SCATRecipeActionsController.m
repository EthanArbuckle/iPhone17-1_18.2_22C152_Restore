@interface SCATRecipeActionsController
- (AXGestureRecorderMainViewController)gestureRecorder;
- (AXSwitchRecipe)recipe;
- (AXSwitchRecipeMapping)mapping;
- (BOOL)_isNewMapping;
- (BOOL)_popToLongPressController;
- (BOOL)forLongPress;
- (PSSpecifier)gestureActionSpecifier;
- (PSSpecifier)holdPointActionSpecifier;
- (id)_insertLongPressController;
- (id)_rootRecipeEditController;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_handleSelectActionForSpecifier:(id)a3;
- (void)_removeLongPressController;
- (void)gestureRecorder:(id)a3 savePoint:(CGPoint)a4;
- (void)gestureRecorder:(id)a3 saveReplayableGesture:(id)a4;
- (void)setForLongPress:(BOOL)a3;
- (void)setGestureActionSpecifier:(id)a3;
- (void)setGestureRecorder:(id)a3;
- (void)setHoldPointActionSpecifier:(id)a3;
- (void)setMapping:(id)a3;
- (void)setRecipe:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATRecipeActionsController

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v46 = OBJC_IVAR___PSListController__specifiers;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = AXParameterizedLocalizedString();
    uint64_t v6 = +[PSSpecifier groupSpecifierWithName:v5];

    v50 = v4;
    v45 = (void *)v6;
    [v4 addObject:v6];
    if ([(SCATRecipeActionsController *)v2 forLongPress])
    {
      v7 = AXParameterizedLocalizedString();
      v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      [v4 addObject:v8];
    }
    v61[0] = AXSwitchRecipeMappingActionCenterTap;
    v61[1] = AXSwitchRecipeMappingActionRightToLeftSwipe;
    uint64_t v9 = AXSwitchRecipeMappingActionHoldAtPoint;
    v61[2] = AXSwitchRecipeMappingActionLeftToRightSwipe;
    v61[3] = AXSwitchRecipeMappingActionHoldAtPoint;
    uint64_t v10 = AXSwitchRecipeMappingActionGesture;
    v61[4] = AXSwitchRecipeMappingActionGesture;
    v61[5] = AXSwitchRecipeMappingActionExit;
    v61[6] = AXSwitchRecipeMappingActionSelect;
    v11 = +[NSArray arrayWithObjects:v61 count:7];
    if ([(SCATRecipeActionsController *)v2 forLongPress])
    {
      v12 = +[NSPredicate predicateWithBlock:&__block_literal_global_45];
      uint64_t v13 = [v11 filteredArrayUsingPredicate:v12];

      v11 = (void *)v13;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v11;
    id v14 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v19 = AXSwitchRecipeMappingNameForAction();
          v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

          [v20 setProperty:v18 forKey:@"Action"];
          if ([v18 isEqualToString:v10])
          {
            [(SCATRecipeActionsController *)v2 setGestureActionSpecifier:v20];
          }
          else if ([v18 isEqualToString:v9])
          {
            [(SCATRecipeActionsController *)v2 setHoldPointActionSpecifier:v20];
          }
          [v50 addObject:v20];
        }
        id v15 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v15);
    }

    v21 = AXParameterizedLocalizedString();
    uint64_t v22 = +[PSSpecifier groupSpecifierWithName:v21];

    v44 = (void *)v22;
    [v50 addObject:v22];
    unint64_t v23 = 1;
    uint64_t v49 = AXSwitchRecipeMappingGameControlButtonPress;
    while (1)
    {
      if (v23 <= 0xC)
      {
        v24 = +[NSString stringWithFormat:@"GAME_CONTROL_%d", v23];
        v25 = AXParameterizedLocalizedString();
        v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

        v27 = objc_opt_new();
        [v27 setButton:v23];
        [v26 setObject:v49 forKeyedSubscript:@"Action"];
        [v26 setObject:v27 forKeyedSubscript:@"AXGameControlButtonPress"];
        [v50 addObject:v26];

        goto LABEL_40;
      }
      v28 = @"RIGHT";
      if (v23 == 13) {
        v28 = @"LEFT";
      }
      v24 = v28;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v29 = [&off_22BEB8 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v29) {
        break;
      }
LABEL_40:

      if (++v23 == 15)
      {
        v42 = *(void **)&v2->AXUISettingsBaseListController_opaque[v46];
        *(void *)&v2->AXUISettingsBaseListController_opaque[v46] = v50;

        v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v46];
        goto LABEL_42;
      }
    }
    id v30 = v29;
    uint64_t v48 = *(void *)v52;
LABEL_24:
    v31 = 0;
    while (1)
    {
      if (*(void *)v52 != v48) {
        objc_enumerationMutation(&off_22BEB8);
      }
      v32 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v31);
      v33 = v24;
      v34 = +[NSString stringWithFormat:@"%@_JOYSTICK_%@", v24, v32];
      v35 = AXParameterizedLocalizedString();
      v36 = v2;
      v37 = +[PSSpecifier preferenceSpecifierNamed:v35 target:v2 set:0 get:0 detail:0 cell:3 edit:0];

      v38 = objc_opt_new();
      [v38 setButton:v23];
      if ([v32 isEqualToString:@"Up"]) {
        break;
      }
      if ([v32 isEqualToString:@"Down"])
      {
        LODWORD(v39) = -1.0;
        goto LABEL_31;
      }
      if ([v32 isEqualToString:@"Left"])
      {
        LODWORD(v40) = -1.0;
LABEL_38:
        [v38 setXMagnitude:v40];
        goto LABEL_32;
      }
      if ([v32 isEqualToString:@"Right"])
      {
        LODWORD(v40) = 1.0;
        goto LABEL_38;
      }
LABEL_32:
      [v37 setObject:v49 forKeyedSubscript:@"Action"];
      [v37 setObject:v38 forKeyedSubscript:@"AXGameControlButtonPress"];
      [v37 setIdentifier:v34];
      [v50 addObject:v37];

      v31 = (char *)v31 + 1;
      v2 = v36;
      v24 = v33;
      if (v30 == v31)
      {
        id v41 = [&off_22BEB8 countByEnumeratingWithState:&v51 objects:v59 count:16];
        id v30 = v41;
        if (!v41) {
          goto LABEL_40;
        }
        goto LABEL_24;
      }
    }
    LODWORD(v39) = 1.0;
LABEL_31:
    [v38 setYMagnitude:v39];
    goto LABEL_32;
  }
LABEL_42:

  return v3;
}

BOOL __41__SCATRecipeActionsController_specifiers__block_invoke(id a1, id a2, NSDictionary *a3)
{
  return AXSwitchRecipeMappingActionAllowsLongPress();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v38.receiver = self;
  v38.super_class = (Class)SCATRecipeActionsController;
  id v6 = a4;
  v7 = [(SCATRecipeActionsController *)&v38 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = [(SCATRecipeActionsController *)self specifierForIndexPath:v6];

  uint64_t v9 = [(SCATRecipeActionsController *)self mapping];
  unsigned __int8 v10 = [(SCATRecipeActionsController *)self forLongPress];
  if (v10) {
    [v9 longPressAction];
  }
  else {
  v11 = [v9 action];
  }
  v12 = [v8 propertyForKey:@"Action"];
  uint64_t v13 = v12;
  if (v11 == v12) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = (uint64_t)[v12 isEqualToString:v11];
  }
  if ([v13 isEqualToString:AXSwitchRecipeMappingGameControlButtonPress])
  {
    id v15 = [v8 objectForKeyedSubscript:@"AXGameControlButtonPress"];
    if (v10) {
      [v9 longPressGameControlButtonPress];
    }
    else {
    uint64_t v16 = [v9 gameControlButtonPress];
    }
    id v17 = [v15 button];
    id v18 = [v16 button];
    uint64_t v14 = v17 == v18;
    if ([v15 button] != (char *)&dword_C + 1 && objc_msgSend(v15, "button") != (char *)&dword_C + 2) {
      goto LABEL_41;
    }
    v37 = v7;
    v19 = (char *)[v15 button];
    CFStringRef v20 = @"RIGHT";
    if (v19 == (unsigned char *)&dword_C + 1) {
      CFStringRef v20 = @"LEFT";
    }
    v21 = +[NSString stringWithFormat:@"%@_JOYSTICK", v20];
    if (v17 == v18)
    {
      uint64_t v22 = [v8 identifier];
      unsigned int v23 = [v22 containsString:v21];

      [v16 yMagnitude];
      if (v24 <= 0.0)
      {
        [v16 yMagnitude];
        if (v30 >= 0.0) {
          unsigned int v29 = v23;
        }
        else {
          unsigned int v29 = 0;
        }
        if (v30 >= 0.0 || ((v23 ^ 1) & 1) != 0)
        {
LABEL_29:
          [v16 xMagnitude];
          if (v31 <= 0.0)
          {
            [v16 xMagnitude];
            if (v35 >= 0.0) {
              uint64_t v14 = v29;
            }
            else {
              uint64_t v14 = 0;
            }
            if (v35 >= 0.0 || ((v29 ^ 1) & 1) != 0) {
              goto LABEL_40;
            }
            v32 = [v8 identifier];
            v33 = v32;
            CFStringRef v34 = @"_Left";
          }
          else
          {
            if (!v29)
            {
              uint64_t v14 = 0;
              goto LABEL_40;
            }
            v32 = [v8 identifier];
            v33 = v32;
            CFStringRef v34 = @"_Right";
          }
          uint64_t v14 = (uint64_t)[v32 containsString:v34];

LABEL_40:
          v7 = v37;
LABEL_41:

          goto LABEL_42;
        }
        v25 = [v8 identifier];
        v26 = v25;
        CFStringRef v27 = @"_Down";
LABEL_28:
        unsigned int v29 = [v25 containsString:v27];

        goto LABEL_29;
      }
      if (v23)
      {
        v25 = [v8 identifier];
        v26 = v25;
        CFStringRef v27 = @"_Up";
        goto LABEL_28;
      }
    }
    else
    {
      [v16 yMagnitude];
      if (v28 <= 0.0) {
        [v16 yMagnitude];
      }
    }
    unsigned int v29 = 0;
    goto LABEL_29;
  }
LABEL_42:
  [v7 setChecked:v14];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SCATRecipeActionsController;
  id v6 = a4;
  [(SCATRecipeActionsController *)&v18 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = -[SCATRecipeActionsController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v18.receiver, v18.super_class);

  v8 = [v7 propertyForKey:@"Action"];
  unsigned __int8 v9 = [v8 isEqualToString:AXSwitchRecipeMappingActionGesture];
  uint64_t v10 = AXSwitchRecipeMappingActionHoldAtPoint;
  if ((v9 & 1) != 0 || [v8 isEqualToString:AXSwitchRecipeMappingActionHoldAtPoint])
  {
    [(AXGestureRecorderMainViewController *)self->_gestureRecorder setDelegate:0];
    if ([v8 isEqualToString:v10]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    v12 = (AXGestureRecorderMainViewController *)[objc_alloc((Class)AXGestureRecorderMainViewController) initWithType:v11];
    gestureRecorder = self->_gestureRecorder;
    self->_gestureRecorder = v12;

    [(AXGestureRecorderMainViewController *)self->_gestureRecorder setDelegate:self];
    id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_gestureRecorder];
    [v14 setModalPresentationStyle:0];
    [v14 _setIgnoreAppSupportedOrientations:1];
    [(SCATRecipeActionsController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    unsigned int v15 = [(SCATRecipeActionsController *)self forLongPress];
    uint64_t v16 = [(SCATRecipeActionsController *)self mapping];
    id v17 = v16;
    if (v15) {
      [v16 setLongPressGesture:0];
    }
    else {
      [v16 setGesture:0];
    }

    [(SCATRecipeActionsController *)self _handleSelectActionForSpecifier:v7];
  }
}

- (BOOL)_isNewMapping
{
  v3 = [(SCATRecipeActionsController *)self recipe];
  id v4 = [v3 mappings];
  v5 = [(SCATRecipeActionsController *)self mapping];
  char v6 = [v4 containsObject:v5] ^ 1;

  return v6;
}

- (id)_rootRecipeEditController
{
  v2 = [(SCATRecipeActionsController *)self parentController];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 parentController];

      v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (BOOL)_popToLongPressController
{
  uint64_t v3 = [(SCATRecipeActionsController *)self _insertLongPressController];
  if (v3)
  {
    id v4 = [(SCATRecipeActionsController *)self rootController];
    id v5 = [v4 popToViewController:v3 animated:1];
  }
  return v3 != 0;
}

- (id)_insertLongPressController
{
  uint64_t v3 = [(SCATRecipeActionsController *)self rootController];
  id v4 = [v3 viewControllers];

  id v5 = (char *)[v4 indexOfObjectPassingTest:&__block_literal_global_335_0];
  if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    char v6 = 0;
  }
  else
  {
    v7 = v5;
    char v6 = objc_alloc_init(SCATRecipeLongPressController);
    v8 = [(SCATRecipeActionsController *)self recipe];
    [(SCATRecipeLongPressController *)v6 setRecipe:v8];

    unsigned __int8 v9 = [(SCATRecipeActionsController *)self mapping];
    [(SCATRecipeLongPressController *)v6 setMapping:v9];

    uint64_t v10 = [(SCATRecipeActionsController *)self specifier];
    [(SCATRecipeLongPressController *)v6 setSpecifier:v10];

    id v11 = [v4 mutableCopy];
    [v11 insertObject:v6 atIndex:v7 + 1];
    v12 = [(SCATRecipeActionsController *)self rootController];
    [v12 setViewControllers:v11 animated:0];
  }

  return v6;
}

BOOL __57__SCATRecipeActionsController__insertLongPressController__block_invoke(id a1, PSController *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_removeLongPressController
{
  uint64_t v3 = [(SCATRecipeActionsController *)self rootController];
  id v8 = [v3 viewControllers];

  id v4 = [v8 indexOfObjectPassingTest:&__block_literal_global_338_0];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    id v6 = [v8 mutableCopy];
    [v6 removeObjectAtIndex:v5];
    v7 = [(SCATRecipeActionsController *)self rootController];
    [v7 setViewControllers:v6 animated:0];
  }
}

BOOL __57__SCATRecipeActionsController__removeLongPressController__block_invoke(id a1, PSController *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_handleSelectActionForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  unsigned int v6 = [v5 assistiveTouchLongPressEnabled];

  double v39 = [(SCATRecipeActionsController *)self indexPathForSpecifier:v4];
  -[SCATRecipeActionsController updateVisibleCellsWithCheckedSelection:](self, "updateVisibleCellsWithCheckedSelection:");
  v7 = [v4 propertyForKey:@"Action"];
  unsigned int v8 = [(SCATRecipeActionsController *)self _isNewMapping];
  if ([(SCATRecipeActionsController *)self forLongPress])
  {
    unsigned __int8 v9 = [(SCATRecipeActionsController *)self mapping];
    [v9 setLongPressAction:v7];
    int v10 = 0;
    int v11 = 0;
  }
  else
  {
    if (v8)
    {
      int v10 = 0;
      int v11 = 0;
    }
    else
    {
      v12 = [(SCATRecipeActionsController *)self mapping];
      uint64_t v13 = [v12 action];
      int v14 = AXSwitchRecipeMappingActionAllowsLongPress();

      int v15 = AXSwitchRecipeMappingActionAllowsLongPress();
      int v11 = v15 & ~v14;
      int v10 = v14 & (v15 ^ 1);
    }
    unsigned __int8 v9 = [(SCATRecipeActionsController *)self mapping];
    [v9 setAction:v7];
  }

  unsigned int v16 = [(SCATRecipeActionsController *)self forLongPress];
  id v17 = [v4 objectForKeyedSubscript:@"AXGameControlButtonPress"];
  objc_super v18 = [(SCATRecipeActionsController *)self mapping];
  v19 = v18;
  if (v16) {
    [v18 setLongPressGameControlButtonPress:v17];
  }
  else {
    [v18 setGameControlButtonPress:v17];
  }

  if (v8)
  {
    CFStringRef v20 = [(SCATRecipeActionsController *)self recipe];
    v21 = [v20 mappings];
    uint64_t v22 = [(SCATRecipeActionsController *)self mapping];
    unsigned int v23 = [v21 arrayByAddingObject:v22];

    if (!v23)
    {
      float v24 = [(SCATRecipeActionsController *)self mapping];
      double v40 = v24;
      unsigned int v23 = +[NSArray arrayWithObjects:&v40 count:1];
    }
    v25 = [(SCATRecipeActionsController *)self recipe];
    [v25 setMappings:v23];

    v26 = +[AXSettings sharedInstance];
    CFStringRef v27 = [(SCATRecipeActionsController *)self recipe];
    [v26 saveRecipe:v27];

    if (v6 && AXSwitchRecipeMappingActionAllowsLongPress())
    {
      float v28 = +[AXSettings sharedInstance];
      unsigned int v29 = [(SCATRecipeActionsController *)self mapping];
      float v30 = [v29 switchUUID];
      float v31 = [v28 switchForUUID:v30];

      if ([v31 supportsLongPress])
      {
        unsigned __int8 v32 = [(SCATRecipeActionsController *)self _popToLongPressController];

        if (v32) {
          goto LABEL_24;
        }
      }
      else
      {
      }
    }
    v36 = [(SCATRecipeActionsController *)self rootController];
    v37 = [(SCATRecipeActionsController *)self _rootRecipeEditController];
    id v38 = [v36 popToViewController:v37 animated:1];
  }
  else
  {
    v33 = +[AXSettings sharedInstance];
    CFStringRef v34 = [(SCATRecipeActionsController *)self recipe];
    [v33 saveRecipe:v34];

    if (v11)
    {
      id v35 = [(SCATRecipeActionsController *)self _insertLongPressController];
    }
    else if (v10)
    {
      [(SCATRecipeActionsController *)self _removeLongPressController];
    }
  }
LABEL_24:
}

- (void)gestureRecorder:(id)a3 saveReplayableGesture:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(SCATRecipeActionsController *)self forLongPress];
  v7 = [(SCATRecipeActionsController *)self mapping];
  unsigned int v8 = v7;
  if (v6) {
    [v7 setLongPressGesture:v5];
  }
  else {
    [v7 setGesture:v5];
  }

  id v9 = [(SCATRecipeActionsController *)self gestureActionSpecifier];
  [(SCATRecipeActionsController *)self _handleSelectActionForSpecifier:v9];
}

- (void)gestureRecorder:(id)a3 savePoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = [(SCATRecipeActionsController *)self mapping];
  objc_msgSend(v7, "setHoldPoint:", x, y);

  id v8 = [(SCATRecipeActionsController *)self holdPointActionSpecifier];
  [(SCATRecipeActionsController *)self _handleSelectActionForSpecifier:v8];
}

- (AXSwitchRecipe)recipe
{
  return self->_recipe;
}

- (void)setRecipe:(id)a3
{
}

- (AXSwitchRecipeMapping)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (BOOL)forLongPress
{
  return self->_forLongPress;
}

- (void)setForLongPress:(BOOL)a3
{
  self->_forLongPress = a3;
}

- (PSSpecifier)gestureActionSpecifier
{
  return self->_gestureActionSpecifier;
}

- (void)setGestureActionSpecifier:(id)a3
{
}

- (PSSpecifier)holdPointActionSpecifier
{
  return self->_holdPointActionSpecifier;
}

- (void)setHoldPointActionSpecifier:(id)a3
{
}

- (AXGestureRecorderMainViewController)gestureRecorder
{
  return self->_gestureRecorder;
}

- (void)setGestureRecorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecorder, 0);
  objc_storeStrong((id *)&self->_holdPointActionSpecifier, 0);
  objc_storeStrong((id *)&self->_gestureActionSpecifier, 0);
  objc_storeStrong((id *)&self->_mapping, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end