@interface AXNamedItemsListController
- (AXNamedItemsListController)init;
- (BOOL)_isNamedItemSpecifierAtIndexPath:(id)a3 tableView:(id)a4;
- (BOOL)_shouldShowEditButton;
- (BOOL)isNamedItemSpecifier:(id)a3;
- (BOOL)shouldAllowSelection;
- (BOOL)shouldIgnoreNextSettingsUpdate;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (SEL)settingsGetter;
- (SEL)settingsSetter;
- (id)_itemName:(id)a3;
- (id)cachedResults;
- (id)nameForItem:(id)a3;
- (id)namedItemForSpecifier:(id)a3;
- (id)namedItemSpecifiers;
- (id)namedItems;
- (id)setName:(id)a3 forItem:(id)a4;
- (id)specifiers;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)valueInSettings;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_saveItems;
- (void)_setItemName:(id)a3 specifier:(id)a4;
- (void)_updateEditButton;
- (void)_updateIndexesOnSpecifiers;
- (void)handleExternalSettingsChange;
- (void)setCachedResults:(id)a3;
- (void)setSettingsGetter:(SEL)a3;
- (void)setShouldIgnoreNextSettingsUpdate:(BOOL)a3;
- (void)setValueInSettings:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXNamedItemsListController

- (AXNamedItemsListController)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXNamedItemsListController;
  v2 = [(AXNamedItemsListController *)&v9 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    if ([(AXNamedItemsListController *)v2 settingsGetter])
    {
      v3 = +[AXSettings sharedInstance];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = __34__AXNamedItemsListController_init__block_invoke;
      v5[3] = &unk_208BB8;
      objc_copyWeak(&v7, &location);
      v6 = v2;
      objc_msgSend(v3, "registerUpdateBlock:forRetrieveSelector:withListener:", v5, -[AXNamedItemsListController settingsGetter](v6, "settingsGetter"), v6);

      objc_destroyWeak(&v7);
    }
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__AXNamedItemsListController_init__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained shouldIgnoreNextSettingsUpdate] & 1) == 0)
  {
    v3 = [*(id *)(a1 + 32) cachedResults];
    v4 = [*(id *)(a1 + 32) valueInSettings];
    unsigned __int8 v5 = [v3 isEqual:v4];

    if (v5) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained handleExternalSettingsChange];
  }
}

- (void)setSettingsGetter:(SEL)a3
{
  if (a3) {
    v4 = a3;
  }
  else {
    v4 = 0;
  }
  self->_settingsGetter = v4;
  id v5 = [(AXNamedItemsListController *)self valueInSettings];
  [(AXNamedItemsListController *)self setCachedResults:v5];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(AXNamedItemsListController *)self namedItemSpecifiers];
    v6 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v5;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXNamedItemsListController;
  [(AXNamedItemsListController *)&v4 viewWillAppear:a3];
  if (![(AXNamedItemsListController *)self settingsGetter]) {
    [(AXNamedItemsListController *)self handleExternalSettingsChange];
  }
  [(AXNamedItemsListController *)self _updateEditButton];
}

- (SEL)settingsGetter
{
  return 0;
}

- (SEL)settingsSetter
{
  return 0;
}

- (id)valueInSettings
{
  if ([(AXNamedItemsListController *)self settingsGetter])
  {
    uint64_t v3 = +[AXSettings sharedInstance];
    objc_super v4 = objc_msgSend(v3, "performSelector:", -[AXNamedItemsListController settingsGetter](self, "settingsGetter"));
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (void)setValueInSettings:(id)a3
{
  id v4 = a3;
  id v5 = +[AXSettings sharedInstance];
  objc_msgSend(v5, "performSelector:withObject:", -[AXNamedItemsListController settingsSetter](self, "settingsSetter"), v4);
}

- (void)handleExternalSettingsChange
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table], "visibleCells", 0);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v9 = [v8 specifier];
        if ([(AXNamedItemsListController *)self isNamedItemSpecifier:v9])
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            continue;
          }
          objc_super v9 = [v8 nameTextField];
          [v9 resignFirstResponder];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  namedItems = self->_namedItems;
  self->_namedItems = 0;

  [(AXNamedItemsListController *)self reloadSpecifiers];
  [(AXNamedItemsListController *)self _updateEditButton];
  v12 = [(AXNamedItemsListController *)self valueInSettings];
  [(AXNamedItemsListController *)self setCachedResults:v12];
}

- (BOOL)shouldAllowSelection
{
  return 0;
}

- (id)namedItems
{
  return self->_namedItems;
}

- (id)namedItemSpecifiers
{
  id v4 = +[NSMutableArray array];
  AXPerformBlockSynchronouslyOnMainThread();
  id v2 = v4;

  return v2;
}

