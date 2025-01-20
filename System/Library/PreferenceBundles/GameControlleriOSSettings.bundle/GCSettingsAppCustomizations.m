@interface GCSettingsAppCustomizations
- (NSArray)apps;
- (NSArray)filteredApps;
- (UISearchController)searchController;
- (id)newSpecifiers;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dismissView:(id)a3;
- (void)setApps:(id)a3;
- (void)setFilteredApps:(id)a3;
- (void)setSearchController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation GCSettingsAppCustomizations

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)GCSettingsAppCustomizations;
  [(GCSettingsAppCustomizations *)&v17 viewDidLoad];
  [(GCSettingsAppCustomizations *)self setFilteredApps:0];
  id v3 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
  [(GCSettingsAppCustomizations *)self setSearchController:v3];

  v4 = [(GCSettingsAppCustomizations *)self searchController];
  [v4 setSearchResultsUpdater:self];

  v5 = [(GCSettingsAppCustomizations *)self searchController];
  v6 = [v5 searchBar];
  [v6 setKeyboardType:0];

  v7 = sub_CF14(@"SEARCH_APPS_PLACEHOLDER");
  v8 = [(GCSettingsAppCustomizations *)self searchController];
  v9 = [v8 searchBar];
  [v9 setPlaceholder:v7];

  v10 = [(GCSettingsAppCustomizations *)self searchController];
  v11 = [v10 searchBar];
  [v11 setAutocorrectionType:1];

  v12 = [(GCSettingsAppCustomizations *)self searchController];
  v13 = [(GCSettingsAppCustomizations *)self navigationItem];
  [v13 setSearchController:v12];

  v14 = [(GCSettingsAppCustomizations *)self navigationItem];
  [v14 setHidesSearchBarWhenScrolling:0];

  [(GCSettingsAppCustomizations *)self setDefinesPresentationContext:1];
  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissView:"];
  v16 = [(GCSettingsAppCustomizations *)self navigationItem];
  [v16 setRightBarButtonItem:v15];
}

- (void)dismissView:(id)a3
{
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [(GCSettingsAppCustomizations *)self newSpecifiers];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)newSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(GCSettingsAppCustomizations *)self filteredApps];
  if (v4) {
    [(GCSettingsAppCustomizations *)self filteredApps];
  }
  else {
  id v5 = [(GCSettingsAppCustomizations *)self apps];
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        v13 = [v12 localizedName];
        v8 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

        [v8 setProperty:v12 forKey:@"ApplicationRecord"];
        [v3 addObject:v8];
        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  return v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(GCSettingsAppCustomizations *)self filteredApps];
  if (v5) {
    [(GCSettingsAppCustomizations *)self filteredApps];
  }
  else {
  id v6 = [(GCSettingsAppCustomizations *)self apps];
  }

  [v4 setBackgroundView:0];
  if ([v6 count])
  {
    int64_t v7 = 1;
  }
  else
  {
    v8 = [(GCSettingsAppCustomizations *)self apps];

    if (v6 == v8)
    {
      id v9 = objc_alloc_init((Class)UILabel);
      v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [v9 setFont:v10];

      [v9 setNumberOfLines:0];
      v11 = sub_CF14(@"NO_INSTALLED_APPS_DESC");
      [v9 setText:v11];

      v12 = +[UIColor systemGrayColor];
      [v9 setTextColor:v12];

      [v9 setTextAlignment:1];
      [v9 sizeToFit];
      [v4 setBackgroundView:v9];
      [v4 setSeparatorStyle:0];
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(GCSettingsAppCustomizations *)self filteredApps];
  if (v5) {
    [(GCSettingsAppCustomizations *)self filteredApps];
  }
  else {
  id v6 = [(GCSettingsAppCustomizations *)self apps];
  }
  id v7 = [v6 count];

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)GCSettingsAppCustomizations;
  id v6 = a4;
  id v7 = [(GCSettingsAppCustomizations *)&v17 tableView:a3 cellForRowAtIndexPath:v6];
  v8 = -[GCSettingsAppCustomizations specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v17.receiver, v17.super_class);

  id v9 = [v8 propertyForKey:@"ApplicationRecord"];
  v10 = [v7 titleLabel];
  v11 = [v9 localizedName];
  [v10 setText:v11];

  v12 = [v9 bundleIdentifier];
  v13 = +[GCSettingsAppIcon appIconImageForBundleIdentifier:v12];
  v14 = [v13 UIImage];

  [v8 setProperty:v14 forKey:PSIconImageKey];
  id v15 = [v7 iconImageView];
  [v15 setImage:v14];

  return v7;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  v11 = [v4 text];

  id v5 = [(__CFString *)v11 length];
  id v6 = &stru_118E68;
  if (v5) {
    id v6 = v11;
  }
  id v7 = v6;
  [(GCSettingsAppCustomizations *)self setFilteredApps:0];
  if ([(__CFString *)v7 length])
  {
    v8 = [(GCSettingsAppCustomizations *)self apps];
    id v9 = +[NSPredicate predicateWithFormat:@"localizedName CONTAINS[c] %@", v7];
    v10 = [v8 filteredArrayUsingPredicate:v9];
    [(GCSettingsAppCustomizations *)self setFilteredApps:v10];
  }
  [(GCSettingsAppCustomizations *)self reloadSpecifiers];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndex:](self->_apps, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(GCSettingsAppCustomizations *)self parentController];
  id v6 = objc_alloc((Class)GCControllerSettings);
  id v7 = [v10 bundleIdentifier];
  v8 = [v5 device];
  id v9 = [v6 initWithBundleIdentifier:v7 forController:v8];

  [v9 setCustomizationsEnabled:1];
  [v5 reloadSpecifiers];
  [(GCSettingsAppCustomizations *)self dismissViewControllerAnimated:1 completion:0];
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (NSArray)filteredApps
{
  return self->_filteredApps;
}

- (void)setFilteredApps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredApps, 0);
  objc_storeStrong((id *)&self->_searchController, 0);

  objc_storeStrong((id *)&self->_apps, 0);
}

@end