@interface SFPrivacyReportViewController
- (BOOL)_privacyProxyTip:(int64_t *)a3;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)websiteDetailShouldSeparateBlockedTrackers;
- (NSSet)histories;
- (NSSet)profileIdentifiers;
- (NSString)domain;
- (SFPrivacyReportViewController)initWithDomain:(id)a3;
- (SFPrivacyReportViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SFPrivacyReportViewController)initWithWebView:(id)a3;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_cellForRowWithIndexPath:(id)a3 itemIdentifier:(id)a4;
- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4;
- (int64_t)_sectionTypeFromSectionIndex:(int64_t)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_createTableViewIfNeededLoadingReport:(BOOL)a3;
- (void)_doneBarButtonItemAction:(id)a3;
- (void)_reloadDataLoadingReport:(BOOL)a3;
- (void)_updateLayoutMargins;
- (void)_updateUsesInsetStyle;
- (void)cellDidToggleDetailType:(id)a3;
- (void)cellDidToggleExpandDetailedExplanation:(id)a3;
- (void)cellPrivacyProxyStateChanged:(id)a3;
- (void)cellPrivacyProxyUpsellDismissed:(id)a3;
- (void)setHistories:(id)a3;
- (void)setNeedsUpdateRowHeight;
- (void)setProfileIdentifiers:(id)a3;
- (void)setWebsiteDetailShouldSeparateBlockedTrackers:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SFPrivacyReportViewController

- (SFPrivacyReportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SFPrivacyReportViewController;
  v4 = [(SFPrivacyReportViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    -[SFPrivacyReportViewController setPreferredContentSize:](v4, "setPreferredContentSize:", 540.0, 564.0);
    v6 = v5;
  }

  return v5;
}

- (SFPrivacyReportViewController)initWithDomain:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SFPrivacyReportViewController *)self initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

    v12[0] = objc_opt_class();
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v9 = (id)[(SFPrivacyReportViewController *)v5 registerForTraitChanges:v8 withTarget:v5 action:sel_setNeedsUpdateRowHeight];

    v10 = v5;
  }

  return v5;
}

- (SFPrivacyReportViewController)initWithWebView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 URL];
  v7 = [v6 host];
  objc_super v8 = objc_msgSend(v7, "safari_highLevelDomainFromHost");
  id v9 = [(SFPrivacyReportViewController *)self initWithDomain:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_webView, a3);
    v10 = v9;
  }

  return v9;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SFPrivacyReportViewController;
  [(SFPrivacyReportViewController *)&v12 viewDidLoad];
  v3 = _WBSLocalizedString();
  [(SFPrivacyReportViewController *)self setTitle:v3];

  id v4 = [(SFPrivacyReportViewController *)self navigationItem];
  id v5 = objc_msgSend(v4, "sf_preferredDismissOrDoneButtonItem");

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v7 = objc_msgSend(v6, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverDoneButtonItem"), self, sel__doneBarButtonItemAction_);
    objc_msgSend(v4, "sf_setPreferredDismissOrDoneButtonItem:", v7);
  }
  [(SFPrivacyReportViewController *)self _updateUsesInsetStyle];
  [(SFPrivacyReportViewController *)self _createTableViewIfNeededLoadingReport:1];
  objc_super v8 = (WBSPrivacyReportData *)[objc_alloc(MEMORY[0x1E4F98CF8]) initWithProfileIdentifiers:self->_profileIdentifiers histories:self->_histories];
  privacyReportData = self->_privacyReportData;
  self->_privacyReportData = v8;

  [(WBSPrivacyReportData *)self->_privacyReportData setWebView:self->_webView];
  v10 = self->_privacyReportData;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__SFPrivacyReportViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_1E5C724D8;
  v11[4] = self;
  [(WBSPrivacyReportData *)v10 loadDataWithCompletionHandler:v11];
}

void __44__SFPrivacyReportViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__SFPrivacyReportViewController_viewDidLoad__block_invoke_2;
  block[3] = &unk_1E5C724D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__SFPrivacyReportViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDataLoadingReport:0];
}

