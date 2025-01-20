@interface CNContactCardFieldPicker
+ (BOOL)isContactObject:(id)a3 equivalentTo:(id)a4;
+ (BOOL)isProperty:(id)a3 value:(id)a4 inContact:(id)a5;
+ (id)descriptorForRequiredKeys;
+ (id)imageProperties;
+ (id)privateCardPropertiesForContacts:(id)a3;
- (BOOL)allFieldsSelected;
- (BOOL)isAnyHandleSelected;
- (BOOL)isInActivityController;
- (BOOL)isNameDropSession;
- (BOOL)selectRowForKey:(id)a3 value:(id)a4 atIndex:(id)a5;
- (BOOL)shouldSelectDefaultFieldKeys;
- (BOOL)shouldSelectDefaultIndividualFields;
- (CNContact)defaultFieldSelections;
- (CNContactCardFieldPicker)initWithContact:(id)a3;
- (CNContactCardFieldPicker)initWithContacts:(id)a3;
- (CNContactCardFieldPicker)initWithContacts:(id)a3 isNameDropSession:(BOOL)a4 fieldSelections:(id)a5;
- (CNContactCardFieldPicker)initWithNameDrop:(id)a3 fieldSelections:(id)a4;
- (CNContactCardFieldPickerDataSource)fieldPickerDataSource;
- (CNContactCardFieldPickerDelegate)delegate;
- (NSArray)contacts;
- (UIBarButtonItem)toggleSelectAllFieldsButton;
- (UITableView)tableView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)titleForSelectAllFieldsButton;
- (void)deselectAllFields;
- (void)done:(id)a3;
- (void)saveFilteredContacts;
- (void)selectAllFields;
- (void)selectDefaultFieldKeys;
- (void)selectDefaultFields;
- (void)setContacts:(id)a3;
- (void)setDefaultFieldSelections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFieldPickerDataSource:(id)a3;
- (void)setIsNameDropSession:(BOOL)a3;
- (void)setPhotoFromContact:(id)a3 onFilteredContact:(id)a4;
- (void)setShouldSelectDefaultFieldKeys:(BOOL)a3;
- (void)setShouldSelectDefaultIndividualFields:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setToggleSelectAllFieldsButton:(id)a3;
- (void)setUpDoneButton;
- (void)setUpTableView;
- (void)setUpToggleSelectAllFieldsButton;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)toggleSelectionOfFields:(id)a3;
- (void)updateControllerButtons;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNContactCardFieldPicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultFieldSelections, 0);
  objc_storeStrong((id *)&self->_toggleSelectAllFieldsButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_fieldPickerDataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)setShouldSelectDefaultIndividualFields:(BOOL)a3
{
  self->_shouldSelectDefaultIndividualFields = a3;
}

- (BOOL)shouldSelectDefaultIndividualFields
{
  return self->_shouldSelectDefaultIndividualFields;
}

- (void)setDefaultFieldSelections:(id)a3
{
}

- (CNContact)defaultFieldSelections
{
  return self->_defaultFieldSelections;
}

- (void)setIsNameDropSession:(BOOL)a3
{
  self->_isNameDropSession = a3;
}

- (BOOL)isNameDropSession
{
  return self->_isNameDropSession;
}

- (void)setShouldSelectDefaultFieldKeys:(BOOL)a3
{
  self->_shouldSelectDefaultFieldKeys = a3;
}

- (BOOL)shouldSelectDefaultFieldKeys
{
  return self->_shouldSelectDefaultFieldKeys;
}

- (void)setToggleSelectAllFieldsButton:(id)a3
{
}

- (UIBarButtonItem)toggleSelectAllFieldsButton
{
  return self->_toggleSelectAllFieldsButton;
}

- (void)setTableView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setFieldPickerDataSource:(id)a3
{
}

