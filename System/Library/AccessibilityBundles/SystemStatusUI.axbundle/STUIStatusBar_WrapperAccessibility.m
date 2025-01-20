@interface STUIStatusBar_WrapperAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityViewIsVisible;
- (int64_t)_accessibilitySortPriority;
@end

@implementation STUIStatusBar_WrapperAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBar_Wrapper";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBar" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar_Wrapper", @"statusBar", "@", 0);
}

- (BOOL)_accessibilityViewIsVisible
{
  v2 = [(STUIStatusBar_WrapperAccessibility *)self safeUIViewForKey:@"statusBar"];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  if (!AXProcessIsSpringBoard() || !AXDeviceHasJindo() || AXRequestingClient() != 3) {
    return 0x7FFFFFFFLL;
  }
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBar_WrapperAccessibility;
  return [(STUIStatusBar_WrapperAccessibility *)&v4 _accessibilitySortPriority];
}

@end