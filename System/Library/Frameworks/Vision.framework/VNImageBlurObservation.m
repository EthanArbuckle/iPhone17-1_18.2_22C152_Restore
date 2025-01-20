@interface VNImageBlurObservation
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (float)blurMeasure;
@end

@implementation VNImageBlurObservation

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNImageBlurScoreRequest";
}

- (float)blurMeasure
{
  v2 = [(VNImageScoreObservation *)self blurScore];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

@end