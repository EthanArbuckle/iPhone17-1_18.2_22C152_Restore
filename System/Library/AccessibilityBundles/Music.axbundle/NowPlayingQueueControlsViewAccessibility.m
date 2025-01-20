@interface NowPlayingQueueControlsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setupAutoPlayButton;
- (void)_setupRepeatButton;
- (void)_setupShuffleButton;
@end

@implementation NowPlayingQueueControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Music.NowPlayingQueueControlsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Music.NowPlayingQueueControlsView" hasSwiftField:@"autoPlayState" withSwiftType:"Optional<Bool>"];
  [v3 validateClass:@"Music.NowPlayingQueueControlsView" hasSwiftField:@"autoPlayButton" withSwiftType:"UIButton"];
  [v3 validateClass:@"Music.NowPlayingQueueControlsView" hasSwiftField:@"shuffleButton" withSwiftType:"UIButton"];
  [v3 validateClass:@"Music.NowPlayingQueueControlsView" hasSwiftField:@"repeatButton" withSwiftType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.NowPlayingQueueControlsView", @"accessibilityShuffleType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Music.NowPlayingQueueControlsView", @"accessibilityRepeatType", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  [(NowPlayingQueueControlsViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(NowPlayingQueueControlsViewAccessibility *)self _setupAutoPlayButton];
  [(NowPlayingQueueControlsViewAccessibility *)self _setupShuffleButton];
  [(NowPlayingQueueControlsViewAccessibility *)self _setupRepeatButton];
}

- (void)_setupAutoPlayButton
{
  objc_super v3 = [(NowPlayingQueueControlsViewAccessibility *)self safeSwiftValueForKey:@"autoPlayButton"];
  [v3 setIsAccessibilityElement:1];
  v4 = accessibilityMusicLocalizedString(@"autoplay.button");
  [v3 setAccessibilityLabel:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke;
  v6[3] = &unk_26513BC48;
  v6[4] = self;
  [v3 setAccessibilityTraitsBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke_2;
  v5[3] = &unk_26513BC20;
  v5[4] = self;
  [v3 setAccessibilityValueBlock:v5];
}

unint64_t __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke(uint64_t a1)
{
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  unint64_t v2 = (*MEMORY[0x263F1CEE8] | (unint64_t)objc_msgSendSuper2(&v7, sel_accessibilityTraits) | *MEMORY[0x263F1CF68]) & ~*MEMORY[0x263F1CF38];
  objc_super v3 = [*(id *)(a1 + 32) safeSwiftOptionalBoolForKey:@"autoPlayState"];
  uint64_t v4 = *MEMORY[0x263F1CF20];
  if (v3) {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 | v2;

  return v5;
}

id __64__NowPlayingQueueControlsViewAccessibility__setupAutoPlayButton__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) safeSwiftOptionalBoolForKey:@"autoPlayState"];
  unint64_t v2 = v1;
  if (v1)
  {
    if ([v1 BOOLValue]) {
      objc_super v3 = @"autoplay.on";
    }
    else {
      objc_super v3 = @"autoplay.off";
    }
    uint64_t v4 = accessibilityMusicLocalizedString(v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_setupShuffleButton
{
  objc_super v3 = [(NowPlayingQueueControlsViewAccessibility *)self safeSwiftValueForKey:@"shuffleButton"];
  [v3 setIsAccessibilityElement:1];
  uint64_t v4 = accessibilityMusicLocalizedString(@"shuffle.button");
  [v3 setAccessibilityLabel:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke;
  v6[3] = &unk_26513BC48;
  v6[4] = self;
  [v3 setAccessibilityTraitsBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke_2;
  v5[3] = &unk_26513BC20;
  v5[4] = self;
  [v3 setAccessibilityValueBlock:v5];
}

unint64_t __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  return (*MEMORY[0x263F1CEE8] | (unint64_t)objc_msgSendSuper2(&v2, sel_accessibilityTraits) | *MEMORY[0x263F1CF68]) & ~*MEMORY[0x263F1CF38];
}

id __63__NowPlayingQueueControlsViewAccessibility__setupShuffleButton__block_invoke_2(uint64_t a1)
{
  unint64_t v1 = [*(id *)(a1 + 32) safeIntegerForKey:@"accessibilityShuffleType"];
  if (v1 > 2)
  {
    objc_super v2 = 0;
  }
  else
  {
    objc_super v2 = accessibilityMusicLocalizedString(off_26513BC68[v1]);
  }

  return v2;
}

- (void)_setupRepeatButton
{
  objc_super v3 = [(NowPlayingQueueControlsViewAccessibility *)self safeSwiftValueForKey:@"repeatButton"];
  [v3 setIsAccessibilityElement:1];
  uint64_t v4 = accessibilityMusicLocalizedString(@"repeat.button");
  [v3 setAccessibilityLabel:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke;
  v6[3] = &unk_26513BC48;
  v6[4] = self;
  [v3 setAccessibilityTraitsBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke_2;
  v5[3] = &unk_26513BC20;
  v5[4] = self;
  [v3 setAccessibilityValueBlock:v5];
}

unint64_t __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)NowPlayingQueueControlsViewAccessibility;
  return (*MEMORY[0x263F1CEE8] | (unint64_t)objc_msgSendSuper2(&v2, sel_accessibilityTraits) | *MEMORY[0x263F1CF68]) & ~*MEMORY[0x263F1CF38];
}

id __62__NowPlayingQueueControlsViewAccessibility__setupRepeatButton__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) safeIntegerForKey:@"accessibilityRepeatType"];
  objc_super v2 = @"repeat.off";
  if (v1 == 1) {
    objc_super v2 = @"repeat.one";
  }
  if (v1 == 2) {
    objc_super v3 = @"repeat.all";
  }
  else {
    objc_super v3 = v2;
  }
  uint64_t v4 = accessibilityMusicLocalizedString(v3);

  return v4;
}

@end