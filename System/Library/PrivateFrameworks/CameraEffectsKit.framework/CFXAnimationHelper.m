@interface CFXAnimationHelper
+ (double)_highlightScaleForLayoutStyle:(int64_t)a3;
+ (id)_animationWithKeyPath:(id)a3;
+ (void)animateLayer:(id)a3 forButtonHighlighted:(BOOL)a4 layoutStyle:(int64_t)a5;
+ (void)animateLayer:(id)a3 toFrame:(CGRect)a4 fromCurrentState:(BOOL)a5;
+ (void)configurePowerSensitiveAnimation:(id)a3;
@end

@implementation CFXAnimationHelper

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
  v3 = [MEMORY[0x263F15890] animationWithKeyPath:a3];
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
  BOOL v6 = a4;
  id v8 = a3;
  UIAnimationDragCoefficient();
  float v10 = v9;
  v11 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform"];
  [v11 setMass:0.8];
  [v11 setVelocity:0.0];
  [v11 setDamping:12.0 / v10];
  [v11 setStiffness:300.0 / (float)(v10 * v10)];
  [v11 durationForEpsilon:0.01];
  objc_msgSend(v11, "setDuration:");
  LODWORD(v12) = 1041865114;
  LODWORD(v13) = 0.5;
  LODWORD(v14) = 1.0;
  v15 = [MEMORY[0x263F15808] functionWithControlPoints:v12 :0.0 :v13 :v14];
  [v11 setTimingFunction:v15];

  uint64_t v16 = [v8 presentationLayer];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v8;
  }
  id v19 = v18;

  double v20 = [v19 valueForKeyPath:@"transform.scale.xy"];
  [v20 doubleValue];
  CGFloat v22 = v21;

  memset(&v36, 0, sizeof(v36));
  id v23 = [v19 valueForKeyPath:@"transform"];
  v24 = v23;
  if (v23) {
    [v23 CATransform3DValue];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }

  memset(&v35, 0, sizeof(v35));
  CATransform3DMakeScale(&v35, v22, v22, 1.0);
  memset(&v34, 0, sizeof(v34));
  CATransform3D a = v35;
  CATransform3DInvert(&b, &a);
  CATransform3D a = v36;
  CATransform3DConcat(&v34, &a, &b);
  if (v6)
  {
    [a1 _highlightScaleForLayoutStyle:a5];
    memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&a, v25, v25, 1.0);
    CATransform3D v30 = v34;
    CATransform3D v29 = a;
    CATransform3DConcat(&v31, &v30, &v29);
    CATransform3D v34 = v31;
  }
  CATransform3D a = v36;
  CGRect v26 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
  [v11 setFromValue:v26];

  CATransform3D a = v34;
  CGRect v27 = [MEMORY[0x263F08D40] valueWithCATransform3D:&a];
  [v11 setToValue:v27];

  [v8 addAnimation:v11 forKey:@"highlightScaleAnimation"];
  CATransform3D v28 = v34;
  [v8 setTransform:&v28];
}

+ (double)_highlightScaleForLayoutStyle:(int64_t)a3
{
  return dbl_234D60E40[a3 == 1];
}

+ (void)configurePowerSensitiveAnimation:(id)a3
{
  id v3 = a3;
  [v3 setFrameInterval:0.0166666667];
  [v3 setDiscretizesTime:1];
}

@end