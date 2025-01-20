@interface YearViewYearHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateYearNumber;
- (void)_reloadYearNumberLabel;
@end

@implementation YearViewYearHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"YearViewYearHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"YearViewYearHeader" hasInstanceVariable:@"_yearNumber" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"YearViewYearHeader", @"_reloadYearNumberLabel", "v", 0);
}

- (void)_axAnnotateYearNumber
{
  id v3 = [(YearViewYearHeaderAccessibility *)self safeValueForKey:@"_yearNumber"];
  uint64_t v2 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v2];
  [v3 _accessibilitySetIsSpeakThisElement:0];
}

- (void)_reloadYearNumberLabel
{
  v3.receiver = self;
  v3.super_class = (Class)YearViewYearHeaderAccessibility;
  [(YearViewYearHeaderAccessibility *)&v3 _reloadYearNumberLabel];
  [(YearViewYearHeaderAccessibility *)self _axAnnotateYearNumber];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)YearViewYearHeaderAccessibility;
  [(YearViewYearHeaderAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(YearViewYearHeaderAccessibility *)self _axAnnotateYearNumber];
}

@end