- (void)_createTableViewIfNeededLoadingReport:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_usesInsetStyle) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  tableView = self->_tableView;
  if (tableView && [(UITableView *)tableView style] == v5)
  {
    [(SFPrivacyReportViewController *)self _updateLayoutMargins];
  }
  else
  {
    objc_initWeak(&location, self);
    [(UITableView *)self->_tableView removeFromSuperview];
    v7 = [(SFPrivacyReportViewController *)self view];
    id v8 = objc_alloc(MEMORY[0x1E4FB1D00]);
    [v7 bounds];
    id v9 = (UITableView *)objc_msgSend(v8, "initWithFrame:style:", v5);
    v10 = self->_tableView;
    self->_tableView = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UITableView *)self->_tableView setTableHeaderView:v11];

    [(UITableView *)self->_tableView setAutoresizingMask:18];
    [v7 addSubview:self->_tableView];
    [(UITableView *)self->_tableView setDelegate:self];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"trackingProtectionExplanationCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"noReportAvailableCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"gridViewCellIdentifier"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"detailTypeToggleCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"websiteCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"trackerCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"subheaderCell"];
    [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"privacyProxyTipCell"];
    [(SFPrivacyReportViewController *)self _updateLayoutMargins];
    id v12 = objc_alloc(MEMORY[0x1E4F78458]);
    v13 = self->_tableView;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __71__SFPrivacyReportViewController__createTableViewIfNeededLoadingReport___block_invoke;
    v19 = &unk_1E5C72500;
    objc_copyWeak(&v20, &location);
    v14 = (SFTableViewDiffableDataSource *)[v12 initWithTableView:v13 cellProvider:&v16];
    diffableDataSource = self->_diffableDataSource;
    self->_diffableDataSource = v14;

    -[SFTableViewDiffableDataSource setDefaultRowAnimation:](self->_diffableDataSource, "setDefaultRowAnimation:", 0, v16, v17, v18, v19);
    [(SFTableViewDiffableDataSource *)self->_diffableDataSource setDelegate:self];
    [(SFPrivacyReportViewController *)self _reloadDataLoadingReport:v3];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
}

id __71__SFPrivacyReportViewController__createTableViewIfNeededLoadingReport___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v9 = [WeakRetained _cellForRowWithIndexPath:v7 itemIdentifier:v6];

  return v9;
}