void __49__AXNamedItemsListController_namedItemSpecifiers__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 184))
  {
    id v2 = +[AXSettings sharedInstance];
    id v3 = objc_msgSend(objc_msgSend(v2, "performSelector:", objc_msgSend(*(id *)(a1 + 32), "settingsGetter")), "mutableCopy");
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 184);
    *(void *)(v4 + 184) = v3;

    if (!*(void *)(*(void *)(a1 + 32) + 184)) {
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) settingsGetter]);
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 184);
      _AXAssert();
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_6:
      id v6 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 184);
      *(void *)(v7 + 184) = v6;
    }
  }
  objc_super v9 = (char *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "count", v18, v19);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    uint64_t v12 = PSCellClassKey;
    uint64_t v13 = AXShouldDisableTextFieldWhenNotEditingKey;
    uint64_t v14 = AXShouldAllowSelectionKey;
    do
    {
      long long v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:*(void *)(a1 + 32) set:"_setItemName:specifier:" get:"_itemName:" detail:0 cell:4 edit:0];
      [v15 setProperty:objc_opt_class() forKey:v12];
      long long v16 = +[NSNumber numberWithUnsignedInteger:v11];
      [v15 setProperty:v16 forKey:@"NamedItemIndex"];

      [v15 setProperty:&__kCFBooleanTrue forKey:v13];
      v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) shouldAllowSelection]);
      [v15 setProperty:v17 forKey:v14];

      [*(id *)(a1 + 40) addObject:v15];
      ++v11;
    }
    while (v10 != v11);
  }
}

- (BOOL)isNamedItemSpecifier:(id)a3
{
  id v3 = [a3 propertyForKey:@"NamedItemIndex"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)namedItemForSpecifier:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"NamedItemIndex"];
  id v5 = v4;
  if (v4)
  {
    id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_namedItems, "objectAtIndexedSubscript:", [v4 unsignedIntegerValue]);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowEditButton
{
  return [(NSMutableArray *)self->_namedItems count] != 0;
}

- (void)_updateEditButton
{
  unsigned int v3 = [(AXNamedItemsListController *)self _shouldShowEditButton];
  id v5 = [(AXNamedItemsListController *)self navigationItem];
  if (v3)
  {
    BOOL v4 = [(AXNamedItemsListController *)self editButtonItem];
    [v5 setRightBarButtonItem:v4];
  }
  else
  {
    [v5 setRightBarButtonItem:0];
  }
}

- (void)_setItemName:(id)a3 specifier:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v8 = [v18 stringByTrimmingCharactersInSet:v7];
  id v9 = [v8 length];

  if (!v9)
  {
    uint64_t v14 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__table];
    long long v15 = [(AXNamedItemsListController *)self indexPathForSpecifier:v6];

    uint64_t v12 = [v14 cellForRowAtIndexPath:v15];

    [v12 updateText];
LABEL_9:

    goto LABEL_10;
  }
  v10 = [v6 propertyForKey:@"NamedItemIndex"];

  id v11 = [v10 unsignedIntegerValue];
  if (v11 >= [(NSMutableArray *)self->_namedItems count])
  {
    id v16 = v11;
    namedItems = self->_namedItems;
    _AXAssert();
  }
  if (v11 < [(NSMutableArray *)self->_namedItems count])
  {
    uint64_t v12 = [(NSMutableArray *)self->_namedItems objectAtIndexedSubscript:v11];
    uint64_t v13 = [(AXNamedItemsListController *)self setName:v18 forItem:v12];
    if (v13 != v12) {
      [(NSMutableArray *)self->_namedItems replaceObjectAtIndex:v11 withObject:v13];
    }
    [(AXNamedItemsListController *)self _saveItems];

    goto LABEL_9;
  }
LABEL_10:
}

- (id)_itemName:(id)a3
{
  BOOL v4 = [a3 propertyForKey:@"NamedItemIndex"];
  id v5 = [v4 unsignedIntegerValue];

  id v6 = [(NSMutableArray *)self->_namedItems objectAtIndexedSubscript:v5];
  uint64_t v7 = [(AXNamedItemsListController *)self nameForItem:v6];

  return v7;
}

