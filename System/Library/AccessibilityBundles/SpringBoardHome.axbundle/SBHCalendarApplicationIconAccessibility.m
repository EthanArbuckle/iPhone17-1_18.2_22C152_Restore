@interface SBHCalendarApplicationIconAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation SBHCalendarApplicationIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBHCalendarApplicationIcon";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  if (accessibilityValue_didSet != 1
    || CFAbsoluteTimeGetCurrent() - *(double *)&accessibilityValue_LastSetTime > 300.0
    || (accessibilityValue_didSet & 1) == 0)
  {
    accessibilityValue_didSet = 1;
    v3 = [MEMORY[0x263EFF910] date];
    uint64_t v4 = AXDateStringForFormat();

    v5 = (void *)accessibilityValue_Value;
    accessibilityValue_Value = v4;

    accessibilityValue_LastSetTime = CFAbsoluteTimeGetCurrent();
  }
  v8 = [(SBHCalendarApplicationIconAccessibility *)self safeStringForKey:@"_axIconValue"];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end