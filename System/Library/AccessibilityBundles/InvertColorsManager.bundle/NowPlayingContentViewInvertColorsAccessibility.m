@interface NowPlayingContentViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation NowPlayingContentViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.NowPlayingContentView";
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