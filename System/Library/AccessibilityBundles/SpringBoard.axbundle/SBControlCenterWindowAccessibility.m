@interface SBControlCenterWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIgnoresStatusBarFrame;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
@end

@implementation SBControlCenterWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBControlCenterWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBControlCenterController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBControlCenterController", @"sharedInstanceIfExists", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBControlCenterController", @"handleMenuButtonTap", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoardAccessibility", @"_accessibilityIsShowingLongLookNotification", "B", 0);
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [NSClassFromString(&cfstr_Sbcontrolcente.isa) safeValueForKey:@"sharedInstanceIfExists"];
  char v3 = [v2 safeBoolForKey:@"handleMenuButtonTap"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);

  return v3;
}

- (BOOL)accessibilityElementsHidden
{
  v2 = [MEMORY[0x263F22968] server];
  if ([v2 isControlCenterVisible]) {
    char v3 = [(id)*MEMORY[0x263F1D020] safeBoolForKey:@"_accessibilityIsShowingLongLookNotification"];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isControlCenterVisible];

  return v3;
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

@end