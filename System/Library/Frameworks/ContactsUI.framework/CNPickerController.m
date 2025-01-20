@interface CNPickerController
- (BOOL)allowsCustomItems;
- (BOOL)allowsDiscoveredItems;
- (BOOL)isAddCustomItemIndexPath:(id)a3;
- (BOOL)isSearchControllerActive;
- (BOOL)isSearching;
- (BOOL)isSupplementalDisclosureItemIndexPath:(id)a3;
- (BOOL)searchIncludesSupplementalItems;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CNPickerController)initWithStyle:(int64_t)a3;
- (CNPickerControllerDelegate)delegate;
- (NSArray)builtinItems;
- (NSArray)customItems;
- (NSArray)discoveredItems;
- (NSArray)filterTokens;
- (NSArray)filteredBuiltinItems;
- (NSArray)filteredCustomItems;
- (NSArray)filteredDiscoveredItems;
- (NSArray)filteredPromotedItems;
- (NSArray)promotedItems;
- (NSArray)promotedSupplementalItems;
- (NSArray)remainderSupplementalItems;
- (NSArray)supplementalItems;
- (NSIndexPath)selectedIndexPath;
- (NSString)customEditingItem;
- (NSString)itemLocalizationKey;
- (UISearchController)searchController;
- (UITextField)customTextField;
- (id)_itemAtIndexPath:(id)a3 isPlaceholder:(BOOL *)a4;
- (id)_titleForPickerItem:(id)a3;
- (id)itemLocalizationBlock;
- (id)selectedItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForAddCustomItem;
- (id)titleForPickerItem:(id)a3;
- (id)titleForSupplementalItems;
- (int64_t)builtinItemsSection;
- (int64_t)customItemsSection;
- (int64_t)discoveredItemsSection;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)promotedItemsSection;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_indexForCustomItemAtIndexPath:(id)a3;
- (void)_updateRightButtonItem;
- (void)cancelPicker:(id)a3;
- (void)customLabelUpdated:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)doneInlineEditing:(id)a3;
- (void)donePicker:(id)a3;
- (void)picker:(id)a3 didDeleteItem:(id)a4;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)presentExtendedPicker;
- (void)setAllowsCustomItems:(BOOL)a3;
- (void)setAllowsDiscoveredItems:(BOOL)a3;
- (void)setBuiltinItems:(id)a3;
- (void)setBuiltinItemsSection:(int64_t)a3;
- (void)setCustomEditingItem:(id)a3;
- (void)setCustomItems:(id)a3;
- (void)setCustomItemsSection:(int64_t)a3;
- (void)setCustomTextField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoveredItems:(id)a3;
- (void)setDiscoveredItemsSection:(int64_t)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFilterTokens:(id)a3;
- (void)setFilteredBuiltinItems:(id)a3;
- (void)setFilteredCustomItems:(id)a3;
- (void)setFilteredDiscoveredItems:(id)a3;
- (void)setFilteredPromotedItems:(id)a3;
- (void)setItemLocalizationBlock:(id)a3;
- (void)setItemLocalizationKey:(id)a3;
- (void)setPromotedItems:(id)a3;
- (void)setPromotedItemsSection:(int64_t)a3;
- (void)setPromotedSupplementalItems:(id)a3;
- (void)setRemainderSupplementalItems:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchControllerActive:(BOOL)a3;
- (void)setSearchIncludesSupplementalItems:(BOOL)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedItem:(id)a3;
- (void)setSupplementalItems:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation CNPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredCustomItems, 0);
  objc_storeStrong((id *)&self->_filteredBuiltinItems, 0);
  objc_storeStrong((id *)&self->_filteredPromotedItems, 0);
  objc_storeStrong((id *)&self->_filteredDiscoveredItems, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_filterTokens, 0);
  objc_storeStrong((id *)&self->_customTextField, 0);
  objc_storeStrong((id *)&self->_customEditingItem, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong(&self->_itemLocalizationBlock, 0);
  objc_storeStrong((id *)&self->_itemLocalizationKey, 0);
  objc_storeStrong((id *)&self->_customItems, 0);
  objc_storeStrong((id *)&self->_remainderSupplementalItems, 0);
  objc_storeStrong((id *)&self->_promotedSupplementalItems, 0);
  objc_storeStrong((id *)&self->_supplementalItems, 0);
  objc_storeStrong((id *)&self->_builtinItems, 0);
  objc_storeStrong((id *)&self->_promotedItems, 0);
  objc_storeStrong((id *)&self->_discoveredItems, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_selectedItem, 0);
}

- (void)setSearchControllerActive:(BOOL)a3
{
  self->_searchControllerActive = a3;
}

- (BOOL)isSearchControllerActive
{
  return self->_searchControllerActive;
}

- (void)setFilteredCustomItems:(id)a3
{
}

- (void)setFilteredBuiltinItems:(id)a3
{
}

