@interface NSObject(AccessibilityAccessors)
+ (id)_accessibilityStringForDate:()AccessibilityAccessors;
+ (id)_accessibilityStringForDayOfWeek:()AccessibilityAccessors;
+ (void)_accessibilityCalGetHourDesignatorsForAM:()AccessibilityAccessors andPM:;
@end

@implementation NSObject(AccessibilityAccessors)

+ (void)_accessibilityCalGetHourDesignatorsForAM:()AccessibilityAccessors andPM:
{
}

+ (id)_accessibilityStringForDayOfWeek:()AccessibilityAccessors
{
  return CUIKStringForDayOfWeek(a3);
}

+ (id)_accessibilityStringForDate:()AccessibilityAccessors
{
  v6 = (const void *)CalCopyTimeZone();
  double v7 = MEMORY[0x1C1889F10](a3, a4, v6);
  CFRelease(v6);
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
  v9 = CUIKStringForDate(v8, 1);

  return v9;
}

@end