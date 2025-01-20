@interface WFTextMatchResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithTextMatchToConfirm:(id)a3;
+ (id)disambiguationWithTextMatchsToDisambiguate:(id)a3;
+ (id)successWithResolvedTextMatch:(id)a3;
@end

@implementation WFTextMatchResolutionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)confirmationRequiredWithTextMatchToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFTextMatchResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithObjectToConfirm_, a3);
  return v3;
}

+ (id)disambiguationWithTextMatchsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFTextMatchResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, a3);
  return v3;
}

+ (id)successWithResolvedTextMatch:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFTextMatchResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedObject_, a3);
  return v3;
}

@end