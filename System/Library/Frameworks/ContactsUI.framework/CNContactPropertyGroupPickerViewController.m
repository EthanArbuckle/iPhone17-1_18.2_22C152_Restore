@interface CNContactPropertyGroupPickerViewController
+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4;
+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5;
+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6;
+ (id)pickableGroupsWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6;
+ (id)propertySections;
- (CNContact)contact;
- (CNContactGroupPickerDelegate)groupPickerDelegate;
- (CNContactPropertyGroupPickerViewController)initWithGroups:(id)a3;
- (NSArray)prohibitedPropertyKeys;
- (id)_loadPickableGroupsWithPickedGroups:(id)a3 policy:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancel:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)setContact:(id)a3;
- (void)setGroupPickerDelegate:(id)a3;
- (void)setProhibitedPropertyKeys:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNContactPropertyGroupPickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_groupPickerDelegate);
  objc_storeStrong((id *)&self->_prohibitedPropertyKeys, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_pickableGroups, 0);
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setGroupPickerDelegate:(id)a3
{
}

- (CNContactGroupPickerDelegate)groupPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupPickerDelegate);

  return (CNContactGroupPickerDelegate *)WeakRetained;
}

- (void)setProhibitedPropertyKeys:(id)a3
{
}

- (NSArray)prohibitedPropertyKeys
{
  return self->_prohibitedPropertyKeys;
}

- (id)_loadPickableGroupsWithPickedGroups:(id)a3 policy:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNContactPropertyGroupPickerViewController *)self prohibitedPropertyKeys];
  v9 = [(CNContactPropertyGroupPickerViewController *)self contact];
  v10 = +[CNContactPropertyGroupPickerViewController pickableGroupsWithPickedGroups:v7 policy:v6 prohibitedPropertyKeys:v8 contact:v9];

  return v10;
}

- (void)cancel:(id)a3
{
  id v4 = [(CNContactPropertyGroupPickerViewController *)self groupPickerDelegate];
  [v4 contactGroupPickerDidCancel:self];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    v8 = [v9 backgroundColor];
    [v7 setBackgroundColor:v8];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  pickableGroups = self->_pickableGroups;
  id v6 = a4;
  -[NSArray objectAtIndexedSubscript:](pickableGroups, "objectAtIndexedSubscript:", [v6 section]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(CNContactPropertyGroupPickerViewController *)self groupPickerDelegate];
  uint64_t v8 = [v6 row];

  id v9 = [v10 objectAtIndexedSubscript:v8];
  [v7 contactGroupPickerDidFinish:self withGroup:v9];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithStyle:0 reuseIdentifier:0];
  uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_pickableGroups, "objectAtIndexedSubscript:", [v6 section]);
  id v9 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v10 = [v6 row];

  v11 = [v8 objectAtIndexedSubscript:v10];
  v12 = [v9 localizedStringForKey:v11];
  v13 = [v7 textLabel];
  [v13 setText:v12];

  objc_msgSend(v7, "_cnui_applyContactStyle");

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_pickableGroups objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_pickableGroups count];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self ab_shouldShowNavBarButtons])
  {
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    id v6 = [(CNContactPropertyGroupPickerViewController *)self navigationItem];
    [v6 setLeftBarButtonItem:v5];
  }
  v8.receiver = self;
  v8.super_class = (Class)CNContactPropertyGroupPickerViewController;
  [(CNContactPropertyGroupPickerViewController *)&v8 viewWillAppear:v3];
  id v7 = [(CNContactPropertyGroupPickerViewController *)self view];
  objc_msgSend(v7, "_cnui_applyContactStyle");
}

- (void)loadView
{
  BOOL v3 = [(CNContactPropertyGroupPickerViewController *)self groupPickerDelegate];
  id v12 = [v3 alreadyPickedGroups];

  id v4 = [(CNContactPropertyGroupPickerViewController *)self groupPickerDelegate];
  int64_t v5 = [v4 policy];

  id v6 = [(CNContactPropertyGroupPickerViewController *)self _loadPickableGroupsWithPickedGroups:v12 policy:v5];
  pickableGroups = self->_pickableGroups;
  self->_pickableGroups = v6;

  id v8 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v9 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v9;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    v11 = +[CNUIColorRepository popoverBackgroundColor];
    [(UITableView *)self->_tableView setBackgroundColor:v11];
  }
  [(CNContactPropertyGroupPickerViewController *)self setView:self->_tableView];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_groupPickerDelegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CNContactPropertyGroupPickerViewController;
  [(CNContactPropertyGroupPickerViewController *)&v3 dealloc];
}

