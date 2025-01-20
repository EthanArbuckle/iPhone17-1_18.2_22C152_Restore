@interface SearchUIButtonCardSectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SearchUIButtonCardSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SearchUIButtonCardSectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKButtonView"];
  [v3 validateClass:@"SearchUIButtonCardSectionView" hasProperty:@"contentView" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKButtonView", @"title", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(SearchUIButtonCardSectionViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = [v2 safeStringForKey:@"title"];

  return v3;
}

@end