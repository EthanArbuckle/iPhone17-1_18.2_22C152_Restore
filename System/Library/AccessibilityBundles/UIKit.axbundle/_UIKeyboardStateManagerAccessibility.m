@interface _UIKeyboardStateManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsHandwritingEnabled;
- (BOOL)_axIsLastKeyBackspace;
- (BOOL)_axIsObservingVoiceOverNotifications;
- (BOOL)_axShouldShowKeyboard;
- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5;
- (BOOL)autocorrectSpellingEnabled;
- (BOOL)autocorrectionPreference;
- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4;
- (BOOL)callShouldInsertText:(id)a3;
- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5;
- (BOOL)presentTextCompletionAsMarkedText:(id)a3;
- (id)_accessibilityKeyboardInputDelegate;
- (uint64_t)_axIsObservingAppLifecycleNotifications;
- (uint64_t)_axSetIsObservingAppLifecycleNotifications:(uint64_t)result;
- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axHandleVoiceOverStatusChanged:(id)a3;
- (void)_axRegisterForVoiceOverNotifications:(id)a3;
- (void)_axResetFKAFocusToFirstResponderOnDelegate;
- (void)_axSetIsHandwritingEnabled:(BOOL)a3;
- (void)_axSetIsLastKeyBackspace:(BOOL)a3;
- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3;
- (void)_axShowKeyboardIfHidden;
- (void)_axUnregisterForVoiceOverNotifications:(id)a3;
- (void)_axUpdateAutocorrectionSettings;
- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4;
- (void)acceptCandidate:(id)a3;
- (void)completeDeleteFromInput;
- (void)completeHandleKeyEvent:(id)a3;
- (void)dealloc;
- (void)deleteBackwardAndNotify:(BOOL)a3;
- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4;
- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5;
- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4;
- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3;
- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4;
- (void)textDidChange:(id)a3;
- (void)touchUpdateLastUsedInputModeAction;
- (void)unmarkText:(id)a3;
@end

@implementation _UIKeyboardStateManagerAccessibility

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5
{
  v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  BOOL v6 = a5;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 setInHardwareKeyboardMode:a3 forceRebuild:a4 shouldMoveKeyboard:a5];
  if (-[_UIKeyboardStateManagerAccessibility _axShouldShowKeyboard]((uint64_t)v10)) {
    -[_UIKeyboardStateManagerAccessibility _axShowKeyboardIfHidden](v10);
  }
}

- (BOOL)_axShouldShowKeyboard
{
  return a1 && UIAccessibilityIsSwitchControlRunning();
}

- (BOOL)autocorrectionPreference
{
  BOOL v6 = self;
  SEL v5 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if ([(_UIKeyboardStateManagerAccessibility *)v6 _axIsHandwritingEnabled]) {
      return 0;
    }
  }
  v3.receiver = v6;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  return [(_UIKeyboardStateManagerAccessibility *)&v3 autocorrectionPreference];
}

