@interface EKEventEditorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation EKEventEditorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventEditor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)EKEventEditorAccessibility;
  [(EKEventEditorAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v3 = [(EKEventEditorAccessibility *)self safeValueForKey:@"_dateItem"];
  v4 = __UIAccessibilityCastAsSafeCategory();

  [v4 _accessibilityLoadAccessibilityInformation];
}

@end