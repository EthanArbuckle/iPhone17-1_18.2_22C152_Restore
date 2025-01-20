@interface LARGBCameraShutterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation LARGBCameraShutterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LARGBCameraShutterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"camera.button");
}

@end