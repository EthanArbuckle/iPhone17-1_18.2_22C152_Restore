@interface NowPlayingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation NowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.NowPlayingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.NowPlayingViewController", @"accessibilityCollectionView", "@", 0);
  [v3 validateClass:@"NowPlayingUI.TitleSectionHeaderView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v6 = 0;
  objc_opt_class();
  id v3 = [(NowPlayingViewControllerAccessibility *)self safeValueForKey:@"view"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityIdentifier:@"NowPlayingScreen"];
  [v4 setAccessibilityViewIsModal:0];
  v5.receiver = self;
  v5.super_class = (Class)NowPlayingViewControllerAccessibility;
  [(NowPlayingViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingViewControllerAccessibility;
  [(NowPlayingViewControllerAccessibility *)&v3 viewDidLoad];
  [(NowPlayingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end