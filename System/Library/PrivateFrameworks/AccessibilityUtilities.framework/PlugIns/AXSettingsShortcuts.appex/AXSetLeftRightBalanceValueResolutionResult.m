@interface AXSetLeftRightBalanceValueResolutionResult
+ (id)unsupportedForReason:(int64_t)a3;
@end

@implementation AXSetLeftRightBalanceValueResolutionResult

+ (id)unsupportedForReason:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AXSetLeftRightBalanceValueResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "unsupportedWithReason:", a3);

  return v3;
}

@end