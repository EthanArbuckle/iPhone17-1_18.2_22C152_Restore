@interface OBHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axNavigationControllerParent;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4;
- (void)setDetailText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation OBHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"OBHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"headerLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"detailLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"extendedInitWithTitle:detailText:", "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"OBHeaderView", @"setTitle:", "v", "@", 0);
}

- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)OBHeaderViewAccessibility;
  [(OBHeaderViewAccessibility *)&v5 extendedInitWithTitle:a3 detailText:a4];
  [(OBHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)OBHeaderViewAccessibility;
  [(OBHeaderViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CF48] | *MEMORY[0x263F1CEF8];
  v4 = [(OBHeaderViewAccessibility *)self safeUIViewForKey:@"headerLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  char v14 = 0;
  objc_opt_class();
  objc_super v5 = [(OBHeaderViewAccessibility *)self safeValueForKey:@"headerLabel"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 text];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = (void *)v7;
  v9 = [v6 text];
  if ([v9 isEqualToString:v4])
  {

LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)OBHeaderViewAccessibility;
    [(OBHeaderViewAccessibility *)&v13 setTitle:v4];
    goto LABEL_5;
  }
  uint64_t v10 = [v4 length];

  v13.receiver = self;
  v13.super_class = (Class)OBHeaderViewAccessibility;
  [(OBHeaderViewAccessibility *)&v13 setTitle:v4];
  if (v10)
  {
    v11 = [(OBHeaderViewAccessibility *)self _axNavigationControllerParent];
    if ([v11 _isTransitioning])
    {
    }
    else
    {
      v12 = [v6 window];

      if (v12) {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
      }
    }
  }
LABEL_5:
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  char v14 = 0;
  objc_opt_class();
  objc_super v5 = [(OBHeaderViewAccessibility *)self safeValueForKey:@"detailLabel"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 text];
  if (!v7) {
    goto LABEL_4;
  }
  v8 = (void *)v7;
  v9 = [v6 text];
  if ([v9 isEqualToString:v4])
  {

LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)OBHeaderViewAccessibility;
    [(OBHeaderViewAccessibility *)&v13 setDetailText:v4];
    goto LABEL_5;
  }
  uint64_t v10 = [v4 length];

  v13.receiver = self;
  v13.super_class = (Class)OBHeaderViewAccessibility;
  [(OBHeaderViewAccessibility *)&v13 setDetailText:v4];
  if (v10)
  {
    v11 = [(OBHeaderViewAccessibility *)self _axNavigationControllerParent];
    if ([v11 _isTransitioning])
    {
    }
    else
    {
      v12 = [v6 window];

      if (v12) {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
      }
    }
  }
LABEL_5:
}

- (id)_axNavigationControllerParent
{
  v2 = [(OBHeaderViewAccessibility *)self _accessibilityFindViewAncestor:&__block_literal_global_0 startWithSelf:0];
  uint64_t v3 = [v2 _accessibilityViewController];
  id v4 = [v3 navigationController];

  return v4;
}

BOOL __58__OBHeaderViewAccessibility__axNavigationControllerParent__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  uint64_t v3 = [v2 navigationController];
  BOOL v4 = v3 != 0;

  return v4;
}

@end