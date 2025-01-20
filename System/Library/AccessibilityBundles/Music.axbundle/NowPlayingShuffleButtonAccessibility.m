@interface NowPlayingShuffleButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingShuffleButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingShuffleButton";
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
  return accessibilityMusicLocalizedString(@"shuffle.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingShuffleButtonAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(NowPlayingShuffleButtonAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF38];
}

- (id)accessibilityValue
{
  unint64_t v2 = [(NowPlayingShuffleButtonAccessibility *)self safeIntegerForKey:@"accessibilityShuffleType"];
  if (v2 > 2)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = accessibilityMusicLocalizedString(off_26513BD30[v2]);
  }

  return v3;
}

@end