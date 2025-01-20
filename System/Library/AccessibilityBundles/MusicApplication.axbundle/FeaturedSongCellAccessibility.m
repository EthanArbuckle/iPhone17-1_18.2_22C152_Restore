@interface FeaturedSongCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FeaturedSongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.FeaturedSongCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedSongCell", @"headline", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedSongCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.FeaturedSongCell", @"subtitle", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FeaturedSongCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"headline, title, subtitle"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FeaturedSongCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(FeaturedSongCellAccessibility *)&v3 accessibilityTraits];
}

@end