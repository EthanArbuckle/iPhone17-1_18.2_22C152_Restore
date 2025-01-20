@interface _TVInfoHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _TVInfoHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVInfoHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"_TVInfoHeaderView", @"infoHeaderViewWithElement:existingView:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVInfoHeaderView", @"headerView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  v2 = [(_TVInfoHeaderViewAccessibility *)self safeValueForKey:@"headerView"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)_TVInfoHeaderViewAccessibility;
  [(_TVInfoHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_TVInfoHeaderViewAccessibility *)self safeValueForKey:@"headerView"];
  [v3 setIsAccessibilityElement:0];
}

+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____TVInfoHeaderViewAccessibility;
  objc_super v4 = objc_msgSendSuper2(&v6, sel_infoHeaderViewWithElement_existingView_, a3, a4);
  [v4 _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end