@interface MiniPlayerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityUpdateMetadata;
- (void)viewDidLoad;
@end

@implementation MiniPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.MiniPlayerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilityNowPlayingItemTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilitySkipButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilityPlayPauseButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilityArtworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilityUpdateMetadata", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.MiniPlayerViewController", @"accessibilityPlayerRequestController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRequestResponseController", @"response", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"tracklist", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponse", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseTracklist", @"playingItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPCPlayerResponseItem", @"seekCommand", "@", 0);
  [v3 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredBackwardJumpIntervals"];
  [v3 validateProtocol:@"MPCPlayerSeekCommand" hasRequiredInstanceMethod:@"preferredForwardJumpIntervals"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  char v18 = 0;
  objc_opt_class();
  id v3 = [(MiniPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilityNowPlayingItemTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityRespondsToUserInteraction:1];
  v5 = [v4 text];

  v6 = [(MiniPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilityArtworkView"];
  v7 = v6;
  if (v5) {
    v8 = @"MiniPlayerArtworkVisible";
  }
  else {
    v8 = @"MiniPlayerArtworkNotVisible";
  }
  [v6 setAccessibilityIdentifier:v8];
  [v4 setAccessibilityIdentifier:@"NowPlayingSongTitleBar"];
  v9 = [(MiniPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilityPlayPauseButton"];
  [v9 setIsAccessibilityElement:v5 != 0];
  [v9 setAccessibilityIdentifier:@"MiniPlayerPlayPauseButton"];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_265144238;
  v17[4] = self;
  [v9 _setAccessibilityLabelBlock:v17];
  v10 = [(MiniPlayerViewControllerAccessibility *)self safeValueForKey:@"accessibilitySkipButton"];
  [v10 setIsAccessibilityElement:v5 != 0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v16[3] = &unk_265144238;
  v16[4] = self;
  [v10 _setAccessibilityLabelBlock:v16];
  [v10 setAccessibilityIdentifier:@"FastForwardButton"];
  [v10 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  char v18 = 0;
  objc_opt_class();
  v11 = [(MiniPlayerViewControllerAccessibility *)self safeValueForKey:@"view"];
  v12 = __UIAccessibilityCastAsClass();

  if (v18) {
    abort();
  }
  if (v5)
  {
    [v12 setAccessibilityContainerType:4];
    v13 = accessibilityLocalizedString(@"titlesView.hint");
    [v12 setAccessibilityHint:v13];

    [v12 setAccessibilityIdentifier:@"MiniPlayerButton"];
  }
  else
  {
    [v12 setAccessibilityContainerType:0];
  }
  v14 = accessibilityLocalizedString(@"mini.player");
  [v12 setAccessibilityLabel:v14];

  [v12 setAccessibilityIdentifier:@"MiniPlayer"];
  v15.receiver = self;
  v15.super_class = (Class)MiniPlayerViewControllerAccessibility;
  [(MiniPlayerViewControllerAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
}

id __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F8C6D0];
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"accessibilityPlayerRequestController"];
  id v3 = [v2 safeValueForKey:@"response"];
  v4 = [v1 _accessibilityPlayPauseButtonString:v3];

  return v4;
}

id __83__MiniPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F8C6D0];
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"accessibilityPlayerRequestController"];
  id v3 = [v2 safeValueForKey:@"response"];
  v4 = [v1 _accessibilitySeekButtonStringInDirection:1 response:v3];

  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MiniPlayerViewControllerAccessibility;
  [(MiniPlayerViewControllerAccessibility *)&v3 viewDidLoad];
  [(MiniPlayerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)accessibilityUpdateMetadata
{
  v3.receiver = self;
  v3.super_class = (Class)MiniPlayerViewControllerAccessibility;
  [(MiniPlayerViewControllerAccessibility *)&v3 accessibilityUpdateMetadata];
  [(MiniPlayerViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end