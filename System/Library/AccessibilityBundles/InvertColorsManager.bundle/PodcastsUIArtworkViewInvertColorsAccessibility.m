@interface PodcastsUIArtworkViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PodcastsUIArtworkViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PodcastsStoreUI.ArtworkView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end