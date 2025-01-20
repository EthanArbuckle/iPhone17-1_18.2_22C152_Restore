@interface PKLinkedAppViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axGetAppView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation PKLinkedAppViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKLinkedAppView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKLinkedApplication"];
  [v3 validateClass:@"ASCLockupContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCLockupContentView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCLockupContentView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASCLockupContentView", @"offerButton", "@", 0);
  [v3 validateClass:@"PKContinuousButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedAppView", @"linkedAppView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedAppContentView", @"linkedApplication", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKLinkedApplication", @"isInstalled", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axGetAppView
{
  return (id)[(PKLinkedAppViewAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_3];
}

uint64_t __45__PKLinkedAppViewAccessibility__axGetAppView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Asclockupconte.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v2 = [(PKLinkedAppViewAccessibility *)self _axGetAppView];
  id v3 = [v2 safeValueForKey:@"titleLabel"];
  v6 = [v2 safeValueForKey:@"subtitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v2 = [(PKLinkedAppViewAccessibility *)self _axGetAppView];
  id v3 = [v2 safeValueForKey:@"offerButton"];

  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)accessibilityHint
{
  id v2 = [(PKLinkedAppViewAccessibility *)self safeValueForKey:@"linkedAppView"];
  id v3 = [v2 safeValueForKey:@"linkedApplication"];
  v4 = __UIAccessibilitySafeClass();

  if ([v4 safeBoolForKey:@"isInstalled"]) {
    v5 = @"passbook.app.hint.open";
  }
  else {
    v5 = @"passbook.app.hint.view";
  }
  v6 = accessibilityLocalizedString(v5);

  return v6;
}

- (CGPoint)accessibilityActivationPoint
{
  id v2 = [(PKLinkedAppViewAccessibility *)self _axGetAppView];
  id v3 = [v2 safeValueForKey:@"offerButton"];
  [v3 accessibilityActivationPoint];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

@end