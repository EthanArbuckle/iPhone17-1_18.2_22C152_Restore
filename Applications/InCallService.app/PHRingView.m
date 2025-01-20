@interface PHRingView
+ (id)_createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5;
+ (id)ringImageCache;
- (BOOL)_enabled;
- (BOOL)_highlighted;
- (BOOL)_selected;
- (CALayer)dodgeRingLayer;
- (CALayer)highlightDodgeLayer;
- (CALayer)highlightLuminanceLayer;
- (CALayer)luminanceRingLayer;
- (CALayer)selectionLayer;
- (CGSize)ringSize;
- (PHRingView)initWithFrame:(CGRect)a3;
- (PHRingView)initWithFrame:(CGRect)a3 reuseIdentifier:(id)a4;
- (id)ringImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5 cacheIdentifier:(id)a6;
- (void)setDodgeRingLayer:(id)a3;
- (void)setHighlightDodgeLayer:(id)a3;
- (void)setHighlightLuminanceLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLuminanceRingLayer:(id)a3;
- (void)setRingSize:(CGSize)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)set_enabled:(BOOL)a3;
- (void)set_highlighted:(BOOL)a3;
- (void)set_selected:(BOOL)a3;
@end

@implementation PHRingView

+ (id)ringImageCache
{
  if (qword_100326238 != -1) {
    dispatch_once(&qword_100326238, &stru_1002CFC70);
  }
  v2 = (void *)qword_100326230;

  return v2;
}

- (id)ringImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5 cacheIdentifier:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v10 = a5;
  id v11 = a6;
  v12 = +[PHRingView ringImageCache];
  v13 = [v12 objectForKey:v11];

  if (!v13)
  {
    v13 = +[PHRingView _createRingImageWithSize:strokeWidth:color:](PHRingView, "_createRingImageWithSize:strokeWidth:color:", v10, width, height, a4);
    v14 = +[PHRingView ringImageCache];
    [v14 setObject:v13 forKey:v11];
  }

  return v13;
}

+ (id)_createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a5;
  v18.origin.double x = 0.0;
  v18.origin.double y = 0.0;
  v18.size.double width = width;
  v18.size.double height = height;
  CGRect v19 = CGRectInset(v18, a4, a4);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double v11 = v19.size.width;
  double v12 = v19.size.height;
  v19.origin.double x = width;
  v19.origin.double y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v19.origin, 0, 0.0);
  v13 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, width, height);
  v14 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", x, y, v11, v12);
  [v13 appendPath:v14];

  [v13 setUsesEvenOddFillRule:1];
  [v8 setFill];

  [v13 fill];
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

