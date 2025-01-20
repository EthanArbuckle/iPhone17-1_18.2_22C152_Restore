@interface AccountPSOutgoingDetailControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)processValidationResult:(int64_t)a3;
@end

@implementation AccountPSOutgoingDetailControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AccountPSOutgoingDetailController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AccountPSOutgoingDetailController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AccountPSOutgoingDetailController", @"processValidationResult:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"navigationItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UINavigationItem", @"prompt", "@", 0);
}

- (void)processValidationResult:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AccountPSOutgoingDetailControllerAccessibility;
  -[AccountPSOutgoingDetailControllerAccessibility processValidationResult:](&v7, sel_processValidationResult_);
  if (!a3)
  {
    v5 = [(AccountPSOutgoingDetailControllerAccessibility *)self safeValueForKey:@"navigationItem"];
    v6 = [v5 safeValueForKey:@"prompt"];

    if (v6) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v6);
    }
  }
}

@end