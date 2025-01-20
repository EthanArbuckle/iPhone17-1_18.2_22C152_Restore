@interface SharingCollectionViewHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation SharingCollectionViewHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicMessagesApp.SharingCollectionViewHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.SharingCollectionViewHeader", @"accessibilityAttributionImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.SharingCollectionViewHeader", @"accessibilityShareRecentlyPlayedLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.SharingCollectionViewHeader", @"layoutSubviews", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_opt_class();
  id v3 = [(SharingCollectionViewHeaderAccessibility *)self safeValueForKey:@"accessibilityAttributionImageView"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityMusicMessagesAppLocalizedString(@"apple.music.logo");
  [v4 setAccessibilityLabel:v5];

  char v9 = 0;
  objc_opt_class();
  v6 = [(SharingCollectionViewHeaderAccessibility *)self safeValueForKey:@"accessibilityShareRecentlyPlayedLabel"];
  v7 = __UIAccessibilityCastAsClass();

  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  v8.receiver = self;
  v8.super_class = (Class)SharingCollectionViewHeaderAccessibility;
  [(SharingCollectionViewHeaderAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SharingCollectionViewHeaderAccessibility;
  [(SharingCollectionViewHeaderAccessibility *)&v3 layoutSubviews];
  [(SharingCollectionViewHeaderAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end