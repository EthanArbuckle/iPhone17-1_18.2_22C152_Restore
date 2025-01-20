@interface FMDeviceAnnotationView
- (CALayer)balloonImage;
- (CAShapeLayer)balloonLayer;
- (FMDeviceAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (FMDeviceAnnotationView)initWithCoder:(id)a3;
- (UIImage)deviceImage;
- (id)_bezierPathWithBalloonRadius:(double)a3 tailLength:(double)a4;
- (void)_applyCircularShadowToLayer:(id)a3 bounds:(CGRect)a4;
- (void)_setupLayers;
- (void)_updateAnnotation:(id)a3;
- (void)_updateAppearance;
- (void)_updateDynamicLayers;
- (void)prepareForDisplay;
- (void)setBalloonImage:(id)a3;
- (void)setBalloonLayer:(id)a3;
- (void)setDeviceImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMDeviceAnnotationView

- (FMDeviceAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FMDeviceAnnotationView;
  v4 = [(FMDeviceAnnotationView *)&v8 initWithAnnotation:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)CAShapeLayer);
    [(FMDeviceAnnotationView *)v4 setBalloonLayer:v5];

    id v6 = objc_alloc_init((Class)CALayer);
    [(FMDeviceAnnotationView *)v4 setBalloonImage:v6];

    [(FMDeviceAnnotationView *)v4 setCanShowCallout:1];
    [(FMDeviceAnnotationView *)v4 _setupLayers];
    [(FMDeviceAnnotationView *)v4 _updateAppearance];
  }
  return v4;
}

- (FMDeviceAnnotationView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  return [(FMDeviceAnnotationView *)&v4 initWithCoder:a3];
}

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  [(FMDeviceAnnotationView *)&v4 prepareForDisplay];
  v3 = [(FMDeviceAnnotationView *)self annotation];
  [(FMDeviceAnnotationView *)self _updateAnnotation:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FMDeviceAnnotationView;
  [(FMDeviceAnnotationView *)&v4 traitCollectionDidChange:a3];
  [(FMDeviceAnnotationView *)self _updateAppearance];
}

- (void)_setupLayers
{
  id v3 = [(FMDeviceAnnotationView *)self _bezierPathWithBalloonRadius:30.0 tailLength:7.5];
  id v4 = [v3 CGPath];
  id v5 = [(FMDeviceAnnotationView *)self balloonLayer];
  [v5 setPath:v4];

  id v6 = [(FMDeviceAnnotationView *)self balloonLayer];
  [v6 setFrame:CGRectMake(4.0, 0.0, 60.0, 67.5)];

  v7 = [(FMDeviceAnnotationView *)self balloonLayer];
  objc_super v8 = [(FMDeviceAnnotationView *)self balloonImage];
  [v7 addSublayer:v8];

  v9 = [(FMDeviceAnnotationView *)self balloonLayer];
  v10 = [(FMDeviceAnnotationView *)self balloonLayer];
  [v10 bounds];
  -[FMDeviceAnnotationView _applyCircularShadowToLayer:bounds:](self, "_applyCircularShadowToLayer:bounds:", v9);

  v11 = [(FMDeviceAnnotationView *)self layer];
  v12 = [(FMDeviceAnnotationView *)self balloonLayer];
  [v11 addSublayer:v12];

  v13 = [(FMDeviceAnnotationView *)self layer];
  [v13 setFrame:CGRectMake(0.0, 0.0, 68.0, 161.0)];

  [(FMDeviceAnnotationView *)self _updateDynamicLayers];
  v14 = [(FMDeviceAnnotationView *)self balloonLayer];
  long long v15 = *(_OWORD *)&CATransform3DIdentity.m33;
  v19[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  v19[5] = v15;
  long long v16 = *(_OWORD *)&CATransform3DIdentity.m43;
  v19[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v19[7] = v16;
  long long v17 = *(_OWORD *)&CATransform3DIdentity.m13;
  v19[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v19[1] = v17;
  long long v18 = *(_OWORD *)&CATransform3DIdentity.m23;
  v19[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v19[3] = v18;
  [v14 setTransform:v19];
}

- (void)_updateDynamicLayers
{
  id v2 = [(FMDeviceAnnotationView *)self balloonImage];
  [v2 setFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)];
}

- (void)_updateAnnotation:(id)a3
{
  [(FMDeviceAnnotationView *)self _updateDynamicLayers];
  id v4 = [(FMDeviceAnnotationView *)self deviceImage];
  id v5 = [v4 CGImage];
  id v6 = [(FMDeviceAnnotationView *)self balloonImage];
  [v6 setContents:v5];

  id v7 = [(FMDeviceAnnotationView *)self layer];
  [v7 setAnchorPoint:0.5, 0.5];
}

- (void)_updateAppearance
{
  id v3 = +[UITraitCollection currentTraitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    +[UIColor systemGray3Color];
  }
  else {
  id v7 = +[UIColor whiteColor];
  }
  id v5 = [v7 CGColor];
  id v6 = [(FMDeviceAnnotationView *)self balloonLayer];
  [v6 setFillColor:v5];
}

- (id)_bezierPathWithBalloonRadius:(double)a3 tailLength:(double)a4
{
  double v12 = a4 / 6.0;
  double v6 = a3 * 0.448;
  double v13 = a3 * 0.385;
  double v7 = a4 / 3.0;
  id v8 = objc_alloc_init((Class)UIBezierPath);
  [v8 moveToPoint:a3 + a3, a3];
  double v9 = a4 * 0.5;
  [v8 addCurveToPoint:v7 + a4 * 0.5 + a3 controlPoint1:a3 + a3 controlPoint2:a3 + a3];
  double v10 = a3 + a3 + a4;
  [v8 addCurveToPoint:a3 controlPoint1:v10 controlPoint2:v7 + a3 a3 + a3 + v7 v12 + a3];
  [v8 addCurveToPoint:a3 - (v9 + v7) controlPoint1:a3 + a3 controlPoint2:a3 - v12 v10 a3 - v7 a3 + a3 + v7];
  [v8 addCurveToPoint:0.0 controlPoint1:a3 controlPoint2:a3 + a3 - v7 0.0 a3 * 1.5];
  [v8 addCurveToPoint:a3 controlPoint1:0.0, 0.0 controlPoint2:v6, v6, 0.0];
  [v8 addCurveToPoint:a3 + a3 controlPoint1:a3 controlPoint2:a3 + a3 - v6];
  [v8 closePath];

  return v8;
}

- (void)_applyCircularShadowToLayer:(id)a3 bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v13.c = v8;
  *(_OWORD *)&v13.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v9 = a3;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGPathRef v10 = CGPathCreateWithEllipseInRect(v14, &v13);
  [v9 setShadowPath:v10 *(_OWORD *)&v13.a, *(_OWORD *)&v13.c, *(_OWORD *)&v13.tx];
  id v11 = +[UIColor blackColor];
  objc_msgSend(v9, "setShadowColor:", objc_msgSend(v11, "CGColor"));

  [v9 setShadowOffset:0.0, 0.0];
  LODWORD(v12) = 1045220557;
  [v9 setShadowOpacity:v12];
  [v9 setShadowRadius:4.0];
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (void)setDeviceImage:(id)a3
{
}

- (CAShapeLayer)balloonLayer
{
  return self->_balloonLayer;
}

- (void)setBalloonLayer:(id)a3
{
}

- (CALayer)balloonImage
{
  return self->_balloonImage;
}

- (void)setBalloonImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonImage, 0);
  objc_storeStrong((id *)&self->_balloonLayer, 0);

  objc_storeStrong((id *)&self->_deviceImage, 0);
}

@end