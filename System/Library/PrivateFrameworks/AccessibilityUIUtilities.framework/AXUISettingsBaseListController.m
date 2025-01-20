@interface AXUISettingsBaseListController
- (BOOL)detailItemsHidden;
- (NSArray)detailItems;
- (id)cellForSpecifier:(id)a3;
- (id)cellForSpecifierID:(id)a3;
- (id)specifierForIndexPath:(id)a3;
- (id)specifierForKey:(id)a3;
- (id)specifiersByRemovingDetailItemsFromOriginalSpecifiers:(id)a3 ifHidden:(BOOL)a4;
- (void)setDetailItems:(id)a3;
- (void)setDetailItemsHidden:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)showController:(id)a3 withSpecifier:(id)a4;
- (void)updateTableCheckedSelection:(id)a3;
- (void)updateVisibleCellsWithCheckedSelection:(id)a3;
@end

@implementation AXUISettingsBaseListController

- (void)setDetailItemsHidden:(BOOL)a3
{
  if (self->_detailItemsHidden != a3)
  {
    BOOL v3 = a3;
    self->_detailItemsHidden = a3;
    id v5 = [(AXUISettingsBaseListController *)self detailItems];
    if (v3) {
      [(AXUISettingsBaseListController *)self removeContiguousSpecifiers:v5 animated:1];
    }
    else {
      [(AXUISettingsBaseListController *)self addSpecifiersFromArray:v5 animated:1];
    }
  }
}

- (id)specifiersByRemovingDetailItemsFromOriginalSpecifiers:(id)a3 ifHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  self->_detailItemsHidden = v4;
  if (v4)
  {
    id v8 = (id)[v6 mutableCopy];
    v9 = [(AXUISettingsBaseListController *)self detailItems];
    [v8 removeObjectsInArray:v9];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (id)specifierForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXUISettingsBaseListController *)self specifiers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4F931B0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "propertyForKey:", v9, (void)v16);
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AXUISettingsBaseListController;
  -[AXUISettingsBaseListController setEditing:animated:](&v7, sel_setEditing_animated_);
  [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) setEditing:v5 animated:v4];
}

- (void)updateTableCheckedSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (int)*MEMORY[0x1E4F92F10];
  id v11 = v4;
  uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "numberOfRowsInSection:", objc_msgSend(v4, "section"));
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", i, objc_msgSend(v11, "section"));
      v10 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) cellForRowAtIndexPath:v9];
      objc_msgSend(v10, "setChecked:", objc_msgSend(v9, "isEqual:", v11));
    }
  }
}

- (void)updateVisibleCellsWithCheckedSelection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = (int)*MEMORY[0x1E4F92F10];
  uint64_t v6 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v5), "indexPathsForVisibleRows", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v5) cellForRowAtIndexPath:v11];
        objc_msgSend(v12, "setChecked:", objc_msgSend(v4, "isEqual:", v11));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)cellForSpecifierID:(id)a3
{
  id v4 = [(AXUISettingsBaseListController *)self specifierForID:a3];
  uint64_t v5 = [(AXUISettingsBaseListController *)self cellForSpecifier:v4];

  return v5;
}

- (id)specifierForIndexPath:(id)a3
{
  uint64_t v4 = [(AXUISettingsBaseListController *)self indexForIndexPath:a3];
  return (id)[(AXUISettingsBaseListController *)self specifierAtIndex:v4];
}

- (id)cellForSpecifier:(id)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]);
  uint64_t v4 = [(AXUISettingsBaseListController *)self indexPathForSpecifier:a3];
  uint64_t v5 = [v3 cellForRowAtIndexPath:v4];

  return v5;
}

- (void)showController:(id)a3 withSpecifier:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [v8 setParentController:self];
  uint64_t v7 = [(AXUISettingsBaseListController *)self rootController];
  [v8 setRootController:v7];

  [v8 setSpecifier:v6];
  [(AXUISettingsSetupCapableListController *)self showController:v8 animate:1];
}

- (NSArray)detailItems
{
  return self->_detailItems;
}

- (void)setDetailItems:(id)a3
{
}

- (BOOL)detailItemsHidden
{
  return self->_detailItemsHidden;
}

- (void).cxx_destruct
{
}

@end