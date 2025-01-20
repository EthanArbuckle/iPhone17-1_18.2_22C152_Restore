@interface VNImageBrightnessObservation
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (float)brightness;
@end

@implementation VNImageBrightnessObservation

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNImageExposureScoreRequest";
}

- (float)brightness
{
  v2 = [(VNImageScoreObservation *)self exposureScore];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

@end