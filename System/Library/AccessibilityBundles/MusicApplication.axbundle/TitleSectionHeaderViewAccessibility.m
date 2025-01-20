@interface TitleSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TitleSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.TitleSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TitleSectionHeaderView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TitleSectionHeaderView", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TitleSectionHeaderView", @"accessibilitySystemStyleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.TitleSectionHeaderView", @"accessibilityAdditionalContentView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TitleSectionHeaderViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TitleSectionHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(TitleSectionHeaderViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(TitleSectionHeaderViewAccessibility *)self safeValueForKey:@"title"];
  v6 = [(TitleSectionHeaderViewAccessibility *)self safeValueForKey:@"subtitle"];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(TitleSectionHeaderViewAccessibility *)self safeValueForKey:@"accessibilitySystemStyleButton"];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [(TitleSectionHeaderViewAccessibility *)self safeValueForKey:@"accessibilityAdditionalContentView"];
  if (v5) {
    [v3 addObject:v5];
  }

  return v3;
}

@end