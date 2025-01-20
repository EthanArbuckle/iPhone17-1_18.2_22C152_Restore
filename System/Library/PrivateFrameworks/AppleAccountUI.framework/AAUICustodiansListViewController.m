@interface AAUICustodiansListViewController
- (AAUICustodiansListViewController)initWithContacts:(id)a3;
- (id)_pictureStore;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_setupTableView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation AAUICustodiansListViewController

- (AAUICustodiansListViewController)initWithContacts:(id)a3
{
  id v4 = a3;
  v5 = [[AAUIOBCustodiansListViewModel alloc] initWithContacts:v4];

  viewModel = self->_viewModel;
  self->_viewModel = v5;

  v7 = self->_viewModel;
  v9.receiver = self;
  v9.super_class = (Class)AAUICustodiansListViewController;
  return [(AAUIOBTableWelcomeController *)&v9 initWithViewModel:v7];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AAUICustodiansListViewController;
  [(AAUIOBTableWelcomeController *)&v3 viewDidLoad];
  [(AAUICustodiansListViewController *)self _setupTableView];
}

- (void)_setupTableView
{
  objc_super v3 = [(OBTableWelcomeController *)self tableView];
  [v3 setDelegate:self];

  id v4 = [(OBTableWelcomeController *)self tableView];
  [v4 setDataSource:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(AAOBCustodiansListViewModel *)self->_viewModel contacts];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"CustodiansListCell"];
  if (!v7) {
    v7 = [[AAUITrustedContactCell alloc] initWithStyle:0 reuseIdentifier:@"CustodiansListCell"];
  }
  v8 = [(AAOBCustodiansListViewModel *)self->_viewModel contacts];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  v11 = [(AAUICustodiansListViewController *)self _pictureStore];
  [(AAUITrustedContactCell *)v7 updateWithContact:v10 pictureStore:v11];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)_pictureStore
{
  pictureStore = self->_pictureStore;
  if (!pictureStore)
  {
    id v4 = (AAUIProfilePictureStore *)objc_opt_new();
    int64_t v5 = self->_pictureStore;
    self->_pictureStore = v4;

    pictureStore = self->_pictureStore;
  }
  return pictureStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end