- (void)setFilteredPromotedItems:(id)a3
{
}

- (void)setFilteredDiscoveredItems:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (NSArray)filterTokens
{
  return self->_filterTokens;
}

- (void)setCustomTextField:(id)a3
{
}

- (UITextField)customTextField
{
  return self->_customTextField;
}

- (void)setCustomEditingItem:(id)a3
{
}

- (NSString)customEditingItem
{
  return self->_customEditingItem;
}

- (void)setCustomItemsSection:(int64_t)a3
{
  self->_customItemsSection = a3;
}

- (int64_t)customItemsSection
{
  return self->_customItemsSection;
}

- (void)setBuiltinItemsSection:(int64_t)a3
{
  self->_builtinItemsSection = a3;
}

- (int64_t)builtinItemsSection
{
  return self->_builtinItemsSection;
}

- (void)setPromotedItemsSection:(int64_t)a3
{
  self->_promotedItemsSection = a3;
}

- (int64_t)promotedItemsSection
{
  return self->_promotedItemsSection;
}

- (void)setDiscoveredItemsSection:(int64_t)a3
{
  self->_discoveredItemsSection = a3;
}

- (int64_t)discoveredItemsSection
{
  return self->_discoveredItemsSection;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setItemLocalizationBlock:(id)a3
{
}

- (id)itemLocalizationBlock
{
  return self->_itemLocalizationBlock;
}

- (void)setItemLocalizationKey:(id)a3
{
}

- (NSString)itemLocalizationKey
{
  return self->_itemLocalizationKey;
}

- (void)setAllowsCustomItems:(BOOL)a3
{
  self->_allowsCustomItems = a3;
}

- (BOOL)allowsCustomItems
{
  return self->_allowsCustomItems;
}

- (void)setCustomItems:(id)a3
{
}

- (NSArray)customItems
{
  return self->_customItems;
}

- (void)setSearchIncludesSupplementalItems:(BOOL)a3
{
  self->_searchIncludesSupplementalItems = a3;
}

- (BOOL)searchIncludesSupplementalItems
{
  return self->_searchIncludesSupplementalItems;
}

- (void)setRemainderSupplementalItems:(id)a3
{
}

- (NSArray)remainderSupplementalItems
{
  return self->_remainderSupplementalItems;
}

- (void)setPromotedSupplementalItems:(id)a3
{
}

- (NSArray)promotedSupplementalItems
{
  return self->_promotedSupplementalItems;
}

- (void)setSupplementalItems:(id)a3
{
}

- (NSArray)supplementalItems
{
  return self->_supplementalItems;
}

- (void)setBuiltinItems:(id)a3
{
}

- (NSArray)builtinItems
{
  return self->_builtinItems;
}

- (void)setPromotedItems:(id)a3
{
}

- (NSArray)promotedItems
{
  return self->_promotedItems;
}

- (void)setAllowsDiscoveredItems:(BOOL)a3
{
  self->_allowsDiscoveredItems = a3;
}

- (BOOL)allowsDiscoveredItems
{
  return self->_allowsDiscoveredItems;
}

- (void)setDiscoveredItems:(id)a3
{
}

- (NSArray)discoveredItems
{
  return self->_discoveredItems;
}

- (void)setDelegate:(id)a3
{
}

- (CNPickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPickerControllerDelegate *)WeakRetained;
}

- (void)setSelectedItem:(id)a3
{
}

- (id)selectedItem
{
  return self->_selectedItem;
}

- (NSArray)filteredBuiltinItems
{
  filteredBuiltinItems = self->_filteredBuiltinItems;
  if (filteredBuiltinItems)
  {
    v3 = filteredBuiltinItems;
  }
  else
  {
    v3 = [(CNPickerController *)self builtinItems];
  }

  return v3;
}

- (NSArray)filteredDiscoveredItems
{
  filteredDiscoveredItems = self->_filteredDiscoveredItems;
  if (filteredDiscoveredItems)
  {
    v3 = filteredDiscoveredItems;
  }
  else
  {
    v3 = [(CNPickerController *)self discoveredItems];
  }

  return v3;
}

- (NSArray)filteredPromotedItems
{
  filteredPromotedItems = self->_filteredPromotedItems;
  if (filteredPromotedItems)
  {
    v3 = filteredPromotedItems;
  }
  else
  {
    v3 = [(CNPickerController *)self promotedItems];
  }

  return v3;
}

- (NSArray)filteredCustomItems
{
  filteredCustomItems = self->_filteredCustomItems;
  if (filteredCustomItems)
  {
    v3 = filteredCustomItems;
  }
  else
  {
    v3 = [(CNPickerController *)self customItems];
  }

  return v3;
}