- (CNContactCardFieldPickerDataSource)fieldPickerDataSource
{
  return self->_fieldPickerDataSource;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactCardFieldPickerDelegate)delegate
{
  return self->_delegate;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
  v9 = [v8 sections];
  uint64_t v10 = [v7 section];

  v11 = [v9 objectAtIndexedSubscript:v10];
  v12 = [v11 sectionType];
  int v13 = [v12 isEqualToString:@"contactCardFieldPickerPhotoSection"];

  if (v13
    && ([(CNContactCardFieldPicker *)self contacts],
        v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 count],
        v14,
        v15 == 1))
  {
    +[CNContactCardFieldPickerCell estimatedHeightDisplayingValue:1];
  }
  else
  {
    [v6 rowHeight];
  }
  double v17 = v16;

  return v17;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
    id v7 = [v6 firstContactContainingPhoto];

    [v8 prepareCellWithContact:v7];
  }
}

- (void)setPhotoFromContact:(id)a3 onFilteredContact:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CNContactCardFieldPicker imageProperties];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        int v13 = [v5 valueForKey:v12];
        [v6 setValue:v13 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (BOOL)allFieldsSelected
{
  v3 = [(CNContactCardFieldPicker *)self tableView];
  v4 = [v3 indexPathsForSelectedRows];
  uint64_t v5 = [v4 count];
  id v6 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
  LOBYTE(v5) = v5 == [v6 totalItemCount];

  return v5;
}

- (id)titleForSelectAllFieldsButton
{
  BOOL v2 = [(CNContactCardFieldPicker *)self allFieldsSelected];
  v3 = CNContactsUIBundle();
  v4 = v3;
  if (v2) {
    uint64_t v5 = @"DESELECT_ALL_FIELDS_BUTTON_TITLE";
  }
  else {
    uint64_t v5 = @"SELECT_ALL_FIELDS_BUTTON_TITLE";
  }
  id v6 = [v3 localizedStringForKey:v5 value:&stru_1ED8AC728 table:@"Localized"];

  return v6;
}

- (BOOL)isAnyHandleSelected
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(CNContactCardFieldPicker *)self tableView];
  v4 = [v3 indexPathsForSelectedRows];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    uint64_t v8 = *MEMORY[0x1E4F1ADC8];
    uint64_t v9 = *MEMORY[0x1E4F1AEE0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
        int v13 = [v12 keyForIndexPath:v11];

        v23[0] = v8;
        v23[1] = v9;
        long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        char v15 = [v14 containsObject:v13];

        if (v15)
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (void)updateControllerButtons
{
  if ([(CNContactCardFieldPicker *)self isNameDropSession])
  {
    BOOL v3 = [(CNContactCardFieldPicker *)self isAnyHandleSelected];
    id v5 = [(CNContactCardFieldPicker *)self navigationItem];
    v4 = [v5 rightBarButtonItem];
    [v4 setEnabled:v3];
  }
  else
  {
    id v5 = [(CNContactCardFieldPicker *)self titleForSelectAllFieldsButton];
    v4 = [(CNContactCardFieldPicker *)self toggleSelectAllFieldsButton];
    [v4 setTitle:v5];
  }
}

- (void)deselectAllFields
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = [(CNContactCardFieldPicker *)self tableView];
  v4 = [v3 indexPathsForSelectedRows];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        uint64_t v10 = [(CNContactCardFieldPicker *)self tableView];
        [v10 deselectRowAtIndexPath:v9 animated:1];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(CNContactCardFieldPicker *)self updateControllerButtons];
}

- (void)selectAllFields
{
  BOOL v3 = [(CNContactCardFieldPicker *)self tableView];
  uint64_t v4 = [v3 numberOfSections];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(CNContactCardFieldPicker *)self tableView];
      uint64_t v7 = [v6 numberOfRowsInSection:v5];

      if (v7 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:v5];
          uint64_t v10 = [(CNContactCardFieldPicker *)self tableView];
          [v10 selectRowAtIndexPath:v9 animated:0 scrollPosition:0];

          ++v8;
          long long v11 = [(CNContactCardFieldPicker *)self tableView];
          uint64_t v12 = [v11 numberOfRowsInSection:v5];
        }
        while (v8 < v12);
      }
      ++v5;
      long long v13 = [(CNContactCardFieldPicker *)self tableView];
      uint64_t v14 = [v13 numberOfSections];
    }
    while (v5 < v14);
  }

  [(CNContactCardFieldPicker *)self updateControllerButtons];
}