+ (id)safeCategoryTargetClassName
{
  return @"_UIKeyboardStateManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsHandwritingEnabled
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsHandwritingEnabled:(BOOL)a3
{
}

- (uint64_t)_axIsObservingAppLifecycleNotifications
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_axSetIsObservingAppLifecycleNotifications:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

- (BOOL)_axIsObservingVoiceOverNotifications
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsObservingVoiceOverNotifications:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v14 = location;
  id v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = @"_UIKeyboardStateManager";
  SEL v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v12 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", v9, "B", "B", 0);
  BOOL v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"handleKeyboardInput: executionContext:", v9, v9, 0);
  SEL v5 = "@?";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardTaskQueue", @"addDeferredTask:", v8, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardTaskExecutionContext", @"returnExecutionToParent", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"deleteBackwardAndNotify:", v8, v12, 0);
  [location[0] validateClass:v10 hasInstanceVariable:@"m_keyboardState" withType:"TIKeyboardState"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"unmarkText:", v8, v9, 0);
  objc_super v3 = "I";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_setAttributedMarkedText: selectedRange: inputString: lastInputString: searchString: compareAttributes:", v9, "{_NSRange=QQ}", v9, v9, v9, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"textDidChange:", v8, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"completeDeleteFromInput", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"taskQueue", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"completeHandleKeyEvent:", v8, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setInputModeToNextInPreferredListWithExecutionContext:", v8, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"clearInputWithCandidatesCleared:", v8, v12, 0);
  v4 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"acceptWord: firstDelete: forInput:", v12, v9, "Q", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setInputMode: userInitiated:", v8, v9, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"acceptCandidate:", v8, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"completeDeleteOnceFromInputWithCharacterBefore:", v8, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"callShouldDeleteWithWordCountForRapidDelete:characterCountForRapidDelete:", v12, "i", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"touchUpdateLastUsedInputModeAction", v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"callShouldInsertText:", v12, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"autocorrectSpellingEnabled", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setAutocorrectSpellingEnabled:", v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"autocorrectionPreference", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"autocorrectionPreferenceForTraits", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"isShifted", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:", v8, v5, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:", v8, v12, v12, v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"isMinimized", v12, 0);
  BOOL v6 = @"UIPhysicalKeyboardEvent";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_unmodifiedInput", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_modifierFlags", "q", 0);
  BOOL v7 = @"TIKeyboardState";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"setAutocorrectionEnabled:", v8, v12, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"UIKeyboard", @"presentsInlineTextCompletionAsMarkedText", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"presentTextCompletionAsMarkedText:", v12, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"inlineCompletionAsMarkedText", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"inputDelegateManager", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKBInputDelegateManager", @"keyInputDelegate", v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"usesCandidateSelection", v12, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_hasMarkedText", v12, 0);
  v11 = @"UIDictationController";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v11, @"isRunning", v12, 0);
  objc_storeStrong(v14, v13);
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v12 = a4;
  if (AXSelectionModeVoiceOverSelectionMovement())
  {
    id v11 = (id)VOTLogCommon();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_impl(&dword_2402B7000, log, type, "Not accepting autocorrection because VoiceOver is moving the cursor.", v9, 2u);
    }
    objc_storeStrong(&v11, 0);
    int v8 = 1;
  }
  else
  {
    v7.receiver = v14;
    v7.super_class = (Class)_UIKeyboardStateManagerAccessibility;
    [(_UIKeyboardStateManagerAccessibility *)&v7 acceptAutocorrectionWithCompletionHandler:location[0] requestedByRemoteInputDestination:v12];
    int v8 = 0;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5
{
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v24 = a4;
  BOOL v23 = a5;
  char v22 = 0;
  v21.receiver = v26;
  v21.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  char v22 = [(_UIKeyboardStateManagerAccessibility *)&v21 performKeyboardOutput:location[0] checkingDelegate:a4 forwardToRemoteInputSource:a5];
  BOOL v20 = 0;
  LOBYTE(v16) = 0;
  if (_AXSAutomationEnabled()) {
    BOOL v16 = !UIAccessibilityIsVoiceOverRunning();
  }
  BOOL v20 = v16;
  if (v23 && !v20 && ([MEMORY[0x263F1C710] isKeyboardProcess] & 1) != 0)
  {
    char v27 = v22 & 1;
    int v19 = 1;
  }
  else
  {
    id v13 = (id)[location[0] insertionText];
    if ([v13 length]
      || (char v12 = 1, ![location[0] deletionCount])
      && (char v12 = 1, ![location[0] forwardDeletionCount]))
    {
      char v12 = [(_UIKeyboardStateManagerAccessibility *)v26 _axIsLastKeyBackspace];
    }

    if (v12)
    {
      [(_UIKeyboardStateManagerAccessibility *)v26 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C40]];
    }
    else
    {
      id v10 = (id)[location[0] insertionText];
      char v11 = 1;
      if (!v10)
      {
        char v9 = 0;
        if (_AXSHoverTextTypingEnabled())
        {
          char v8 = 1;
          if (([(_UIKeyboardStateManagerAccessibility *)v26 safeBoolForKey:@"usesCandidateSelection"] & 1) == 0)char v8 = [(_UIKeyboardStateManagerAccessibility *)v26 safeBoolForKey:@"_hasMarkedText"]; {
          char v9 = v8;
          }
        }
        char v11 = v9;
      }

      if (v11)
      {
        id v18 = (id)[(_UIKeyboardStateManagerAccessibility *)v26 safeValueForKeyPath:@"inputDelegateManager.keyInputDelegate"];
        BOOL v6 = v26;
        id v7 = (id)[location[0] insertionText];
        -[_UIKeyboardStateManagerAccessibility _accessibilityPostValueChangedNotificationWithInsertedText:keyInputDelegate:](v6, "_accessibilityPostValueChangedNotificationWithInsertedText:keyInputDelegate:");

        objc_storeStrong(&v18, 0);
      }
    }
    v17 = v26;
    AXPerformBlockAsynchronouslyOnMainThread();
    char v27 = v22 & 1;
    int v19 = 1;
    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(location, 0);
  return v27 & 1;
}

- (BOOL)_axIsLastKeyBackspace
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetIsLastKeyBackspace:(BOOL)a3
{
}

- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = (id)AXLogUIA();
  os_log_type_t v8 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_3_2_8_69_8_64((uint64_t)v13, (uint64_t)location[0], (uint64_t)v10);
    _os_log_impl(&dword_2402B7000, (os_log_t)v9, v8, "Starting keyboard task, blocking notifications: %{sensitive}@ - %@", v13, 0x16u);
  }
  objc_storeStrong(&v9, 0);
  _UIAccessibilityBlockPostingOfAllNotifications();
  -[_UIKeyboardStateManagerAccessibility _axSetIsLastKeyBackspace:](v12, "_axSetIsLastKeyBackspace:", [location[0] isBackspace] & 1);
  v7.receiver = v12;
  v7.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v7 handleKeyboardInput:location[0] executionContext:v10];
  BOOL v6 = v12;
  AXPerformSafeBlock();
  id v4 = (id)AXUIKeyboardEntryNotificationBlockTimer();
  [v4 afterDelay:&__block_literal_global_2 processBlock:1.0];

  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)deleteBackwardAndNotify:(BOOL)a3
{
  BOOL v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v3 deleteBackwardAndNotify:a3];
  if (v4) {
    [(_UIKeyboardStateManagerAccessibility *)v6 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x263F21C40]];
  }
}

