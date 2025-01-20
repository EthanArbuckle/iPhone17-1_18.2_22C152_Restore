@interface CAMControlDrawerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation CAMControlDrawerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMControlDrawer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"camera.controls");
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end