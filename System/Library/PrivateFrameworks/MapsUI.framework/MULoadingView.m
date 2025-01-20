@interface MULoadingView
- (MULoadingView)initWithFrame:(CGRect)a3;
- (void)_layout;
- (void)beginAnimatingActivityIndicator;
- (void)dealloc;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation MULoadingView

- (MULoadingView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MULoadingView;
  v3 = -[MULoadingView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = (UIActivityIndicatorView *)v4;

    [(UIActivityIndicatorView *)v3->_loadingIndicator setHidesWhenStopped:1];
    [(MULoadingView *)v3 addSubview:v3->_loadingIndicator];
  }
  return v3;
}

- (void)dealloc
{
  if ([(UIActivityIndicatorView *)self->_loadingIndicator isAnimating]) {
    [(UIActivityIndicatorView *)self->_loadingIndicator stopAnimating];
  }
  v3.receiver = self;
  v3.super_class = (Class)MULoadingView;
  [(MULoadingView *)&v3 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MULoadingView;
  -[MULoadingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MULoadingView *)self _layout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MULoadingView;
  [(MULoadingView *)&v3 layoutSubviews];
  [(MULoadingView *)self _layout];
}

- (void)_layout
{
  [(MULoadingView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11) * 0.5;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12) * 0.5;
  loadingIndicator = self->_loadingIndicator;
  -[UIActivityIndicatorView setCenter:](loadingIndicator, "setCenter:", v7, v8);
}

- (void)beginAnimatingActivityIndicator
{
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end