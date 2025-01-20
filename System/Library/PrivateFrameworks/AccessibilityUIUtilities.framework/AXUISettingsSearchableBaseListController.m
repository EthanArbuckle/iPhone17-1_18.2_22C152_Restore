@interface AXUISettingsSearchableBaseListController
- (BOOL)_specifierIsGroupSpecifier:(id)a3;
- (BOOL)shouldShowSpecifier:(id)a3 withSearchText:(id)a4;
- (NSArray)allSpecifiers;
- (NSString)searchText;
- (UISearchController)searchController;
- (id)makeSpecifiers;
- (id)specifiers;
- (void)_loadAllSpecifiersIfNeeded;
- (void)deactivateAndPersistSearchText;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setAllSpecifiers:(id)a3;
- (void)setNeedsSpecifierRefresh;
- (void)setSearchController:(id)a3;
- (void)setSearchText:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation AXUISettingsSearchableBaseListController

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)AXUISettingsSearchableBaseListController;
  [(AXUISettingsSetupCapableListController *)&v12 viewDidLoad];
  v3 = (UISearchController *)[objc_alloc(MEMORY[0x1E4FB1BF8]) initWithSearchResultsController:0];
  searchController = self->_searchController;
  self->_searchController = v3;

  [(UISearchController *)self->_searchController setSearchResultsUpdater:self];
  [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
  v5 = [(UISearchController *)self->_searchController searchBar];
  [v5 setDelegate:self];

  v6 = [(UISearchController *)self->_searchController searchBar];
  [v6 setAutocapitalizationType:0];

  v7 = [(UISearchController *)self->_searchController searchBar];
  [v7 setKeyboardType:0];

  v8 = [(UISearchController *)self->_searchController searchBar];
  [v8 setAutocorrectionType:1];

  v9 = self->_searchController;
  v10 = [(AXUISettingsSearchableBaseListController *)self navigationItem];
  [v10 setSearchController:v9];

  v11 = [(AXUISettingsSearchableBaseListController *)self navigationItem];
  [v11 setHidesSearchBarWhenScrolling:0];

  [(AXUISettingsSearchableBaseListController *)self setDefinesPresentationContext:1];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  cachedSearchTextWhileDeactivating = self->_cachedSearchTextWhileDeactivating;
  id v5 = a3;
  if ([(NSString *)cachedSearchTextWhileDeactivating length])
  {
    [(AXUISettingsSearchableBaseListController *)self setSearchText:self->_cachedSearchTextWhileDeactivating];
  }
  else
  {
    v6 = [v5 searchBar];
    v7 = [v6 text];
    [(AXUISettingsSearchableBaseListController *)self setSearchText:v7];
  }
  char v8 = [v5 isActive];

  if ((v8 & 1) == 0)
  {
    v9 = self->_cachedSearchTextWhileDeactivating;
    self->_cachedSearchTextWhileDeactivating = 0;
  }
  [(AXUISettingsSearchableBaseListController *)self reloadSpecifiers];
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self->_cachedSearchTextWhileDeactivating length]) {
    [v4 setText:self->_cachedSearchTextWhileDeactivating];
  }
}

- (id)specifiers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(AXUISettingsSearchableBaseListController *)self _loadAllSpecifiersIfNeeded];
  v3 = (id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F08]);
  if (!*v3)
  {
    if (![(NSString *)self->_searchText length])
    {
      objc_storeStrong(v3, self->_allSpecifiers);
      goto LABEL_24;
    }
    v20 = v3;
    v21 = objc_opt_new();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = self->_allSpecifiers;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      char v8 = 0;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v4);
          }
          v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (-[AXUISettingsSearchableBaseListController _specifierIsGroupSpecifier:](self, "_specifierIsGroupSpecifier:", v11, v20))
          {
            if (v8 && [v7 count])
            {
              [v21 addObject:v8];
              [v21 addObjectsFromArray:v7];
            }
            id v12 = v11;

            uint64_t v13 = [MEMORY[0x1E4F1CA48] array];

            v7 = (void *)v13;
            char v8 = v12;
          }
          else
          {
            v14 = [(AXUISettingsSearchableBaseListController *)self searchText];
            BOOL v15 = [(AXUISettingsSearchableBaseListController *)self shouldShowSpecifier:v11 withSearchText:v14];

            if (v15) {
              [v7 addObject:v11];
            }
          }
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);

      if (v8)
      {
        v3 = v20;
        if ([v7 count])
        {
          [v21 addObject:v8];
          [v21 addObjectsFromArray:v7];
        }
        goto LABEL_23;
      }
    }
    else
    {

      char v8 = 0;
      v7 = 0;
    }
    v3 = v20;
LABEL_23:
    id v16 = *v3;
    id *v3 = v21;
    id v17 = v21;
  }
LABEL_24:
  id v18 = *v3;
  return v18;
}

- (void)deactivateAndPersistSearchText
{
  v3 = [(AXUISettingsSearchableBaseListController *)self searchController];
  int v4 = [v3 isActive];

  if (v4)
  {
    uint64_t v5 = [(AXUISettingsSearchableBaseListController *)self searchText];
    cachedSearchTextWhileDeactivating = self->_cachedSearchTextWhileDeactivating;
    self->_cachedSearchTextWhileDeactivating = v5;

    id v7 = [(AXUISettingsSearchableBaseListController *)self searchController];
    [v7 setActive:0];
  }
}

- (void)setNeedsSpecifierRefresh
{
  self->_needsSpecifierRefresh = 1;
}

- (void)_loadAllSpecifiersIfNeeded
{
  if (!self->_allSpecifiers || self->_needsSpecifierRefresh)
  {
    self->_needsSpecifierRefresh = 0;
    v3 = [(AXUISettingsSearchableBaseListController *)self makeSpecifiers];
    allSpecifiers = self->_allSpecifiers;
    self->_allSpecifiers = v3;
    MEMORY[0x1F41817F8](v3, allSpecifiers);
  }
}

- (BOOL)_specifierIsGroupSpecifier:(id)a3
{
  return a3 && *(void *)((char *)a3 + (int)*MEMORY[0x1E4F92F28]) == 0;
}

- (id)makeSpecifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)shouldShowSpecifier:(id)a3 withSearchText:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [v5 name];
    BOOL v8 = [v7 rangeOfString:v6 options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (void)setAllSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_cachedSearchTextWhileDeactivating, 0);
}

@end