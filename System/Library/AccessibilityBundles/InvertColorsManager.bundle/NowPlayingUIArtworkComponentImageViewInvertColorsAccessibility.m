@interface NowPlayingUIArtworkComponentImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation NowPlayingUIArtworkComponentImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.ArtworkComponentImageView";
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