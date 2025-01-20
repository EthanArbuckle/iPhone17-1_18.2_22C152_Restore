@interface CKBrowserFullscreenCubicSpringTimingParameters
- (UICubicTimingParameters)springCubicTimingParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSpringCubicTimingParameters:(id)a3;
@end

@implementation CKBrowserFullscreenCubicSpringTimingParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserFullscreenCubicSpringTimingParameters;
  id v4 = [(CKBrowserFullscreenCubicSpringTimingParameters *)&v7 copyWithZone:a3];
  v5 = [(CKBrowserFullscreenCubicSpringTimingParameters *)self springCubicTimingParameters];
  [v4 setSpringCubicTimingParameters:v5];

  return v4;
}

- (UICubicTimingParameters)springCubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (void)setSpringCubicTimingParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end