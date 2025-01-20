@interface DOCIntentLocationResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithDOCIntentLocationToConfirm:(id)a3;
+ (id)disambiguationWithDOCIntentLocationsToDisambiguate:(id)a3;
+ (id)successWithResolvedDOCIntentLocation:(id)a3;
@end

@implementation DOCIntentLocationResolutionResult

+ (id)successWithResolvedDOCIntentLocation:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DOCIntentLocationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedObject_, a3);
  return v3;
}

+ (id)disambiguationWithDOCIntentLocationsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DOCIntentLocationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, a3);
  return v3;
}

+ (id)confirmationRequiredWithDOCIntentLocationToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DOCIntentLocationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithObjectToConfirm_, a3);
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end