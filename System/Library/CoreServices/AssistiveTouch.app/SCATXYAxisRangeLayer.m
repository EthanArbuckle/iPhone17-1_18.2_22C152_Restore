@interface SCATXYAxisRangeLayer
+ (double)rangeLayerFrameInset;
- (SCATXYAxisLineLayer)lineLayer;
- (SCATXYAxisRangeLayer)initWithAxis:(int)a3;
- (id)_backgroundColorForTheme:(int)a3;
- (id)_borderBackgroundColorForTheme:(int)a3;
- (id)_borderForegroundColorForTheme:(int)a3;
- (void)removeAllAnimations;
- (void)resetLineLayer;
- (void)setLineLayer:(id)a3;
- (void)updateFrameForParentBounds:(CGRect)a3 refinementPoint:(CGPoint *)a4;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
- (void)updateToFitWithinParentBounds:(CGRect)a3;
@end

@implementation SCATXYAxisRangeLayer

+ (double)rangeLayerFrameInset
{
  return 20.0;
}

- (SCATXYAxisRangeLayer)initWithAxis:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)SCATXYAxisRangeLayer;
  v4 = -[SCATAxisLayer initWithAxis:](&v13, "initWithAxis:");
  if (v4)
  {
    +[SCATAxisLayer rangeLayerBorderWidth];
    -[SCATXYAxisRangeLayer setBorderWidth:](v4, "setBorderWidth:");
    v5 = [(SCATAxisLayer *)[SCATXYAxisLineLayer alloc] initWithAxis:v3];
    [(SCATXYAxisRangeLayer *)v4 setLineLayer:v5];
    v6 = [(SCATAxisLayer *)v4 compositingLayer];
    [(SCATXYAxisRangeLayer *)v4 insertSublayer:v5 below:v6];

    uint64_t v7 = kCAFilterPlusL;
    v8 = +[CAFilter filterWithType:kCAFilterPlusL];
    [(SCATXYAxisRangeLayer *)v4 setCompositingFilter:v8];

    v9 = [(SCATAxisLayer *)v4 foregroundLayer];
    [v9 setBorderWidth:1.0];

    v10 = [(SCATAxisLayer *)v4 foregroundLayer];
    v11 = +[CAFilter filterWithType:v7];
    [v10 setCompositingFilter:v11];
  }
  return v4;
}

- (void)removeAllAnimations
{
  uint64_t v3 = [(SCATXYAxisRangeLayer *)self presentationLayer];
  [v3 position];
  double v5 = v4;
  double v7 = v6;

  v16.receiver = self;
  v16.super_class = (Class)SCATXYAxisRangeLayer;
  [(SCATXYAxisRangeLayer *)&v16 removeAllAnimations];
  -[SCATAxisLayer updateLayerTreePosition:](self, "updateLayerTreePosition:", v5, v7);
  v8 = [(SCATXYAxisRangeLayer *)self lineLayer];
  v9 = [v8 presentationLayer];
  [v9 position];
  double v11 = v10;
  double v13 = v12;

  v14 = [(SCATXYAxisRangeLayer *)self lineLayer];
  [v14 removeAllAnimations];

  v15 = [(SCATXYAxisRangeLayer *)self lineLayer];
  objc_msgSend(v15, "updateLayerTreePosition:", v11, v13);
}

