@interface DMCManagedMediaViewController
- (DMCApplicationProxy)app;
- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedApp:(id)a4;
- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedBook:(id)a4;
- (DMCProfileViewModel)profileViewModel;
- (MDMBook)book;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_profileChanged:(id)a3;
- (void)_reloadTable:(id)a3;
- (void)_setup;
- (void)dealloc;
- (void)setApp:(id)a3;
- (void)setBook:(id)a3;
- (void)setProfileViewModel:(id)a3;
@end

@implementation DMCManagedMediaViewController

- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedApp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  v9 = [(DMCProfileTableViewController *)&v12 initWithStyle:2];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_app, a4);
    objc_storeStrong((id *)&v10->_profileViewModel, a3);
    [(DMCManagedMediaViewController *)v10 _setup];
  }

  return v10;
}

- (DMCManagedMediaViewController)initWithProfileViewModel:(id)a3 managedBook:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  v9 = [(DMCProfileTableViewController *)&v12 initWithStyle:2];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_book, a4);
    objc_storeStrong((id *)&v10->_profileViewModel, a3);
    [(DMCManagedMediaViewController *)v10 _setup];
  }

  return v10;
}

- (void)_setup
{
  v13.receiver = self;
  v13.super_class = (Class)DMCManagedMediaViewController;
  [(DMCProfileTableViewController *)&v13 updateExtendedLayoutIncludesOpaqueBars];
  v4 = [(DMCManagedMediaViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"MCUIManagedMediaSummaryCell"];

  v5 = [(DMCManagedMediaViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"MCUIManagedMediaDetailsCell"];

  v12.receiver = self;
  v12.super_class = (Class)DMCManagedMediaViewController;
  [(DMCProfileTableViewController *)&v12 reloadTableOnContentSizeCategoryChange];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__profileChanged_ name:@"kMCUIProfileDidChangeNotification" object:0];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__reloadTable_ name:@"kMCUIBridgeIconLoadedNotification" object:0];

  id v8 = [(DMCManagedMediaViewController *)self app];
  v9 = [v8 name];
  v10 = v9;
  if (!v9)
  {
    v2 = [(DMCManagedMediaViewController *)self book];
    v10 = [v2 friendlyName];
  }
  v11 = [(DMCManagedMediaViewController *)self navigationItem];
  [v11 setTitle:v10];

  if (!v9)
  {
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMCManagedMediaViewController;
  [(DMCProfileTableViewController *)&v4 dealloc];
}

- (void)_profileChanged:(id)a3
{
  id v4 = a3;
  v5 = [(DMCManagedMediaViewController *)self app];
  if (v5)
  {
    v6 = [v4 userInfo];
    if (v6)
    {
      id v7 = [v4 userInfo];
      id v8 = [v7 objectForKeyedSubscript:@"kMCUIManagedAppsDidChange"];
      char v9 = [v8 BOOLValue];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  v10 = [(DMCManagedMediaViewController *)self book];
  if (v10)
  {
    v11 = [v4 userInfo];
    if (v11)
    {
      objc_super v12 = [v4 userInfo];
      objc_super v13 = [v12 objectForKeyedSubscript:@"kMCUIManagedBooksDidChange"];
      char v14 = [v13 BOOLValue];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__DMCManagedMediaViewController__profileChanged___block_invoke;
  block[3] = &unk_2645E9780;
  objc_copyWeak(&v16, &location);
  char v17 = v9;
  char v18 = v14;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __49__DMCManagedMediaViewController__profileChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    if (*(unsigned char *)(a1 + 40))
    {
      v3 = [WeakRetained profileViewModel];
      id v4 = [v10 app];
      v5 = [v4 bundleID];
      char v6 = [v3 managesAppID:v5];
    }
    else
    {
      if (!*(unsigned char *)(a1 + 41))
      {
        id v8 = [WeakRetained tableView];
        [v8 reloadData];
LABEL_9:

        id WeakRetained = v10;
        goto LABEL_10;
      }
      v3 = [WeakRetained profileViewModel];
      id v4 = [v10 book];
      v5 = [v4 persistentID];
      char v6 = [v3 managesBook:v5];
    }
    char v7 = v6;

    id WeakRetained = v10;
    if (v7) {
      goto LABEL_10;
    }
    id v8 = [v10 navigationController];
    id v9 = (id)[v8 popViewControllerAnimated:1];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_reloadTable:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__DMCManagedMediaViewController__reloadTable___block_invoke;
  v3[3] = &unk_2645E9398;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __46__DMCManagedMediaViewController__reloadTable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained tableView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v4 = [(DMCManagedMediaViewController *)self tableView];
  [v4 rowHeight];
  double v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 row]) {
    id v8 = @"MCUIManagedMediaDetailsCell";
  }
  else {
    id v8 = @"MCUIManagedMediaSummaryCell";
  }
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  id v10 = [(DMCManagedMediaViewController *)self app];

  if (v10)
  {
    v11 = [(DMCManagedMediaViewController *)self app];
    [v9 setManagedApp:v11];
  }
  else
  {
    objc_super v12 = [(DMCManagedMediaViewController *)self book];

    if (!v12) {
      goto LABEL_9;
    }
    v11 = [(DMCManagedMediaViewController *)self book];
    [v9 setManagedBook:v11];
  }

LABEL_9:
  return v9;
}

- (DMCProfileViewModel)profileViewModel
{
  return self->_profileViewModel;
}

- (void)setProfileViewModel:(id)a3
{
}

- (DMCApplicationProxy)app
{
  return self->_app;
}

- (void)setApp:(id)a3
{
}

- (MDMBook)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_book, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_profileViewModel, 0);
}

@end