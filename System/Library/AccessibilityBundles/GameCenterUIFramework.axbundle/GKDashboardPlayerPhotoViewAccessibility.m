@interface GKDashboardPlayerPhotoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GKDashboardPlayerPhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKDashboardPlayerPhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return AXGameCenterUIFrameworkLocString(@"PLAYER_PHOTO");
}

@end