- (id)_itemAtIndexPath:(id)a3 isPlaceholder:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = [(CNPickerController *)self _indexForCustomItemAtIndexPath:v6];
  unint64_t v8 = v7;
  if (a4) {
    *a4 = 0;
  }
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(CNPickerController *)self filteredCustomItems];
    v12 = v11;
    uint64_t v13 = v8;
LABEL_13:
    v19 = [v11 objectAtIndexedSubscript:v13];

    goto LABEL_14;
  }
  uint64_t v9 = [v6 section];
  if (v9 == [(CNPickerController *)self discoveredItemsSection])
  {
    uint64_t v10 = [(CNPickerController *)self filteredDiscoveredItems];
LABEL_12:
    v12 = (void *)v10;
    uint64_t v13 = [v6 row];
    v11 = v12;
    goto LABEL_13;
  }
  uint64_t v14 = [v6 section];
  if (v14 == [(CNPickerController *)self promotedItemsSection])
  {
    uint64_t v10 = [(CNPickerController *)self filteredPromotedItems];
    goto LABEL_12;
  }
  uint64_t v15 = [v6 section];
  if (v15 == [(CNPickerController *)self builtinItemsSection])
  {
    unint64_t v16 = [v6 indexAtPosition:1];
    v17 = [(CNPickerController *)self filteredBuiltinItems];
    unint64_t v18 = [v17 count];

    if (v16 < v18)
    {
      uint64_t v10 = [(CNPickerController *)self filteredBuiltinItems];
      goto LABEL_12;
    }
    uint64_t v21 = [(CNPickerController *)self titleForSupplementalItems];
  }
  else
  {
    if (a4) {
      *a4 = 1;
    }
    uint64_t v21 = [(CNPickerController *)self titleForAddCustomItem];
  }
  v19 = (void *)v21;
LABEL_14:

  return v19;
}

- (unint64_t)_indexForCustomItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 row];
  if (([(CNPickerController *)self isEditing] & 1) == 0)
  {
    uint64_t v6 = [v4 section];
    if (v6 == [(CNPickerController *)self discoveredItemsSection]
      || (uint64_t v7 = [v4 section],
          v7 == [(CNPickerController *)self promotedItemsSection])
      || (uint64_t v8 = [v4 section], v8 == -[CNPickerController builtinItemsSection](self, "builtinItemsSection"))
      || !v5 && ![(CNPickerController *)self isSearching])
    {
      unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v5 -= [(CNPickerController *)self isSearching] ^ 1;
    }
  }

  return v5;
}

- (void)picker:(id)a3 didDeleteItem:(id)a4
{
  id v8 = a4;
  unint64_t v5 = [(CNPickerController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(CNPickerController *)self delegate];
    [v7 picker:self didDeleteItem:v8];
  }
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v5 = a4;
  id v6 = [(CNPickerController *)self delegate];
  [v6 picker:self didPickItem:v5];
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = [(CNPickerController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneInlineEditing_];
  id v5 = [(CNPickerController *)self navigationItem];
  [v5 setRightBarButtonItem:v6];
}

- (void)textFieldDidEndEditing:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F5A298];
  id v6 = [v4 text];
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [v4 text];
    v20[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v9 = [(CNPickerController *)self customItems];
    uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];
    [(CNPickerController *)self setCustomItems:v10];

    v11 = [(CNPickerController *)self tableView];
    v12 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    uint64_t v13 = [v11 cellForRowAtIndexPath:v12];

    uint64_t v14 = [(CNPickerController *)self customEditingItem];
    uint64_t v15 = [v13 textLabel];
    [v15 setText:v14];

    [v13 setTextFieldHidden:1];
    [v13 setPlaceholder:0];
    unint64_t v16 = [(CNPickerController *)self tableView];
    v17 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    v19 = v17;
    unint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v16 insertRowsAtIndexPaths:v18 withRowAnimation:100];
  }
  [(CNPickerController *)self _updateRightButtonItem];
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 removeObserver:self];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
  id v6 = [(CNPickerController *)self tableView];
  uint64_t v7 = [v6 cellForRowAtIndexPath:v5];

  [v7 endEditing];
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v4 text];
    [(CNPickerController *)self setSelectedItem:v7];
  }
  [v4 setDelegate:0];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];

  [(CNPickerController *)self donePicker:v4];
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithBarButtonSystemItem:0 target:self action:sel_donePicker_];
  uint64_t v6 = [(CNPickerController *)self navigationItem];
  [v6 setRightBarButtonItem:v8];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_customLabelUpdated_ name:*MEMORY[0x1E4FB3018] object:v5];
}

