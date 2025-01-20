@interface MobileTimerAssistantTimerSnippetCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MobileTimerAssistantTimerSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MobileTimerAssistantTimerSnippetCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  v2 = [(MobileTimerAssistantTimerSnippetCellAccessibility *)self safeValueForKey:@"_timeView"];
  v3 = [v2 safeValueForKey:@"_running"];
  int v4 = [v3 BOOLValue];

  v5 = [v2 accessibilityLabel];
  if (v4)
  {
    v6 = __UIAXStringForVariables();
  }
  else
  {
    v8 = accessibilityLocalizedString(@"timer.cell.paused");
    v6 = __UIAXStringForVariables();
  }

  return v6;
}

@end