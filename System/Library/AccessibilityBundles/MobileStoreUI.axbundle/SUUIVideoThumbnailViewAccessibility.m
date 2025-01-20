@interface SUUIVideoThumbnailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIVideoThumbnailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIVideoThumbnailView";
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
  return accessibilityLocalizedString(@"video.play");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8];
}

@end