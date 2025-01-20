@interface UICubicTimingParameters(AppleServices)
+ (id)jet_appleServicesLoadingParameters;
@end

@implementation UICubicTimingParameters(AppleServices)

+ (id)jet_appleServicesLoadingParameters
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.33, 0.0, 0.83, 0.83);

  return v0;
}

@end