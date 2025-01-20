@interface PXTitleSubtitleUILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PXTitleSubtitleUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXTitleSubtitleUILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTitleSubtitleUILabel", @"titleText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXTitleSubtitleUILabel", @"subtitleText", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PXTitleSubtitleUILabelAccessibility *)self accessibilityIdentification];
  char v3 = [v2 isEqualToString:@"AXMemoryTileHeadingLabel"];

  return v3 ^ 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  char v3 = [(PXTitleSubtitleUILabelAccessibility *)self safeValueForKey:@"titleText"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [(PXTitleSubtitleUILabelAccessibility *)self safeValueForKey:@"subtitleText"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = __AXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabelAccessibility;
  return *MEMORY[0x263F1CEF8] | [(PXTitleSubtitleUILabelAccessibility *)&v3 accessibilityTraits];
}

@end