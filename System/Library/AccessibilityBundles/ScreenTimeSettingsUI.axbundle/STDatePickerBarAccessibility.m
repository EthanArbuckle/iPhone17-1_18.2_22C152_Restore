@interface STDatePickerBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation STDatePickerBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STDatePickerBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STDatePickerBar" hasInstanceVariable:@"_dateLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STDatePickerBar", @"rightArrowButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STDatePickerBar", @"leftArrowButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityValue
{
  v2 = [(STDatePickerBarAccessibility *)self safeUIViewForKey:@"_dateLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (void)accessibilityIncrement
{
  objc_opt_class();
  id v3 = [(STDatePickerBarAccessibility *)self safeUIViewForKey:@"rightArrowButton"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 isEnabled]) {
    [v4 sendActionsForControlEvents:0x2000];
  }
}

- (void)accessibilityDecrement
{
  objc_opt_class();
  id v3 = [(STDatePickerBarAccessibility *)self safeUIViewForKey:@"leftArrowButton"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 isEnabled]) {
    [v4 sendActionsForControlEvents:0x2000];
  }
}

@end