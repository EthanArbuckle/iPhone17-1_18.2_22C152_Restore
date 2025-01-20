@interface ParticipantGridViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axBannerPresentationManager;
- (id)_axMultiwayConversationViewController;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ParticipantGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ParticipantGridView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"bannerPresentationManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.MultiwayViewController", @"hasParticipantVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.BannerPresentationManager", @"inCallControlsVisible", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ParticipantGridViewAccessibility *)self _axMultiwayConversationViewController];
  int v3 = [v2 safeBoolForKey:@"hasParticipantVideo"];

  if (v3) {
    v4 = @"facetime.video";
  }
  else {
    v4 = @"facetime.call";
  }
  v5 = accessibilityLocalizedString(v4);

  return v5;
}

- (id)accessibilityHint
{
  v2 = [(ParticipantGridViewAccessibility *)self _axBannerPresentationManager];
  if ([v2 safeBoolForKey:@"inCallControlsVisible"]) {
    int v3 = @"facetime.video.hint.hide.controls";
  }
  else {
    int v3 = @"facetime.video.hint.show.controls";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(ParticipantGridViewAccessibility *)self _axBannerPresentationManager];
  if ([v2 safeBoolForKey:@"inCallControlsVisible"]) {
    int v3 = @"facetime.video.controls.shown";
  }
  else {
    int v3 = @"facetime.video.controls.hidden";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v3 = [(ParticipantGridViewAccessibility *)self subviews];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ParticipantGridViewAccessibility;
    int v3 = [(ParticipantGridViewAccessibility *)&v5 _accessibilitySupplementaryFooterViews];
  }

  return v3;
}

- (id)_axBannerPresentationManager
{
  v2 = [(ParticipantGridViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:1];
  int v3 = [v2 _accessibilityViewController];
  v4 = [v3 safeValueForKey:@"bannerPresentationManager"];

  return v4;
}

uint64_t __64__ParticipantGridViewAccessibility__axBannerPresentationManager__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axMultiwayConversationViewController
{
  v2 = [(ParticipantGridViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_313 startWithSelf:1];
  int v3 = [v2 _accessibilityViewController];

  return v3;
}

uint64_t __73__ParticipantGridViewAccessibility__axMultiwayConversationViewController__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456492E0](@"ConversationKit.MultiwayViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end