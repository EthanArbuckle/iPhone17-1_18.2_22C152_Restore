@interface CPSInlineCardContainerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CPSInlineCardContainerView)initWithFrame:(CGRect)a3;
- (CPSInlineCardViewDelegate)delegate;
- (UIView)contentView;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tappedView:(id)a3;
@end

@implementation CPSInlineCardContainerView

- (CPSInlineCardContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPSInlineCardContainerView;
  v3 = -[CPSInlineCardContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_tappedView_];
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v4;

    [(UITapGestureRecognizer *)v3->_tapRecognizer setDelegate:v3];
    [(CPSInlineCardContainerView *)v3 addGestureRecognizer:v3->_tapRecognizer];
    v6 = v3;
  }

  return v3;
}

- (void)tappedView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didTapBackgroundView:self];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[UIView convertPoint:fromView:](self->_contentView, "convertPoint:fromView:", self, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIView *)self->_contentView bounds];
  v15.double x = v9;
  v15.double y = v11;
  if (CGRectContainsPoint(v16, v15))
  {
    BOOL v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CPSInlineCardContainerView;
    BOOL v12 = -[CPSInlineCardContainerView pointInside:withEvent:](&v14, sel_pointInside_withEvent_, v7, x, y);
  }

  return v12;
}

- (CPSInlineCardViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSInlineCardViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tapRecognizer, 0);
}

@end