@interface PHAudioCallViewControllerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)setBackgroundImage:(id)a3;
@end

@implementation PHAudioCallViewControllerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAudioCallViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  id v2 = [(PHAudioCallViewControllerInvertColorsAccessibility *)self safeUIViewForKey:@"backgroundImageView"];
  [v2 setAccessibilityIgnoresInvertColors:1];
}

- (void)setBackgroundImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallViewControllerInvertColorsAccessibility;
  [(PHAudioCallViewControllerInvertColorsAccessibility *)&v4 setBackgroundImage:a3];
  [(PHAudioCallViewControllerInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end