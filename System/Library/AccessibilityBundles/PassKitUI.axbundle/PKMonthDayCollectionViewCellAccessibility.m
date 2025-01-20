@interface PKMonthDayCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKMonthDayCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKMonthDayCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKMonthDayCollectionViewCell", @"isEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKMonthDayCollectionViewCell", @"dayNumber", "q", 0);
}

- (id)accessibilityLabel
{
  id v3 = (void *)MEMORY[0x263F08A30];
  objc_opt_class();
  v4 = [(PKMonthDayCollectionViewCellAccessibility *)self safeValueForKey:@"dayNumber"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v3 localizedStringFromNumber:v5 numberStyle:6];

  return v6;
}

- (BOOL)accessibilityElementsHidden
{
  return [(PKMonthDayCollectionViewCellAccessibility *)self safeBoolForKey:@"isEnabled"] ^ 1;
}

- (BOOL)isAccessibilityElement
{
  return [(PKMonthDayCollectionViewCellAccessibility *)self safeBoolForKey:@"isEnabled"];
}

@end