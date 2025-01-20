@interface MTPodcastPlaylistCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation MTPodcastPlaylistCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTPodcastPlaylistCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)MTPodcastPlaylistCellAccessibility;
  unint64_t v3 = [(MTPodcastPlaylistCellAccessibility *)&v8 accessibilityTraits];
  v4 = [(MTPodcastPlaylistCellAccessibility *)self safeValueForKey:@"isAdded"];
  int v5 = [v4 BOOLValue];

  uint64_t v6 = *MEMORY[0x263F1CF38];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

@end