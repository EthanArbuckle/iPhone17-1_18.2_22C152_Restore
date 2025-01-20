@interface TPSCellularNetworkListItemsController
- (BOOL)shouldReloadSpecifiersOnResume;
- (NSArray)networkSpecifiers;
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCellularNetworkController)cellularNetworkController;
- (id)mainSwitchOn:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 networkItemCellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 networkSelectionModeForRowAtIndexPath:(id)a4;
- (int64_t)networkSelectionMode;
- (void)handleTPSCellularNetworkControllerNetworkItemsDidChangeNotification:(id)a3;
- (void)handleTPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification:(id)a3;
- (void)handleTPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification:(id)a3;
- (void)listItemSelected:(id)a3;
- (void)removeNetworkSpecifiers;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
- (void)setMainSwitchSpecifier:(id)a3;
- (void)setNetworkSelectionMode:(int64_t)a3;
- (void)setNetworkSpecifiers:(id)a3;
@end

@implementation TPSCellularNetworkListItemsController

- (TPSCellularNetworkController)cellularNetworkController
{
  cellularNetworkController = self->_cellularNetworkController;
  if (!cellularNetworkController)
  {
    v4 = [TPSCellularNetworkController alloc];
    v5 = [(TPSCellularNetworkListItemsController *)self subscriptionContext];
    v6 = [(TPSCellularNetworkController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_cellularNetworkController;
    self->_cellularNetworkController = v6;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"handleTPSCellularNetworkControllerNetworkItemsDidChangeNotification:" name:@"TPSCellularNetworkControllerNetworkItemsDidChangeNotification" object:self->_cellularNetworkController];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"handleTPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification:" name:@"TPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification" object:self->_cellularNetworkController];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"handleTPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification:" name:@"TPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification" object:self->_cellularNetworkController];

    cellularNetworkController = self->_cellularNetworkController;
  }

  return cellularNetworkController;
}

- (int64_t)networkSelectionMode
{
  int64_t result = self->_networkSelectionMode;
  if (!result)
  {
    v4 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
    self->_networkSelectionMode = (int64_t)[v4 networkSelectionMode];

    return self->_networkSelectionMode;
  }
  return result;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->TPSListItemsController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = [(TPSCellularNetworkListItemsController *)self mainSwitchSpecifier];
    [v5 addObject:v6];

    if ((char *)[(TPSCellularNetworkListItemsController *)self networkSelectionMode] == (char *)&dword_0 + 2)
    {
      v7 = [(TPSCellularNetworkListItemsController *)self networkSpecifiers];
      if (v7) {
        [v5 addObjectsFromArray:v7];
      }
    }
    id v8 = [v5 copy];
    v9 = *(void **)&self->TPSListItemsController_opaque[v3];
    *(void *)&self->TPSListItemsController_opaque[v3] = v8;

    v4 = *(void **)&self->TPSListItemsController_opaque[v3];
  }

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (char *)[v7 section];
  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v9 = [(TPSCellularNetworkListItemsController *)self tableView:v6 networkItemCellForRowAtIndexPath:v7];
    goto LABEL_5;
  }
  if (!v8)
  {
    uint64_t v9 = [(TPSCellularNetworkListItemsController *)self tableView:v6 networkSelectionModeForRowAtIndexPath:v7];
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (id)tableView:(id)a3 networkItemCellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPSCellularNetworkListItemsController;
  id v7 = [(TPSCellularNetworkListItemsController *)&v14 tableView:a3 cellForRowAtIndexPath:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
    uint64_t v9 = objc_msgSend(v8, "networkItemAtIndex:", objc_msgSend(v6, "row"));

    if (v9)
    {
      v10 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
      v11 = [v10 selectedNetworkItem];
      id v12 = [v11 isEqualToCellularNetworkItem:v9];
    }
    else
    {
      id v12 = 0;
    }
    [v7 setChecked:v12];
  }

  return v7;
}

