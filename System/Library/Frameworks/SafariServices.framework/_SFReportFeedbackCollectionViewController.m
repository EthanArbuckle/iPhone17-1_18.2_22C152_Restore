@interface _SFReportFeedbackCollectionViewController
- (_SFReportFeedbackCollectionViewController)initWithBrowserContentController:(id)a3;
- (id)_createCollectionViewLayout;
- (id)_footerText;
- (id)_headerText;
- (id)_issueStringForRowAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_numberOfIssueCategories;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionViewListCellButtonPressed:(id)a3;
- (void)presentLearnMoreViewController:(id)a3;
- (void)viewDidLoad;
@end

@implementation _SFReportFeedbackCollectionViewController

- (_SFReportFeedbackCollectionViewController)initWithBrowserContentController:(id)a3
{
  id v4 = a3;
  v5 = [(_SFReportFeedbackCollectionViewController *)self _createCollectionViewLayout];
  v23.receiver = self;
  v23.super_class = (Class)_SFReportFeedbackCollectionViewController;
  v6 = [(_SFReportFeedbackCollectionViewController *)&v23 initWithCollectionViewLayout:v5];

  if (v6)
  {
    objc_initWeak(&location, v6);
    id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v8 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __78___SFReportFeedbackCollectionViewController_initWithBrowserContentController___block_invoke;
    v20 = &unk_1E5C72910;
    objc_copyWeak(&v21, &location);
    v9 = [v8 actionWithTitle:&stru_1EFB97EB8 image:0 identifier:0 handler:&v17];
    v10 = objc_msgSend(v7, "initWithBarButtonSystemItem:primaryAction:", 24, v9, v17, v18, v19, v20);
    v11 = [(_SFReportFeedbackCollectionViewController *)v6 navigationItem];
    [v11 setRightBarButtonItem:v10];

    objc_storeWeak((id *)&v6->_browserContentController, v4);
    v12 = [(_SFReportFeedbackCollectionViewController *)v6 view];
    [v12 setAccessibilityIdentifier:@"ReportIssueView"];

    v13 = [(_SFReportFeedbackCollectionViewController *)v6 collectionView];
    [v13 setDelegate:v6];

    v14 = [(_SFReportFeedbackCollectionViewController *)v6 collectionView];
    [v14 setDataSource:v6];

    v15 = v6;
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (id)_createCollectionViewLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  [v2 setFooterMode:0];
  [v2 setHeaderMode:0];
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72___SFReportFeedbackCollectionViewController__createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E5C72E60;
  id v8 = v2;
  id v4 = v2;
  v5 = (void *)[v3 initWithSectionProvider:v7];

  return v5;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)_SFReportFeedbackCollectionViewController;
  [(_SFReportFeedbackCollectionViewController *)&v17 viewDidLoad];
  id v3 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  v6 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = *MEMORY[0x1E4FB2760];
  v9 = +[_SFReportIssueFooter reuseIdentifier];
  [v6 registerClass:v7 forSupplementaryViewOfKind:v8 withReuseIdentifier:v9];

  v10 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = *MEMORY[0x1E4FB2770];
  v13 = +[_SFReportFeedbackIssueHeader reuseIdentifier];
  [v10 registerClass:v11 forSupplementaryViewOfKind:v12 withReuseIdentifier:v13];

  v14 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
  uint64_t v15 = objc_opt_class();
  v16 = +[_SFButtonCollectionViewListCell reuseIdentifier];
  [v14 registerClass:v15 forCellWithReuseIdentifier:v16];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return [(_SFReportFeedbackCollectionViewController *)self _numberOfIssueCategories];
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  v6 = (NSIndexPath *)a4;
  id v7 = a3;
  if ([(NSIndexPath *)v6 section])
  {
    uint64_t v8 = +[_SFButtonCollectionViewListCell reuseIdentifier];
    v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

    [v9 setDelegate:self];
    v10 = _WBSLocalizedString();
    [v9 setTitle:v10];

    [v9 setEnabled:self->_isIssueChecked];
  }
  else
  {
    uint64_t v11 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
    v9 = [v7 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v6];

    uint64_t v12 = [(_SFReportFeedbackCollectionViewController *)self _issueStringForRowAtIndexPath:v6];
    [v9 setText:v12];

    BOOL v13 = self->_checkedIssueIndexPath == v6;
    [v9 setChecked:v13];
  }

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v8 = *MEMORY[0x1E4FB2770];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  if ([v10 isEqualToString:v8])
  {
    uint64_t v12 = +[_SFReportFeedbackIssueHeader reuseIdentifier];
    BOOL v13 = [v11 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v12 forIndexPath:v9];

    v14 = [(_SFReportFeedbackCollectionViewController *)self _headerText];
    [v13 setText:v14];
  }
  else
  {
    uint64_t v15 = +[_SFReportIssueFooter reuseIdentifier];
    BOOL v13 = [v11 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v15 forIndexPath:v9];

    v16 = [(_SFReportFeedbackCollectionViewController *)self _footerText];
    [v13 setFooterText:v16];

    [v13 setDelegate:self];
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v15 = a3;
  v6 = (NSIndexPath *)a4;
  if ([(NSIndexPath *)v6 section] != 1)
  {
    id v7 = [v15 cellForItemAtIndexPath:v6];
    objc_msgSend(v7, "setChecked:", objc_msgSend(v7, "isChecked") ^ 1);
    int isIssueChecked = [v7 isChecked];
    self->_int isIssueChecked = isIssueChecked;
    checkedIssueIndexPath = self->_checkedIssueIndexPath;
    if (checkedIssueIndexPath) {
      BOOL v10 = checkedIssueIndexPath == v6;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      -[_SFReportFeedbackCollectionViewController collectionView:didDeselectItemAtIndexPath:](self, "collectionView:didDeselectItemAtIndexPath:", v15);
      int isIssueChecked = self->_isIssueChecked;
    }
    if (isIssueChecked) {
      id v11 = v6;
    }
    else {
      id v11 = 0;
    }
    objc_storeStrong((id *)&self->_checkedIssueIndexPath, v11);
    uint64_t v12 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
    BOOL v13 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
    v14 = [v12 cellForItemAtIndexPath:v13];

    [v14 setEnabled:self->_isIssueChecked];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v6 section] != 1)
  {
    id v7 = [v9 cellForItemAtIndexPath:v6];
    checkedIssueIndexPath = self->_checkedIssueIndexPath;
    self->_checkedIssueIndexPath = 0;

    [v7 setChecked:0];
  }
}

- (void)collectionViewListCellButtonPressed:(id)a3
{
  id v5 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
  uint64_t v4 = [(_SFReportFeedbackCollectionViewController *)self collectionView];
  [v4 deselectItemAtIndexPath:v5 animated:1];

  [(_SFReportFeedbackCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(_SFReportFeedbackCollectionViewController *)self _reportFeedbackForSelectedRowIndex:[(NSIndexPath *)self->_checkedIssueIndexPath row]];
}

- (void)presentLearnMoreViewController:(id)a3
{
  id v4 = a3;
  [(_SFReportFeedbackCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserContentController);
  [WeakRetained presentModalViewController:v4 completion:0];
}

- (id)_issueStringForRowAtIndexPath:(id)a3
{
  return &stru_1EFB97EB8;
}

- (int64_t)_numberOfIssueCategories
{
  return 0;
}

- (id)_headerText
{
  return &stru_1EFB97EB8;
}

- (id)_footerText
{
  return &stru_1EFB97EB8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedIssueIndexPath, 0);

  objc_destroyWeak((id *)&self->_browserContentController);
}

@end