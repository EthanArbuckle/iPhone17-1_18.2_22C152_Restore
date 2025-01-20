@interface VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration
- (BOOL)isEqual:(id)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7.receiver = self;
      v7.super_class = (Class)VNCoreSceneUnderstandingDetectorImageSaliencyAConfiguration;
      BOOL v5 = [(VNCoreSceneUnderstandingDetectorFeatureConfiguration *)&v7 isEqual:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

@end