@interface PHInCallRoundedRectView
- (CALayer)dodgeRingLayer;
- (CALayer)highlightDodgeLayer;
- (CALayer)highlightLuminanceLayer;
- (CALayer)luminanceRingLayer;
- (CALayer)selectionLayer;
- (PHInCallRoundedRectView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)strokeWidth;
- (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setDodgeRingLayer:(id)a3;
- (void)setHighlightDodgeLayer:(id)a3;
- (void)setHighlightLuminanceLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLuminanceRingLayer:(id)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PHInCallRoundedRectView

- (PHInCallRoundedRectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v35.receiver = self;
  v35.super_class = (Class)PHInCallRoundedRectView;
  v5 = -[PHInCallRoundedRectView initWithFrame:](&v35, "initWithFrame:", a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    [(PHInCallRoundedRectView *)v5 setUserInteractionEnabled:0];
    [(PHInCallRoundedRectView *)v6 setOpaque:0];
    v7 = +[UIColor clearColor];
    [(PHInCallRoundedRectView *)v6 setBackgroundColor:v7];

    v8 = [(PHInCallRoundedRectView *)v6 layer];
    [v8 setAllowsGroupBlending:0];

    v9 = [(PHInCallRoundedRectView *)v6 layer];
    [v9 setAllowsGroupOpacity:0];

    [(PHInCallRoundedRectView *)v6 setStrokeWidth:1.5];
    [(PHInCallRoundedRectView *)v6 setCornerRadius:5.0];
    uint64_t v10 = +[CALayer layer];
    luminanceRingLayer = v6->_luminanceRingLayer;
    v6->_luminanceRingLayer = (CALayer *)v10;

    uint64_t v12 = kCAFilterPlusL;
    v13 = +[CAFilter filterWithType:kCAFilterPlusL];
    [(CALayer *)v6->_luminanceRingLayer setCompositingFilter:v13];

    -[CALayer setFrame:](v6->_luminanceRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v14 = [(PHInCallRoundedRectView *)v6 layer];
    [v14 addSublayer:v6->_luminanceRingLayer];

    uint64_t v15 = +[CALayer layer];
    dodgeRingLayer = v6->_dodgeRingLayer;
    v6->_dodgeRingLayer = (CALayer *)v15;

    uint64_t v17 = kCAFilterColorDodgeBlendMode;
    v18 = +[CAFilter filterWithType:kCAFilterColorDodgeBlendMode];
    [(CALayer *)v6->_dodgeRingLayer setCompositingFilter:v18];

    -[CALayer setFrame:](v6->_dodgeRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v19 = [(PHInCallRoundedRectView *)v6 layer];
    [v19 addSublayer:v6->_dodgeRingLayer];

    uint64_t v20 = +[CALayer layer];
    highlightLuminanceLayer = v6->_highlightLuminanceLayer;
    v6->_highlightLuminanceLayer = (CALayer *)v20;

    v22 = +[CAFilter filterWithType:v17];
    [(CALayer *)v6->_highlightLuminanceLayer setCompositingFilter:v22];

    -[CALayer setFrame:](v6->_highlightLuminanceLayer, "setFrame:", 0.0, 0.0, width, height);
    v23 = [(PHInCallRoundedRectView *)v6 layer];
    [v23 addSublayer:v6->_highlightLuminanceLayer];

    uint64_t v24 = +[CALayer layer];
    highlightDodgeLayer = v6->_highlightDodgeLayer;
    v6->_highlightDodgeLayer = (CALayer *)v24;

    id v26 = +[UIColor colorWithWhite:0.600000024 alpha:1.0];
    -[CALayer setBackgroundColor:](v6->_highlightDodgeLayer, "setBackgroundColor:", [v26 CGColor]);

    v27 = +[CAFilter filterWithType:v17];
    [(CALayer *)v6->_highlightDodgeLayer setCompositingFilter:v27];

    -[CALayer setFrame:](v6->_highlightDodgeLayer, "setFrame:", 0.0, 0.0, width, height);
    [(PHInCallRoundedRectView *)v6 cornerRadius];
    -[CALayer setCornerRadius:](v6->_highlightDodgeLayer, "setCornerRadius:");
    [(CALayer *)v6->_highlightDodgeLayer setOpacity:0.0];
    v28 = [(PHInCallRoundedRectView *)v6 layer];
    [v28 addSublayer:v6->_highlightDodgeLayer];

    uint64_t v29 = +[CALayer layer];
    v30 = v6->_highlightLuminanceLayer;
    v6->_highlightLuminanceLayer = (CALayer *)v29;

    id v31 = +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
    -[CALayer setBackgroundColor:](v6->_highlightLuminanceLayer, "setBackgroundColor:", [v31 CGColor]);

    v32 = +[CAFilter filterWithType:v12];
    [(CALayer *)v6->_highlightLuminanceLayer setCompositingFilter:v32];

    -[CALayer setFrame:](v6->_highlightLuminanceLayer, "setFrame:", 0.0, 0.0, width, height);
    [(PHInCallRoundedRectView *)v6 cornerRadius];
    -[CALayer setCornerRadius:](v6->_highlightLuminanceLayer, "setCornerRadius:");
    [(CALayer *)v6->_highlightLuminanceLayer setOpacity:0.0];
    v33 = [(PHInCallRoundedRectView *)v6 layer];
    [v33 insertSublayer:v6->_highlightLuminanceLayer below:v6->_highlightDodgeLayer];
  }
  return v6;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PHInCallRoundedRectView;
  [(PHInCallRoundedRectView *)&v27 layoutSubviews];
  [(PHInCallRoundedRectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CALayer setFrame:](self->_highlightDodgeLayer, "setFrame:");
  -[CALayer setFrame:](self->_highlightLuminanceLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_dodgeRingLayer, "setFrame:", v4, v6, v8, v10);
  -[CALayer setFrame:](self->_luminanceRingLayer, "setFrame:", v4, v6, v8, v10);
  [(PHInCallRoundedRectView *)self bounds];
  double v12 = v11;
  double v14 = v13;
  [(PHInCallRoundedRectView *)self strokeWidth];
  double v16 = v15;
  uint64_t v17 = +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
  -[PHInCallRoundedRectView createRingImageWithSize:strokeWidth:color:](self, "createRingImageWithSize:strokeWidth:color:", v17, v12, v14, v16);
  id v18 = objc_claimAutoreleasedReturnValue();
  -[CALayer setContents:](self->_luminanceRingLayer, "setContents:", [v18 CGImage]);

  [(PHInCallRoundedRectView *)self bounds];
  double v20 = v19;
  double v22 = v21;
  [(PHInCallRoundedRectView *)self strokeWidth];
  double v24 = v23;
  v25 = +[UIColor colorWithWhite:0.600000024 alpha:1.0];
  -[PHInCallRoundedRectView createRingImageWithSize:strokeWidth:color:](self, "createRingImageWithSize:strokeWidth:color:", v25, v20, v22, v24);
  id v26 = objc_claimAutoreleasedReturnValue();
  -[CALayer setContents:](self->_dodgeRingLayer, "setContents:", [v26 CGImage]);
}

- (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.double width = width;
  v21.size.double height = height;
  CGRect v22 = CGRectInset(v21, a4, a4);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double v12 = v22.size.width;
  double v13 = v22.size.height;
  v22.origin.double x = width;
  v22.origin.double y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v22.origin, 0, 0.0);
  [(PHInCallRoundedRectView *)self cornerRadius];
  double v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v14);
  [(PHInCallRoundedRectView *)self cornerRadius];
  uint64_t v17 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v16);
  [v15 appendPath:v17];

  [v15 setUsesEvenOddFillRule:1];
  [v9 setFill];

  [v15 fill];
  id v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  LODWORD(v5) = 1043207291;
  double v6 = +[NSNumber numberWithFloat:v5];
  +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

  if (v3) {
    float v7 = 1.0;
  }
  else {
    float v7 = 0.0;
  }
  [(CALayer *)self->_highlightDodgeLayer setOpacity:COERCE_DOUBLE((unint64_t)LODWORD(v7))];
  *(float *)&double v8 = v7;
  [(CALayer *)self->_highlightLuminanceLayer setOpacity:v8];

  +[CATransaction commit];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHInCallRoundedRectView;
  -[PHInCallRoundedRectView setUserInteractionEnabled:](&v10, "setUserInteractionEnabled:");
  +[CATransaction begin];
  LODWORD(v5) = 1043207291;
  double v6 = +[NSNumber numberWithFloat:v5];
  +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

  if (v3) {
    float v8 = 1.0;
  }
  else {
    float v8 = 0.6;
  }
  *(float *)&double v7 = v8;
  [(CALayer *)self->_luminanceRingLayer setOpacity:v7];
  *(float *)&double v9 = v8;
  [(CALayer *)self->_dodgeRingLayer setOpacity:v9];
  +[CATransaction commit];
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectionLayer:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_highlightLuminanceLayer, 0);
  objc_storeStrong((id *)&self->_highlightDodgeLayer, 0);
  objc_storeStrong((id *)&self->_dodgeRingLayer, 0);

  objc_storeStrong((id *)&self->_luminanceRingLayer, 0);
}

@end