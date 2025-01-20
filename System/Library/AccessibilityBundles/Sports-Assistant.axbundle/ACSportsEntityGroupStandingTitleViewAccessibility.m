@interface ACSportsEntityGroupStandingTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ACSportsEntityGroupStandingTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsEntityGroupStandingTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  v2 = [(ACSportsEntityGroupStandingTitleViewAccessibility *)self safeValueForKey:@"_nameLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end