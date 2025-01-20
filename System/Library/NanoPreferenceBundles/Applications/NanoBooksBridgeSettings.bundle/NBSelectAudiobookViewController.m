@interface NBSelectAudiobookViewController
- (NBSearchResultsViewController)searchResultsController;
- (NBSelectAudiobookDelegate)delegate;
- (NSArray)myFamilyMembers;
- (NSMutableArray)myLibraryAudiobooks;
- (UISearchController)searchController;
- (id)_myLibraryStoreIDs;
- (id)_specifierForFamilyMember:(id)a3;
- (id)_specifierForMediaItem:(id)a3;
- (id)specifiers;
- (void)_addAudiobookStoreFooterToSpecifier:(id)a3;
- (void)_dismissSearchViewController;
- (void)_reloadData;
- (void)_showAudiobookStore:(id)a3;
- (void)dealloc;
- (void)familyCircleDataSource:(id)a3 didFetchFamilyCircle:(id)a4;
- (void)familyCircleDataSourceProfileImagesDidChange:(id)a3;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setMyFamilyMembers:(id)a3;
- (void)setMyLibraryAudiobooks:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation NBSelectAudiobookViewController

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)NBSelectAudiobookViewController;
  [(NBSelectAudiobookViewController *)&v30 viewDidLoad];
  v3 = objc_alloc_init(NBSearchResultsViewController);
  [(NBSelectAudiobookViewController *)self setSearchResultsController:v3];

  v4 = [(NBSelectAudiobookViewController *)self searchResultsController];
  [v4 setIncludeFamily:1];

  v5 = [(NBSelectAudiobookViewController *)self delegate];
  v6 = [(NBSelectAudiobookViewController *)self searchResultsController];
  [v6 setDelegate:v5];

  id v7 = objc_alloc((Class)UISearchController);
  v8 = [(NBSelectAudiobookViewController *)self searchResultsController];
  id v9 = [v7 initWithSearchResultsController:v8];
  [(NBSelectAudiobookViewController *)self setSearchController:v9];

  v10 = NBBundle();
  v11 = [v10 localizedStringForKey:@"Search Audiobooks" value:&stru_20DD8 table:&stru_20DD8];
  v12 = [(NBSelectAudiobookViewController *)self searchController];
  v13 = [v12 searchBar];
  [v13 setPlaceholder:v11];

  v14 = [(NBSelectAudiobookViewController *)self searchController];
  v15 = [v14 searchBar];
  [v15 setDelegate:self];

  v16 = [(NBSelectAudiobookViewController *)self searchController];
  [v16 setSearchResultsUpdater:self];

  v17 = NBBundle();
  v18 = [v17 localizedStringForKey:@"Select Audiobook" value:&stru_20DD8 table:&stru_20DD8];
  v19 = [(NBSelectAudiobookViewController *)self navigationItem];
  [v19 setTitle:v18];

  id v20 = objc_alloc((Class)UIBarButtonItem);
  v21 = NBBundle();
  v22 = [v21 localizedStringForKey:@"Cancel" value:&stru_20DD8 table:&stru_20DD8];
  id v23 = [v20 initWithTitle:v22 style:0 target:self action:"_dismissSearchViewController"];
  v24 = [(NBSelectAudiobookViewController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];

  v25 = [(NBSelectAudiobookViewController *)self searchController];
  v26 = [(NBSelectAudiobookViewController *)self navigationItem];
  [v26 setSearchController:v25];

  v27 = [(NBSelectAudiobookViewController *)self navigationItem];
  [v27 setHidesSearchBarWhenScrolling:0];

  v28 = +[NBFamilyCircleDataSource sharedInstance];
  [v28 addObserver:self];

  v29 = objc_opt_new();
  [(NBSelectAudiobookViewController *)self setMyLibraryAudiobooks:v29];

  [(NBSelectAudiobookViewController *)self setMyFamilyMembers:&__NSArray0__struct];
  [(NBSelectAudiobookViewController *)self _reloadData];
}

