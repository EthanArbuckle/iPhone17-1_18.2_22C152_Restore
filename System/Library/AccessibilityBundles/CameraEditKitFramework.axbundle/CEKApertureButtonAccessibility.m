@interface CEKApertureButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation CEKApertureButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKApertureButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraEditKitD2xLocalizedString(@"depth.button");
}

@end