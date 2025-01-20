@interface CNCountryPickerController
- (CNCountryPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSArray)countries;
- (NSArray)sections;
- (NSIndexPath)selectedIndexPath;
- (NSString)selectedCountryCode;
- (UILocalizedIndexedCollation)collation;
- (UITableViewController)tableViewController;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_configureSections;
- (void)_loadCountryCodes;
- (void)cancelPicker:(id)a3;
- (void)dealloc;
- (void)setCollation:(id)a3;
- (void)setCountries:(id)a3;
- (void)setSections:(id)a3;
- (void)setSelectedCountryCode:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)windowDidRotate:(id)a3;
@end

@implementation CNCountryPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_countries, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);

  objc_storeStrong((id *)&self->_selectedCountryCode, 0);
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setCountries:(id)a3
{
}

- (NSArray)countries
{
  return self->_countries;
}

- (void)setCollation:(id)a3
{
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setTableViewController:(id)a3
{
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setSelectedCountryCode:(id)a3
{
}

- (NSString)selectedCountryCode
{
  return self->_selectedCountryCode;
}

- (void)_configureSections
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1960] currentCollation];
  [(CNCountryPickerController *)self setCollation:v3];

  v37 = self;
  v4 = [(CNCountryPickerController *)self collation];
  v5 = [v4 sectionTitles];
  uint64_t v6 = [v5 count];

  v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  if (v6)
  {
    uint64_t v8 = v6;
    do
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v7 addObject:v9];

      --v8;
    }
    while (v8);
  }
  uint64_t v10 = *MEMORY[0x1E4F5A298];
  v11 = self;
  v12 = [(CNCountryPickerController *)self selectedCountryCode];
  char v38 = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(CNCountryPickerController *)self countries];
  uint64_t v13 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  v36 = v7;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v19 = [(CNCountryPickerController *)v11 collation];
        uint64_t v20 = [v19 sectionForObject:v18 collationStringSelector:sel_phoneticCountryName];

        v21 = [v7 objectAtIndexedSubscript:v20];
        [v21 addObject:v18];
        if ((v38 & 1) == 0)
        {
          v22 = [(CNCountryPickerController *)v11 selectedCountryCode];
          v23 = [v18 countryCode];
          int v24 = [v22 isEqualToString:v23];

          BOOL v25 = v24 == 0;
          v7 = v36;
          v11 = v37;
          if (!v25) {
            uint64_t v16 = v20;
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v34)
  {
    uint64_t v26 = 0;
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v28 = [v36 objectAtIndexedSubscript:v26];
      v29 = [(CNCountryPickerController *)v11 collation];
      v30 = [v29 sortedArrayFromArray:v28 collationStringSelector:sel_phoneticCountryName];

      if (v30) {
        [v36 setObject:v30 atIndexedSubscript:v26];
      }
      char v31 = v38;
      if (v16 != v26) {
        char v31 = 1;
      }
      v11 = v37;
      if ((v31 & 1) == 0)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __47__CNCountryPickerController__configureSections__block_invoke;
        v39[3] = &unk_1E5497968;
        v39[4] = v37;
        uint64_t v27 = objc_msgSend(v30, "_cn_indexOfFirstObjectPassingTest:", v39);
      }

      ++v26;
    }
    while (v34 != v26);
  }
  else
  {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [MEMORY[0x1E4F28D58] indexPathForRow:v27 inSection:v16];
  v33 = v32 = v11;
  [(CNCountryPickerController *)v32 setSelectedIndexPath:v33];

  [(CNCountryPickerController *)v32 setSections:v36];
}

uint64_t __47__CNCountryPickerController__configureSections__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 selectedCountryCode];
  v5 = [v3 countryCode];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

