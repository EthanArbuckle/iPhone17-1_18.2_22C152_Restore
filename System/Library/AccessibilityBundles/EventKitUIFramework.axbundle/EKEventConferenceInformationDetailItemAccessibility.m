@interface EKEventConferenceInformationDetailItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation EKEventConferenceInformationDetailItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKEventConferenceInformationDetailItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKEventTextDetailItem", @"cellForSubitemAtIndex:", "@", "Q", 0);
  [v3 validateClass:@"EKEventConferenceInformationDetailItem" hasInstanceVariable:@"_cell" withType:"EKEventDetailCell"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)EKEventConferenceInformationDetailItemAccessibility;
  [(EKEventConferenceInformationDetailItemAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilityLocalizedString(@"join.conference");
  objc_opt_class();
  v4 = [(EKEventConferenceInformationDetailItemAccessibility *)self safeUIViewForKey:@"_cell"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 accessoryView];
  [v6 setAccessibilityLabel:v3];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EKEventConferenceInformationDetailItemAccessibility;
  v4 = [(EKEventConferenceInformationDetailItemAccessibility *)&v6 cellForSubitemAtIndex:a3];
  [(EKEventConferenceInformationDetailItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v4;
}

@end