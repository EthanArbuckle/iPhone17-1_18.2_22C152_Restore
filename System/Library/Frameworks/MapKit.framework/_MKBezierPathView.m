@interface _MKBezierPathView
+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4;
+ (CGPath)_createSmoothTransitionPathForBalloonRadius:(double)a3 tailLength:(double)a4;
+ (Class)layerClass;
- (BOOL)containsPoint:(CGPoint)a3;
- (_MKBezierPathView)initWithBalloonRadius:(double)a3 tailLength:(double)a4 smoothTailTransition:(BOOL)a5;
- (_MKBezierPathView)initWithFrame:(CGRect)a3;
- (_MKBezierPathView)initWithOvalInSize:(CGSize)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)setFillColor:(id)a3;
- (void)setPath:(CGPath *)a3;
- (void)setPath:(CGPath *)a3 duration:(double)a4;
- (void)setStrokeColor:(id)a3 width:(double)a4;
@end

@implementation _MKBezierPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_MKBezierPathView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MKBezierPathView;
  v3 = -[_MKBezierPathView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_MKBezierPathView)initWithBalloonRadius:(double)a3 tailLength:(double)a4 smoothTailTransition:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = -[_MKBezierPathView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3 + a3, a4 + a3 * 2.0);
  if (v8)
  {
    v9 = objc_opt_class();
    if (v5) {
      uint64_t v10 = [v9 _createSmoothTransitionPathForBalloonRadius:a3 tailLength:a4];
    }
    else {
      uint64_t v10 = [v9 _createPathForBalloonRadius:a3 tailLength:a4];
    }
    v11 = (const CGPath *)v10;
    [(_MKBezierPathView *)v8 setPath:v10];
    CGPathRelease(v11);
    [(_MKBezierPathView *)v8 bounds];
    double v13 = 1.0 - a4 / v12;
    v14 = [(_MKBezierPathView *)v8 layer];
    objc_msgSend(v14, "setContentsCenter:", 0.0, 0.0, 1.0, v13);
  }
  return v8;
}

- (_MKBezierPathView)initWithOvalInSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  BOOL v5 = -[_MKBezierPathView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3.width, a3.height);
  if (v5)
  {
    v8.origin.x = 0.0;
    v8.origin.y = 0.0;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    v6 = CGPathCreateWithEllipseInRect(v8, 0);
    [(_MKBezierPathView *)v5 setPath:v6];
    CGPathRelease(v6);
  }
  return v5;
}

- (void)setPath:(CGPath *)a3
{
}

- (void)setPath:(CGPath *)a3 duration:(double)a4
{
  v6 = [(_MKBezierPathView *)self layer];
  id v10 = v6;
  if (a4 <= 0.0)
  {
    [v6 removeAnimationForKey:@"path"];
    [v10 setPath:a3];
  }
  else
  {
    objc_super v7 = [v6 currentLayer];
    CGRect v8 = CGPathRetain((CGPathRef)[v7 path]);

    [v10 removeAnimationForKey:@"path"];
    v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
    [v9 setFromValue:v8];
    [v9 setToValue:a3];
    [v9 setDuration:a4];
    [v9 setRemovedOnCompletion:1];
    [v10 addAnimation:v9 forKey:@"path"];

    [v10 setPath:a3];
    if (v8) {
      CGPathRelease(v8);
    }
  }
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  id v5 = a3;
  id v10 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  v6 = (void *)MEMORY[0x1E4F42F80];
  objc_super v7 = [(_MKBezierPathView *)self traitCollection];
  [v6 _setCurrentTraitCollection:v7];

  CGRect v8 = [(_MKBezierPathView *)self layer];
  id v9 = v5;
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v9, "CGColor"));

  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v10];
}

