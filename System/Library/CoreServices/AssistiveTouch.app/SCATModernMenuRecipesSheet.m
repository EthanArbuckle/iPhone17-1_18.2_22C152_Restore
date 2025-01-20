@interface SCATModernMenuRecipesSheet
- (NSArray)recipes;
- (SCATModernMenuRecipesSheet)initWithMenu:(id)a3;
- (id)makeMenuItemsIfNeeded;
- (int64_t)preferredTipObject;
- (void)menuItemWasActivated:(id)a3;
- (void)setRecipes:(id)a3;
@end

@implementation SCATModernMenuRecipesSheet

- (SCATModernMenuRecipesSheet)initWithMenu:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCATModernMenuRecipesSheet;
  v3 = [(SCATModernMenuSheet *)&v7 initWithMenu:a3];
  if (v3)
  {
    v4 = +[AXSettings sharedInstance];
    v5 = [v4 switchControlRecipes];
    [(SCATModernMenuRecipesSheet *)v3 setRecipes:v5];
  }
  return v3;
}

- (id)makeMenuItemsIfNeeded
{
  v3 = [(SCATModernMenuRecipesSheet *)self recipes];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v3 count] + 1);

  v5 = +[NSMutableSet set];
  v6 = [(SCATModernMenuRecipesSheet *)self recipes];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006BCEC;
  v18[3] = &unk_1001ACCA8;
  v18[4] = self;
  id v7 = v5;
  id v19 = v7;
  id v8 = v4;
  id v20 = v8;
  [v6 enumerateObjectsUsingBlock:v18];

  v9 = [(SCATModernMenuSheet *)self menu];
  v10 = [v9 screenPoint];

  if (v10)
  {
    v11 = sub_100040EC8(@"CREATE_RECIPE_FROM_POINT");
    v12 = +[SCATModernMenuItem itemWithIdentifier:@"create_recipe_from_point" delegate:self title:v11 imageName:@"SCATIcon_recipe_createFromTap" activateBehavior:2];

    [v8 addObject:v12];
    v13 = sub_100040EC8(@"CREATE_RECIPE_FROM_HOLD_POINT");
    v14 = +[SCATModernMenuItem itemWithIdentifier:@"create_recipe_from_hold_point" delegate:self title:v13 imageName:@"SCATIcon_recipe_createFromHold" activateBehavior:2];

    [v8 addObject:v14];
  }
  v15 = v20;
  id v16 = v8;

  return v16;
}

- (void)menuItemWasActivated:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if ([v5 hasPrefix:@"recipe_"])
  {
    v6 = [v4 identifier];
    id v7 = [v6 substringFromIndex:objc_msgSend(@"recipe_", "length")];
    id v8 = [v7 integerValue];

    v9 = [(SCATModernMenuRecipesSheet *)self recipes];
    v10 = [v9 objectAtIndexedSubscript:v8];

    v11 = [(SCATModernMenuSheet *)self menu];
    v12 = [v11 delegate];
    v13 = [(SCATModernMenuSheet *)self menu];
    [v12 menu:v13 activateRecipe:v10];
  }
  else if (([v5 isEqualToString:@"create_recipe_from_point"] & 1) != 0 {
         || [v5 isEqualToString:@"create_recipe_from_hold_point"])
  }
  {
    v14 = [(SCATModernMenuSheet *)self menu];
    v15 = [v14 screenPoint];

    if (!v15) {
      _AXAssert();
    }
    id v16 = [(SCATModernMenuSheet *)self menu];
    v17 = [v16 screenPoint];
    [v17 CGPointValue];
    double v19 = v18;
    double v21 = v20;
    v22 = +[SCATScannerManager sharedManager];
    v23 = [v22 scatUIContext];
    +[HNDScreen convertPoint:toView:](HNDScreen, "convertPoint:toView:", v23, v19, v21);
    double v25 = v24;
    double v27 = v26;

    LODWORD(v16) = [v5 isEqualToString:@"create_recipe_from_hold_point"];
    v28 = +[AXSettings sharedInstance];
    v29 = v28;
    if (v16) {
      id v30 = objc_msgSend(v28, "createAndSaveRecipeForInterfaceOrientedHoldPoint:", v25, v27);
    }
    else {
      id v31 = objc_msgSend(v28, "createAndSaveRecipeForInterfaceOrientedPoint:", v25, v27);
    }

    v32 = +[AXSettings sharedInstance];
    v33 = [v32 switchControlRecipes];
    [(SCATModernMenuRecipesSheet *)self setRecipes:v33];

    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_10006C1F8;
    v38 = &unk_1001AAA90;
    v39 = self;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)SCATModernMenuRecipesSheet;
    [(SCATModernMenuSheet *)&v34 menuItemWasActivated:v4];
  }
}

- (int64_t)preferredTipObject
{
  return 1;
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