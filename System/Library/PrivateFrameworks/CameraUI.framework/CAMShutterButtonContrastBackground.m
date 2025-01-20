@interface CAMShutterButtonContrastBackground
- (CAMShutterButtonContrastBackground)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (void)drawRect:(CGRect)a3;
@end

@implementation CAMShutterButtonContrastBackground

- (CAMShutterButtonContrastBackground)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMShutterButtonContrastBackground;
  v3 = -[CAMShutterButtonContrastBackground initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMShutterButtonContrastBackground *)v3 setOpaque:0];
    [(CAMShutterButtonContrastBackground *)v4 setContentMode:3];
  }
  return v4;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(CAMShutterButtonContrastBackground *)self _strokeWidth];
  double v3 = v2;
  double v4 = v2;
  double v5 = v2;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  [(CAMShutterButtonContrastBackground *)self _strokeWidth];
  CGFloat v6 = v5;
  id v15 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
  [(CAMShutterButtonContrastBackground *)self bounds];
  -[CAMShutterButtonContrastBackground alignmentRectForFrame:](self, "alignmentRectForFrame:");
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v15 set];
  CGContextSetLineWidth(CurrentContext, v6);
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  CGContextStrokeEllipseInRect(CurrentContext, v17);
}

@end