- (void)_updateUsesInsetStyle
{
  BOOL v3 = [(SFPrivacyReportViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(SFPrivacyReportViewController *)self preferredContentSize];
  BOOL v9 = v5 >= v8;
  if (v7 < v10) {
    BOOL v9 = 0;
  }
  self->_usesInsetStyle = v9;
}

- (void)_updateLayoutMargins
{
  if (self->_usesInsetStyle) {
    double v3 = 48.0;
  }
  else {
    double v3 = 16.0;
  }
  id v4 = [(UITableView *)self->_tableView tableHeaderView];
  [v4 frame];
  objc_msgSend(v4, "setFrame:");
  [(UITableView *)self->_tableView setTableHeaderView:v4];
  -[UITableView setLayoutMargins:](self->_tableView, "setLayoutMargins:", 35.0, v3, 40.0, v3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__SFPrivacyReportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E5C72528;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

uint64_t __84__SFPrivacyReportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateUsesInsetStyle];
  [*(id *)(a1 + 32) _createTableViewIfNeededLoadingReport:0];
  v2 = *(void **)(*(void *)(a1 + 32) + 976);

  return [v2 reloadData];
}

- (void)_reloadDataLoadingReport:(BOOL)a3
{
  BOOL v3 = a3;
  v49[1] = *MEMORY[0x1E4F143B8];
  self->_showingCurrentWebsite = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  double v6 = v5;
  if (!v3)
  {
    if (([(WBSPrivacyReportData *)self->_privacyReportData hasData] & 1) == 0)
    {
      [v6 appendSectionsWithIdentifiers:&unk_1EFBDF1F0];
      double v7 = [[SFPrivacyReportItem alloc] initWithType:1];
      v48 = v7;
      double v8 = (void *)MEMORY[0x1E4F1C978];
      BOOL v9 = &v48;
      goto LABEL_10;
    }
    [v6 appendSectionsWithIdentifiers:&unk_1EFBDF208];
    double v10 = [[SFPrivacyReportItem alloc] initWithType:2];
    v47 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v6 appendItemsWithIdentifiers:v11];

    if (self->_showExplanationDetailView)
    {
      id v12 = [[SFPrivacyReportItem alloc] initWithType:3];
      v46 = v12;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
      [v6 appendItemsWithIdentifiers:v13];
    }
    [v6 appendSectionsWithIdentifiers:&unk_1EFBDF220];
    v14 = [[SFPrivacyReportItem alloc] initWithType:4];
    v45 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v6 appendItemsWithIdentifiers:v15];

    [v6 appendSectionsWithIdentifiers:&unk_1EFBDF238];
    uint64_t v16 = [[SFPrivacyReportItem alloc] initWithType:5];
    v44 = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v6 appendItemsWithIdentifiers:v17];

    int64_t listDetailType = self->_listDetailType;
    if (listDetailType)
    {
      if (listDetailType != 1)
      {
LABEL_16:
        self->_maxCountForDetailList = fmax(self->_maxCountForDetailList, 10.0);
        goto LABEL_17;
      }
      v19 = [(WBSPrivacyReportData *)self->_privacyReportData knownTrackers];
      id v20 = [v19 firstObject];
      v21 = [v20 firstParties];
      self->_maxCountForDetailList = (double)(unint64_t)[v21 count];

      v22 = [(WBSPrivacyReportData *)self->_privacyReportData knownTrackers];
      v23 = v22;
      v24 = &__block_literal_global_1;
    }
    else
    {
      v26 = [(WBSPrivacyReportData *)self->_privacyReportData trackedFirstParties];
      v27 = [v26 firstObject];
      v28 = [v27 trackers];
      self->_maxCountForDetailList = (double)(unint64_t)[v28 count];

      v29 = [(WBSPrivacyReportData *)self->_privacyReportData trackedFirstParties];
      v23 = v29;
      if (self->_domain)
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_2;
        v42[3] = &unk_1E5C72570;
        v42[4] = self;
        uint64_t v30 = [v29 indexOfObjectPassingTest:v42];
        if (v30 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v31 = v30;
          self->_showingCurrentWebsite = 1;
          v32 = [SFPrivacyReportItem alloc];
          v41 = [v23 objectAtIndexedSubscript:v31];
          v33 = [(SFPrivacyReportItem *)v32 initWithType:6 userInfo:v41];
          v43[0] = v33;
          v34 = [SFPrivacyReportItem alloc];
          v35 = _WBSLocalizedString();
          v36 = [(SFPrivacyReportItem *)v34 initWithType:8 userInfo:v35];
          v43[1] = v36;
          v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
          [v6 appendItemsWithIdentifiers:v37];

          v38 = (void *)[v23 mutableCopy];
          [v38 removeObjectAtIndex:v31];
          uint64_t v39 = [v38 copy];

          v23 = (void *)v39;
        }
      }
      v24 = &__block_literal_global_87;
      v22 = v23;
    }
    v40 = objc_msgSend(v22, "safari_mapObjectsUsingBlock:", v24);
    [v6 appendItemsWithIdentifiers:v40];

    goto LABEL_16;
  }
  [v5 appendSectionsWithIdentifiers:&unk_1EFBDF1D8];
  double v7 = [[SFPrivacyReportItem alloc] initWithType:0];
  v49[0] = v7;
  double v8 = (void *)MEMORY[0x1E4F1C978];
  BOOL v9 = (SFPrivacyReportItem **)v49;
LABEL_10:
  v25 = [v8 arrayWithObjects:v9 count:1];
  [v6 appendItemsWithIdentifiers:v25];

LABEL_17:
  [(SFTableViewDiffableDataSource *)self->_diffableDataSource applySnapshot:v6 animatingDifferences:!v3];
}

SFPrivacyReportItem *__58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[SFPrivacyReportItem alloc] initWithType:7 userInfo:v2];

  return v3;
}

uint64_t __58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 domain];
  uint64_t v4 = [v3 isEqualToString:*(void *)(*(void *)(a1 + 32) + 1056)];

  return v4;
}

SFPrivacyReportItem *__58__SFPrivacyReportViewController__reloadDataLoadingReport___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [[SFPrivacyReportItem alloc] initWithType:6 userInfo:v2];

  return v3;
}

- (void)_doneBarButtonItemAction:(id)a3
{
}

