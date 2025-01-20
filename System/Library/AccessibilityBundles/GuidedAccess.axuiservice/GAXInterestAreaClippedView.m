@interface GAXInterestAreaClippedView
- (CGPoint)_centerForBackground;
- (CGSize)backgroundSize;
- (GAXInterestAreaClippedView)initWithCoder:(id)a3;
- (GAXInterestAreaClippedView)initWithFrame:(CGRect)a3;
- (GAXInterestAreaClippedViewDelegate)delegate;
- (UIBezierPath)clippingPath;
- (UIView)backgroundView;
- (double)backgroundPatternScaleFactor;
- (id)backgroundColor;
- (void)_commonInit;
- (void)_updateBackgroundViewCenter;
- (void)_updateMaskLayer;
- (void)_updateMaskLayerFrame;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundPatternScaleFactor:(double)a3;
- (void)setBackgroundSize:(CGSize)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setClippingPath:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation GAXInterestAreaClippedView

- (void)_commonInit
{
  id v3 = objc_alloc((Class)UIView);
  [(GAXInterestAreaClippedView *)self bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:");
  [(GAXInterestAreaClippedView *)self addSubview:v5];
  [(GAXInterestAreaClippedView *)self setBackgroundView:v5];
  [(GAXInterestAreaClippedView *)self setBackgroundPatternScaleFactor:1.0];
  v4 = [(GAXInterestAreaClippedView *)self layer];
  [v4 setMasksToBounds:1];
}

- (GAXInterestAreaClippedView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaClippedView;
  id v3 = -[GAXInterestAreaClippedView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GAXInterestAreaClippedView *)v3 _commonInit];
  }
  return v4;
}

- (GAXInterestAreaClippedView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXInterestAreaClippedView;
  id v3 = [(GAXInterestAreaClippedView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GAXInterestAreaClippedView *)v3 _commonInit];
  }
  return v4;
}

- (void)dealloc
{
  [(GAXInterestAreaClippedView *)self setClippingPath:0];
  v3.receiver = self;
  v3.super_class = (Class)GAXInterestAreaClippedView;
  [(GAXInterestAreaClippedView *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(GAXInterestAreaClippedView *)self _updateBackgroundViewCenter];
    id v5 = obj;
  }
}

- (void)setClippingPath:(id)a3
{
  if (self->_clippingPath != a3)
  {
    v4 = (UIBezierPath *)[a3 copy];
    clippingPath = self->_clippingPath;
    self->_clippingPath = v4;

    [(GAXInterestAreaClippedView *)self _updateMaskLayer];
  }
}

- (CGSize)backgroundSize
{
  v2 = [(GAXInterestAreaClippedView *)self backgroundView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setBackgroundSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(GAXInterestAreaClippedView *)self _centerForBackground];
  double v7 = v6 - width * 0.5;
  double v9 = v8 - height * 0.5;
  id v10 = [(GAXInterestAreaClippedView *)self backgroundView];
  objc_msgSend(v10, "setFrame:", v7, v9, width, height);
}

- (id)backgroundColor
{
  v2 = [(GAXInterestAreaClippedView *)self backgroundView];
  double v3 = [v2 backgroundColor];

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(GAXInterestAreaClippedView *)self backgroundView];
  [v5 setBackgroundColor:v4];
}