- (void)selectDefaultFields
{
  BOOL v3 = [(CNContactCardFieldPicker *)self defaultFieldSelections];

  if (v3)
  {
    uint64_t v4 = [(CNContactCardFieldPicker *)self tableView];
    uint64_t v5 = [v4 numberOfSections];

    if (v5 >= 1)
    {
      uint64_t v6 = 0;
      uint64_t v24 = *MEMORY[0x1E4F1AD90];
      v23 = (void *)*MEMORY[0x1E4F1AEC8];
      while (1)
      {
        uint64_t v7 = [(CNContactCardFieldPicker *)self tableView];
        uint64_t v8 = [v7 numberOfRowsInSection:v6];

        if (v8 >= 1) {
          break;
        }
LABEL_12:
        ++v6;
        long long v21 = [(CNContactCardFieldPicker *)self tableView];
        uint64_t v22 = [v21 numberOfSections];

        if (v6 >= v22) {
          return;
        }
      }
      uint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:v6];
        long long v11 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
        uint64_t v12 = [v11 groupItemForIndexPath:v10];

        long long v13 = [v12 property];
        int v14 = [v13 isEqualToString:@"birthdays"];
        char v15 = [v12 labeledValue];
        uint64_t v16 = self;
        if (!v14) {
          break;
        }
        BOOL v17 = [(CNContactCardFieldPicker *)self selectRowForKey:v24 value:v15 atIndex:v10];

        if (!v17)
        {
          char v15 = [v12 labeledValue];
          uint64_t v16 = self;
          v18 = v23;
LABEL_10:
          [(CNContactCardFieldPicker *)v16 selectRowForKey:v18 value:v15 atIndex:v10];
        }
        ++v9;
        long long v19 = [(CNContactCardFieldPicker *)self tableView];
        uint64_t v20 = [v19 numberOfRowsInSection:v6];

        if (v9 >= v20) {
          goto LABEL_12;
        }
      }
      v18 = v13;
      goto LABEL_10;
    }
  }
}

- (BOOL)selectRowForKey:(id)a3 value:(id)a4 atIndex:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = objc_opt_class();
  uint64_t v12 = [(CNContactCardFieldPicker *)self defaultFieldSelections];
  int v13 = [v11 isProperty:v10 value:v9 inContact:v12];

  if (v13)
  {
    int v14 = [(CNContactCardFieldPicker *)self tableView];
    [v14 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
  }
  return v13;
}

- (void)selectDefaultFieldKeys
{
  v27[6] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CNContactCardFieldPicker *)self contacts];
  v26 = +[CNContactCardFieldPicker privateCardPropertiesForContacts:v3];

  uint64_t v4 = [(CNContactCardFieldPicker *)self tableView];
  uint64_t v5 = [v4 numberOfSections];

  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v25 = *MEMORY[0x1E4F1AE28];
    uint64_t v24 = *MEMORY[0x1E4F1ADF0];
    uint64_t v23 = *MEMORY[0x1E4F1ADE0];
    uint64_t v22 = *MEMORY[0x1E4F1AEF8];
    uint64_t v7 = *MEMORY[0x1E4F1AF00];
    uint64_t v8 = *MEMORY[0x1E4F1AEF0];
    while (1)
    {
      id v9 = [(CNContactCardFieldPicker *)self tableView];
      uint64_t v10 = [v9 numberOfRowsInSection:v6];

      if (v10 >= 1) {
        break;
      }
LABEL_11:
      ++v6;
      uint64_t v20 = [(CNContactCardFieldPicker *)self tableView];
      uint64_t v21 = [v20 numberOfSections];

      if (v6 >= v21) {
        goto LABEL_12;
      }
    }
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v11 inSection:v6];
      int v13 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
      int v14 = [v13 keyForIndexPath:v12];

      if ([(CNContactCardFieldPicker *)self isNameDropSession]) {
        break;
      }
      if (([v26 containsObject:v14] & 1) == 0) {
        goto LABEL_9;
      }
