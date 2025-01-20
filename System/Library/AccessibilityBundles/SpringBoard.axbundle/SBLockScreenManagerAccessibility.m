@interface SBLockScreenManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4;
- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4;
- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3;
- (int)_axLastLockSource;
- (void)_axSetLastLockSource:(int)a3;
- (void)_handleAuthenticationFeedback:(id)a3;
- (void)_setUILocked:(BOOL)a3;
- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5;
@end

@implementation SBLockScreenManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBLockScreenManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int)_axLastLockSource
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_axSetLastLockSource:(int)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"lockUIFromSource: withOptions: completion:", "v", "i", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"_finishUIUnlockFromSource: withOptions:", "B", "i", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"biometricAuthenticationCoordinator: requestsUnlockWithIntent:", "B", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"isUILocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"_handleAuthenticationFeedback:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBLockScreenManager", @"handleKeyHIDEvent:", "B", "^{__IOHIDEvent=}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAuthenticationFeedback", @"jiggleLock", "B", 0);
}

- (void)lockUIFromSource:(int)a3 withOptions:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  [(SBLockScreenManagerAccessibility *)self _axSetLastLockSource:v6];
  v10.receiver = self;
  v10.super_class = (Class)SBLockScreenManagerAccessibility;
  [(SBLockScreenManagerAccessibility *)&v10 lockUIFromSource:v6 withOptions:v9 completion:v8];
}

- (BOOL)_finishUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBLockScreenManagerAccessibility;
  BOOL v4 = [(SBLockScreenManagerAccessibility *)&v6 _finishUIUnlockFromSource:*(void *)&a3 withOptions:a4];
  AXPerformBlockOnMainThreadAfterDelay();
  return v4;
}

void __74__SBLockScreenManagerAccessibility__finishUIUnlockFromSource_withOptions___block_invoke()
{
}

- (void)_setUILocked:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(SBLockScreenManagerAccessibility *)self safeBoolForKey:@"isUILocked"] & 1) == 0) {
    +[AXSpringBoardGlue toggleVoiceOverInfoPanel];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBLockScreenManagerAccessibility;
  [(SBLockScreenManagerAccessibility *)&v5 _setUILocked:v3];
}

- (BOOL)biometricAuthenticationCoordinator:(id)a3 requestsUnlockWithIntent:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBLockScreenManagerAccessibility;
  BOOL v5 = -[SBLockScreenManagerAccessibility biometricAuthenticationCoordinator:requestsUnlockWithIntent:](&v7, sel_biometricAuthenticationCoordinator_requestsUnlockWithIntent_, a3);
  if (UIAccessibilityIsVoiceOverRunning() && a4 == 2 && v5) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21970]);
  }
  return v5;
}

- (void)_handleAuthenticationFeedback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenManagerAccessibility;
  [(SBLockScreenManagerAccessibility *)&v9 _handleAuthenticationFeedback:v4];
  if (UIAccessibilityIsVoiceOverRunning() && [v4 safeBoolForKey:@"jiggleLock"])
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21968]);
    objc_super v6 = (void *)MEMORY[0x263F21660];
    objc_super v7 = accessibilityLocalizedString(@"touch.id.try.again");
    id v8 = [v6 axAttributedStringWithString:v7];

    [v8 setAttribute:&unk_26F7E5EA8 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(v5, v8);
  }
}

- (BOOL)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  if (_AXSFullKeyboardAccessEnabled() || UIAccessibilityIsVoiceOverRunning())
  {
    UIAccessibilityNotifications v5 = [MEMORY[0x263F228A8] representationWithHIDEvent:a3 hidStreamIdentifier:@"AXFKA_SBLockScreenManager"];
    objc_super v6 = [v5 keyInfo];
    objc_super v7 = v6;
    if (v6)
    {
      [v6 translateKeycode];
      if ([v7 gsModifierState]
        || [v7 keyCode] == 79
        || [v7 keyCode] == 80
        || [v7 keyCode] == 82
        || [v7 keyCode] == 81)
      {

        return 0;
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenManagerAccessibility;
  return [(SBLockScreenManagerAccessibility *)&v9 handleKeyHIDEvent:a3];
}

@end