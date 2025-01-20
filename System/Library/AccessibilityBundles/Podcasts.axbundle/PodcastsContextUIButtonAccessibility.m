@interface PodcastsContextUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PodcastsContextUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.PodcastsContextUIButton";
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
  return accessibilityLocalizedString(@"more.button");
}

@end