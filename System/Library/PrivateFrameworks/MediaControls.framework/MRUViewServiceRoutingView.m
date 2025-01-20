@interface MRUViewServiceRoutingView
- (BOOL)isFooterVisible;
- (BOOL)showAlertView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRUViewServiceRoutingFooterView)footerView;
- (MRUViewServiceRoutingHeaderView)headerView;
- (MRUViewServiceRoutingView)initWithFrame:(CGRect)a3;
- (MRUVisualStylingProvider)stylingProvider;
- (UITableView)tableView;
- (UIView)alertView;
- (UIView)contentView;
- (double)cornerRadius;
- (double)preferredWidth;
- (int64_t)state;
- (void)layoutSubviews;
- (void)setAlertView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFooterVisible:(BOOL)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setShowAlertView:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)updateVisibility;
@end

@implementation MRUViewServiceRoutingView

- (MRUViewServiceRoutingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)MRUViewServiceRoutingView;
  v7 = -[MRUViewServiceRoutingView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = [MRUViewServiceRoutingHeaderView alloc];
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = -[MRUViewServiceRoutingHeaderView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    headerView = v7->_headerView;
    v7->_headerView = (MRUViewServiceRoutingHeaderView *)v13;

    [(MRUViewServiceRoutingView *)v7 addSubview:v7->_headerView];
    v15 = -[MRUViewServiceRoutingFooterView initWithFrame:]([MRUViewServiceRoutingFooterView alloc], "initWithFrame:", v9, v10, v11, v12);
    footerView = v7->_footerView;
    v7->_footerView = v15;

    [(MRUViewServiceRoutingView *)v7 addSubview:v7->_footerView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:", x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v17;

    [(UITableView *)v7->_tableView setSeparatorStyle:0];
    [(UITableView *)v7->_tableView setAlwaysBounceVertical:1];
    v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITableView *)v7->_tableView setBackgroundColor:v19];

    [(UITableView *)v7->_tableView setEstimatedRowHeight:108.0];
    [(UITableView *)v7->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
    [(UITableView *)v7->_tableView setTableFooterView:v20];

    -[UITableView setScrollIndicatorInsets:](v7->_tableView, "setScrollIndicatorInsets:", 24.0, 0.0, 24.0, 0.0);
    [(MRUViewServiceRoutingView *)v7 addSubview:v7->_tableView];
    [(MRUViewServiceRoutingView *)v7 updateVisibility];
  }
  return v7;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)MRUViewServiceRoutingView;
  [(MRUViewServiceRoutingView *)&v39 layoutSubviews];
  [(MRUViewServiceRoutingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UITableView setFrame:](self->_tableView, "setFrame:");
  if (*(_WORD *)&self->_footerVisible)
  {
    [(MRUViewServiceRoutingView *)self safeAreaInsets];
    double v4 = v4 + v11;
    double v6 = v6 + v12;
    double v8 = v8 - (v11 + v13);
    double v10 = v10 - (v12 + v14);
  }
  -[UIView setFrame:](self->_alertView, "setFrame:", v4, v6, v8, v10);
  -[MRUViewServiceRoutingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v8, v10);
  double v16 = v15;
  double v18 = v17;
  v40.origin.double x = v4;
  v40.origin.double y = v6;
  v40.size.double width = v8;
  v40.size.double height = v10;
  double MinX = CGRectGetMinX(v40);
  v41.origin.double x = v4;
  v41.origin.double y = v6;
  v41.size.double width = v8;
  v41.size.double height = v10;
  -[MRUViewServiceRoutingHeaderView setFrame:](self->_headerView, "setFrame:", MinX, CGRectGetMinY(v41), v16, v18);
  UIRectInset();
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  -[MRUViewServiceRoutingFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v24, v26);
  double v29 = v28;
  double v31 = v30;
  v42.origin.double x = v21;
  v42.origin.double y = v23;
  v42.size.double width = v25;
  v42.size.double height = v27;
  double v32 = CGRectGetMinX(v42);
  v43.origin.double x = v21;
  v43.origin.double y = v23;
  v43.size.double width = v25;
  v43.size.double height = v27;
  double MaxY = CGRectGetMaxY(v43);
  double v34 = MaxY;
  if (self->_footerVisible)
  {
    double v34 = MaxY - v31;
    UIRectInset();
    double v21 = v35;
    double v23 = v36;
    double v25 = v37;
    double v27 = v38;
  }
  -[MRUViewServiceRoutingFooterView setFrame:](self->_footerView, "setFrame:", v32, v34, v29, v31);
  -[UIView setFrame:](self->_contentView, "setFrame:", v21, v23, v25, v27);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = MRUDefaultExpandedWidth(self);
  double v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double preferredWidth = self->_preferredWidth;
    if (v6 >= preferredWidth) {
      double preferredWidth = v6;
    }
    if (preferredWidth >= width) {
      double v6 = width;
    }
    else {
      double v6 = preferredWidth;
    }
  }
  int64_t state = self->_state;
  if (state == 1)
  {
    [(UITableView *)self->_tableView _contentSize];
    if (v9 >= height) {
      double v9 = height;
    }
  }
  else if (!state)
  {
    if (self->_showAlertView)
    {
      [(MRUViewServiceRoutingView *)self safeAreaInsets];
      double v13 = v12 + 390.0;
      [(MRUViewServiceRoutingView *)self safeAreaInsets];
      double v9 = v13 + v14;
    }
    else
    {
      -[MRUViewServiceRoutingHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v6, height);
      double v16 = height - v15;
      double v17 = v15 + 0.0;
      if (self->_footerVisible)
      {
        -[MRUViewServiceRoutingFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v6, v16);
        double v16 = v16 - v18;
        double v17 = v17 + v18;
      }
      -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", v6, v16);
      if (v19 >= v16) {
        double v20 = v16;
      }
      else {
        double v20 = v19;
      }
      double v9 = v17 + v20;
    }
  }
  double v21 = v6;
  result.double height = v9;
  result.double width = v21;
  return result;
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  double v7 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(MRUViewServiceRoutingView *)self addSubview:v7];
    [(MRUViewServiceRoutingView *)self setNeedsLayout];
  }
}

