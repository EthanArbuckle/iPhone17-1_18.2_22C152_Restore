@interface SCATRecipeEditController
- (AXSwitchRecipe)recipe;
- (BOOL)_canShowCreateNewMappingSpecifier;
- (BOOL)_isTimeoutEnabled;
- (BOOL)_shouldAllowEditing;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (PSSpecifier)timeoutSpecifier;
- (double)maximumValueForSpecifier:(id)a3;
- (double)minimumValueForSpecifier:(id)a3;
- (double)stepValueForSpecifier:(id)a3;
- (double)valueForSpecifier:(id)a3;
- (id)_createNewMappingSpecifier;
- (id)_footerTextForNoMappings;
- (id)_isTimeoutEnabledForSpecifier:(id)a3;
- (id)_mappingActionForSpecifier:(id)a3;
- (id)_mappingsSpecifiers;
- (id)_recipeNameForSpecifier:(id)a3;
- (id)_timeoutSpecifiers;
- (id)specifiers;
- (id)stringValueForSpecifier:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)title;
- (int64_t)keyboardTypeForSpecifier:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_saveRecipeIfApplicable;
- (void)_setRecipeName:(id)a3 specifier:(id)a4;
- (void)_setTimeoutEnabled:(id)a3 specifier:(id)a4;
- (void)_showActionsForExistingMapping:(id)a3 forSpecifier:(id)a4;
- (void)_showLongPressControllerForExistingMapping:(id)a3 forSpecifier:(id)a4;
- (void)_showSwitchesForMapping:(id)a3 forSpecifier:(id)a4;
- (void)_showSwitchesForNewMappingForSpecifier:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setTimeoutSpecifier:(id)a3;
- (void)specifier:(id)a3 setValue:(double)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SCATRecipeEditController

- (id)title
{
  v2 = [(SCATRecipeEditController *)self recipe];
  v3 = [v2 name];

  if (![v3 length])
  {
    uint64_t v4 = AXParameterizedLocalizedString();

    v3 = (void *)v4;
  }

  return v3;
}

