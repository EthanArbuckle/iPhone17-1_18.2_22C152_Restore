@interface VideosDetailHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)playButton;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyPlayButtonLabel;
@end

@implementation VideosDetailHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosDetailHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_axApplyPlayButtonLabel
{
  id v3 = [(VideosDetailHeaderViewAccessibility *)self safeValueForKey:@"_playButton"];
  v2 = accessibilityLocalizedString(@"play.button");
  [v3 setAccessibilityLabel:v2];

  [v3 setAccessibilityIdentifier:@"PlayButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)VideosDetailHeaderViewAccessibility;
  [(VideosDetailHeaderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(VideosDetailHeaderViewAccessibility *)self _axApplyPlayButtonLabel];
}

- (id)playButton
{
  v5.receiver = self;
  v5.super_class = (Class)VideosDetailHeaderViewAccessibility;
  objc_super v3 = [(VideosDetailHeaderViewAccessibility *)&v5 playButton];
  [(VideosDetailHeaderViewAccessibility *)self _axApplyPlayButtonLabel];

  return v3;
}

@end