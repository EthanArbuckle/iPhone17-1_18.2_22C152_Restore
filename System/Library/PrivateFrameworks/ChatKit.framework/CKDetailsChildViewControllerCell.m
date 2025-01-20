@interface CKDetailsChildViewControllerCell
+ (BOOL)shouldHighlight;
+ (id)reuseIdentifier;
- (BOOL)shouldUseLayoutMargins;
- (CKDetailsChildViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)childViewControllerView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setChildViewControllerView:(id)a3;
- (void)setShouldUseLayoutMargins:(BOOL)a3;
@end

@implementation CKDetailsChildViewControllerCell

- (CKDetailsChildViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CKDetailsChildViewControllerCell;
  v4 = [(CKDetailsCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CKDetailsChildViewControllerCell *)v4 setShouldUseLayoutMargins:1];
    [(CKDetailsChildViewControllerCell *)v5 setSelectionStyle:0];
    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKDetailsChildViewControllerCell *)v5 setBackgroundColor:v6];
  }
  return v5;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsChildViewControllerViewCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)CKDetailsChildViewControllerCell;
  [(CKDetailsCell *)&v16 layoutSubviews];
  v3 = [(CKDetailsChildViewControllerCell *)self contentView];
  [v3 bounds];
  double x = v4;
  double y = v6;
  double width = v8;
  double height = v10;

  v12 = [(CKDetailsChildViewControllerCell *)self childViewControllerView];
  if ([(CKDetailsChildViewControllerCell *)self shouldUseLayoutMargins])
  {
    v13 = [(CKDetailsChildViewControllerCell *)self contentView];
    [v13 layoutMargins];
    CGFloat v15 = v14;

    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    CGRect v18 = CGRectInset(v17, v15, 0.0);
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
  }
  objc_msgSend(v12, "setFrame:", x, y, width, height);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKDetailsChildViewControllerCell;
  [(CKDetailsCell *)&v3 prepareForReuse];
  [(CKDetailsChildViewControllerCell *)self setShouldUseLayoutMargins:1];
}

- (void)setChildViewControllerView:(id)a3
{
  v5 = (UIView *)a3;
  p_childViewControllerView = &self->_childViewControllerView;
  childViewControllerView = self->_childViewControllerView;
  if (childViewControllerView != v5)
  {
    v9 = v5;
    [(UIView *)childViewControllerView removeFromSuperview];
    objc_storeStrong((id *)&self->_childViewControllerView, a3);
    double v8 = [(CKDetailsChildViewControllerCell *)self contentView];
    [v8 addSubview:*p_childViewControllerView];

    v5 = v9;
  }
}

- (UIView)childViewControllerView
{
  return self->_childViewControllerView;
}

- (BOOL)shouldUseLayoutMargins
{
  return self->_shouldUseLayoutMargins;
}

- (void)setShouldUseLayoutMargins:(BOOL)a3
{
  self->_shouldUseLayoutMargins = a3;
}

- (void).cxx_destruct
{
}

@end