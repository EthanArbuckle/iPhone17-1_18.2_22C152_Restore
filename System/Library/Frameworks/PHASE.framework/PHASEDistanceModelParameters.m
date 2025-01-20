@interface PHASEDistanceModelParameters
+ (PHASEDistanceModelParameters)new;
- (PHASEDistanceModelFadeOutParameters)fadeOutParameters;
- (PHASEDistanceModelParameters)init;
- (id)initInternal;
- (void)setFadeOutParameters:(PHASEDistanceModelFadeOutParameters *)fadeOutParameters;
@end

@implementation PHASEDistanceModelParameters

- (PHASEDistanceModelParameters)init
{
  return 0;
}

+ (PHASEDistanceModelParameters)new
{
  return 0;
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)PHASEDistanceModelParameters;
  v2 = [(PHASEDistanceModelParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    fadeOutParameters = v2->_fadeOutParameters;
    v2->_fadeOutParameters = 0;
  }
  return v3;
}

- (PHASEDistanceModelFadeOutParameters)fadeOutParameters
{
  return self->_fadeOutParameters;
}

- (void)setFadeOutParameters:(PHASEDistanceModelFadeOutParameters *)fadeOutParameters
{
}

- (void).cxx_destruct
{
}

@end