- (void)setRecipe:(id)a3
{
  p_recipe = &self->_recipe;
  v6 = (AXSwitchRecipe *)a3;
  if (*p_recipe != v6)
  {
    v5 = +[AXSettings sharedInstance];
    [v5 validateAndUpdateRecipeIfNeeded:v6];

    objc_storeStrong((id *)p_recipe, a3);
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = AXParameterizedLocalizedString();
    v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"_setRecipeName:specifier:" get:"_recipeNameForSpecifier:" detail:0 cell:8 edit:0];

    [v5 addObject:v7];
    v8 = [(SCATRecipeEditController *)self _mappingsSpecifiers];
    [v5 addObjectsFromArray:v8];

    v9 = [(SCATRecipeEditController *)self _timeoutSpecifiers];
    [v5 addObjectsFromArray:v9];

    v10 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    uint64_t v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCATRecipeEditController;
  [(SCATRecipeEditController *)&v7 viewWillAppear:a3];
  [(SCATRecipeEditController *)self reloadSpecifiers];
  unsigned int v4 = [(SCATRecipeEditController *)self _shouldAllowEditing];
  if (v4)
  {
    id v5 = [(SCATRecipeEditController *)self editButtonItem];
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(SCATRecipeEditController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  if (v4) {
}
  }

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SCATRecipeEditController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:@"Mapping"];
  if (v9)
  {
    v10 = +[AXSettings sharedInstance];
    v11 = [v8 propertyForKey:@"NeedsToChooseSwitch"];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      [(SCATRecipeEditController *)self _showSwitchesForMapping:v9 forSpecifier:v8];
LABEL_13:

      goto LABEL_14;
    }
    if ([v10 assistiveTouchLongPressEnabled])
    {
      v15 = [v9 switchUUID];
      v16 = [v10 switchForUUID:v15];
      if ([v16 supportsLongPress])
      {
        v17 = [v9 action];
        unsigned __int8 v18 = [v17 isEqualToString:AXSwitchRecipeMappingActionHoldAtPoint];

        if ((v18 & 1) == 0)
        {
          [(SCATRecipeEditController *)self _showLongPressControllerForExistingMapping:v9 forSpecifier:v8];
          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    [(SCATRecipeEditController *)self _showActionsForExistingMapping:v9 forSpecifier:v8];
    goto LABEL_13;
  }
  v13 = [v8 identifier];
  unsigned int v14 = [v13 isEqualToString:@"CreateNewMapping"];

  if (v14)
  {
    [(SCATRecipeEditController *)self _showSwitchesForNewMappingForSpecifier:v8];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SCATRecipeEditController;
    [(SCATRecipeEditController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
  }
LABEL_14:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)SCATRecipeEditController;
  id v6 = a4;
  id v7 = [(SCATRecipeEditController *)&v21 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = objc_msgSend(v7, "textLabel", v21.receiver, v21.super_class);
  v9 = [v8 textColor];

  v10 = [(SCATRecipeEditController *)self specifierForIndexPath:v6];

  v11 = [v10 propertyForKey:@"NeedsToChooseSwitch"];
  LODWORD(v8) = [v11 BOOLValue];

  if (v8)
  {
    unsigned int v12 = [v10 propertyForKey:@"Mapping"];
    if ([v12 isOptional])
    {
      uint64_t v13 = +[UIColor systemGrayColor];
      unsigned int v14 = v9;
    }
    else
    {
      v15 = [v7 textLabel];
      unsigned int v14 = [v15 font];

      if (v14) {
        [v14 pointSize];
      }
      else {
        double v16 = 17.0;
      }
      v17 = +[UIFont boldSystemFontOfSize:v16];
      unsigned __int8 v18 = [v7 textLabel];
      [v18 setFont:v17];

      uint64_t v13 = +[UIColor systemRedColor];
    }
    v9 = (void *)v13;
  }
  objc_super v19 = [v7 textLabel];
  [v19 setTextColor:v9];

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v20 = [(SCATRecipeEditController *)self specifierForIndexPath:a5];
    id v7 = [v20 propertyForKey:@"Mapping"];
    v8 = [(SCATRecipeEditController *)self recipe];
    v9 = [v8 mappings];
    id v10 = [v9 mutableCopy];

    [v10 removeObject:v7];
    v11 = [(SCATRecipeEditController *)self recipe];
    [v11 setMappings:v10];

    unsigned int v12 = [(SCATRecipeEditController *)self recipe];
    uint64_t v13 = [v12 mappings];
    id v14 = [v13 count];

    if (v14)
    {
      v15 = +[AXSettings sharedInstance];
      double v16 = [(SCATRecipeEditController *)self recipe];
      [v15 saveRecipe:v16];
    }
    else
    {
      v15 = [(SCATRecipeEditController *)self specifierForID:@"MappingsGroup"];
      double v16 = [(SCATRecipeEditController *)self _footerTextForNoMappings];
      [v15 setProperty:v16 forKey:PSFooterTextGroupKey];
    }

    [(SCATRecipeEditController *)self removeSpecifier:v20 animated:1];
    if ([(SCATRecipeEditController *)self _canShowCreateNewMappingSpecifier])
    {
      v17 = [(SCATRecipeEditController *)self specifierForID:@"CreateNewMapping"];

      if (!v17)
      {
        unsigned __int8 v18 = [(SCATRecipeEditController *)self _createNewMappingSpecifier];
        [(SCATRecipeEditController *)self insertSpecifier:v18 atEndOfGroup:1 animated:1];
      }
    }
    if (![(SCATRecipeEditController *)self _shouldAllowEditing])
    {
      [(SCATRecipeEditController *)self setEditing:0];
      objc_super v19 = [(SCATRecipeEditController *)self navigationItem];
      [v19 setRightBarButtonItem:0];
    }
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned int v4 = [(SCATRecipeEditController *)self specifierForIndexPath:a4];
  uint64_t v5 = [v4 propertyForKey:@"Mapping"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return (char *)[(SCATRecipeEditController *)self tableView:a3 editingStyleForRowAtIndexPath:a4] == (char *)&dword_0 + 1;
}

- (id)_recipeNameForSpecifier:(id)a3
{
  uint64_t v3 = [(SCATRecipeEditController *)self recipe];
  unsigned int v4 = [v3 name];

  return v4;
}

- (void)_setRecipeName:(id)a3 specifier:(id)a4
{
  id v9 = a3;
  uint64_t v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  int64_t v6 = [v9 stringByTrimmingCharactersInSet:v5];
  id v7 = [v6 length];

  if (v7)
  {
    v8 = [(SCATRecipeEditController *)self recipe];
    [v8 setName:v9];

    [(SCATRecipeEditController *)self _saveRecipeIfApplicable];
  }
}

- (id)_mappingActionForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"Mapping"];
  unsigned int v4 = +[AXSettings sharedInstance];
  if ([v4 assistiveTouchLongPressEnabled]
    && ([v3 longPressAction], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int64_t v6 = (void *)v5;
    id v7 = [v3 action];
    int v8 = AXSwitchRecipeMappingActionAllowsLongPress();

    if (v8)
    {
      id v9 = AXParameterizedLocalizedString();
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v10 = [v3 action];
  id v9 = AXSwitchRecipeMappingNameForAction();

LABEL_7:

  return v9;
}

- (id)_isTimeoutEnabledForSpecifier:(id)a3
{
  BOOL v3 = [(SCATRecipeEditController *)self _isTimeoutEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)_setTimeoutEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [(SCATRecipeEditController *)self _isTimeoutEnabled];
  unsigned int v7 = [v5 BOOLValue];

  if (!v7 || (v6 & 1) != 0)
  {
    double v9 = AXSwitchRecipeTimeoutNone;
    id v10 = [(SCATRecipeEditController *)self recipe];
    [v10 setTimeout:v9];

    [(SCATRecipeEditController *)self _saveRecipeIfApplicable];
    id v11 = [(SCATRecipeEditController *)self timeoutSpecifier];
    -[SCATRecipeEditController removeSpecifier:animated:](self, "removeSpecifier:animated:");
  }
  else
  {
    int v8 = [(SCATRecipeEditController *)self recipe];
    [v8 setTimeout:60.0];

    [(SCATRecipeEditController *)self _saveRecipeIfApplicable];
    id v11 = [(SCATRecipeEditController *)self timeoutSpecifier];
    -[SCATRecipeEditController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:");
  }
}

- (void)_showSwitchesForNewMappingForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)AXSwitchRecipeMapping);
  [(SCATRecipeEditController *)self _showSwitchesForMapping:v5 forSpecifier:v4];
}

- (void)_showSwitchesForMapping:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v9 = objc_alloc_init(SCATRecipeSwitchesController);
  int v8 = [(SCATRecipeEditController *)self recipe];
  [(SCATRecipeSwitchesController *)v9 setRecipe:v8];

  [(SCATRecipeSwitchesController *)v9 setMapping:v7];
  [(SCATRecipeEditController *)self showController:v9 withSpecifier:v6];
}

- (void)_showActionsForExistingMapping:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v9 = objc_alloc_init(SCATRecipeActionsController);
  int v8 = [(SCATRecipeEditController *)self recipe];
  [(SCATRecipeActionsController *)v9 setRecipe:v8];

  [(SCATRecipeActionsController *)v9 setMapping:v7];
  [(SCATRecipeEditController *)self showController:v9 withSpecifier:v6];
}

- (void)_showLongPressControllerForExistingMapping:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 action];
  unsigned int v9 = [v8 isEqualToString:AXSwitchRecipeMappingActionHoldAtPoint];

  if (v9) {
    _AXAssert();
  }
  id v11 = objc_alloc_init(SCATRecipeLongPressController);
  id v10 = [(SCATRecipeEditController *)self recipe];
  [(SCATRecipeLongPressController *)v11 setRecipe:v10];

  [(SCATRecipeLongPressController *)v11 setMapping:v7];
  [(SCATRecipeEditController *)self showController:v11 withSpecifier:v6];
}

