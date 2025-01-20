@interface MPCubicSpringTimingParameters
+ (id)standardTimingParameters;
- (UICubicTimingParameters)springCubicTimingParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cubicTimingParameters;
- (void)setSpringCubicTimingParameters:(id)a3;
@end

@implementation MPCubicSpringTimingParameters

- (void).cxx_destruct
{
}

- (void)setSpringCubicTimingParameters:(id)a3
{
}

- (UICubicTimingParameters)springCubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (id)cubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPCubicSpringTimingParameters;
  id v4 = [(MPCubicSpringTimingParameters *)&v7 copyWithZone:a3];
  v5 = [(MPCubicSpringTimingParameters *)self springCubicTimingParameters];
  [v4 setSpringCubicTimingParameters:v5];

  return v4;
}

+ (id)standardTimingParameters
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  id v4 = objc_msgSend(objc_alloc((Class)a1), "initWithMass:stiffness:damping:initialVelocity:", 3.0, 500.0, 1000.0, 0.0, 0.0);
  [v4 setSpringCubicTimingParameters:v3];

  return v4;
}

@end