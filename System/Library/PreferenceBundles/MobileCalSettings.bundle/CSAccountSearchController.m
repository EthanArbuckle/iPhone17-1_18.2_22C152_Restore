@interface CSAccountSearchController
- (CSAccountSearchController)init;
- (id)_grantedDelegateFromAutocompleteResult:(id)a3;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4;
- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4;
- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3;
- (void)autocompleteFetchDidEndNetworkActivity:(id)a3;
- (void)autocompleteFetchDidFinish:(id)a3;
- (void)didDismissViewControllerSavingNewDelegate:(BOOL)a3;
- (void)didModifyDelegate:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
@end

@implementation CSAccountSearchController

- (CSAccountSearchController)init
{
  v16.receiver = self;
  v16.super_class = (Class)CSAccountSearchController;
  v2 = [(CSAccountSearchController *)&v16 init];
  if (v2)
  {
    v3 = (CNAutocompleteStore *)[objc_alloc((Class)CNAutocompleteStore) initWithDelegate:v2];
    autocompleteStore = v2->_autocompleteStore;
    v2->_autocompleteStore = v3;

    uint64_t v5 = +[NSMutableArray array];
    searchResults = v2->_searchResults;
    v2->_searchResults = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    fetchContext = v2->_fetchContext;
    v2->_fetchContext = (CNAutocompleteFetchContext *)v7;

    v9 = (UISearchController *)[objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    searchController = v2->_searchController;
    v2->_searchController = v9;

    [(UISearchController *)v2->_searchController setSearchResultsUpdater:v2];
    [(UISearchController *)v2->_searchController setObscuresBackgroundDuringPresentation:0];
    [(UISearchController *)v2->_searchController setHidesNavigationBarDuringPresentation:1];
    v11 = v2->_searchController;
    v12 = [(CSAccountSearchController *)v2 navigationItem];
    [v12 setSearchController:v11];

    v13 = [(CSAccountSearchController *)v2 navigationItem];
    [v13 setHidesSearchBarWhenScrolling:0];

    v14 = [(UISearchController *)v2->_searchController searchBar];
    [v14 setAutocapitalizationType:0];
    [v14 setAutocorrectionType:1];
  }
  return v2;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CSAccountSearchController;
  id v4 = a3;
  [(CSAccountSearchController *)&v9 setSpecifier:v4];
  objc_msgSend(v4, "propertyForKey:", @"CSSourceKey", v9.receiver, v9.super_class);
  uint64_t v5 = (EKSource *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  self->_source = v5;

  uint64_t v7 = [v4 propertyForKey:@"CSParentControllerKey"];

  objc_storeWeak((id *)&self->_accountController, v7);
  v8 = [(EKSource *)self->_source sourceIdentifier];
  [(CNAutocompleteFetchContext *)self->_fetchContext setSendingAddressAccountIdentifier:v8];
}

- (void)didDismissViewControllerSavingNewDelegate:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CSAccountSearchController *)self navigationController];
    id v3 = [v4 popViewControllerAnimated:0];
  }
}

