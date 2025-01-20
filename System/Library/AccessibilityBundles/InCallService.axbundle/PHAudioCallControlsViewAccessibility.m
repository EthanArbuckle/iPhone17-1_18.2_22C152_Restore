@interface PHAudioCallControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)assignControlType:(unint64_t)a3 toButton:(id)a4;
@end

@implementation PHAudioCallControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAudioCallControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4
{
  id v6 = a4;
  v8.receiver = self;
  v8.super_class = (Class)PHAudioCallControlsViewAccessibility;
  [(PHAudioCallControlsViewAccessibility *)&v8 assignControlType:a3 toButton:v6];
  if (a3 == 5)
  {
    v7 = accessibilityLocalizedString(@"facetime.upgrade.label");
    [v6 setAccessibilityLabel:v7];
  }
}

@end