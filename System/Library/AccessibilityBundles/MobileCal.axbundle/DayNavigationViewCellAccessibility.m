@interface DayNavigationViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_axIsCircled;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DayNavigationViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewCell", @"date", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewCell", @"circled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DayNavigationViewCell", @"isToday", "B", 0);
}

- (BOOL)_axIsCircled
{
  return [(DayNavigationViewCellAccessibility *)self safeBoolForKey:@"circled"];
}

- (id)accessibilityLabel
{
  id v3 = [(DayNavigationViewCellAccessibility *)self safeValueForKey:@"date"];
  v4 = _AXGetStringsForDate(v3);

  if ([(DayNavigationViewCellAccessibility *)self safeBoolForKey:@"isToday"])
  {
    v5 = accessibilityLocalizedString(@"today.indicator");
    uint64_t v6 = __UIAXStringForVariables();

    v4 = (void *)v6;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)DayNavigationViewCellAccessibility;
  unint64_t v3 = [(DayNavigationViewCellAccessibility *)&v5 accessibilityTraits];
  if ([(DayNavigationViewCellAccessibility *)self _axIsCircled]) {
    return (*MEMORY[0x263F1CF38] | v3) & ~*MEMORY[0x263F1CF20];
  }
  else {
    return *MEMORY[0x263F1CEE8] | v3;
  }
}

- (id)accessibilityHint
{
  unint64_t v3 = accessibilityLocalizedString(@"month.day.scroll.hint");
  if (![(DayNavigationViewCellAccessibility *)self _axIsCircled])
  {
    v4 = accessibilityLocalizedString(@"month.day.hint");
    uint64_t v5 = __UIAXStringForVariables();

    unint64_t v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 1;
}

@end