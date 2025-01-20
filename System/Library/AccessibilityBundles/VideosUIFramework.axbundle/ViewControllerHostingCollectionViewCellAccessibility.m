@interface ViewControllerHostingCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canBecomeFocused;
@end

@implementation ViewControllerHostingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosUI.ViewControllerHostingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)ViewControllerHostingCollectionViewCellAccessibility;
  unsigned __int8 v3 = [(ViewControllerHostingCollectionViewCellAccessibility *)&v5 canBecomeFocused];
  return v3 & ~[(ViewControllerHostingCollectionViewCellAccessibility *)self _accessibilityIsFKARunningForFocusItem];
}

@end