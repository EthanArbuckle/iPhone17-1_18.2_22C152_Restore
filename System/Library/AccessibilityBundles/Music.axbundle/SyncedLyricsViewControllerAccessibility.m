@interface SyncedLyricsViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation SyncedLyricsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCoreUI.SyncedLyricsViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsViewController" hasSwiftField:@"scrollView" withSwiftType:"UIScrollView"];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SyncedLyricsViewControllerAccessibility;
  [(SyncedLyricsViewControllerAccessibility *)&v3 viewDidLoad];
  [(SyncedLyricsViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)SyncedLyricsViewControllerAccessibility;
  [(SyncedLyricsViewControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(SyncedLyricsViewControllerAccessibility *)self safeSwiftValueForKey:@"scrollView"];
  [v3 setAccessibilityIdentifier:@"AXSyncedLyricsScrollView"];
}

@end