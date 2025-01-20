@interface VNCoreSceneUnderstandingDetectorSceneprintConfiguration
- (BOOL)isEqual:(id)a3;
@end

@implementation VNCoreSceneUnderstandingDetectorSceneprintConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (VNCoreSceneUnderstandingDetectorSceneprintConfiguration *)a3;
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
      v7.super_class = (Class)VNCoreSceneUnderstandingDetectorSceneprintConfiguration;
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