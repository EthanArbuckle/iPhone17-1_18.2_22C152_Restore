@interface PKReaderModeHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCurrentLabelText;
- (void)_configureForCurrentState;
- (void)_setAXCurrentLabelText:(id)a3;
@end

@implementation PKReaderModeHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKReaderModeHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKReaderModeHeaderView" isKindOfClass:@"PKTableHeaderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTableHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKTableHeaderView", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PKReaderModeHeaderView", @"_configureForCurrentState", "v", 0);
}

- (id)_axCurrentLabelText
{
}

- (void)_setAXCurrentLabelText:(id)a3
{
}

- (void)_configureForCurrentState
{
  v13.receiver = self;
  v13.super_class = (Class)PKReaderModeHeaderViewAccessibility;
  [(PKReaderModeHeaderViewAccessibility *)&v13 _configureForCurrentState];
  objc_opt_class();
  id v3 = [(PKReaderModeHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];
  v6 = [(PKReaderModeHeaderViewAccessibility *)self _axCurrentLabelText];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    [(PKReaderModeHeaderViewAccessibility *)self _setAXCurrentLabelText:v5];
    objc_opt_class();
    v8 = [(PKReaderModeHeaderViewAccessibility *)self safeValueForKey:@"subtitleLabel"];
    v9 = __UIAccessibilityCastAsClass();

    UIAccessibilityNotifications v10 = *MEMORY[0x263F1CDC8];
    v12 = [v9 text];
    v11 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v10, v11);
  }
}

@end