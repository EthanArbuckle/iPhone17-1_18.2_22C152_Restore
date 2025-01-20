@interface GKProfilePrivacyTableViewController
- (BOOL)isSendingRequest;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (GKLocalPlayer)localPlayer;
- (GKProfilePrivacyTableViewControllerDelegate)delegate;
- (NSMutableArray)availblePrivacySettings;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableFooterForPrivacy:(int)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleForPrivacy:(int)a3;
- (int)currentPrivacySettings;
- (int)initialPrivacySettings;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setAvailblePrivacySettings:(id)a3;
- (void)setCurrentPrivacySettings:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialPrivacySettings:(int)a3;
- (void)setIsSendingRequest:(BOOL)a3;
- (void)setLocalPlayer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCell:(id)a3 withCheckmark:(BOOL)a4;
- (void)updateTableViewLayoutMargins;
- (void)viewDidLoad;
@end

@implementation GKProfilePrivacyTableViewController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)GKProfilePrivacyTableViewController;
  [(GKProfilePrivacyTableViewController *)&v10 viewDidLoad];
  v3 = GKGameCenterUIFrameworkBundle();
  v4 = GKGetLocalizedStringFromTableInBundle();
  [(GKProfilePrivacyTableViewController *)self setTitle:v4];

  [(GKProfilePrivacyTableViewController *)self setIsSendingRequest:0];
  [(GKProfilePrivacyTableViewController *)self updateTableViewLayoutMargins];
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
  v6 = [v5 profileServicePrivate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__GKProfilePrivacyTableViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E5F63AF0;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  [v6 getProfilePrivacyWithHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__GKProfilePrivacyTableViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setCurrentPrivacySettings:a2];
  objc_msgSend(WeakRetained, "setInitialPrivacySettings:", objc_msgSend(*(id *)(v3 + 32), "currentPrivacySettings"));
  v4 = [MEMORY[0x1E4F1CA48] array];
  [WeakRetained setAvailblePrivacySettings:v4];

  v5 = [MEMORY[0x1E4F63760] local];
  LOBYTE(v3) = [v5 isUnderage];

  if (v3)
  {
    if (![WeakRetained currentPrivacySettings]) {
      [WeakRetained setCurrentPrivacySettings:2];
    }
  }
  else
  {
    v6 = [WeakRetained availblePrivacySettings];
    [v6 addObject:&unk_1F0811C70];
  }
  v7 = [WeakRetained availblePrivacySettings];
  [v7 addObject:&unk_1F0811C88];

  id v8 = [WeakRetained availblePrivacySettings];
  [v8 addObject:&unk_1F0811CA0];

  v9 = [WeakRetained tableView];
  [v9 reloadData];
}

