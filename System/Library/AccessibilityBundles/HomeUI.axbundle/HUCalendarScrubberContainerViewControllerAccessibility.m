@interface HUCalendarScrubberContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HUCalendarScrubberContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUCalendarScrubberContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HUCalendarScrubberContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCalendarScrubberContainerViewController", @"prevWeekButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUCalendarScrubberContainerViewController", @"nextWeekButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)HUCalendarScrubberContainerViewControllerAccessibility;
  [(HUCalendarScrubberContainerViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HUCalendarScrubberContainerViewControllerAccessibility *)self safeValueForKey:@"prevWeekButton"];
  v4 = accessibilityHomeUILocalizedString(@"camera.calendar.previous.week");
  [v3 setAccessibilityLabel:v4];

  v5 = [(HUCalendarScrubberContainerViewControllerAccessibility *)self safeValueForKey:@"nextWeekButton"];
  v6 = accessibilityHomeUILocalizedString(@"camera.calendar.next.week");
  [v5 setAccessibilityLabel:v6];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)HUCalendarScrubberContainerViewControllerAccessibility;
  [(HUCalendarScrubberContainerViewControllerAccessibility *)&v3 viewDidLoad];
  [(HUCalendarScrubberContainerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end