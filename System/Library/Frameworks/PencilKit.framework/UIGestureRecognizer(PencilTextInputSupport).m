@interface UIGestureRecognizer(PencilTextInputSupport)
+ (uint64_t)PK_isPencilTextInputSystemGestureRecognizer:()PencilTextInputSupport;
@end

@implementation UIGestureRecognizer(PencilTextInputSupport)

+ (uint64_t)PK_isPencilTextInputSystemGestureRecognizer:()PencilTextInputSupport
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end