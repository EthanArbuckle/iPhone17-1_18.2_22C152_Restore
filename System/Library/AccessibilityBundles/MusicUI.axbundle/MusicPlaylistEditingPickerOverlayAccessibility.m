@interface MusicPlaylistEditingPickerOverlayAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)newAccessoryView;
@end

@implementation MusicPlaylistEditingPickerOverlayAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicPlaylistEditingPickerOverlay";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)newAccessoryView
{
  v5.receiver = self;
  v5.super_class = (Class)MusicPlaylistEditingPickerOverlayAccessibility;
  id v2 = [(MusicPlaylistEditingPickerOverlayAccessibility *)&v5 newAccessoryView];
  [v2 setIsAccessibilityElement:1];
  [v2 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v3 = accessibilityMusicLocalizedString(@"add.to.playlist");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end