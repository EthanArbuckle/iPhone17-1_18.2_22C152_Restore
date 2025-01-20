@interface MusicInterstellarContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation MusicInterstellarContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicInterstellarContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicInterstellarContentView", @"pill", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicInterstellarContentView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicInterstellarContentView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicInterstellarContentView", @"badgeView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MusicInterstellarContentViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(MusicInterstellarContentViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [(MusicInterstellarContentViewAccessibility *)self safeUIViewForKey:@"badgeView"];
  v8 = [v4 accessibilityLabel];
  v9 = [v6 accessibilityLabel];
  v12 = [v7 accessibilityLabel];
  v10 = __AXStringForVariables();

  return v10;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)_accessibilitySupplementaryFooterViews
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(MusicInterstellarContentViewAccessibility *)self safeUIViewForKey:@"pill"];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end