@interface CNContactHeaderEditViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNContactHeaderEditViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactHeaderEditView";
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
  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderEditViewAccessibility;
  [(CNContactHeaderEditViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(CNContactHeaderEditViewAccessibility *)self safeUIViewForKey:@"editButton"];
  [v3 setIsAccessibilityElement:0];
  [v3 setAccessibilityElementsHidden:1];
}

@end