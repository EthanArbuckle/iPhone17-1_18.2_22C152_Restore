@interface CAMControlStatusBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation CAMControlStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMControlStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"camera.controls.status.bar");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end