- (void)dealloc
{
  v3 = +[NBFamilyCircleDataSource sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NBSelectAudiobookViewController;
  [(NBSelectAudiobookViewController *)&v4 dealloc];
}

- (void)_dismissSearchViewController
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  [(NBSearchResultsViewController *)self->_searchResultsController setDelegate:v5];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSMutableArray array];
    v6 = NBBundle();
    id v7 = [v6 localizedStringForKey:@"My Library" value:&stru_20DD8 table:&stru_20DD8];
    v8 = +[PSSpecifier groupSpecifierWithID:@"NBMyLibaryGroupSpecifierID" name:v7];

    id v9 = +[NSMutableArray array];
    v10 = [(NBSelectAudiobookViewController *)self myFamilyMembers];
    id v11 = [v10 count];

    v12 = NBDefaultLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        v14 = [(NBSelectAudiobookViewController *)self myFamilyMembers];
        v15 = [v14 valueForKey:@"iTunesDSID"];
        *(_DWORD *)buf = 138412546;
        v47 = v15;
        __int16 v48 = 1024;
        unsigned int v49 = !+[NBBridgeUtilities isExplicitMaterialAllowed];
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Creating specifiers for family members (%@). isExplicitRestricted:(%i)", buf, 0x12u);
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v16 = [(NBSelectAudiobookViewController *)self myFamilyMembers];
      id v17 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v41;
        do
        {
          id v20 = 0;
          do
          {
            if (*(void *)v41 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [(NBSelectAudiobookViewController *)self _specifierForFamilyMember:*(void *)(*((void *)&v40 + 1) + 8 * (void)v20)];
            if (v21) {
              [v9 addObject:v21];
            }

            id v20 = (char *)v20 + 1;
          }
          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v18);
      }

      if ([v9 count])
      {
        v22 = NBBundle();
        id v23 = [v22 localizedStringForKey:@"My Family" value:&stru_20DD8 table:&stru_20DD8];
        v24 = +[PSSpecifier groupSpecifierWithID:@"NBMyFamilyGroupSpecifierID" name:v23];

        [v5 addObject:v24];
        [v5 addObjectsFromArray:v9];
      }
      [v5 addObject:v8];
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "No family members to display", buf, 2u);
      }
    }
    v25 = [(NBSelectAudiobookViewController *)self myLibraryAudiobooks];
    id v26 = [v25 count];

    if (v26)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v27 = [(NBSelectAudiobookViewController *)self myLibraryAudiobooks];
      id v28 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v37;
        do
        {
          v31 = 0;
          do
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [(NBSelectAudiobookViewController *)self _specifierForMediaItem:*(void *)(*((void *)&v36 + 1) + 8 * (void)v31)];
            [v5 addObject:v32];

            v31 = (char *)v31 + 1;
          }
          while (v29 != v31);
          id v29 = [v27 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v29);
      }
    }
    else
    {
      [(NBSelectAudiobookViewController *)self _addAudiobookStoreFooterToSpecifier:v8];
    }
    id v33 = [v5 copy];
    v34 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v33;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_addAudiobookStoreFooterToSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = NBBundle();
  id v13 = [v5 localizedStringForKey:@"No audiobooks in your library. Go to the %@ to find audiobooks read by actors, authors, and other memorable voices.", &stru_20DD8, &stru_20DD8 value table];

  v6 = NBBundle();
  id v7 = [v6 localizedStringForKey:@"Library_Group_Footer_Audiobook_Store" value:@"Audiobook Store" table:&stru_20DD8];

  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v7);
  [v4 setProperty:v8 forKey:PSFooterTextGroupKey];
  id v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v4 setProperty:v10 forKey:PSFooterCellClassGroupKey];

  v15.location = (NSUInteger)[v8 rangeOfString:v7];
  id v11 = NSStringFromRange(v15);
  [v4 setProperty:v11 forKey:PSFooterHyperlinkViewLinkRangeKey];

  [v4 setProperty:@"_showAudiobookStore:" forKey:PSFooterHyperlinkViewActionKey];
  v12 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v12 forKey:PSFooterHyperlinkViewTargetKey];
}

- (void)_showAudiobookStore:(id)a3
{
  id v4 = +[NSURL URLWithString:@"ibooks://show-audiobook-store"];
  uint64_t v3 = +[UIApplication sharedApplication];
  [v3 openURL:v4 withCompletionHandler:&stru_206A0];
}

