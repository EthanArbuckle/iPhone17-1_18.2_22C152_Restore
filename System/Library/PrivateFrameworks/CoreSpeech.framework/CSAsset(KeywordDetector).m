@interface CSAsset(KeywordDetector)
- (float)keywordDetectorThreshold;
- (float)keywordDetectorWaitTimeSinceVT;
- (id)keywordDetectorConfigPathRecognizer;
@end

@implementation CSAsset(KeywordDetector)

- (float)keywordDetectorWaitTimeSinceVT
{
  v1 = [a1 getNumberForKey:@"waitTimeSinceVT" category:@"keywordDetector" default:&unk_1F23C53A8];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

- (id)keywordDetectorConfigPathRecognizer
{
  float v2 = [a1 resourcePath];
  float v3 = [a1 getStringForKey:@"configFileRecognizer" category:@"keywordDetector" default:@"keyword_detector.json"];
  v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

- (float)keywordDetectorThreshold
{
  v1 = [a1 getNumberForKey:@"threshold" category:@"keywordDetector" default:&unk_1F23C5398];
  [v1 floatValue];
  float v3 = v2;

  return v3;
}

@end