- (BOOL)isSearching
{
  if ([(CNPickerController *)self isSearchControllerActive]) {
    return 1;
  }
  id v4 = [(CNPickerController *)self filterTokens];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (void)setFilterTokens:(id)a3
{
  id v5 = a3;
  if ([v5 count]) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = [(NSArray *)self->_filterTokens count] == 0;
  }
  objc_storeStrong((id *)&self->_filterTokens, a3);
  if (![v5 count])
  {
    [(CNPickerController *)self setFilteredDiscoveredItems:0];
    [(CNPickerController *)self setFilteredCustomItems:0];
    [(CNPickerController *)self setFilteredBuiltinItems:0];
    [(CNPickerController *)self setFilteredPromotedItems:0];
    if (v6) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __38__CNPickerController_setFilterTokens___block_invoke;
  v26 = &unk_1E5498428;
  v27 = self;
  id v28 = v5;
  uint64_t v7 = (void (**)(void *, void *))_Block_copy(&v23);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(CNPickerController *)self searchIncludesSupplementalItems]&& ([(CNPickerController *)self supplementalItems], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA70];
    v11 = [(CNPickerController *)self supplementalItems];
    v12 = [v10 orderedSetWithArray:v11];

    uint64_t v13 = [(CNPickerController *)self supplementalItems];
    [v12 addObjectsFromArray:v13];

    uint64_t v14 = [v12 array];
    [v8 setArray:v14];
  }
  else
  {
    v12 = [(CNPickerController *)self builtinItems];
    [v8 setArray:v12];
  }

  uint64_t v15 = [(CNPickerController *)self discoveredItems];
  unint64_t v16 = v7[2](v7, v15);
  [(CNPickerController *)self setFilteredDiscoveredItems:v16];

  v17 = [(CNPickerController *)self customItems];
  unint64_t v18 = v7[2](v7, v17);
  [(CNPickerController *)self setFilteredCustomItems:v18];

  v19 = [(CNPickerController *)self promotedItems];
  v20 = v7[2](v7, v19);
  [(CNPickerController *)self setFilteredPromotedItems:v20];

  uint64_t v21 = v7[2](v7, v8);
  [(CNPickerController *)self setFilteredBuiltinItems:v21];

  if (!v6)
  {
LABEL_10:
    v22 = [(CNPickerController *)self tableView];
    [v22 reloadData];
  }
LABEL_11:
}

id __38__CNPickerController_setFilterTokens___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v2;
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v31 != v16)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * v3);
        uint64_t v19 = v3;
        id v5 = objc_msgSend(*(id *)(a1 + 32), "_titleForPickerItem:");
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v6 = *(id *)(a1 + 40);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v27 != v8) {
                objc_enumerationMutation(v6);
              }
              uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              uint64_t v22 = 0;
              uint64_t v23 = &v22;
              uint64_t v24 = 0x2020000000;
              char v25 = 0;
              uint64_t v11 = [v5 length];
              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v21[2] = __38__CNPickerController_setFilterTokens___block_invoke_2;
              v21[3] = &unk_1E5498400;
              v21[4] = v10;
              v21[5] = &v22;
              objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 3, v21);
              LODWORD(v10) = *((unsigned __int8 *)v23 + 24);
              _Block_object_dispose(&v22, 8);
              if (!v10)
              {

                goto LABEL_16;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }

        [v14 addObject:v18];
LABEL_16:

        uint64_t v3 = v19 + 1;
      }
      while (v19 + 1 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v17);
  }

  v12 = (void *)[v14 copy];

  return v12;
}

uint64_t __38__CNPickerController_setFilterTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = objc_msgSend(a2, "_cn_hasPrefix:", *(void *)(a1 + 32));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

- (void)didDismissSearchController:(id)a3
{
  id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if ([(CNPickerController *)self customItemsSection] != -1)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    if (![(CNPickerController *)self isAddCustomItemIndexPath:v4]) {
      [v11 addObject:v4];
    }
  }
  if ([(CNPickerController *)self builtinItemsSection] != -1)
  {
    id v5 = [(CNPickerController *)self supplementalItems];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v8 = [(CNPickerController *)self builtinItems];
      uint64_t v9 = objc_msgSend(v7, "indexPathForRow:inSection:", objc_msgSend(v8, "count"), -[CNPickerController builtinItemsSection](self, "builtinItemsSection"));

      [v11 addObject:v9];
    }
  }
  [(CNPickerController *)self setSearchControllerActive:0];
  uint64_t v10 = [(CNPickerController *)self tableView];
  [v10 insertRowsAtIndexPaths:v11 withRowAnimation:0];
}

