@interface SpeakTypingManager
+ (id)sharedInstance;
+ (void)initializeMonitoring;
- (BOOL)isRegisteredForAppNotifications;
- (void)_installSpeakTypingSafeCategoriesIfNeeded;
- (void)_notifyToInitializeServerConnection;
- (void)_registerForLetterFeedbackAXSettingsUpdate;
- (void)_registerForPhoneticFeedbackAXSettingsUpdate;
- (void)_registerForQuickTypePredictionFeedbackAXSettingsUpdate;
- (void)_registerForWordFeedbackAXSettingsUpdate;
- (void)setRegisteredForAppNotifications:(BOOL)a3;
- (void)speakTypingLoadAccessibilityForExistingPredictions;
- (void)updateForCurrentQuickTypeFeedbackStatus;
- (void)updateForCurrentTypingFeedbackStatus;
- (void)updateForCurrentWordFeedbackStatus;
@end

@implementation SpeakTypingManager

void __42__SpeakTypingManager_initializeMonitoring__block_invoke()
{
  v0 = +[SpeakTypingManager sharedInstance];
  [v0 _registerForLetterFeedbackAXSettingsUpdate];

  v1 = +[SpeakTypingManager sharedInstance];
  [v1 updateForCurrentTypingFeedbackStatus];

  v2 = +[SpeakTypingManager sharedInstance];
  [v2 _registerForPhoneticFeedbackAXSettingsUpdate];

  v3 = +[SpeakTypingManager sharedInstance];
  [v3 updateForCurrentTypingFeedbackStatus];

  v4 = +[SpeakTypingManager sharedInstance];
  [v4 _registerForQuickTypePredictionFeedbackAXSettingsUpdate];

  v5 = +[SpeakTypingManager sharedInstance];
  [v5 updateForCurrentQuickTypeFeedbackStatus];

  v6 = +[SpeakTypingManager sharedInstance];
  [v6 _registerForWordFeedbackAXSettingsUpdate];

  v7 = +[SpeakTypingManager sharedInstance];
  [v7 updateForCurrentWordFeedbackStatus];

  id v8 = +[SpeakTypingManager sharedInstance];
  [v8 _notifyToInitializeServerConnection];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_SharedInstance_0;

  return v2;
}

- (void)updateForCurrentTypingFeedbackStatus
{
  if (_AXSPhoneticFeedbackEnabled() || _AXSLetterFeedbackEnabled())
  {
    [(SpeakTypingManager *)self _installSpeakTypingSafeCategoriesIfNeeded];
  }
}

- (void)updateForCurrentWordFeedbackStatus
{
  if (_AXSWordFeedbackEnabled())
  {
    [(SpeakTypingManager *)self _installSpeakTypingSafeCategoriesIfNeeded];
  }
}

- (void)updateForCurrentQuickTypeFeedbackStatus
{
  if (_AXSQuickTypePredictionFeedbackEnabled())
  {
    [(SpeakTypingManager *)self _installSpeakTypingSafeCategoriesIfNeeded];
  }
}

- (void)_registerForWordFeedbackAXSettingsUpdate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B440];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)wordFeedback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForQuickTypePredictionFeedbackAXSettingsUpdate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B340];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)quickTypePredictionFeedback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForPhoneticFeedbackAXSettingsUpdate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B330];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)typingFeedback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_registerForLetterFeedbackAXSettingsUpdate
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B2D8];

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)typingFeedback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_notifyToInitializeServerConnection
{
  if (_AXSPhoneticFeedbackEnabled()
    || _AXSLetterFeedbackEnabled()
    || _AXSWordFeedbackEnabled()
    || ([MEMORY[0x263F22938] sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 speakCorrectionsEnabled],
        v2,
        v3))
  {
    id v4 = [getSpeakTypingServicesClass_0() sharedInstance];
    [v4 notifySpeakServicesToInitializeServerConnection];
  }
}

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken_1 != -1) {
    dispatch_once(&initializeMonitoring_onceToken_1, &__block_literal_global_267);
  }
}

uint64_t __36__SpeakTypingManager_sharedInstance__block_invoke()
{
  sharedInstance_SharedInstance_0 = objc_alloc_init(SpeakTypingManager);

  return MEMORY[0x270F9A758]();
}

- (void)speakTypingLoadAccessibilityForExistingPredictions
{
}

