@interface FMDistanceBadge
- (CGSize)intrinsicContentSize;
- (UIColor)badgeColor;
- (UIEdgeInsets)insets;
- (void)_commonSetup;
- (void)awakeFromNib;
- (void)drawRect:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
- (void)prepareForInterfaceBuilder;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeColor:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
@end

@implementation FMDistanceBadge

- (void)awakeFromNib
{
  v3 = [MEMORY[0x263F1C550] clearColor];
  [(UIView *)self setRoundedRectBackgroundColor:v3];

  v4.receiver = self;
  v4.super_class = (Class)FMDistanceBadge;
  [(FMDistanceBadge *)&v4 awakeFromNib];
  [(FMDistanceBadge *)self _commonSetup];
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)FMDistanceBadge;
  [(FMDistanceBadge *)&v3 prepareForInterfaceBuilder];
  [(FMDistanceBadge *)self _commonSetup];
}

- (void)_commonSetup
{
  objc_super v3 = [MEMORY[0x263F1C550] colorWithRed:0.4627 green:0.7764 blue:0.2313 alpha:1.0];
  [(UIView *)self setRoundedRectBackgroundColor:v3];

  objc_super v4 = [MEMORY[0x263F1C550] whiteColor];
  [(FMDistanceBadge *)self setTextColor:v4];

  [(FMDistanceBadge *)self setAdjustsFontSizeToFitWidth:1];
  [(FMDistanceBadge *)self setMinimumScaleFactor:0.8];
  [(FMDistanceBadge *)self setTextAlignment:1];
  -[FMDistanceBadge setInsets:](self, "setInsets:", 1.0, 9.0, 2.0, 9.0);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4 = objc_msgSend(MEMORY[0x263F1C550], "clearColor", a3);
  v5.receiver = self;
  v5.super_class = (Class)FMDistanceBadge;
  [(FMDistanceBadge *)&v5 setBackgroundColor:v4];
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
  [(FMDistanceBadge *)self invalidateIntrinsicContentSize];
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FMDistanceBadge *)self insets];
  v12.receiver = self;
  v12.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  [(FMDistanceBadge *)self bounds];
  double v9 = -[UIView newPathForRoundedRect:radius:](self, "newPathForRoundedRect:radius:");
  double v10 = [(UIView *)self roundedRectBackgroundColor];

  if (v10)
  {
    id v11 = [(UIView *)self roundedRectBackgroundColor];
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v11 CGColor]);
  }
  objc_super v12 = [(UIView *)self roundedRectBorderColor];

  if (v12)
  {
    id v13 = [(UIView *)self roundedRectBorderColor];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v13 CGColor]);
  }
  v14 = [(UIView *)self roundedRectBorderWidth];

  if (v14)
  {
    v15 = [(UIView *)self roundedRectBorderWidth];
    [v15 floatValue];
    CGContextSetLineWidth(CurrentContext, v16);
  }
  CGContextAddPath(CurrentContext, v9);
  CGContextFillPath(CurrentContext);
  CGContextStrokePath(CurrentContext);
  CGPathRelease(v9);
  v17.receiver = self;
  v17.super_class = (Class)FMDistanceBadge;
  -[FMDistanceBadge drawRect:](&v17, sel_drawRect_, x, y, width, height);
}

- (CGSize)intrinsicContentSize
{
  v15.receiver = self;
  v15.super_class = (Class)FMDistanceBadge;
  [(FMDistanceBadge *)&v15 intrinsicContentSize];
  double v5 = v3;
  double v6 = v4;
  if ((v3 != *MEMORY[0x263F001B0] || v4 != *(double *)(MEMORY[0x263F001B0] + 8))
    && v3 != *MEMORY[0x263F1D7C8]
    && v4 != *MEMORY[0x263F1D7C8])
  {
    [(FMDistanceBadge *)self insets];
    double v6 = v6 + v9 + v10;
    double v5 = v5 + v11 + v12;
  }
  double v13 = v5;
  double v14 = v6;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (void)setBadgeColor:(id)a3
{
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end