@interface MusicMessagesAppArtworkComponentImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation MusicMessagesAppArtworkComponentImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicMessagesApp.ArtworkComponentImageView";
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