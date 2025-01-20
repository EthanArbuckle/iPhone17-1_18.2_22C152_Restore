@interface WFPassthroughDimmingView
- (BOOL)captureTouches;
- (WFPassthroughDimmingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setCaptureTouches:(BOOL)a3;
@end

@implementation WFPassthroughDimmingView

- (BOOL)captureTouches
{
  return self->_captureTouches;
}

- (void)setCaptureTouches:(BOOL)a3
{
  self->_captureTouches = a3;
  if (a3)
  {
    id v4 = +[UIColor colorWithWhite:0.0 alpha:0.01];
    [(WFPassthroughDimmingView *)self setBackgroundColor:v4];
  }
  else
  {
    [(WFPassthroughDimmingView *)self setBackgroundColor:0];
  }
}

- (void)layoutSubviews
{
  [(WFPassthroughDimmingView *)self bounds];
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v5 = objc_claimAutoreleasedReturnValue();
  id v3 = [v5 CGPath];
  id v4 = [(WFPassthroughDimmingView *)self layer];
  [v4 setShadowPath:v3];
}

- (WFPassthroughDimmingView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WFPassthroughDimmingView;
  id v3 = -[WFPassthroughDimmingView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[UIColor blackColor];
    id v5 = [v4 CGColor];
    v6 = [(WFPassthroughDimmingView *)v3 layer];
    [v6 setShadowColor:v5];

    v7 = [(WFPassthroughDimmingView *)v3 layer];
    LODWORD(v8) = 1051931443;
    [v7 setShadowOpacity:v8];

    double height = CGSizeZero.height;
    v10 = [(WFPassthroughDimmingView *)v3 layer];
    [v10 setShadowOffset:CGSizeZero.width, height];

    v11 = [(WFPassthroughDimmingView *)v3 layer];
    [v11 setShadowRadius:0.0];

    v12 = v3;
  }

  return v3;
}

@end