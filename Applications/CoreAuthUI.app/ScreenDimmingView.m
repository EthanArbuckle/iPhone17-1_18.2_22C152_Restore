@interface ScreenDimmingView
- (BOOL)dimEnabled;
- (ScreenDimmingView)init;
- (double)dimLevel;
- (void)drawRect:(CGRect)a3;
- (void)setDimEnabled:(BOOL)a3;
- (void)setDimLevel:(double)a3;
@end

@implementation ScreenDimmingView

- (ScreenDimmingView)init
{
  v5.receiver = self;
  v5.super_class = (Class)ScreenDimmingView;
  v2 = [(ScreenDimmingView *)&v5 init];
  if (v2)
  {
    v3 = +[UIColor colorWithWhite:0.0 alpha:0.01];
    [(ScreenDimmingView *)v2 setBackgroundColor:v3];

    [(ScreenDimmingView *)v2 setDimLevel:0.4];
  }
  return v2;
}

- (void)setDimEnabled:(BOOL)a3
{
  if (self->_dimEnabled != a3)
  {
    self->_BOOL dimEnabled = a3;
    [(ScreenDimmingView *)self setNeedsDisplay];
    v4 = LACLogUI();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL dimEnabled = self->_dimEnabled;
      double dimLevel = self->_dimLevel;
      v7[0] = 67109376;
      v7[1] = dimEnabled;
      __int16 v8 = 2048;
      double v9 = dimLevel;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dimmed: %d alpha:%f", (uint8_t *)v7, 0x12u);
    }
  }
}

- (void)setDimLevel:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_100061994();
  }
  self->_double dimLevel = a3;
}

- (void)drawRect:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ScreenDimmingView;
  -[ScreenDimmingView drawRect:](&v7, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_dimEnabled)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    [(ScreenDimmingView *)self bounds];
    CGContextClearRect(CurrentContext, v8);
    [(ScreenDimmingView *)self bounds];
    objc_super v5 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    v6 = +[UIColor colorWithWhite:0.0 alpha:self->_dimLevel];
    [v6 setFill];
    [v5 fill];
  }
}

- (BOOL)dimEnabled
{
  return self->_dimEnabled;
}

- (double)dimLevel
{
  return self->_dimLevel;
}

@end