@interface CAMControlDrawerMenuButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5;
@end

@implementation CAMControlDrawerMenuButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMControlDrawerMenuButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CAMControlDrawerMenuButton" isKindOfClass:@"UIControl"];
  [v3 validateProtocol:@"CAMControlDrawerExpandableButton" hasMethod:@"isExpanded" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"CAMControlDrawerMenuButton" conformsToProtocol:@"CAMControlDrawerExpandableButton"];
  [v3 validateClass:@"CAMControlDrawerMenuButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_setExpanded:animated:shouldNotify:", "v", "B", "B", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return [(CAMControlDrawerMenuButtonAccessibility *)self safeBoolForKey:@"isExpanded"] ^ 1;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  v2 = [(CAMControlDrawerMenuButtonAccessibility *)self safeValueForKey:@"isUserInteractionEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButtonAccessibility;
  unsigned int v3 = [(CAMControlDrawerMenuButtonAccessibility *)&v5 canBecomeFocused];
  if ([(CAMControlDrawerMenuButtonAccessibility *)self _accessibilityIsFKARunningForFocusItem])v3 &= ~[(CAMControlDrawerMenuButtonAccessibility *)self safeBoolForKey:@"isExpanded"]; {
  return v3;
  }
}

- (void)_setExpanded:(BOOL)a3 animated:(BOOL)a4 shouldNotify:(BOOL)a5
{
  v5.receiver = self;
  v5.super_class = (Class)CAMControlDrawerMenuButtonAccessibility;
  [(CAMControlDrawerMenuButtonAccessibility *)&v5 _setExpanded:a3 animated:a4 shouldNotify:a5];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
}

@end