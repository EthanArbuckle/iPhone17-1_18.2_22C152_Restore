@interface MobileTimerAssistantWorldClockSnippetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MobileTimerAssistantWorldClockSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobileTimerAssistantWorldClockSnippetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MobileTimerAssistantWorldClockSnippetCell" hasInstanceVariable:@"_clockCellView" withType:"MTUIWorldClockCellView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIWorldClockCellView", @"digitalClock", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTUIDateLabel", @"dateLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(MobileTimerAssistantWorldClockSnippetCellAccessibility *)self safeValueForKey:@"_clockCellView"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 safeValueForKey:@"digitalClock"];
  v5 = [v3 safeValueForKey:@"nameLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [v3 safeValueForKey:@"combinedLabel"];
  v8 = [v7 accessibilityLabel];
  v9 = [v4 safeValueForKey:@"dateLabel"];
  v12 = [v9 accessibilityLabel];
  v10 = __UIAXStringForVariables();

  return v10;
}

- (id)accessibilityValue
{
  v2 = [(MobileTimerAssistantWorldClockSnippetCellAccessibility *)self safeValueForKey:@"_clockCellView"];
  id v3 = [v2 safeValueForKey:@"digitalClock"];
  v4 = [v3 safeValueForKey:@"dateLabel"];
  v5 = [v4 accessibilityValue];

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end