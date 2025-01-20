@interface PHASEDistanceModelFadeOutParameters
+ (PHASEDistanceModelFadeOutParameters)new;
- (PHASEDistanceModelFadeOutParameters)init;
- (PHASEDistanceModelFadeOutParameters)initWithCullDistance:(double)cullDistance;
- (double)cullDistance;
- (double)maximumDistance;
- (void)setMaximumDistance:(double)a3;
@end

@implementation PHASEDistanceModelFadeOutParameters

- (double)maximumDistance
{
  return self->_cullDistance;
}

- (void)setMaximumDistance:(double)a3
{
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = NSStringFromSelector(a2);
  self->_cullDistance = PHASEGetPropertyBounded<double>(v8, v7, a3, 1.0, 1.79769313e308);
}

- (PHASEDistanceModelFadeOutParameters)init
{
  return 0;
}

+ (PHASEDistanceModelFadeOutParameters)new
{
  return 0;
}

- (PHASEDistanceModelFadeOutParameters)initWithCullDistance:(double)cullDistance
{
  v10.receiver = self;
  v10.super_class = (Class)PHASEDistanceModelFadeOutParameters;
  v5 = [(PHASEDistanceModelFadeOutParameters *)&v10 init];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    v5->_cullDistance = PHASEGetPropertyBounded<double>(v7, v8, cullDistance, 1.0, 1.79769313e308);
  }
  return v5;
}

- (double)cullDistance
{
  return self->_cullDistance;
}

@end