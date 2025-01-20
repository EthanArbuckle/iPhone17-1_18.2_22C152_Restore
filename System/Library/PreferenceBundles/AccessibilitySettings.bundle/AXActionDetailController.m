@interface AXActionDetailController
- (BOOL)isActionAvailable:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)actionForSpecifier:(id)a3;
- (int64_t)currentAction;
- (void)_updateCheckmarkForCell:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCurrentAction:(int64_t)a3;
- (void)updateSpecifierStateAndReload:(BOOL)a3;
@end

@implementation AXActionDetailController

- (void)updateSpecifierStateAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    uint64_t v9 = PSEnabledKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "cellType", (void)v13) == (char *)&dword_0 + 3)
        {
          v12 = +[NSNumber numberWithBool:[(AXActionDetailController *)self isActionAvailable:[(AXActionDetailController *)self actionForSpecifier:v11]]];
          [v11 setProperty:v12 forKey:v9];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (v3) {
    [(AXActionDetailController *)self reloadSpecifiers];
  }
}

- (void)_updateCheckmarkForCell:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AXActionDetailController *)self currentAction];
  id v6 = [v4 specifier];
  objc_msgSend(v4, "setChecked:", v5 == -[AXActionDetailController actionForSpecifier:](self, "actionForSpecifier:", v6));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXActionDetailController;
  int64_t v5 = [(AXActionDetailController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  [(AXActionDetailController *)self _updateCheckmarkForCell:v5];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AXActionDetailController;
  id v6 = a4;
  id v7 = a3;
  [(AXActionDetailController *)&v12 tableView:v7 didSelectRowAtIndexPath:v6];
  uint64_t v8 = objc_msgSend(v7, "cellForRowAtIndexPath:", v6, v12.receiver, v12.super_class);

  uint64_t v9 = [v8 specifier];
  int64_t v10 = [(AXActionDetailController *)self currentAction];
  int64_t v11 = [(AXActionDetailController *)self actionForSpecifier:v9];
  if (v10 != v11)
  {
    [(AXActionDetailController *)self updateCurrentAction:v11];
    [(AXActionDetailController *)self updateSpecifierStateAndReload:1];
  }
}

- (int64_t)actionForSpecifier:(id)a3
{
  return -1;
}

- (BOOL)isActionAvailable:(int64_t)a3
{
  return 0;
}

- (int64_t)currentAction
{
  return -1;
}

- (void)updateCurrentAction:(int64_t)a3
{
  OUTLINED_FUNCTION_1_1();

  NSRequestConcreteImplementation();
}

@end