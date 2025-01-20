@interface WFFilePickerResultsViewController
- (NSArray)files;
- (WFFilePickerResultsViewController)initWithFileListDelegate:(id)a3;
- (WFRemoteFileListView)fileListView;
- (WFRemoteFileListViewDelegate)delegate;
- (void)dealloc;
- (void)loadView;
- (void)setFiles:(id)a3;
- (void)updateContentInset;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFFilePickerResultsViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fileListView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_files, 0);
}

- (WFRemoteFileListView)fileListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileListView);
  return (WFRemoteFileListView *)WeakRetained;
}

- (WFRemoteFileListViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRemoteFileListViewDelegate *)WeakRetained;
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
  id v5 = a3;
  v6 = [(WFFilePickerResultsViewController *)self fileListView];
  [v6 setFiles:v5];

  [(WFFilePickerResultsViewController *)self updateContentInset];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFFilePickerResultsViewController;
  [(WFFilePickerResultsViewController *)&v3 viewWillLayoutSubviews];
  [(WFFilePickerResultsViewController *)self updateContentInset];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerResultsViewController;
  [(WFFilePickerResultsViewController *)&v4 viewWillAppear:a3];
  [(WFFilePickerResultsViewController *)self updateContentInset];
}

- (void)updateContentInset
{
  id v15 = [(WFFilePickerResultsViewController *)self view];
  objc_super v3 = [MEMORY[0x263F865C0] sharedKeyboard];
  [v3 keyboardFrameInView:v15];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = 0.0;
  if ([v3 isVisible])
  {
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    if (!CGRectIsNull(v17))
    {
      [v15 bounds];
      double MaxY = CGRectGetMaxY(v18);
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      double v12 = MaxY - CGRectGetMinY(v19);
    }
  }
  v14 = [(WFFilePickerResultsViewController *)self fileListView];
  objc_msgSend(v14, "setContentInset:", 64.0, 0.0, v12, 0.0);
  objc_msgSend(v14, "setVerticalScrollIndicatorInsets:", 64.0, 0.0, v12, 0.0);
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)WFFilePickerResultsViewController;
  [(WFFilePickerResultsViewController *)&v8 loadView];
  objc_super v3 = [(WFFilePickerResultsViewController *)self view];
  double v4 = [(WFFilePickerResultsViewController *)self files];
  CGFloat v5 = [WFRemoteFileListView alloc];
  [v3 bounds];
  double v6 = -[WFRemoteFileListView initWithFrame:collation:](v5, "initWithFrame:collation:", 0);
  [(WFRemoteFileListView *)v6 setAutoresizingMask:18];
  CGFloat v7 = [(WFFilePickerResultsViewController *)self delegate];
  [(WFRemoteFileListView *)v6 setDelegate:v7];

  [(WFRemoteFileListView *)v6 setFiles:v4];
  [v3 addSubview:v6];
  objc_storeWeak((id *)&self->_fileListView, v6);
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F86618] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFFilePickerResultsViewController;
  [(WFFilePickerResultsViewController *)&v4 dealloc];
}

- (WFFilePickerResultsViewController)initWithFileListDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFFilePickerResultsViewController;
  CGFloat v5 = [(WFFilePickerResultsViewController *)&v10 initWithNibName:0 bundle:0];
  double v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    CGFloat v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v6 selector:sel_updateContentInset name:*MEMORY[0x263F86618] object:0];

    objc_super v8 = v6;
  }

  return v6;
}

@end