- (BOOL)_shouldAllowEditing
{
  v2 = [(SCATRecipeEditController *)self recipe];
  BOOL v3 = [v2 mappings];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_createNewMappingSpecifier
{
  BOOL v3 = AXParameterizedLocalizedString();
  BOOL v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:2 edit:0];

  [v4 setIdentifier:@"CreateNewMapping"];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  return v4;
}

- (BOOL)_canShowCreateNewMappingSpecifier
{
  v2 = [(SCATRecipeEditController *)self recipe];
  BOOL v3 = [v2 mappings];
  id v4 = [v3 count];
  id v5 = +[AXSettings sharedInstance];
  id v6 = [v5 assistiveTouchSwitches];
  LOBYTE(v4) = v4 < [v6 count];

  return (char)v4;
}

- (id)_footerTextForNoMappings
{
  [(SCATRecipeEditController *)self _canShowCreateNewMappingSpecifier];
  v2 = AXParameterizedLocalizedString();

  return v2;
}

- (id)_mappingsSpecifiers
{
  BOOL v3 = +[NSMutableArray array];
  id v4 = AXParameterizedLocalizedString();
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  [v5 setIdentifier:@"MappingsGroup"];
  id v6 = [(SCATRecipeEditController *)self recipe];
  id v7 = [v6 mappings];
  id v8 = [v7 count];

  if (!v8)
  {
    unsigned int v9 = [(SCATRecipeEditController *)self _footerTextForNoMappings];
    [v5 setProperty:v9 forKey:PSFooterTextGroupKey];
  }
  v30 = v5;
  [v3 addObject:v5];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v33 = self;
  id v10 = [(SCATRecipeEditController *)self recipe];
  id v11 = [v10 mappings];

  id obj = v11;
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v32 = *(void *)v35;
    uint64_t v14 = PSEnabledKey;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        double v16 = v3;
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        unsigned __int8 v18 = +[AXSettings sharedInstance];
        objc_super v19 = [v17 switchUUID];
        id v20 = [v18 switchForUUID:v19];

        if (v20)
        {
          objc_super v21 = [v20 name];
          v22 = [v20 remoteDeviceName];
          id v23 = [v22 length];

          if (v23)
          {
            v29 = [v20 remoteDeviceName];
            uint64_t v24 = AXParameterizedLocalizedString();

            objc_super v21 = (void *)v24;
          }
        }
        else
        {
          objc_super v21 = AXParameterizedLocalizedString();
        }
        v25 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, v33, 0, "_mappingActionForSpecifier:", 0, 2, 0, v29);
        [v25 setProperty:&__kCFBooleanTrue forKey:v14];
        [v25 setProperty:v17 forKey:@"Mapping"];
        v26 = +[NSNumber numberWithBool:v20 == 0];
        [v25 setProperty:v26 forKey:@"NeedsToChooseSwitch"];

        BOOL v3 = v16;
        [v16 addObject:v25];
      }
      id v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v13);
  }

  if ([(SCATRecipeEditController *)v33 _canShowCreateNewMappingSpecifier])
  {
    v27 = [(SCATRecipeEditController *)v33 _createNewMappingSpecifier];
    [v3 addObject:v27];
  }

  return v3;
}

