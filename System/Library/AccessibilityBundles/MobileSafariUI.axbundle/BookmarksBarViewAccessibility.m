@interface BookmarksBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation BookmarksBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"BookmarksBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"bookmarks.bar");
}

@end