@interface HUGridSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (HUGridSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation HUGridSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUGridSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridSectionHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUGridSectionHeaderView", @"chevronView", "@", 0);
  [v3 validateClass:@"HUGridSectionHeaderView" isKindOfClass:@"UICollectionViewListCell"];
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)HUGridSectionHeaderViewAccessibility;
  unint64_t v3 = [(HUGridSectionHeaderViewAccessibility *)&v10 accessibilityTraits];
  v4 = [(HUGridSectionHeaderViewAccessibility *)self safeValueForKey:@"chevronView"];
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  unint64_t v6 = *MEMORY[0x263F1CEF8] | v3;
  LODWORD(v3) = [v5 isHidden];

  uint64_t v7 = *MEMORY[0x263F1CEE8];
  if (v3) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v6 | v7;

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (HUGridSectionHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUGridSectionHeaderViewAccessibility;
  unint64_t v3 = -[HUGridSectionHeaderViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HUGridSectionHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end