- (void)_loadCountryCodes
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  CFArrayRef v3 = CFLocaleCopyISOCountryCodes();
  if (v3)
  {
    v18 = self;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[__CFArray count](v3, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    CFArrayRef v17 = v3;
    CFArrayRef obj = v3;
    uint64_t v4 = [(__CFArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v23 = *(void *)v25;
      uint64_t v21 = *MEMORY[0x1E4F5A2C0];
      uint64_t v20 = *MEMORY[0x1E4F5A2C8];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v25 != v23) {
            objc_enumerationMutation(obj);
          }
          v7 = [*(id *)(*((void *)&v24 + 1) + 8 * i) lowercaseString];
          uint64_t v8 = [MEMORY[0x1E4F5A4A0] addressFormats];
          id v9 = [v8 objectForKeyedSubscript:v7];

          if (v9)
          {
            uint64_t v10 = [v9 objectForKey:v21];
            v11 = [MEMORY[0x1E4F5A4A0] localizedStringForPostalAddressString:v10 returningNilIfNotFound:0];
            v12 = [v9 objectForKey:v20];
            uint64_t v13 = [MEMORY[0x1E4F5A4A0] localizedStringForPostalAddressString:v12 returningNilIfNotFound:0];
            uint64_t v14 = objc_alloc_init(ABCountry);
            [(ABCountry *)v14 setCountryCode:v7];
            [(ABCountry *)v14 setCountryName:v11];
            if (v13) {
              BOOL v15 = v12 == v13;
            }
            else {
              BOOL v15 = 1;
            }
            if (v15) {
              uint64_t v16 = v11;
            }
            else {
              uint64_t v16 = v13;
            }
            [(ABCountry *)v14 setPhoneticCountryName:v16];
            [v22 addObject:v14];
          }
        }
        uint64_t v5 = [(__CFArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v5);
    }

    self = v18;
    [(CNCountryPickerController *)v18 setCountries:v22];

    CFArrayRef v3 = v17;
  }
  [(CNCountryPickerController *)self _configureSections];
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
    uint64_t v8 = [v9 backgroundColor];
    [v7 setBackgroundColor:v8];
  }
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  uint64_t v6 = [(CNCountryPickerController *)self collation];
  int64_t v7 = [v6 sectionForSectionIndexTitleAtIndex:a5];

  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  CFArrayRef v3 = [(CNCountryPickerController *)self collation];
  uint64_t v4 = [v3 sectionIndexTitles];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CNCountryPickerController *)self sections];
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v6 row];
  uint64_t v10 = [v14 objectAtIndexedSubscript:v9];
  v11 = [(CNCountryPickerController *)self delegate];
  v12 = [v10 countryCode];
  [v11 countryPicker:self didPickCountryCode:v12];

  uint64_t v13 = [v7 indexPathForSelectedRow];
  [v7 deselectRowAtIndexPath:v13 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"ABCountryNameCell"];
  uint64_t v8 = [(CNCountryPickerController *)self sections];
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

  uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v11 = [v7 textLabel];
  [v11 setAdjustsFontSizeToFitWidth:1];

  v12 = [v10 countryName];
  uint64_t v13 = [v7 textLabel];
  [v13 setText:v12];

  id v14 = [(CNCountryPickerController *)self selectedIndexPath];
  uint64_t v15 = [v6 compare:v14];

  if (v15)
  {
    uint64_t v16 = [v7 imageView];
    [v16 setImage:0];
  }
  else
  {
    uint64_t v16 = [v7 _checkmarkImage:0];
    CFArrayRef v17 = [v7 imageView];
    [v17 setImage:v16];
  }
  [v7 separatorInset];
  objc_msgSend(v7, "setSeparatorInset:");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (-[CNCountryPickerController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) < 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v6 = [(CNCountryPickerController *)self collation];
    id v7 = [v6 sectionTitles];
    uint64_t v8 = [v7 objectAtIndexedSubscript:a4];
  }

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(CNCountryPickerController *)self sections];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  int64_t v7 = [v6 count];
  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  CFArrayRef v3 = [(CNCountryPickerController *)self collation];
  uint64_t v4 = [v3 sectionTitles];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)dealloc
{
  CFArrayRef v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNCountryPickerController;
  [(CNCountryPickerController *)&v4 dealloc];
}