- (void)setSelected:(BOOL)a3
{
  if (self->__selected != a3)
  {
    BOOL v3 = a3;
    +[CATransaction begin];
    LODWORD(v5) = 1043207291;
    v6 = +[NSNumber numberWithFloat:v5];
    +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

    double v7 = 0.0;
    if (v3)
    {
      [(CALayer *)self->_highlightDodgeLayer setOpacity:0.0];
      LODWORD(v7) = 1.0;
    }
    [(CALayer *)self->_selectionLayer setOpacity:v7];
    +[CATransaction commit];
    self->__selected = v3;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->__highlighted != a3)
  {
    BOOL v3 = a3;
    +[CATransaction begin];
    LODWORD(v5) = 1043207291;
    v6 = +[NSNumber numberWithFloat:v5];
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
    self->__highlighted = v3;
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHRingView;
  -[PHRingView setUserInteractionEnabled:](&v10, "setUserInteractionEnabled:");
  if (self->__enabled != v3)
  {
    +[CATransaction begin];
    LODWORD(v5) = 1043207291;
    v6 = +[NSNumber numberWithFloat:v5];
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
    self->__enabled = v3;
  }
}

- (PHRingView)initWithFrame:(CGRect)a3
{
  return [(PHRingView *)self initWithFrame:@"Generic", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height reuseIdentifier];
}

- (PHRingView)initWithFrame:(CGRect)a3 reuseIdentifier:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v46.receiver = self;
  v46.super_class = (Class)PHRingView;
  objc_super v10 = -[PHRingView initWithFrame:](&v46, "initWithFrame:", x, y, width, height);
  double v11 = v10;
  if (v10)
  {
    -[PHRingView setRingSize:](v10, "setRingSize:", width, height);
    [(PHRingView *)v11 setUserInteractionEnabled:0];
    [(PHRingView *)v11 setOpaque:0];
    double v12 = +[UIColor clearColor];
    [(PHRingView *)v11 setBackgroundColor:v12];

    v13 = [(PHRingView *)v11 layer];
    [v13 setAllowsGroupBlending:0];

    v14 = [(PHRingView *)v11 layer];
    [v14 setAllowsGroupOpacity:0];

    v11->__enabled = 1;
    v11->__selected = 0;
    v11->__highlighted = 0;
    uint64_t v15 = +[CALayer layer];
    luminanceRingLayer = v11->_luminanceRingLayer;
    v11->_luminanceRingLayer = (CALayer *)v15;

    v17 = +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
    CGRect v18 = +[NSString stringWithFormat:@"%@-luminance", v9];
    -[PHRingView ringImageWithSize:strokeWidth:color:cacheIdentifier:](v11, "ringImageWithSize:strokeWidth:color:cacheIdentifier:", v17, v18, width, height, 1.5);
    id v19 = objc_claimAutoreleasedReturnValue();
    -[CALayer setContents:](v11->_luminanceRingLayer, "setContents:", [v19 CGImage]);

    uint64_t v20 = kCAFilterPlusL;
    v21 = +[CAFilter filterWithType:kCAFilterPlusL];
    [(CALayer *)v11->_luminanceRingLayer setCompositingFilter:v21];

    -[CALayer setFrame:](v11->_luminanceRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v22 = [(PHRingView *)v11 layer];
    [v22 addSublayer:v11->_luminanceRingLayer];

    uint64_t v23 = +[CALayer layer];
    dodgeRingLayer = v11->_dodgeRingLayer;
    v11->_dodgeRingLayer = (CALayer *)v23;

    v25 = +[UIColor colorWithWhite:0.600000024 alpha:1.0];
    v26 = +[NSString stringWithFormat:@"%@-dodge", v9];
    -[PHRingView ringImageWithSize:strokeWidth:color:cacheIdentifier:](v11, "ringImageWithSize:strokeWidth:color:cacheIdentifier:", v25, v26, width, height, 1.5);
    id v27 = objc_claimAutoreleasedReturnValue();
    -[CALayer setContents:](v11->_dodgeRingLayer, "setContents:", [v27 CGImage]);

    uint64_t v28 = kCAFilterColorDodgeBlendMode;
    v29 = +[CAFilter filterWithType:kCAFilterColorDodgeBlendMode];
    [(CALayer *)v11->_dodgeRingLayer setCompositingFilter:v29];

    -[CALayer setFrame:](v11->_dodgeRingLayer, "setFrame:", 0.0, 0.0, width, height);
    v30 = [(PHRingView *)v11 layer];
    [v30 addSublayer:v11->_dodgeRingLayer];

    uint64_t v31 = +[CALayer layer];
    highlightDodgeLayer = v11->_highlightDodgeLayer;
    v11->_highlightDodgeLayer = (CALayer *)v31;

    id v33 = +[UIColor colorWithWhite:0.600000024 alpha:1.0];
    -[CALayer setBackgroundColor:](v11->_highlightDodgeLayer, "setBackgroundColor:", [v33 CGColor]);

    v34 = +[CAFilter filterWithType:v28];
    [(CALayer *)v11->_highlightDodgeLayer setCompositingFilter:v34];

    v47.origin.double x = 0.0;
    v47.origin.double y = 0.0;
    v47.size.double width = width;
    v47.size.double height = height;
    CGRect v48 = CGRectInset(v47, 1.5, 1.5);
    -[CALayer setFrame:](v11->_highlightDodgeLayer, "setFrame:", 1.5, 1.5, v48.size.width, v48.size.height);
    [(CALayer *)v11->_highlightDodgeLayer setCornerRadius:(width + -1.5) * 0.5 + -0.5];
    [(CALayer *)v11->_highlightDodgeLayer setOpacity:0.0];
    v35 = [(PHRingView *)v11 layer];
    [v35 addSublayer:v11->_highlightDodgeLayer];

    uint64_t v36 = +[CALayer layer];
    highlightLuminanceLayer = v11->_highlightLuminanceLayer;
    v11->_highlightLuminanceLayer = (CALayer *)v36;

    id v38 = +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
    -[CALayer setBackgroundColor:](v11->_highlightLuminanceLayer, "setBackgroundColor:", [v38 CGColor]);

    v39 = +[CAFilter filterWithType:v20];
    [(CALayer *)v11->_highlightLuminanceLayer setCompositingFilter:v39];

    [(CALayer *)v11->_highlightDodgeLayer frame];
    -[CALayer setFrame:](v11->_highlightLuminanceLayer, "setFrame:");
    [(CALayer *)v11->_highlightDodgeLayer cornerRadius];
    -[CALayer setCornerRadius:](v11->_highlightLuminanceLayer, "setCornerRadius:");
    [(CALayer *)v11->_highlightLuminanceLayer setOpacity:0.0];
    v40 = [(PHRingView *)v11 layer];
    [v40 insertSublayer:v11->_highlightLuminanceLayer below:v11->_highlightDodgeLayer];

    uint64_t v41 = +[CALayer layer];
    selectionLayer = v11->_selectionLayer;
    v11->_selectionLayer = (CALayer *)v41;

    id v43 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v11->_selectionLayer, "setBackgroundColor:", [v43 CGColor]);

    -[CALayer setFrame:](v11->_selectionLayer, "setFrame:", 0.0, 0.0, width, height);
    [(CALayer *)v11->_selectionLayer setCornerRadius:width * 0.5];
    [(CALayer *)v11->_selectionLayer setOpacity:0.0];
    v44 = [(PHRingView *)v11 layer];
    [v44 addSublayer:v11->_selectionLayer];
  }
  return v11;
}

- (CGSize)ringSize
{
  objc_copyStruct(v4, &self->_ringSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setRingSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_ringSize, &v3, 16, 1, 0);
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSelectionLayer:(id)a3
{
}

- (BOOL)_selected
{
  return self->__selected;
}

- (void)set_selected:(BOOL)a3
{
  self->__selected = a3;
}

- (BOOL)_highlighted
{
  return self->__highlighted;
}

- (void)set_highlighted:(BOOL)a3
{
  self->__highlighted = a3;
}

- (BOOL)_enabled
{
  return self->__enabled;
}

- (void)set_enabled:(BOOL)a3
{
  self->__enabled = a3;
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