- (void)didModifyDelegate:(id)a3
{
  p_accountController = &self->_accountController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_accountController);
  [WeakRetained didModifyDelegate:v4];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v9 = a3;
  if (([v9 isActive] & 1) == 0) {
    [(CNCancelable *)self->_currentFetchRequest cancel];
  }
  id v4 = [v9 searchBar];
  uint64_t v5 = [v4 text];

  [(CNCancelable *)self->_currentFetchRequest cancel];
  [(NSMutableArray *)self->_searchResults removeAllObjects];
  v6 = +[CNAutocompleteFetchRequest request];
  [v6 setFetchContext:self->_fetchContext];
  [v6 setSearchType:3];
  [v6 setSearchString:v5];
  [v6 setIncludeCalendarServers:1];
  [v6 setIncludeRecents:1];
  [v6 setIncludePredictions:1];
  [v6 setIncludeDirectoryServers:0];
  [v6 setIncludeContacts:0];
  [v6 setIncludeSuggestions:0];
  uint64_t v7 = [(CNAutocompleteStore *)self->_autocompleteStore scheduleFetchRequest:v6];
  currentFetchRequest = self->_currentFetchRequest;
  self->_currentFetchRequest = v7;

  [(CSAccountSearchController *)self reloadSpecifiers];
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v18 = OBJC_IVAR___PSListController__specifiers;
    v21 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obj = self->_searchResults;
    id v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v20 = *(void *)v23;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v23 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v6);
          v8 = +[NSBundle bundleForClass:objc_opt_class()];
          id v9 = [v8 localizedStringForKey:@"Format string for delegate search results" value:@"%@ (%@)" table:@"MobileCalSettings"];
          v10 = [v7 displayName];
          v11 = [v7 value];
          v12 = [v11 address];
          v13 = [v12 stringRemovingMailto];
          v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10, v13);

          v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:0 detail:0 cell:3 edit:0];
          [v21 addObject:v15];

          v6 = (char *)v6 + 1;
        }
        while (v5 != v6);
        id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v5);
    }

    objc_super v16 = *(void **)&self->PSListController_opaque[v18];
    *(void *)&self->PSListController_opaque[v18] = v21;

    id v3 = *(void **)&self->PSListController_opaque[v18];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  searchResults = self->_searchResults;
  id v8 = [v6 row];

  id v13 = [(NSMutableArray *)searchResults objectAtIndexedSubscript:v8];
  id v9 = [(CSAccountSearchController *)self _grantedDelegateFromAutocompleteResult:v13];
  id v10 = [[CSGrantedDelegateDetailsController alloc] initInAddDelegateMode:1];
  v11 = objc_opt_new();
  [v11 setProperty:self forKey:@"CSDelegateClassInstanceKey"];
  [v11 setProperty:self->_source forKey:@"CSSourceKey"];
  [v11 setProperty:v9 forKey:@"CSGrantedDelegateKey"];
  [v10 setSpecifier:v11];
  id v12 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v10];
  [(CSAccountSearchController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)autocompleteFetch:(id)a3 didReceiveResults:(id)a4
{
  id v5 = a4;
  id v6 = (void *)kCSLogHandle;
  if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 134217984;
    id v14 = [v5 count];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "autocompleteFetch received %lu results", buf, 0xCu);
  }
  id v8 = +[NSPredicate predicateWithBlock:&stru_1CB88];
  id v9 = [v5 filteredArrayUsingPredicate:v8];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_CEB8;
  v11[3] = &unk_1CAB8;
  v11[4] = self;
  id v12 = v9;
  id v10 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)autocompleteFetch:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  id v5 = kCSLogHandle;
  if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "autocompleteFetch failed with error: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)autocompleteFetchDidFinish:(id)a3
{
  id v3 = kCSLogHandle;
  if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "autocompleteFetch finished", v4, 2u);
  }
}

- (void)autocompleteFetchDidEndNetworkActivity:(id)a3
{
  id v3 = kCSLogHandle;
  if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "autocompleteFetch finished network activity", v4, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1CBC8);
}

- (void)autocompleteFetchDidBeginNetworkActivity:(id)a3
{
  id v3 = kCSLogHandle;
  if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "autocompleteFetch began network activity", v4, 2u);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1CBE8);
}

- (id)_grantedDelegateFromAutocompleteResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 displayName];
  [v4 setDisplayName:v5];

  int v6 = [v3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:EKDirectoryRecordPrincipalPathKey];

  if (v7)
  {
    [v4 setUri:v7];
  }
  else
  {
    id v8 = [v3 value];
    id v9 = [v8 address];
    [v4 setUri:v9];
  }
  [v4 setPermission:1];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autocompleteStore, 0);
  objc_storeStrong((id *)&self->_currentFetchRequest, 0);
  objc_destroyWeak((id *)&self->_accountController);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_searchController, 0);
}

@end