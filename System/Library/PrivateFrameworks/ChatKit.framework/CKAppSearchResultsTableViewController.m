@interface CKAppSearchResultsTableViewController
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (CKBrowserAppManagerViewControllerDelegate)delegate;
- (NSArray)allPlugins;
- (NSArray)searchResults;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)searchEnded;
- (void)setAllPlugins:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
@end

@implementation CKAppSearchResultsTableViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CKAppSearchResultsTableViewController;
  [(CKAppSearchResultsTableViewController *)&v8 viewDidLoad];
  v3 = [(CKAppSearchResultsTableViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  v5 = +[CKAppManagerAppTableViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];

  [(CKAppSearchResultsTableViewController *)self setClearsSelectionOnViewWillAppear:0];
  v6 = [(CKAppSearchResultsTableViewController *)self editButtonItem];
  v7 = [(CKAppSearchResultsTableViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];
}

- (void)searchEnded
{
  [(CKAppSearchResultsTableViewController *)self setSearchResults:0];
  id v3 = [(CKAppSearchResultsTableViewController *)self tableView];
  [v3 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(CKAppSearchResultsTableViewController *)self searchResults];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  v6 = [(CKAppSearchResultsTableViewController *)self searchResults];
  v7 = [v6 objectAtIndex:v5];

  if (v7)
  {
    objc_super v8 = [CKAppManagerAppTableViewCell alloc];
    v9 = +[CKAppManagerAppTableViewCell reuseIdentifier];
    v10 = [(CKAppManagerAppTableViewCell *)v8 initWithStyle:0 reuseIdentifier:v9];

    [(CKAppManagerAppTableViewCell *)v10 updateCellWithPluginInfo:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && [v6 row] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v8 = [(CKAppSearchResultsTableViewController *)self searchResults];
    v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));

    if (v9)
    {
      v10 = +[CKBalloonPluginManager sharedInstance];
      v11 = [v10 visibleDrawerPlugins];
      char v12 = [v11 containsObject:v9];

      if ((v12 & 1) == 0)
      {
        v13 = [v9 identifier];
        [v10 updateInteractionTimeForPlugin:v13];

        [v10 commitInteractionTimeOrderingChanges];
      }
      v14 = [(CKAppSearchResultsTableViewController *)self delegate];
      [v14 browserAppManagerDidSelectPlugin:v9];
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
  }
  v15 = [(CKAppSearchResultsTableViewController *)self tableView];
  [v15 deselectRowAtIndexPath:v7 animated:1];
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  uint64_t v4 = [a3 searchBar];
  id v9 = [v4 text];

  if ([v9 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"browserDisplayName contains[cd] %@", v9];
    id v6 = [(CKAppSearchResultsTableViewController *)self allPlugins];
    v7 = [v6 filteredArrayUsingPredicate:v5];

    [(CKAppSearchResultsTableViewController *)self setSearchResults:v7];
    objc_super v8 = [(CKAppSearchResultsTableViewController *)self tableView];
    [v8 reloadData];
  }
  else
  {
    [(CKAppSearchResultsTableViewController *)self setSearchResults:0];
    uint64_t v5 = [(CKAppSearchResultsTableViewController *)self tableView];
    [v5 reloadData];
  }
}

- (NSArray)allPlugins
{
  return self->_allPlugins;
}

- (void)setAllPlugins:(id)a3
{
}

- (CKBrowserAppManagerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserAppManagerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_allPlugins, 0);
}

@end