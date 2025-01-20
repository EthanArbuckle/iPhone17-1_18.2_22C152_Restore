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
  return @"NowPlayingUI.TitleSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.TitleSectionHeaderView", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.TitleSectionHeaderView", @"accessibilitySystemStyleButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.TitleSectionHeaderView", @"accessibilityAdditionalContentView", "@", 0);
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
  return (id)[(TitleSectionHeaderViewAccessibility *)self safeValueForKey:@"accessibilityTitle"];
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