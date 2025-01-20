@interface MKTransitFilterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MKTransitFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKTransitFilterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKTransitFilterCell", @"titleText", "@", 0);
  [v3 validateClass:@"MKTransitFilterCell" hasInstanceVariable:@"_label" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MKTransitFilterCellAccessibility *)self safeStringForKey:@"titleText"];
}

- (unint64_t)accessibilityTraits
{
  objc_opt_class();
  id v3 = [(MKTransitFilterCellAccessibility *)self safeValueForKey:@"_label"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v5 = *MEMORY[0x263F1CEE8];
  v6 = [v4 textColor];
  v7 = [MEMORY[0x263F1C550] systemWhiteColor];

  uint64_t v8 = *MEMORY[0x263F1CF38];
  if (v6 != v7) {
    uint64_t v8 = 0;
  }
  return v8 | v5;
}

@end