- (void)unmarkText:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v3 unmarkText:location[0]];
  objc_storeStrong(location, 0);
}

- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8
{
  _NSRange v21 = a4;
  BOOL v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  id v16 = 0;
  objc_storeStrong(&v16, a7);
  BOOL v15 = a8;
  uint64_t v14 = 0;
  [(_UIKeyboardStateManagerAccessibility *)v20 _accessibilityPostValueChangedNotificationWithChangeType:0];
  v13.receiver = v20;
  v13.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  unsigned int v12 = -[_UIKeyboardStateManagerAccessibility _setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:](&v13, sel__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes_, location[0], v21.location, v21.length, v18, v17, v16, a8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)textDidChange:(id)a3
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = [NSClassFromString(&cfstr_Uidictationcon.isa) safeBoolForKey:@"isRunning"] & 1;
  uint64_t v4 = 0;
  if (v5)
  {
    uint64_t v4 = *MEMORY[0x263F21C48];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([location[0] accessibilityValueChangesAreReplacements] & 1) != 0)
    {
      uint64_t v4 = *MEMORY[0x263F21C68];
    }
  }
  [(_UIKeyboardStateManagerAccessibility *)v7 _accessibilityPostValueChangedNotificationWithChangeType:v4];
  v3.receiver = v7;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v3 textDidChange:location[0]];
  objc_storeStrong(location, 0);
}

- (void)completeDeleteFromInput
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v2 completeDeleteFromInput];
  [(_UIKeyboardStateManagerAccessibility *)v4 _accessibilityPostValueChangedNotificationWithChangeType:0];
}

