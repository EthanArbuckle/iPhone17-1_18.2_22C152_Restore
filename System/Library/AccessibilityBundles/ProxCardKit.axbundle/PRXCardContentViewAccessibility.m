@interface PRXCardContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation PRXCardContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRXCardContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardContentView", @"dismissButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PRXCardContentView", @"titleView", "@", 0);
  [v3 validateClass:@"PRXCardContentView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PRXCardContentViewAccessibility;
  [(PRXCardContentViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(PRXCardContentViewAccessibility *)self safeUIViewForKey:@"titleView"];
  [v3 _accessibilitySetSortPriority:20];

  v4 = [(PRXCardContentViewAccessibility *)self safeUIViewForKey:@"dismissButton"];
  [v4 _accessibilitySetSortPriority:10];

  v5 = accessibilityLocalizedString(@"close.button");
  v6 = [(PRXCardContentViewAccessibility *)self safeUIViewForKey:@"dismissButton"];
  [v6 setAccessibilityLabel:v5];

  uint64_t v7 = *MEMORY[0x263F1CEF8];
  v8 = [(PRXCardContentViewAccessibility *)self safeUIViewForKey:@"titleView"];
  [v8 setAccessibilityTraits:v7];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewAccessibility;
  [(PRXCardContentViewAccessibility *)&v3 layoutSubviews];
  [(PRXCardContentViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end