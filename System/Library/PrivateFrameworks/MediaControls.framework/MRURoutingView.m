@interface MRURoutingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRURoutingView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentEdgeInsets;
- (UITableView)tableView;
- (void)layoutSubviews;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setTableView:(id)a3;
@end

@implementation MRURoutingView

- (MRURoutingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)MRURoutingView;
  v7 = -[MRURoutingView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", 0, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v8;

    [(UITableView *)v7->_tableView setSeparatorStyle:0];
    [(UITableView *)v7->_tableView setIndicatorStyle:2];
    [(UITableView *)v7->_tableView setAlwaysBounceVertical:1];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITableView *)v7->_tableView setBackgroundColor:v10];

    [(UITableView *)v7->_tableView setRowHeight:52.0];
    [(UITableView *)v7->_tableView _setHeaderAndFooterViewsFloat:0];
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITableView *)v7->_tableView setTableFooterView:v12];

    [(UITableView *)v7->_tableView setAccessibilityIdentifier:@"mru-routing-list"];
    [(MRURoutingView *)v7 addSubview:v7->_tableView];
  }
  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRURoutingView;
  [(MRURoutingView *)&v3 layoutSubviews];
  [(MRURoutingView *)self bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(UITableView *)self->_tableView _contentSize];
  if (52.0 * 3.0 >= v6) {
    double v7 = 52.0 * 3.0;
  }
  else {
    double v7 = v6;
  }
  double v8 = self->_contentEdgeInsets.bottom + self->_contentEdgeInsets.top + v7;
  if (v8 >= height) {
    double v9 = height;
  }
  else {
    double v9 = v8;
  }
  double v10 = width;
  result.double height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end