- (id)tableView:(id)a3 networkSelectionModeForRowAtIndexPath:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)TPSCellularNetworkListItemsController;
  v5 = [(TPSCellularNetworkListItemsController *)&v24 tableView:a3 cellForRowAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 specifier];
    id v8 = [(TPSCellularNetworkListItemsController *)self mainSwitchSpecifier];

    if (v7 != v8)
    {
LABEL_22:

      goto LABEL_23;
    }
    int64_t v9 = [(TPSCellularNetworkListItemsController *)self networkSelectionMode];
    if (v9 == 2)
    {
      id v12 = [(TPSCellularNetworkListItemsController *)self networkSpecifiers];

      v10 = TPSCellularNetworkLog();
      BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v12)
      {
        if (!v13)
        {
LABEL_19:
          uint64_t v15 = 1;
          goto LABEL_20;
        }
        *(_WORD *)v23 = 0;
        v11 = "Displaying the loading indicator; network selection mode is manual but network list is empty.";
LABEL_18:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v11, v23, 2u);
        goto LABEL_19;
      }
      if (v13)
      {
        *(_WORD *)v23 = 0;
        objc_super v14 = "Hiding the loading indicator; network selection mode is manual and network list is not empty.";
LABEL_13:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v14, v23, 2u);
      }
    }
    else
    {
      if (v9 != 1)
      {
        if (v9)
        {
          uint64_t v15 = 0;
LABEL_21:
          id v16 = v6;
          [v16 setLoading:v15];
          v17 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
          id v18 = [v17 isNetworkSelectionEnabled];
          v19 = [v16 control];

          [v19 setEnabled:v18];
          v20 = [v7 propertyForKey:PSControlKey];
          v21 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
          objc_msgSend(v20, "setEnabled:", objc_msgSend(v21, "isNetworkSelectionEnabled"));

          goto LABEL_22;
        }
        v10 = TPSCellularNetworkLog();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_WORD *)v23 = 0;
        v11 = "Displaying the loading indicator; network selection mode is unknown.";
        goto LABEL_18;
      }
      v10 = TPSCellularNetworkLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        objc_super v14 = "Hiding the loading indicator; network selection mode is automatic.";
        goto LABEL_13;
      }
    }
    uint64_t v15 = 0;
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:

  return v5;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TPSCellularNetworkListItemsController;
  [(TPSCellularNetworkListItemsController *)&v7 listItemSelected:v4];
  v5 = TPSCellularNetworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "List item selected at index path %@", buf, 0xCu);
  }

  if ([v4 section] == (char *)&dword_0 + 1)
  {
    id v6 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
    objc_msgSend(v6, "selectNetworkItemAtIndex:", objc_msgSend(v4, "row"));
  }
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    id v4 = +[TPSCellularNetworkStrings localizedStringForKey:@"MAIN_SWITCH_SPECIFIER_TITLE"];
    v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setMainSwitchOn:specifier:" get:"mainSwitchOn:" detail:0 cell:6 edit:0];
    id v6 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v5;

    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }

  return mainSwitchSpecifier;
}

- (id)mainSwitchOn:(id)a3
{
  BOOL v3 = (char *)[(TPSCellularNetworkListItemsController *)self networkSelectionMode] != (char *)&dword_0 + 2;

  return +[NSNumber numberWithBool:v3];
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  id v12 = a3;
  uint64_t v6 = PSControlKey;
  id v7 = a4;
  id v8 = [v7 propertyForKey:v6];
  objc_msgSend(v8, "setOn:animated:", objc_msgSend(v12, "BOOLValue"), 1);
  id v9 = [(TPSCellularNetworkListItemsController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v9 setLoading:1];
  }
  if ([v12 BOOLValue]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  [(TPSCellularNetworkListItemsController *)self setNetworkSelectionMode:v10];
  v11 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
  [v11 selectNetworkSelectionMode:v10];
}

- (NSArray)networkSpecifiers
{
  networkSpecifiers = self->_networkSpecifiers;
  if (!networkSpecifiers)
  {
    id v4 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
    v5 = [v4 networkItems];

    if (v5)
    {
      uint64_t v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v5 count] + 1);
      id v7 = +[PSSpecifier emptyGroupSpecifier];
      [v6 addObject:v7];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v18 = v5;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          id v12 = 0;
          do
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            BOOL v13 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v12) localizedName];
            objc_super v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:3 edit:0];

            [v6 addObject:v14];
            id v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      uint64_t v15 = (NSArray *)[v6 copy];
      id v16 = self->_networkSpecifiers;
      self->_networkSpecifiers = v15;

      v5 = v18;
    }

    networkSpecifiers = self->_networkSpecifiers;
  }

  return networkSpecifiers;
}

- (void)removeNetworkSpecifiers
{
  id v3 = [(TPSCellularNetworkListItemsController *)self networkSpecifiers];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    [(TPSCellularNetworkListItemsController *)self removeContiguousSpecifiers:v3];
    id v3 = [(TPSCellularNetworkListItemsController *)self setNetworkSpecifiers:0];
    id v4 = v5;
  }

  _objc_release_x1(v3, v4);
}

- (void)handleTPSCellularNetworkControllerNetworkItemsDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = TPSCellularNetworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v7, 0x16u);
  }
  [(TPSCellularNetworkListItemsController *)self setNetworkSpecifiers:0];
  [(TPSCellularNetworkListItemsController *)self reloadSpecifiers];
}

- (void)handleTPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = TPSCellularNetworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = (id)objc_opt_class();
    __int16 v11 = 2112;
    id v12 = v4;
    id v6 = v10;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v9, 0x16u);
  }
  int v7 = [(TPSCellularNetworkListItemsController *)self cellularNetworkController];
  id v8 = [v7 networkSelectionMode];

  if ((id)[(TPSCellularNetworkListItemsController *)self networkSelectionMode] != v8)
  {
    [(TPSCellularNetworkListItemsController *)self setNetworkSelectionMode:v8];
    [(TPSCellularNetworkListItemsController *)self reloadSpecifiers];
  }
}

- (void)handleTPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = TPSCellularNetworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@.", (uint8_t *)&v7, 0x16u);
  }
  [(TPSCellularNetworkListItemsController *)self reloadSpecifiers];
}

- (void)setNetworkSpecifiers:(id)a3
{
}

- (void)setNetworkSelectionMode:(int64_t)a3
{
  self->_networkSelectionMode = a3;
}

- (void)setMainSwitchSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_networkSpecifiers, 0);

  objc_storeStrong((id *)&self->_cellularNetworkController, 0);
}

@end