@interface NTKZeusComplicationBackgroundView
- (NTKZeusComplicationBackgroundView)initWithDevice:(id)a3;
- (id)_cornerImage;
- (void)_createCorners:(id)a3;
- (void)_updateBlancEditModeCorners;
- (void)_updateCorners;
- (void)applyBlancEditModeStyleChange;
- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)layoutSubviews;
@end

@implementation NTKZeusComplicationBackgroundView

- (NTKZeusComplicationBackgroundView)initWithDevice:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKZeusComplicationBackgroundView;
  v5 = [(NTKZeusComplicationBackgroundView *)&v17 init];
  v6 = v5;
  if (v5)
  {
    [(NTKZeudleComplicationBackgroundView *)v5 setDevice:v4];
    v7 = +[NSMutableArray array];
    for (unsigned int i = 0; i != 4; ++i)
    {
      v9 = +[CALayer layer];
      objc_msgSend(v9, "setAnchorPoint:", 0.0, 0.0);
      if (i) {
        int v10 = -1;
      }
      else {
        int v10 = 1;
      }
      double v11 = (double)v10;
      if (i > 1) {
        int v12 = 1;
      }
      else {
        int v12 = -1;
      }
      CATransform3DMakeScale(&v16, v11, (double)v12, 1.0);
      [v9 setTransform:&v16];
      [(NSArray *)v7 addObject:v9];
      v13 = [(NTKZeusComplicationBackgroundView *)v6 layer];
      [v13 addSublayer:v9];
    }
    cornerLayers = v6->_cornerLayers;
    v6->_cornerLayers = v7;

    [(NTKZeusComplicationBackgroundView *)v6 _updateCorners];
  }

  return v6;
}

- (void)applyBlancEditModeStyleChange
{
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)NTKZeusComplicationBackgroundView;
  [(NTKZeusComplicationBackgroundView *)&v17 layoutSubviews];
  [(NTKZeudleComplicationBackgroundView *)self contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  for (unint64_t i = 0; i != 4; ++i)
  {
    int v12 = [(NSArray *)self->_cornerLayers objectAtIndex:i];
    v13 = v12;
    if (i) {
      double v14 = v8;
    }
    else {
      double v14 = 0.0;
    }
    double v15 = v4 + v14;
    if (i <= 1) {
      double v16 = v10;
    }
    else {
      double v16 = 0.0;
    }
    objc_msgSend(v12, "setPosition:", v15, v6 + v16);
  }
}

- (id)_cornerImage
{
  unint64_t v3 = [(NTKZeudleComplicationBackgroundView *)self style];
  double v4 = [(NTKZeudleComplicationBackgroundView *)self device];
  double v5 = v4;
  if (v3 == 2)
  {
    sub_9058(v4, v26);
    CGFloat v6 = v27;
    double v7 = (CGFloat *)&v28;
  }
  else
  {
    sub_9058(v4, v23);
    CGFloat v6 = v24;
    double v7 = (CGFloat *)&v25;
  }
  CGFloat v8 = *v7;

  double v9 = [(NTKZeudleComplicationBackgroundView *)self device];
  sub_9058(v9, v21);
  double v10 = v22;

  if (v3 == 2)
  {
    p_sharpCorner = &self->_sharpCorner;
    sharpCorner = self->_sharpCorner;
    if (sharpCorner) {
      goto LABEL_10;
    }
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 0.5, v8);
    CGPathAddLineToPoint(Mutable, 0, 0.5, 0.5);
  }
  else
  {
    p_sharpCorner = &self->_roundCorner;
    sharpCorner = self->_roundCorner;
    if (sharpCorner) {
      goto LABEL_10;
    }
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 0.5, v8);
    CGPathAddArc(Mutable, 0, v10 + 0.5, v10 + 0.5, v10, 3.14159265, -1.57079633, 0);
  }
  CGPathAddLineToPoint(Mutable, 0, v6, 0.5);
  double v14 = +[CAShapeLayer layer];
  objc_msgSend(v14, "setBounds:", CGPointZero.x, CGPointZero.y, v6, v8);
  [v14 setPath:Mutable];
  id v15 = +[UIColor clearColor];
  objc_msgSend(v14, "setFillColor:", objc_msgSend(v15, "CGColor"));

  id v16 = +[UIColor whiteColor];
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v16, "CGColor"));

  [v14 setLineWidth:1.0];
  [v14 setLineCap:kCALineCapButt];
  v30.width = v6;
  v30.height = v8;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
  [v14 renderInContext:UIGraphicsGetCurrentContext()];
  CGPathRelease(Mutable);
  objc_super v17 = UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v18 = [v17 imageWithRenderingMode:2];
  v19 = *p_sharpCorner;
  *p_sharpCorner = (UIImage *)v18;

  UIGraphicsEndImageContext();
  sharpCorner = *p_sharpCorner;
LABEL_10:

  return sharpCorner;
}

- (void)_createCorners:(id)a3
{
  id v14 = a3;
  double v4 = [(NTKZeusComplicationBackgroundView *)self _cornerImage];
  double v5 = [v4 _flatImageWithColor:v14];

  [v5 size];
  if (v5)
  {
    double v8 = v6;
    double v9 = v7;
    double y = CGPointZero.y;
    id v11 = [v5 CGImage];
    for (uint64_t i = 0; i != 4; ++i)
    {
      v13 = [(NSArray *)self->_cornerLayers objectAtIndex:i];
      [v13 setContents:v11];
      [v13 bounds];
      if ((CLKRectEqualsRect() & 1) == 0) {
        objc_msgSend(v13, "setBounds:", CGPointZero.x, y, v8, v9);
      }
    }
  }
}

- (void)_updateBlancEditModeCorners
{
  id v4 = [(NTKZeudleComplicationBackgroundView *)self palette];
  unint64_t v3 = [v4 editMode];
  [(NTKZeusComplicationBackgroundView *)self _createCorners:v3];
}

- (void)_updateCorners
{
  unint64_t v3 = [(NTKZeudleComplicationBackgroundView *)self palette];
  id v7 = [v3 bottomComplicationBackgroundStroke];

  id v4 = v7;
  if (!v7 || v7 == (id)NTKFaceColorPaletteNotFoundColor)
  {
    double v5 = [(NTKZeudleComplicationBackgroundView *)self palette];
    uint64_t v6 = [v5 bottomComplication];

    id v4 = (id)v6;
  }
  id v8 = v4;
  [(NTKZeusComplicationBackgroundView *)self _createCorners:v4];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v7 = a5;
  id v8 = [a4 bottomComplication];
  double v9 = [v7 bottomComplication];

  NTKInterpolateBetweenColors();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(NTKZeusComplicationBackgroundView *)self _createCorners:v10];
}

- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKZeusComplicationBackgroundView;
  id v7 = [(NTKZeudleComplicationBackgroundView *)&v11 complicationColorForBlancEditMode:a4];
  v10.receiver = self;
  v10.super_class = (Class)NTKZeusComplicationBackgroundView;
  id v8 = [(NTKZeudleComplicationBackgroundView *)&v10 complicationColorForBlancEditMode:a5];
  double v9 = NTKInterpolateBetweenColors();

  [(NTKZeusComplicationBackgroundView *)self _createCorners:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundCorner, 0);
  objc_storeStrong((id *)&self->_sharpCorner, 0);

  objc_storeStrong((id *)&self->_cornerLayers, 0);
}

@end