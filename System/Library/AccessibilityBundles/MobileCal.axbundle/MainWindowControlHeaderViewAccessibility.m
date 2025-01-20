@interface MainWindowControlHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (MainWindowControlHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetupBadgedButtonsLabelsValues;
- (void)updateToolbarItems;
@end

@implementation MainWindowControlHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MainWindowControlHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_calendarBarButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_newEventBarButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_inboxBarButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_badgedCalendarBarButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_badgedInboxBarButton" withType:"UIBarButtonItem"];
  [v3 validateClass:@"MainWindowControlHeaderView" hasInstanceVariable:@"_inboxCount" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MainWindowControlHeaderView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  [(MainWindowControlHeaderViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MainWindowControlHeaderViewAccessibility *)self safeValueForKey:@"calendarBarButton"];
  v4 = accessibilityLocalizedString(@"navigationbar.calendar.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(MainWindowControlHeaderViewAccessibility *)self safeValueForKey:@"newEventBarButton"];
  v6 = accessibilityLocalizedString(@"navigationbar.plus.button");
  [v5 setAccessibilityLabel:v6];

  v7 = [(MainWindowControlHeaderViewAccessibility *)self safeValueForKey:@"inboxBarButton"];
  v8 = accessibilityLocalizedString(@"navigationbar.inbox.button");
  [v7 setAccessibilityLabel:v8];

  [(MainWindowControlHeaderViewAccessibility *)self _accessibilitySetupBadgedButtonsLabelsValues];
}

- (MainWindowControlHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  id v3 = -[MainWindowControlHeaderViewAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MainWindowControlHeaderViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)updateToolbarItems
{
  v3.receiver = self;
  v3.super_class = (Class)MainWindowControlHeaderViewAccessibility;
  [(MainWindowControlHeaderViewAccessibility *)&v3 updateToolbarItems];
  [(MainWindowControlHeaderViewAccessibility *)self _accessibilitySetupBadgedButtonsLabelsValues];
}

- (void)_accessibilitySetupBadgedButtonsLabelsValues
{
  id v11 = [(MainWindowControlHeaderViewAccessibility *)self safeValueForKey:@"_badgedCalendarBarButton"];
  objc_super v3 = accessibilityLocalizedString(@"navigationbar.calendar.button");
  [v11 setAccessibilityLabel:v3];

  v4 = accessibilityLocalizedString(@"navigationbar.calendar.badgedbutton.value");
  [v11 setAccessibilityValue:v4];

  v5 = [(MainWindowControlHeaderViewAccessibility *)self safeValueForKey:@"_badgedInboxBarButton"];
  objc_super v6 = accessibilityLocalizedString(@"navigationbar.inbox.button");
  [v5 setAccessibilityLabel:v6];

  uint64_t v7 = [(MainWindowControlHeaderViewAccessibility *)self safeIntegerForKey:@"_inboxCount"];
  v8 = NSString;
  objc_super v9 = accessibilityLocalizedString(@"items.format");
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);
  [v5 setAccessibilityValue:v10];
}

@end