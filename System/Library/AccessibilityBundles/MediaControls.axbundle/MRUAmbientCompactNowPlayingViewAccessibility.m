@interface MRUAmbientCompactNowPlayingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldUseHostContextIDForLongPress;
- (BOOL)_accessibilityShouldUseHostContextIDForTap;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MRUAmbientCompactNowPlayingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUAmbientCompactNowPlayingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"media.controls.container.label");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)_accessibilityShouldUseHostContextIDForTap
{
  return 1;
}

- (BOOL)_accessibilityShouldUseHostContextIDForLongPress
{
  return 1;
}

@end