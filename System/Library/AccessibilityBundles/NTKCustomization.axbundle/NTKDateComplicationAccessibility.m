@interface NTKDateComplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityComplicationSubType;
@end

@implementation NTKDateComplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKDateComplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityComplicationSubType
{
  v2 = (int *)[(NTKDateComplicationAccessibility *)self safeUnsignedIntegerForKey:@"dateStyle"];
  if (v2 == &dword_4)
  {
    CFStringRef v4 = @"complication.date.day.only";
    goto LABEL_5;
  }
  if (v2 == &dword_8)
  {
    CFStringRef v4 = @"complication.date.day.and.day.of.week";
LABEL_5:
    v5 = accessibilityLocalizedString(v4, v3);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

@end