- (void)_updateIndexesOnSpecifiers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (-[AXNamedItemsListController isNamedItemSpecifier:](self, "isNamedItemSpecifier:", v9, (void)v11))
        {
          v10 = +[NSNumber numberWithUnsignedInteger:v6];
          [v9 setProperty:v10 forKey:@"NamedItemIndex"];

          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_saveItems
{
  [(AXNamedItemsListController *)self setShouldIgnoreNextSettingsUpdate:1];
  [(AXNamedItemsListController *)self setValueInSettings:self->_namedItems];
  [(AXNamedItemsListController *)self didSaveItems];

  [(AXNamedItemsListController *)self setShouldIgnoreNextSettingsUpdate:0];
}

- (BOOL)_isNamedItemSpecifierAtIndexPath:(id)a3 tableView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 section];
  if ((uint64_t)v8 >= (uint64_t)[v7 numberOfSections]
    || (id v9 = [v6 row],
        (uint64_t)v9 >= (uint64_t)objc_msgSend(v7, "numberOfRowsInSection:", objc_msgSend(v6, "section"))))
  {
    BOOL v11 = 0;
  }
  else
  {
    v10 = [(AXNamedItemsListController *)self specifierAtIndex:[(AXNamedItemsListController *)self indexForIndexPath:v6]];
    BOOL v11 = [(AXNamedItemsListController *)self isNamedItemSpecifier:v10];
  }
  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return [(AXNamedItemsListController *)self _isNamedItemSpecifierAtIndexPath:a4 tableView:a3];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  BOOL v5 = [(AXNamedItemsListController *)self _isNamedItemSpecifierAtIndexPath:a4 tableView:a3];
  if (v5) {
    LOBYTE(v5) = (unint64_t)[(NSMutableArray *)self->_namedItems count] > 1;
  }
  return v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v20 = [(AXNamedItemsListController *)self tableView:a3 cellForRowAtIndexPath:a5];
    [v20 endEditing:1];
    id v7 = [v20 specifier];
    if ([(AXNamedItemsListController *)self isNamedItemSpecifier:v7])
    {
      id v8 = [v7 propertyForKey:@"NamedItemIndex"];
      id v9 = [v8 unsignedIntegerValue];

      [(NSMutableArray *)self->_namedItems removeObjectAtIndex:v9];
      v10 = (char *)[(AXNamedItemsListController *)self indexOfSpecifier:v7];
      uint64_t v11 = OBJC_IVAR___PSListController__specifiers;
      long long v12 = (char *)[*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] count];
      long long v13 = v10 + 1;
      if (v13 < v12)
      {
        long long v14 = v12;
        do
        {
          long long v15 = [*(id *)&self->AXUISettingsBaseListController_opaque[v11] objectAtIndexedSubscript:v13];
          if ([(AXNamedItemsListController *)self isNamedItemSpecifier:v15])
          {
            id v16 = [v15 propertyForKey:@"NamedItemIndex"];
            v17 = (char *)[v16 unsignedIntegerValue];

            if (!v17) {
              _AXAssert();
            }
            id v18 = +[NSNumber numberWithUnsignedInteger:v17 - 1];
            [v15 setProperty:v18 forKey:@"NamedItemIndex"];
          }
          ++v13;
        }
        while (v14 != v13);
      }
      [(AXNamedItemsListController *)self beginUpdates];
      [(AXNamedItemsListController *)self removeSpecifier:v7 animated:1];
      [(AXNamedItemsListController *)self endUpdates];
      [(AXNamedItemsListController *)self _saveItems];
      if (![(AXNamedItemsListController *)self _shouldShowEditButton])
      {
        [(AXNamedItemsListController *)self setEditing:0 animated:1];
        uint64_t v19 = [(AXNamedItemsListController *)self navigationItem];
        [v19 setRightBarButtonItem:0 animated:1];
      }
    }
  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = [(AXNamedItemsListController *)self indexForIndexPath:a4];
  id v20 = [(AXNamedItemsListController *)self specifierAtIndex:v8];
  id v9 = [v20 propertyForKey:@"NamedItemIndex"];
  id v10 = [v9 unsignedIntegerValue];

  id v11 = [(AXNamedItemsListController *)self indexForIndexPath:v7];
  long long v12 = [(AXNamedItemsListController *)self specifierAtIndex:v11];
  long long v13 = [v12 propertyForKey:@"NamedItemIndex"];
  id v14 = [v13 unsignedIntegerValue];

  long long v15 = [(NSMutableArray *)self->_namedItems objectAtIndexedSubscript:v10];
  [(NSMutableArray *)self->_namedItems removeObjectAtIndex:v10];
  [(NSMutableArray *)self->_namedItems insertObject:v15 atIndex:v14];
  uint64_t v16 = OBJC_IVAR___PSListController__specifiers;
  id v17 = [*(id *)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers] mutableCopy];
  id v18 = [*(id *)&self->AXUISettingsBaseListController_opaque[v16] objectAtIndexedSubscript:v8];
  [v17 removeObjectAtIndex:v8];
  [v17 insertObject:v18 atIndex:v11];
  uint64_t v19 = *(void **)&self->AXUISettingsBaseListController_opaque[v16];
  *(void *)&self->AXUISettingsBaseListController_opaque[v16] = v17;

  [(AXNamedItemsListController *)self _updateIndexesOnSpecifiers];
  [(AXNamedItemsListController *)self _saveItems];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AXNamedItemsListController;
  [(AXNamedItemsListController *)&v4 tableView:a3 didSelectRowAtIndexPath:a4];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(AXNamedItemsListController *)self _isNamedItemSpecifierAtIndexPath:a4 tableView:a3];
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (![(AXNamedItemsListController *)self _isNamedItemSpecifierAtIndexPath:v9 tableView:a3])
  {
    id v10 = v8;

    id v9 = v10;
  }

  return v9;
}

- (BOOL)shouldIgnoreNextSettingsUpdate
{
  return self->_shouldIgnoreNextSettingsUpdate;
}

- (void)setShouldIgnoreNextSettingsUpdate:(BOOL)a3
{
  self->_shouldIgnoreNextSettingsUpdate = a3;
}

- (id)cachedResults
{
  return self->_cachedResults;
}

- (void)setCachedResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedResults, 0);

  objc_storeStrong((id *)&self->_namedItems, 0);
}

- (id)nameForItem:(id)a3
{
  return 0;
}

- (id)setName:(id)a3 forItem:(id)a4
{
  return 0;
}

@end