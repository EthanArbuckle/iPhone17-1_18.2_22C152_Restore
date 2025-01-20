@interface BlockableScrollView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isResizing;
- (BlockableScrollViewDelegate)blockableDelegate;
- (void)setBlockableDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIsResizing:(BOOL)a3;
@end

@implementation BlockableScrollView

- (void)setBlockableDelegate:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BlockableScrollView *)self frame];
  if (vabdd_f64(v8, width) >= 2.22044605e-16
    || ([(BlockableScrollView *)self frame], vabdd_f64(v9, height) >= 2.22044605e-16))
  {
    [(BlockableScrollView *)self setIsResizing:1];
    v11.receiver = self;
    v11.super_class = (Class)BlockableScrollView;
    -[BlockableScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(BlockableScrollView *)self setIsResizing:0];
    v10 = [(BlockableScrollView *)self blockableDelegate];
    [v10 blockableScrollViewDidChangeFrameSize];
  }
  else
  {
    [(BlockableScrollView *)self setIsResizing:1];
    v11.receiver = self;
    v11.super_class = (Class)BlockableScrollView;
    -[BlockableScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(BlockableScrollView *)self setIsResizing:0];
  }
}

- (void)setIsResizing:(BOOL)a3
{
  self->_isResizing = a3;
}

- (BlockableScrollViewDelegate)blockableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blockableDelegate);

  return (BlockableScrollViewDelegate *)WeakRetained;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BlockableScrollView;
  if ([(BlockableScrollView *)&v10 respondsToSelector:sel_gestureRecognizerShouldBegin_])
  {
    v9.receiver = self;
    v9.super_class = (Class)BlockableScrollView;
    unsigned int v5 = [(BlockableScrollView *)&v9 gestureRecognizerShouldBegin:v4];
  }
  else
  {
    unsigned int v5 = 1;
  }
  v6 = [(BlockableScrollView *)self blockableDelegate];

  if (v6)
  {
    v7 = [(BlockableScrollView *)self blockableDelegate];
    v5 &= [v7 blockableScrollViewShouldAllowScrolling];
  }
  return v5;
}

- (BOOL)isResizing
{
  return self->_isResizing;
}

- (void).cxx_destruct
{
}

@end