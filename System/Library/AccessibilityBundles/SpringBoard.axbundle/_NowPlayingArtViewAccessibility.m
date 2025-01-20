@interface _NowPlayingArtViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setArtworkView:(id)a3;
@end

@implementation _NowPlayingArtViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_NowPlayingArtView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setArtworkView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_NowPlayingArtViewAccessibility;
  id v3 = a3;
  [(_NowPlayingArtViewAccessibility *)&v5 setArtworkView:v3];
  objc_msgSend(v3, "setIsAccessibilityElement:", 1, v5.receiver, v5.super_class);
  v4 = accessibilityLocalizedString(@"album.art.no.artist");
  [v3 setAccessibilityLabel:v4];
}

@end