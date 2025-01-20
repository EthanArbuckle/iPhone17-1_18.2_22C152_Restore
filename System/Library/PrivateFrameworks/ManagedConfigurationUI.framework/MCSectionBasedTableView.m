@interface MCSectionBasedTableView
- (MCSectionBasedTableView)initWithFrame:(CGRect)a3;
- (UITableView)tableView;
- (id)_createTableView;
- (void)layoutSubviews;
@end

@implementation MCSectionBasedTableView

- (MCSectionBasedTableView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MCSectionBasedTableView;
  v3 = -[MCSectionBasedTableView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(MCSectionBasedTableView *)v3 _createTableView];
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v5;

    [(MCSectionBasedTableView *)v4 addSubview:v4->_tableView];
  }
  return v4;
}

- (id)_createTableView
{
  id v2 = objc_alloc(MEMORY[0x1E4F42E98]);
  v3 = objc_msgSend(v2, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setSeparatorStyle:0];
  v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 setContentInsetAdjustmentBehavior:2];
  [v3 setShowsVerticalScrollIndicator:0];
  return v3;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MCSectionBasedTableView;
  [(MCSectionBasedTableView *)&v6 layoutSubviews];
  [(MCSectionBasedTableView *)self bounds];
  double Width = CGRectGetWidth(v7);
  [(MCSectionBasedTableView *)self bounds];
  double Height = CGRectGetHeight(v8);
  uint64_t v5 = [(MCSectionBasedTableView *)self tableView];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, Height);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
}

@end