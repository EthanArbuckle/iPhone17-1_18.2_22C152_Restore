@interface TPSDetailPane
- (TPSDetailPane)initWithFrame:(CGRect)a3;
- (UITableView)tableView;
- (UITableViewCell)tableViewCell;
- (id)preferenceValue;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)layoutSubviews;
- (void)setPreferenceValue:(id)a3;
@end

@implementation TPSDetailPane

- (TPSDetailPane)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)TPSDetailPane;
  v7 = -[TPSDetailPane initWithFrame:](&v14, "initWithFrame:");
  if (v7)
  {
    v8 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = v8;

    [(UITableView *)v7->_tableView setAllowsSelection:0];
    [(UITableView *)v7->_tableView setDataSource:v7];
    [(UITableView *)v7->_tableView setScrollEnabled:0];
    [(UITableView *)v7->_tableView reloadData];
    [(TPSDetailPane *)v7 addSubview:v7->_tableView];
    v10 = (UITableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"TPSDetailTableViewCell"];
    tableViewCell = v7->_tableViewCell;
    v7->_tableViewCell = v10;

    v12 = [(UITableViewCell *)v7->_tableViewCell textLabel];
    [v12 setTextAlignment:1];
  }
  return v7;
}

- (void)layoutSubviews
{
  id v8 = [(TPSDetailPane *)self tableView];
  [(TPSDetailPane *)self frame];
  objc_msgSend(v8, "setFrame:");
  [v8 frame];
  double v4 = v3;
  [v8 rectForSection:0];
  double v6 = v4 - v5;
  +[UIKeyboard defaultSize];
  objc_msgSend(v8, "setContentInset:", floor((v6 - v7) * 0.5), 0.0, 0.0, 0.0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)preferenceValue
{
  v2 = [(TPSDetailPane *)self tableViewCell];
  double v3 = [v2 textLabel];
  double v4 = [v3 text];

  return v4;
}

- (void)setPreferenceValue:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSDetailPane *)self tableViewCell];
  double v5 = [v6 textLabel];
  [v5 setText:v4];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UITableViewCell)tableViewCell
{
  return self->_tableViewCell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewCell, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end