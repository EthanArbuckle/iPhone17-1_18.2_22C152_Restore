@interface MFTimeZonePickerViewController
+ (OS_os_log)log;
- (MFCity)currentCity;
- (MFTimeZonePickerViewController)initWithCity:(id)a3;
- (MFTimeZonePickerViewControllerDelegate)delegate;
- (NSArray)currentFilteredCities;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)createCollectionViewLayout;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setCollectionView:(id)a3;
- (void)setCurrentCity:(id)a3;
- (void)setCurrentFilteredCities:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation MFTimeZonePickerViewController

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFTimeZonePickerViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1) {
    dispatch_once(&log_onceToken_13, block);
  }
  v2 = (void *)log_log_13;

  return (OS_os_log *)v2;
}

void __37__MFTimeZonePickerViewController_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;
}

- (MFTimeZonePickerViewController)initWithCity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFTimeZonePickerViewController;
  v6 = [(MFTimeZonePickerViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_currentCity, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v30[1] = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)MFTimeZonePickerViewController;
  [(MFTimeZonePickerViewController *)&v28 viewDidLoad];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  id v5 = [(MFTimeZonePickerViewController *)self view];
  [v5 setBackgroundColor:v4];

  [v3 setSearchResultsUpdater:self];
  [v3 setObscuresBackgroundDuringPresentation:0];
  v6 = _EFLocalizedString();
  v7 = [v3 searchBar];
  [v7 setPlaceholder:v6];

  v8 = [(MFTimeZonePickerViewController *)self navigationItem];
  [v8 setSearchController:v3];
  objc_super v9 = _EFLocalizedString();
  [v8 setTitle:v9];

  [(MFTimeZonePickerViewController *)self setDefinesPresentationContext:1];
  id v10 = objc_alloc(MEMORY[0x1E4FB1568]);
  v11 = [(MFTimeZonePickerViewController *)self createCollectionViewLayout];
  v12 = objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_37];
  id v14 = objc_alloc(MEMORY[0x1E4FB1598]);
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke_2;
  v26 = &unk_1E5F7D320;
  id v15 = v13;
  id v27 = v15;
  v16 = (void *)[v14 initWithCollectionView:v12 cellProvider:&v23];
  v17 = [(MFTimeZonePickerViewController *)self currentCity];
  v30[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];

  [(MFTimeZonePickerViewController *)self setCurrentFilteredCities:v18];
  id v19 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  v29 = &unk_1F0841470;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [v19 appendSectionsWithIdentifiers:v20];

  [v19 appendItemsWithIdentifiers:v18];
  [v16 applySnapshot:v19 animatingDifferences:0];
  [v12 setDataSource:v16];
  [v12 setDelegate:self];
  v21 = [(MFTimeZonePickerViewController *)self view];
  [v21 addSubview:v12];

  v22 = [(MFTimeZonePickerViewController *)self view];
  objc_msgSend(v12, "mf_pinToView:usingLayoutMargins:", v22, 0);

  [(MFTimeZonePickerViewController *)self setCollectionView:v12];
  [(MFTimeZonePickerViewController *)self setDataSource:v16];
}

void __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = a4;
  v6 = [MEMORY[0x1E4FB1948] cellConfiguration];
  [v6 setText:v5];
  [v8 setContentConfiguration:v6];
  v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v8 setBackgroundColor:v7];
}

id __45__MFTimeZonePickerViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = [a4 displayName];
  v11 = [v7 dequeueConfiguredReusableCellWithRegistration:v9 forIndexPath:v8 item:v10];

  return v11;
}

- (id)createCollectionViewLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MFTimeZonePickerViewController_createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E5F7A848;
  id v4 = v2;
  id v8 = v4;
  id v5 = (void *)[v3 initWithSectionProvider:v7];

  return v5;
}

id __60__MFTimeZonePickerViewController_createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];

  return v3;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFTimeZonePickerViewController *)self dataSource];
  v6 = [v5 snapshot];
  id v7 = [v6 itemIdentifiersInSectionWithIdentifier:&unk_1F0841470];
  [v6 deleteItemsWithIdentifiers:v7];
  id v8 = [v4 searchBar];
  uint64_t v9 = [v8 text];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [v4 searchBar];
    v12 = [v11 text];
    v13 = +[MFTimezoneHelper citiesMatchingName:v12];
  }
  else
  {
    id v14 = [(MFTimeZonePickerViewController *)self currentCity];
    v15[0] = v14;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  [(MFTimeZonePickerViewController *)self setCurrentFilteredCities:v13];
  [v6 appendItemsWithIdentifiers:v13];
  [v5 applySnapshot:v6 animatingDifferences:1 completion:0];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(MFTimeZonePickerViewController *)self currentFilteredCities];
  id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "item"));

  id v8 = [v7 timeZone];
  if (v8)
  {
    [(MFTimeZonePickerViewController *)self setCurrentCity:v7];
    uint64_t v9 = [(MFTimeZonePickerViewController *)self delegate];
    [v9 timeZonePickerViewController:self didSelectCity:v7];
  }
  else
  {
    uint64_t v10 = +[MFTimeZonePickerViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v7 displayName];
      -[MFTimeZonePickerViewController collectionView:didSelectItemAtIndexPath:](v11, v14, v10);
    }
  }
  v12 = [(MFTimeZonePickerViewController *)self navigationController];
  id v13 = (id)[v12 popToRootViewControllerAnimated:1];
}

- (MFCity)currentCity
{
  return self->_currentCity;
}

- (void)setCurrentCity:(id)a3
{
}

- (MFTimeZonePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFTimeZonePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)currentFilteredCities
{
  return self->_currentFilteredCities;
}

- (void)setCurrentFilteredCities:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_currentFilteredCities, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_currentCity, 0);
}

- (void)collectionView:(os_log_t)log didSelectItemAtIndexPath:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Time zone couldnt be created for time zone standard name: %{public}@", buf, 0xCu);
}

@end