- (BOOL)_isTimeoutEnabled
{
  v2 = [(SCATRecipeEditController *)self recipe];
  [v2 timeout];
  BOOL v4 = v3 != AXSwitchRecipeTimeoutNone;

  return v4;
}

- (id)_timeoutSpecifiers
{
  double v3 = +[NSMutableArray arrayWithCapacity:3];
  BOOL v4 = AXParameterizedLocalizedString();
  id v5 = +[PSSpecifier groupSpecifierWithName:v4];

  id v6 = AXParameterizedLocalizedString();
  [v5 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v5];
  id v7 = AXParameterizedLocalizedString();
  id v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setTimeoutEnabled:specifier:" get:"_isTimeoutEnabledForSpecifier:" detail:0 cell:6 edit:0];

  [v8 setIdentifier:@"TimeoutEnabled"];
  [v3 addObject:v8];
  unsigned int v9 = [(SCATRecipeEditController *)self timeoutSpecifier];

  if (!v9)
  {
    id v10 = +[PSSpecifier ax_stepperSpecifierWithDelegate:self];
    [(SCATRecipeEditController *)self setTimeoutSpecifier:v10];
  }
  if ([(SCATRecipeEditController *)self _isTimeoutEnabled])
  {
    id v11 = [(SCATRecipeEditController *)self timeoutSpecifier];
    [v3 addObject:v11];
  }

  return v3;
}

- (void)_saveRecipeIfApplicable
{
  id v6 = +[AXSettings sharedInstance];
  double v3 = [(SCATRecipeEditController *)self recipe];
  unsigned __int8 v4 = [v6 isNewRecipe:v3];

  if ((v4 & 1) == 0)
  {
    id v5 = [(SCATRecipeEditController *)self recipe];
    [v6 updateRecipe:v5];
  }
}

- (double)valueForSpecifier:(id)a3
{
  double v3 = [(SCATRecipeEditController *)self recipe];
  [v3 timeout];
  double v5 = v4;

  return v5;
}

- (void)specifier:(id)a3 setValue:(double)a4
{
  id v6 = [(SCATRecipeEditController *)self recipe];
  [v6 setTimeout:a4];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_saveRecipeIfApplicable" object:0];

  [(SCATRecipeEditController *)self performSelector:"_saveRecipeIfApplicable" withObject:0 afterDelay:1.0];
}

- (double)stepValueForSpecifier:(id)a3
{
  return 10.0;
}

- (double)minimumValueForSpecifier:(id)a3
{
  return 10.0;
}

- (double)maximumValueForSpecifier:(id)a3
{
  return 10800.0;
}

- (int64_t)keyboardTypeForSpecifier:(id)a3
{
  return 4;
}

- (id)stringValueForSpecifier:(id)a3
{
  [(SCATRecipeEditController *)self valueForSpecifier:a3];
  double v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v4 = AXFormatNumberWithOptions();

  return v4;
}

- (AXSwitchRecipe)recipe
{
  return self->_recipe;
}

- (PSSpecifier)timeoutSpecifier
{
  return self->_timeoutSpecifier;
}

- (void)setTimeoutSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutSpecifier, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end