@interface FBKOSLogViewController
+ (BOOL)canDisplayURL:(id)a3;
- (BOOL)isLoading;
- (BOOL)previousToolbarHidden;
- (FBKOSLogViewerDataSource)logSource;
- (NSURL)logURL;
- (UIActivityIndicatorView)spinner;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)nextPage;
- (void)scrollViewDidScroll:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setLogSource:(id)a3;
- (void)setLogURL:(id)a3;
- (void)setOSLogURL:(id)a3;
- (void)setPreviousToolbarHidden:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)shareArchive:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FBKOSLogViewController

+ (BOOL)canDisplayURL:(id)a3
{
  v3 = [a3 pathExtension];
  v4 = [v3 lowercaseString];
  char v5 = [v4 isEqualToString:@"logarchive"];

  return v5;
}

- (void)setOSLogURL:(id)a3
{
  id v4 = a3;
  [(FBKOSLogViewController *)self setLogURL:v4];
  char v5 = [(FBKOSLogViewController *)self logURL];
  v6 = [v5 lastPathComponent];
  v7 = [(FBKOSLogViewController *)self navigationItem];
  [v7 setTitle:v6];

  objc_initWeak(&location, self);
  v8 = [FBKOSLogViewerDataSource alloc];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__FBKOSLogViewController_setOSLogURL___block_invoke;
  v12[3] = &unk_2648740C0;
  objc_copyWeak(&v13, &location);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__FBKOSLogViewController_setOSLogURL___block_invoke_2;
  v10[3] = &unk_2648740E8;
  objc_copyWeak(&v11, &location);
  v9 = [(FBKOSLogViewerDataSource *)v8 initWithArchive:v4 pageSize:200 pageCompletion:v12 error:v10];
  [(FBKOSLogViewController *)self setLogSource:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __38__FBKOSLogViewController_setOSLogURL___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLoading:0];

  id v4 = objc_loadWeakRetained(v1);
  v3 = [v4 tableView];
  [v3 reloadData];
}

void __38__FBKOSLogViewController_setOSLogURL___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLoading:0];

  id v4 = objc_loadWeakRetained(v1);
  v3 = [v4 tableView];
  [v3 reloadData];
}

- (void)viewDidLoad
{
  v13[3] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)FBKOSLogViewController;
  [(FBKOSLogViewController *)&v12 viewDidLoad];
  v3 = [(FBKOSLogViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  id v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v4 sizeToFit];
  [v4 setAutoresizingMask:45];
  [(FBKOSLogViewController *)self setSpinner:v4];
  char v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v4];
  v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v7 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:9 target:self action:sel_shareArchive_];
  v13[0] = v7;
  v13[1] = v6;
  v13[2] = v5;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  [(FBKOSLogViewController *)self setToolbarItems:v8 animated:0];

  [(FBKOSLogViewController *)self setLoading:0];
  double v9 = *MEMORY[0x263F839B8];
  v10 = [(FBKOSLogViewController *)self tableView];
  [v10 setRowHeight:v9];

  id v11 = [(FBKOSLogViewController *)self tableView];
  [v11 setEstimatedRowHeight:80.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FBKOSLogViewController;
  [(FBKOSLogViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(FBKOSLogViewController *)self navigationController];
  objc_msgSend(v4, "setToolbarHidden:", -[FBKOSLogViewController previousToolbarHidden](self, "previousToolbarHidden"));
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(FBKOSLogViewController *)self navigationController];
  -[FBKOSLogViewController setPreviousToolbarHidden:](self, "setPreviousToolbarHidden:", [v5 isToolbarHidden]);

  v7.receiver = self;
  v7.super_class = (Class)FBKOSLogViewController;
  [(FBKOSLogViewController *)&v7 viewWillAppear:v3];
  v6 = [(FBKOSLogViewController *)self navigationController];
  [v6 setToolbarHidden:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKOSLogViewController;
  [(FBKOSLogViewController *)&v6 viewDidAppear:a3];
  id v4 = [(FBKOSLogViewController *)self logSource];
  char v5 = [v4 foundCorruptDate];

  if ((v5 & 1) == 0) {
    [(FBKOSLogViewController *)self nextPage];
  }
}

- (void)shareArchive:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(FBKOSLogViewController *)self logURL];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F6BC98]);
    objc_super v7 = [(FBKOSLogViewController *)self logURL];
    v20[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    double v9 = (void *)[v6 initWithActivityItems:v8 applicationActivities:0];

    v10 = [v9 popoverPresentationController];
    [v10 setBarButtonItem:v4];

    id v11 = [v9 popoverPresentationController];
    [v11 setPermittedArrowDirections:2];

    uint64_t v12 = *MEMORY[0x263F6BD28];
    v19[0] = *MEMORY[0x263F6BD10];
    v19[1] = v12;
    uint64_t v13 = *MEMORY[0x263F6BD40];
    v19[2] = *MEMORY[0x263F6BD38];
    v19[3] = v13;
    uint64_t v14 = *MEMORY[0x263F6BCE0];
    v19[4] = *MEMORY[0x263F6BCE8];
    v19[5] = v14;
    uint64_t v15 = *MEMORY[0x263F6BCD0];
    v19[6] = *MEMORY[0x263F6BD48];
    v19[7] = v15;
    uint64_t v16 = *MEMORY[0x263F6BD30];
    v19[8] = *MEMORY[0x263F6BD18];
    v19[9] = v16;
    v19[10] = *MEMORY[0x263F6BD20];
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:11];
    [v9 setExcludedActivityTypes:v17];

    v18 = [(FBKOSLogViewController *)self navigationController];
    [v18 presentViewController:v9 animated:1 completion:0];
  }
}

