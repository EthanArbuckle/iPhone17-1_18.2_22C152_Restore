@interface SSSSpringAnimationParameters
+ (id)scaleAnimationParameters;
+ (id)springAnimationParametersWithDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 speed:(double)a7 controlPointOne:(CGPoint)a8 controlPointTwo:(CGPoint)a9;
- (id)animationUsingParametersForKeyPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)timingParameters;
@end

@implementation SSSSpringAnimationParameters

+ (id)springAnimationParametersWithDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 speed:(double)a7 controlPointOne:(CGPoint)a8 controlPointTwo:(CGPoint)a9
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  v15 = (char *)objc_alloc_init((Class)objc_opt_class());
  [v15 setDuration:a3];
  *((double *)v15 + 5) = a4;
  *((double *)v15 + 6) = a5;
  *((double *)v15 + 7) = a6;
  *((double *)v15 + 8) = a7;
  *((CGFloat *)v15 + 9) = x;
  *((CGFloat *)v15 + 10) = y;
  *(CGPoint *)(v15 + 88) = a9;

  return v15;
}

- (id)animationUsingParametersForKeyPath:(id)a3
{
  v4 = +[CASpringAnimation animationWithKeyPath:a3];
  [v4 setMass:self->_mass];
  [v4 setStiffness:self->_stiffness];
  [v4 setDamping:self->_damping];
  double speed = self->_speed;
  *(float *)&double speed = speed;
  [v4 setSpeed:speed];
  double x = self->_controlPoint1.x;
  double y = self->_controlPoint1.y;
  double v8 = self->_controlPoint2.x;
  double v9 = self->_controlPoint2.y;
  id v10 = objc_alloc((Class)CAMediaTimingFunction);
  *(float *)&double v11 = x;
  *(float *)&double v12 = y;
  *(float *)&double v13 = v8;
  *(float *)&double v14 = v9;
  id v15 = [v10 initWithControlPoints:v11 :v12 :v13 :v14];
  [v4 setTimingFunction:v15];
  if ([(SSSAnimationParameters *)self animationReason])
  {
    CAFrameRateRange v18 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    [v4 setPreferredFrameRateRange:*(double *)&v18.minimum, *(double *)&v18.maximum, *(double *)&v18.preferred];
    [v4 setHighFrameRateReason:[self animationReason] | 0x160000u];
  }

  return v4;
}

- (id)timingParameters
{
  id v2 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:self->_mass stiffness:self->_stiffness damping:self->_damping initialVelocity:0.0, 0.0];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSSpringAnimationParameters;
  id result = [(SSSAnimationParameters *)&v5 copyWithZone:a3];
  *((void *)result + 5) = *(void *)&self->_mass;
  *((void *)result + 6) = *(void *)&self->_stiffness;
  *((void *)result + 7) = *(void *)&self->_damping;
  *((void *)result + 8) = *(void *)&self->_speed;
  *(CGPoint *)((char *)result + 72) = self->_controlPoint1;
  *(CGPoint *)((char *)result + 88) = self->_controlPoint2;
  return result;
}

+ (id)scaleAnimationParameters
{
  return [objc_opt_class() springAnimationParametersWithDuration:0.91 mass:2.0 stiffness:300.0 damping:400.0 speed:1.3 controlPointOne:0.0833330005 controlPointTwo:0.0 0x3FE2AAA3A0000000 0x3FEF5C28FFFFFFFDLL];
}

@end