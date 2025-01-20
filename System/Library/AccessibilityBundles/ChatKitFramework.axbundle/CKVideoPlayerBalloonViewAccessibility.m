@interface CKVideoPlayerBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isAccessibilityBalloonViewPlayingVideo;
- (BOOL)accessibilityBalloonViewPlaysInlineVideo;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
@end

@implementation CKVideoPlayerBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKVideoPlayerBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKVideoPlayerBalloonView" isKindOfClass:@"CKImageBalloonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoPlayerBalloonView", @"playerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKVideoPlayerBalloonView", @"startPlayingInlineVideo", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  v5.receiver = self;
  v5.super_class = (Class)CKVideoPlayerBalloonViewAccessibility;
  LOBYTE(v3) = [(CKVideoPlayerBalloonViewAccessibility *)&v5 isAccessibilityElement];
  if ([(CKVideoPlayerBalloonViewAccessibility *)self accessibilityBalloonViewPlaysInlineVideo])
  {
    return ![(CKVideoPlayerBalloonViewAccessibility *)self _isAccessibilityBalloonViewPlayingVideo];
  }
  return v3;
}

- (id)accessibilityCustomActions
{
  v16.receiver = self;
  v16.super_class = (Class)CKVideoPlayerBalloonViewAccessibility;
  BOOL v3 = [(CKVideoPlayerBalloonViewAccessibility *)&v16 accessibilityCustomActions];
  if ([(CKVideoPlayerBalloonViewAccessibility *)self accessibilityBalloonViewPlaysInlineVideo])
  {
    v4 = (void *)[v3 mutableCopy];
    if (![(CKVideoPlayerBalloonViewAccessibility *)self _isAccessibilityBalloonViewPlayingVideo])
    {
      objc_initWeak(&location, self);
      id v5 = objc_alloc(MEMORY[0x263F1C390]);
      v6 = accessibilityLocalizedString(@"video.action.label.play");
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      v12 = __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke;
      v13 = &unk_265112F48;
      objc_copyWeak(&v14, &location);
      v7 = (void *)[v5 initWithName:v6 actionHandler:&v10];
      objc_msgSend(v4, "addObject:", v7, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    uint64_t v8 = [v4 copy];

    BOOL v3 = (void *)v8;
  }

  return v3;
}

uint64_t __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  AXPerformSafeBlock();

  return 1;
}

uint64_t __67__CKVideoPlayerBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPlayingInlineVideo];
}

- (BOOL)accessibilityBalloonViewPlaysInlineVideo
{
  v2 = [MEMORY[0x263F31AB0] sharedBehaviors];
  char v3 = [v2 playsInlineVideo];

  return v3;
}

- (BOOL)_isAccessibilityBalloonViewPlayingVideo
{
  v2 = [(CKVideoPlayerBalloonViewAccessibility *)self safeValueForKey:@"playerView"];
  BOOL v3 = v2 != 0;

  return v3;
}

@end