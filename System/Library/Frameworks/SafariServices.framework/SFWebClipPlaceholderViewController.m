@interface SFWebClipPlaceholderViewController
- (SFWebClipPlaceholderViewController)initWithStyle:(int64_t)a3;
- (UIEdgeInsets)_cellInset;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)viewWillLayoutSubviews;
@end

@implementation SFWebClipPlaceholderViewController

- (SFWebClipPlaceholderViewController)initWithStyle:(int64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFWebClipPlaceholderViewController;
  v3 = [(SFWebClipPlaceholderViewController *)&v14 initWithStyle:1];
  if (v3)
  {
    v4 = _WBSLocalizedString();
    [(SFWebClipPlaceholderViewController *)v3 setTitle:v4];

    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v6 = _WBSLocalizedString();
    v7 = (void *)[v5 initWithTitle:v6 style:2 target:v3 action:0];

    [v7 setEnabled:0];
    v8 = [(SFWebClipPlaceholderViewController *)v3 navigationItem];
    [v8 setRightBarButtonItem:v7];

    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v10 = objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverCancelButtonItem"), v3, 0);
    [v10 setEnabled:0];
    v11 = [(SFWebClipPlaceholderViewController *)v3 navigationItem];
    [v11 setLeftBarButtonItem:v10];

    v12 = v3;
  }

  return v3;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)SFWebClipPlaceholderViewController;
  [(SFWebClipPlaceholderViewController *)&v9 loadView];
  v3 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  titleCell = self->_titleCell;
  self->_titleCell = v3;

  [(UITableViewCell *)self->_titleCell setSelectionStyle:0];
  id v5 = [(UITableViewCell *)self->_titleCell textLabel];
  [v5 setEnabled:0];

  v6 = (UITableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:0];
  addressCell = self->_addressCell;
  self->_addressCell = v6;

  [(UITableViewCell *)self->_addressCell setSelectionStyle:0];
  v8 = [(UITableViewCell *)self->_addressCell textLabel];
  [v8 setEnabled:0];
}

- (void)viewWillLayoutSubviews
{
  [(SFWebClipPlaceholderViewController *)self _cellInset];
  -[UITableViewCell setSeparatorInset:](self->_titleCell, "setSeparatorInset:");
  [(SFWebClipPlaceholderViewController *)self _cellInset];
  addressCell = self->_addressCell;

  -[UITableViewCell setSeparatorInset:](addressCell, "setSeparatorInset:");
}

- (UIEdgeInsets)_cellInset
{
  v2 = [(SFWebClipPlaceholderViewController *)self view];
  objc_msgSend(v2, "_sf_safeAreaInsetsFlippedForLayoutDirectionality");
  double v4 = v3 + 90.0;

  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v8;
  result.top = v5;
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  double v6 = &OBJC_IVAR___SFWebClipPlaceholderViewController__addressCell;
  if (!v5) {
    double v6 = &OBJC_IVAR___SFWebClipPlaceholderViewController__titleCell;
  }
  double v7 = *(Class *)((char *)&self->super.super.super.super.isa + *v6);

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressCell, 0);

  objc_storeStrong((id *)&self->_titleCell, 0);
}

@end