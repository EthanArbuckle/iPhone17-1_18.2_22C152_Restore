@interface TVSettingsAddLanguageController
- (NSArray)selectedLanguages;
- (NSArray)unselectedLanguages;
- (TVSettingsAddLanguageController)init;
- (TVSettingsAddLanguageController)initWithTopLevelController:(id)a3;
- (TopLevelSettingsController)topLevelController;
- (void)_cancelButtonTapped;
- (void)_preferredLanguagesDidChange:(id)a3;
- (void)_setupNavigationBar;
- (void)dealloc;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)setSelectedLanguages:(id)a3;
- (void)setTopLevelController:(id)a3;
- (void)setUnselectedLanguages:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVSettingsAddLanguageController

- (TVSettingsAddLanguageController)init
{
  return [(TVSettingsAddLanguageController *)self initWithTopLevelController:0];
}

- (TVSettingsAddLanguageController)initWithTopLevelController:(id)a3
{
  id v5 = a3;
  if (qword_1FA40 != -1) {
    dispatch_once(&qword_1FA40, &stru_18558);
  }
  v10.receiver = self;
  v10.super_class = (Class)TVSettingsAddLanguageController;
  v6 = [(TVSettingsAddLanguageController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_topLevelController, a3);
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"_willEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVSettingsAddLanguageController;
  [(TVSettingsAddLanguageController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3 = [(TVSettingsAddLanguageController *)self selectedLanguages];
  objc_super v4 = (NSMutableArray *)[v3 mutableCopy];
  stagedLanguages = self->_stagedLanguages;
  self->_stagedLanguages = v4;

  if (!self->_stagedLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_stagedLanguages;
    self->_stagedLanguages = v6;
  }
  v8 = [(TVSettingsAddLanguageController *)self unselectedLanguages];
  filteredLanguages = self->_filteredLanguages;
  self->_filteredLanguages = v8;

  uint64_t v10 = OBJC_IVAR___PSListController__table;
  [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__table] setEstimatedSectionHeaderHeight:0.0];
  [*(id *)&self->PSListController_opaque[v10] setEstimatedSectionFooterHeight:0.0];
  [(TVSettingsAddLanguageController *)self _setupNavigationBar];
  v11.receiver = self;
  v11.super_class = (Class)TVSettingsAddLanguageController;
  [(TVSettingsAddLanguageController *)&v11 viewDidLoad];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVSettingsAddLanguageController;
  id v7 = a3;
  [(TVSettingsAddLanguageController *)&v14 tableView:v7 didSelectRowAtIndexPath:v6];
  v8 = objc_msgSend(v7, "cellForRowAtIndexPath:", v6, v14.receiver, v14.super_class);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(TVSettingsAddLanguageController *)self specifierAtIndex:[(TVSettingsAddLanguageController *)self indexForIndexPath:v6]];
    uint64_t v10 = v9;
    if (v8)
    {
      objc_super v11 = [v9 propertyForKey:PSIDKey];
      v12 = qword_1FA38;
      if (os_log_type_enabled((os_log_t)qword_1FA38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Adding language %@ to preferred languages", buf, 0xCu);
      }
      [(NSMutableArray *)self->_stagedLanguages addObject:v11];
      [(TVSettingsAddLanguageController *)self setSelectedLanguages:self->_stagedLanguages];
      v13 = [(TVSettingsAddLanguageController *)self parentController];
      [v13 dismiss];
    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [v5 length];
  id v7 = [(TVSettingsAddLanguageController *)self unselectedLanguages];
  v8 = v7;
  if (v6)
  {
    v9 = (NSArray *)[(NSArray *)v7 mutableCopy];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2E10;
    v14[3] = &unk_18580;
    id v15 = v5;
    uint64_t v10 = +[NSPredicate predicateWithBlock:v14];
    [(NSArray *)v9 filterUsingPredicate:v10];

    filteredLanguages = self->_filteredLanguages;
    self->_filteredLanguages = v9;
    v12 = v9;

    [(TVSettingsAddLanguageController *)self reloadSpecifiers];
  }
  else
  {
    v13 = self->_filteredLanguages;
    self->_filteredLanguages = v7;

    [(TVSettingsAddLanguageController *)self reloadSpecifiers];
  }
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  objc_super v4 = [(TVSettingsAddLanguageController *)self unselectedLanguages];
  filteredLanguages = self->_filteredLanguages;
  self->_filteredLanguages = v4;

  [(TVSettingsAddLanguageController *)self reloadSpecifiers];
}

- (void)_setupNavigationBar
{
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelButtonTapped"];
  objc_super v4 = [(TVSettingsAddLanguageController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  id v5 = (UISearchController *)objc_alloc_init((Class)UISearchController);
  searchController = self->_searchController;
  self->_searchController = v5;

  id v7 = [(UISearchController *)self->_searchController searchBar];
  [v7 setDelegate:self];

  v8 = self->_searchController;
  v9 = [(TVSettingsAddLanguageController *)self navigationItem];
  [v9 setSearchController:v8];

  uint64_t v10 = [(TVSettingsAddLanguageController *)self navigationItem];
  [v10 setHidesSearchBarWhenScrolling:0];

  id v12 = [(TVSettingsAddLanguageController *)self navigationItem];
  objc_super v11 = [v12 searchController];
  [v11 setObscuresBackgroundDuringPresentation:0];
}

- (void)_cancelButtonTapped
{
  id v3 = qword_1FA38;
  if (os_log_type_enabled((os_log_t)qword_1FA38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Dismissing AddLanguages view.", v5, 2u);
  }
  objc_super v4 = [(TVSettingsAddLanguageController *)self parentController];
  [v4 dismiss];
}

- (void)_preferredLanguagesDidChange:(id)a3
{
  objc_super v4 = [(TVSettingsAddLanguageController *)self selectedLanguages];
  id v5 = (NSMutableArray *)[v4 mutableCopy];
  stagedLanguages = self->_stagedLanguages;
  self->_stagedLanguages = v5;

  if (!self->_stagedLanguages)
  {
    id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8 = self->_stagedLanguages;
    self->_stagedLanguages = v7;
  }
  unselectedLanguages = self->_unselectedLanguages;
  self->_unselectedLanguages = 0;

  uint64_t v10 = [(TVSettingsAddLanguageController *)self unselectedLanguages];
  filteredLanguages = self->_filteredLanguages;
  self->_filteredLanguages = v10;

  id v12 = [(UISearchController *)self->_searchController searchBar];
  id v14 = [v12 text];

  v13 = [(UISearchController *)self->_searchController searchBar];
  [(TVSettingsAddLanguageController *)self searchBar:v13 textDidChange:v14];
}

- (NSArray)selectedLanguages
{
  return self->_selectedLanguages;
}

- (void)setSelectedLanguages:(id)a3
{
}

- (NSArray)unselectedLanguages
{
  return self->_unselectedLanguages;
}

- (void)setUnselectedLanguages:(id)a3
{
}

- (TopLevelSettingsController)topLevelController
{
  return self->_topLevelController;
}

- (void)setTopLevelController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelController, 0);
  objc_storeStrong((id *)&self->_selectedLanguages, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_filteredLanguages, 0);
  objc_storeStrong((id *)&self->_stagedLanguages, 0);

  objc_storeStrong((id *)&self->_unselectedLanguages, 0);
}

@end