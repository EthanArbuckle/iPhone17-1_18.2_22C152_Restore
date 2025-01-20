@interface SCATLaunchRecipeController
- (NSArray)recipes;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)setRecipes:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation SCATLaunchRecipeController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[AXSettings sharedInstance];
    v6 = [v5 switchControlRecipes];
    [(SCATLaunchRecipeController *)self setRecipes:v6];

    v7 = [(SCATLaunchRecipeController *)self recipes];
    id v8 = [v7 count];

    if (!v8) {
      _AXAssert();
    }
    id v9 = objc_alloc((Class)NSMutableArray);
    v10 = [(SCATLaunchRecipeController *)self recipes];
    id v11 = objc_msgSend(v9, "initWithCapacity:", (char *)objc_msgSend(v10, "count") + 2);

    v12 = +[PSSpecifier emptyGroupSpecifier];
    v13 = AXParameterizedLocalizedString();
    [v12 setProperty:v13 forKey:PSFooterTextGroupKey];

    [v11 addObject:v12];
    v14 = AXParameterizedLocalizedString();
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v15 setProperty:&off_229BA0 forKey:@"RecipeIndex"];
    [v11 addObject:v15];
    v16 = [(SCATLaunchRecipeController *)self recipes];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __40__SCATLaunchRecipeController_specifiers__block_invoke;
    v21[3] = &unk_20AE80;
    v21[4] = self;
    id v17 = v11;
    id v22 = v17;
    [v16 enumerateObjectsUsingBlock:v21];

    v18 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v17;
    id v19 = v17;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

void __40__SCATLaunchRecipeController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 name];
  id v7 = +[PSSpecifier preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:0 detail:0 cell:3 edit:0];

  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  [v7 setProperty:v6 forKey:@"RecipeIndex"];

  [*(id *)(a1 + 40) addObject:v7];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SCATLaunchRecipeController;
  id v7 = [(SCATLaunchRecipeController *)&v33 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = +[AXSettings sharedInstance];
  id v9 = [(SCATLaunchRecipeController *)self specifierAtIndex:[(SCATLaunchRecipeController *)self indexForIndexPath:v6]];
  v10 = [v9 propertyForKey:@"RecipeIndex"];
  if (!v10)
  {
    _AXAssert();
    id v11 = objc_msgSend(v8, "switchControlLaunchRecipeUUID", v9);
    BOOL v21 = 0;
    goto LABEL_23;
  }
  id v11 = [v8 switchControlLaunchRecipeUUID];
  id v12 = [v10 unsignedIntegerValue];
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v22 = v12;
    v23 = [(SCATLaunchRecipeController *)self recipes];
    v13 = [v23 objectAtIndexedSubscript:v22];

    if (v11)
    {
      v24 = [v13 uuid];
      v25 = [v8 switchControlLaunchRecipeUUID];
      unsigned int v20 = [v24 isEqual:v25];
    }
    else
    {
      unsigned int v20 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v11)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v13 = [(SCATLaunchRecipeController *)self recipes];
    id v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      v27 = v8;
      v28 = v7;
      uint64_t v16 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v29 + 1) + 8 * i) uuid];
          unsigned __int8 v19 = [v18 isEqual:v11];

          if (v19)
          {
            unsigned int v20 = 0;
            goto LABEL_17;
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        unsigned int v20 = 1;
        if (v15) {
          continue;
        }
        break;
      }
LABEL_17:
      id v8 = v27;
      id v7 = v28;
    }
    else
    {
      unsigned int v20 = 1;
    }
    goto LABEL_21;
  }
  unsigned int v20 = 1;
LABEL_22:
  BOOL v21 = v20 != 0;
LABEL_23:
  [v7 setChecked:v21];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SCATLaunchRecipeController *)self updateTableCheckedSelection:v6];
  id v8 = [(SCATLaunchRecipeController *)self specifierAtIndex:[(SCATLaunchRecipeController *)self indexForIndexPath:v6]];
  id v9 = [v8 propertyForKey:@"RecipeIndex"];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 unsignedIntegerValue];
    id v12 = +[AXSettings sharedInstance];
    v13 = v12;
    if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      [v12 setSwitchControlLaunchRecipeUUID:0];
    }
    else
    {
      id v14 = [(SCATLaunchRecipeController *)self recipes];
      id v15 = [v14 objectAtIndexedSubscript:v11];

      uint64_t v16 = [v15 uuid];
      [v13 setSwitchControlLaunchRecipeUUID:v16];
    }
  }
  else
  {
    id v17 = v8;
    _AXAssert();
  }
  v18.receiver = self;
  v18.super_class = (Class)SCATLaunchRecipeController;
  -[SCATLaunchRecipeController tableView:didSelectRowAtIndexPath:](&v18, "tableView:didSelectRowAtIndexPath:", v7, v6, v17);
}

- (NSArray)recipes
{
  return self->_recipes;
}

- (void)setRecipes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end