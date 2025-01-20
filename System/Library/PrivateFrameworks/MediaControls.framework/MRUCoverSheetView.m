@interface MRUCoverSheetView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation MRUCoverSheetView

- (void)layoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MRUCoverSheetView;
  [(MRUCoverSheetView *)&v14 layoutSubviews];
  [(MRUCoverSheetView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  v11 = MCLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v13 = NSStringFromCGRect(v20);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1AE7DF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ frame: %{public}@", buf, 0x16u);
  }
}

- (void)setContentView:(id)a3
{
  double v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    double v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(MRUCoverSheetView *)self addSubview:self->_contentView];
    [(MRUCoverSheetView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end