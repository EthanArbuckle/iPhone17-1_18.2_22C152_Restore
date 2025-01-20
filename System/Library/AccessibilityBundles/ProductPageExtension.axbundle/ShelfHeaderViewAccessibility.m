@interface ShelfHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ShelfHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ProductPageExtension.ShelfHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ProductPageExtension.ShelfHeaderView" hasSwiftField:@"eyebrowButton" withSwiftType:"DynamicTypeButton"];
  [v3 validateClass:@"ProductPageExtension.ShelfHeaderView" hasSwiftField:@"titleButton" withSwiftType:"DynamicTypeButton"];
  [v3 validateClass:@"ProductPageExtension.ShelfHeaderView" hasSwiftField:@"subtitleLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"ProductPageExtension.ShelfHeaderView" hasSwiftField:@"accessoryButton" withSwiftType:"DynamicTypeButton"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  char v12 = 0;
  objc_opt_class();
  id v3 = [(ShelfHeaderViewAccessibility *)self safeSwiftValueForKey:@"titleButton"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 currentAttributedTitle];
  if (objc_msgSend(v5, "containsAttachmentsInRange:", 0, objc_msgSend(v5, "length")))
  {
    v11.receiver = self;
    v11.super_class = (Class)ShelfHeaderViewAccessibility;
    unint64_t v6 = *MEMORY[0x263F1CEF8] | [(ShelfHeaderViewAccessibility *)&v11 accessibilityTraits];
    unint64_t v7 = *MEMORY[0x263F1CEE8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ShelfHeaderViewAccessibility;
    unint64_t v7 = [(ShelfHeaderViewAccessibility *)&v10 accessibilityTraits];
    unint64_t v6 = *MEMORY[0x263F1CEF8];
  }
  unint64_t v8 = v6 | v7;

  return v8;
}

- (id)accessibilityLabel
{
  id v3 = [(ShelfHeaderViewAccessibility *)self safeSwiftValueForKey:@"eyebrowButton"];
  v4 = [(ShelfHeaderViewAccessibility *)self safeSwiftValueForKey:@"subtitleLabel"];
  objc_opt_class();
  v5 = [(ShelfHeaderViewAccessibility *)self safeSwiftValueForKey:@"titleButton"];
  unint64_t v6 = __UIAccessibilityCastAsClass();

  unint64_t v7 = [v6 currentAttributedTitle];
  unint64_t v8 = [v7 string];
  v9 = [v8 stringByReplacingOccurrencesOfString:@"\uFFFC" withString:&stru_26F78E4E8];

  objc_super v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  objc_super v11 = [v9 stringByTrimmingCharactersInSet:v10];

  char v12 = __UIAXStringForVariables();

  return v12;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v7.receiver = self;
  v7.super_class = (Class)ShelfHeaderViewAccessibility;
  v4 = [(ShelfHeaderViewAccessibility *)&v7 _accessibilitySupplementaryFooterViews];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(ShelfHeaderViewAccessibility *)self safeSwiftValueForKey:@"accessoryButton"];
  [v3 axSafelyAddObject:v5];

  return v3;
}

@end