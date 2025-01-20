@interface CNLabelPickerController
- (CNPropertyGroupItem)item;
- (NSMutableArray)labelsToDeleteOnCommit;
- (id)initForPropertyItem:(id)a3;
- (id)titleForPickerItem:(id)a3;
- (void)pickedItem:(id)a3;
- (void)removeCustomItem:(id)a3;
- (void)setLabelsToDeleteOnCommit:(id)a3;
@end

@implementation CNLabelPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsToDeleteOnCommit, 0);

  objc_destroyWeak((id *)&self->_item);
}

- (void)setLabelsToDeleteOnCommit:(id)a3
{
}

- (NSMutableArray)labelsToDeleteOnCommit
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1232, 1);
}

- (CNPropertyGroupItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (CNPropertyGroupItem *)WeakRetained;
}

- (void)pickedItem:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = [(CNPickerController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(CNLabelPickerController *)self labelsToDeleteOnCommit];
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
        [MEMORY[0x1E4F1BA20] deleteCustomLabel:v11];
        if (v5)
        {
          v12 = [(CNPickerController *)self delegate];
          [v12 picker:self didDeleteItem:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)removeCustomItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CNLabelPickerController *)self labelsToDeleteOnCommit];
  [v5 addObject:v4];
}

- (id)titleForPickerItem:(id)a3
{
  return (id)[MEMORY[0x1E4F1BA20] localizedStringForLabel:a3];
}

- (id)initForPropertyItem:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNPickerController *)self initWithStyle:1];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_item, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    labelsToDeleteOnCommit = v6->_labelsToDeleteOnCommit;
    v6->_labelsToDeleteOnCommit = (NSMutableArray *)v7;

    uint64_t v9 = [v4 standardLabels];
    [(CNPickerController *)v6 setBuiltinItems:v9];

    v10 = [v4 extendedLabels];
    uint64_t v11 = [(CNPickerController *)v6 builtinItems];
    unint64_t v12 = [v11 count];
    unint64_t v13 = [v10 count];

    if (v12 < v13)
    {
      [(CNPickerController *)v6 setSupplementalItems:v10];
      long long v14 = [v4 promotedExtendedLabels];
      [(CNPickerController *)v6 setPromotedSupplementalItems:v14];

      long long v15 = [(CNPickerController *)v6 supplementalItems];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __47__CNLabelPickerController_initForPropertyItem___block_invoke;
      v54[3] = &unk_1E549BAC0;
      long long v16 = v6;
      v55 = v16;
      v17 = objc_msgSend(v15, "_cn_filter:", v54);
      [(CNPickerController *)v16 setRemainderSupplementalItems:v17];
    }
    uint64_t v18 = [v4 group];
    v19 = [v18 policy];
    v20 = [v4 property];
    v21 = [v19 supportedLabelsForContactProperty:v20];
    [(CNPickerController *)v6 setAllowsCustomItems:v21 == 0];

    if ([(CNPickerController *)v6 allowsCustomItems])
    {
      v22 = [v4 group];
      v23 = [v22 contactStore];
      v24 = [v4 property];
      v25 = [v23 usedLabelsForPropertyWithKey:v24 error:0];
      v26 = (void *)[v25 mutableCopy];

      v27 = [v4 group];
      v28 = [v27 labelsInUseByGroup];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v56 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            if (([v26 containsObject:v34] & 1) == 0) {
              [v26 addObject:v34];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v31);
      }

      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __47__CNLabelPickerController_initForPropertyItem___block_invoke_2;
      v48[3] = &unk_1E5499598;
      v35 = v6;
      v49 = v35;
      v36 = [v26 indexesOfObjectsPassingTest:v48];
      v37 = [v26 objectsAtIndexes:v36];
      [(CNPickerController *)v35 setCustomItems:v37];
    }
    v38 = [v4 labeledValue];
    v39 = [v38 label];
    [(CNPickerController *)v6 setSelectedItem:v39];

    v40 = [(CNPickerController *)v6 selectedItem];

    if (!v40)
    {
      v41 = [(CNLabelPickerController *)v6 navigationItem];
      v42 = [v41 rightBarButtonItem];
      [v42 setEnabled:0];
    }
    v43 = [(CNLabelPickerController *)v6 title];

    if (v43)
    {
      v44 = [(CNLabelPickerController *)v6 title];
      v45 = [(CNLabelPickerController *)v6 navigationItem];
      [v45 setTitle:v44];
    }
    else
    {
      v44 = CNContactsUIBundle();
      v45 = [v44 localizedStringForKey:@"EDIT_ITEM_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
      v46 = [(CNLabelPickerController *)v6 navigationItem];
      [v46 setTitle:v45];
    }
  }

  return v6;
}

uint64_t __47__CNLabelPickerController_initForPropertyItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 promotedSupplementalItems];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

uint64_t __47__CNLabelPickerController_initForPropertyItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) builtinItems];
  if ([v4 containsObject:v3])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [*(id *)(a1 + 32) supplementalItems];
    uint64_t v5 = [v6 containsObject:v3] ^ 1;
  }
  return v5;
}

@end