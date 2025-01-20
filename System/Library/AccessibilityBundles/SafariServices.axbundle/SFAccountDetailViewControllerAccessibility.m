@interface SFAccountDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFAccountDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFAccountDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFAccountDetailViewController" hasInstanceVariable:@"_passwordCell" withType:"SFEditableTableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFAccountDetailViewController", @"_cellForIdentifier:indexPath:", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewControllerAccessibility;
  [(SFAccountDetailViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = accessibilitySafariServicesLocalizedString(@"password.cell.hint");
  v4 = [(SFAccountDetailViewControllerAccessibility *)self safeUIViewForKey:@"_passwordCell"];
  [v4 setAccessibilityHint:v3];
}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SFAccountDetailViewControllerAccessibility;
  objc_super v5 = [(SFAccountDetailViewControllerAccessibility *)&v7 _cellForIdentifier:a3 indexPath:a4];
  [(SFAccountDetailViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v5;
}

@end