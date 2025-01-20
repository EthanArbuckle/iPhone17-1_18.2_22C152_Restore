@interface SBPIPContainerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axExpandPIPWindow;
- (BOOL)_axShrinkPIPWindow;
- (BOOL)_axStashPIPWindow;
- (BOOL)accessibilityActivate;
- (id)_announcementStringForQuadrant:(int)a3;
- (id)accessibilityCustomActions;
- (int)_quadrantForContentView;
- (void)_postAnnouncement:(id)a3;
- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4;
- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7;
@end

@implementation SBPIPContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBPIPContainerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBPIPContainerViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPContainerViewController", @"setNeedsLayoutForInteractionController:traits:withReason:behavior:completion:", "v", "@", "Q", "Q", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPContainerViewController", @"interactionControllerDidEndAllInteractions:targetWindowScene:", "v", "@", "@", 0);
  [v3 validateClass:@"SBPIPContainerViewController" hasInstanceVariable:@"_contentView" withType:"UIView"];
  [v3 validateClass:@"SBPIPPegasusContainerAdapter" hasInstanceVariable:@"_pictureInPictureViewController" withType:"PGPictureInPictureViewController"];
  [v3 validateClass:@"SBPIPContainerViewController" hasInstanceVariable:@"_adapter" withType:"<SBPIPContainerViewControllerAdapter>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPContainerViewController", @"SB_accessibilitySetContentViewScale:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPContainerViewController", @"SB_accessibilityContentViewScale", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGControlsContainerView", @"_handleSingleTapGestureRecognizer:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBPIPContainerViewController", @"SB_accessibilityToggleStashed", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGPictureInPictureViewController", @"setStashed:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGPictureInPictureViewController", @"setStashTabHidden:left:withSpringBehavior:", "v", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PGPictureInPictureViewController", @"setStashProgress:", "v", "d", 0);
}

- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBPIPContainerViewControllerAccessibility;
  [(SBPIPContainerViewControllerAccessibility *)&v9 interactionControllerDidEndAllInteractions:a3 targetWindowScene:a4];
  PIPAXCurrentQuad = [(SBPIPContainerViewControllerAccessibility *)self _quadrantForContentView];
  v5 = NSString;
  v6 = accessibilityLocalizedString(@"pip.window.moving.end");
  v7 = [(SBPIPContainerViewControllerAccessibility *)self _announcementStringForQuadrant:PIPAXCurrentQuad];
  v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);

  [(SBPIPContainerViewControllerAccessibility *)self _postAnnouncement:v8];
  PIPAXCurrentQuad = -1;
}

- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7
{
  int v9 = PIPAXCurrentQuad;
  v13.receiver = self;
  v13.super_class = (Class)SBPIPContainerViewControllerAccessibility;
  [(SBPIPContainerViewControllerAccessibility *)&v13 setNeedsLayoutForInteractionController:a3 traits:a4 withReason:a5 behavior:*(void *)&a6 completion:a7];
  if (a5 == 128)
  {
    uint64_t v10 = [(SBPIPContainerViewControllerAccessibility *)self _quadrantForContentView];
    PIPAXCurrentQuad = v10;
    if (v9 == -1)
    {
      uint64_t v11 = accessibilityLocalizedString(@"pip.window.moving.start");
    }
    else
    {
      if (v9 == v10) {
        return;
      }
      uint64_t v11 = [(SBPIPContainerViewControllerAccessibility *)self _announcementStringForQuadrant:v10];
    }
    v12 = (void *)v11;
    if (v11)
    {
      [(SBPIPContainerViewControllerAccessibility *)self _postAnnouncement:v11];
    }
  }
}

- (id)accessibilityCustomActions
{
  v17[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"pip.window.expand");
  v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axExpandPIPWindow];

  v6 = accessibilityLocalizedString(@"pip.window.expand.short");
  [v5 _setShortName:v6];

  id v7 = objc_alloc(MEMORY[0x263F1C390]);
  v8 = accessibilityLocalizedString(@"pip.window.shrink");
  int v9 = (void *)[v7 initWithName:v8 target:self selector:sel__axShrinkPIPWindow];

  uint64_t v10 = accessibilityLocalizedString(@"pip.window.shrink.short");
  [v9 _setShortName:v10];

  id v11 = objc_alloc(MEMORY[0x263F1C390]);
  v12 = accessibilityLocalizedString(@"pip.window.stash");
  objc_super v13 = (void *)[v11 initWithName:v12 target:self selector:sel__axStashPIPWindow];

  v14 = accessibilityLocalizedString(@"pip.window.stash");
  [v13 _setShortName:v14];

  v17[0] = v5;
  v17[1] = v9;
  v17[2] = v13;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  return v15;
}

