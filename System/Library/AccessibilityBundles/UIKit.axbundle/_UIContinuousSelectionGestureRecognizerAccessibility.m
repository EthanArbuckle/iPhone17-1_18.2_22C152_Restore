@interface _UIContinuousSelectionGestureRecognizerAccessibility
+ (BOOL)_supportsTouchContinuation;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation _UIContinuousSelectionGestureRecognizerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContinuousSelectionGestureRecognizer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"UIGestureRecognizer";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIContinuousSelectionGestureRecognizer");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"UIGestureRecognizer", @"_supportsTouchContinuation", "B", 0);
  objc_storeStrong(v5, obj);
}

+ (BOOL)_supportsTouchContinuation
{
  id v5 = a1;
  SEL v4 = a2;
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 0;
  }
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_METACLASS____UIContinuousSelectionGestureRecognizerAccessibility;
  return objc_msgSendSuper2(&v3, sel__supportsTouchContinuation) & 1;
}

@end