- (void)resetLineLayer
{
  uint64_t v3 = [(SCATXYAxisRangeLayer *)self lineLayer];
  [v3 removeFromSuperlayer];

  double v4 = [(SCATXYAxisRangeLayer *)self lineLayer];
  [v4 removeAllAnimations];

  double v5 = [(SCATXYAxisRangeLayer *)self lineLayer];
  LODWORD(v6) = 1.0;
  [v5 setSpeed:v6];

  id v8 = [(SCATXYAxisRangeLayer *)self lineLayer];
  double v7 = [(SCATAxisLayer *)self compositingLayer];
  [(SCATXYAxisRangeLayer *)self insertSublayer:v8 below:v7];
}

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)SCATXYAxisRangeLayer;
  -[SCATAxisLayer updateTheme:animated:](&v13, "updateTheme:animated:");
  if (!v4)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  double v7 = [(SCATXYAxisRangeLayer *)self lineLayer];
  [v7 updateTheme:v5 animated:v4];

  id v8 = [(SCATXYAxisRangeLayer *)self _backgroundColorForTheme:v5];
  -[SCATAxisLayer setBackgroundColor:](self, "setBackgroundColor:", [v8 CGColor]);

  id v9 = [(SCATXYAxisRangeLayer *)self _borderBackgroundColorForTheme:v5];
  -[SCATXYAxisRangeLayer setBorderColor:](self, "setBorderColor:", [v9 CGColor]);

  id v10 = [(SCATXYAxisRangeLayer *)self _borderForegroundColorForTheme:v5];
  id v11 = [v10 CGColor];
  double v12 = [(SCATAxisLayer *)self foregroundLayer];
  [v12 setBorderColor:v11];

  if (!v4) {
    +[CATransaction commit];
  }
}

- (void)updateFrameForParentBounds:(CGRect)a3 refinementPoint:(CGPoint *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4)
  {
    +[SCATAxisLayer rangeLayerMaxWidth];
    double v11 = v10;
  }
  else
  {
    double v12 = +[AXSettings sharedInstance];
    if ([v12 switchControlPointPickerSelectionStyle] == (id)1) {
      +[SCATAxisLayer lineLayerMaxWidth];
    }
    else {
      +[SCATAxisLayer rangeLayerMaxWidth];
    }
    double v11 = v13;
  }
  unsigned int v14 = [(SCATAxisLayer *)self axis];
  [(id)objc_opt_class() rangeLayerFrameInset];
  double v16 = v15 * -0.5;
  if (v14)
  {
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGRect v41 = CGRectInset(v40, v16, 0.0);
    double v17 = v41.origin.x;
    double v18 = v41.origin.y;
    double v19 = v11;
    double v11 = v41.size.width;
    if (!a4) {
      goto LABEL_17;
    }
  }
  else
  {
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    CGRect v43 = CGRectInset(v42, 0.0, v16);
    double v17 = v43.origin.x;
    double v18 = v43.origin.y;
    double v19 = v43.size.height;
    if (!a4) {
      goto LABEL_17;
    }
  }
  v20 = [(SCATXYAxisRangeLayer *)self superlayer];
  v21 = [v20 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    +[HNDScreen convertPoint:toView:](HNDScreen, "convertPoint:toView:", v21, a4->x, a4->y);
    double v23 = v22;
    double v25 = v24;
    if ([(SCATAxisLayer *)self axis]) {
      double v18 = v25 - v19 * 0.5;
    }
    else {
      double v17 = v23 - v11 * 0.5;
    }
  }
  else
  {
    v37 = v21;
    _AXAssert();
  }

