@interface PhotosPageContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityViewIsVisible;
@end

@implementation PhotosPageContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PhotosUICore.PhotosPageContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityViewIsVisible
{
  return 0;
}

@end