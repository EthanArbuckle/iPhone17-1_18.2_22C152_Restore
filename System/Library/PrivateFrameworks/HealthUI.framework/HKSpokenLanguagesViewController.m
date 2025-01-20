@interface HKSpokenLanguagesViewController
+ (id)defaultCheckmarkImage;
- (HKSpokenLanguage)currentLanguage;
- (HKSpokenLanguageDiffableDataSource)dataSource;
- (HKSpokenLanguagesViewController)initWithCurrentLanguage:(id)a3 preferredLanguages:(id)a4 andAllSpokenLanguages:(id)a5;
- (HKSpokenLanguagesViewControllerDelegate)pickerDelegate;
- (NSArray)allSpokenLanguages;
- (NSArray)mostLikelyLanguages;
- (UISearchController)searchController;
- (id)snapshotForCurrentState;
- (id)snapshotForSearchResults:(id)a3;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)cancelAction;
- (void)configureCancelButton;
- (void)configureDataSource;
- (void)configureSearchController;
- (void)doneAction;
- (void)handleSearchSelection;
- (void)setAllSpokenLanguages:(id)a3;
- (void)setConfirmButtonEnabledIfNeeded;
- (void)setCurrentLanguage:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMostLikelyLanguages:(id)a3;
- (void)setPickerDelegate:(id)a3;
- (void)setSearchController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation HKSpokenLanguagesViewController

- (HKSpokenLanguagesViewController)initWithCurrentLanguage:(id)a3 preferredLanguages:(id)a4 andAllSpokenLanguages:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKSpokenLanguagesViewController;
  v12 = [(HKSpokenLanguagesViewController *)&v17 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mostLikelyLanguages, a4);
    objc_storeStrong((id *)&v13->_allSpokenLanguages, a5);
    objc_storeStrong((id *)&v13->_currentLanguage, a3);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
    searchController = v13->_searchController;
    v13->_searchController = (UISearchController *)v14;
  }
  return v13;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HKSpokenLanguagesViewController;
  [(HKSpokenLanguagesViewController *)&v3 viewDidLoad];
  [(HKSpokenLanguagesViewController *)self configureCancelButton];
  [(HKSpokenLanguagesViewController *)self configureSearchController];
  [(HKSpokenLanguagesViewController *)self configureDataSource];
}

- (void)configureCancelButton
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAction];
  objc_super v3 = [(HKSpokenLanguagesViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v4];
}

- (void)setConfirmButtonEnabledIfNeeded
{
  objc_super v3 = [(HKSpokenLanguagesViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v7 = [v6 localizedStringForKey:@"confirm" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v9 = (id)[v5 initWithTitle:v7 style:2 target:self action:sel_doneAction];

    v8 = [(HKSpokenLanguagesViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v9 animated:1];
  }
}

- (void)configureSearchController
{
  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  [(UISearchController *)self->_searchController setAutomaticallyShowsCancelButton:1];
  objc_super v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 sizeToFit];

  [(HKSpokenLanguagesViewController *)self setDefinesPresentationContext:1];
  searchController = self->_searchController;
  id v5 = [(HKSpokenLanguagesViewController *)self navigationItem];
  [v5 setSearchController:searchController];

  id v6 = [(HKSpokenLanguagesViewController *)self navigationItem];
  [v6 setHidesSearchBarWhenScrolling:0];
}

+ (id)defaultCheckmarkImage
{
  v2 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8]];
  objc_super v3 = [v2 fontDescriptorWithSymbolicTraits:2];

  id v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];
  id v5 = [MEMORY[0x1E4FB1830] configurationWithFont:v4 scale:2];
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v5];

  return v6;
}