LABEL_10:

      ++v11;
      v18 = [(CNContactCardFieldPicker *)self tableView];
      uint64_t v19 = [v18 numberOfRowsInSection:v6];

      if (v11 >= v19) {
        goto LABEL_11;
      }
    }
    v27[0] = v25;
    v27[1] = v24;
    v27[2] = v23;
    v27[3] = v22;
    v27[4] = v7;
    v27[5] = v8;
    char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:6];
    char v16 = [v15 containsObject:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_9:
    BOOL v17 = [(CNContactCardFieldPicker *)self tableView];
    [v17 selectRowAtIndexPath:v12 animated:0 scrollPosition:0];

    goto LABEL_10;
  }
LABEL_12:
  if (![(CNContactCardFieldPicker *)self isNameDropSession]) {
    [(CNContactCardFieldPicker *)self updateControllerButtons];
  }
}

- (void)toggleSelectionOfFields:(id)a3
{
  if ([(CNContactCardFieldPicker *)self allFieldsSelected])
  {
    [(CNContactCardFieldPicker *)self deselectAllFields];
  }
  else
  {
    [(CNContactCardFieldPicker *)self selectAllFields];
  }
}

- (void)saveFilteredContacts
{
  if (![(CNContactCardFieldPicker *)self isNameDropSession]
    || [(CNContactCardFieldPicker *)self isAnyHandleSelected])
  {
    BOOL v3 = [(CNContactCardFieldPicker *)self contacts];
    uint64_t v4 = [v3 count];

    uint64_t v5 = [(CNContactCardFieldPicker *)self contacts];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CNContactCardFieldPicker_saveFilteredContacts__block_invoke;
    v8[3] = &unk_1E5497FD8;
    v8[4] = self;
    v8[5] = v4;
    uint64_t v6 = objc_msgSend(v5, "_cn_map:", v8);

    uint64_t v7 = [(CNContactCardFieldPicker *)self delegate];
    [v7 contactCardFieldPicker:self didFinishWithContacts:v6];
  }
}

