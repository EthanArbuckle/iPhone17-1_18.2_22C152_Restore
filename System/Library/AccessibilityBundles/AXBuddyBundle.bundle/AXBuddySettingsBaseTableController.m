@interface AXBuddySettingsBaseTableController
- (AXBuddySettingsBaseTableController)init;
- (AXBuddySettingsBaseTableController)initWithCoder:(id)a3;
- (AXBuddySettingsBaseTableController)initWithNibName:(id)a3 bundle:(id)a4;
- (AXBuddySettingsBaseTableController)initWithStyle:(int64_t)a3;
- (BOOL)isItemAtIndexPathSelectable:(id)a3;
- (id)_baseTableControllerCommonInit;
- (id)tableSections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_registerCellClassesIfNecessary;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation AXBuddySettingsBaseTableController

- (id)_baseTableControllerCommonInit
{
  v3 = [(AXBuddySettingsBaseTableController *)self tableView];
  [v3 setEstimatedRowHeight:44.0];

  v4 = sub_7FA8();
  v5 = [(AXBuddySettingsBaseTableController *)self tableView];
  [v4 edgeInsetsForTable:v5];
  double v7 = v6;

  v8 = [(AXBuddySettingsBaseTableController *)self tableView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -v7);

  v9 = sub_7FA8();
  v10 = [v9 backgroundColor];
  v11 = [(AXBuddySettingsBaseTableController *)self tableView];
  [v11 setBackgroundColor:v10];

  return self;
}

- (AXBuddySettingsBaseTableController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXBuddySettingsBaseTableController;
  v4 = [(AXBuddySettingsBaseTableController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = [(AXBuddySettingsBaseTableController *)v4 _baseTableControllerCommonInit];

  return v5;
}

- (AXBuddySettingsBaseTableController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXBuddySettingsBaseTableController;
  v3 = [(AXBuddySettingsBaseTableController *)&v6 initWithCoder:a3];
  v4 = [(AXBuddySettingsBaseTableController *)v3 _baseTableControllerCommonInit];

  return v4;
}

- (AXBuddySettingsBaseTableController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AXBuddySettingsBaseTableController;
  v3 = [(AXBuddySettingsBaseTableController *)&v6 initWithStyle:a3];
  v4 = [(AXBuddySettingsBaseTableController *)v3 _baseTableControllerCommonInit];

  return v4;
}

- (AXBuddySettingsBaseTableController)init
{
  return [(AXBuddySettingsBaseTableController *)self initWithStyle:1];
}

- (id)tableSections
{
  objc_opt_class();
  id result = (id)NSRequestConcreteImplementation();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(AXBuddySettingsBaseTableController *)self tableSections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(AXBuddySettingsBaseTableController *)self tableSections];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];

  objc_super v7 = [v6 subitems];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (void)_registerCellClassesIfNecessary
{
  if (!self->_registeredCellClasses)
  {
    self->_registeredCellClasses = 1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(AXBuddySettingsBaseTableController *)self tableSections];
    id v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v21;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(obj);
          }
          objc_super v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v8 = [v7 subitems];
          id v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v17;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
                v14 = [(AXBuddySettingsBaseTableController *)self tableView];
                [v13 registerCellClassWithTableView:v14];
              }
              id v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v10);
          }
        }
        id v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v4);
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AXBuddySettingsBaseTableController *)self _registerCellClassesIfNecessary];
  id v8 = [(AXBuddySettingsBaseTableController *)self tableSections];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  id v10 = [v9 subitems];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

  v12 = [v11 representativeCellForIndexPath:v6 inTableView:v7];

  LIIconContinuousCornerRadiusForVariant();
  double v14 = v13;
  v15 = [v12 imageView];
  [v15 _setContinuousCornerRadius:v14];

  long long v16 = [v12 imageView];
  [v16 setClipsToBounds:1];

  return v12;
}

- (BOOL)isItemAtIndexPathSelectable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXBuddySettingsBaseTableController *)self tableSections];
  id v6 = objc_msgSend((id)v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  id v7 = [v6 subitems];
  id v8 = [v4 row];

  id v9 = [v7 objectAtIndexedSubscript:v8];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & 1;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(AXBuddySettingsBaseTableController *)self isItemAtIndexPathSelectable:v5]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v14 = a4;
  id v5 = [(AXBuddySettingsBaseTableController *)self tableView];
  [v5 deselectRowAtIndexPath:v14 animated:1];

  if (![(AXBuddySettingsBaseTableController *)self isItemAtIndexPathSelectable:v14]) {
    _AXAssert();
  }
  if ([(AXBuddySettingsBaseTableController *)self isItemAtIndexPathSelectable:v14])
  {
    id v6 = [(AXBuddySettingsBaseTableController *)self tableSections];
    id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v14, "section"));
    id v8 = [v7 subitems];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v14, "row"));

    id v10 = [v9 viewControllerInstantiator];
    uint64_t v11 = v10[2]();

    if (v11)
    {
      v12 = [v9 name];
      [v11 setTitle:v12];

      double v13 = [(AXBuddySettingsBaseTableController *)self navigationController];
      [v13 pushViewController:v11 animated:1];
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(AXBuddySettingsBaseTableController *)self tableSections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 name];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = [(AXBuddySettingsBaseTableController *)self tableSections];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 footerText];

  return v7;
}

@end