- (void)configureDataSource
{
  objc_super v3 = [HKSpokenLanguageDiffableDataSource alloc];
  id v4 = [(HKSpokenLanguagesViewController *)self tableView];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HKSpokenLanguagesViewController_configureDataSource__block_invoke;
  v9[3] = &unk_1E6D54790;
  v9[4] = self;
  id v5 = [(UITableViewDiffableDataSource *)v3 initWithTableView:v4 cellProvider:v9];
  [(HKSpokenLanguagesViewController *)self setDataSource:v5];

  id v6 = [(HKSpokenLanguagesViewController *)self dataSource];
  [v6 setDefaultRowAnimation:0];

  v7 = [(HKSpokenLanguagesViewController *)self snapshotForCurrentState];
  v8 = [(HKSpokenLanguagesViewController *)self dataSource];
  [v8 applySnapshot:v7 animatingDifferences:0];
}

id __54__HKSpokenLanguagesViewController_configureDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v10 = a4;
  id v11 = (void *)[[v9 alloc] initWithStyle:3 reuseIdentifier:@"languageCell"];
  v12 = [v10 languageInLanguageLocale];
  v13 = [v11 textLabel];
  [v13 setText:v12];

  id v14 = objc_alloc(MEMORY[0x1E4FB1838]);
  v15 = [(id)objc_opt_class() defaultCheckmarkImage];
  v16 = (void *)[v14 initWithImage:v15];

  [v16 sizeToFit];
  objc_super v17 = [v16 image];
  [v17 size];
  double v19 = v18;
  v20 = [v16 image];
  [v20 size];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, v19, v21);

  [v16 setHidden:1];
  [v11 setAccessoryView:v16];
  v22 = [v10 languageInCurrentLocale];
  v23 = [v11 detailTextLabel];
  [v23 setText:v22];

  [v11 setSelectionStyle:0];
  v24 = [v10 identifier];

  v25 = [*(id *)(*(void *)(a1 + 32) + 1048) identifier];

  if (v24 == v25)
  {
    [v11 setSelected:1];
    v26 = [v11 accessoryView];
    [v26 setHidden:0];

    [v7 selectRowAtIndexPath:v8 animated:0 scrollPosition:0];
  }

  return v11;
}

- (id)snapshotForCurrentState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v3 appendSectionsWithIdentifiers:&unk_1F3C1F510];
  [v3 appendItemsWithIdentifiers:self->_mostLikelyLanguages intoSectionWithIdentifier:&unk_1F3C21EF8];
  [v3 appendItemsWithIdentifiers:self->_allSpokenLanguages intoSectionWithIdentifier:&unk_1F3C21F10];
  return v3;
}

- (id)snapshotForSearchResults:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB1360];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 appendSectionsWithIdentifiers:&unk_1F3C1F528];
  [v5 appendItemsWithIdentifiers:v4 intoSectionWithIdentifier:&unk_1F3C21F28];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v15 = [a3 cellForRowAtIndexPath:v6];
  id v7 = [v15 accessoryView];
  [v7 setHidden:0];

  id v8 = [(HKSpokenLanguagesViewController *)self dataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v6];

  currentLanguage = self->_currentLanguage;
  self->_currentLanguage = v9;

  if ([(UISearchController *)self->_searchController isActive]) {
    [(HKSpokenLanguagesViewController *)self handleSearchSelection];
  }
  [(HKSpokenLanguagesViewController *)self setConfirmButtonEnabledIfNeeded];
  id v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v12 = [v11 features];
  int v13 = [v12 medicalIDV2];

  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);
    [WeakRetained didSelectCellWithLanguage:self->_currentLanguage];
  }
}

