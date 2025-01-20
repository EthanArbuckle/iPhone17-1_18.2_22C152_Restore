@interface StorageSettingsUIWrapper
- (STStorageUIViewControllerDelegate)delegate;
- (void)didMoveToBackground;
- (void)didMoveToParentViewController:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation StorageSettingsUIWrapper

- (void)viewDidLoad
{
  v43.receiver = self;
  v43.super_class = (Class)StorageSettingsUIWrapper;
  [(StorageSettingsUIWrapper *)&v43 viewDidLoad];
  v3 = +[Wrapper hostingControllerWithParentController:self];
  v4 = [(StorageSettingsUIWrapper *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [v3 view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = [v3 view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(StorageSettingsUIWrapper *)self addChildViewController:v3];
  v15 = [(StorageSettingsUIWrapper *)self view];
  v16 = [v3 view];
  [v15 addSubview:v16];

  [v3 didMoveToParentViewController:self];
  v17 = STLocalizedString(@"%@ Storage");
  v18 = localizedDeviceName();
  v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18);
  [(StorageSettingsUIWrapper *)self setTitle:v19];

  v20 = [v3 view];
  v21 = [(StorageSettingsUIWrapper *)self view];
  v22 = +[NSLayoutConstraint constraintWithItem:v20 attribute:3 relatedBy:0 toItem:v21 attribute:3 multiplier:1.0 constant:0.0];

  v23 = [v3 view];
  v24 = [(StorageSettingsUIWrapper *)self view];
  v25 = +[NSLayoutConstraint constraintWithItem:v23 attribute:2 relatedBy:0 toItem:v24 attribute:2 multiplier:1.0 constant:0.0];

  v26 = [v3 view];
  v27 = [(StorageSettingsUIWrapper *)self view];
  v28 = +[NSLayoutConstraint constraintWithItem:v26 attribute:4 relatedBy:0 toItem:v27 attribute:4 multiplier:1.0 constant:0.0];

  v29 = [v3 view];
  v30 = [(StorageSettingsUIWrapper *)self view];
  v31 = +[NSLayoutConstraint constraintWithItem:v29 attribute:1 relatedBy:0 toItem:v30 attribute:1 multiplier:1.0 constant:0.0];

  v44[0] = v22;
  v44[1] = v25;
  v44[2] = v28;
  v44[3] = v31;
  v32 = +[NSArray arrayWithObjects:v44 count:4];
  +[NSLayoutConstraint activateConstraints:v32];

  v33 = (UISearchController *)[objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v33;

  [(UISearchController *)self->_searchController setDelegate:self];
  v35 = [(UISearchController *)self->_searchController searchBar];
  [v35 setDelegate:self];

  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  v36 = self->_searchController;
  v37 = [(StorageSettingsUIWrapper *)self navigationItem];
  [v37 setSearchController:v36];

  v38 = [(StorageSettingsUIWrapper *)self navigationItem];
  [v38 setPreferredSearchBarPlacement:2];

  v39 = [(UISearchController *)self->_searchController searchBar];
  [v39 setHidden:1];

  v40 = [(UISearchController *)self->_searchController searchBar];
  [v40 setAccessibilityIdentifier:@"StorageSearchBar"];

  v41 = [(StorageSettingsUIWrapper *)self navigationItem];
  [v41 setStyle:0];

  v42 = +[NSNotificationCenter defaultCenter];
  [v42 addObserver:self selector:"didMoveToBackground" name:UISceneDidEnterBackgroundNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StorageSettingsUIWrapper;
  [(StorageSettingsUIWrapper *)&v5 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startHandlers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)StorageSettingsUIWrapper;
  [(StorageSettingsUIWrapper *)&v5 viewDidAppear:a3];
  v4 = [(UISearchController *)self->_searchController searchBar];
  [v4 setHidden:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)StorageSettingsUIWrapper;
  [(StorageSettingsUIWrapper *)&v7 viewDidDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained stopHandlers];

  if ([(StorageSettingsUIWrapper *)self isMovingFromParentViewController])
  {
    lastSearchedText = self->_lastSearchedText;
    self->_lastSearchedText = 0;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 searchDidClose];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  if (!a3)
  {
    lastSearchedText = self->_lastSearchedText;
    self->_lastSearchedText = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidClose];
  }
}

- (void)didMoveToBackground
{
  id v5 = [(StorageSettingsUIWrapper *)self navigationController];
  uint64_t v3 = [(StorageSettingsUIWrapper *)self parentViewController];
  id v4 = [v5 popToViewController:v3 animated:1];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  if (self->_lastSearchedText)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidUpdate:self->_lastSearchedText];
  }
  else
  {
    self->_lastSearchedText = (NSString *)&stru_98A78;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidOpen];
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  if (self->_lastSearchedText)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidUpdate:self->_lastSearchedText];
  }
  else
  {
    self->_lastSearchedText = (NSString *)&stru_98A78;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidOpen];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  lastSearchedText = self->_lastSearchedText;
  self->_lastSearchedText = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained searchDidClose];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v7 = a4;
  if (self->_lastSearchedText)
  {
    objc_storeStrong((id *)&self->_lastSearchedText, a4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained searchDidUpdate:v7];
  }
}

- (STStorageUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STStorageUIViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchController, 0);

  objc_storeStrong((id *)&self->_lastSearchedText, 0);
}

@end