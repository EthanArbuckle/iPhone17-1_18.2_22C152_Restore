@interface MTStaticColorPillView
- (MTStaticColorPillView)initWithFrame:(CGRect)a3 settings:(id)a4;
- (UIColor)pillColor;
- (id)backgroundColor:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setPillColor:(id)a3;
@end

@implementation MTStaticColorPillView

- (MTStaticColorPillView)initWithFrame:(CGRect)a3 settings:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTStaticColorPillView;
  v4 = -[MTPillView initWithFrame:settings:](&v10, sel_initWithFrame_settings_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v11.width = 1.0;
    v11.height = 1.0;
    UIGraphicsBeginImageContextWithOptions(v11, 1, 1.0);
    v5 = [MEMORY[0x263F1C550] whiteColor];
    [v5 setFill];

    v12.origin.x = 0.0;
    v12.origin.y = 0.0;
    v12.size.width = 1.0;
    v12.size.height = 1.0;
    UIRectFill(v12);
    v6 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    v7 = [(MTStaticColorPillView *)v4 layer];
    id v8 = v6;
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));
  }
  return v4;
}

- (id)backgroundColor:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MTStaticColorPillView.m", 34, @"cannot call %s use pillColor instead", "-[MTStaticColorPillView backgroundColor:]");

  v8.receiver = self;
  v8.super_class = (Class)MTStaticColorPillView;
  v6 = [(MTStaticColorPillView *)&v8 backgroundColor];

  return v6;
}

- (void)setBackgroundColor:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MTStaticColorPillView.m", 39, @"cannot call %s use setPillColor: instead", "-[MTStaticColorPillView setBackgroundColor:]");

  v6 = [MEMORY[0x263F1C550] clearColor];
  v7.receiver = self;
  v7.super_class = (Class)MTStaticColorPillView;
  [(MTStaticColorPillView *)&v7 setBackgroundColor:v6];
}

- (void)setPillColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_pillColor = &self->_pillColor;
  if (self->_pillColor != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)&self->_pillColor, a3);
    objc_super v7 = [(MTStaticColorPillView *)self layer];
    objc_msgSend(v7, "setContentsMultiplyColor:", -[UIColor CGColor](*p_pillColor, "CGColor"));

    v5 = v8;
  }
}

- (UIColor)pillColor
{
  return self->_pillColor;
}

- (void).cxx_destruct
{
}

@end