- (void)nextPage
{
  [(FBKOSLogViewController *)self setLoading:1];
  id v3 = [(FBKOSLogViewController *)self logSource];
  [v3 nextPage];
}

- (void)setLoading:(BOOL)a3
{
  BOOL v3 = a3;
  self->_loading = a3;
  id v4 = [(FBKOSLogViewController *)self spinner];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(FBKOSLogViewController *)self logSource];
  char v6 = [v5 foundCorruptDate];

  if (v6) {
    return 1;
  }
  v8 = [(FBKOSLogViewController *)self logSource];
  int64_t v9 = [v8 numberOfLogs];

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"FBKOSLogCell"];
  if (!v7) {
    objc_super v7 = [[FBKOSLogTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"FBKOSLogCell"];
  }
  v8 = [(FBKOSLogViewController *)self logSource];
  int v9 = [v8 foundCorruptDate];

  if (v9)
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [(__CFString *)v10 localizedStringForKey:@"CORRUPT_FILE" value:&stru_26DDF6A30 table:0];
    uint64_t v12 = [(FBKOSLogTableViewCell *)v7 logLabel];
    [v12 setText:v11];
  }
  else
  {
    uint64_t v13 = [(FBKOSLogViewController *)self logSource];
    objc_msgSend(v13, "logAtIndex:", objc_msgSend(v6, "row"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v10) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = @"-";
    }
    id v11 = [(FBKOSLogTableViewCell *)v7 logLabel];
    [v11 setText:v14];
  }

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 bounds];
  double v8 = v6 + v7;
  [v4 contentSize];
  uint64_t v10 = (uint64_t)(v9 - (double)(uint64_t)v8);
  [v4 bounds];
  double v12 = v11;

  if (v10 <= (uint64_t)(v12 * 20.0))
  {
    uint64_t v13 = [(FBKOSLogViewController *)self logSource];
    char v14 = [v13 foundCorruptDate];

    if ((v14 & 1) == 0 && ![(FBKOSLogViewController *)self isLoading])
    {
      uint64_t v15 = [(FBKOSLogViewController *)self logSource];
      int v16 = [v15 hasMoreLogs];

      if (v16)
      {
        [(FBKOSLogViewController *)self nextPage];
      }
    }
  }
}

- (NSURL)logURL
{
  return (NSURL *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setLogURL:(id)a3
{
}

- (FBKOSLogViewerDataSource)logSource
{
  return (FBKOSLogViewerDataSource *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setLogSource:(id)a3
{
}

- (BOOL)previousToolbarHidden
{
  return self->_previousToolbarHidden;
}

- (void)setPreviousToolbarHidden:(BOOL)a3
{
  self->_previousToolbarHidden = a3;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (UIActivityIndicatorView)spinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinner);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_spinner);
  objc_storeStrong((id *)&self->_logSource, 0);

  objc_storeStrong((id *)&self->_logURL, 0);
}

@end