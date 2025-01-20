@interface BWPersonSegmentationConfiguration
+ ($2ACC23B9A21F50F5CC728381CA870116)portraitVersion;
+ (BOOL)isPortraitPrewarmingRequired;
@end

@implementation BWPersonSegmentationConfiguration

+ ($2ACC23B9A21F50F5CC728381CA870116)portraitVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)BWInferenceVersionMake(1u, 0, 0);
}

+ (BOOL)isPortraitPrewarmingRequired
{
  return !+[BWInferenceEngine isNeuralEngineSupported];
}

@end