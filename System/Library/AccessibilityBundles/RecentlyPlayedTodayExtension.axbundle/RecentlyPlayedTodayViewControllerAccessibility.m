@interface RecentlyPlayedTodayViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RecentlyPlayedTodayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController", @"recentlyPlayedItems", "@", 0);
  [v3 validateClass:@"RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecentlyPlayedTodayExtension.RecentlyPlayedTodayViewController", @"viewWillAppear:", "v", "B", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v8 = 0;
  objc_opt_class();
  id v3 = [(RecentlyPlayedTodayViewControllerAccessibility *)self safeValueForKey:@"recentlyPlayedItems"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(RecentlyPlayedTodayViewControllerAccessibility *)self view];
  if ([v4 count])
  {
    [v5 setIsAccessibilityElement:0];
  }
  else
  {
    [v5 setIsAccessibilityElement:1];
    v6 = accessibilityRecentlyPlayedTodayExtensionLocalizedString(@"no.recently.played.music");
    [v5 setAccessibilityLabel:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)RecentlyPlayedTodayViewControllerAccessibility;
  [(RecentlyPlayedTodayViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RecentlyPlayedTodayViewControllerAccessibility;
  [(RecentlyPlayedTodayViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(RecentlyPlayedTodayViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end