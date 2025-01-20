@interface NBSearchResultsViewController
- (BOOL)includeFamily;
- (NBSearchDataSource)searchDataSource;
- (NBSearchResultsViewController)init;
- (NBSelectAudiobookDelegate)delegate;
- (NSArray)familyDSIDs;
- (NSArray)searchResults;
- (id)_specifierForJaliscoItem:(id)a3;
- (id)_specifierForMediaItem:(id)a3;
- (id)specifiers;
- (void)searchForString:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFamilyDSIDs:(id)a3;
- (void)setIncludeFamily:(BOOL)a3;
- (void)setSearchDataSource:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation NBSearchResultsViewController

- (NBSearchResultsViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NBSearchResultsViewController;
  v2 = [(NBSearchResultsViewController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    familyDSIDs = v2->_familyDSIDs;
    v2->_familyDSIDs = (NSArray *)&__NSArray0__struct;

    v3->_includeFamily = 0;
    v5 = objc_alloc_init(NBSearchDataSource);
    searchDataSource = v3->_searchDataSource;
    v3->_searchDataSource = v5;
  }
  return v3;
}

- (void)setFamilyDSIDs:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  familyDSIDs = self->_familyDSIDs;
  self->_familyDSIDs = v4;

  if ([(NBSearchResultsViewController *)self includeFamily])
  {
    v6 = self->_familyDSIDs;
    id v7 = [(NBSearchResultsViewController *)self searchDataSource];
    [v7 setFamilyDSIDs:v6];
  }
}

- (void)setIncludeFamily:(BOOL)a3
{
  self->_includeFamily = a3;
  if (a3) {
    familyDSIDs = self->_familyDSIDs;
  }
  else {
    familyDSIDs = (NSArray *)&__NSArray0__struct;
  }
  id v4 = [(NBSearchResultsViewController *)self searchDataSource];
  [v4 setFamilyDSIDs:familyDSIDs];
}

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v17 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSMutableArray array];
    [(NBSearchResultsViewController *)self searchResults];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        v10 = BUDynamicCast();
        if (v10)
        {
          v11 = [(NBSearchResultsViewController *)self _specifierForMediaItem:v10];
          if (v11) {
            goto LABEL_9;
          }
        }
        else
        {
          objc_opt_class();
          v12 = BUDynamicCast();
          if (v12)
          {
            v11 = [(NBSearchResultsViewController *)self _specifierForJaliscoItem:v12];
          }
          else
          {
            v11 = 0;
          }

          if (v11)
          {
LABEL_9:
            [v4 addObject:v11];
            goto LABEL_17;
          }
        }
        v13 = NBDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v9;
          _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Attempted to format search result of invalid type (%@)", buf, 0xCu);
        }

LABEL_17:
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (!v6)
      {
LABEL_19:
        id v14 = [v4 copy];
        v15 = *(void **)&self->PSListController_opaque[v17];
        *(void *)&self->PSListController_opaque[v17] = v14;

        v3 = *(void **)&self->PSListController_opaque[v17];
        break;
      }
    }
  }

  return v3;
}

- (void)searchForString:(id)a3
{
  id v4 = a3;
  id v5 = [(NBSearchResultsViewController *)self searchDataSource];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8814;
  v6[3] = &unk_20A28;
  v6[4] = self;
  [v5 filterResultsUsingSearchString:v4 completion:v6];
}

- (id)_specifierForMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "bk_effectiveTitle");
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v7 = objc_msgSend(v4, "bk_effectiveTitle");
  [v6 setProperty:v7 forKey:NMBUISpecifierTitleKey];

  objc_super v8 = objc_msgSend(v4, "bk_effectiveAuthor");
  [v6 setProperty:v8 forKey:NMBUISpecifierSubtitleKey];

  [v6 setProperty:&off_21A18 forKey:PSTableCellStyleOverrideKey];
  uint64_t v9 = [v4 artworkCatalog];
  [v6 setProperty:v9 forKey:NMBUISpecifierArtworkCatalogKey];

  v10 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v6 setProperty:v10 forKey:NMBUISpecifierPlaceholderImageKey];

  v11 = objc_msgSend(v4, "bk_storeID");

  v12 = [(NBSearchResultsViewController *)self delegate];
  LODWORD(v4) = [v12 selectAudiobookAdamIdAlreadyPinned:v11];

  if (v4) {
    [v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }

  return v6;
}

- (id)_specifierForJaliscoItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  uint64_t v7 = [v4 title];
  [v6 setProperty:v7 forKey:NMBUISpecifierTitleKey];

  objc_super v8 = [v4 artist];
  [v6 setProperty:v8 forKey:NMBUISpecifierSubtitleKey];

  [v6 setProperty:&off_21A18 forKey:PSTableCellStyleOverrideKey];
  uint64_t v9 = [v4 artworkCatalog];
  [v6 setProperty:v9 forKey:NMBUISpecifierArtworkCatalogKey];

  v10 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v6 setProperty:v10 forKey:NMBUISpecifierPlaceholderImageKey];

  v11 = [v4 storeID];

  v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 longLongValue]);

  v13 = [(NBSearchResultsViewController *)self delegate];
  LODWORD(v10) = [v13 selectAudiobookAdamIdAlreadyPinned:v12];

  if (v10) {
    [v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  uint64_t v9 = [(NBSearchResultsViewController *)self searchResults];
  id v10 = [v9 count];

  if (v8 >= v10)
  {
    v16 = NBDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_13488(self, v7);
    }
    goto LABEL_14;
  }
  v11 = [(NBSearchResultsViewController *)self searchDataSource];
  v12 = [v11 items];
  v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

  objc_opt_class();
  id v14 = BUDynamicCast();
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "bk_storeID");
  }
  else
  {
    objc_opt_class();
    uint64_t v17 = BUDynamicCast();
    v18 = v17;
    if (v17)
    {
      long long v19 = [v17 storeID];
      v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "nb_uint64_t"));
    }
    else
    {
      long long v20 = NBDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_133F8((uint64_t)v13, v7);
      }

      v16 = 0;
    }
  }
  if (v16)
  {
    long long v21 = [(NBSearchResultsViewController *)self delegate];
    [v21 selectAudiobookDidSelectAudiobookWithAdamId:v16];

LABEL_14:
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (BOOL)includeFamily
{
  return self->_includeFamily;
}

- (NSArray)familyDSIDs
{
  return self->_familyDSIDs;
}

- (NBSelectAudiobookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NBSelectAudiobookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NBSearchDataSource)searchDataSource
{
  return self->_searchDataSource;
}

- (void)setSearchDataSource:(id)a3
{
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_familyDSIDs, 0);
}

@end