id __48__CNContactCardFieldPicker_saveFilteredContacts__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v46 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v4 = [*(id *)(a1 + 32) tableView];
  uint64_t v5 = [v4 indexPathsForSelectedRows];

  uint64_t v41 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v41)
  {
    uint64_t v39 = a1;
    uint64_t v40 = *(void *)v53;
    v38 = v5;
    id v34 = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v53 != v40) {
          objc_enumerationMutation(v5);
        }
        uint64_t v43 = v6;
        uint64_t v7 = *(void **)(*((void *)&v52 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "fieldPickerDataSource", v34);
        id v9 = [v8 sections];
        uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

        uint64_t v11 = [v10 items];
        uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

        v42 = v10;
        int v13 = [v10 sectionType];
        LODWORD(v9) = [v13 isEqualToString:@"contactCardFieldPickerPhotoSection"];

        if (v9)
        {
          [*(id *)(a1 + 32) setPhotoFromContact:v46 onFilteredContact:v3];
        }
        else
        {
          int v14 = [v12 groupItem];
          char v15 = [v14 property];

          char v16 = [v46 valueForKey:v15];
          if (v16)
          {
            if (+[CNContactView isMultiValueProperty:v15])
            {
              id v17 = v16;
              if (*(void *)(a1 + 40) == 1)
              {
                v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
                v57 = v18;
                [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
                v20 = uint64_t v19 = v17;
              }
              else
              {
                v36 = v16;
                v37 = v15;
                v18 = +[CNCardPropertyGroup groupForProperty:v15 contact:v46 store:0 policy:0 linkedPolicies:0];
                long long v48 = 0u;
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id v35 = v17;
                id obj = v17;
                uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
                if (v47)
                {
                  uint64_t v45 = *(void *)v49;
                  uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
                  do
                  {
                    for (uint64_t i = 0; i != v47; ++i)
                    {
                      if (*(void *)v49 != v45) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
                      uint64_t v23 = v18;
                      uint64_t v24 = +[CNPropertyGroupItem propertyGroupItemWithLabeledValue:v22 group:v18 contact:v46];
                      uint64_t v25 = [v24 displayLabel];
                      v26 = v12;
                      v27 = [v12 groupItem];
                      v28 = [v27 displayLabel];
                      int v29 = [v25 isEqualToString:v28];

                      if (v29)
                      {
                        uint64_t v30 = [v20 arrayByAddingObject:v22];

                        uint64_t v20 = (void *)v30;
                      }

                      uint64_t v12 = v26;
                      v18 = v23;
                    }
                    uint64_t v47 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
                  }
                  while (v47);
                }
                else
                {
                  uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
                }

                id v3 = v34;
                uint64_t v19 = v35;
                char v16 = v36;
                char v15 = v37;
              }

              v31 = [v3 valueForKey:v15];
              v32 = [v20 arrayByAddingObjectsFromArray:v31];

              [v3 setValue:v32 forKey:v15];
              uint64_t v5 = v38;
              a1 = v39;
            }
            else
            {
              [v3 setValue:v16 forKey:v15];
            }
          }
        }
        uint64_t v6 = v43 + 1;
      }
      while (v43 + 1 != v41);
      uint64_t v41 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v41);
  }

  return v3;
}

- (void)done:(id)a3
{
}

- (BOOL)isInActivityController
{
  BOOL v2 = [(CNContactCardFieldPicker *)self navigationController];
  id v3 = [v2 viewControllers];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)setUpDoneButton
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    BOOL v4 = [(CNContactCardFieldPicker *)self isInActivityController];

    if (v4)
    {
      uint64_t v5 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v6 = [(CNContactCardFieldPicker *)self navigationItem];
  uint64_t v7 = [v6 rightBarButtonItem];

  if (!v7)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
    id v9 = [(CNContactCardFieldPicker *)self navigationItem];
    [v9 setRightBarButtonItem:v8];
  }
  uint64_t v5 = 0;
LABEL_8:
  id v11 = [(CNContactCardFieldPicker *)self navigationItem];
  uint64_t v10 = [v11 rightBarButtonItem];
  [v10 setHidden:v5];
}

- (void)setUpToggleSelectAllFieldsButton
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNContactCardFieldPicker *)self toggleSelectAllFieldsButton];

  if (v3)
  {
    [(CNContactCardFieldPicker *)self updateControllerButtons];
  }
  else
  {
    BOOL v4 = [(CNContactCardFieldPicker *)self titleForSelectAllFieldsButton];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v4 style:0 target:self action:sel_toggleSelectionOfFields_];
    [(CNContactCardFieldPicker *)self setToggleSelectAllFieldsButton:v5];
  }
  uint64_t v6 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
  uint64_t v7 = [(CNContactCardFieldPicker *)self toggleSelectAllFieldsButton];
  v10[1] = v7;
  v10[2] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [(CNContactCardFieldPicker *)self setToolbarItems:v8];

  id v9 = [(CNContactCardFieldPicker *)self navigationController];
  [v9 setToolbarHidden:0];
}

