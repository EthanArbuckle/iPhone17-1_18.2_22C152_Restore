@interface WFMatchTextGetGroupTypeResolutionResult
+ (id)confirmationRequiredWithMatchTextGetGroupTypeToConfirm:(int64_t)a3;
+ (id)successWithResolvedMatchTextGetGroupType:(int64_t)a3;
@end

@implementation WFMatchTextGetGroupTypeResolutionResult

+ (id)confirmationRequiredWithMatchTextGetGroupTypeToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFMatchTextGetGroupTypeResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithValueToConfirm_, a3);
  return v3;
}

+ (id)successWithResolvedMatchTextGetGroupType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFMatchTextGetGroupTypeResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedValue_, a3);
  return v3;
}

@end