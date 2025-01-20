@interface CAMCreativeCameraButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CAMCreativeCameraButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMCreativeCameraButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"effects.button");
}

@end