- (void)completeHandleKeyEvent:(id)a3
{
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v14;
  v12.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v12 completeHandleKeyEvent:location[0]];
  if (_AXSAutomationEnabled())
  {
    id v8 = (id)[location[0] safeValueForKey:@"_modifiedInput"];
    if (v8) {
      SEL v3 = (__CFString *)v8;
    }
    else {
      SEL v3 = &stru_26F458D38;
    }
    char v11 = v3;

    id v7 = (id)[location[0] safeValueForKey:@"_unmodifiedInput"];
    if (v7) {
      uint64_t v4 = (__CFString *)v7;
    }
    else {
      uint64_t v4 = &stru_26F458D38;
    }
    id v10 = v4;

    id v6 = (id)[location[0] safeValueForKey:@"_modifierFlags"];
    if (v6) {
      id v5 = v6;
    }
    else {
      id v5 = &unk_26F48E9C0;
    }
    id v9 = v5;

    AXUIAutomationHandleKeyComplete();
    objc_storeStrong(&v9, 0);
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v3 setInputModeToNextInPreferredListWithExecutionContext:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v14 = a4;
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  char v12 = 0;
  v11.receiver = v16;
  v11.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  char v12 = [(_UIKeyboardStateManagerAccessibility *)&v11 acceptWord:location[0] firstDelete:v14 forInput:v13];
  if (v12)
  {
    UIAccessibilityNotifications v10 = *MEMORY[0x263F1CDC8];
    if ([location[0] isAutocorrection]) {
      UIAccessibilityNotifications v10 = *MEMORY[0x263F81210];
    }
    id v7 = (id)[location[0] candidate];
    UIAccessibilityPostNotification(v10, v7);
  }
  char v6 = v12;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  MEMORY[0x2455E6B10](*MEMORY[0x263F81340]);
  v5.receiver = v8;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 setInputMode:location[0] userInitiated:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F812D8], 0);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4
{
  UIAccessibilityNotifications v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  char v6 = -[_UIKeyboardStateManagerAccessibility safeBoolForKey:](self, "safeBoolForKey:") & 1;
  v5.receiver = v10;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 setShift:v8 autoshift:v7];
  int v4 = v6 & 1;
  if (v4 != ([(_UIKeyboardStateManagerAccessibility *)v10 safeBoolForKey:@"isShifted"] & 1)) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)acceptCandidate:(id)a3
{
  BOOL v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 acceptCandidate:location[0]];
  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  id v4 = (id)[location[0] candidate];
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (BOOL)presentTextCompletionAsMarkedText:(id)a3
{
  BOOL v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v18 = 0;
  v17.receiver = v20;
  v17.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  char v18 = [(_UIKeyboardStateManagerAccessibility *)&v17 presentTextCompletionAsMarkedText:location[0]];
  id v6 = (id)[MEMORY[0x263F22938] sharedInstance];
  uint64_t v7 = [v6 voiceOverInlineTextCompletionAppearanceFeedback];

  uint64_t v16 = v7;
  char v14 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if (v7 != 1)
  {
    BOOL v8 = 0;
    if (v18)
    {
      id v15 = (id)[location[0] displayString];
      char v14 = 1;
      BOOL v8 = 0;
      if ([v15 length])
      {
        BOOL v8 = 0;
        if ([MEMORY[0x263F1C710] safeBoolForKey:@"presentsInlineTextCompletionAsMarkedText"])
        {
          char v13 = 0;
          objc_opt_class();
          id v5 = (id)[(_UIKeyboardStateManagerAccessibility *)v20 safeValueForKey:@"inlineCompletionAsMarkedText"];
          id v12 = (id)__UIAccessibilityCastAsClass();

          id v11 = v12;
          objc_storeStrong(&v12, 0);
          id v10 = v11;
          char v9 = 1;
          BOOL v8 = [v11 length] != 0;
        }
      }
    }
  }
  if (v9) {

  }
  if (v14) {
  if (v8 && (v16 & 4) != 0)
  }
    UIAccessibilityPostNotification(*MEMORY[0x263F81200], 0);
  char v4 = v18;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)_axShowKeyboardIfHidden
{
  id v2 = a1;
  if (a1)
  {
    if ([v2 safeBoolForKey:@"isMinimized"])
    {
      id v1 = v2;
      AXPerformSafeBlock();
      objc_storeStrong(&v1, 0);
    }
  }
}

- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4
{
  id v10 = self;
  SEL v9 = a2;
  int v8 = a3;
  int v7 = a4;
  char v6 = 0;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  char v6 = [(_UIKeyboardStateManagerAccessibility *)&v5 callShouldDeleteWithWordCountForRapidDelete:a3 characterCountForRapidDelete:a4];
  if (v6) {
    -[_UIKeyboardStateManagerAccessibility _axResetFKAFocusToFirstResponderOnDelegate](v10);
  }
  return v6 & 1;
}

- (void)_axResetFKAFocusToFirstResponderOnDelegate
{
  id v2 = a1;
  if (a1)
  {
    id v1 = v2;
    AXPerformSafeBlock();
    objc_storeStrong(&v1, 0);
  }
}

- (id)_accessibilityKeyboardInputDelegate
{
  if (a1) {
    id v2 = (id)[a1 safeValueForKey:@"inputDelegate"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)touchUpdateLastUsedInputModeAction
{
  char v4 = self;
  SEL v3 = a2;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v2.receiver = v4;
    v2.super_class = (Class)_UIKeyboardStateManagerAccessibility;
    [(_UIKeyboardStateManagerAccessibility *)&v2 touchUpdateLastUsedInputModeAction];
  }
}

- (BOOL)callShouldInsertText:(id)a3
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  char v6 = [(_UIKeyboardStateManagerAccessibility *)&v5 callShouldInsertText:location[0]];
  if (v6) {
    -[_UIKeyboardStateManagerAccessibility _axResetFKAFocusToFirstResponderOnDelegate](v8);
  }
  char v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)autocorrectSpellingEnabled
{
  char v6 = self;
  SEL v5 = a2;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    if ([(_UIKeyboardStateManagerAccessibility *)v6 _axIsHandwritingEnabled]) {
      return 0;
    }
  }
  v3.receiver = v6;
  v3.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  return [(_UIKeyboardStateManagerAccessibility *)&v3 autocorrectSpellingEnabled];
}