- (void)windowDidRotate:(id)a3
{
  objc_super v4 = [(CNCountryPickerController *)self selectedIndexPath];
  uint64_t v5 = [v4 row];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [(UITableViewController *)self->_tableViewController tableView];
    id v6 = [(CNCountryPickerController *)self selectedIndexPath];
    [v7 scrollToRowAtIndexPath:v6 atScrollPosition:2 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNCountryPickerController;
  -[CNCountryPickerController viewWillAppear:](&v21, sel_viewWillAppear_);
  if ([(UIViewController *)self ab_shouldShowNavBarButtons])
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPicker_];
    id v6 = [(CNCountryPickerController *)self tableViewController];
    id v7 = [v6 navigationItem];
    [v7 setRightBarButtonItem:v5];
  }
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    uint64_t v8 = +[CNUIColorRepository popoverBackgroundColor];
    uint64_t v9 = [(UITableViewController *)self->_tableViewController tableView];
    [v9 setBackgroundColor:v8];

    uint64_t v10 = [(UITableViewController *)self->_tableViewController tableView];
    v11 = [v10 backgroundColor];
    v12 = [(UITableViewController *)self->_tableViewController tableView];
    [v12 setSectionIndexBackgroundColor:v11];
  }
  uint64_t v13 = [(CNCountryPickerController *)self viewControllers];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    uint64_t v15 = [(CNCountryPickerController *)self tableViewController];
    [(CNCountryPickerController *)self pushViewController:v15 animated:0];

    uint64_t v16 = [(CNCountryPickerController *)self selectedIndexPath];
    uint64_t v17 = [v16 row];

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = [(UITableViewController *)self->_tableViewController tableView];
      v19 = [(CNCountryPickerController *)self selectedIndexPath];
      [v18 scrollToRowAtIndexPath:v19 atScrollPosition:2 animated:v3];
    }
    uint64_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:self selector:sel_windowDidRotate_ name:*MEMORY[0x1E4FB3100] object:0];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNCountryPickerController;
  [(CNCountryPickerController *)&v5 viewDidLoad];
  [(CNCountryPickerController *)self _loadCountryCodes];
  BOOL v3 = [(CNCountryPickerController *)self tableViewController];
  objc_super v4 = [v3 tableView];
  [v4 reloadData];
}

- (void)cancelPicker:(id)a3
{
  id v4 = [(CNCountryPickerController *)self delegate];
  [v4 countryPickerDidCancel:self];
}

- (CNCountryPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)CNCountryPickerController;
  id v4 = [(CNCountryPickerController *)&v23 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1D18]) initWithNibName:0 bundle:0];
    tableViewController = v4->_tableViewController;
    v4->_tableViewController = (UITableViewController *)v5;

    id v7 = CNContactsUIBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"EDIT_COUNTRY_FORMAT" value:&stru_1ED8AC728 table:@"Localized"];
    [(UITableViewController *)v4->_tableViewController setTitle:v8];

    uint64_t v9 = [(UITableViewController *)v4->_tableViewController tableView];
    [v9 setDelegate:v4];

    uint64_t v10 = [(UITableViewController *)v4->_tableViewController tableView];
    [v10 setDataSource:v4];

    double v11 = *MEMORY[0x1E4FB2F28];
    v12 = [(UITableViewController *)v4->_tableViewController tableView];
    [v12 setRowHeight:v11];

    uint64_t v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v13 lineHeight];
    double v15 = v14 * 1.5;
    uint64_t v16 = [(UITableViewController *)v4->_tableViewController tableView];
    [v16 setEstimatedRowHeight:v15];

    uint64_t v17 = [(UITableViewController *)v4->_tableViewController tableView];
    [v17 setSeparatorInsetReference:1];

    v18 = [(UITableViewController *)v4->_tableViewController tableView];
    [v18 reloadData];

    v19 = [(UITableViewController *)v4->_tableViewController tableView];
    [v19 registerClass:objc_opt_class() forCellReuseIdentifier:@"ABCountryNameCell"];

    uint64_t v20 = [(CNCountryPickerController *)v4 navigationBar];
    objc_msgSend(v20, "_cnui_applyContactStyle");

    objc_super v21 = [(UITableViewController *)v4->_tableViewController tableView];
    objc_msgSend(v21, "_cnui_applyContactStyle");
  }
  return v4;
}

@end