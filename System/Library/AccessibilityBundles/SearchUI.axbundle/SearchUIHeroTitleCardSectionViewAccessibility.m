@interface SearchUIHeroTitleCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUIHeroTitleCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIHeroTitleCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroTitleCardSectionView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SearchUIHeroTitleCardSectionView", @"subtitleLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SearchUIHeroTitleCardSectionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v6 = [(SearchUIHeroTitleCardSectionViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v4 = __UIAXStringForVariables();

  return v4;
}

@end