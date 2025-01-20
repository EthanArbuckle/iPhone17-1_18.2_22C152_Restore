@interface RGBLivenessCoachingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation RGBLivenessCoachingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CoreIDVRGBLiveness.RGBLivenessCoachingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"stylized.animation.role");
}

@end