void __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke()
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v0 = (void (*)(void))getAXUIApplicationWindowsSymbolLoc_ptr;
  v11 = getAXUIApplicationWindowsSymbolLoc_ptr;
  if (!getAXUIApplicationWindowsSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUIUtilitiesLibrary_1();
    v9[3] = (uint64_t)dlsym(v1, "AXUIApplicationWindows");
    getAXUIApplicationWindowsSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    v0 = (void (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v0) {
    __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_cold_1();
  }
  v2 = v0();
  int v3 = [v2 lastObject];

  id v4 = [v3 _accessibilityUIFindSubviewDescendant:&__block_literal_global_273];
  if (!v4)
  {
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    v5 = (void (*)(void))getAXUIKeyboardWindowSymbolLoc_ptr_0;
    v11 = getAXUIKeyboardWindowSymbolLoc_ptr_0;
    if (!getAXUIKeyboardWindowSymbolLoc_ptr_0)
    {
      v6 = (void *)AccessibilityUIUtilitiesLibrary_1();
      v9[3] = (uint64_t)dlsym(v6, "AXUIKeyboardWindow");
      getAXUIKeyboardWindowSymbolLoc_ptr_0 = (_UNKNOWN *)v9[3];
      v5 = (void (*)(void))v9[3];
    }
    _Block_object_dispose(&v8, 8);
    if (!v5) {
      soft_AXUIKeyboardWindow_cold_1();
    }
    v7 = v5();
    id v4 = [v7 _accessibilityUIFindSubviewDescendant:&__block_literal_global_278];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 speakTypingLoadAccessibilityInformation];
  }
}

uint64_t __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tuipredictionv.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Tuipredictionv.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_installSpeakTypingSafeCategoriesIfNeeded
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsSafari(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 63, @"%s", dlerror());

  __break(1u);
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke()
{
  v0 = [getAXValidationManagerClass() sharedInstance];
  [v0 performValidations:&__block_literal_global_286_0 withPreValidationHandler:&__block_literal_global_311_0 postValidationHandler:&__block_literal_global_317 safeCategoryInstallationHandler:&__block_literal_global_320];

  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v1 = (void *)getAXBinaryMonitorClass_softClass_0;
  uint64_t v8 = getAXBinaryMonitorClass_softClass_0;
  if (!getAXBinaryMonitorClass_softClass_0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getAXBinaryMonitorClass_block_invoke_0;
    v4[3] = &unk_26509DAA8;
    v4[4] = &v5;
    __getAXBinaryMonitorClass_block_invoke_0((uint64_t)v4);
    v1 = (void *)v6[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v5, 8);
  int v3 = [v2 sharedInstance];
  [v3 addHandler:&__block_literal_global_325 forFramework:@"TextInputUI"];
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"UIKeyboardImpl"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"inputDelegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardImpl", @"textInputTraits", "@", 0);
  [v2 validateClass:@"UITextInputTraits" hasInstanceVariable:@"secureTextEntry" withType:"BOOL"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIMorphingLabel", @"text", "@", 0);

  return 1;
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Speak Typing"];
  [v2 setOverrideProcessName:@"Speak Typing"];
  [v2 setDebugBuild:0];

  return soft_AXPerformValidationChecks();
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"UIKeyboardImpl_TFExtras" canInteractWithTargetClass:1];
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_6()
{
  id v0 = [getAXValidationManagerClass() sharedInstance];
  [v0 performValidations:&__block_literal_global_327 withPreValidationHandler:&__block_literal_global_367 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_372];
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"layoutSubviews", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"_predictionCellIndexAtLocation:", "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"setSelectedIndex:", "v", "q", 0);
  [v2 validateProtocol:@"TUIPredictionViewDelegate" hasRequiredInstanceMethod:@"predictionView:didSelectCandidate:"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionView", @"selectedIndex", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionViewCell", @"candidate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionViewCell", @"morphingLabel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIMorphingLabel", @"text", "@", 0);

  return 1;
}

uint64_t __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Speak Typing (TextInputUI)"];
  [v2 setOverrideProcessName:@"Speak Typing (TextInputUI)"];
  [v2 setDebugBuild:0];

  return soft_AXPerformValidationChecks();
}

void __63__SpeakTypingManager__installSpeakTypingSafeCategoriesIfNeeded__block_invoke_9(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"TUIPredictionView_TFExtras" canInteractWithTargetClass:1];
  id v2 = +[SpeakTypingManager sharedInstance];
  [v2 speakTypingLoadAccessibilityForExistingPredictions];
}

- (BOOL)isRegisteredForAppNotifications
{
  return self->_registeredForAppNotifications;
}

- (void)setRegisteredForAppNotifications:(BOOL)a3
{
  self->_registeredForAppNotifications = a3;
}

void __72__SpeakTypingManager_speakTypingLoadAccessibilityForExistingPredictions__block_invoke_cold_1()
{
  id v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSArray *soft_AXUIApplicationWindows(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 45, @"%s", dlerror());

  __break(1u);
}

@end