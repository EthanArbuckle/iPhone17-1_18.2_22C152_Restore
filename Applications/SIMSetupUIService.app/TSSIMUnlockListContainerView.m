@interface TSSIMUnlockListContainerView
- (UITableView)tableView;
- (UIView)footerView;
- (UIView)headerView;
- (void)layoutSubviews;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation TSSIMUnlockListContainerView

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)TSSIMUnlockListContainerView;
  [(TSSIMUnlockListContainerView *)&v15 layoutSubviews];
  [(TSSIMUnlockListContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIView sizeThatFits:](self->_headerView, "sizeThatFits:", v3, v5);
  double v8 = v7;
  double v10 = v9;
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = v8;
  v16.size.height = v10;
  double MaxY = CGRectGetMaxY(v16);
  [(TSSIMUnlockListContainerView *)self safeAreaInsets];
  CGFloat v13 = v6 - v10 + -110.0 - v12;
  v17.origin.x = 0.0;
  v17.origin.y = MaxY;
  v17.size.width = v4;
  v17.size.height = v13;
  double v14 = CGRectGetMaxY(v17);
  -[UIView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, v8, v10);
  -[UITableView setFrame:](self->_tableView, "setFrame:", 0.0, MaxY, v4, v13);
  -[UIView setFrame:](self->_footerView, "setFrame:", 0.0, v14, v4, 110.0);
}

- (void)setHeaderView:(id)a3
{
  double v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    double v7 = v5;
    [(UIView *)headerView removeFromSuperview];
    objc_storeStrong((id *)&self->_headerView, a3);
    [(TSSIMUnlockListContainerView *)self addSubview:self->_headerView];
    headerView = (UIView *)[(TSSIMUnlockListContainerView *)self setNeedsLayout];
    double v5 = v7;
  }

  _objc_release_x1(headerView, v5);
}

- (void)setTableView:(id)a3
{
  double v5 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    double v7 = v5;
    [(UITableView *)tableView removeFromSuperview];
    objc_storeStrong((id *)&self->_tableView, a3);
    [(TSSIMUnlockListContainerView *)self addSubview:self->_tableView];
    tableView = (UITableView *)[(TSSIMUnlockListContainerView *)self setNeedsLayout];
    double v5 = v7;
  }

  _objc_release_x1(tableView, v5);
}

- (void)setFooterView:(id)a3
{
  double v5 = (UIView *)a3;
  footerView = self->_footerView;
  if (footerView != v5)
  {
    double v7 = v5;
    [(UIView *)footerView removeFromSuperview];
    objc_storeStrong((id *)&self->_footerView, a3);
    [(TSSIMUnlockListContainerView *)self addSubview:self->_footerView];
    footerView = (UIView *)[(TSSIMUnlockListContainerView *)self setNeedsLayout];
    double v5 = v7;
  }

  _objc_release_x1(footerView, v5);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end