@interface NowPlayingAutoPlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingAutoPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.NowPlayingAutoPlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(@"autoplay.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingAutoPlayButtonAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(NowPlayingAutoPlayButtonAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF38];
}

- (id)accessibilityValue
{
  if ([(NowPlayingAutoPlayButtonAccessibility *)self safeBoolForKey:@"isSelected"])v2 = @"autoplay.on"; {
  else
  }
    v2 = @"autoplay.off";
  objc_super v3 = accessibilityMusicLocalizedString(v2);

  return v3;
}

@end