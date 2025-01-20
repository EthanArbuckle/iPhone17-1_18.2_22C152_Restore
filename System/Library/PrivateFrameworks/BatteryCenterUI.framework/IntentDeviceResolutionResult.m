@interface IntentDeviceResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithIntentDeviceToConfirm:(id)a3;
+ (id)disambiguationWithIntentDevicesToDisambiguate:(id)a3;
+ (id)successWithResolvedIntentDevice:(id)a3;
@end

@implementation IntentDeviceResolutionResult

+ (id)successWithResolvedIntentDevice:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___IntentDeviceResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedObject_, a3);

  return v3;
}

+ (id)disambiguationWithIntentDevicesToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___IntentDeviceResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, a3);

  return v3;
}

+ (id)confirmationRequiredWithIntentDeviceToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___IntentDeviceResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithObjectToConfirm_, a3);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end