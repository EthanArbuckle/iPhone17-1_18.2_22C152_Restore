@interface _SFFormAutoFillControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)fieldWillFocusWithInputSession:(id)a3;
@end

@implementation _SFFormAutoFillControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SFFormAutoFillController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFFormAutoFillController", @"fieldWillFocusWithInputSession:", "v", "@", 0);
  [v3 validateClass:@"_SFFormAutoFillController" hasInstanceVariable:@"_autoFillInputView" withType:"_SFAutoFillInputView"];
}

- (void)fieldWillFocusWithInputSession:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SFFormAutoFillControllerAccessibility;
  [(_SFFormAutoFillControllerAccessibility *)&v3 fieldWillFocusWithInputSession:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

@end