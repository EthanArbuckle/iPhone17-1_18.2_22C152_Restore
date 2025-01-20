@interface AXLeftRightBalanceOperationResolutionResult
+ (id)confirmationRequiredWithLeftRightBalanceOperationToConfirm:(int64_t)a3;
+ (id)successWithResolvedLeftRightBalanceOperation:(int64_t)a3;
@end

@implementation AXLeftRightBalanceOperationResolutionResult

+ (id)successWithResolvedLeftRightBalanceOperation:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AXLeftRightBalanceOperationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedValue:", a3);

  return v3;
}

+ (id)confirmationRequiredWithLeftRightBalanceOperationToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AXLeftRightBalanceOperationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithValueToConfirm:", a3);

  return v3;
}

@end