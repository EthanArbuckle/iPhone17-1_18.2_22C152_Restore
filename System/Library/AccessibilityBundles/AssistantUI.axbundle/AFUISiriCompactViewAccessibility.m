@interface AFUISiriCompactViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityPerformMagicTap;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axSetLabelForSessionState:(int64_t)a3;
- (void)_constructAndAddBugReportButtonWithImage:(id)a3;
- (void)_setupContentViews;
- (void)accessibilityElementDidLoseFocus;
- (void)dealloc;
- (void)setSiriSessionState:(int64_t)a3;
@end

@implementation AFUISiriCompactViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriCompactView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AFUISiriCompactView" hasInstanceVariable:@"_siriContentDelegate" withType:"<AFUISiriContentDelegate>"];
  [v3 validateClass:@"AFUISiriCompactView" hasInstanceVariable:@"_orbView" withType:"SUICOrbView"];
  [v3 validateClass:@"AFUISiriCompactView" hasInstanceVariable:@"_reportBugButton" withType:"SiriUIContentButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriCompactView", @"setSiriSessionState:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriCompactView", @"_setupContentViews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriCompactView", @"_constructAndAddBugReportButtonWithImage:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"siriContentDidReceiveOrbTappedAction:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"stopRequestWithOptions:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriViewController", @"_session", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"cancelSpeechRequest", "v", 0);
  if (AXProcessIsSpringBoard()) {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SiriPresentationViewController", @"dismissSiriViewController:withReason:", "v", "@", "q", 0);
  }
  [v3 validateClass:@"AFUISiriCompactView" hasInstanceVariable:@"_lockContainerView" withType:"AFUIPasscodeContainerView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriCompactViewAccessibility;
  [(AFUISiriCompactViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  [(AFUISiriCompactViewAccessibility *)self _axSetLabelForSessionState:[(AFUISiriCompactViewAccessibility *)self safeIntegerForKey:@"_siriSessionState"]];
  id v3 = [(AFUISiriCompactViewAccessibility *)self safeValueForKey:@"_reportBugButton"];
  v4 = AssistantUIAccessibilityLocalizedString(@"assistant.reportbug.label");
  [v3 setAccessibilityLabel:v4];

  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
}

- (BOOL)accessibilityPerformMagicTap
{
  v4 = [(AFUISiriCompactViewAccessibility *)self safeValueForKey:@"_siriContentDelegate"];
  id v2 = v4;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __64__AFUISiriCompactViewAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) siriContentDidReceiveOrbTappedAction:*(void *)(a1 + 40)];
}

- (void)accessibilityElementDidLoseFocus
{
  if (_AXSVoiceOverTouchEnabled()) {
    AXPerformSafeBlock();
  }
}

void __68__AFUISiriCompactViewAccessibility_accessibilityElementDidLoseFocus__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(0x1645u, 0);
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_lockContainerView"];
  char v3 = [v2 _accessibilityViewIsVisible];

  if ((v3 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) safeValueForKey:@"_siriContentDelegate"];
    v4 = [v6 safeValueForKey:@"_session"];
    [v4 _accessibilitySetBoolValue:1 forKey:@"VoiceOverCancelRequestInProgress"];
    [v6 stopRequestWithOptions:0];
    id v5 = (id)[v4 safeValueForKey:@"cancelSpeechRequest"];
    [v4 _accessibilitySetBoolValue:0 forKey:@"VoiceOverCancelRequestInProgress"];
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

void __62__AFUISiriCompactViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"_siriContentDelegate"];
  v1 = [v2 safeValueForKey:@"delegate"];
  [v1 dismissSiriViewController:v2 withReason:23];
}

- (void)_axSetLabelForSessionState:(int64_t)a3
{
  id argument = [(AFUISiriCompactViewAccessibility *)self safeValueForKey:@"_orbView"];
  if (a3 == 1)
  {
    _UIAccessibilityBlockPostingOfNotification();
    _UIAccessibilityBlockPostingOfNotification();
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], argument);
    [argument setAccessibilityLabel:0];
    [argument setAccessibilityHint:0];
    [argument setAccessibilityIdentifier:@"Listening"];
    [argument setAccessibilityTraits:*MEMORY[0x263F1CF18]];
  }
  else
  {
    AssistantUIAccessibilityLocalizedString(@"listen.button.label");
    if (a3 == 2) {
      v4 = {;
    }
      [argument setAccessibilityLabel:v4];

      id v5 = @"listen.button.hint.thinking";
    }
    else {
      id v6 = {;
    }
      [argument setAccessibilityLabel:v6];

      id v5 = @"listen.button.hint.idle";
    }
    v7 = AssistantUIAccessibilityLocalizedString(v5);
    [argument setAccessibilityHint:v7];

    [argument setAccessibilityIdentifier:@"Listen"];
    [argument setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];
    _UIAccessibilityUnblockPostingOfNotification();
    _UIAccessibilityUnblockPostingOfNotification();
  }
  _AXIgnoreNextNotification();
}

- (void)setSiriSessionState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFUISiriCompactViewAccessibility;
  -[AFUISiriCompactViewAccessibility setSiriSessionState:](&v5, sel_setSiriSessionState_);
  [(AFUISiriCompactViewAccessibility *)self _axSetLabelForSessionState:a3];
}

- (void)_setupContentViews
{
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCompactViewAccessibility;
  [(AFUISiriCompactViewAccessibility *)&v3 _setupContentViews];
  [(AFUISiriCompactViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_constructAndAddBugReportButtonWithImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCompactViewAccessibility;
  [(AFUISiriCompactViewAccessibility *)&v4 _constructAndAddBugReportButtonWithImage:a3];
  [(AFUISiriCompactViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)dealloc
{
  _UIAccessibilityUnblockPostingOfNotification();
  _UIAccessibilityUnblockPostingOfNotification();
  UIAccessibilityPostNotification(0x1645u, 0);
  UIAccessibilityPostNotification(0x1647u, 0);
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCompactViewAccessibility;
  [(AFUISiriCompactViewAccessibility *)&v3 dealloc];
}

@end