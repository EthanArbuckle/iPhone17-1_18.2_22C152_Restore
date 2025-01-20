@interface SocialProfileArtworkEditorLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SocialProfileArtworkEditorLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SocialProfileArtworkEditorLockupView";
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
  return accessibilityMusicLocalizedString(@"add.profile.photo");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SocialProfileArtworkEditorLockupViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SocialProfileArtworkEditorLockupViewAccessibility *)&v3 accessibilityTraits];
}

@end