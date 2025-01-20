@interface BWRGBPersonSegmentationInferenceConfiguration
+ ($2ACC23B9A21F50F5CC728381CA870116)portraitVersion;
+ (BOOL)isPortraitPrewarmingRequired;
@end

@implementation BWRGBPersonSegmentationInferenceConfiguration

+ ($2ACC23B9A21F50F5CC728381CA870116)portraitVersion
{
  int v2 = +[BWInferenceEngine isNeuralEngineSupported];
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(1u, v2, 0);
}

+ (BOOL)isPortraitPrewarmingRequired
{
  return ([a1 portraitVersion] & 0xFFFFFFFFFFFFLL) == 1;
}

@end