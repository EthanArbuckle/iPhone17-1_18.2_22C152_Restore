@interface AVTSplashScreenViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation AVTSplashScreenViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTSplashScreenViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSplashScreenViewController", @"playerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSplashScreenViewController", @"configuration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTSplashScreenConfiguration", @"primaryPlayerItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerItem", @"_URL", "@", 0);
  [v3 validateClass:@"AVTSplashScreenViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)AVTSplashScreenViewControllerAccessibility;
  [(AVTSplashScreenViewControllerAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVTSplashScreenViewControllerAccessibility *)self safeValueForKey:@"playerViewController"];
  v4 = [(AVTSplashScreenViewControllerAccessibility *)self safeValueForKeyPath:@"configuration.primaryPlayerItem"];
  v5 = [v4 safeValueForKey:@"_URL"];
  v6 = AVTAvatarEditorSplashVideo();
  v7 = [v6 safeValueForKey:@"_URL"];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    v9 = [v3 safeValueForKeyPath:@"view"];
    v10 = accessibilityLocalizedString(@"memoji.splash.video");
    [v9 setAccessibilityLabel:v10];

    [v9 setIsAccessibilityElement:1];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AVTSplashScreenViewControllerAccessibility;
  [(AVTSplashScreenViewControllerAccessibility *)&v3 viewDidLoad];
  [(AVTSplashScreenViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end