- (void)setBackgroundPatternScaleFactor:(double)a3
{
  if (self->_backgroundPatternScaleFactor != a3)
  {
    memset(&v7, 0, sizeof(v7));
    CGAffineTransformMakeScale(&v7, a3, a3);
    CGAffineTransform v6 = v7;
    id v4 = [(GAXInterestAreaClippedView *)self backgroundView];
    CGAffineTransform v5 = v6;
    [v4 setTransform:&v5];
  }
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaClippedView;
  -[GAXInterestAreaClippedView setCenter:](&v4, "setCenter:", a3.x, a3.y);
  [(GAXInterestAreaClippedView *)self _updateBackgroundViewCenter];
  [(GAXInterestAreaClippedView *)self _updateMaskLayerFrame];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaClippedView;
  -[GAXInterestAreaClippedView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(GAXInterestAreaClippedView *)self _updateBackgroundViewCenter];
  [(GAXInterestAreaClippedView *)self _updateMaskLayerFrame];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GAXInterestAreaClippedView;
  -[GAXInterestAreaClippedView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(GAXInterestAreaClippedView *)self _updateBackgroundViewCenter];
  [(GAXInterestAreaClippedView *)self _updateMaskLayerFrame];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)GAXInterestAreaClippedView;
  [(GAXInterestAreaClippedView *)&v3 didMoveToWindow];
  [(GAXInterestAreaClippedView *)self _updateMaskLayer];
  [(GAXInterestAreaClippedView *)self _updateBackgroundViewCenter];
}

- (CGPoint)_centerForBackground
{
  objc_super v3 = [(GAXInterestAreaClippedView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 centerForBackgroundOfInterestAreaClippedView:self];
  }
  else {
    [(GAXInterestAreaClippedView *)self center];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_updateBackgroundViewCenter
{
  [(GAXInterestAreaClippedView *)self _centerForBackground];
  double v4 = v3;
  double v6 = v5;
  id v7 = [(GAXInterestAreaClippedView *)self backgroundView];
  objc_msgSend(v7, "setCenter:", v4, v6);
}

- (void)_updateMaskLayer
{
  double v3 = [(GAXInterestAreaClippedView *)self clippingPath];
  if (v3)
  {
    id v22 = v3;
    if (([v3 isEmpty] & 1) == 0)
    {
      double v4 = [(GAXInterestAreaClippedView *)self window];
      if (v4)
      {
        if ([v22 _gaxIsSimpleRectangle])
        {
          id v5 = [(GAXInterestAreaClippedView *)self layer];
          [v5 setMask:0];
        }
        else
        {
          [(GAXInterestAreaClippedView *)self bounds];
          double v7 = v6;
          double v9 = v8;
          double v11 = v10;
          double v13 = v12;
          v14 = [v4 screen];
          [v14 scale];
          CGFloat v16 = v15;

          v24.double width = v11;
          v24.double height = v13;
          UIGraphicsBeginImageContextWithOptions(v24, 0, v16);
          CurrentContext = UIGraphicsGetCurrentContext();
          CGContextSaveGState(CurrentContext);
          id v18 = +[UIColor blackColor];
          CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v18 CGColor]);

          CGContextAddPath(CurrentContext, (CGPathRef)[v22 CGPath]);
          CGContextFillPath(CurrentContext);
          v19 = UIGraphicsGetImageFromCurrentImageContext();
          CGContextRestoreGState(CurrentContext);
          UIGraphicsEndImageContext();
          v20 = [(GAXInterestAreaClippedView *)self layer];
          v21 = [v20 mask];
          if (!v21)
          {
            v21 = objc_opt_new();
            [v20 setMask:v21];
          }
          id v5 = v19;
          objc_msgSend(v21, "setContents:", objc_msgSend(v5, "CGImage"));
          [v5 scale];
          objc_msgSend(v21, "setContentsScale:");
          objc_msgSend(v21, "setFrame:", v7, v9, v11, v13);
        }
      }
    }
  }

  _objc_release_x1();
}

- (void)_updateMaskLayerFrame
{
  double v3 = [(GAXInterestAreaClippedView *)self layer];
  id v4 = [v3 mask];

  if (v4)
  {
    +[CATransaction begin];
    +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    [(GAXInterestAreaClippedView *)self bounds];
    objc_msgSend(v4, "setFrame:");
    +[CATransaction commit];
  }
}

- (GAXInterestAreaClippedViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GAXInterestAreaClippedViewDelegate *)WeakRetained;
}

- (UIBezierPath)clippingPath
{
  return self->_clippingPath;
}

- (double)backgroundPatternScaleFactor
{
  return self->_backgroundPatternScaleFactor;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_clippingPath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end