- (void)willPresentSearchController:(id)a3
{
  if (![(CNPickerController *)self isSearching])
  {
    id v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    if ([(CNPickerController *)self customItemsSection] != -1)
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
      if ([(CNPickerController *)self isAddCustomItemIndexPath:v4]) {
        [v11 addObject:v4];
      }
    }
    if ([(CNPickerController *)self builtinItemsSection] != -1)
    {
      id v5 = [(CNPickerController *)self supplementalItems];
      uint64_t v6 = [v5 count];

      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v8 = [(CNPickerController *)self builtinItems];
        uint64_t v9 = objc_msgSend(v7, "indexPathForRow:inSection:", objc_msgSend(v8, "count"), -[CNPickerController builtinItemsSection](self, "builtinItemsSection"));

        [v11 addObject:v9];
      }
    }
    [(CNPickerController *)self setSearchControllerActive:1];
    uint64_t v10 = [(CNPickerController *)self tableView];
    [v10 deleteRowsAtIndexPaths:v11 withRowAnimation:0];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v4 = [a3 searchBar];
  id v5 = [v4 text];

  uint64_t v6 = [v5 length];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__CNPickerController_updateSearchResultsForSearchController___block_invoke;
  v9[3] = &unk_1E54983D8;
  id v10 = v7;
  id v8 = v7;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v9);
  [(CNPickerController *)self setFilterTokens:v8];
}

uint64_t __61__CNPickerController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  if (a4 == 1)
  {
    if ([(CNPickerController *)self isSearching]) {
      [(CNPickerController *)self filteredCustomItems];
    }
    else {
    id v8 = [(CNPickerController *)self customItems];
    }
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", -[CNPickerController _indexForCustomItemAtIndexPath:](self, "_indexForCustomItemAtIndexPath:", v7));
    [(CNPickerController *)self removeCustomItem:v9];
    uint64_t v10 = [(CNPickerController *)self selectedItem];
    if (v10)
    {
      id v11 = (void *)v10;
      v12 = [(CNPickerController *)self selectedItem];
      int v13 = [v12 isEqual:v9];

      if (v13) {
        [(CNPickerController *)self setSelectedItem:0];
      }
    }
    uint64_t v14 = [(CNPickerController *)self customItems];
    uint64_t v15 = (void *)[v14 mutableCopy];

    [v15 removeObject:v9];
    [(CNPickerController *)self setCustomItems:v15];
    if ([(CNPickerController *)self isSearching])
    {
      uint64_t v16 = [(CNPickerController *)self filteredCustomItems];
      uint64_t v17 = (void *)[v16 mutableCopy];

      [v17 removeObject:v9];
      [(CNPickerController *)self setFilteredCustomItems:v17];
    }
    uint64_t v18 = [(CNPickerController *)self tableView];
    v20[0] = v7;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v18 deleteRowsAtIndexPaths:v19 withRowAnimation:100];
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(CNPickerController *)self _indexForCustomItemAtIndexPath:a4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers")|| ([v14 backgroundColor], id v8 = objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E4FB1618], "clearColor"), v9 = objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "isEqual:", v9), v9, v8, v10))
  {
    id v11 = [(CNPickerController *)self tableView];
LABEL_7:
    v12 = v11;
    int v13 = [v11 backgroundColor];
    [v7 setBackgroundColor:v13];

    goto LABEL_8;
  }
  if (CNUIIsWatchCompanion() || CNUIIsActivity())
  {
    id v11 = [v7 backgroundView];
    goto LABEL_7;
  }
  v12 = +[CNUIColorRepository contactStyleDefaultBackgroundColor];
  [v7 setBackgroundColor:v12];
LABEL_8:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ([(CNPickerController *)self isSupplementalDisclosureItemIndexPath:v6])
  {
    [(CNPickerController *)self presentExtendedPicker];
  }
  else if ([(CNPickerController *)self isAddCustomItemIndexPath:v6])
  {
    id v7 = [v17 cellForRowAtIndexPath:v6];
    id v8 = [v7 textField];
    [v8 setDelegate:self];

    uint64_t v9 = [v7 textLabel];
    int v10 = [v9 textColor];
    id v11 = [v7 textField];
    [v11 setTextColor:v10];

    [v7 beginEditing];
    [v17 deselectRowAtIndexPath:v6 animated:1];
  }
  else
  {
    [(CNPickerController *)self setSelectedIndexPath:v6];
    v12 = [(CNPickerController *)self _itemAtIndexPath:v6 isPlaceholder:0];
    [(CNPickerController *)self setSelectedItem:v12];

    int v13 = [(CNPickerController *)self searchController];
    [v13 setActive:0];

    id v14 = [(CNPickerController *)self delegate];
    uint64_t v15 = [(CNPickerController *)self selectedItem];
    [v14 picker:self didPickItem:v15];

    uint64_t v16 = [(CNPickerController *)self selectedItem];
    [(CNPickerController *)self pickedItem:v16];

    [v17 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ABPickerItemCell"];
  id v8 = [v7 textLabel];
  [v8 setAdjustsFontSizeToFitWidth:1];

  uint64_t v9 = [v7 textLabel];
  [v9 setNumberOfLines:2];

  unsigned __int8 v21 = 0;
  int v10 = [(CNPickerController *)self _itemAtIndexPath:v6 isPlaceholder:&v21];
  id v11 = [(CNPickerController *)self _titleForPickerItem:v10];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  [v7 setPlaceholder:v21];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(CNPickerController *)self selectedItem],
        int v13 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v13,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v15 = [(CNPickerController *)self selectedItem];
    int v16 = objc_msgSend(v10, "_cn_caseInsensitiveIsEqual:", v15);
  }
  else
  {
    uint64_t v15 = [(CNPickerController *)self selectedItem];
    int v16 = [v10 isEqual:v15];
  }
  int v17 = v16;

  if ([(CNPickerController *)self isSupplementalDisclosureItemIndexPath:v6])
  {
    uint64_t v18 = v7;
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v18 = v7;
    if (v17)
    {
      [v7 setAccessoryType:3];
      [(CNPickerController *)self setSelectedIndexPath:v6];
      goto LABEL_11;
    }
    uint64_t v19 = 0;
  }
  [v18 setAccessoryType:v19];
