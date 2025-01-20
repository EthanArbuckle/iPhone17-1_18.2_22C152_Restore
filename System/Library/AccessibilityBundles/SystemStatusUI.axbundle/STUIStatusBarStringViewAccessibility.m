@interface STUIStatusBarStringViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIsNonDismissableStatusBarElement;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STUIStatusBarStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarStringView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarStringView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"canBecomeFocused", "B", 0);
}

- (id)accessibilityLabel
{
  char v18 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = (void *)MEMORY[0x263F21660];
  v5 = [v3 text];
  v6 = [v4 axAttributedStringWithString:v5];

  char v7 = [(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsTime"];
  v8 = (void *)MEMORY[0x263EFFB40];
  if ((v7 & 1) != 0
    || [(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])
  {
    v9 = (void *)MEMORY[0x263F21660];
    v10 = [MEMORY[0x263EFF910] date];
    v11 = AXDateStringForFormat();
    v12 = [v9 axAttributedStringWithString:v11];

    [v12 setAttribute:*v8 forKey:*MEMORY[0x263F21708]];
    v6 = v12;
  }
  if (-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", @"AccessibilityStatusBarStringIsDate"))[v6 setAttribute:*v8 forKey:*MEMORY[0x263F21718]]; {
  if ([(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsBreadcrumb"])
  }
  {
    v17.receiver = self;
    v17.super_class = (Class)STUIStatusBarStringViewAccessibility;
    id v13 = [(STUIStatusBarStringViewAccessibility *)&v17 accessibilityLabel];
LABEL_11:
    v14 = v13;
    goto LABEL_12;
  }
  if (![(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsDataNetwork"]|| (v16.receiver = self, v16.super_class = (Class)STUIStatusBarStringViewAccessibility, [(STUIStatusBarStringViewAccessibility *)&v16 accessibilityLabel], (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v13 = v6;
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringViewAccessibility;
  unint64_t v3 = *MEMORY[0x263F813F0] | [(STUIStatusBarStringViewAccessibility *)&v5 accessibilityTraits] | *MEMORY[0x263F81368];
  if (([(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsTime"] & 1) != 0|| [(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])
  {
    v3 |= *MEMORY[0x263F1CF68];
  }
  return v3;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  if ([(STUIStatusBarStringViewAccessibility *)self _accessibilityBoolValueForKey:@"AccessibilityStatusBarStringIsPillTime"])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)STUIStatusBarStringViewAccessibility;
  return [(STUIStatusBarStringViewAccessibility *)&v4 isAccessibilityElement];
}

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarStringViewAccessibility;
  BOOL v3 = [(STUIStatusBarStringViewAccessibility *)&v8 canBecomeFocused];
  objc_super v4 = __UIAccessibilitySafeClass();
  objc_super v5 = [v4 traitCollection];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((unint64_t)(v6 - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
    return [(STUIStatusBarStringViewAccessibility *)self accessibilityRespondsToUserInteraction];
  }
  return v3;
}

@end