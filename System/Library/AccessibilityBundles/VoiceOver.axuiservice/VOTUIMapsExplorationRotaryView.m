@interface VOTUIMapsExplorationRotaryView
- (NSMutableArray)segmentViews;
- (VOTUIMapsExplorationRotaryView)initWithFrame:(CGRect)a3 atCenter:(CGPoint)a4;
- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4;
- (id)_segmentImageFrom:(double)a3 to:(double)a4;
- (void)addSubviewsFromExplorationSegments:(id)a3;
- (void)handleHighlightChangeWithLastIndex:(int64_t)a3 andNewIndex:(int64_t)a4;
- (void)setSegmentViews:(id)a3;
@end

@implementation VOTUIMapsExplorationRotaryView

- (VOTUIMapsExplorationRotaryView)initWithFrame:(CGRect)a3 atCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)VOTUIMapsExplorationRotaryView;
  v6 = -[VOTUIMapsExplorationRotaryView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  if (v6)
  {
    -[VOTUIMapsExplorationRotaryView setCenter:](v6, "setCenter:", x, y);
    v8 = v7;
  }

  return v7;
}

- (void)addSubviewsFromExplorationSegments:(id)a3
{
  id v21 = a3;
  v4 = [(VOTUIMapsExplorationRotaryView *)self segmentViews];
  [v4 makeObjectsPerformSelector:"removeFromSuperview"];

  v5 = objc_opt_new();
  [(VOTUIMapsExplorationRotaryView *)self setSegmentViews:v5];

  v6 = objc_opt_new();
  v7 = (char *)[v21 count];
  if ((uint64_t)v7 >= 1)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      objc_super v10 = [v21 objectAtIndex:i];
      id v11 = objc_alloc((Class)UIImageView);
      v12 = [v10 firstObject];
      [v12 floatValue];
      double v14 = v13;
      v15 = [v10 objectAtIndex:1];
      [v15 floatValue];
      v17 = [(VOTUIMapsExplorationRotaryView *)self _segmentImageFrom:v14 to:v16];
      id v18 = [v11 initWithImage:v17];

      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v18 setAlpha:0.300000012];
      [v18 setClipsToBounds:0];
      [(VOTUIMapsExplorationRotaryView *)self addSubview:v18];
      v19 = [(VOTUIMapsExplorationRotaryView *)self segmentViews];
      [v19 addObject:v18];

      v20 = [(VOTUIMapsExplorationRotaryView *)self _constraintsToCenterItem:v18 withItem:self];
      [v6 addObjectsFromArray:v20];
    }
  }
  [(VOTUIMapsExplorationRotaryView *)self addConstraints:v6];
}

- (id)_segmentImageFrom:(double)a3 to:(double)a4
{
  [(VOTUIMapsExplorationRotaryView *)self frame];
  double v8 = v7;
  [(VOTUIMapsExplorationRotaryView *)self frame];
  double v10 = v9;
  float v11 = a3;
  __float2 v12 = __sincosf_stret(v11);
  double v38 = v10 + (float)(v12.__sinval * 50.0);
  double v39 = v8 + (float)(v12.__cosval * 50.0);
  float v13 = a4;
  __float2 v14 = __sincosf_stret(v13);
  double v15 = (a4 - a3) * 0.5;
  float v16 = v15;
  double v40 = (float)(tanf(v16) * 50.0);
  float v17 = v15;
  double v18 = (float)(50.0 / cosf(v17));
  float v19 = v15 + a3;
  __float2 v20 = __sincosf_stret(v19);
  id v21 = +[UIScreen mainScreen];
  [v21 scale];
  CGFloat v23 = v22;
  v43.width = v8 + v8;
  v43.height = v10 + v10;
  UIGraphicsBeginImageContextWithOptions(v43, 0, v23);

  v24 = +[UIBezierPath bezierPath];
  objc_msgSend(v24, "moveToPoint:", v39, v38);
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10);
  objc_msgSend(v24, "addLineToPoint:", v8 + (float)(v14.__cosval * 50.0), v10 + (float)(v14.__sinval * 50.0));
  objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v8 + v18 * v20.__cosval, v10 + v18 * v20.__sinval, v40, 0.0, 6.28318531);
  objc_msgSend(v24, "addLineToPoint:", v39, v38);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CurrentContext = UIGraphicsGetCurrentContext();
  v27 = +[UIColor redColor];
  id v28 = [v27 colorWithAlphaComponent:1.0];
  id v29 = [v28 CGColor];
  v30 = +[UIColor whiteColor];
  id v31 = [v30 colorWithAlphaComponent:0.0];
  +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v29, [v31 CGColor], 0);
  CFArrayRef v32 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)locations = xmmword_2E0C0;
  v33 = CGGradientCreateWithColors(DeviceRGB, v32, locations);
  CGContextSaveGState(CurrentContext);
  v34 = +[UIColor whiteColor];
  v35 = [v34 colorWithAlphaComponent:0.0];
  [v35 set];

  [v24 fill];
  [v24 addClip];
  v44.double x = v8;
  v44.double y = v10;
  v45.double x = v8;
  v45.double y = v10;
  CGContextDrawRadialGradient(CurrentContext, v33, v44, 0.0, v45, 450.0, 2u);
  v36 = UIGraphicsGetImageFromCurrentImageContext();
  CGColorSpaceRelease(DeviceRGB);
  CGGradientRelease(v33);
  UIGraphicsEndImageContext();

  return v36;
}

- (id)_constraintsToCenterItem:(id)a3 withItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[NSLayoutConstraint constraintWithItem:v6 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
  v11[0] = v7;
  double v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:10 relatedBy:0 toItem:v5 attribute:10 multiplier:1.0 constant:0.0];

  v11[1] = v8;
  double v9 = +[NSArray arrayWithObjects:v11 count:2];

  return v9;
}

- (void)handleHighlightChangeWithLastIndex:(int64_t)a3 andNewIndex:(int64_t)a4
{
  if (a3 != -1)
  {
    double v7 = [(VOTUIMapsExplorationRotaryView *)self segmentViews];
    double v8 = [v7 objectAtIndex:a3];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_11DA4;
    v15[3] = &unk_3D2B0;
    id v16 = v8;
    id v9 = v8;
    +[UIView animateWithDuration:v15 animations:0.5];
  }
  if (a4 != -1)
  {
    double v10 = [(VOTUIMapsExplorationRotaryView *)self segmentViews];
    float v11 = [v10 objectAtIndex:a4];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_11DB4;
    v13[3] = &unk_3D2B0;
    id v14 = v11;
    id v12 = v11;
    +[UIView animateWithDuration:v13 animations:0.5];
  }
}

- (NSMutableArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end