- (void)_axUpdateAutocorrectionSettings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v12 = a1;
  if (a1)
  {
    BOOL v11 = [v12 safeUnsignedIntegerForKey:@"autocorrectionPreferenceForTraits"] != 0;
    char v9 = 0;
    objc_opt_class();
    id v1 = (id)[v12 safeValueForKey:@"m_keyboardState"];
    id v8 = (id)__UIAccessibilityCastAsClass();

    id v7 = v8;
    objc_storeStrong(&v8, 0);
    id v10 = v7;
    id v6 = (id)VOTLogHandwriting();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v13, v11);
      _os_log_impl(&dword_2402B7000, (os_log_t)v6, v5, "Handwriting status changed, updating settings. autocorrect: %d", v13, 8u);
    }
    objc_storeStrong(&v6, 0);
    id v2 = v10;
    BOOL v4 = v11;
    id v3 = v12;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
    objc_storeStrong(&v2, 0);
    objc_storeStrong(&v10, 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id location = (id)[MEMORY[0x263F08A00] defaultCenter];
  if ((-[_UIKeyboardStateManagerAccessibility _axIsObservingAppLifecycleNotifications]((uint64_t)v7) & 1) == 0)
  {
    objc_msgSend(location, "addObserver:selector:name:object:", v7, sel__axUnregisterForVoiceOverNotifications_, *MEMORY[0x263F1D0D8]);
    [location addObserver:v7 selector:sel__axRegisterForVoiceOverNotifications_ name:*MEMORY[0x263F1D038] object:0];
    [location addObserver:v7 selector:sel__axHandleVoiceOverStatusChanged_ name:*MEMORY[0x263F1CF90] object:0];
    -[_UIKeyboardStateManagerAccessibility _axSetIsObservingAppLifecycleNotifications:]((uint64_t)v7);
  }
  id v2 = (id)[MEMORY[0x263F1C408] sharedApplication];
  BOOL v3 = [v2 applicationState] != 0;

  if (!v3) {
    [(_UIKeyboardStateManagerAccessibility *)v7 _axRegisterForVoiceOverNotifications:0];
  }
  objc_storeStrong(&location, 0);
}

- (void)_axRegisterForVoiceOverNotifications:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  SEL v6 = __77___UIKeyboardStateManagerAccessibility__axRegisterForVoiceOverNotifications___block_invoke;
  id v7 = &unk_2650ADF18;
  id v8 = v10;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_axUnregisterForVoiceOverNotifications:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(_UIKeyboardStateManagerAccessibility *)v12 _axIsObservingVoiceOverNotifications])
  {
    id v9 = (id)VOTLogHandwriting();
    char v8 = 2;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      os_log_type_t type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_2402B7000, log, type, "Unregistering UIKeyboard from handwriting notifications", v7, 2u);
    }
    objc_storeStrong(&v9, 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v12, (CFNotificationName)*MEMORY[0x263F22770], 0);
    int v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, v12, (CFNotificationName)*MEMORY[0x263F22768], 0);
    [(_UIKeyboardStateManagerAccessibility *)v12 _axSetIsObservingVoiceOverNotifications:0];
    int v10 = 0;
  }
  else
  {
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_axHandleVoiceOverStatusChanged:(id)a3
{
  int v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[_UIKeyboardStateManagerAccessibility _axUpdateAutocorrectionSettings](v4);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v7 = self;
  SEL v6 = a2;
  -[_UIKeyboardStateManagerAccessibility _axUnregisterForVoiceOverNotifications:](self, "_axUnregisterForVoiceOverNotifications:");
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v7 name:*MEMORY[0x263F1D0D8] object:0];

  id v3 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:v7 name:*MEMORY[0x263F1D038] object:0];

  id v4 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:v7 name:*MEMORY[0x263F1CF90] object:0];

  -[_UIKeyboardStateManagerAccessibility _axSetIsObservingAppLifecycleNotifications:]((uint64_t)v7);
  v5.receiver = v7;
  v5.super_class = (Class)_UIKeyboardStateManagerAccessibility;
  [(_UIKeyboardStateManagerAccessibility *)&v5 dealloc];
}

@end