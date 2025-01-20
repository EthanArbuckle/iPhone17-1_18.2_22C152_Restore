@interface WFAskForInputResultResolutionResult
+ (BOOL)supportsSecureCoding;
+ (id)confirmationRequiredWithAskForInputResultToConfirm:(id)a3;
+ (id)disambiguationWithAskForInputResultsToDisambiguate:(id)a3;
+ (id)successWithResolvedAskForInputResult:(id)a3;
@end

@implementation WFAskForInputResultResolutionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)confirmationRequiredWithAskForInputResultToConfirm:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFAskForInputResultResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithObjectToConfirm_, a3);
  return v3;
}

+ (id)disambiguationWithAskForInputResultsToDisambiguate:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFAskForInputResultResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, a3);
  return v3;
}

+ (id)successWithResolvedAskForInputResult:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFAskForInputResultResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedObject_, a3);
  return v3;
}

@end