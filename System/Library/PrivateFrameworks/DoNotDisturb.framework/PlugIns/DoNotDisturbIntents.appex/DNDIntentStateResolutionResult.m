@interface DNDIntentStateResolutionResult
+ (id)confirmationRequiredWithIntentStateToConfirm:(int64_t)a3;
+ (id)successWithResolvedIntentState:(int64_t)a3;
@end

@implementation DNDIntentStateResolutionResult

+ (id)successWithResolvedIntentState:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DNDIntentStateResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedValue:", a3);
  return v3;
}

+ (id)confirmationRequiredWithIntentStateToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___DNDIntentStateResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithValueToConfirm:", a3);
  return v3;
}

@end