- (void)setUpTableView
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  BOOL v4 = [(CNContactCardFieldPicker *)self view];
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "initWithFrame:style:", 2);
  [(CNContactCardFieldPicker *)self setTableView:v5];

  uint64_t v6 = [(CNContactCardFieldPicker *)self tableView];
  [v6 setDelegate:self];

  uint64_t v7 = [(CNContactCardFieldPicker *)self fieldPickerDataSource];
  uint64_t v8 = [(CNContactCardFieldPicker *)self tableView];
  [v8 setDataSource:v7];

  id v9 = [(CNContactCardFieldPicker *)self tableView];
  [v9 setAllowsMultipleSelection:1];

  uint64_t v10 = +[CNUIColorRepository groupsInsetBackgroundColor];
  id v11 = [(CNContactCardFieldPicker *)self tableView];
  [v11 setBackgroundColor:v10];

  uint64_t v12 = [(CNContactCardFieldPicker *)self tableView];
  [v12 setSectionFooterHeight:0.0];

  int v13 = [(CNContactCardFieldPicker *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"contactCardFieldPickerCell"];

  int v14 = [(CNContactCardFieldPicker *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"contactCardFieldPickerPhotoCell"];

  char v15 = [(CNContactCardFieldPicker *)self view];
  char v16 = [(CNContactCardFieldPicker *)self tableView];
  [v15 addSubview:v16];

  v38 = [(CNContactCardFieldPicker *)self tableView];
  v36 = [v38 leadingAnchor];
  v37 = [(CNContactCardFieldPicker *)self view];
  id v35 = [v37 leadingAnchor];
  id v34 = [v36 constraintEqualToAnchor:v35];
  v39[0] = v34;
  v33 = [(CNContactCardFieldPicker *)self tableView];
  v31 = [v33 trailingAnchor];
  v32 = [(CNContactCardFieldPicker *)self view];
  uint64_t v30 = [v32 trailingAnchor];
  int v29 = [v31 constraintEqualToAnchor:v30];
  v39[1] = v29;
  v28 = [(CNContactCardFieldPicker *)self tableView];
  id v17 = [v28 topAnchor];
  v18 = [(CNContactCardFieldPicker *)self view];
  uint64_t v19 = [v18 topAnchor];
  uint64_t v20 = [v17 constraintEqualToAnchor:v19];
  v39[2] = v20;
  uint64_t v21 = [(CNContactCardFieldPicker *)self tableView];
  uint64_t v22 = [v21 bottomAnchor];
  uint64_t v23 = [(CNContactCardFieldPicker *)self view];
  uint64_t v24 = [v23 bottomAnchor];
  uint64_t v25 = [v22 constraintEqualToAnchor:v24];
  v39[3] = v25;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v27];
  v26 = [(CNContactCardFieldPicker *)self tableView];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactCardFieldPicker;
  [(CNContactCardFieldPicker *)&v4 viewDidDisappear:a3];
  [(CNContactCardFieldPicker *)self saveFilteredContacts];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNContactCardFieldPicker;
  [(CNContactCardFieldPicker *)&v4 viewWillAppear:a3];
  [(CNContactCardFieldPicker *)self setUpDoneButton];
  if (![(CNContactCardFieldPicker *)self isNameDropSession]) {
    [(CNContactCardFieldPicker *)self setUpToggleSelectAllFieldsButton];
  }
  if ([(CNContactCardFieldPicker *)self shouldSelectDefaultFieldKeys])
  {
    [(CNContactCardFieldPicker *)self selectDefaultFieldKeys];
    [(CNContactCardFieldPicker *)self setShouldSelectDefaultFieldKeys:0];
  }
  if ([(CNContactCardFieldPicker *)self shouldSelectDefaultIndividualFields])
  {
    [(CNContactCardFieldPicker *)self selectDefaultFields];
    [(CNContactCardFieldPicker *)self setShouldSelectDefaultIndividualFields:0];
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactCardFieldPicker;
  [(CNContactCardFieldPicker *)&v11 viewDidLoad];
  id v3 = +[CNUIColorRepository groupsInsetBackgroundColor];
  objc_super v4 = [(CNContactCardFieldPicker *)self view];
  [v4 setBackgroundColor:v3];

  if ([(CNContactCardFieldPicker *)self isNameDropSession])
  {
    uint64_t v5 = CNContactsUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"SHARE_BOOP_CONTACT_FIELDS_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v7 = [(CNContactCardFieldPicker *)self navigationItem];
    [v7 setTitle:v6];
  }
  else
  {
    uint64_t v8 = NSString;
    uint64_t v5 = CNContactsUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"SHARE_SELECTED_FIELDS_SHEET_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v7 = [(CNContactCardFieldPicker *)self contacts];
    id v9 = objc_msgSend(v8, "localizedStringWithFormat:", v6, objc_msgSend(v7, "count"));
    uint64_t v10 = [(CNContactCardFieldPicker *)self navigationItem];
    [v10 setTitle:v9];
  }
  [(CNContactCardFieldPicker *)self setUpTableView];
}

- (CNContactCardFieldPicker)initWithContacts:(id)a3 isNameDropSession:(BOOL)a4 fieldSelections:(id)a5
{
  BOOL v6 = a4;
  v24[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CNContactCardFieldPicker;
  objc_super v11 = [(CNContactCardFieldPicker *)&v23 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contacts, a3);
    v12->_isNameDropSession = v6;
    int v13 = [CNContactCardFieldPickerDataSource alloc];
    int v14 = v13;
    if (v6)
    {
      uint64_t v15 = *MEMORY[0x1E4F1ADF0];
      v24[0] = *MEMORY[0x1E4F1AE28];
      v24[1] = v15;
      v24[2] = *MEMORY[0x1E4F1ADE0];
      char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      uint64_t v17 = [(CNContactCardFieldPickerDataSource *)v14 initWithContacts:v9 hiddenProperties:v16];
      fieldPickerDataSource = v12->_fieldPickerDataSource;
      v12->_fieldPickerDataSource = (CNContactCardFieldPickerDataSource *)v17;
    }
    else
    {
      uint64_t v19 = [(CNContactCardFieldPickerDataSource *)v13 initWithContacts:v9];
      uint64_t v20 = v12->_fieldPickerDataSource;
      v12->_fieldPickerDataSource = (CNContactCardFieldPickerDataSource *)v19;

      v12->_shouldSelectDefaultFieldKeys = 1;
    }
    v12->_shouldSelectDefaultIndividualFields = v10 != 0;
    objc_storeStrong((id *)&v12->_defaultFieldSelections, a5);
    uint64_t v21 = v12;
  }

  return v12;
}

- (CNContactCardFieldPicker)initWithNameDrop:(id)a3 fieldSelections:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  BOOL v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[CNContactCardFieldPicker initWithContacts:isNameDropSession:fieldSelections:](self, "initWithContacts:isNameDropSession:fieldSelections:", v9, 1, v7, v12, v13);
  return v10;
}