LABEL_11:

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v6 = [(CNPickerController *)self isSearching];
  if ([(CNPickerController *)self isEditing])
  {
    id v7 = [(CNPickerController *)self customItems];
LABEL_7:
    id v8 = v7;
    int64_t v9 = [v7 count];
    goto LABEL_8;
  }
  if ([(CNPickerController *)self discoveredItemsSection] == a4)
  {
    id v7 = [(CNPickerController *)self filteredDiscoveredItems];
    goto LABEL_7;
  }
  if ([(CNPickerController *)self promotedItemsSection] == a4)
  {
    id v7 = [(CNPickerController *)self filteredPromotedItems];
    goto LABEL_7;
  }
  if ([(CNPickerController *)self builtinItemsSection] == a4)
  {
    id v11 = [(CNPickerController *)self supplementalItems];
    uint64_t v12 = [v11 count];

    id v8 = [(CNPickerController *)self filteredBuiltinItems];
    uint64_t v13 = [v8 count];
    LODWORD(v14) = !v6;
    if (v12) {
      uint64_t v14 = v14;
    }
    else {
      uint64_t v14 = 0;
    }
    int64_t v9 = v13 + v14;
  }
  else
  {
    id v8 = [(CNPickerController *)self filteredCustomItems];
    uint64_t v15 = [v8 count];
    int64_t v9 = v15 + ([(CNPickerController *)self isSearching] ^ 1);
  }
LABEL_8:

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  [(CNPickerController *)self setDiscoveredItemsSection:-1];
  [(CNPickerController *)self setBuiltinItemsSection:-1];
  [(CNPickerController *)self setPromotedItemsSection:-1];
  [(CNPickerController *)self setCustomItemsSection:-1];
  if ([(CNPickerController *)self isEditing]) {
    return 1;
  }
  if ([(CNPickerController *)self allowsDiscoveredItems])
  {
    [(CNPickerController *)self setDiscoveredItemsSection:0];
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v6 = [(CNPickerController *)self promotedItems];
  uint64_t v7 = [v6 count];

  if (v7) {
    [(CNPickerController *)self setPromotedItemsSection:v5++];
  }
  [(CNPickerController *)self setBuiltinItemsSection:v5];
  int64_t v4 = v5 + 1;
  if ([(CNPickerController *)self allowsCustomItems])
  {
    [(CNPickerController *)self setCustomItemsSection:v5 + 1];
    return v5 + 2;
  }
  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CNPickerController;
  [(CNPickerController *)&v13 setEditing:a3 animated:a4];
  BOOL v6 = [(CNPickerController *)self tableView];
  [v6 reloadData];
  if (a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(CNPickerController *)self searchController];
  }
  id v8 = [(CNPickerController *)self navigationItem];
  [v8 setSearchController:v7];

  if (!a3)
  {

    int64_t v9 = [v6 delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [v6 delegate];
      uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      [v11 tableView:v6 didEndEditingRowAtIndexPath:v12];
    }
  }
}