LABEL_17:
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  -[SCATAxisLayer setFrame:](self, "setFrame:", v17, v18, v11, v19);
  +[CATransaction commit];
  v44.origin.CGFloat x = v17;
  v44.origin.CGFloat y = v18;
  v44.size.CGFloat width = v11;
  v44.size.CGFloat height = v19;
  CGRect v45 = CGRectInset(v44, 1.0, 1.0);
  double v26 = v45.size.width;
  double v27 = v45.size.height;
  v28 = [(SCATAxisLayer *)self foregroundLayer];
  objc_msgSend(v28, "setFrame:", 1.0, 1.0, v26, v27);

  v29 = [(SCATAxisLayer *)self compositingLayer];
  objc_msgSend(v29, "setFrame:", 1.0, 1.0, v26, v27);

  LODWORD(v29) = [(SCATAxisLayer *)self axis];
  +[SCATAxisLayer lineLayerMaxWidth];
  if (v29) {
    double v19 = v30;
  }
  else {
    double v11 = v30;
  }
  v31 = [(SCATXYAxisRangeLayer *)self lineLayer];
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v11, v19);

  v46.origin.CGFloat x = 0.0;
  v46.origin.CGFloat y = 0.0;
  v46.size.CGFloat width = v11;
  v46.size.CGFloat height = v19;
  CGRect v47 = CGRectInset(v46, 1.0, 1.0);
  double v32 = v47.size.width;
  double v33 = v47.size.height;
  v34 = [(SCATXYAxisRangeLayer *)self lineLayer];
  v35 = [v34 foregroundLayer];
  objc_msgSend(v35, "setFrame:", 1.0, 1.0, v32, v33);

  id v38 = [(SCATXYAxisRangeLayer *)self lineLayer];
  v36 = [v38 compositingLayer];
  objc_msgSend(v36, "setFrame:", 1.0, 1.0, v32, v33);
}

- (void)updateToFitWithinParentBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(SCATXYAxisRangeLayer *)self frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if ([(SCATAxisLayer *)self axis])
  {
    if (v9 + v13 <= height)
    {
      if (v9 < 0.0)
      {
        double v13 = v13 - fabs(v9);
        double v9 = 0.0;
      }
    }
    else
    {
      double v13 = height - v9;
    }
  }
  else if (v7 + v11 <= width)
  {
    if (v7 < 0.0)
    {
      double v11 = v11 - fabs(v7);
      double v7 = 0.0;
    }
  }
  else
  {
    double v11 = width - v7;
  }
  -[SCATAxisLayer setFrame:](self, "setFrame:", v7, v9, v11, v13);
  v19.origin.CGFloat x = v7;
  v19.origin.CGFloat y = v9;
  v19.size.double width = v11;
  v19.size.double height = v13;
  CGRect v20 = CGRectInset(v19, 1.0, 1.0);
  double v14 = v20.size.width;
  double v15 = v20.size.height;
  double v16 = [(SCATAxisLayer *)self foregroundLayer];
  objc_msgSend(v16, "setFrame:", 1.0, 1.0, v14, v15);

  id v17 = [(SCATAxisLayer *)self compositingLayer];
  objc_msgSend(v17, "setFrame:", 1.0, 1.0, v14, v15);
}

- (id)_backgroundColorForTheme:(int)a3
{
  if (a3)
  {
    uint64_t v3 = +[UIColor clearColor];
  }
  else
  {
    BOOL v4 = +[AXSettings sharedInstance];
    if ([v4 assistiveTouchScannerCursorHighVisibilityEnabled]) {
      double v5 = 0.25;
    }
    else {
      double v5 = 0.15;
    }

    double v6 = +[AXSettings sharedInstance];
    [v6 assistiveTouchCursorColor];

    double v7 = (CGColor *)AXSAssistiveTouchCursorColor();
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(v7, v5);
    uint64_t v3 = +[UIColor colorWithCGColor:CFAutorelease(CopyWithAlpha)];
  }

  return v3;
}

- (id)_borderBackgroundColorForTheme:(int)a3
{
  if (a3 > 1)
  {
    +[UIColor clearColor];
  }
  else
  {
    uint64_t v3 = +[AXSettings sharedInstance];
    [v3 assistiveTouchCursorColor];

    +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
  BOOL v4 = };

  return v4;
}

- (id)_borderForegroundColorForTheme:(int)a3
{
  if (a3 > 1)
  {
    +[UIColor clearColor];
  }
  else
  {
    uint64_t v3 = +[AXSettings sharedInstance];
    [v3 assistiveTouchCursorColor];

    +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
  BOOL v4 = };

  return v4;
}

- (SCATXYAxisLineLayer)lineLayer
{
  return self->_lineLayer;
}

- (void)setLineLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end