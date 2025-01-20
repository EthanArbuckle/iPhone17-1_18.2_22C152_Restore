@interface SRGuideDetailSectionHeaderCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SRGuideDetailSectionHeaderCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRGuideDetailSectionHeaderCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SRGuideDetailSectionHeaderCollectionViewCell" hasInstanceVariable:@"_textContainerView" withType:"SiriUITextContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUITextContainerView", @"text", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(SRGuideDetailSectionHeaderCollectionViewCellAccessibility *)self safeValueForKey:@"_textContainerView"];
  v4 = [v3 safeValueForKey:@"text"];
  v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

@end