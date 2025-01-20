@interface AXSoundDetectionOperationResolutionResult
+ (id)confirmationRequiredWithSoundDetectionOperationToConfirm:(int64_t)a3;
+ (id)successWithResolvedSoundDetectionOperation:(int64_t)a3;
@end

@implementation AXSoundDetectionOperationResolutionResult

+ (id)successWithResolvedSoundDetectionOperation:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AXSoundDetectionOperationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "successWithResolvedValue:", a3);

  return v3;
}

+ (id)confirmationRequiredWithSoundDetectionOperationToConfirm:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AXSoundDetectionOperationResolutionResult;
  v3 = objc_msgSendSuper2(&v5, "confirmationRequiredWithValueToConfirm:", a3);

  return v3;
}

@end