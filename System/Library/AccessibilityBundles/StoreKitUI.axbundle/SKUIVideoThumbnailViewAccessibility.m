@interface SKUIVideoThumbnailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIVideoThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIVideoThumbnailView";
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
  return accessibilitySKUILocalizedString(@"video.play");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

@end