- (void)setAlertView:(id)a3
{
  double v5 = (UIView *)a3;
  if (self->_alertView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_alertView, a3);
    [(MRUViewServiceRoutingView *)self addSubview:self->_alertView];
    [(MRUViewServiceRoutingView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setStylingProvider:(id)a3
{
  double v5 = (MRUVisualStylingProvider *)a3;
  if (self->_stylingProvider != v5)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUViewServiceRoutingHeaderView *)self->_headerView setStylingProvider:v5];
    [(MRUViewServiceRoutingFooterView *)self->_footerView setStylingProvider:v5];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_int64_t state = a3;
    [(MRUViewServiceRoutingView *)self updateVisibility];
    [(MRUViewServiceRoutingView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[MRUViewServiceRoutingView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  tableView = self->_tableView;

  -[UITableView setScrollIndicatorInsets:](tableView, "setScrollIndicatorInsets:", 0.0, 0.0, a3, 0.0);
}

- (void)setFooterVisible:(BOOL)a3
{
  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    [(MRUViewServiceRoutingView *)self updateVisibility];
    [(MRUViewServiceRoutingView *)self setNeedsLayout];
  }
}

- (void)setShowAlertView:(BOOL)a3
{
  if (self->_showAlertView != a3)
  {
    self->_showAlertView = a3;
    [(MRUViewServiceRoutingView *)self updateVisibility];
    [(MRUViewServiceRoutingView *)self setNeedsLayout];
  }
}

- (void)updateVisibility
{
  int64_t state = self->_state;
  if (state == 1)
  {
    [(UITableView *)self->_tableView setAlpha:1.0];
    double v4 = 0.0;
    [(MRUViewServiceRoutingHeaderView *)self->_headerView setAlpha:0.0];
    [(UIView *)self->_contentView setAlpha:0.0];
    [(MRUViewServiceRoutingFooterView *)self->_footerView setAlpha:0.0];
  }
  else
  {
    if (state) {
      return;
    }
    double v4 = 0.0;
    [(UITableView *)self->_tableView setAlpha:0.0];
    if (self->_showAlertView) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    [(MRUViewServiceRoutingHeaderView *)self->_headerView setAlpha:v5];
    if (self->_showAlertView) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    [(UIView *)self->_contentView setAlpha:v6];
    double v7 = 0.0;
    if (self->_footerVisible && !self->_showAlertView) {
      double v7 = 1.0;
    }
    [(MRUViewServiceRoutingFooterView *)self->_footerView setAlpha:v7];
    if (self->_showAlertView) {
      double v4 = 1.0;
    }
  }
  alertView = self->_alertView;

  [(UIView *)alertView setAlpha:v4];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)alertView
{
  return self->_alertView;
}

- (MRUViewServiceRoutingHeaderView)headerView
{
  return self->_headerView;
}

- (MRUViewServiceRoutingFooterView)footerView
{
  return self->_footerView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)state
{
  return self->_state;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_double preferredWidth = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (BOOL)showAlertView
{
  return self->_showAlertView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end