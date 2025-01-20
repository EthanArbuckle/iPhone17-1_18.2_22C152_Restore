@interface AXUIScrollSpeedTableCellTickSlider
- (AXUIScrollSpeedTableCellTickSlider)initWithFrame:(CGRect)a3;
- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5;
- (void)drawRect:(CGRect)a3;
@end

@implementation AXUIScrollSpeedTableCellTickSlider

- (AXUIScrollSpeedTableCellTickSlider)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AXUIScrollSpeedTableCellTickSlider;
  v3 = -[AXUIScrollSpeedTableCellTickSlider initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AXUIScrollSpeedTableCellTickSlider *)v3 setContentMode:3];
    v5 = +[UIColor clearColor];
    [(AXUIScrollSpeedTableCellTickSlider *)v4 setTintColor:v5];
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  [(AXUIScrollSpeedTableCellTickSlider *)self bounds];
  -[AXUIScrollSpeedTableCellTickSlider trackRectForBounds:](self, "trackRectForBounds:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = +[UIColor colorWithWhite:0.596078431 alpha:1.0];
  [v12 set];

  id v19 = objc_alloc_init((Class)UIBezierPath);
  [v19 setLineWidth:v11];
  [(AXUIScrollSpeedTableCellTickSlider *)self minimumValue];
  [(AXUIScrollSpeedTableCellTickSlider *)self maximumValue];
  [(AXUIScrollSpeedTableCellTickSlider *)self minimumValue];
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectGetMinX(v21);
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  CGRectGetWidth(v22);
  PSRoundToPixel();
  double v14 = v13;
  if ([(AXUIScrollSpeedTableCellTickSlider *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    [(AXUIScrollSpeedTableCellTickSlider *)self bounds];
    CGRectGetWidth(v23);
    PSRoundToPixel();
    double v14 = v15;
  }
  PSRoundToPixel();
  objc_msgSend(v19, "moveToPoint:", v14, v16);
  PSRoundToPixel();
  objc_msgSend(v19, "addLineToPoint:", v14, v17);
  [v19 stroke];
  v18 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v7, v9, v11);
  [v18 fill];
}

- (CGRect)thumbRectForBounds:(CGRect)a3 trackRect:(CGRect)a4 value:(float)a5
{
  CGFloat x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)AXUIScrollSpeedTableCellTickSlider;
  CGFloat y = a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat rect = a3.size.height;
  -[AXUIScrollSpeedTableCellTickSlider thumbRectForBounds:trackRect:value:](&v25, "thumbRectForBounds:trackRect:value:", LODWORD(a5));
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(AXUIScrollSpeedTableCellTickSlider *)self minimumValue];
  [(AXUIScrollSpeedTableCellTickSlider *)self maximumValue];
  [(AXUIScrollSpeedTableCellTickSlider *)self minimumValue];
  PSRoundToPixel();
  double v14 = v13;
  if ([(AXUIScrollSpeedTableCellTickSlider *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.height = rect;
    double v15 = CGRectGetWidth(v26);
    v27.origin.CGFloat x = v14;
    v27.origin.CGFloat y = v8;
    v27.size.CGFloat width = v10;
    v27.size.height = v12;
    double v16 = v15 - CGRectGetWidth(v27);
    v28.origin.CGFloat x = v14;
    v28.origin.CGFloat y = v8;
    v28.size.CGFloat width = v10;
    v28.size.height = v12;
    double v14 = v16 - CGRectGetMinX(v28);
  }
  double v17 = v14;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

@end