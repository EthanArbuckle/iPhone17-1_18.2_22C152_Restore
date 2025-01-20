@interface PreferencesDoubleTwoPartValueCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PreferencesDoubleTwoPartValueCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PreferencesDoubleTwoPartValueCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesDoubleTwoPartValueCell", @"textLabel2", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PreferencesDoubleTwoPartValueCell", @"twoPartTextLabel2", "@", 0);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"add.event.tablecells.hint");
}

- (id)accessibilityLabel
{
  v10.receiver = self;
  v10.super_class = (Class)PreferencesDoubleTwoPartValueCellAccessibility;
  id v3 = [(PreferencesDoubleTwoPartValueCellAccessibility *)&v10 accessibilityLabel];
  v4 = [(PreferencesDoubleTwoPartValueCellAccessibility *)self safeValueForKey:@"textLabel2"];
  v5 = [v4 accessibilityLabel];

  v6 = [(PreferencesDoubleTwoPartValueCellAccessibility *)self safeValueForKey:@"twoPartTextLabel2"];
  v7 = [v6 accessibilityLabel];

  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)accessibilityValue
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end