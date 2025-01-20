@interface MFGroupDetailViewController
- (MFGroupDetailViewController)initWithStyle:(int64_t)a3;
- (MFGroupDetailViewControllerDelegate)delegate;
- (MFRecentComposeRecipientGroup)group;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_removeButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MFGroupDetailViewController

- (MFGroupDetailViewController)initWithStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MFGroupDetailViewController;
  v3 = [(MFGroupDetailViewController *)&v16 initWithStyle:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"RECENT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    v6 = [(MFGroupDetailViewController *)v3 navigationItem];
    [v6 setTitle:v5];

    v7 = [(MFGroupDetailViewController *)v3 tableView];
    [v7 _setMarginWidth:16.0];

    v8 = [(MFGroupDetailViewController *)v3 tableView];
    +[MFRecipientTableViewCell height];
    objc_msgSend(v8, "setEstimatedRowHeight:");

    v9 = [(MFGroupDetailViewController *)v3 tableView];
    [v9 setRowHeight:*MEMORY[0x1E4FB2F28]];

    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"REMOVE_TITLE" value:&stru_1F0817A00 table:@"Main"];
    v13 = (void *)[v10 initWithTitle:v12 style:0 target:v3 action:sel__removeButtonTapped_];

    v14 = [(MFGroupDetailViewController *)v3 navigationItem];
    [v14 setRightBarButtonItem:v13];
  }
  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFGroupDetailViewController;
  [(MFGroupDetailViewController *)&v5 viewWillDisappear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained groupDetailViewControllerDidCancel:self];
  }
}

- (void)_removeButtonTapped:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1418];
  objc_super v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"REMOVE_RECENT_CONFIRM" value:&stru_1F0817A00 table:@"Main"];
  v7 = [v4 alertControllerWithTitle:v6 message:0 preferredStyle:0];

  [v7 setModalPresentationStyle:7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"REMOVE_RECENT" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __51__MFGroupDetailViewController__removeButtonTapped___block_invoke;
  v24 = &unk_1E5F7ACB8;
  id v12 = WeakRetained;
  id v25 = v12;
  v26 = self;
  v13 = [v9 actionWithTitle:v11 style:2 handler:&v21];
  objc_msgSend(v7, "addAction:", v13, v21, v22, v23, v24);

  v14 = (void *)MEMORY[0x1E4FB1410];
  v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  v17 = [v14 actionWithTitle:v16 style:1 handler:0];
  [v7 addAction:v17];

  v18 = [v7 popoverPresentationController];
  v19 = [(MFGroupDetailViewController *)self navigationItem];
  v20 = [v19 rightBarButtonItem];
  [v18 setBarButtonItem:v20];

  [v18 setPermittedArrowDirections:3];
  [(MFGroupDetailViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __51__MFGroupDetailViewController__removeButtonTapped___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) groupDetailViewController:*(void *)(a1 + 40) didAskToRemoveGroup:*(void *)(*(void *)(a1 + 40) + 1032)];
  }
  id v3 = [*(id *)(a1 + 40) navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(MFComposeRecipientGroup *)self->_group children];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MFRecipientTableViewCell identifier];
  v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  id v10 = [(MFComposeRecipientGroup *)self->_group children];
  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v7, "row"));

  if (!v9)
  {
    id v12 = [[MFRecipientTableViewCell alloc] initWithStyle:0 reuseIdentifier:v8];
    [(MFRecipientTableViewCell *)v12 setAccessoryType:1];
    v9 = v12;
    [(MFRecipientTableViewCell *)v12 setShouldHighlightCompleteMatches:0];
  }
  v13 = [v9 recipient];

  if (v13 != v11) {
    [v9 setRecipient:v11];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(MFComposeRecipientGroup *)self->_group children];
    id v7 = objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v8, "row"));
    [WeakRetained groupDetailViewController:self didTapComposeRecipient:v7];
  }
}

- (MFGroupDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFGroupDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MFRecentComposeRecipientGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end