- (CNContactCardFieldPicker)initWithContact:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  BOOL v6 = [v4 arrayWithObjects:&v9 count:1];

  id v7 = -[CNContactCardFieldPicker initWithContacts:](self, "initWithContacts:", v6, v9, v10);
  return v7;
}

- (CNContactCardFieldPicker)initWithContacts:(id)a3
{
  return [(CNContactCardFieldPicker *)self initWithContacts:a3 isNameDropSession:0 fieldSelections:0];
}

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = +[CNContactViewController descriptorForRequiredKeys];
  v8[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v5 = [NSString stringWithUTF8String:"+[CNContactCardFieldPicker descriptorForRequiredKeys]"];
  BOOL v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

+ (id)privateCardPropertiesForContacts:(id)a3
{
  v10[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = *MEMORY[0x1E4F1ADB0];
  v10[0] = @"birthdays";
  v10[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AF10];
  v10[2] = *MEMORY[0x1E4F1AED0];
  v10[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4F1AF08];
  void v10[4] = *MEMORY[0x1E4F1AED8];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];
  [v4 addObjectsFromArray:v8];

  if (+[CNContactCardFieldPickerDataSource canSharePronounsForContacts:v3])
  {
    [v4 addObject:*MEMORY[0x1E4F1AD88]];
  }
  if (+[CNContactCardFieldPickerDataSource isSharingMeContactForContacts:v3])
  {
    [v4 addObject:*MEMORY[0x1E4F1AF50]];
  }

  return v4;
}

+ (id)imageProperties
{
  if (imageProperties_cn_once_token_1 != -1) {
    dispatch_once(&imageProperties_cn_once_token_1, &__block_literal_global_21205);
  }
  BOOL v2 = (void *)imageProperties_cn_once_object_1;

  return v2;
}

void __43__CNContactCardFieldPicker_imageProperties__block_invoke()
{
  v6[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AF98];
  v6[0] = *MEMORY[0x1E4F1AE28];
  v6[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F1AE30];
  v6[2] = *MEMORY[0x1E4F1ADE8];
  v6[3] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADA8];
  v6[4] = *MEMORY[0x1E4F1AE48];
  v6[5] = v2;
  v6[6] = *MEMORY[0x1E4F1AE98];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = (void *)imageProperties_cn_once_object_1;
  imageProperties_cn_once_object_1 = v4;
}