- (BOOL)_axStashPIPWindow
{
  return 1;
}

void __62__SBPIPContainerViewControllerAccessibility__axStashPIPWindow__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "SB_accessibilityToggleStashed");
  UIAccessibilityNotifications v1 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v1, 0);
}

- (BOOL)_axShrinkPIPWindow
{
  [(SBPIPContainerViewControllerAccessibility *)self safeDoubleForKey:@"SB_accessibilityContentViewScale"];
  double v4 = v3 + -0.1;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  else {
    double v5 = 0.0;
  }
  [(SBPIPContainerViewControllerAccessibility *)self SB_accessibilitySetContentViewScale:v5];
  if (v5 == 0.0) {
    accessibilityLocalizedString(@"pip.window.size.min");
  }
  else {
  v6 = AXFormatFloatWithPercentage();
  }
  [(SBPIPContainerViewControllerAccessibility *)self _postAnnouncement:v6];

  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __63__SBPIPContainerViewControllerAccessibility__axShrinkPIPWindow__block_invoke()
{
}

- (BOOL)_axExpandPIPWindow
{
  [(SBPIPContainerViewControllerAccessibility *)self safeDoubleForKey:@"SB_accessibilityContentViewScale"];
  double v4 = v3 + 0.1;
  if (v4 <= 1.0) {
    double v5 = v4;
  }
  else {
    double v5 = 1.0;
  }
  [(SBPIPContainerViewControllerAccessibility *)self SB_accessibilitySetContentViewScale:v5];
  if (v5 == 1.0) {
    accessibilityLocalizedString(@"pip.window.size.max");
  }
  else {
  v6 = AXFormatFloatWithPercentage();
  }
  [(SBPIPContainerViewControllerAccessibility *)self _postAnnouncement:v6];

  AXPerformBlockOnMainThreadAfterDelay();
  return 1;
}

void __63__SBPIPContainerViewControllerAccessibility__axExpandPIPWindow__block_invoke()
{
}

- (void)_postAnnouncement:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  double v3 = (objc_class *)MEMORY[0x263F086A0];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v8 = *MEMORY[0x263F216D8];
  v9[0] = &unk_26F7E5EC0;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = (void *)[v5 initWithString:v4 attributes:v6];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v7);
}

- (int)_quadrantForContentView
{
  objc_opt_class();
  double v3 = [(SBPIPContainerViewControllerAccessibility *)self safeValueForKey:@"_contentView"];
  id v4 = __UIAccessibilityCastAsClass();

  [v4 center];
  double v6 = v5;
  double v8 = v7;

  objc_opt_class();
  int v9 = [(SBPIPContainerViewControllerAccessibility *)self safeValueForKey:@"view"];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  float v15 = v12 * 0.5;
  float v16 = v14 * 0.5;
  double v17 = v15;
  double v18 = v16;
  if (v8 <= v16 && v6 <= v17) {
    return 1;
  }
  if (v8 <= v18 && v6 > v17) {
    return 2;
  }
  if (v6 <= v17 && v8 > v18) {
    return 3;
  }
  else {
    return 4;
  }
}

- (id)_announcementStringForQuadrant:(int)a3
{
  if ((a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = accessibilityLocalizedString(off_2651542D8[a3 - 1]);
  }
  return v4;
}

- (BOOL)accessibilityActivate
{
  v2 = [(SBPIPContainerViewControllerAccessibility *)self safeValueForKey:@"_adapter._pictureInPictureViewController"];
  uint64_t v3 = [v2 safeValueForKey:@"_controlsContainerView"];
  id v4 = __UIAccessibilitySafeClass();

  double v7 = v4;
  id v5 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__SBPIPContainerViewControllerAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSingleTapGestureRecognizer:0];
}

@end