@interface SCATRecipeSwitchesController
- (AXSwitchRecipe)recipe;
- (AXSwitchRecipeMapping)mapping;
- (BOOL)_isForExistingMappingWithMissingSwitch;
- (id)specifiers;
- (void)setMapping:(id)a3;
- (void)setRecipe:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATRecipeSwitchesController

- (BOOL)_isForExistingMappingWithMissingSwitch
{
  v3 = [(SCATRecipeSwitchesController *)self recipe];
  v4 = [v3 mappings];
  v5 = [(SCATRecipeSwitchesController *)self mapping];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (id)specifiers
{
  v2 = self;
  v3 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v32 = OBJC_IVAR___PSListController__specifiers;
    v4 = [(SCATRecipeSwitchesController *)v2 recipe];
    uint64_t v33 = AXSwitchRecipeMappingSwitchUUIDs();

    id v5 = objc_alloc_init((Class)NSMutableArray);
    unsigned __int8 v6 = AXParameterizedLocalizedString();
    v7 = +[PSSpecifier groupSpecifierWithName:v6];

    [v5 addObject:v7];
    v8 = +[SCATSwitchesController switchSpecifiersForSwitchesWithTarget:v2 get:0];
    v29 = v8;
    if ([v8 count])
    {
      objc_msgSend(v5, "addObjectsFromArray:", v8, v8, v7);
    }
    else
    {
      v9 = AXParameterizedLocalizedString();
      objc_msgSend(v7, "setProperty:forKey:", v9, PSFooterTextGroupKey, v29, v7);
    }
    unsigned int v37 = [(SCATRecipeSwitchesController *)v2 _isForExistingMappingWithMissingSwitch];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v5;
    id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    v11 = (void *)v33;
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v39;
      CFStringRef v14 = @"SwitchKey";
      uint64_t v35 = PSEnabledKey;
      do
      {
        v15 = 0;
        id v34 = v12;
        do
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v15);
          v17 = [v16 propertyForKey:v14];
          v18 = v17;
          if (v17)
          {
            v19 = [v17 uuid];
            if ([v11 containsObject:v19])
            {

              goto LABEL_15;
            }
            CFStringRef v20 = v14;
            uint64_t v21 = v13;
            v22 = v2;
            v23 = [(SCATRecipeSwitchesController *)v2 mapping];
            uint64_t v24 = [v23 longPressAction];
            if (v24)
            {
              v25 = (void *)v24;
              unsigned __int8 v26 = [v18 supportsLongPress];

              v2 = v22;
              uint64_t v13 = v21;
              CFStringRef v14 = v20;
              v11 = (void *)v33;
              id v12 = v34;
              if ((v26 & 1) == 0) {
LABEL_15:
              }
                [v16 setProperty:&__kCFBooleanFalse forKey:v35];
            }
            else
            {

              v2 = v22;
              uint64_t v13 = v21;
              CFStringRef v14 = v20;
              v11 = (void *)v33;
              id v12 = v34;
            }
            if (v37) {
              [v16 setCellType:3];
            }
          }

          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v12);
    }

    v27 = *(void **)&v2->AXUISettingsBaseListController_opaque[v32];
    *(void *)&v2->AXUISettingsBaseListController_opaque[v32] = obj;

    v3 = *(void **)&v2->AXUISettingsBaseListController_opaque[v32];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SCATRecipeSwitchesController *)self specifierForIndexPath:v7];
  v9 = [v8 propertyForKey:PSEnabledKey];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = [v8 propertyForKey:@"SwitchKey"];
    id v12 = [v11 uuid];
    uint64_t v13 = [(SCATRecipeSwitchesController *)self mapping];
    [v13 setSwitchUUID:v12];

    id v14 = [v11 action];
    v15 = [(SCATRecipeSwitchesController *)self mapping];
    [v15 setSwitchOriginalAction:v14];

    if ([(SCATRecipeSwitchesController *)self _isForExistingMappingWithMissingSwitch])
    {
      v16 = +[AXSettings sharedInstance];
      v17 = [(SCATRecipeSwitchesController *)self recipe];
      unsigned int v18 = [v16 isNewRecipe:v17];

      if (v18) {
        _AXAssert();
      }
      v19 = +[AXSettings sharedInstance];
      CFStringRef v20 = [(SCATRecipeSwitchesController *)self recipe];
      [v19 updateRecipe:v20];

      uint64_t v21 = [(SCATRecipeSwitchesController *)self rootController];
      id v22 = [(SCATRecipeActionsController *)v21 popViewControllerAnimated:1];
    }
    else
    {
      uint64_t v21 = objc_alloc_init(SCATRecipeActionsController);
      v23 = [(SCATRecipeSwitchesController *)self recipe];
      [(SCATRecipeActionsController *)v21 setRecipe:v23];

      uint64_t v24 = [(SCATRecipeSwitchesController *)self mapping];
      [(SCATRecipeActionsController *)v21 setMapping:v24];

      [(SCATRecipeSwitchesController *)self showController:v21 withSpecifier:v8];
    }
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SCATRecipeSwitchesController;
    [(SCATRecipeSwitchesController *)&v25 tableView:v6 didSelectRowAtIndexPath:v7];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);

  objc_storeStrong((id *)&self->_recipe, 0);
}

@end