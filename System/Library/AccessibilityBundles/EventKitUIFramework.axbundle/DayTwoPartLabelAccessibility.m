@interface DayTwoPartLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DayTwoPartLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DayTwoPartLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"DayTwoPartLabel" hasInstanceVariable:@"_firstLabel" withType:"UILabel"];
  [v3 validateClass:@"DayTwoPartLabel" hasInstanceVariable:@"_secondLabel" withType:"UILabel"];
  [v3 validateClass:@"DayTwoPartLabel" hasInstanceVariable:@"_entireString" withType:"UILabel"];
  [v3 validateClass:@"DayTwoPartLabel" hasInstanceVariable:@"_overlayLabel" withType:"UILabel"];
  [v3 validateClass:@"DayTwoPartLabel" hasInstanceVariable:@"_useSeparateFormat" withType:"B"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(DayTwoPartLabelAccessibility *)self safeBoolForKey:@"_useSeparateFormat"])
  {
    id v3 = [(DayTwoPartLabelAccessibility *)self safeValueForKey:@"_firstLabel"];
    v4 = [v3 accessibilityLabel];
    v5 = @"_secondLabel";
  }
  else
  {
    id v3 = [(DayTwoPartLabelAccessibility *)self safeValueForKey:@"_entireString"];
    v4 = [v3 accessibilityLabel];
    v5 = @"_overlayLabel";
  }
  v6 = [(DayTwoPartLabelAccessibility *)self safeValueForKey:v5];
  v9 = [v6 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48];
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return (id)*MEMORY[0x263F1D180] == a3 || *MEMORY[0x263F1D160] == (void)a3 || *MEMORY[0x263F1D130] == (void)a3;
}

@end