- (id)_myLibraryStoreIDs
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(NBSelectAudiobookViewController *)self myLibraryAudiobooks];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "bk_storeID", v15);
        v12 = [v11 stringValue];

        if ([v12 length])
        {
          [v3 addObject:v12];
        }
        else
        {
          id v13 = NBDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Failed to convert media item store ID (%@)", buf, 0xCu);
          }
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_reloadData
{
  id v3 = [(NBSelectAudiobookViewController *)self myLibraryAudiobooks];
  [v3 removeAllObjects];

  id v4 = +[MPMediaQuery nb_storeOnlyAudiobooksQuery];
  id v5 = v4;
  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v6 = [v4 collections];
    id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v9), "bk_cloudRepresentativeItem");
          if (v10)
          {
            id v11 = [(NBSelectAudiobookViewController *)self myLibraryAudiobooks];
            [v11 addObject:v10];
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  objc_initWeak(&location, self);
  v12 = +[BDSJaliscoDAAPClient sharedClient];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_3EE8;
  long long v17 = &unk_206F0;
  objc_copyWeak(&v18, &location);
  [v12 updateFamilyPolitely:1 reason:6 completion:&v14];

  id v13 = +[NBFamilyCircleDataSource sharedInstance];
  [v13 refresh];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (id)_specifierForFamilyMember:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NBBridgeUtilities isExplicitMaterialAllowed] ^ 1;
  long long v6 = objc_msgSend(v4, "nb_dsids");
  id v7 = [v6 allObjects];

  uint64_t v8 = [(NBSelectAudiobookViewController *)self _myLibraryStoreIDs];
  id v9 = NBDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    long long v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = v5;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Determining if we should create a specifier for family member with DSIDs (%@), excluding the following books (%@), isRestricted (%d)", buf, 0x1Cu);
  }

  v10 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
  id v11 = [v10 fetchItemsForDSIDs:v7 excludeStoreIDs:v8 isExplicitRestricted:v5];
  id v12 = [v11 count];

  id v13 = NBDefaultLog();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412546;
      long long v23 = v7;
      __int16 v24 = 2048;
      id v25 = v12;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Family member (%@) has audiobooks, creating specifier (%ld)", buf, 0x16u);
    }

    uint64_t v15 = [v4 firstName];
    long long v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:3 edit:0];

    [v16 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v16 setProperty:&off_219E8 forKey:PSAccessoryKey];
    long long v17 = [v4 firstName];
    [v16 setProperty:v17 forKey:NMBUISpecifierTitleKey];

    id v18 = +[NSNumber numberWithUnsignedInteger:v12];
    [v16 setProperty:v18 forKey:@"NBUISpecifierAudiobookCountKey"];

    long long v19 = objc_msgSend(v4, "nb_profileImage");
    [v16 setProperty:v19 forKey:PSIconImageKey];

    long long v20 = objc_msgSend(v4, "nb_dsids");
    [v16 setProperty:v20 forKey:@"NBUISpecifierAccountDSIDsKey"];

    id v13 = +[NSNumber numberWithInt:1];
    [v16 setProperty:v13 forKey:PSEnabledKey];
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 138412290;
      long long v23 = v7;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Family member with DSIDs (%@), does not have displayable audiobooks in its account", buf, 0xCu);
    }
    long long v16 = 0;
  }

  return v16;
}

- (id)_specifierForMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "bk_effectiveTitle");
  long long v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v7 = objc_msgSend(v4, "bk_effectiveTitle");
  [v6 setProperty:v7 forKey:NMBUISpecifierTitleKey];

  uint64_t v8 = objc_msgSend(v4, "bk_effectiveAuthor");
  [v6 setProperty:v8 forKey:NMBUISpecifierSubtitleKey];

  [v6 setProperty:&off_21A00 forKey:PSTableCellStyleOverrideKey];
  id v9 = [v4 artworkCatalog];
  [v6 setProperty:v9 forKey:NMBUISpecifierArtworkCatalogKey];

  v10 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v6 setProperty:v10 forKey:NMBUISpecifierPlaceholderImageKey];

  [v6 setProperty:v4 forKey:NMBUISpecifierModelObjectKey];
  id v11 = objc_msgSend(v4, "bk_storeID");

  id v12 = [(NBSelectAudiobookViewController *)self delegate];
  LODWORD(v4) = [v12 selectAudiobookAdamIdAlreadyPinned:v11];

  if (v4) {
    [v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(NBSelectAudiobookViewController *)self specifierAtIndexPath:v6];
  objc_opt_class();
  id v9 = [v8 propertyForKey:NMBUISpecifierModelObjectKey];
  v10 = BUDynamicCast();

  if (v10)
  {
    id v11 = objc_msgSend(v10, "bk_storeID");
    id v12 = [(NBSelectAudiobookViewController *)self delegate];
    [v12 selectAudiobookDidSelectAudiobookWithAdamId:v11];
  }
  else
  {
    objc_opt_class();
    id v13 = [v8 propertyForKey:@"NBUISpecifierAccountDSIDsKey"];
    id v11 = BUDynamicCast();

    if ([v11 count])
    {
      BOOL v14 = [NBFamilyListViewController alloc];
      uint64_t v15 = [(NBSelectAudiobookViewController *)self _myLibraryStoreIDs];
      long long v16 = [(NBFamilyListViewController *)v14 initWithDSIDs:v11 excludeStoreIDs:v15];

      long long v17 = [(NBSelectAudiobookViewController *)self delegate];
      [(NBFamilyListViewController *)v16 setDelegate:v17];

      id v18 = [v8 propertyForKey:NMBUISpecifierTitleKey];
      [(NBFamilyListViewController *)v16 setTitle:v18];

      long long v19 = [(NBSelectAudiobookViewController *)self navigationController];
      [v19 pushViewController:v16 animated:1];

      goto LABEL_6;
    }
    id v12 = NBDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_131D0(v12);
    }
  }