- (void)updateTableViewLayoutMargins
{
  uint64_t v3 = [(GKProfilePrivacyTableViewController *)self traitCollection];
  if ([v3 verticalSizeClass] == 1)
  {

    if (!_os_feature_enabled_impl()) {
      goto LABEL_6;
    }
  }
  else
  {
    v4 = [(GKProfilePrivacyTableViewController *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if (v5 == 1) {
        goto LABEL_6;
      }
      goto LABEL_8;
    }
  }
  v6 = objc_opt_new();
  v7 = [v6 view];
  char v8 = PSShouldInsetListView();

  if (v8)
  {
LABEL_6:
    double v9 = 20.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 20.0;
    goto LABEL_9;
  }
LABEL_8:
  double v11 = *MEMORY[0x1E4FB2848];
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
LABEL_9:
  id v13 = [(GKProfilePrivacyTableViewController *)self tableView];
  objc_msgSend(v13, "_setSectionContentInset:", v11, v9, v10, v12);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKProfilePrivacyTableViewController;
  [(GKProfilePrivacyTableViewController *)&v4 traitCollectionDidChange:a3];
  [(GKProfilePrivacyTableViewController *)self updateTableViewLayoutMargins];
}

- (id)titleForPrivacy:(int)a3
{
  if (a3 > 2)
  {
    objc_super v4 = &stru_1F07B2408;
  }
  else
  {
    uint64_t v3 = GKGameCenterUIFrameworkBundle();
    GKGetLocalizedStringFromTableInBundle();
    objc_super v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)tableFooterForPrivacy:(int)a3
{
  uint64_t v3 = GKGameCenterUIFrameworkBundle();
  objc_super v4 = GKGetLocalizedStringFromTableInBundle();

  return v4;
}

- (void)setIsSendingRequest:(BOOL)a3
{
  self->_isSendingRequest = a3;
  BOOL v4 = !a3;
  uint64_t v5 = [(GKProfilePrivacyTableViewController *)self navigationController];
  v6 = [(id)v5 navigationBar];
  [v6 setUserInteractionEnabled:v4];

  v7 = [(GKProfilePrivacyTableViewController *)self navigationController];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v8 = !self->_isSendingRequest;
    id v10 = [(GKProfilePrivacyTableViewController *)self navigationController];
    double v9 = [v10 interactivePopGestureRecognizer];
    [v9 setEnabled:v8];
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->_availblePrivacySettings count];
}

- (void)updateCell:(id)a3 withCheckmark:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v11 = v5;
  if (v4)
  {
    [v5 setAccessoryType:3];
    [v11 setAccessoryView:0];
    v6 = v11;
  }
  else
  {
    [v5 setAccessoryType:0];
    v7 = objc_opt_new();
    BOOL v8 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v8 scaledValueForValue:20.0];
    double v10 = v9;

    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v10, 20.0);
    [v11 setAccessoryView:v7];

    v6 = v7;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"GKProfilePrivacyTableCell"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"GKProfilePrivacyTableCell"];
    BOOL v8 = [v7 detailTextLabel];
    [v8 setNumberOfLines:0];

    double v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v10 = [v7 detailTextLabel];
    [v10 setTextColor:v9];
  }
  id v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_availblePrivacySettings, "objectAtIndexedSubscript:", [v6 row]);
  uint64_t v12 = [v11 intValue];

  id v13 = [(GKProfilePrivacyTableViewController *)self titleForPrivacy:v12];
  v14 = [v7 textLabel];
  [v14 setText:v13];

  v15 = [(GKProfilePrivacyTableViewController *)self tableFooterForPrivacy:v12];
  v16 = [v7 detailTextLabel];
  [v16 setText:v15];

  [(GKProfilePrivacyTableViewController *)self updateCell:v7 withCheckmark:[(GKProfilePrivacyTableViewController *)self currentPrivacySettings] == v12];

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return ![(GKProfilePrivacyTableViewController *)self isSendingRequest];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_availblePrivacySettings, "objectAtIndexedSubscript:", [v5 row]);
  uint64_t v7 = [v6 intValue];

  if (v7 == [(GKProfilePrivacyTableViewController *)self currentPrivacySettings])
  {
    BOOL v8 = [(GKProfilePrivacyTableViewController *)self tableView];
    [v8 deselectRowAtIndexPath:v5 animated:0];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v9 = [(GKProfilePrivacyTableViewController *)self tableView];
    double v10 = [v9 visibleCells];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          [(GKProfilePrivacyTableViewController *)self updateCell:*(void *)(*((void *)&v28 + 1) + 8 * v14++) withCheckmark:0];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    v15 = [(GKProfilePrivacyTableViewController *)self traitCollection];
    v16 = [v15 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v16)) {
      uint64_t v17 = 101;
    }
    else {
      uint64_t v17 = 100;
    }

    v18 = [(GKProfilePrivacyTableViewController *)self tableView];
    v19 = [v18 cellForRowAtIndexPath:v5];

    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:v17];
    [v20 startAnimating];
    v21 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v21 scaledValueForValue:20.0];
    double v23 = v22;

    [v20 frame];
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v23);
    [v19 setAccessoryView:v20];
    [v19 setAccessoryType:0];
    [(GKProfilePrivacyTableViewController *)self setIsSendingRequest:1];
    v24 = [MEMORY[0x1E4F636C8] proxyForLocalPlayer];
    v25 = [v24 profileServicePrivate];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__GKProfilePrivacyTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v26[3] = &unk_1E5F63B18;
    v26[4] = self;
    int v27 = v7;
    [v25 setProfilePrivacy:v7 handler:v26];
  }
}

void __73__GKProfilePrivacyTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setIsSendingRequest:0];
  if (a2)
  {
    id v13 = [*(id *)(a1 + 32) tableView];
    [v13 reloadData];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F637F8] reporter];
    uint64_t v5 = *MEMORY[0x1E4F63580];
    uint64_t v6 = *MEMORY[0x1E4F63608];
    v14[0] = *MEMORY[0x1E4F63610];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "initialPrivacySettings"));
    v15[0] = v7;
    v14[1] = *MEMORY[0x1E4F63618];
    BOOL v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "currentPrivacySettings"));
    v15[1] = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v4 reportEvent:v5 type:v6 payload:v9];

    [*(id *)(a1 + 32) setCurrentPrivacySettings:*(unsigned int *)(a1 + 40)];
    double v10 = [*(id *)(a1 + 32) tableView];
    [v10 reloadData];

    uint64_t v11 = [*(id *)(a1 + 32) delegate];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) delegate];
      [v12 didUpdateProfilePrivacy:0];
    }
  }
}

- (GKLocalPlayer)localPlayer
{
  return self->_localPlayer;
}

- (void)setLocalPlayer:(id)a3
{
}

- (GKProfilePrivacyTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKProfilePrivacyTableViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)currentPrivacySettings
{
  return self->_currentPrivacySettings;
}

- (void)setCurrentPrivacySettings:(int)a3
{
  self->_currentPrivacySettings = a3;
}

- (int)initialPrivacySettings
{
  return self->_initialPrivacySettings;
}

- (void)setInitialPrivacySettings:(int)a3
{
  self->_initialPrivacySettings = a3;
}

- (NSMutableArray)availblePrivacySettings
{
  return self->_availblePrivacySettings;
}

- (void)setAvailblePrivacySettings:(id)a3
{
}

- (BOOL)isSendingRequest
{
  return self->_isSendingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availblePrivacySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_localPlayer, 0);
}

@end