- (int64_t)_sectionTypeFromSectionIndex:(int64_t)a3
{
  uint64_t v4 = [(SFTableViewDiffableDataSource *)self->_diffableDataSource snapshot];
  id v5 = [v4 sectionIdentifiers];
  double v6 = [v5 objectAtIndexedSubscript:a3];
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (id)_cellForRowWithIndexPath:(id)a3 itemIdentifier:(id)a4
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  switch([v7 type])
  {
    case 0:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"loadingReportCell"];
      if (!v8)
      {
        double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"loadingReportCell"];
        [v8 setBackgroundView:0];
        BOOL v9 = [MEMORY[0x1E4FB1618] clearColor];
        [v8 setBackgroundColor:v9];

        double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v11 = [v8 contentView];
        [v11 addSubview:v10];
        v27 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v31 = [v10 centerXAnchor];
        uint64_t v30 = [v11 centerXAnchor];
        v29 = [v31 constraintEqualToAnchor:v30];
        v32[0] = v29;
        v28 = [v10 centerYAnchor];
        v26 = [v11 centerYAnchor];
        id v12 = [v28 constraintEqualToAnchor:v26];
        v32[1] = v12;
        v13 = [v11 heightAnchor];
        v14 = [v10 heightAnchor];
        v15 = [v13 constraintEqualToAnchor:v14 multiplier:1.0 constant:20.0];
        v32[2] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
        [v27 activateConstraints:v16];

        [v10 startAnimating];
        goto LABEL_7;
      }
      break;
    case 1:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"noReportAvailableCell"];
      double v10 = [v8 textLabel];
      [v10 setNumberOfLines:0];
      id v11 = _WBSLocalizedString();
      [v10 setText:v11];
LABEL_7:

      goto LABEL_20;
    case 2:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"trackingProtectionExplanationCell"];
      [v8 setDelegate:self];
      [v8 setExpanded:self->_showExplanationDetailView];
      break;
    case 3:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"gridViewCellIdentifier" forIndexPath:v6];
      uint64_t v17 = [v8 gridView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_14;
      }
      v19 = objc_alloc_init(SFPrivacyReportExplanationDetailView);
      goto LABEL_13;
    case 4:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"gridViewCellIdentifier" forIndexPath:v6];
      id v20 = [v8 gridView];
      objc_opt_class();
      char v21 = objc_opt_isKindOfClass();

      if (v21) {
        goto LABEL_14;
      }
      v19 = (SFPrivacyReportExplanationDetailView *)[objc_alloc(MEMORY[0x1E4F78310]) initWithPrivacyReportDataProvider:self->_privacyReportData];
LABEL_13:
      v22 = v19;
      [(SFPrivacyReportGridView *)v19 setDelegate:self];
      [v8 setGridView:v22];

LABEL_14:
      v23 = [v8 gridView];
      [v23 setUsesInsetStyle:self->_usesInsetStyle];

      break;
    case 5:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"detailTypeToggleCell" forIndexPath:v6];
      [v8 setDetailType:self->_listDetailType];
      [v8 setDelegate:self];
      [v8 setUseCurrentWebsiteHeader:self->_showingCurrentWebsite];
      break;
    case 6:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"websiteCell" forIndexPath:v6];
      v24 = [v7 userInfo];
      [v8 setWebsite:v24];
      goto LABEL_18;
    case 7:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"trackerCell" forIndexPath:v6];
      v24 = [v7 userInfo];
      [v8 setTracker:v24];
LABEL_18:

      [v8 setMaxCount:self->_maxCountForDetailList];
      break;
    case 8:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"subheaderCell" forIndexPath:v6];
      double v10 = [v7 userInfo];
      [v8 setSubheaderText:v10];
LABEL_20:

      break;
    case 9:
    case 10:
    case 11:
    case 12:
      double v8 = [(UITableView *)self->_tableView dequeueReusableCellWithIdentifier:@"privacyProxyTipCell" forIndexPath:v6];
      [v8 setUsesInsetStyle:self->_usesInsetStyle];
      [v8 setDelegate:self];
      break;
    default:
      double v8 = 0;
      break;
  }

  return v8;
}

- (BOOL)_privacyProxyTip:(int64_t *)a3
{
  uint64_t v4 = [MEMORY[0x1E4F98CF0] sharedManager];
  if (![v4 isPrivacyProxyActive]) {
    goto LABEL_3;
  }
  uint64_t v5 = [v4 state];
  int v6 = [v4 isUserAccountInSubscriberTierForPrivacyProxy];
  if (v5 == 2) {
    goto LABEL_3;
  }
  if (v6)
  {
    if (v5 == 1)
    {
      int64_t v9 = 12;
      goto LABEL_15;
    }
    if (!v5)
    {
      int64_t v9 = 11;
LABEL_15:
      *a3 = v9;
      BOOL v7 = 1;
      goto LABEL_4;
    }
  }
  else
  {
    if (v5 != 1)
    {
      int64_t v9 = 9;
      goto LABEL_15;
    }
    double v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v11 = [v10 BOOLForKey:@"PrivacyReportPrivacyProxyDismissed"];

    if ((v11 & 1) == 0 && ([v4 isPrivacyProxyPaidTierUnavailableInUserCountry] & 1) == 0)
    {
      int64_t v9 = 10;
      goto LABEL_15;
    }
  }
LABEL_3:
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (void)cellDidToggleDetailType:(id)a3
{
  self->_int64_t listDetailType = [a3 detailType];

  [(SFPrivacyReportViewController *)self _reloadDataLoadingReport:0];
}

- (void)cellDidToggleExpandDetailedExplanation:(id)a3
{
  self->_showExplanationDetailView = [a3 isExpanded];

  [(SFPrivacyReportViewController *)self _reloadDataLoadingReport:0];
}

- (void)cellPrivacyProxyUpsellDismissed:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults", a3);
  [v4 setBool:1 forKey:@"PrivacyReportPrivacyProxyDismissed"];

  [(SFPrivacyReportViewController *)self _reloadDataLoadingReport:0];
}