LABEL_6:
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)familyCircleDataSource:(id)a3 didFetchFamilyCircle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NBSelectAudiobookViewController *)self setMyFamilyMembers:v7];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_4A04;
  long long v23 = sub_4A14;
  id v24 = (id)objc_opt_new();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_4A1C;
  v18[3] = &unk_20718;
  v18[4] = &v19;
  [v7 enumerateObjectsUsingBlock:v18];
  uint64_t v8 = [(id)v20[5] allObjects];
  uint64_t v9 = [(NBSelectAudiobookViewController *)self searchResultsController];
  [(id)v9 setFamilyDSIDs:v8];

  v10 = [(NBSelectAudiobookViewController *)self myFamilyMembers];
  LOBYTE(v9) = [v10 count] == 0;

  if (v9)
  {
    id v11 = [(NBSelectAudiobookViewController *)self searchController];
    id v12 = [v11 searchBar];
    [v12 setScopeButtonTitles:0];
  }
  else
  {
    id v11 = NBBundle();
    id v12 = [v11 localizedStringForKey:@"All Audiobooks" value:&stru_20DD8 table:&stru_20DD8];
    v25[0] = v12;
    id v13 = NBBundle();
    BOOL v14 = [v13 localizedStringForKey:@"My Library" value:&stru_20DD8 table:&stru_20DD8];
    v25[1] = v14;
    uint64_t v15 = +[NSArray arrayWithObjects:v25 count:2];
    long long v16 = [(NBSelectAudiobookViewController *)self searchController];
    long long v17 = [v16 searchBar];
    [v17 setScopeButtonTitles:v15];
  }
  [(NBSelectAudiobookViewController *)self reloadSpecifiers];
  _Block_object_dispose(&v19, 8);
}

- (void)familyCircleDataSourceProfileImagesDidChange:(id)a3
{
  id v4 = [a3 familyMembers];
  [(NBSelectAudiobookViewController *)self setMyFamilyMembers:v4];

  [(NBSelectAudiobookViewController *)self reloadSpecifiers];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  uint64_t v5 = [v4 searchField];
  id v7 = [v5 searchText];

  id v6 = [(NBSelectAudiobookViewController *)self searchResultsController];
  [v6 searchForString:v7];
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  BOOL v5 = a4 == 0;
  id v6 = a3;
  id v7 = [(NBSelectAudiobookViewController *)self searchResultsController];
  [v7 setIncludeFamily:v5];

  id v10 = [(NBSelectAudiobookViewController *)self searchResultsController];
  uint64_t v8 = [v6 searchField];

  uint64_t v9 = [v8 searchText];
  [v10 searchForString:v9];
}

- (NBSelectAudiobookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NBSelectAudiobookDelegate *)WeakRetained;
}

- (NBSearchResultsViewController)searchResultsController
{
  return self->_searchResultsController;
}

- (void)setSearchResultsController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSMutableArray)myLibraryAudiobooks
{
  return self->_myLibraryAudiobooks;
}

- (void)setMyLibraryAudiobooks:(id)a3
{
}

- (NSArray)myFamilyMembers
{
  return self->_myFamilyMembers;
}

- (void)setMyFamilyMembers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myFamilyMembers, 0);
  objc_storeStrong((id *)&self->_myLibraryAudiobooks, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end