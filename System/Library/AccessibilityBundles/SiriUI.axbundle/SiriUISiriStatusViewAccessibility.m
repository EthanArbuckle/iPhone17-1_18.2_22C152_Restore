@interface SiriUISiriStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)isAccessibilityElement;
- (CGRect)_defaultFocusRegionFrame;
- (CGRect)accessibilityFrame;
- (SiriUISiriStatusViewAccessibility)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)accessibilityElementDidLoseFocus;
- (void)dealloc;
- (void)setMode:(int64_t)a3;
@end

@implementation SiriUISiriStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUISiriStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUISiriStatusView", @"initWithFrame: screen: textInputEnabled: configuration:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriUISiriStatusView", @"delegate", "@", 0);
  [v3 validateClass:@"SiriUISiriStatusView" hasInstanceVariable:@"_touchInputView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"_session", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"cancelSpeechRequest", "v", 0);
}

- (SiriUISiriStatusViewAccessibility)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUISiriStatusViewAccessibility;
  v6 = -[SiriUISiriStatusViewAccessibility initWithFrame:screen:textInputEnabled:configuration:](&v10, sel_initWithFrame_screen_textInputEnabled_configuration_, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = accessibilityLocalizedString(@"listen.button.label");
  [(SiriUISiriStatusViewAccessibility *)v6 setAccessibilityLabel:v7];

  v8 = accessibilityLocalizedString(@"listen.button.hint.idle");
  [(SiriUISiriStatusViewAccessibility *)v6 setAccessibilityHint:v8];

  [(SiriUISiriStatusViewAccessibility *)v6 setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];
  [(SiriUISiriStatusViewAccessibility *)v6 setAccessibilityIdentifier:@"Listen"];
  _UIAccessibilityBlockPostingOfNotification();
  _UIAccessibilityBlockPostingOfNotification();
  UIAccessibilityPostNotification(*MEMORY[0x263F812F8], v6);
  return v6;
}

- (void)dealloc
{
  _UIAccessibilityUnblockPostingOfNotification();
  _UIAccessibilityUnblockPostingOfNotification();
  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusViewAccessibility;
  [(SiriUISiriStatusViewAccessibility *)&v3 dealloc];
}

- (void)setMode:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriUISiriStatusViewAccessibility;
  -[SiriUISiriStatusViewAccessibility setMode:](&v9, sel_setMode_);
  if (a3 == 1)
  {
    _UIAccessibilityBlockPostingOfNotification();
    _UIAccessibilityBlockPostingOfNotification();
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], self);
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityLabel:0];
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityHint:0];
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityIdentifier:@"Listening"];
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF18]];
  }
  else
  {
    accessibilityLocalizedString(@"listen.button.label");
    if (a3 == 2) {
      v5 = {;
    }
      [(SiriUISiriStatusViewAccessibility *)self setAccessibilityLabel:v5];

      v6 = @"listen.button.hint.thinking";
    }
    else {
      v7 = {;
    }
      [(SiriUISiriStatusViewAccessibility *)self setAccessibilityLabel:v7];

      v6 = @"listen.button.hint.idle";
    }
    v8 = accessibilityLocalizedString(v6);
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityHint:v8];

    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityIdentifier:@"Listen"];
    [(SiriUISiriStatusViewAccessibility *)self setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];
    _UIAccessibilityUnblockPostingOfNotification();
    _UIAccessibilityUnblockPostingOfNotification();
  }
  _AXIgnoreNextNotification();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  v2 = [(SiriUISiriStatusViewAccessibility *)self safeValueForKey:@"_touchInputView"];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (CGRect)_defaultFocusRegionFrame
{
  v2 = [(SiriUISiriStatusViewAccessibility *)self safeValueForKey:@"_touchInputView"];
  [v2 safeCGRectForKey:@"_defaultFocusRegionFrame"];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusViewAccessibility;
  return [(SiriUISiriStatusViewAccessibility *)&v3 _accessibilityMediaAnalysisOptions] & 0xFFFF7FFF;
}

- (BOOL)accessibilityPerformMagicTap
{
  double v4 = [(SiriUISiriStatusViewAccessibility *)self safeValueForKey:@"delegate"];
  id v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __65__SiriUISiriStatusViewAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriStatusViewWasTapped:*(void *)(a1 + 40)];
}

- (void)accessibilityElementDidLoseFocus
{
  if (_AXSVoiceOverTouchEnabled()) {
    AXPerformSafeBlock();
  }
}

void __69__SiriUISiriStatusViewAccessibility_accessibilityElementDidLoseFocus__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(0x1645u, 0);
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"delegate"];
  id v4 = [v2 safeValueForKey:@"delegate"];

  objc_super v3 = [v4 safeValueForKey:@"_session"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"VoiceOverCancelRequestInProgress"];
  [v4 stopRequestWithOptions:0];
  [v3 _accessibilitySetBoolValue:0 forKey:@"VoiceOverCancelRequestInProgress"];
}

@end