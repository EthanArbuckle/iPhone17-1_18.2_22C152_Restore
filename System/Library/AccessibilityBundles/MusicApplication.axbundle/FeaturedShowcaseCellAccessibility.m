@interface FeaturedShowcaseCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FeaturedShowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FeaturedShowcaseCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedShowcaseCell", @"accessibilityDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedShowcaseCell", @"accessibilityHeadline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedShowcaseCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedShowcaseCell", @"accessibilitySubtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FeaturedShowcaseCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityHeadline, accessibilityTitle, accessibilitySubtitle, accessibilityDescription"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FeaturedShowcaseCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FeaturedShowcaseCellAccessibility *)&v3 accessibilityTraits];
}

@end