- (void)handleSearchSelection
{
  id v3 = [(UISearchController *)self->_searchController searchBar];
  [v3 setText:0];

  [(UISearchController *)self->_searchController dismissViewControllerAnimated:1 completion:0];
  id v12 = [(HKSpokenLanguagesViewController *)self snapshotForCurrentState];
  id v4 = [(HKSpokenLanguagesViewController *)self dataSource];
  [v4 applySnapshot:v12 animatingDifferences:1];

  id v5 = [HKSpokenLanguage alloc];
  id v6 = [(HKSpokenLanguage *)self->_currentLanguage identifier];
  id v7 = [(HKSpokenLanguage *)v5 initWithLanguageIdentifier:v6 forCategory:1];

  id v8 = [(HKSpokenLanguagesViewController *)self dataSource];
  id v9 = [v8 indexPathForItemIdentifier:v7];

  if (!v9)
  {
    [(HKSpokenLanguage *)v7 setLanguageCategoryType:2];
    id v10 = [(HKSpokenLanguagesViewController *)self dataSource];
    id v9 = [v10 indexPathForItemIdentifier:v7];
  }
  id v11 = [(HKSpokenLanguagesViewController *)self tableView];
  [v11 selectRowAtIndexPath:v9 animated:1 scrollPosition:2];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HKSpokenLanguagesViewController *)self tableView];
  id v9 = [v7 indexPathForSelectedRow];

  id v10 = [v8 cellForRowAtIndexPath:v9];

  id v11 = [v10 accessoryView];
  [v11 setHidden:1];

  return v6;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a4;
  id v7 = [v5 labelColor];
  id v8 = [v6 textLabel];
  [v8 setTextColor:v7];

  id v9 = (void *)MEMORY[0x1E4FB08E0];
  id v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32770 options:0];
  id v11 = [v9 fontWithDescriptor:v10 size:0.0];
  id v12 = [v6 textLabel];
  [v12 setFont:v11];

  [v6 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  id v21 = [v6 textLabel];

  objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);
}

- (void)doneAction
{
  id v3 = [(HKSpokenLanguagesViewController *)self pickerDelegate];
  [v3 didSelectCellWithLanguage:self->_currentLanguage];

  [(HKSpokenLanguagesViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)cancelAction
{
  id v3 = [(HKSpokenLanguagesViewController *)self pickerDelegate];
  [v3 didCancelLanguageSelection];

  [(HKSpokenLanguagesViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 searchBar];
  id v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v27 = (void *)[(NSArray *)self->_allSpokenLanguages mutableCopy];
    id v8 = [v4 searchBar];
    id v9 = [v8 text];
    id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    id v11 = [v9 stringByTrimmingCharactersInSet:v10];
    id v12 = [v11 componentsSeparatedByString:@" "];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          double v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K contains[cd] %@", @"languageInCurrentLocale", v18];
          double v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K contains[cd] %@", @"languageInLanguageLocale", v18];
          v33[0] = v19;
          v33[1] = v20;
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
          [v13 addObjectsFromArray:v21];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v15);
    }

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F28BA0]) initWithType:2 subpredicates:v13];
    [v27 filterUsingPredicate:v22];
    v23 = [(HKSpokenLanguagesViewController *)self snapshotForSearchResults:v27];
    v24 = [(HKSpokenLanguagesViewController *)self dataSource];
    [v24 applySnapshot:v23 animatingDifferences:1];
  }
  else
  {
    v25 = [(HKSpokenLanguagesViewController *)self snapshotForCurrentState];
    v26 = [(HKSpokenLanguagesViewController *)self dataSource];
    [v26 applySnapshot:v25 animatingDifferences:1];
  }
}

- (HKSpokenLanguagesViewControllerDelegate)pickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);
  return (HKSpokenLanguagesViewControllerDelegate *)WeakRetained;
}

- (void)setPickerDelegate:(id)a3
{
}

- (NSArray)mostLikelyLanguages
{
  return self->_mostLikelyLanguages;
}

- (void)setMostLikelyLanguages:(id)a3
{
}

- (NSArray)allSpokenLanguages
{
  return self->_allSpokenLanguages;
}

- (void)setAllSpokenLanguages:(id)a3
{
}

- (HKSpokenLanguage)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
}

- (HKSpokenLanguageDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_allSpokenLanguages, 0);
  objc_storeStrong((id *)&self->_mostLikelyLanguages, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
}

@end