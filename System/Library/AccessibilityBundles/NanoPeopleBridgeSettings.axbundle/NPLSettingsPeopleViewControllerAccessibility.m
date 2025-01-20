@interface NPLSettingsPeopleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAddPersonSelected;
- (id)_accessibilityCenterOfDialView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateCenterPersonViewAXInfo;
- (void)_accessibilityUpdateDeleteButtonLabel;
- (void)_selectSlotAtIndex:(unint64_t)a3 includeSelectionIndicator:(BOOL)a4 animated:(BOOL)a5;
- (void)peripheryPersonViewTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation NPLSettingsPeopleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NPLSettingsPeopleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NPLSettingsPeopleViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"NPLSettingsPeopleViewController" hasInstanceVariable:@"_deleteButton" withType:"NPLDeleteButton"];
  [v3 validateClass:@"NPLSettingsPeopleViewController" isKindOfClass:@"NPLPeopleViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPeopleViewController", @"_centerPersonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPeopleViewController", @"selectedPerson", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPeopleViewController", @"_selectedSlotIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPeopleViewController", @"peripheryPersonViewTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPeopleViewController", @"_selectSlotAtIndex: includeSelectionIndicator: animated:", "v", "Q", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NPLPersonView", @"position", "Q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NPLSettingsPeopleViewControllerAccessibility;
  [(NPLSettingsPeopleViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityUpdateDeleteButtonLabel];
  [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityUpdateCenterPersonViewAXInfo];
}

- (id)_accessibilityCenterOfDialView
{
  if ([(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityAddPersonSelected])
  {
    CFStringRef v3 = @"_centerPersonView";
  }
  else
  {
    CFStringRef v3 = @"_deleteButton";
  }
  v4 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeValueForKey:v3];

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NPLSettingsPeopleViewControllerAccessibility;
  [(NPLSettingsPeopleViewControllerAccessibility *)&v3 viewDidLoad];
  [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_selectSlotAtIndex:(unint64_t)a3 includeSelectionIndicator:(BOOL)a4 animated:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NPLSettingsPeopleViewControllerAccessibility;
  [(NPLSettingsPeopleViewControllerAccessibility *)&v6 _selectSlotAtIndex:a3 includeSelectionIndicator:a4 animated:a5];
  [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityUpdateDeleteButtonLabel];
  [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityUpdateCenterPersonViewAXInfo];
}

- (void)peripheryPersonViewTapped:(id)a3
{
  id v4 = a3;
  id v5 = [v4 safeUnsignedIntegerForKey:@"position"];
  id v6 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"_selectedSlotIndex"];
  v9.receiver = self;
  v9.super_class = (Class)NPLSettingsPeopleViewControllerAccessibility;
  [(NPLSettingsPeopleViewControllerAccessibility *)&v9 peripheryPersonViewTapped:v4];

  if (v5 != v6)
  {
    if (UIAccessibilityIsVoiceOverRunning()
      && [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityAddPersonSelected])
    {
      v7 = [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityCenterOfDialView];
      [v7 accessibilityActivate];
    }
    else
    {
      UIAccessibilityNotifications v8 = UIAccessibilityLayoutChangedNotification;
      v7 = [(NPLSettingsPeopleViewControllerAccessibility *)self _accessibilityCenterOfDialView];
      UIAccessibilityPostNotification(v8, v7);
    }
  }
}

- (void)_accessibilityUpdateDeleteButtonLabel
{
  objc_super v3 = accessibilityLocalizedString(@"delete.person.button");
  id v4 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeValueForKey:@"_centerPersonView"];
  id v5 = [v4 accessibilityLabel];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeValueForKey:@"_deleteButton"];
  [v6 setAccessibilityLabel:v7];
}

- (BOOL)_accessibilityAddPersonSelected
{
  v2 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeValueForKey:@"selectedPerson"];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_accessibilityUpdateCenterPersonViewAXInfo
{
  id v3 = [(NPLSettingsPeopleViewControllerAccessibility *)self safeValueForKey:@"_centerPersonView"];
  objc_msgSend(v3, "setIsAccessibilityElement:", -[NPLSettingsPeopleViewControllerAccessibility _accessibilityAddPersonSelected](self, "_accessibilityAddPersonSelected"));
}

@end