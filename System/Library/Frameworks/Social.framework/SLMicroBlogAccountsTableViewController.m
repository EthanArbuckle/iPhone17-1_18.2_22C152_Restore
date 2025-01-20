@interface SLMicroBlogAccountsTableViewController
- (SLMicroBlogAccountsTableViewController)initWithStyle:(int64_t)a3;
- (id)_accountUserRecordForIndexPath:(id)a3;
- (id)_blankImage;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelButtonTapped:(id)a3;
- (void)didUpdateAccountUserRecord:(id)a3;
- (void)setAccountUserRecords:(id)a3;
- (void)setCurrentAccountUserRecord:(id)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation SLMicroBlogAccountsTableViewController

- (SLMicroBlogAccountsTableViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogAccountsTableViewController;
  v3 = [(SLMicroBlogAccountsTableViewController *)&v7 initWithStyle:a3];
  if (v3)
  {
    v4 = SLSocialFrameworkBundle();
    v5 = [v4 localizedStringForKey:@"ACCOUNT_PICKER_TITLE" value:&stru_1F1E28690 table:@"Localizable"];
    [(SLMicroBlogAccountsTableViewController *)v3 setTitle:v5];
  }
  return v3;
}

- (id)_blankImage
{
  blankImage = self->_blankImage;
  if (!blankImage)
  {
    v9.width = 50.0;
    v9.height = 50.0;
    UIGraphicsBeginImageContext(v9);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    UIGraphicsPopContext();
    UIGraphicsGetImageFromCurrentImageContext();
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v6 = self->_blankImage;
    self->_blankImage = v5;

    UIGraphicsEndImageContext();
    blankImage = self->_blankImage;
  }

  return blankImage;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)SLMicroBlogAccountsTableViewController;
  [(SLMicroBlogAccountsTableViewController *)&v17 viewDidLoad];
  v3 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  v4 = [v3 backgroundView];
  [v4 setOpaque:0];

  v5 = [MEMORY[0x1E4F428B8] clearColor];
  v6 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  objc_super v7 = [v6 backgroundView];
  [v7 setBackgroundColor:v5];

  v8 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v8 setOpaque:0];

  CGSize v9 = [MEMORY[0x1E4F428B8] clearColor];
  v10 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v10 setBackgroundColor:v9];

  double v11 = *MEMORY[0x1E4F43D18];
  v12 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v12 setRowHeight:v11];

  v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v13 lineHeight];
  double v15 = v14 + v14;
  v16 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v16 setEstimatedRowHeight:v15];
}

- (void)cancelButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  [WeakRetained accountsViewController:self didSelectAccountUserRecord:self->_selectedAccountUserRecord];
}

- (void)setSelectionDelegate:(id)a3
{
}

- (void)setAccountUserRecords:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserRecords, a3);
  v4 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v4 reloadData];

  id v5 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v5 contentSize];
  [(SLMicroBlogAccountsTableViewController *)self setPreferredContentSize:320.0];
}

- (void)setCurrentAccountUserRecord:(id)a3
{
}

- (void)didUpdateAccountUserRecord:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_accountUserRecords indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = (void *)MEMORY[0x1E4F1C978];
    v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:0];
    id v8 = [v5 arrayWithObject:v6];

    objc_super v7 = [(SLMicroBlogAccountsTableViewController *)self tableView];
    [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:100];
  }
}

- (id)_accountUserRecordForIndexPath:(id)a3
{
  accountUserRecords = self->_accountUserRecords;
  uint64_t v4 = [a3 row];

  return [(NSArray *)accountUserRecords objectAtIndexedSubscript:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_accountUserRecords count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"Cell"];
  if (!v7) {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:0 reuseIdentifier:@"Cell"];
  }
  id v8 = [(SLMicroBlogAccountsTableViewController *)self _accountUserRecordForIndexPath:v6];
  CGSize v9 = objc_msgSend(v8, "screen_name");
  v10 = [v7 textLabel];
  [v10 setText:v9];

  double v11 = [v8 profileImageCache];

  if (v11) {
    [v8 profileImageCache];
  }
  else {
  v12 = [(SLMicroBlogAccountsTableViewController *)self _blankImage];
  }
  v13 = [v7 imageView];
  [v13 setImage:v12];

  double v14 = [(SLMicroBlogUserRecord *)self->_selectedAccountUserRecord screen_name];
  double v15 = objc_msgSend(v8, "screen_name");
  LODWORD(v13) = [v14 isEqualToString:v15];

  if (v13) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [v7 setAccessoryType:v16];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(SLMicroBlogAccountsTableViewController *)self _accountUserRecordForIndexPath:v5];
  objc_super v7 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  [v7 deselectRowAtIndexPath:v5 animated:1];

  objc_storeStrong((id *)&self->_selectedAccountUserRecord, v6);
  id v8 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  CGSize v9 = [v8 cellForRowAtIndexPath:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(SLMicroBlogAccountsTableViewController *)self tableView];
  double v11 = [v10 visibleCells];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v15++) setAccessoryType:0];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [v9 setAccessoryType:3];
  dispatch_time_t v16 = dispatch_time(0, 400000000);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__SLMicroBlogAccountsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v18[3] = &unk_1E6467C28;
  v18[4] = self;
  id v19 = v6;
  id v17 = v6;
  dispatch_after(v16, MEMORY[0x1E4F14428], v18);
}

void __76__SLMicroBlogAccountsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1040));
  [WeakRetained accountsViewController:*(void *)(a1 + 32) didSelectAccountUserRecord:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blankImage, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_storeStrong((id *)&self->_selectedAccountUserRecord, 0);

  objc_storeStrong((id *)&self->_accountUserRecords, 0);
}

@end