@interface NowPlayingQueueAddCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NowPlayingQueueAddCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingQueueAddCell";
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
  return accessibilityMusicLocalizedString(@"add.songs.to.queue.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingQueueAddCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(NowPlayingQueueAddCellAccessibility *)&v3 accessibilityTraits];
}

@end