- (void)setStrokeColor:(id)a3 width:(double)a4
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  id v7 = a3;
  id v12 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  CGRect v8 = (void *)MEMORY[0x1E4F42F80];
  id v9 = [(_MKBezierPathView *)self traitCollection];
  [v8 _setCurrentTraitCollection:v9];

  id v10 = [(_MKBezierPathView *)self layer];
  id v11 = v7;
  objc_msgSend(v10, "setStrokeColor:", objc_msgSend(v11, "CGColor"));
  [v10 setLineWidth:a4];
  [MEMORY[0x1E4F42F80] _setCurrentTraitCollection:v12];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3 = [(_MKBezierPathView *)self layer];
  objc_msgSend(v3, "setFillColor:", -[UIColor CGColor](self->_fillColor, "CGColor"));
  objc_msgSend(v3, "setStrokeColor:", -[UIColor CGColor](self->_strokeColor, "CGColor"));
  v4.receiver = self;
  v4.super_class = (Class)_MKBezierPathView;
  [(_MKBezierPathView *)&v4 _dynamicUserInterfaceTraitDidChange];
}

+ (CGPath)_createPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v6 = a4 / 6.0;
  CGFloat v12 = a3 * 0.38499999;
  double v7 = a4 / 3.0;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a3 + a3, a3);
  double v9 = a4 * 0.5;
  CGPathAddCurveToPoint(Mutable, 0, a3 + a3, a3 * 1.5, a3 + a3 - a3 * 0.38499999, a3 + a3 - v7, v7 + a4 * 0.5 + a3, a3 + a3);
  CGFloat v10 = a3 + a3 + a4;
  CGPathAddCurveToPoint(Mutable, 0, v7 + a3, a3 + a3 + v7, v6 + a3, v10, a3, v10);
  CGPathAddCurveToPoint(Mutable, 0, a3 - v6, v10, a3 - v7, a3 + a3 + v7, a3 - (v9 + v7), a3 + a3);
  CGPathAddCurveToPoint(Mutable, 0, v12, a3 + a3 - v7, 0.0, a3 * 1.5, 0.0, a3);
  CGPathAddCurveToPoint(Mutable, 0, 0.0, a3 * 0.448000014, a3 * 0.448000014, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, a3 + a3 - a3 * 0.448000014, 0.0, a3 + a3, a3 * 0.448000014, a3 + a3, a3);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

+ (CGPath)_createSmoothTransitionPathForBalloonRadius:(double)a3 tailLength:(double)a4
{
  CGFloat v5 = a3 + a3;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a3 * 1.27900004, a3 * 1.96010005);
  CGPathAddLineToPoint(Mutable, 0, a3 * 1.27900004, a3 * 1.96010005);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.17630005, a3 * 1.98930001, a3 * 1.09080005, a3 * 2.05649996, a3 * 1.04250002, a3 * 2.14980006);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.02999997, a3 * 2.17359996, a3 * 1.02199996, a3 * 2.19840002, a3 * 0.999800026, a3 * 2.19840002);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.977599978, a3 * 2.19849992, a3 * 0.969600022, a3 * 2.1730001, a3 * 0.957099974, a3 * 2.14980006);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.908699989, a3 * 2.05699992, a3 * 0.823000014, a3 * 1.98930001, a3 * 0.720200002, a3 * 1.96010005);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 0.304399997, a3 * 1.83920002, 0.0, a3 * 1.45510006, 0.0, a3 * 0.999800026);
  CGPathAddCurveToPoint(Mutable, 0, 0.0, a3 * 0.447600007, a3 * 0.447600007, 0.0, a3, 0.0);
  CGPathAddCurveToPoint(Mutable, 0, a3 * 1.55219996, 0.0, v5, a3 * 0.447600007, v5, a3 * 0.999800026);
  CGPathAddCurveToPoint(Mutable, 0, v5, a3 * 1.45510006, a3 * 1.69550002, a3 * 1.83920002, a3 * 1.27900004, a3 * 1.96000004);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGFloat v5 = [(_MKBezierPathView *)self layer];
  double v6 = (const CGPath *)[v5 path];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  BOOL v7 = CGPathContainsPoint(v6, 0, v9, 0);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong((id *)&self->_fillColor, 0);
}

@end