- (CNContactPropertyGroupPickerViewController)initWithGroups:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactPropertyGroupPickerViewController;
  objc_super v3 = [(CNContactPropertyGroupPickerViewController *)&v8 initWithNibName:0 bundle:0];
  if (v3)
  {
    id v4 = CNContactsUIBundle();
    int64_t v5 = [v4 localizedStringForKey:@"ADD_MORE_PROPERTIES_NAV_TITLE" value:&stru_1ED8AC728 table:@"Localized"];
    [(CNContactPropertyGroupPickerViewController *)v3 setTitle:v5];

    id v6 = [(CNContactPropertyGroupPickerViewController *)v3 navigationItem];
    [v6 setLargeTitleDisplayMode:2];
  }
  return v3;
}

+ (id)pickableGroupsWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  id v10 = a5;
  id v11 = a6;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = +[CNContactPropertyGroupPickerViewController propertySections];
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v35;
    uint64_t v12 = *MEMORY[0x1E4F1AD88];
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v13;
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
        v15 = [MEMORY[0x1E4F1CA48] array];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v31 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              if (([v10 containsObject:v21] & 1) == 0)
              {
                int v22 = [v21 isEqualToString:v12];
                if ((!v11 || !v22 || [v11 contactType] != 1)
                  && ([v9 containsObject:v21] & 1) == 0
                  && [v29 maximumCountOfValuesForContactProperty:v21])
                {
                  [v15 addObject:v21];
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v18);
        }

        if ([v15 count]) {
          [v25 addObject:v15];
        }

        uint64_t v13 = v28 + 1;
      }
      while (v28 + 1 != v27);
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v27);
  }

  return v25;
}

+ (id)propertySections
{
  if (propertySections_onceToken != -1) {
    dispatch_once(&propertySections_onceToken, &__block_literal_global_8443);
  }
  v2 = (void *)propertySections_sections;

  return v2;
}

void __62__CNContactPropertyGroupPickerViewController_propertySections__block_invoke()
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = *MEMORY[0x1E4F1ADF0];
  v18[0] = *MEMORY[0x1E4F1AEB0];
  v18[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1AF40];
  v18[2] = *MEMORY[0x1E4F1AEF8];
  v18[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AF00];
  v18[4] = *MEMORY[0x1E4F1AEA0];
  v18[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEF0];
  v18[6] = *MEMORY[0x1E4F1ADE0];
  v18[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AF30];
  v18[8] = *MEMORY[0x1E4F1AF38];
  v18[9] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1AEC0];
  v18[10] = *MEMORY[0x1E4F1AEB8];
  v18[11] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:12];
  v19[0] = v7;
  uint64_t v8 = *MEMORY[0x1E4F1ADB8];
  v17[0] = *MEMORY[0x1E4F1AE78];
  v17[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F1AF08];
  v17[2] = *MEMORY[0x1E4F1AED8];
  v17[3] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  v19[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v0 addObjectsFromArray:v11];

  uint64_t v12 = +[CNContactView addFieldCardProperties];
  id v16 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v0 addObjectsFromArray:v13];

  uint64_t v14 = [v0 copy];
  v15 = (void *)propertySections_sections;
  propertySections_sections = v14;
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5 contact:(id)a6
{
  uint64_t v6 = +[CNContactPropertyGroupPickerViewController pickableGroupsWithPickedGroups:a3 policy:a4 prohibitedPropertyKeys:a5 contact:a6];
  BOOL v7 = [v6 count] != 0;

  return v7;
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4 prohibitedPropertyKeys:(id)a5
{
  return [a1 propertiesLeftToPickWithPickedGroups:a3 policy:a4 prohibitedPropertyKeys:a5 contact:0];
}

+ (BOOL)propertiesLeftToPickWithPickedGroups:(id)a3 policy:(id)a4
{
  return [a1 propertiesLeftToPickWithPickedGroups:a3 policy:a4 prohibitedPropertyKeys:MEMORY[0x1E4F1CBF0]];
}

@end