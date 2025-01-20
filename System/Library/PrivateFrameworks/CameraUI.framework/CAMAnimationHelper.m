@interface CAMAnimationHelper
+ (double)highlightScaleForLayoutStyle:(int64_t)a3;
+ (id)_animationWithKeyPath:(id)a3;
+ (id)highlightTransformAnimation;
+ (void)animateLayer:(id)a3 forButtonHighlighted:(BOOL)a4 layoutStyle:(int64_t)a5;
+ (void)animateLayer:(id)a3 toFrame:(CGRect)a4 fromCurrentState:(BOOL)a5;
+ (void)configurePowerSensitiveAnimation:(id)a3;
+ (void)setLayer:(id)a3 highlighted:(BOOL)a4 inverted:(BOOL)a5 animated:(BOOL)a6 layoutStyle:(int64_t)a7;
@end

@implementation CAMAnimationHelper

+ (void)configurePowerSensitiveAnimation:(id)a3
{
  id v3 = a3;
  [v3 setFrameInterval:0.0166666667];
  [v3 setDiscretizesTime:1];
}

+ (void)animateLayer:(id)a3 toFrame:(CGRect)a4 fromCurrentState:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v23 = a3;
  v11 = [v23 presentationLayer];
  if (v11 && a5)
  {
    v12 = [v23 presentationLayer];
    v13 = [v12 valueForKeyPath:@"position"];
  }
  else
  {
    v13 = [v23 valueForKeyPath:@"position"];
  }

  v14 = [v23 presentationLayer];
  if (v14 && a5)
  {
    v15 = [v23 presentationLayer];
    v16 = [v15 valueForKeyPath:@"bounds"];
  }
  else
  {
    v16 = [v23 valueForKeyPath:@"bounds"];
  }

  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v19 = CGRectGetWidth(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v20 = CGRectGetHeight(v28);
  objc_msgSend(v23, "setPosition:", MidX, MidY);
  objc_msgSend(v23, "setBounds:", 0.0, 0.0, v19, v20);
  v21 = [a1 _animationWithKeyPath:@"position"];
  [v21 setFromValue:v13];
  v22 = [a1 _animationWithKeyPath:@"bounds"];
  [v22 setFromValue:v16];
  [v23 addAnimation:v21 forKey:@"positionAnimation"];
  [v23 addAnimation:v22 forKey:@"boundsAnimation"];
}

+ (id)_animationWithKeyPath:(id)a3
{
  id v3 = [MEMORY[0x263F15890] animationWithKeyPath:a3];
  [v3 setMass:2.0];
  [v3 setStiffness:300.0];
  [v3 setDamping:400.0];
  [v3 setVelocity:0.0];
  UIAnimationDragCoefficient();
  [v3 setDuration:v4 * 0.91];
  LODWORD(v5) = 1043928040;
  LODWORD(v6) = 1058272560;
  LODWORD(v7) = 1063980840;
  v8 = [MEMORY[0x263F15808] functionWithControlPoints:v5 :0.0 :v6 :v7];
  [v3 setTimingFunction:v8];

  [v3 setFillMode:*MEMORY[0x263F15AA8]];
  return v3;
}

+ (void)animateLayer:(id)a3 forButtonHighlighted:(BOOL)a4 layoutStyle:(int64_t)a5
{
}

+ (void)setLayer:(id)a3 highlighted:(BOOL)a4 inverted:(BOOL)a5 animated:(BOOL)a6 layoutStyle:(int64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 presentationLayer];
  v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v12;
  }
  id v16 = v15;

  v17 = [v16 valueForKeyPath:@"transform.scale.xy"];
  [v17 doubleValue];
  CGFloat v19 = v18;

  memset(&v34, 0, sizeof(v34));
  double v20 = [v16 valueForKeyPath:@"transform"];
  v21 = v20;
  if (v20) {
    [v20 CATransform3DValue];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }

  memset(&v33, 0, sizeof(v33));
  CATransform3DMakeScale(&v33, v19, v19, 1.0);
  memset(&v32, 0, sizeof(v32));
  CATransform3D a = v33;
  CATransform3DInvert(&b, &a);
  CATransform3D a = v34;
  CATransform3DConcat(&v32, &a, &b);
  if (v10)
  {
    [a1 highlightScaleForLayoutStyle:a7];
    memset(&a.m21, 0, 96);
    if (v9) {
      double v22 = 1.0 / v22;
    }
    memset(&a, 0, 32);
    CATransform3DMakeScale(&a, v22, v22, 1.0);
    CATransform3D v28 = v32;
    CATransform3D v27 = a;
    CATransform3DConcat(&v29, &v28, &v27);
    CATransform3D v32 = v29;
  }
  if (v8)
  {
    id v23 = [a1 highlightTransformAnimation];
    CATransform3D a = v34;
    v24 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
    [v23 setFromValue:v24];

    CATransform3D a = v32;
    CGRect v25 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
    [v23 setToValue:v25];

    [v12 addAnimation:v23 forKey:@"highlightScaleAnimation"];
  }
  CATransform3D v26 = v32;
  [v12 setTransform:&v26];
}

+ (double)highlightScaleForLayoutStyle:(int64_t)a3
{
  return dbl_209C7BD40[a3 == 1];
}

+ (id)highlightTransformAnimation
{
  UIAnimationDragCoefficient();
  float v3 = v2;
  float v4 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform"];
  [v4 setMass:0.8];
  [v4 setVelocity:0.0];
  [v4 setDamping:12.0 / v3];
  [v4 setStiffness:300.0 / (float)(v3 * v3)];
  [v4 durationForEpsilon:0.01];
  objc_msgSend(v4, "setDuration:");
  LODWORD(v5) = 1041865114;
  LODWORD(v6) = 0.5;
  LODWORD(v7) = 1.0;
  BOOL v8 = [MEMORY[0x263F15808] functionWithControlPoints:v5 :0.0 :v6 :v7];
  [v4 setTimingFunction:v8];

  return v4;
}

@end