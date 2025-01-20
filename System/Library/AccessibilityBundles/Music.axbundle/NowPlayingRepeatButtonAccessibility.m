@interface NowPlayingRepeatButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingRepeatButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingRepeatButton";
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
  return accessibilityMusicLocalizedString(@"repeat.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingRepeatButtonAccessibility;
  return (*MEMORY[0x263F1CEE8] | [(NowPlayingRepeatButtonAccessibility *)&v3 accessibilityTraits]) & ~*MEMORY[0x263F1CF38];
}

- (id)accessibilityValue
{
  unint64_t v2 = [(NowPlayingRepeatButtonAccessibility *)self safeIntegerForKey:@"accessibilityRepeatType"];
  if (v2 > 2)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = accessibilityMusicLocalizedString(off_26513BE60[v2]);
  }

  return v3;
}

@end