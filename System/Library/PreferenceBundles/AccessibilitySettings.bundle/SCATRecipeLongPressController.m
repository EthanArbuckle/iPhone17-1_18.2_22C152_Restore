@interface SCATRecipeLongPressController
- (AXSwitchRecipe)recipe;
- (AXSwitchRecipeMapping)mapping;
- (id)actionStringForLongPress:(BOOL)a3;
- (id)controllerForLongPress:(BOOL)a3;
- (void)setMapping:(id)a3;
- (void)setRecipe:(id)a3;
@end

@implementation SCATRecipeLongPressController

- (id)actionStringForLongPress:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(SCATRecipeLongPressController *)self mapping];
  v5 = v4;
  if (v3)
  {
    v6 = [v4 longPressAction];

    if (!v6) {
      goto LABEL_7;
    }
LABEL_5:
    v7 = AXSwitchRecipeMappingNameForAction();

    goto LABEL_8;
  }
  v6 = [v4 action];

  if (v6) {
    goto LABEL_5;
  }
  _AXAssert();
LABEL_7:
  v7 = AXParameterizedLocalizedString();
LABEL_8:

  return v7;
}

- (id)controllerForLongPress:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(SCATRecipeActionsController);
  v6 = [(SCATRecipeLongPressController *)self recipe];
  [(SCATRecipeActionsController *)v5 setRecipe:v6];

  v7 = [(SCATRecipeLongPressController *)self mapping];
  [(SCATRecipeActionsController *)v5 setMapping:v7];

  [(SCATRecipeActionsController *)v5 setForLongPress:v3];

  return v5;
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