- (void)cellPrivacyProxyStateChanged:(id)a3
{
}

- (void)setNeedsUpdateRowHeight
{
  if (!self->_needsRowHeightUpdate)
  {
    objc_initWeak(&location, self);
    self->_needsRowHeightUpdate = 1;
    dispatch_time_t v3 = dispatch_time(0, 0);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__SFPrivacyReportViewController_setNeedsUpdateRowHeight__block_invoke;
    v4[3] = &unk_1E5C725B8;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __56__SFPrivacyReportViewController_setNeedsUpdateRowHeight__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[122] beginUpdates];
    [v2[122] endUpdates];
    id WeakRetained = v2;
    *((unsigned char *)v2 + 1008) = 0;
  }
}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  if ([(SFPrivacyReportViewController *)self _sectionTypeFromSectionIndex:a4] == 3)
  {
    uint64_t v4 = NSString;
    id v5 = _WBSLocalizedString();
    int v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, 30);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  int64_t v4 = [(SFPrivacyReportViewController *)self _sectionTypeFromSectionIndex:a4];
  return v4 == 1 || v4 == 4;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  int64_t v4 = [(SFPrivacyReportViewController *)self _sectionTypeFromSectionIndex:a4];
  return v4 == 1 || v4 == 4;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  int64_t v4 = [(SFTableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:a4];
  uint64_t v5 = [v4 type];

  return (v5 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v14 = [(SFTableViewDiffableDataSource *)self->_diffableDataSource itemIdentifierForIndexPath:v6];

  uint64_t v7 = [v14 type];
  if (v7 == 6)
  {
    char v11 = [SFPrivacyReportWebsiteDetailViewController alloc];
    id v12 = [v14 userInfo];
    double v10 = [(SFPrivacyReportWebsiteDetailViewController *)v11 initWithWebsite:v12];

    [(SFPrivacyReportWebsiteDetailViewController *)v10 setSeparatesBlockedTrackers:self->_websiteDetailShouldSeparateBlockedTrackers];
  }
  else
  {
    if (v7 != 7) {
      goto LABEL_6;
    }
    double v8 = [SFPrivacyReportTrackerDetailViewController alloc];
    int64_t v9 = [v14 userInfo];
    double v10 = [(SFPrivacyReportTrackerDetailViewController *)v8 initWithTracker:v9];
  }
  v13 = [(SFPrivacyReportViewController *)self navigationController];
  [v13 pushViewController:v10 animated:1];

LABEL_6:
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F28D58];
  id v7 = a4;
  double v8 = [v6 indexPathForRow:0 inSection:0];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    [v5 frame];
    double Height = CGRectGetHeight(v13);
    [v5 frame];
    double v11 = fmax(Height, CGRectGetWidth(v14));
  }
  else
  {
    double v11 = *MEMORY[0x1E4FB2F28];
  }

  return v11;
}

- (NSString)domain
{
  return self->_domain;
}

- (BOOL)websiteDetailShouldSeparateBlockedTrackers
{
  return self->_websiteDetailShouldSeparateBlockedTrackers;
}

- (void)setWebsiteDetailShouldSeparateBlockedTrackers:(BOOL)a3
{
  self->_websiteDetailShouldSeparateBlockedTrackers = a3;
}

- (NSSet)histories
{
  return self->_histories;
}

- (void)setHistories:(id)a3
{
}

- (NSSet)profileIdentifiers
{
  return self->_profileIdentifiers;
}

- (void)setProfileIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifiers, 0);
  objc_storeStrong((id *)&self->_histories, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_privacyReportData, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end