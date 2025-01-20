@interface WFCombineTextSeparatorResolutionResult
+ (id)confirmationRequiredWithCombineTextSeparatorToConfirm:(int64_t)a3;
+ (id)successWithResolvedCombineTextSeparator:(int64_t)a3;
@end

@implementation WFCombineTextSeparatorResolutionResult

+ (id)confirmationRequiredWithCombineTextSeparatorToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFCombineTextSeparatorResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_confirmationRequiredWithValueToConfirm_, a3);
  return v3;
}

+ (id)successWithResolvedCombineTextSeparator:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFCombineTextSeparatorResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_successWithResolvedValue_, a3);
  return v3;
}

@end