+ (BOOL)isProperty:(id)a3 value:(id)a4 inContact:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v9 isKeyAvailable:v7])
  {
    char v20 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = [v9 valueForKey:v7];
  if (!v10)
  {
    char v20 = 0;
LABEL_16:

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = [v8 value];
    char v20 = [v21 isContactObject:v22 equivalentTo:v10];

    goto LABEL_16;
  }
  id v24 = v7;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = objc_opt_class();
        v18 = [v8 value];
        uint64_t v19 = [v16 value];
        LOBYTE(v17) = [(id)v17 isContactObject:v18 equivalentTo:v19];

        if (v17)
        {

          char v20 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  char v20 = 0;
LABEL_18:
  id v7 = v24;
LABEL_19:

  return v20;
}

+ (BOOL)isContactObject:(id)a3 equivalentTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    id v8 = v6;
    id v9 = (void *)MEMORY[0x1E4F5A3E0];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke;
    v39[3] = &unk_1E549BCB0;
    id v40 = v7;
    id v41 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_2;
    aBlock[3] = &unk_1E549BCB0;
    id v10 = v40;
    id v37 = v10;
    id v11 = v41;
    id v38 = v11;
    uint64_t v12 = _Block_copy(aBlock);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_3;
    v33[3] = &unk_1E549BCB0;
    id v13 = v10;
    id v34 = v13;
    id v14 = v11;
    id v35 = v14;
    uint64_t v15 = _Block_copy(v33);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_4;
    v30[3] = &unk_1E549BCB0;
    id v16 = v13;
    id v31 = v16;
    id v17 = v14;
    id v32 = v17;
    v18 = _Block_copy(v30);
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    long long v26 = __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_5;
    long long v27 = &unk_1E549BCB0;
    id v28 = v16;
    id v29 = v17;
    id v19 = v17;
    id v20 = v16;
    uint64_t v21 = _Block_copy(&v24);
    char v22 = objc_msgSend(v9, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v20, v19, v39, v12, v15, v18, v21, 0, v24, v25, v26, v27);
  }
  else
  {
    char v22 = [MEMORY[0x1E4F5A3E0] isObject:v5 equalToOther:v6];
  }

  return v22;
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) day];
  return v2 == [*(id *)(a1 + 40) day];
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) month];
  return v2 == [*(id *)(a1 + 40) month];
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) year];
  return v2 == [*(id *)(a1 + 40) year];
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) era];
  return v2 == [*(id *)(a1 + 40) era];
}

BOOL __57__CNContactCardFieldPicker_isContactObject_equivalentTo___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) calendar];
  id v3 = [v2 calendarIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) calendar];
  id v5 = [v4 calendarIdentifier];
  BOOL v6 = v3 == v5;

  return v6;
}

@end