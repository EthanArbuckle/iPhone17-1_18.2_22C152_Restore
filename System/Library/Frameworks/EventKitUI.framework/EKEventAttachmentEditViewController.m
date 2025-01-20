@interface EKEventAttachmentEditViewController
- (EKEventAttachmentEditViewController)initWithFrame:(CGRect)a3 attachments:(id)a4 sourceIsManaged:(BOOL)a5;
- (EKEventAttachmentEditViewControllerDelegate)delegate;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)owningEventForAttachmentCellController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation EKEventAttachmentEditViewController

- (EKEventAttachmentEditViewController)initWithFrame:(CGRect)a3 attachments:(id)a4 sourceIsManaged:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)EKEventAttachmentEditViewController;
  v12 = -[EKEditItemViewController initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 2, x, y, width, height);
    table = v12->_table;
    v12->_table = (UITableView *)v13;

    uint64_t v15 = +[EKEventAttachmentCellController cellControllersForAttachments:v11 givenExistingControllers:0 sourceIsManaged:v5];
    cellControllers = v12->_cellControllers;
    v12->_cellControllers = (NSArray *)v15;

    [(NSArray *)v12->_cellControllers makeObjectsPerformSelector:sel_setDelegate_ withObject:v12];
    v17 = EventKitUIBundle();
    v18 = [v17 localizedStringForKey:@"Attachments" value:&stru_1F0CC2140 table:0];
    [(EKEventAttachmentEditViewController *)v12 setTitle:v18];
  }
  return v12;
}

- (void)loadView
{
  v3 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 2, self->super._initialFrame.origin.x, self->super._initialFrame.origin.y, self->super._initialFrame.size.width, self->super._initialFrame.size.height);
  table = self->_table;
  self->_table = v3;

  [(UITableView *)self->_table setDataSource:self];
  [(UITableView *)self->_table setDelegate:self];
  [(UITableView *)self->_table setAutoresizingMask:18];
  BOOL v5 = self->_table;

  [(EKEventAttachmentEditViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventAttachmentEditViewController;
  [(EKEditItemViewController *)&v7 viewDidLoad];
  if (self->super._modal)
  {
    v3 = [(EKEventAttachmentEditViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0];

    v4 = [(EKEventAttachmentEditViewController *)self navigationItem];
    [v4 setHidesBackButton:1];

    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_saveAndDismiss];
    v6 = [(EKEventAttachmentEditViewController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_cellControllers count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 row];
  if (v6 >= [(NSArray *)self->_cellControllers count]
    || (-[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", [v5 row]),
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        [v7 cell],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = objc_opt_new();
  }

  return v8;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v30 = [v7 row];
  unint64_t v8 = v28[3];
  if ((v8 & 0x8000000000000000) != 0 || v8 >= [(NSArray *)self->_cellControllers count])
  {
    uint64_t v15 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E4FB1688];
    v10 = EventKitUIBundle();
    id v11 = [v10 localizedStringForKey:@"Remove attachment" value:@"Remove" table:0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __100__EKEventAttachmentEditViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    objc_super v20 = &unk_1E6088E40;
    objc_copyWeak(&v25, &location);
    v24 = &v27;
    v21 = self;
    id v22 = v6;
    id v23 = v7;
    v12 = [v9 contextualActionWithStyle:1 title:v11 handler:&v17];

    uint64_t v13 = (void *)MEMORY[0x1E4FB1CC0];
    v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v12, v17, v18, v19, v20, v21);
    uint64_t v15 = [v13 configurationWithActions:v14];

    [v15 setPerformsFirstActionWithFullSwipe:0];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __100__EKEventAttachmentEditViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = [WeakRetained[133] objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  unint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:WeakRetained[133]];
  [v8 removeObjectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  v9 = [v7 attachment];
  v10 = [WeakRetained delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [WeakRetained delegate];
    uint64_t v13 = [v12 owningEventForAttachmentEditViewController:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v13 removeAttachment:v9];
  objc_storeStrong(WeakRetained + 133, v8);
  v14 = *(void **)(a1 + 40);
  v18[0] = *(void *)(a1 + 48);
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v14 deleteRowsAtIndexPaths:v15 withRowAnimation:0];

  v16 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v15) = objc_opt_respondsToSelector();

  if (v15)
  {
    uint64_t v17 = [*(id *)(a1 + 32) delegate];
    [v17 attachmentEditViewController:*(void *)(a1 + 32) attachmentDidChange:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  }
  v5[2](v5, 1);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a4;
  unint64_t v5 = [v7 row];
  if (v5 < [(NSArray *)self->_cellControllers count])
  {
    id v6 = -[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", [v7 row]);
    [v6 cellSelected];
  }
  [(UITableView *)self->_table selectRowAtIndexPath:0 animated:1 scrollPosition:0];
}

- (id)owningEventForAttachmentCellController:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    unint64_t v8 = [v7 owningEventForAttachmentEditViewController:self];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (EKEventAttachmentEditViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKEventAttachmentEditViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cellControllers, 0);

  objc_storeStrong((id *)&self->_table, 0);
}

@end