@interface SiriUIAudioRoutePickerButtonInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SiriUIAudioRoutePickerButtonInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIAudioRoutePickerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end