@interface SBUIPasscodeEntryFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElementAtIndex:(int64_t)a3;
@end

@implementation SBUIPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeEntryField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  return (id)[(SBUIPasscodeEntryFieldAccessibility *)self safeValueForKey:@"_textField"];
}

@end