- (void)_updateRightButtonItem
{
  if ([(CNPickerController *)self allowsCustomItems]
    && ([(CNPickerController *)self customItems],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        v4))
  {
    id v6 = [(CNPickerController *)self editButtonItem];
    uint64_t v5 = [(CNPickerController *)self navigationItem];
    [v5 setRightBarButtonItem:v6];
  }
  else
  {
    id v6 = [(CNPickerController *)self navigationItem];
    [v6 setRightBarButtonItem:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)CNPickerController;
  [(CNPickerController *)&v33 viewWillAppear:a3];
  uint64_t v4 = [(CNPickerController *)self navigationController];
  uint64_t v5 = [v4 navigationBar];
  objc_msgSend(v5, "_cnui_applyContactStyle");

  id v6 = [(CNPickerController *)self tableView];
  objc_msgSend(v6, "_cnui_applyContactStyle");

  if ([(UIViewController *)self ab_shouldShowNavBarButtons])
  {
    uint64_t v7 = [(CNPickerController *)self navigationController];
    id v8 = [v7 viewControllers];
    uint64_t v9 = [v8 count];

    if (v9 == 1)
    {
      char v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPicker_];
      id v11 = [(CNPickerController *)self navigationItem];
      [v11 setLeftBarButtonItem:v10];
    }
  }
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    uint64_t v12 = +[CNUIColorRepository popoverBackgroundColor];
    objc_super v13 = [(CNPickerController *)self tableView];
    [v13 setBackgroundColor:v12];

    uint64_t v14 = [(CNPickerController *)self tableView];
    uint64_t v15 = [v14 backgroundColor];
    int v16 = [(CNPickerController *)self tableView];
    [v16 setSectionIndexBackgroundColor:v15];
  }
  if ([(CNPickerController *)self allowsCustomItems])
  {
    uint64_t v17 = [(CNPickerController *)self selectedItem];
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      uint64_t v19 = [(CNPickerController *)self discoveredItems];
      v20 = [(CNPickerController *)self selectedItem];
      if ([v19 containsObject:v20]) {
        goto LABEL_9;
      }
      unsigned __int8 v21 = [(CNPickerController *)self builtinItems];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __37__CNPickerController_viewWillAppear___block_invoke;
      v32[3] = &unk_1E549A598;
      v32[4] = self;
      if (objc_msgSend(v21, "_cn_any:", v32))
      {
        int v22 = 0;
      }
      else
      {
        uint64_t v23 = [(CNPickerController *)self promotedItems];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __37__CNPickerController_viewWillAppear___block_invoke_2;
        v31[3] = &unk_1E549A598;
        v31[4] = self;
        if (objc_msgSend(v23, "_cn_any:", v31))
        {
          int v22 = 0;
        }
        else
        {
          uint64_t v24 = [(CNPickerController *)self customItems];
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __37__CNPickerController_viewWillAppear___block_invoke_3;
          v30[3] = &unk_1E549A598;
          v30[4] = self;
          int v22 = objc_msgSend(v24, "_cn_any:", v30) ^ 1;
        }
      }

      if (v22)
      {
        char v25 = [(CNPickerController *)self supplementalItems];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __37__CNPickerController_viewWillAppear___block_invoke_4;
        v29[3] = &unk_1E549A598;
        v29[4] = self;
        int v26 = objc_msgSend(v25, "_cn_any:", v29);

        if (v26)
        {
          uint64_t v18 = [(CNPickerController *)self builtinItems];
          uint64_t v19 = [(CNPickerController *)self selectedItem];
          v20 = [v18 arrayByAddingObject:v19];
          [(CNPickerController *)self setBuiltinItems:v20];
        }
        else
        {
          long long v28 = [(CNPickerController *)self customItems];

          if (!v28)
          {
            uint64_t v18 = [(CNPickerController *)self selectedItem];
            v34[0] = v18;
            uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
            [(CNPickerController *)self setCustomItems:v19];
            goto LABEL_10;
          }
          uint64_t v18 = [(CNPickerController *)self customItems];
          uint64_t v19 = [(CNPickerController *)self selectedItem];
          v20 = [v18 arrayByAddingObject:v19];
          [(CNPickerController *)self setCustomItems:v20];
        }
LABEL_9:

LABEL_10:
      }
    }
  }
  if ([(UIViewController *)self ab_shouldShowNavBarButtons]) {
    [(CNPickerController *)self _updateRightButtonItem];
  }
  long long v27 = [(CNPickerController *)self tableView];
  [v27 reloadData];
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 selectedItem];
  uint64_t v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 selectedItem];
  uint64_t v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 selectedItem];
  uint64_t v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 selectedItem];
  uint64_t v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

- (BOOL)isSupplementalDisclosureItemIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == [(CNPickerController *)self builtinItemsSection])
  {
    unint64_t v6 = [v4 row];
    uint64_t v7 = [(CNPickerController *)self filteredBuiltinItems];
    BOOL v8 = v6 >= [v7 count];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isAddCustomItemIndexPath:(id)a3
{
  id v4 = a3;
  if ([(CNPickerController *)self allowsCustomItems]
    && (uint64_t v5 = [v4 section], v5 == -[CNPickerController customItemsSection](self, "customItemsSection"))
    && ![v4 row])
  {
    BOOL v6 = ![(CNPickerController *)self isSearchControllerActive];
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)customLabelUpdated:(id)a3
{
  id v4 = [a3 object];
  [(CNPickerController *)self setCustomTextField:v4];

  id v6 = [(CNPickerController *)self customTextField];
  uint64_t v5 = [v6 text];
  [(CNPickerController *)self setCustomEditingItem:v5];
}

- (void)presentExtendedPicker
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(CNPickerController *)self tableView];
  id v8 = (id)objc_msgSend(v3, "initWithStyle:", objc_msgSend(v4, "style"));

  [v8 setDelegate:self];
  uint64_t v5 = [(CNPickerController *)self remainderSupplementalItems];
  [v8 setBuiltinItems:v5];

  id v6 = [(CNPickerController *)self promotedSupplementalItems];
  [v8 setPromotedItems:v6];

  [v8 setAllowsCustomItems:0];
  uint64_t v7 = [(CNPickerController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)donePicker:(id)a3
{
  uint64_t v4 = [(CNPickerController *)self customEditingItem];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [(CNPickerController *)self customTextField];
    int v7 = [v6 isFirstResponder];

    if (v7)
    {
      id v8 = [(CNPickerController *)self customEditingItem];
      [(CNPickerController *)self setSelectedItem:v8];
    }
  }
  id v10 = [(CNPickerController *)self delegate];
  uint64_t v9 = [(CNPickerController *)self selectedItem];
  [v10 picker:self didPickItem:v9];
}

- (void)doneInlineEditing:(id)a3
{
  uint64_t v4 = [(CNPickerController *)self tableView];
  [v4 setEditing:0];

  [(CNPickerController *)self _updateRightButtonItem];
}

- (void)cancelPicker:(id)a3
{
  id v4 = [(CNPickerController *)self delegate];
  [v4 pickerDidCancel:self];
}

- (id)titleForSupplementalItems
{
  id v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"ALL_LABELS" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)titleForAddCustomItem
{
  id v2 = CNContactsUIBundle();
  id v3 = [v2 localizedStringForKey:@"ADD_CUSTOM_LABEL_BUTTON" value:&stru_1ED8AC728 table:@"Localized"];

  return v3;
}

- (id)titleForPickerItem:(id)a3
{
  id v3 = a3;
  if (_useSiriLocalization)
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      if (_useSiriLocalization)
      {
        id v10 = ABAddressBookBundle();
        id v11 = [v10 siriUILocalizedStringForKey:v3 table:@"Localized"];

        goto LABEL_7;
      }
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/OldFramework/Sources/ContactsUI_Internal.m", 126, 4, @"You tried to use Siri localization but SiriUI is not loaded.", v6, v7, v8, v9, v13);
    }
  }
  id v11 = [MEMORY[0x1E4F1B8F8] localizedStringForKey:v3];
LABEL_7:

  return v11;
}

- (id)_titleForPickerItem:(id)a3
{
  id v4 = a3;
  char v5 = [(CNPickerController *)self itemLocalizationBlock];

  if (v5)
  {
    uint64_t v6 = [(CNPickerController *)self itemLocalizationBlock];
    uint64_t v7 = ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    uint64_t v8 = [(CNPickerController *)self itemLocalizationKey];

    if (!v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 name];
      }
      else {
      uint64_t v7 = [(CNPickerController *)self titleForPickerItem:v4];
      }
      goto LABEL_6;
    }
    uint64_t v9 = NSString;
    id v10 = [(CNPickerController *)self itemLocalizationKey];
    uint64_t v6 = [v9 stringWithFormat:@"%@ %@", v4, v10];

    id v11 = CNContactsUIBundle();
    uint64_t v7 = [v11 localizedStringForKey:v6 value:v4 table:@"Localized"];
  }
LABEL_6:

  return v7;
}

- (CNPickerController)initWithStyle:(int64_t)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CNPickerController;
  id v3 = [(CNPickerController *)&v20 initWithStyle:a3];
  id v4 = v3;
  if (v3)
  {
    char v5 = [(CNPickerController *)v3 tableView];
    [v5 setDelegate:v4];
    [v5 setDataSource:v4];
    [v5 setKeyboardDismissMode:1];
    [v5 setRowHeight:*MEMORY[0x1E4FB2F28]];
    uint64_t v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v6 _scaledValueForValue:44.0];
    objc_msgSend(v5, "setEstimatedRowHeight:");

    [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"ABPickerItemCell"];
    uint64_t v7 = [(CNPickerController *)v4 navigationItem];
    [v7 setLargeTitleDisplayMode:2];

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    searchController = v4->_searchController;
    v4->_searchController = (UISearchController *)v8;

    id v10 = v4->_searchController;
    id v11 = [(CNPickerController *)v4 navigationItem];
    [v11 setSearchController:v10];

    uint64_t v12 = [(CNPickerController *)v4 navigationItem];
    uint64_t v13 = [v12 searchController];
    [v13 setSearchResultsUpdater:v4];

    uint64_t v14 = [(CNPickerController *)v4 navigationItem];
    uint64_t v15 = [v14 searchController];
    [v15 setDelegate:v4];

    int v16 = [(CNPickerController *)v4 navigationItem];
    uint64_t v17 = [v16 searchController];
    [v17 setObscuresBackgroundDuringPresentation:0];

    uint64_t v18 = [(CNPickerController *)v4 navigationItem];
    [v18 setPreferredSearchBarPlacement:2];

    v4->_allowsCustomItems = 1;
    v4->_searchIncludesSupplementalItems = 1;
  }
  return v4;
}

@end