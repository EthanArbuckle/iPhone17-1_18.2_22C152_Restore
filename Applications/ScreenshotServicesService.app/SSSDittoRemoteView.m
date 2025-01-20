@interface SSSDittoRemoteView
- (BOOL)acceptsTouches;
- (SSSDittoRemoteView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAcceptsTouches:(BOOL)a3;
@end

@implementation SSSDittoRemoteView

- (SSSDittoRemoteView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSDittoRemoteView;
  v3 = -[SSSDittoRemoteView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_SSIsScreenshotManagerDebuggingEnabled())
  {
    v4 = objc_alloc_init(SSSDebugScreenshotMangerView);
    debugScreenshotManagerView = v3->_debugScreenshotManagerView;
    v3->_debugScreenshotManagerView = v4;

    [(SSSDittoRemoteView *)v3 addSubview:v3->_debugScreenshotManagerView];
  }
  return v3;
}

- (void)layoutSubviews
{
  if (_SSIsScreenshotManagerDebuggingEnabled())
  {
    [(SSSDebugScreenshotMangerView *)self->_debugScreenshotManagerView intrinsicContentSize];
    double v4 = v3;
    double v6 = v5;
    [(SSSDittoRemoteView *)self bounds];
    debugScreenshotManagerView = self->_debugScreenshotManagerView;
    -[SSSDebugScreenshotMangerView setFrame:](debugScreenshotManagerView, "setFrame:", v7 - v4 + 10.0, 10.0, v4, v6);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(SSSDittoRemoteView *)self acceptsTouches])
  {
    v10.receiver = self;
    v10.super_class = (Class)SSSDittoRemoteView;
    v8 = -[SSSDittoRemoteView hitTest:withEvent:](&v10, "hitTest:withEvent:", v7, x, y);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)acceptsTouches
{
  return self->_acceptsTouches;
}

- (void)setAcceptsTouches:(BOOL)a3
{
  self->_acceptsTouches = a3;
}

- (void).cxx_destruct
{
}

@end