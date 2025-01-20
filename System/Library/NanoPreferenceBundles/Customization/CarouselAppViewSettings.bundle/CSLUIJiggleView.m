@interface CSLUIJiggleView
+ (id)makePositionAnimation;
+ (id)makeTransformAnimation;
- (BOOL)isJiggling;
- (CSLUIJiggleView)initWithFrame:(CGRect)a3;
- (void)endJiggling;
- (void)setFrame:(CGRect)a3;
- (void)setJiggling:(BOOL)a3;
- (void)startJiggling;
@end

@implementation CSLUIJiggleView

- (CSLUIJiggleView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSLUIJiggleView;
  result = -[CSLUIJiggleView initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_isJiggling = 0;
  }
  return result;
}

- (void)setJiggling:(BOOL)a3
{
  if (self->_isJiggling != a3)
  {
    if (a3) {
      [(CSLUIJiggleView *)self startJiggling];
    }
    else {
      [(CSLUIJiggleView *)self endJiggling];
    }
  }
  self->_isJiggling = a3;
}

- (void)startJiggling
{
  id v4 = [(CSLUIJiggleView *)self layer];
  v2 = +[CSLUIJiggleView makePositionAnimation];
  [v4 addAnimation:v2 forKey:@"CSLUIJigglePosition"];

  v3 = +[CSLUIJiggleView makeTransformAnimation];
  [v4 addAnimation:v3 forKey:@"CSLUIJiggleTransform"];
}

- (void)endJiggling
{
  id v3 = [(CSLUIJiggleView *)self layer];
  [v3 removeAnimationForKey:@"CSLUIJigglePosition"];
  [v3 removeAnimationForKey:@"CSLUIJiggleTransform"];
  objc_msgSend(v3, "setPosition:", self->_unjitterPoint.x, self->_unjitterPoint.y);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  [(CSLUIJiggleView *)self transform];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6450;
  v16[3] = &unk_3CA58;
  v16[4] = self;
  +[UIView performWithoutAnimation:v16];
  v15.receiver = self;
  v15.super_class = (Class)CSLUIJiggleView;
  -[CSLUIJiggleView setFrame:](&v15, "setFrame:", x, y, width, height);
  v8 = [(CSLUIJiggleView *)self layer];
  [v8 position];
  self->_unjitterPoint.double x = v9;
  self->_unjitterPoint.double y = v10;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  long long v12 = v17;
  v11[2] = sub_6490;
  v11[3] = &unk_3CA80;
  v11[4] = self;
  long long v13 = v18;
  long long v14 = v19;
  +[UIView performWithoutAnimation:v11];
}

+ (id)makePositionAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"position"];
  [v2 setDuration:0.25];
  [v2 setAdditive:1];
  LODWORD(v3) = 2139095039;
  [v2 setRepeatCount:v3];
  [v2 setRemovedOnCompletion:0];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint32_t v5 = arc4random();
  float v6 = ((double)(v5 % 0x3E8) / 1000.0 + (double)(v5 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  double v7 = floorf(v6);
  uint32_t v8 = arc4random();
  float v9 = ((double)(v8 % 0x3E8) / 1000.0 + (double)(v8 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  CGFloat v10 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, floorf(v9));
  [v4 addObject:v10];
  uint32_t v11 = arc4random();
  float v12 = ((double)(v11 % 0x3E8) / 1000.0 + (double)(v11 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  double v13 = floorf(v12);
  uint32_t v14 = arc4random();
  float v15 = ((double)(v14 % 0x3E8) / 1000.0 + (double)(v14 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, floorf(v15));
  [v4 addObject:v16];

  uint32_t v17 = arc4random();
  float v18 = ((double)(v17 % 0x3E8) / 1000.0 + (double)(v17 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  double v19 = floorf(v18);
  uint32_t v20 = arc4random();
  float v21 = ((double)(v20 % 0x3E8) / 1000.0 + (double)(v20 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, floorf(v21));
  [v4 addObject:v22];

  uint32_t v23 = arc4random();
  float v24 = ((double)(v23 % 0x3E8) / 1000.0 + (double)(v23 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  double v25 = floorf(v24);
  uint32_t v26 = arc4random();
  float v27 = ((double)(v26 % 0x3E8) / 1000.0 + (double)(v26 % 0x3E8) / 1000.0) * 0.25 + -0.25;
  v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v25, floorf(v27));
  [v4 addObject:v28];

  [v4 addObject:v10];
  [v2 setBeginTime:ceilf((float)(arc4random() % 0x3E8 + 1) * 0.2) * 0.0500000007];
  [v2 setValues:v4];
  [v2 setFrameInterval:0.0500000007];

  return v2;
}

+ (id)makeTransformAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"transform"];
  [v2 setDuration:0.25];
  double v3 = +[CAValueFunction functionWithName:kCAValueFunctionRotateZ];
  [v2 setValueFunction:v3];

  [v2 setAdditive:1];
  LODWORD(v4) = 2139095039;
  [v2 setRepeatCount:v4];
  [v2 setRemovedOnCompletion:0];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v6) = -1122998213;
  double v7 = +[NSNumber numberWithFloat:v6];
  [v5 addObject:v7];

  LODWORD(v8) = 1024485435;
  float v9 = +[NSNumber numberWithFloat:v8];
  [v5 addObject:v9];

  LODWORD(v10) = -1122998213;
  uint32_t v11 = +[NSNumber numberWithFloat:v10];
  [v5 addObject:v11];

  [v2 setBeginTime:(float)(ceilf((float)(arc4random() % 0x3E8 + 1) * 0.2) * 0.05)];
  [v2 setValues:v5];
  [v2 setFrameInterval:0.0500000007];

  return v2;
}

- (BOOL)isJiggling
{
  return self->_isJiggling;
}

@end