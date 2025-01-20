@interface PHVoicemailGreetingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)viewDidLoad;
@end

@implementation PHVoicemailGreetingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHVoicemailGreetingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailGreetingViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailGreetingViewController", @"sliderCell", "@", 0);
  [v3 validateClass:@"PHVoicemailGreetingSliderCell" hasInstanceVariable:@"_timelineSlider" withType:"VMPlayerTimelineSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHVoicemailGreetingSliderCell", @"progressView", "@", 0);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PHVoicemailGreetingViewControllerAccessibility;
  [(PHVoicemailGreetingViewControllerAccessibility *)&v7 viewDidLoad];
  id v3 = [(PHVoicemailGreetingViewControllerAccessibility *)self safeValueForKey:@"sliderCell"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"_timelineSlider"];
  [v5 accessibilitySetIdentification:@"GreetingSlider"];

  v6 = [v4 safeValueForKey:@"_progressView"];
  [v6 setIsAccessibilityElement:0];
}

@end