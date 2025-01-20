@interface QLAudioViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation QLAudioViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"QLAudioViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"QLAudioViewController" hasInstanceVariable:@"_playButton" withType:"QLOverlayPlayButton"];
  [v3 validateClass:@"QLOverlayPlayButton" hasInstanceVariable:@"_button" withType:"UIButton"];
  [v3 validateClass:@"QLAudioViewController" isKindOfClass:@"UIViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = accessibilityLocalizedString(@"audio.play.button");
  char v8 = 0;
  objc_opt_class();
  v4 = [(QLAudioViewControllerAccessibility *)self safeValueForKey:@"_playButton"];
  v5 = [v4 safeValueForKey:@"_button"];
  v6 = __UIAccessibilityCastAsClass();

  [v6 setAccessibilityLabel:v3];
  v7.receiver = self;
  v7.super_class = (Class)QLAudioViewControllerAccessibility;
  [(QLAudioViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)QLAudioViewControllerAccessibility;
  [(QLAudioViewControllerAccessibility *)&v3 loadView];
  [(QLAudioViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end