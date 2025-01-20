@interface UIApplicationAccessibility
+ (BOOL)_isSerializableAccessibilityElement;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAllowsNotificationsDuringSuspension;
- (BOOL)_accessibilityApplicationIsModal;
- (BOOL)_accessibilityBeginMonitoringIdleRunLoop;
- (BOOL)_accessibilityDispatchKeyboardAction:(id)a3;
- (BOOL)_accessibilityDispatchScrollWithAmount:(int64_t)a3;
- (BOOL)_accessibilityElementBelongsToKeyboardWindow:(id)a3;
- (BOOL)_accessibilityHardwareKeyboardActive;
- (BOOL)_accessibilityKeyboardIsEmojiInputMode;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4;
- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4;
- (BOOL)_accessibilityOverrideStartStopExtraExtras;
- (BOOL)_accessibilityResetAndClearNativeFocusSystem;
- (BOOL)_accessibilitySoftwareKeyboardActive;
- (BOOL)_accessibilitySoftwareKeyboardCoversElement:(id)a3;
- (BOOL)_accessibilityUpdateNativeFocusImmediately;
- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5;
- (BOOL)accessibilityStartStopToggle;
- (BOOL)contextKitSearchEnabled;
- (BOOL)openURL:(id)a3;
- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)result;
- (CGRect)_accessibilitySoftwareKeyboardAccessibilityFrame;
- (CGRect)accessibilityFrame;
- (__CFString)_accessibilityCurrentHardwareKeyboardLayout;
- (__CFString)_accessibilityCurrentSoftwareKeyboardLayout;
- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6;
- (double)_accessibilityLastDictationMagicTapTime;
- (id)_accessibilityActiveScenes;
- (id)_accessibilityAllWindowsOnlyVisibleWindows:(BOOL)a3;
- (id)_accessibilityApplicationSemanticContextWithViewController:(uint64_t)a1;
- (id)_accessibilityApplicationWindowFramesAndIds;
- (id)_accessibilityAuditIssuesWithOptions:(id)a3;
- (id)_accessibilityBundleIdentifier;
- (id)_accessibilityCellWithRowIndex:(int64_t)a3 column:(int64_t)a4 containingView:(id)a5;
- (id)_accessibilityCurrentSoftwareLanguage;
- (id)_accessibilityElementCommunityIdentifier;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 parameters:(id)a7;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7;
- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6;
- (id)_accessibilityElementsForSearchParameter:(id)a3;
- (id)_accessibilityElementsWithSemanticContext:(id)a3;
- (id)_accessibilityExplorerElements;
- (id)_accessibilityFindContainerAccessibleElement:(char)a3 first:(char)a4 focus:(char)a5 allowScrolling:;
- (id)_accessibilityFirstElement;
- (id)_accessibilityFirstElementForFocusWithOptions:(id)a3;
- (id)_accessibilityFirstElementsForSpeakThis;
- (id)_accessibilityFocusContainer;
- (id)_accessibilityFocusableScenes;
- (id)_accessibilityFocusableScenesDictionary;
- (id)_accessibilityFocusedScene;
- (id)_accessibilityFocusedScreen;
- (id)_accessibilityGetSpeakThisRootElement;
- (id)_accessibilityGetSpeakThisRootElementAccessibilityIdentifier;
- (id)_accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession;
- (id)_accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession;
- (id)_accessibilityIsolatedWindows;
- (id)_accessibilityLastElement;
- (id)_accessibilityMLProxiedElements;
- (id)_accessibilityMainWindow;
- (id)_accessibilityMainWindowInWindows:(id)a3;
- (id)_accessibilityMakeUIPressInfoWithType:(uint64_t)a3 phase:(int)a4 timestamp:(double)a5 contextID:;
- (id)_accessibilityNativeFocusElement;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)_accessibilityNativeFocusableElements:(id)a3;
- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4;
- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4 forExistenceCheckOnly:(BOOL)a5;
- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4;
- (id)_accessibilityPreferredFocusedWindow;
- (id)_accessibilityPreviewWindow;
- (id)_accessibilityRealtimeElements;
- (id)_accessibilityResponderElement;
- (id)_accessibilityResponderElement:(BOOL)a3;
- (id)_accessibilityResponderElementForFocus;
- (id)_accessibilitySemanticContext;
- (id)_accessibilitySpeakThisElementsAndStrings;
- (id)_accessibilitySpeakThisRootElement;
- (id)_accessibilitySpeakThisViewController;
- (id)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession;
- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4;
- (id)_accessibilitySummaryElement;
- (id)_accessibilityTextReplacementCandidates;
- (id)_accessibilityTitleBarElement;
- (id)_accessibilityTypingCandidates;
- (id)_accessibilityUIAppFocusedOnContinuityDisplay;
- (id)_accessibilityUIWindowFindWithGlobalPoint:(double)a3;
- (id)_accessibilityValidateResponderForFocus:(void *)a1;
- (id)_accessibilityValidatedResponderForExistingGoodResponder:(char)a3 forFocus:;
- (id)_accessibilityWindowSceneForSceneID:(id)a3;
- (id)_accessibilityWindowSections;
- (id)_accessibilityWindows;
- (id)_accessibilityWindowsIgnoringWindowsWithHiddenElements:(BOOL)a3;
- (id)_axActiveEmojiSearchField;
- (id)_axAllSubviews;
- (id)_axAuditCheckDynamicTextSupport:(char)a3 andClippingIssues:(char)a4 spinRunloop:;
- (id)_axSubviews;
- (id)_firstStatusBarElement;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3;
- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4;
- (id)_lastStatusBarElement;
- (id)_responderForKeyEvents;
- (id)_targetInChainForAction:(SEL)a3 sender:(id)a4;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)automationElements;
- (uint64_t)_accessibilityActionIsPhysicalButton:(uint64_t *)a3 nativeUIKitTypeRef:;
- (uint64_t)_accessibilityApplicationInterfaceOrientation;
- (uint64_t)_accessibilityCancelRewindOrFastForward;
- (uint64_t)_accessibilityDictationIsAvailable;
- (uint64_t)_accessibilityDictationIsListening;
- (uint64_t)_accessibilityHandleFullKeyboardAccessAction:(id)obj value:;
- (uint64_t)_accessibilityIsInitialBundleLoadFinished;
- (uint64_t)_accessibilityIsTappingMediaLegibilityEvents;
- (uint64_t)_accessibilityMediaFastForward;
- (uint64_t)_accessibilityMediaNextTrack;
- (uint64_t)_accessibilityMediaPause;
- (uint64_t)_accessibilityMediaPlay;
- (uint64_t)_accessibilityMediaPlayPause;
- (uint64_t)_accessibilityMediaPreviousTrack;
- (uint64_t)_accessibilityMediaRewind;
- (uint64_t)_accessibilityMediaSkipDuration:(void *)a1;
- (uint64_t)_accessibilityShowKeyboardHints;
- (uint64_t)_accessibilityStartStopDictation;
- (unint64_t)_accessibilityAutomationType;
- (unsigned)_accessibilityGetLastMediaRemoteCommand;
- (unsigned)_accessibilityMachPort;
- (void)_accessibilityAVCaptureStarted:(id)a3;
- (void)_accessibilityAVCaptureStopped:(id)a3;
- (void)_accessibilityDidFocusOnApplication;
- (void)_accessibilityFocusDidUpdate:(id)a3;
- (void)_accessibilityInitialize;
- (void)_accessibilityKeyboardDidHide:(id)a3;
- (void)_accessibilityKeyboardDidShow:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityRegisterForDictationLifecycleNotifications;
- (void)_accessibilitySetAllowsNotificationsDuringSuspension:(BOOL)a3;
- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3;
- (void)_accessibilitySetLastMediaRemoteCommand:(unsigned int)a3;
- (void)_accessibilitySetSpeakThisRootElement:(id)a3;
- (void)_accessibilitySetSpeakThisRootElementAccessibilityIdentifier:(id)a3;
- (void)_accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:(id)a3;
- (void)_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:(id)a3;
- (void)_accessibilitySetUIAppFocusedOnContinuityDisplay:(id)a3;
- (void)_accessibilityShowEditingHUD;
- (void)_addEntriesToMapTable:(id)a3 fromMapTable:(id)a4;
- (void)_finishButtonEvent:(id)a3;
- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4;
- (void)_loadAllAccessibilityInformation;
- (void)dealloc;
- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3;
- (void)sendEvent:(id)a3;
- (void)setContextKitSearchEnabled:(BOOL)a3;
@end

@implementation UIApplicationAccessibility

- (void)sendEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25.receiver = v27;
  v25.super_class = (Class)UIApplicationAccessibility;
  [(UIApplicationAccessibility *)&v25 sendEvent:location[0]];
  if (_AXSAutomationEnabled())
  {
    if ([location[0] type])
    {
      if ([location[0] type] == 7)
      {
        v28[0] = @"event";
        v29[0] = @"ScrollEventCompleted";
        v28[1] = @"Timestamp";
        v3 = NSNumber;
        [location[0] timestamp];
        id v5 = (id)objc_msgSend(v3, "numberWithDouble:");
        v29[1] = v5;
        id v4 = (id)[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
        UIAccessibilityPostNotification(0xFA2u, v4);
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)AXLogUIA();
      os_log_type_t type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)location[0]);
        _os_log_impl(&dword_2402B7000, oslog, type, "UIA: incoming touch %@", v32, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v22 = 1;
      memset(__b, 0, sizeof(__b));
      id obj = (id)[location[0] allTouches];
      uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
      if (v14)
      {
        uint64_t v10 = *(void *)__b[2];
        uint64_t v11 = 0;
        unint64_t v12 = v14;
        while (1)
        {
          uint64_t v9 = v11;
          if (*(void *)__b[2] != v10) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(id *)(__b[1] + 8 * v11);
          os_log_t v19 = (os_log_t)(id)AXLogUIA();
          os_log_type_t v18 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v8 = v19;
            __os_log_helper_16_0_1_4_0((uint64_t)v30, [v21 phase]);
            _os_log_impl(&dword_2402B7000, v8, v18, "UIA: touch handled: %d", v30, 8u);
          }
          objc_storeStrong((id *)&v19, 0);
          if ([v21 phase] != 3 && objc_msgSend(v21, "phase") != 4) {
            char v22 = 0;
          }
          ++v11;
          if (v9 + 1 >= v12)
          {
            uint64_t v11 = 0;
            unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
            if (!v12) {
              break;
            }
          }
        }
      }

      if (v22)
      {
        os_log_t v17 = (os_log_t)(id)AXLogUIA();
        os_log_type_t v16 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v6 = v17;
          os_log_type_t v7 = v16;
          __os_log_helper_16_0_0(v15);
          _os_log_impl(&dword_2402B7000, v6, v7, "UIA: touches are complete", v15, 2u);
        }
        objc_storeStrong((id *)&v17, 0);
        UIAccessibilityPostNotification(0xFA2u, &unk_26F48EC30);
      }
    }
  }
  objc_storeStrong(location, 0);
}

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  v24 = location;
  id v23 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v22 = "@";
  os_log_t v19 = "B";
  id v21 = @"UIApplication";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "Q", "B", "B", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"_UIViewServiceSessionManager", @"hasActiveSessions", v19, 0);
  v3 = @"UIDictationController";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"isListening", v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"dictationIsFunctional", v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"fetchCurrentInputModeSupportsDictation", v19, 0);
  v13 = "v";
  [location[0] validateClass:v3 hasInstanceMethod:@"startDictation" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v3, @"activeInstance", v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", @"UIPhysicalKeyboardEvent", @"_eventWithInput: inputFlags:", v22, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIDimmingView", @"delegate", v22, 0);
  [location[0] validateClass:@"_UIFormSheetPresentationController"];
  v8 = @"UIKeyboardImpl";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextReplacement", @"replacementText", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"textInteractionAssistant", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextInteractionAssistant", @"_selectionView", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITextSelectionView", @"selectionChanged", v13, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v21, @"_systemNavigationAction", v22, 0);
  [location[0] validateClass:@"UIStatusBarWindow" hasInstanceVariable:@"_statusBar" withType:"UIStatusBar"];
  id v4 = @"_UIPopoverView";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"standardChromeView", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v21, @"_isActivating", v19, 0);
  id v5 = @"UIKeyShortcutHUDService";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v5, @"sharedHUDService", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"dropShadowView", v22, 0);
  v6 = @"UICompatibilityInputViewController";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"inputController", v22, 0);
  os_log_type_t v7 = @"UIKeyboardInputModeController";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v7, @"sharedInputModeController", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"switchToDictationInputMode", v13, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, @"currentInputMode", v22, 0);
  uint64_t v9 = @"UIScreen";
  os_log_type_t v16 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, @"candidateController", v22, 0);
  [location[0] validateClass:@"UIWheelEvent"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_isMainScreen", v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v9, @"_enumerateScreensWithBlock:", v13, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, @"_preferredFocusedWindow", v22, 0);
  v15 = @"UIFocusSystem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v22, v19, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_updateFocusWithContext:report:", v19, v22, v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_setEnabled:", v13, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_isEnabled", v19, 0);
  [location[0] validateClass:@"UIFocusUpdateContext" hasInstanceVariable:@"_request" withType:"<_UIFocusUpdateRequesting>"];
  uint64_t v14 = @"_UIFocusSystemSceneComponent";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateProtocol:@"_UIFocusUpdateRequesting" hasMethod:@"focusSystem" isInstanceMethod:1 isRequired:1];
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v14, @"sceneComponentForFocusSystem:", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyboardCandidateController", @"activeViews", v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v21, @"_isSystemUIService", v19, 0);
  uint64_t v10 = @"UITextEffectsWindow";
  objc_msgSend(location[0], "validateClass:");
  [location[0] validateClass:v10 hasInstanceVariable:@"_editingOverlayViewController" withType:"UIEditingOverlayViewController"];
  uint64_t v11 = @"UIEditingOverlayViewController";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"undoInteraction", v22, 0);
  unint64_t v12 = @"UIUndoGestureInteraction";
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v12, @"setUndoInteractiveHUDVisibility:", v13, v19, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v14, @"needsFocusSystem", v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v15, @"_preferredFirstResponder", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityGetContextID", "I", 0);
  os_log_t v17 = @"UIWindowScene";
  os_log_type_t v18 = @"UIScene";
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_referenceBoundsForOrientation:", "{CGRect={CGPoint=dd}{CGSize=dd}}", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"keyWindow", v22, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v18, @"_scenesIncludingInternal:", v22, v19, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v18, @"_FBSScene", v22, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"FBSScene", @"identifier", v22, 0);
  v20 = @"UIWindow";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v20, @"_focusResponder", v22, 0);
  [location[0] validateClass:@"UIKeyboardSceneDelegate" hasInstanceVariable:@"_systemInputAssistantViewController" withType:"UISystemInputAssistantViewController"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UISystemInputAssistantViewController", @"emojiSearchViewController", v22, 0);
  [location[0] validateClass:@"_UIFindNavigatorSearchTextField" isKindOfClass:@"UITextField"];
  [location[0] validateClass:v21 hasProperty:@"connectedScenes" withType:v22];
  objc_storeStrong(v24, v23);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  v78 = self;
  v77[1] = (id)a2;
  if (AXRequestingClient() == 3)
  {
    id v43 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
    [v43 accessibilityFrame];
    v44.origin.double x = v2;
    v44.origin.double y = v3;
    v44.size.double width = v4;
    v44.size.double height = v5;
    CGRect v79 = v44;
  }
  else
  {
    v77[0] = (id)objc_msgSend(NSString, "stringWithFormat:", @"AXAppFrame-%p", v78);
    id v76 = (id)[(id)*MEMORY[0x263F81160] objectForKeyedSubscript:v77[0]];
    if (v76)
    {
      [v76 rectValue];
      v42.origin.double x = v6;
      v42.origin.double y = v7;
      v42.size.double width = v8;
      v42.size.double height = v9;
      CGRect v79 = v42;
      int v75 = 1;
    }
    else
    {
      memset(&v79, 0, sizeof(v79));
      CGRect v79 = *(CGRect *)*(void *)&MEMORY[0x263F001A8];
      memset(__b, 0, 0x40uLL);
      char v73 = 0;
      objc_opt_class();
      uint64_t v65 = 0;
      v66 = &v65;
      int v67 = 838860800;
      int v68 = 48;
      v69 = __Block_byref_object_copy__5;
      v70 = __Block_byref_object_dispose__5;
      id v71 = 0;
      uint64_t v59 = MEMORY[0x263EF8330];
      int v60 = -1073741824;
      int v61 = 0;
      v62 = __48__UIApplicationAccessibility_accessibilityFrame__block_invoke;
      v63 = &unk_2650AE158;
      v64 = &v65;
      AXPerformSafeBlock();
      id v58 = (id)v66[5];
      _Block_object_dispose(&v65, 8);
      objc_storeStrong(&v71, 0);
      id v72 = (id)__UIAccessibilityCastAsClass();

      if (v73) {
        abort();
      }
      id v57 = v72;
      objc_storeStrong(&v72, 0);
      id obj = v57;
      uint64_t v41 = [v57 countByEnumeratingWithState:__b objects:v80 count:16];
      if (v41)
      {
        uint64_t v37 = *(void *)__b[2];
        uint64_t v38 = 0;
        unint64_t v39 = v41;
        while (1)
        {
          uint64_t v36 = v38;
          if (*(void *)__b[2] != v37) {
            objc_enumerationMutation(obj);
          }
          void __b[8] = *(void *)(__b[1] + 8 * v38);
          char v55 = 0;
          objc_opt_class();
          id v54 = (id)__UIAccessibilityCastAsClass();
          if (v55) {
            abort();
          }
          id v53 = v54;
          objc_storeStrong(&v54, 0);
          id v56 = v53;
          id v35 = (id)[v53 screen];
          char v51 = 0;
          BOOL v34 = 0;
          if ([v35 safeBoolForKey:@"_isMainScreen"])
          {
            id v52 = (id)[v56 windows];
            char v51 = 1;
            BOOL v34 = [v52 count] != 0;
          }
          if (v51) {

          }
          if (v34)
          {
            id v33 = (id)[v56 keyWindow];
            [v33 accessibilityFrame];
            r2.origin.double x = v10;
            r2.origin.double y = v11;
            r2.size.double width = v12;
            r2.size.double height = v13;

            CGRect v49 = CGRectUnion(v79, r2);
            CGRect v79 = v49;
          }
          objc_storeStrong(&v56, 0);
          ++v38;
          if (v36 + 1 >= v39)
          {
            uint64_t v38 = 0;
            unint64_t v39 = [obj countByEnumeratingWithState:__b objects:v80 count:16];
            if (!v39) {
              break;
            }
          }
        }
      }

      if (CGRectIsEmpty(v79))
      {
        char v47 = 0;
        id v32 = (id)[(UIApplicationAccessibility *)v78 safeValueForKey:@"_mainScene"];
        id v31 = (id)[v32 safeValueForKey:@"settings"];
        id v46 = (id)__UIAccessibilitySafeClass();

        id v45 = v46;
        objc_storeStrong(&v46, 0);
        id v48 = v45;
        id v29 = (id)[v45 displayConfiguration];
        [v29 bounds];
        v30.origin.double x = v14;
        v30.origin.double y = v15;
        v30.size.double width = v16;
        v30.size.double height = v17;
        CGRect v79 = v30;

        objc_storeStrong(&v48, 0);
      }
      if (CGRectIsEmpty(v79))
      {
        id v27 = (id)[MEMORY[0x263F1C920] mainScreen];
        [v27 bounds];
        v28.origin.double x = v18;
        v28.origin.double y = v19;
        v28.size.double width = v20;
        v28.size.double height = v21;
        CGRect v79 = v28;
      }
      id v26 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", *(_OWORD *)&v79.origin, *(_OWORD *)&v79.size);
      objc_msgSend((id)*MEMORY[0x263F81160], "setObject:forKeyedSubscript:");

      int v75 = 1;
    }
    objc_storeStrong(&v76, 0);
    objc_storeStrong(v77, 0);
  }
  double height = v79.size.height;
  double width = v79.size.width;
  double y = v79.origin.y;
  double x = v79.origin.x;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

void __48__UIApplicationAccessibility_accessibilityFrame__block_invoke(uint64_t a1)
{
  id v1 = (id)[MEMORY[0x263F1CBD0] _scenesIncludingInternal:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  CGFloat v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)result
{
  return result;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return UIAccessibilityIsWidgetExtension() & 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  CGFloat v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIApplicationAccessibility;
  [(UIApplicationAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityKeyboardDidHide:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21960]);
  UIAccessibilityPostNotification(0x407u, &unk_26F48EBB8);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityKeyboardDidShow:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)[location[0] userInfo];
  id v13 = (id)[v14 objectForKey:*MEMORY[0x263F1D420]];
  [v13 CGRectValue];
  v17.origin.double x = v3;
  v17.origin.double y = v4;
  v17.size.double width = v5;
  v17.size.double height = v6;
  id v12 = (id)[location[0] userInfo];
  id v11 = (id)[v12 objectForKey:*MEMORY[0x263F1D428]];
  [v11 CGRectValue];
  rect2.origin.double x = v7;
  rect2.origin.double y = v8;
  rect2.size.double width = v9;
  rect2.size.double height = v10;
  BOOL v15 = CGRectEqualToRect(v17, rect2);

  if (!v15)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21958]);
    UIAccessibilityPostNotification(0x407u, &unk_26F48EBE0);
  }
  objc_storeStrong(location, 0);
}

- (unsigned)_accessibilityMachPort
{
  return _AXUIElementRemoteBridgeMachPortForAXServer();
}

- (BOOL)_accessibilityOverrideStartStopExtraExtras
{
  return 0;
}

- (void)setContextKitSearchEnabled:(BOOL)a3
{
}

- (BOOL)contextKitSearchEnabled
{
  return [(UIApplicationAccessibility *)self _accessibilityBoolValueForKey:@"ProcessingContextKitSearch", a2, self] & 1;
}

- (BOOL)accessibilityStartStopToggle
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  CGFloat v20 = self;
  v19[1] = (id)a2;
  if ([(UIApplicationAccessibility *)self _accessibilityOverrideStartStopExtraExtras])
  {
    id v7 = (id)[MEMORY[0x263F213C8] sharedInstance];
    char v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      id v6 = (id)[MEMORY[0x263F213C8] identifier];
      v19[0] = (id)AXLoggerForFacility();

      os_log_type_t v18 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled((os_log_t)v19[0], v18))
      {
        id v17 = (id)AXColorizeFormatLog();
        id v16 = (id)_AXStringForArgs();
        id location = v19[0];
        os_log_type_t v14 = v18;
        if (os_log_type_enabled((os_log_t)location, v18))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v23, (uint64_t)v16);
          _os_log_impl(&dword_2402B7000, (os_log_t)location, v14, "%{public}@", v23, 0xCu);
        }
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v16, 0);
        objc_storeStrong(&v17, 0);
      }
      objc_storeStrong(v19, 0);
    }
    char v21 = 1;
  }
  else if (-[UIApplicationAccessibility _accessibilityStartStopDictation](v20))
  {
    id v4 = (id)[MEMORY[0x263F213C8] sharedInstance];
    char v5 = [v4 ignoreLogging];

    if ((v5 & 1) == 0)
    {
      id v3 = (id)[MEMORY[0x263F213C8] identifier];
      id v13 = (id)AXLoggerForFacility();

      os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled((os_log_t)v13, v12))
      {
        id v11 = (id)AXColorizeFormatLog();
        id v10 = (id)_AXStringForArgs();
        os_log_t oslog = (os_log_t)v13;
        if (os_log_type_enabled(oslog, v12))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v22, (uint64_t)v10);
          _os_log_impl(&dword_2402B7000, oslog, v12, "%{public}@", v22, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_storeStrong(&v10, 0);
        objc_storeStrong(&v11, 0);
      }
      objc_storeStrong(&v13, 0);
    }
    char v21 = 1;
  }
  else
  {
    char v21 = 0;
  }
  return v21 & 1;
}

- (uint64_t)_accessibilityStartStopDictation
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v84 = a1;
  if (a1)
  {
    id v83 = (id)[NSClassFromString(&cfstr_Uidictationcon.isa) safeValueForKey:@"activeInstance"];
    if ([NSClassFromString(&cfstr_Uidictationcon.isa) safeBoolForKey:@"isListening"])
    {
      id v35 = (id)[MEMORY[0x263F213C8] sharedInstance];
      char v36 = [v35 ignoreLogging];

      if ((v36 & 1) == 0)
      {
        id v34 = (id)[MEMORY[0x263F213C8] identifier];
        id v82 = (id)AXLoggerForFacility();

        os_log_type_t v81 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v82, v81))
        {
          id v80 = (id)AXColorizeFormatLog();
          id v79 = (id)_AXStringForArgs();
          id location = v82;
          os_log_type_t v77 = v81;
          if (os_log_type_enabled((os_log_t)location, v81))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v92, (uint64_t)v79);
            _os_log_impl(&dword_2402B7000, (os_log_t)location, v77, "%{public}@", v92, 0xCu);
          }
          objc_storeStrong(&location, 0);
          objc_storeStrong(&v79, 0);
          objc_storeStrong(&v80, 0);
        }
        objc_storeStrong(&v82, 0);
      }
      id v76 = (id)[NSClassFromString(&cfstr_Uikeyboarddict.isa) safeValueForKey:@"activeInstance"];
      if (v76)
      {
        id v75 = (id)[NSClassFromString(&cfstr_Uikbdictationa.isa) safeValueForKey:@"sharedInstance"];
        [v75 setUserInteractionEnabled:0];
        id v1 = (id)[v76 safeValueForKey:@"fade"];
        id v32 = (id)[MEMORY[0x263F213C8] sharedInstance];
        char v33 = [v32 ignoreLogging];

        if ((v33 & 1) == 0)
        {
          id v31 = (id)[MEMORY[0x263F213C8] identifier];
          id v74 = (id)AXLoggerForFacility();

          os_log_type_t v73 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled((os_log_t)v74, v73))
          {
            id v72 = (id)AXColorizeFormatLog();
            id v71 = (id)_AXStringForArgs();
            id v70 = v74;
            os_log_type_t v69 = v73;
            if (os_log_type_enabled((os_log_t)v70, v73))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v91, (uint64_t)v71);
              _os_log_impl(&dword_2402B7000, (os_log_t)v70, v69, "%{public}@", v91, 0xCu);
            }
            objc_storeStrong(&v70, 0);
            objc_storeStrong(&v71, 0);
            objc_storeStrong(&v72, 0);
          }
          objc_storeStrong(&v74, 0);
        }
        objc_storeStrong(&v75, 0);
      }
      else
      {
        id v2 = (id)[v83 safeValueForKey:@"stopDictation"];
        id v29 = (id)[MEMORY[0x263F213C8] sharedInstance];
        char v30 = [v29 ignoreLogging];

        if ((v30 & 1) == 0)
        {
          id v28 = (id)[MEMORY[0x263F213C8] identifier];
          id v68 = (id)AXLoggerForFacility();

          os_log_type_t v67 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled((os_log_t)v68, v67))
          {
            id v66 = (id)AXColorizeFormatLog();
            id v65 = (id)_AXStringForArgs();
            id v64 = v68;
            os_log_type_t v63 = v67;
            if (os_log_type_enabled((os_log_t)v64, v67))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v90, (uint64_t)v65);
              _os_log_impl(&dword_2402B7000, (os_log_t)v64, v63, "%{public}@", v90, 0xCu);
            }
            objc_storeStrong(&v64, 0);
            objc_storeStrong(&v65, 0);
            objc_storeStrong(&v66, 0);
          }
          objc_storeStrong(&v68, 0);
        }
        id v3 = (id)[v83 safeValueForKey:@"keyboardInputModeToReturn"];
        BOOL v27 = v3 == 0;

        if (!v27)
        {
          id v24 = (id)[MEMORY[0x263F1C738] activeInstance];
          id v23 = (id)[v24 safeValueForKey:@"textInteractionAssistant"];
          id v22 = (id)[v23 safeValueForKey:@"_selectionView"];
          id v4 = (id)[v22 safeValueForKey:@"selectionChanged"];

          id v26 = (id)[MEMORY[0x263F1C738] activeInstance];
          id v25 = (id)objc_msgSend(v83, "safeValueForKey:");
          objc_msgSend(v26, "setKeyboardInputMode:userInitiated:");

          [v83 _accessibilitySetRetainedValue:0 forKey:@"keyboardInputModeToReturn"];
        }
      }
      id v20 = v84;
      id v21 = (id)[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
      objc_msgSend(v20, "_accessibilitySetRetainedValue:forKey:");

      char v85 = 1;
      int v62 = 1;
      objc_storeStrong(&v76, 0);
    }
    else if ([(id)_lastActiveDictationController accessibilityPerformMagicTap])
    {
      id v18 = (id)[MEMORY[0x263F213C8] sharedInstance];
      char v19 = [v18 ignoreLogging];

      if ((v19 & 1) == 0)
      {
        id v17 = (id)[MEMORY[0x263F213C8] identifier];
        id v61 = (id)AXLoggerForFacility();

        os_log_type_t v60 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v61, v60))
        {
          id v59 = (id)AXColorizeFormatLog();
          id v58 = (id)_AXStringForArgs();
          id v57 = v61;
          os_log_type_t v56 = v60;
          if (os_log_type_enabled((os_log_t)v57, v60))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v89, (uint64_t)v58);
            _os_log_impl(&dword_2402B7000, (os_log_t)v57, v56, "%{public}@", v89, 0xCu);
          }
          objc_storeStrong(&v57, 0);
          objc_storeStrong(&v58, 0);
          objc_storeStrong(&v59, 0);
        }
        objc_storeStrong(&v61, 0);
      }
      char v85 = 1;
      int v62 = 1;
    }
    else
    {
      if (([v84 _accessibilitySoftwareKeyboardActive] & 1) == 0) {
        goto LABEL_62;
      }
      id v15 = (id)[MEMORY[0x263F213C8] sharedInstance];
      char v16 = [v15 ignoreLogging];

      if ((v16 & 1) == 0)
      {
        id v14 = (id)[MEMORY[0x263F213C8] identifier];
        id v55 = (id)AXLoggerForFacility();

        os_log_type_t v54 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled((os_log_t)v55, v54))
        {
          id v53 = (id)AXColorizeFormatLog();
          id v52 = (id)_AXStringForArgs();
          os_log_t oslog = (os_log_t)v55;
          os_log_type_t v50 = v54;
          if (os_log_type_enabled(oslog, v54))
          {
            __os_log_helper_16_2_1_8_66((uint64_t)v88, (uint64_t)v52);
            _os_log_impl(&dword_2402B7000, oslog, v50, "%{public}@", v88, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          objc_storeStrong(&v52, 0);
          objc_storeStrong(&v53, 0);
        }
        objc_storeStrong(&v55, 0);
      }
      id v49 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x263F1CE28]);
      if ([v49 accessibilityPerformMagicTap])
      {
        id v12 = (id)[MEMORY[0x263F213C8] sharedInstance];
        char v13 = [v12 ignoreLogging];

        if ((v13 & 1) == 0)
        {
          id v11 = (id)[MEMORY[0x263F213C8] identifier];
          os_log_t v48 = (os_log_t)(id)AXLoggerForFacility();

          os_log_type_t v47 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v48, v47))
          {
            id v46 = (id)AXColorizeFormatLog();
            id v45 = (id)_AXStringForArgs();
            os_log_t v44 = v48;
            os_log_type_t v43 = v47;
            if (os_log_type_enabled(v44, v47))
            {
              __os_log_helper_16_2_1_8_66((uint64_t)v87, (uint64_t)v45);
              _os_log_impl(&dword_2402B7000, v44, v43, "%{public}@", v87, 0xCu);
            }
            objc_storeStrong((id *)&v44, 0);
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v46, 0);
          }
          objc_storeStrong((id *)&v48, 0);
        }
        char v85 = 1;
        int v62 = 1;
      }
      else
      {
        id v42 = NSClassFromString(&cfstr_Uidictationcon.isa);
        if (([v42 safeBoolForKey:@"dictationIsFunctional"] & 1) != 0
          && ([v42 safeBoolForKey:@"fetchCurrentInputModeSupportsDictation"] & 1) != 0)
        {
          id v8 = (id)[NSClassFromString(&cfstr_Uikeyboardinpu.isa) safeValueForKey:@"sharedInputModeController"];
          id v5 = (id)[v8 safeValueForKey:@"switchToDictationInputMode"];

          id v9 = (id)[MEMORY[0x263F213C8] sharedInstance];
          char v10 = [v9 ignoreLogging];

          if ((v10 & 1) == 0)
          {
            id v7 = (id)[MEMORY[0x263F213C8] identifier];
            os_log_t v41 = (os_log_t)(id)AXLoggerForFacility();

            os_log_type_t v40 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v41, v40))
            {
              id v39 = (id)AXColorizeFormatLog();
              id v38 = (id)_AXStringForArgs();
              os_log_t v37 = v41;
              if (os_log_type_enabled(v37, v40))
              {
                __os_log_helper_16_2_1_8_66((uint64_t)v86, (uint64_t)v38);
                _os_log_impl(&dword_2402B7000, v37, v40, "%{public}@", v86, 0xCu);
              }
              objc_storeStrong((id *)&v37, 0);
              objc_storeStrong(&v38, 0);
              objc_storeStrong(&v39, 0);
            }
            objc_storeStrong((id *)&v41, 0);
          }
          char v85 = 1;
          int v62 = 1;
        }
        else
        {
          int v62 = 0;
        }
        objc_storeStrong(&v42, 0);
      }
      objc_storeStrong(&v49, 0);
      if (!v62)
      {
LABEL_62:
        char v85 = 0;
        int v62 = 1;
      }
    }
    objc_storeStrong(&v83, 0);
  }
  else
  {
    char v85 = 0;
  }
  return v85 & 1;
}

- (void)_accessibilityAVCaptureStarted:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIApplicationAccessibility *)v4 _accessibilitySetCameraIrisOpen:1];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityAVCaptureStopped:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UIApplicationAccessibility *)v4 _accessibilitySetCameraIrisOpen:0];
  objc_storeStrong(location, 0);
}

- (void)_accessibilityFocusDidUpdate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)[location[0] userInfo];
  id v29 = (id)[v9 objectForKey:*MEMORY[0x263F1D1D0]];

  id v28 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityNativeFocusPreferredElement];
  id v27 = (id)[v29 safeValueForKeyPath:@"_request.focusSystem"];
  if (v27)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    int v21 = 838860800;
    int v22 = 48;
    id v23 = __Block_byref_object_copy__5;
    id v24 = __Block_byref_object_dispose__5;
    id v25 = 0;
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    char v16 = __59__UIApplicationAccessibility__accessibilityFocusDidUpdate___block_invoke;
    id v17 = &unk_2650AE390;
    v18[1] = &v19;
    v18[0] = v27;
    AXPerformSafeBlock();
    id v12 = (id)v20[5];
    objc_storeStrong(v18, 0);
    _Block_object_dispose(&v19, 8);
    objc_storeStrong(&v25, 0);
    id v26 = v12;
    id v11 = (id)[v12 safeValueForKey:@"_windowScene"];
    if ([v11 _accessibilityIsFKARunningForFocusItem]) {
      UIAccessibilityPostNotification(*MEMORY[0x263F81308], v28);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v26, 0);
  }
  id v8 = (id)[v29 nextFocusedView];
  [v8 bounds];
  frame.origin.double x = v3;
  frame.origin.double y = v4;
  frame.size.double width = v5;
  frame.size.double height = v6;
  id v7 = (UIView *)(id)[v29 nextFocusedView];
  UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)5, frame, v7);

  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

void __59__UIApplicationAccessibility__accessibilityFocusDidUpdate___block_invoke(uint64_t a1)
{
  id v1 = (id)[MEMORY[0x263F1CCA8] sceneComponentForFocusSystem:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  CGFloat v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (void)_loadAllAccessibilityInformation
{
  id v2 = (id)[MEMORY[0x263F08B88] callStackSymbols];
  _AXAssert();

  id v3 = (id)objc_msgSend(MEMORY[0x263F811B8], "sharedInstance", v2);
  [v3 setNeedsLoadAccessibilityInformation];
}

- (void)_accessibilityInitialize
{
  char v16 = self;
  SEL v15 = a2;
  BOOL v14 = _AXSApplicationAccessibilityEnabled() != 0;
  BOOL v13 = 0;
  BOOL v6 = 0;
  if ((_UIAccessibilityStartedWithInitialization() & 1) == 0)
  {
    BOOL v6 = 0;
    if ((_AXStatusEnabled & 1) == 0) {
      BOOL v6 = v14;
    }
  }
  BOOL v13 = v6;
  if ((_AXStatusEnabled & 1) == 0) {
    _AXStatusEnabled = v14;
  }
  _AXAddToElementCache();
  if (objc_opt_respondsToSelector()) {
    [(id)*MEMORY[0x263F1D020] performSelector:sel_accessibilityInitialize];
  }
  v7[1] = (id)MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke;
  id v11 = &__block_descriptor_33_e5_v8__0l;
  BOOL v12 = v13;
  AXPerformBlockOnMainThreadAfterDelay();
  if ((_accessibilityInitialize_DidRegister & 1) == 0)
  {
    v7[0] = (id)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v7[0], "addObserver:selector:name:object:", v16, sel__accessibilityAVCaptureStarted_, @"AVCaptureSessionDidStartRunningNotification");
    [v7[0] addObserver:v16 selector:sel__accessibilityAVCaptureStopped_ name:@"AVCaptureSessionDidStopRunningNotification" object:0];
    [v7[0] addObserver:v16 selector:sel__accessibilityFocusDidUpdate_ name:*MEMORY[0x263F1D1C8] object:0];
    [v7[0] addObserver:v16 selector:sel__accessibilityKeyboardDidHide_ name:*MEMORY[0x263F1D410] object:0];
    [v7[0] addObserver:v16 selector:sel__accessibilityKeyboardDidShow_ name:*MEMORY[0x263F1D418] object:0];
    id v5 = (id)[MEMORY[0x263F08A00] defaultCenter];
    uint64_t v3 = *MEMORY[0x263F7E858];
    id v4 = (id)[MEMORY[0x263F08A48] mainQueue];
    id v2 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v3, 0);

    _accessibilityInitialize_DidRegister = 1;
    objc_storeStrong(v7, 0);
  }
}

void __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke(uint64_t a1)
{
  id v4 = (id)[(id)*MEMORY[0x263F1D020] delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v2 = (id)[(id)*MEMORY[0x263F1D020] delegate];
    [v2 performSelector:sel_accessibilityInitialize];
  }
  if (*(unsigned char *)(a1 + 32))
  {
    id v1 = (id)[MEMORY[0x263F811B8] sharedInstance];
    [v1 setNeedsLoadAccessibilityInformation];
  }
}

void __54__UIApplicationAccessibility__accessibilityInitialize__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  ForceKeyboardRebuild = 1;
  objc_storeStrong(location, 0);
}

- (__GSKeyboard)GSKeyboardForHWLayout:(id)a3 senderID:(unint64_t)a4 forceRebuild:(BOOL)a5 createIfNeeded:(BOOL)a6
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v19 = a4;
  BOOL v18 = a5;
  BOOL v17 = a6;
  if ((ForceKeyboardRebuild & 1) != 0 && v19 == 0x8000000817319373)
  {
    BOOL v18 = 1;
    ForceKeyboardRebuild = 0;
    id v16 = (id)AXLogCommon();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      log = v16;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_impl(&dword_2402B7000, log, type, "Force rebuilding keyboard because TextInput changed observed and VO SenderID causes too much caching", v14, 2u);
    }
    objc_storeStrong(&v16, 0);
  }
  v13.receiver = v21;
  v13.super_class = (Class)UIApplicationAccessibility;
  id v7 = [(UIApplicationAccessibility *)&v13 GSKeyboardForHWLayout:location[0] senderID:v19 forceRebuild:v18 createIfNeeded:v17];
  objc_storeStrong(location, 0);
  return v7;
}

- (void)dealloc
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = (id)[MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v3[0], "removeObserver:name:object:", v4, *MEMORY[0x263F1D410]);
  [v3[0] removeObserver:v4 name:*MEMORY[0x263F1D418] object:0];
  [v3[0] removeObserver:v4 name:*MEMORY[0x263F1D1C8] object:0];
  [v3[0] removeObserver:v4 name:@"AVCaptureSessionDidStartRunningNotification" object:0];
  [v3[0] removeObserver:v4 name:@"AVCaptureSessionDidStopRunningNotification" object:0];
  [(UIApplicationAccessibility *)v4 _accessibilityUnregister];
  objc_storeStrong(v3, 0);
  v2.receiver = v4;
  v2.super_class = (Class)UIApplicationAccessibility;
  [(UIApplicationAccessibility *)&v2 dealloc];
}

- (id)_accessibilityResponderElementForFocus
{
  return -[UIApplicationAccessibility _accessibilityResponderElement:](self, "_accessibilityResponderElement:", 1, a2, self);
}

- (id)_accessibilityResponderElement
{
  return -[UIApplicationAccessibility _accessibilityResponderElement:](self, "_accessibilityResponderElement:", 0, a2, self);
}

- (BOOL)_accessibilityResetAndClearNativeFocusSystem
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v27 = self;
  SEL v26 = a2;
  uint64_t v21 = 0;
  int v22 = &v21;
  int v23 = 0x20000000;
  int v24 = 32;
  char v25 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = [(UIApplicationAccessibility *)v27 _accessibilityFocusableScenes];
  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    unint64_t v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v7);
      oslog[1] = (os_log_t)MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __74__UIApplicationAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke;
      BOOL v17 = &unk_2650AE768;
      v18[0] = v20;
      v18[1] = &v21;
      AXPerformSafeBlock();
      objc_storeStrong(v18, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        uint64_t v7 = 0;
        unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  oslog[0] = (os_log_t)(id)AXLogFocusEngine();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    id v4 = (id)NSStringFromBOOL();
    id v11 = v4;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v28, (uint64_t)v11, (uint64_t)v27);
    _os_log_debug_impl(&dword_2402B7000, oslog[0], type, "reset and clear focus system: %@, app: %@", v28, 0x16u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  char v3 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return v3 & 1;
}

void __74__UIApplicationAccessibility__accessibilityResetAndClearNativeFocusSystem__block_invoke(void *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  char v5 = 0;
  objc_opt_class();
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  v6[0] = v3;
  BOOL v1 = 1;
  if ((*(unsigned char *)(*(void *)(a1[5] + 8) + 24) & 1) == 0) {
    BOOL v1 = -[UIWindowSceneAccessibility _accessibilityResetAndClearNativeFocusSystem](v6[0]);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v1;
  objc_storeStrong(v6, 0);
}

- (BOOL)_accessibilityUpdateNativeFocusImmediately
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v30 = self;
  SEL v29 = a2;
  uint64_t v24 = 0;
  char v25 = &v24;
  int v26 = 0x20000000;
  int v27 = 32;
  char v28 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = [(UIApplicationAccessibility *)v30 _accessibilityFocusableScenes];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(__b[1] + 8 * v9);
      oslog[1] = (os_log_t)MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      unint64_t v19 = __72__UIApplicationAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke;
      id v20 = &unk_2650AE768;
      v21[0] = v23;
      v21[1] = &v24;
      AXPerformSafeBlock();
      objc_storeStrong(v21, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  oslog[0] = (os_log_t)(id)AXLogFocusEngine();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    id v5 = (id)NSStringFromBOOL();
    id v14 = v5;
    uint64_t v6 = v30;
    id v4 = [(UIApplicationAccessibility *)v30 _accessibilityNativeFocusElement];
    id v13 = v4;
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v31, (uint64_t)v14, (uint64_t)v6, (uint64_t)v13);
    _os_log_debug_impl(&dword_2402B7000, oslog[0], type, "did update native focus system: %@, app: %@, newElement: %@", v31, 0x20u);

    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong((id *)oslog, 0);
  char v3 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return v3 & 1;
}

void __72__UIApplicationAccessibility__accessibilityUpdateNativeFocusImmediately__block_invoke(void *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  char v5 = 0;
  objc_opt_class();
  id v4 = (id)__UIAccessibilityCastAsSafeCategory();
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  v6[0] = v3;
  char updated = 1;
  if ((*(unsigned char *)(*(void *)(a1[5] + 8) + 24) & 1) == 0) {
    char updated = -[UIWindowSceneAccessibility _accessibilityUpdateNativeFocusImmediately](v6[0]);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = updated & 1;
  objc_storeStrong(v6, 0);
}

- (void)_accessibilitySetFocusEnabledInApplication:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  id location = (id)AXLogFocusEngine();
  os_log_type_t v8 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (id)[NSNumber numberWithBool:v10];
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v4, (uint64_t)v12);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, v8, "Setting focus %@ in application %@", v13, 0x16u);
  }
  objc_storeStrong(&location, 0);
  id v3 = [(UIApplicationAccessibility *)v12 _accessibilityFocusedScreen];
  id v7 = (id)[v3 safeValueForKey:@"_preferredFocusedWindow"];

  if ([v7 conformsToProtocol:&unk_26F490598])
  {
    id v5 = v7;
    BOOL v6 = v10;
    AXPerformSafeBlock();
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(&v7, 0);
}

void __73__UIApplicationAccessibility__accessibilitySetFocusEnabledInApplication___block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:*(void *)(a1 + 32)];
  [v2 _setEnabled:*(unsigned char *)(a1 + 40) & 1];
}

- (id)_axActiveEmojiSearchField
{
  location[1] = a1;
  if (a1)
  {
    id v6 = (id)[MEMORY[0x263F1C760] activeKeyboardSceneDelegate];
    id v5 = (id)[v6 safeValueForKey:@"_systemInputAssistantViewController"];
    id v4 = (id)[v5 safeValueForKey:@"emojiSearchViewController"];
    id v3 = (id)[v4 safeValueForKey:@"emojiSearchView"];
    location[0] = (id)[v3 safeValueForKey:@"searchTextField"];

    if (([location[0] safeBoolForKey:@"isActive"] & 1) == 0) {
      objc_storeStrong(location, 0);
    }
    id v8 = location[0];
    objc_storeStrong(location, 0);
  }
  else
  {
    id v8 = 0;
  }
  BOOL v1 = v8;

  return v1;
}

- (id)_accessibilityResponderElement:(BOOL)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  v94 = self;
  SEL v93 = a2;
  BOOL v92 = a3;
  id v91 = -[UIApplicationAccessibility _axActiveEmojiSearchField](self);
  if (v91)
  {
    id v95 = v91;
    int v90 = 1;
    goto LABEL_90;
  }
  id v89 = [(UIApplicationAccessibility *)v94 _accessibilityMainWindow];
  id v88 = (id)[v89 safeValueForKey:@"firstResponder"];
  id location = (id)AXLogAppAccessibility();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v98, (uint64_t)v88);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, type, "First responder: %@", v98, 0xCu);
  }
  objc_storeStrong(&location, 0);
  if (!v88 && ([v89 accessibilityViewIsModal] & 1) == 0)
  {
    id v32 = (id)[(UIApplicationAccessibility *)v94 safeValueForKey:@"keyWindow"];
    id v3 = (id)[v32 safeValueForKey:@"firstResponder"];
    id v4 = v88;
    id v88 = v3;
  }
  if (!v92) {
    goto LABEL_18;
  }
  id v31 = (id)[v88 _accessibilityWindow];
  id v30 = (id)[v31 rootViewController];
  id v85 = (id)[v30 presentedViewController];

  objc_opt_class();
  id v84 = (id)__UIAccessibilityCastAsClass();
  if (!v84 && v85)
  {
    id v5 = (id)[v85 presentedViewController];
    id v6 = v85;
    id v85 = v5;

    objc_opt_class();
    id v7 = (id)__UIAccessibilityCastAsClass();
    id v8 = v84;
    id v84 = v7;
  }
  id v29 = v88;
  uint64_t v77 = MEMORY[0x263EF8330];
  int v78 = -1073741824;
  int v79 = 0;
  id v80 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke;
  os_log_type_t v81 = &unk_2650AE790;
  id v82 = v84;
  id v83 = (id)[v29 _accessibilityFindAncestor:&v77 startWithSelf:1];
  if (!v84 || v83)
  {
    int v90 = 0;
  }
  else
  {
    id v95 = 0;
    int v90 = 1;
  }
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  if (!v90)
  {
LABEL_18:
    if (!v88 && (AXProcessIsInCallService() & 1) == 0)
    {
      id v76 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
      [v76 setSorted:0];
      id v75 = (id)[(UIApplicationAccessibility *)v94 _accessibilityViewChildrenWithOptions:v76];
      memset(__b, 0, sizeof(__b));
      id obj = v75;
      uint64_t v28 = [obj countByEnumeratingWithState:__b objects:v97 count:16];
      if (v28)
      {
        uint64_t v24 = *(void *)__b[2];
        uint64_t v25 = 0;
        unint64_t v26 = v28;
        while (1)
        {
          uint64_t v23 = v25;
          if (*(void *)__b[2] != v24) {
            objc_enumerationMutation(obj);
          }
          id v74 = *(id *)(__b[1] + 8 * v25);
          if (([v74 _accessibilityServesAsFirstResponder] & 1) != 0
            && (id)*MEMORY[0x263F81468] != v74
            && ([(id)*MEMORY[0x263F81468] _accessibilityIsDescendantOfElement:v74] & 1) == 0)
          {
            break;
          }
          ++v25;
          if (v23 + 1 >= v26)
          {
            uint64_t v25 = 0;
            unint64_t v26 = [obj countByEnumeratingWithState:__b objects:v97 count:16];
            if (!v26) {
              goto LABEL_29;
            }
          }
        }
        objc_storeStrong(&v88, v74);
        int v90 = 2;
      }
      else
      {
LABEL_29:
        int v90 = 0;
      }

      objc_storeStrong(&v75, 0);
      objc_storeStrong(&v76, 0);
    }
    uint64_t v66 = 0;
    os_log_type_t v67 = (id *)&v66;
    int v68 = 838860800;
    int v69 = 48;
    id v70 = __Block_byref_object_copy__5;
    id v71 = __Block_byref_object_dispose__5;
    id v72 = 0;
    id v65 = (id)[v88 _accessibilityResponderElement];
    if (v65)
    {
      CFTypeID TypeID = AXUIElementGetTypeID();
      if (TypeID == CFGetTypeID(v65))
      {
        id v95 = v65;
        int v90 = 1;
LABEL_88:
        objc_storeStrong(&v65, 0);
        _Block_object_dispose(&v66, 8);
        objc_storeStrong(&v72, 0);
        goto LABEL_89;
      }
      char v64 = 0;
      objc_opt_class();
      LOBYTE(v21) = 0;
      if (objc_opt_isKindOfClass()) {
        int v21 = [v65 _accessibilityViewIsVisible] ^ 1;
      }
      char v64 = v21 & 1;
      char v20 = 1;
      if ((v21 & 1) == 0) {
        char v20 = [v65 accessibilityElementsHidden];
      }
      char v64 = v20 & 1;
      if ((([v65 isAccessibilityElement] & 1) != 0
         || ([v65 _accessibilityIsRemoteElement] & 1) != 0)
        && (v64 & 1) == 0)
      {
        objc_storeStrong(v67 + 5, v65);
        id v95 = -[UIApplicationAccessibility _accessibilityValidatedResponderForExistingGoodResponder:forFocus:](v94, v67[5], v92);
        int v90 = 1;
        goto LABEL_88;
      }
    }
    while (1)
    {
      LOBYTE(v19) = 0;
      if (v88)
      {
        objc_opt_class();
        int v19 = objc_opt_isKindOfClass() ^ 1;
      }
      if ((v19 & 1) == 0) {
        break;
      }
      id v9 = (id)[v88 nextResponder];
      id v10 = v88;
      id v88 = v9;
    }
    if (v88)
    {
      id v63 = v88;
      id v62 = 0;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong(&v62, v88);
      }
      while (v62)
      {
        if (([v62 _accessibilityIsFrameOutOfBounds] & 1) == 0
          && ([v62 _accessibilityViewIsVisible] & 1) != 0)
        {
          if (([v62 isAccessibilityElement] & 1) != 0
            || ([v62 _accessibilityCanBeFirstResponderWhenNotAnElement] & 1) != 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v61 = (id)[v62 safeValueForKey:@"_accessibilityMockParent"];
              if (v61 && ([v61 isAccessibilityElement] & 1) != 0)
              {
                objc_storeStrong(v67 + 5, v61);
                int v90 = 7;
              }
              else
              {
                int v90 = 0;
              }
              objc_storeStrong(&v61, 0);
              if (v90) {
                break;
              }
            }
            objc_storeStrong(v67 + 5, v62);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            char v60 = 0;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v59 = (id)[v62 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
              if (!v59 || ([v59 _accessibilityHasOrderedChildren] & 1) == 0) {
                goto LABEL_70;
              }
              char v60 = 1;
              uint64_t v54 = 0;
              id v55 = &v54;
              int v56 = 0x20000000;
              int v57 = 32;
              char v58 = 0;
              id v18 = v59;
              uint64_t v48 = MEMORY[0x263EF8330];
              int v49 = -1073741824;
              int v50 = 0;
              char v51 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_2;
              id v52 = &unk_2650AE7B8;
              v53[0] = v62;
              v53[1] = &v66;
              v53[2] = &v54;
              [v18 accessibilityEnumerateContainerElementsUsingBlock:&v48];
              if (v55[3])
              {
                int v90 = 0;
              }
              else
              {
                AXPerformBlockOnMainThreadAfterDelay();
                objc_storeStrong(v67 + 5, 0);
                int v90 = 7;
              }
              objc_storeStrong(v53, 0);
              _Block_object_dispose(&v54, 8);
              if (!v90) {
LABEL_70:
              }
                int v90 = 0;
              objc_storeStrong(&v59, 0);
              if (v90) {
                break;
              }
            }
            os_log_type_t v47 = 0;
            os_log_type_t v47 = (void *)[v62 accessibilityElementCount];
            if ((uint64_t)v47 > 0 && v47 != (void *)0x7FFFFFFFFFFFFFFFLL)
            {
              id v46 = v62;
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) == 0 || (v60)
              {
                uint64_t v41 = 0;
                id v42 = &v41;
                int v43 = 0x20000000;
                int v44 = 32;
                char v45 = 0;
                id v17 = v67[5];
                uint64_t v35 = MEMORY[0x263EF8330];
                int v36 = -1073741824;
                int v37 = 0;
                id v38 = __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_4;
                id v39 = &unk_2650AE7E0;
                v40[3] = v47;
                v40[0] = v63;
                v40[1] = &v66;
                v40[2] = &v41;
                [v17 accessibilityEnumerateContainerElementsUsingBlock:&v35];
                int v90 = (v42[3] & 1) != 0 ? 7 : 0;
                objc_storeStrong(v40, 0);
                _Block_object_dispose(&v41, 8);
              }
              else
              {
                id v11 = (id)[v46 accessibilityElementAtIndex:0];
                id v12 = v67[5];
                v67[5] = v11;

                int v90 = 7;
              }
              objc_storeStrong(&v46, 0);
              if (v90) {
                break;
              }
            }
          }
        }
        id v13 = (id)[v62 superview];
        id v14 = v62;
        id v62 = v13;
      }
      if ([v67[5] _accessibilityIsWebDocumentView]) {
        objc_storeStrong(v67 + 5, 0);
      }
      id v34 = -[UIApplicationAccessibility _accessibilityValidatedResponderForExistingGoodResponder:forFocus:](v94, v67[5], v92);
      os_log_t oslog = (os_log_t)(id)AXLogCommon();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_3_1_8_69((uint64_t)v96, (uint64_t)v34);
        _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "Validated first responder: %{sensitive}@", v96, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v95 = v34;
      int v90 = 1;
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v62, 0);
      objc_storeStrong(&v63, 0);
    }
    else
    {
      id v95 = 0;
      int v90 = 1;
    }
    goto LABEL_88;
  }
LABEL_89:
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
LABEL_90:
  objc_storeStrong(&v91, 0);
  int v15 = v95;

  return v15;
}

BOOL __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = location[0];
  id v2 = (id)[a1[4] view];
  BOOL v6 = v5 == v2;

  objc_storeStrong(location, 0);
  return v6;
}

- (id)_accessibilityValidatedResponderForExistingGoodResponder:(char)a3 forFocus:
{
  id v9 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    if (a3)
    {
      id v3 = -[UIApplicationAccessibility _accessibilityValidateResponderForFocus:](v9, location);
      id v4 = location;
      id location = v3;
    }
    id v10 = location;
  }
  else
  {
    id v10 = 0;
  }
  objc_storeStrong(&location, 0);
  id v5 = v10;

  return v5;
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v11 = a3;
  id v10 = a4;
  v9[1] = a1;
  v9[0] = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (id)[location[0] realTableViewCell];
    id v5 = v9[0];
    v9[0] = v4;
  }
  if ([v9[0] isEqual:a1[4]])
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), location[0]);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *id v10 = 1;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_3()
{
}

void __61__UIApplicationAccessibility__accessibilityResponderElement___block_invoke_4(void *a1, void *a2, unint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a3 < a1[7])
  {
    char v9 = 0;
    char v5 = 1;
    if (location[0] != (id)a1[4])
    {
      objc_opt_class();
      BOOL v4 = 0;
      if (objc_opt_isKindOfClass())
      {
        id v10 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
        char v9 = 1;
        BOOL v4 = v10 == (id)a1[4];
      }
      char v5 = v4;
    }
    if (v9) {

    }
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), location[0]);
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityValidateResponderForFocus:(void *)a1
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v99 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v99)
  {
    id v96 = 0;
    id v95 = 0;
    Class v94 = 0;
    Class v94 = NSClassFromString(&cfstr_Uipopoverview.isa);
    Class v93 = 0;
    Class v93 = NSClassFromString(&cfstr_Uitransitionvi.isa);
    Class v92 = 0;
    Class v92 = NSClassFromString(&cfstr_Uidimmingview.isa);
    Class v91 = 0;
    Class v91 = NSClassFromString(&cfstr_Uiformsheetpre.isa);
    id v90 = (id)[v99 _accessibilityWindows];
    memset(__b, 0, sizeof(__b));
    id obj = v90;
    uint64_t v43 = [obj countByEnumeratingWithState:__b objects:v104 count:16];
    if (v43)
    {
      uint64_t v39 = *(void *)__b[2];
      uint64_t v40 = 0;
      unint64_t v41 = v43;
      while (1)
      {
        uint64_t v38 = v40;
        if (*(void *)__b[2] != v39) {
          objc_enumerationMutation(obj);
        }
        id v89 = *(id *)(__b[1] + 8 * v40);
        memset(v86, 0, sizeof(v86));
        id v35 = (id)[v89 subviews];
        id v36 = (id)[v35 reverseObjectEnumerator];

        uint64_t v37 = [v36 countByEnumeratingWithState:v86 objects:v103 count:16];
        if (v37)
        {
          uint64_t v32 = *(void *)v86[2];
          uint64_t v33 = 0;
          unint64_t v34 = v37;
          while (1)
          {
            uint64_t v31 = v33;
            if (*(void *)v86[2] != v32) {
              objc_enumerationMutation(v36);
            }
            id v87 = *(id *)(v86[1] + 8 * v33);
            if (objc_opt_isKindOfClass()) {
              objc_storeStrong(&v96, v87);
            }
            if (objc_opt_isKindOfClass())
            {
              uint64_t v80 = MEMORY[0x263EF8330];
              int v81 = -1073741824;
              int v82 = 0;
              id v83 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke;
              id v84 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              Class v85 = v92;
              id v2 = (id)objc_msgSend(v87, "_accessibilityFindSubviewDescendant:");
              id v3 = v95;
              id v95 = v2;

              uint64_t v74 = MEMORY[0x263EF8330];
              int v75 = -1073741824;
              int v76 = 0;
              uint64_t v77 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_2;
              int v78 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              Class v79 = v94;
              id v4 = (id)objc_msgSend(v87, "_accessibilityFindSubviewDescendant:");
              id v5 = v96;
              id v96 = v4;

              char v72 = 0;
              char isKindOfClass = 1;
              if (!v96)
              {
                id v73 = (id)[v95 safeValueForKey:@"delegate"];
                char v72 = 1;
                char isKindOfClass = objc_opt_isKindOfClass();
              }
              if (v72) {

              }
              if (isKindOfClass)
              {
                int v97 = 4;
                goto LABEL_26;
              }
            }
            if (objc_opt_isKindOfClass())
            {
              objc_storeStrong(&v95, v87);
              uint64_t v66 = MEMORY[0x263EF8330];
              int v67 = -1073741824;
              int v68 = 0;
              int v69 = __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_3;
              id v70 = &__block_descriptor_40_e8_B16__0_8lu32l8;
              Class v71 = v94;
              id v6 = (id)objc_msgSend(v95, "_accessibilityFindSubviewDescendant:");
              id v7 = v96;
              id v96 = v6;

              if (v96) {
                break;
              }
            }
            ++v33;
            if (v31 + 1 >= v34)
            {
              uint64_t v33 = 0;
              unint64_t v34 = [v36 countByEnumeratingWithState:v86 objects:v103 count:16];
              if (!v34) {
                goto LABEL_25;
              }
            }
          }
          int v97 = 4;
        }
        else
        {
LABEL_25:
          int v97 = 0;
        }
LABEL_26:

        ++v40;
        if (v38 + 1 >= v41)
        {
          uint64_t v40 = 0;
          unint64_t v41 = [obj countByEnumeratingWithState:__b objects:v104 count:16];
          if (!v41) {
            break;
          }
        }
      }
    }

    char v65 = 0;
    LOBYTE(v29) = 0;
    if (v96)
    {
      LOBYTE(v29) = 0;
      if (([v96 isHidden] & 1) == 0) {
        int v29 = [location _accessibilityIsDescendantOfElement:v96] ^ 1;
      }
    }
    char v65 = v29 & 1;
    char v64 = 0;
    char v62 = 0;
    char v60 = 0;
    char v58 = 0;
    LOBYTE(v28) = 0;
    if (v95)
    {
      LOBYTE(v28) = 0;
      if (([v95 isHidden] & 1) == 0)
      {
        id v63 = (id)[v95 safeValueForKey:@"delegate"];
        char v62 = 1;
        LOBYTE(v28) = 0;
        if (objc_opt_isKindOfClass())
        {
          id v27 = location;
          id v61 = (id)[v95 safeValueForKey:@"delegate"];
          char v60 = 1;
          id v59 = (id)[v61 safeValueForKey:@"dropShadowView"];
          char v58 = 1;
          int v28 = objc_msgSend(v27, "_accessibilityIsDescendantOfElement:") ^ 1;
        }
      }
    }
    if (v58) {

    }
    if (v60) {
    if (v62)
    }

    char v64 = v28 & 1;
    char v56 = 0;
    if (v65 & 1) != 0 || (LOBYTE(v26) = 0, (v64))
    {
      id v57 = (id)[location _accessibilityWindow];
      char v56 = 1;
      objc_opt_class();
      int v26 = objc_opt_isKindOfClass() ^ 1;
    }
    if (v56) {

    }
    if (v26)
    {
      id v55 = (id)[v95 _accessibilityObscuredScreenAllowedViews];
      char v54 = 0;
      char v8 = [(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive];
      char v51 = 0;
      if (v8)
      {
        id v52 = (id)[MEMORY[0x263F1C710] activeKeyboard];
        char v51 = 1;
        id v9 = v52;
      }
      else
      {
        id v9 = 0;
      }
      id v53 = v9;
      if (v51) {

      }
      memset(v49, 0, sizeof(v49));
      id v24 = v55;
      uint64_t v25 = [v24 countByEnumeratingWithState:v49 objects:v102 count:16];
      if (v25)
      {
        uint64_t v21 = *(void *)v49[2];
        uint64_t v22 = 0;
        unint64_t v23 = v25;
        while (1)
        {
          uint64_t v20 = v22;
          if (*(void *)v49[2] != v21) {
            objc_enumerationMutation(v24);
          }
          id v50 = *(id *)(v49[1] + 8 * v22);
          if (([location _accessibilityIsDescendantOfElement:v50] & 1) != 0 || v50 == v53) {
            break;
          }
          ++v22;
          if (v20 + 1 >= v23)
          {
            uint64_t v22 = 0;
            unint64_t v23 = [v24 countByEnumeratingWithState:v49 objects:v102 count:16];
            if (!v23) {
              goto LABEL_61;
            }
          }
        }
        char v54 = 1;
        int v97 = 6;
      }
      else
      {
LABEL_61:
        int v97 = 0;
      }

      if ((v54 & 1) == 0) {
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v53, 0);
      objc_storeStrong(&v55, 0);
    }
    id v48 = (id)[location accessibilityContainer];
    id v47 = location;
    while (v48)
    {
      if (objc_opt_respondsToSelector())
      {
        id v46 = (id)[v48 subviews];
        if ((unint64_t)[v46 count] > 1)
        {
          memset(v44, 0, sizeof(v44));
          id v18 = v46;
          uint64_t v19 = [v18 countByEnumeratingWithState:v44 objects:v101 count:16];
          if (v19)
          {
            uint64_t v15 = *(void *)v44[2];
            uint64_t v16 = 0;
            unint64_t v17 = v19;
            while (1)
            {
              uint64_t v14 = v16;
              if (*(void *)v44[2] != v15) {
                objc_enumerationMutation(v18);
              }
              id v45 = *(id *)(v44[1] + 8 * v16);
              if (v45 != v47 && ([v45 accessibilityViewIsModal] & 1) != 0) {
                break;
              }
              ++v16;
              if (v14 + 1 >= v17)
              {
                uint64_t v16 = 0;
                unint64_t v17 = [v18 countByEnumeratingWithState:v44 objects:v101 count:16];
                if (!v17) {
                  goto LABEL_78;
                }
              }
            }
            objc_storeStrong(&location, 0);
            int v97 = 10;
          }
          else
          {
LABEL_78:
            int v97 = 0;
          }
        }
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v47, v48);
      id v10 = (id)[v48 accessibilityContainer];
      id v11 = v48;
      id v48 = v10;
    }
    id v100 = location;
    int v97 = 1;
    objc_storeStrong(&v47, 0);
    objc_storeStrong(&v48, 0);
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v96, 0);
  }
  else
  {
    id v100 = 0;
    int v97 = 1;
  }
  objc_storeStrong(&location, 0);
  id v12 = v100;

  return v12;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __70__UIApplicationAccessibility__accessibilityValidateResponderForFocus___block_invoke_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilityMainWindow
{
  id v4 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  id v5 = -[UIApplicationAccessibility _accessibilityMainWindowInWindows:](self, "_accessibilityMainWindowInWindows:");

  return v5;
}

- (BOOL)_accessibilityKeyboardIsEmojiInputMode
{
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)[MEMORY[0x263F1C748] sharedInputModeController];
  id v3 = (id)[v5[0] currentInputMode];
  char v4 = [v3 isEmojiInputMode];

  objc_storeStrong(v5, 0);
  return v4 & 1;
}

- (id)_accessibilityMainWindowInWindows:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v52 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!_accessibilityMainWindowInWindows__AlertWindows)
  {
    uint64_t v3 = [objc_allocWithZone(MEMORY[0x263EFF9C0]) init];
    char v4 = (void *)_accessibilityMainWindowInWindows__AlertWindows;
    _accessibilityMainWindowInWindows__AlertWindows = v3;

    id v50 = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"SBTransientOverlayWindow", @"SBBannerWindow", @"SBAlertItemWindow", 0);
    memset(__b, 0, sizeof(__b));
    id obj = v50;
    uint64_t v34 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
    if (v34)
    {
      uint64_t v30 = *(void *)__b[2];
      uint64_t v31 = 0;
      unint64_t v32 = v34;
      while (1)
      {
        uint64_t v29 = v31;
        if (*(void *)__b[2] != v30) {
          objc_enumerationMutation(obj);
        }
        aClassName = *(NSString **)(__b[1] + 8 * v31);
        Class v47 = NSClassFromString(aClassName);
        [(id)_accessibilityMainWindowInWindows__AlertWindows axSafelyAddObject:v47];
        ++v31;
        if (v29 + 1 >= v32)
        {
          uint64_t v31 = 0;
          unint64_t v32 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
          if (!v32) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v50, 0);
  }
  id v46 = 0;
  id v45 = 0;
  memset(v43, 0, sizeof(v43));
  id v27 = (id)[location[0] reverseObjectEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:v43 objects:v54 count:16];
  if (v28)
  {
    uint64_t v24 = *(void *)v43[2];
    uint64_t v25 = 0;
    unint64_t v26 = v28;
    while (1)
    {
      uint64_t v23 = v25;
      if (*(void *)v43[2] != v24) {
        objc_enumerationMutation(v27);
      }
      id v44 = *(id *)(v43[1] + 8 * v25);
      if (!-[UIViewAccessibility _accessibilityViewIsActive](v44)
        && (([v44 isHidden] & 1) != 0
         || ([v44 isOpaque] & 1) != 0
         || ([(id)_accessibilityMainWindowInWindows__AlertWindows containsObject:objc_opt_class()] & 1) == 0))
      {
        goto LABEL_37;
      }
      id v42 = (id)[v44 windowScene];
      if (v42 && [v42 activationState] == 1)
      {
        int v41 = 5;
      }
      else
      {
        id v21 = (id)[v44 screen];
        id v20 = (id)[MEMORY[0x263F1C920] mainScreen];
        BOOL v22 = (objc_msgSend(v21, "isEqual:") & 1) != 0;

        if (v22)
        {
          if ([v44 accessibilityElementsHidden])
          {
            int v41 = 5;
          }
          else if ([v44 _accessibilityIsMainWindow])
          {
            id v53 = v44;
            int v41 = 1;
          }
          else
          {
            if (([(id)_accessibilityMainWindowInWindows__AlertWindows containsObject:objc_opt_class()] & 1) == 0)
            {
              if (([v44 _accessibilityCanBeConsideredAsMainWindow] & 1) == 0)
              {
                int v41 = 5;
                goto LABEL_35;
              }
              if (!v45) {
                objc_storeStrong(&v45, v44);
              }
              if (([v44 accessibilityViewIsModal] & 1) == 0)
              {
                int v41 = 0;
                goto LABEL_35;
              }
            }
            objc_storeStrong(&v46, v44);
            int v41 = 4;
          }
        }
        else
        {
          int v41 = 5;
        }
      }
LABEL_35:
      objc_storeStrong(&v42, 0);
      if (v41 && v41 != 5) {
        goto LABEL_40;
      }
LABEL_37:
      ++v25;
      if (v23 + 1 >= v26)
      {
        uint64_t v25 = 0;
        unint64_t v26 = [v27 countByEnumeratingWithState:v43 objects:v54 count:16];
        if (!v26) {
          break;
        }
      }
    }
  }
  int v41 = 0;
LABEL_40:

  if (!v41 || v41 == 4)
  {
    if (!v46)
    {
      id v40 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
      if ([location[0] containsObject:v40]) {
        id v19 = v40;
      }
      else {
        id v19 = v46;
      }
      objc_storeStrong(&v46, v19);
      objc_storeStrong(&v40, 0);
    }
    if (v45)
    {
      if (([v45 accessibilityElementsHidden] & 1) == 0)
      {
        [v45 windowLevel];
        double v18 = v5;
        [v46 windowLevel];
        if (v18 > v6
          || (objc_msgSend(v46, "alpha", v18), v7 == 0.0)
          || ([v46 _accessibilityCanBeConsideredAsMainWindow] & 1) == 0)
        {
          objc_storeStrong(&v46, v45);
        }
      }
    }
    if (!v46)
    {
      AXDeviceGetMainScreenPixelBounds();
      uint64_t v37 = v8;
      uint64_t v38 = v9;
      *(void *)&long long v39 = v10;
      *((void *)&v39 + 1) = v11;
      long long v36 = v39;
      unint64_t v17 = v52;
      CGPointMake_2();
      id v35 = [(UIApplicationAccessibility *)v17 _accessibilityUIWindowFindWithGlobalPoint:v13];
      if ([location[0] containsObject:v35]) {
        id v16 = v35;
      }
      else {
        id v16 = v46;
      }
      objc_storeStrong(&v46, v16);
      objc_storeStrong(&v35, 0);
    }
    if (!v46 || ([v46 accessibilityElementsHidden] & 1) != 0) {
      objc_storeStrong(&v46, v45);
    }
    id v53 = v46;
    int v41 = 1;
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(location, 0);
  uint64_t v14 = v53;

  return v14;
}

- (id)_accessibilityUIWindowFindWithGlobalPoint:(double)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  double v40 = a2;
  double v41 = a3;
  v39[1] = a1;
  if (a1)
  {
    context = (void *)MEMORY[0x2455E6F00]();
    if (!_accessibilityUIWindowFindWithGlobalPoint__UIWindowClass)
    {
      _accessibilityUIWindowFindWithGlobalPoint__UIWindowClass = objc_opt_class();
      _accessibilityUIWindowFindWithGlobalPoint__FBRootWindowClass = (uint64_t)NSClassFromString(&cfstr_Fbrootwindow.isa);
    }
    v39[0] = (id)[MEMORY[0x263F15770] allContexts];
    float v38 = -3.4028e38;
    id location = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v39[0];
    uint64_t v25 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
    if (v25)
    {
      uint64_t v21 = *(void *)__b[2];
      uint64_t v22 = 0;
      unint64_t v23 = v25;
      while (1)
      {
        uint64_t v20 = v22;
        if (*(void *)__b[2] != v21) {
          objc_enumerationMutation(obj);
        }
        id v36 = *(id *)(__b[1] + 8 * v22);
        id v34 = (id)objc_msgSend(v36, "layer", v16);
        memset(&rect, 0, sizeof(rect));
        [v34 bounds];
        rect.origin.double x = v3;
        rect.origin.double y = v4;
        rect.size.double width = v5;
        rect.size.double height = v6;
        char v31 = 0;
        BOOL v19 = 0;
        if (v34)
        {
          BOOL v19 = 0;
          if (([v34 isHidden] & 1) == 0)
          {
            [v34 opacity];
            BOOL v19 = 0;
            if (v7 > 0.05)
            {
              id v32 = (id)[v34 delegate];
              char v31 = 1;
              BOOL v19 = 0;
              if (objc_opt_isKindOfClass())
              {
                objc_msgSend(v34, "convertPoint:fromLayer:", 0, v40, v41);
                point.double x = v8;
                point.double y = v9;
                BOOL v19 = 0;
                if (CGRectContainsPoint(rect, point))
                {
                  BOOL v18 = 0;
                  if (rect.size.width > 1.0) {
                    BOOL v18 = rect.size.height > 1.0;
                  }
                  BOOL v19 = v18;
                }
              }
            }
          }
        }
        if (v31) {

        }
        if (v19)
        {
          id v29 = (id)[v34 delegate];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v36 level];
            char v27 = 0;
            LOBYTE(v17) = 0;
            if (v10 > v38)
            {
              LOBYTE(v17) = 0;
              if ([v29 isUserInteractionEnabled])
              {
                [v29 bounds];
                LOBYTE(v17) = 0;
                if (v11 > 1.0)
                {
                  objc_msgSend(v29, "bounds", v11);
                  LOBYTE(v17) = 0;
                  if (v12 > 1.0)
                  {
                    id v28 = (id)objc_msgSend(v29, "hitTest:withEvent:", 0, v40, v41);
                    char v27 = 1;
                    LOBYTE(v17) = 0;
                    if (v28) {
                      int v17 = objc_opt_isKindOfClass() ^ 1;
                    }
                  }
                }
              }
            }
            if (v27) {

            }
            if (v17)
            {
              objc_storeStrong(&location, v29);
              [v36 level];
              float v38 = v13;
            }
          }
          else
          {
            id v16 = v29;
            _AXAssert();
          }
          objc_storeStrong(&v29, 0);
        }
        objc_storeStrong(&v34, 0);
        ++v22;
        if (v20 + 1 >= v23)
        {
          uint64_t v22 = 0;
          unint64_t v23 = [obj countByEnumeratingWithState:__b objects:v43 count:16];
          if (!v23) {
            break;
          }
        }
      }
    }

    id v42 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(v39, 0);
  }
  else
  {
    id v42 = 0;
  }
  uint64_t v14 = v42;

  return v14;
}

- (id)_accessibilityAllWindowsOnlyVisibleWindows:(BOOL)a3
{
  return (id)[MEMORY[0x263F1CBC8] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:a3];
}

- (id)_accessibilityElementsForSearchParameter:(id)a3
{
  unint64_t v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = (id)[location[0] objectForKey:@"searchText"];
  id v5 = (id)[location[0] objectForKey:@"resultLimit"];
  uint64_t v6 = [v5 integerValue];

  uint64_t v23 = v6;
  if (!v6) {
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  BOOL v19 = __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke;
  uint64_t v20 = &unk_2650AE828;
  id v21 = v24;
  id v22 = (id)MEMORY[0x2455E7040](&v16);
  id v15 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  double v11 = __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke_2;
  double v12 = &unk_2650AE850;
  id v14 = v22;
  id v13 = v24;
  [v15 setLeafNodePredicate:&v8];
  id v7 = (id)[(UIApplicationAccessibility *)v26 _accessibilityLeafDescendantsWithCount:v23 + 1 options:v15];
  id v4 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);

  return v4;
}

BOOL __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  v6[0] = (id)[location[0] _accessibilityAXAttributedLabel];
  if ([v6[0] length]) {
    BOOL v9 = [v6[0] rangeOfString:a1[4] options:1] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v9 = 0;
  }
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

uint64_t __71__UIApplicationAccessibility__accessibilityElementsForSearchParameter___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = 0;
  if ([location[0] isAccessibilityElement]) {
    char v4 = (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)automationElements
{
  return [(UIApplicationAccessibility *)self _accessibilityWindows];
}

- (id)_accessibilityWindowsIgnoringWindowsWithHiddenElements:(BOOL)a3
{
  uint64_t v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  int v9 = 838860800;
  int v10 = 48;
  double v11 = __Block_byref_object_copy__5;
  double v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  AXPerformSafeBlock();
  if (v14)
  {
    id v3 = (id)objc_msgSend((id)v8[5], "ax_filteredArrayUsingBlock:", &__block_literal_global_827);
    char v4 = (void *)v8[5];
    v8[5] = (uint64_t)v3;
  }
  id v6 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  objc_storeStrong(&v13, 0);

  return v6;
}

void __85__UIApplicationAccessibility__accessibilityWindowsIgnoringWindowsWithHiddenElements___block_invoke(uint64_t a1)
{
  id v1 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;
}

uint64_t __85__UIApplicationAccessibility__accessibilityWindowsIgnoringWindowsWithHiddenElements___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v3 = [location[0] accessibilityElementsHidden] ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityWindows
{
  return -[UIApplicationAccessibility _accessibilityWindowsIgnoringWindowsWithHiddenElements:](self, "_accessibilityWindowsIgnoringWindowsWithHiddenElements:", 1, a2, self);
}

- (id)_accessibilityFindContainerAccessibleElement:(char)a3 first:(char)a4 focus:(char)a5 allowScrolling:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v46 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  char v44 = a3 & 1;
  char v43 = a4 & 1;
  char v42 = a5 & 1;
  if (v46)
  {
    uint64_t v34 = 0;
    id v35 = (id *)&v34;
    int v36 = 838860800;
    int v37 = 48;
    float v38 = __Block_byref_object_copy__5;
    long long v39 = __Block_byref_object_dispose__5;
    id v40 = 0;
    if (([location isAccessibilityOpaqueElementProvider] & 1) != 0
      && ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0)
    {
      if ((v42 & 1) == 0) {
        [location _accessibilitySetShouldPreventOpaqueScrolling:1];
      }
      char v32 = 0;
      char v30 = 0;
      char v28 = 0;
      if (v43)
      {
        id v33 = (id)[location _accessibilityFirstOpaqueElementForFocus];
        char v32 = 1;
        objc_storeStrong(v35 + 5, v33);
      }
      else
      {
        if (v44)
        {
          id v31 = (id)[location _accessibilityFirstOpaqueElement];
          char v30 = 1;
          id v12 = v31;
        }
        else
        {
          id v29 = (id)[location _accessibilityLastOpaqueElement];
          char v28 = 1;
          id v12 = v29;
        }
        objc_storeStrong(v35 + 5, v12);
      }
      if (v28) {

      }
      if (v30) {
      if (v32)
      }

      [location _accessibilitySetShouldPreventOpaqueScrolling:0];
      id v27 = (id)AXLogFirstElement();
      os_log_type_t v26 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEBUG))
      {
        int v10 = [v35[5] isAccessibilityElement] & 1;
        char v11 = [v35[5] _accessibilityHasOrderedChildren];
        __os_log_helper_16_3_3_4_0_4_0_8_65((uint64_t)v48, v10, v11 & 1, (uint64_t)v35[5]);
        _os_log_debug_impl(&dword_2402B7000, (os_log_t)v27, v26, "Opaque element (is element %i is container %i): %{private}@", v48, 0x18u);
      }
      objc_storeStrong(&v27, 0);
    }
    else
    {
      id v9 = location;
      uint64_t v5 = 0;
      if ((v44 & 1) == 0) {
        uint64_t v5 = 2;
      }
      uint64_t v8 = v5;
      uint64_t v16 = MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      BOOL v19 = __102__UIApplicationAccessibility__accessibilityFindContainerAccessibleElement_first_focus_allowScrolling___block_invoke;
      uint64_t v20 = &unk_2650AE898;
      v22[1] = &v34;
      id v21 = location;
      v22[0] = v46;
      char v23 = v44 & 1;
      char v24 = v43 & 1;
      char v25 = v42 & 1;
      [v9 accessibilityEnumerateContainerElementsWithOptions:v8 usingBlock:&v16];
      objc_storeStrong(v22, 0);
      objc_storeStrong(&v21, 0);
    }
    id v47 = v35[5];
    int v41 = 1;
    _Block_object_dispose(&v34, 8);
    objc_storeStrong(&v40, 0);
  }
  else
  {
    id v47 = 0;
    int v41 = 1;
  }
  objc_storeStrong(&location, 0);
  id v6 = v47;

  return v6;
}

void __102__UIApplicationAccessibility__accessibilityFindContainerAccessibleElement_first_focus_allowScrolling___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v36 = a3;
  id v35 = a4;
  uint64_t v34 = a1;
  if (([location[0] isAccessibilityElement] & 1) == 0
    || (uint64_t v4 = [location[0] accessibilityTraits], (v4 & *MEMORY[0x263F813E8]) != 0)
    || ([location[0] _accessibilityIsNotFirstElement] & 1) != 0)
  {
    if (location[0] == *(id *)(a1 + 32))
    {
      _AXAssert();
      *id v35 = 1;
    }
    else if (([location[0] isAccessibilityOpaqueElementProvider] & 1) != 0 {
           && ([(id)*MEMORY[0x263F1D020] _accessibilityWantsOpaqueElementProviders] & 1) != 0
    }
           || [location[0] accessibilityElementCount] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v5 = (id)-[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](*(void *)(a1 + 40), location[0], *(unsigned char *)(a1 + 56) & 1, *(unsigned char *)(a1 + 57) & 1, *(unsigned char *)(a1 + 58) & 1);
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v5;

      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        *id v35 = 1;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (id)*MEMORY[0x263F81468] == location[0]
        || ([(id)*MEMORY[0x263F81468] _accessibilityIsDescendantOfElement:location[0]] & 1) != 0)
      {
        objc_opt_class();
        char v27 = 0;
        char v25 = 0;
        if (objc_opt_isKindOfClass())
        {
          id v19 = location[0];
          id v28 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
          char v27 = 1;
          id v26 = (id)objc_msgSend(v19, "_accessibilityViewChildrenWithOptions:");
          char v25 = 1;
          id v9 = v26;
        }
        else
        {
          id v9 = 0;
        }
        id v29 = v9;
        if (v25) {

        }
        if (v27) {
        memset(__b, 0, sizeof(__b));
        }
        id v17 = v29;
        uint64_t v18 = [v17 countByEnumeratingWithState:__b objects:v38 count:16];
        if (v18)
        {
          uint64_t v14 = *(void *)__b[2];
          uint64_t v15 = 0;
          unint64_t v16 = v18;
          while (1)
          {
            uint64_t v13 = v15;
            if (*(void *)__b[2] != v14) {
              objc_enumerationMutation(v17);
            }
            id v24 = *(id *)(__b[1] + 8 * v15);
            if ([v24 isAccessibilityElement])
            {
              objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v24);
            }
            else
            {
              id v10 = (id)-[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](*(void *)(a1 + 40), v24, *(unsigned char *)(a1 + 56) & 1, *(unsigned char *)(a1 + 57) & 1, *(unsigned char *)(a1 + 58) & 1);
              uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
              id v12 = *(void **)(v11 + 40);
              *(void *)(v11 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v10;
            }
            if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
              break;
            }
            ++v15;
            if (v13 + 1 >= v16)
            {
              uint64_t v15 = 0;
              unint64_t v16 = [v17 countByEnumeratingWithState:__b objects:v38 count:16];
              if (!v16) {
                goto LABEL_44;
              }
            }
          }
          *id v35 = 1;
        }
LABEL_44:

        objc_storeStrong(&v29, 0);
      }
      else
      {
        char v8 = *(unsigned char *)(a1 + 56);
        char v32 = 0;
        char v30 = 0;
        if (v8)
        {
          id v33 = (id)[location[0] _accessibilityFirstElement];
          char v32 = 1;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v33);
        }
        else
        {
          id v31 = (id)[location[0] _accessibilityLastElement];
          char v30 = 1;
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v31);
        }
        if (v30) {

        }
        if (v32) {
        if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
        }
          *id v35 = 1;
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), location[0]);
    *id v35 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)_accessibilitySetAllowsNotificationsDuringSuspension:(BOOL)a3
{
}

- (BOOL)_accessibilityAllowsNotificationsDuringSuspension
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  id v2 = (id)[(UIApplicationAccessibility *)self _accessibilityValueForKey:@"AXAppAllowsNotifications"];
  BOOL v4 = v2 == 0;

  if (v4)
  {
    if (-[objc_class safeBoolForKey:](NSClassFromString(&cfstr_Uiviewservices.isa), "safeBoolForKey:", @"hasActiveSessions") & 1) == 0|| ((location[0] = -[UIApplicationAccessibility _accessibilityMainWindow](v7, "_accessibilityMainWindow"), ([location[0] isHidden])|| (NSClassFromString(&cfstr_Uihostedwindow_0.isa), (objc_opt_isKindOfClass() & 1) == 0)&& (objc_msgSend(location[0], "safeBoolForKey:", @"_isHostedInAnotherProcess") & 1) == 0? (int v5 = 0): (v8 = 1, int v5 = 1), objc_storeStrong(location, 0), !v5))
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = [(UIApplicationAccessibility *)v7 _accessibilityBoolValueForKey:@"AXAppAllowsNotifications"] & 1;
  }
  return v8 & 1;
}

- (id)_accessibilityCellWithRowIndex:(int64_t)a3 column:(int64_t)a4 containingView:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v30 = self;
  SEL v29 = a2;
  int64_t v28 = a3;
  int64_t v27 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v25 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  id v24 = (id)[v25 leafNodePredicate];
  uint64_t v17 = MEMORY[0x263EF8330];
  int v18 = -1073741824;
  int v19 = 0;
  uint64_t v20 = __83__UIApplicationAccessibility__accessibilityCellWithRowIndex_column_containingView___block_invoke;
  id v21 = &unk_2650AE8C0;
  id v22 = v24;
  id v23 = (id)MEMORY[0x2455E7040](&v17);
  [v25 setLeafNodePredicate:v23];
  id v16 = (id)[(UIApplicationAccessibility *)v30 _accessibilityLeafDescendantsWithOptions:v25];
  memset(__b, 0, sizeof(__b));
  id obj = v16;
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(id *)(__b[1] + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        if (v15 == location) {
          break;
        }
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v10) {
          goto LABEL_11;
        }
      }
    }
    id v31 = (id)[v15 accessibilityElementForRow:v28 andColumn:v27];
    int v13 = 1;
  }
  else
  {
LABEL_11:
    int v13 = 0;
  }

  if (!v13) {
    id v31 = 0;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&location, 0);
  int v5 = v31;

  return v5;
}

uint64_t __83__UIApplicationAccessibility__accessibilityCellWithRowIndex_column_containingView___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = 1;
  if (([location[0] isAccessibilityOpaqueElementProvider] & 1) == 0) {
    char v4 = (*(uint64_t (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 parameters:(id)a6
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  BOOL v10 = a4;
  BOOL v9 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v7 = [(UIApplicationAccessibility *)v13 _accessibilityElementFirst:v11 last:v10 forFocus:v9 allowScrolling:0 parameters:location];
  objc_storeStrong(&location, 0);

  return v7;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 parameters:(id)a7
{
  int64_t v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  BOOL v24 = a4;
  BOOL v23 = a5;
  BOOL v22 = a6;
  id location = 0;
  objc_storeStrong(&location, a7);
  id v10 = (id)[location objectForKey:*MEMORY[0x263F21610]];
  char v11 = [v10 BOOLValue];

  SEL v12 = v27;
  BOOL v13 = v25;
  BOOL v14 = v24;
  BOOL v15 = v23;
  BOOL v16 = v22;
  char v19 = 0;
  char v17 = 0;
  if (v11)
  {
    id v20 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptionsHonoringGroups];
    char v19 = 1;
    id v9 = v20;
  }
  else
  {
    id v18 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
    char v17 = 1;
    id v9 = v18;
  }
  id v28 = [(UIApplicationAccessibility *)v12 _accessibilityElementFirst:v13 last:v14 forFocus:v15 allowScrolling:v16 traversalOptions:v9];
  if (v17) {

  }
  if (v19) {
  objc_storeStrong(&location, 0);
  }
  id v7 = v28;

  return v7;
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5 allowScrolling:(BOOL)a6 traversalOptions:(id)a7
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  v135 = self;
  SEL v134 = a2;
  BOOL v133 = a3;
  BOOL v132 = a4;
  BOOL v131 = a5;
  BOOL v130 = a6;
  id location = 0;
  objc_storeStrong(&location, a7);
  id v128 = (id)AXLogFirstElement();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v128, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v149, v133, v132, v131, v130);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)v128, type, "Getting first: %i last: %i forFocus: %i allowScrolling: %i", v149, 0x1Au);
  }
  objc_storeStrong(&v128, 0);
  id v126 = (id)[(UIApplicationAccessibility *)v135 _accessibilityViewChildrenWithOptions:location];
  memset(__b, 0, sizeof(__b));
  id obj = v126;
  uint64_t v57 = [obj countByEnumeratingWithState:__b objects:v148 count:16];
  if (v57)
  {
    uint64_t v53 = *(void *)__b[2];
    uint64_t v54 = 0;
    unint64_t v55 = v57;
    while (1)
    {
      uint64_t v52 = v54;
      if (*(void *)__b[2] != v53) {
        objc_enumerationMutation(obj);
      }
      uint64_t v125 = *(void *)(__b[1] + 8 * v54);
      id v123 = (id)AXLogFirstElement();
      os_log_type_t v122 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v123, OS_LOG_TYPE_DEBUG))
      {
        char v51 = v123;
        __os_log_helper_16_3_1_8_65((uint64_t)v147, v125);
        _os_log_debug_impl(&dword_2402B7000, v51, v122, "Element: %{private}@", v147, 0xCu);
      }
      objc_storeStrong(&v123, 0);
      ++v54;
      if (v52 + 1 >= v55)
      {
        uint64_t v54 = 0;
        unint64_t v55 = [obj countByEnumeratingWithState:__b objects:v148 count:16];
        if (!v55) {
          break;
        }
      }
    }
  }

  id v121 = (id)[v126 objectEnumerator];
  if (v132)
  {
    id v7 = (id)[v126 reverseObjectEnumerator];
    id v8 = v121;
    id v121 = v7;
  }
  Class v120 = 0;
  Class v120 = NSClassFromString(&cfstr_Uidimmingview.isa);
  Class v119 = 0;
  Class v119 = NSClassFromString(&cfstr_Uipopoverview.isa);
  char v118 = 0;
  id v117 = 0;
  memset(v115, 0, sizeof(v115));
  id v49 = v121;
  uint64_t v50 = [v49 countByEnumeratingWithState:v115 objects:v146 count:16];
  if (v50)
  {
    uint64_t v46 = *(void *)v115[2];
    uint64_t v47 = 0;
    unint64_t v48 = v50;
    while (1)
    {
      uint64_t v45 = v47;
      if (*(void *)v115[2] != v46) {
        objc_enumerationMutation(v49);
      }
      id v116 = *(id *)(v115[1] + 8 * v47);
      v108[1] = (id)MEMORY[0x263EF8330];
      int v109 = -1073741824;
      int v110 = 0;
      v111 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke;
      v112 = &__block_descriptor_40_e8_B16__0_8lu32l8;
      Class v113 = v119;
      id v114 = (id)objc_msgSend(v116, "_accessibilityFindAncestor:startWithSelf:");
      if (v114)
      {
        if ([v116 isAccessibilityElement])
        {
          objc_storeStrong(&v117, v116);
        }
        else
        {
          id v9 = -[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](v135, v116, v133, v131, v130);
          id v10 = v117;
          id v117 = v9;
        }
        if (v117)
        {
          v108[0] = (id)AXLogFirstElement();
          os_log_type_t v107 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v108[0], OS_LOG_TYPE_DEBUG))
          {
            char v43 = v108[0];
            os_log_type_t v44 = v107;
            __os_log_helper_16_3_1_8_65((uint64_t)v145, (uint64_t)v117);
            _os_log_debug_impl(&dword_2402B7000, v43, v44, "Got element from popover view: %{private}@", v145, 0xCu);
          }
          objc_storeStrong(v108, 0);
          int v106 = 4;
          goto LABEL_111;
        }
      }
      char v105 = 0;
      char v42 = 0;
      if ([location honorsElementGrouping]) {
        char v42 = [v116 _accessibilityIsGroupedParent];
      }
      char v105 = v42 & 1;
      if (([v116 isAccessibilityElement] & 1) == 0 && (v105 & 1) == 0) {
        break;
      }
      BOOL v85 = 0;
      uint64_t v17 = [v116 accessibilityTraits];
      BOOL v85 = (v17 & *MEMORY[0x263F813E8]) == *MEMORY[0x263F813E8];
      char v84 = 0;
      char v29 = 0;
      if (v133) {
        char v29 = [v116 _accessibilityServesAsFirstElement];
      }
      char v84 = v29 & 1;
      if (v85 || v117 && (v84 & 1) == 0 || v133 && ([v116 _accessibilityIsNotFirstElement] & 1) != 0) {
        goto LABEL_90;
      }
      objc_storeStrong(&v117, v116);
      id v83 = (id)AXLogFirstElement();
      os_log_type_t v82 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v83, OS_LOG_TYPE_DEBUG))
      {
        int64_t v27 = v83;
        os_log_type_t v28 = v82;
        __os_log_helper_16_3_1_8_65((uint64_t)v139, (uint64_t)v117);
        _os_log_debug_impl(&dword_2402B7000, v27, v28, "Got first element: %{private}@", v139, 0xCu);
      }
      objc_storeStrong(&v83, 0);
      if ((v84 & 1) == 0)
      {
LABEL_90:
        char v71 = 0;
        LOBYTE(v24) = 0;
        if (v133)
        {
          LOBYTE(v24) = 0;
          if ((v118 & 1) == 0)
          {
            uint64_t v73 = MEMORY[0x263EF8330];
            int v74 = -1073741824;
            int v75 = 0;
            int v76 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_840;
            uint64_t v77 = &__block_descriptor_40_e8_B16__0_8lu32l8;
            Class v78 = v120;
            id v72 = (id)objc_msgSend(v116, "_accessibilityFindAncestor:startWithSelf:");
            char v71 = 1;
            LOBYTE(v24) = 0;
            if (v72) {
              int v24 = [v116 _accessibilityIsNotFirstElement] ^ 1;
            }
          }
        }
        if (v71) {

        }
        if (v24)
        {
          objc_storeStrong(&v117, v116);
          os_log_t oslog = (os_log_t)(id)AXLogFirstElement();
          os_log_type_t v69 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            BOOL v22 = oslog;
            os_log_type_t v23 = v69;
            __os_log_helper_16_3_1_8_65((uint64_t)v138, (uint64_t)v117);
            _os_log_debug_impl(&dword_2402B7000, v22, v23, "Got dimming view element: %{private}@", v138, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
          char v118 = 1;
        }
LABEL_100:
        char v61 = 0;
        LOBYTE(v21) = 0;
        if (v133)
        {
          LOBYTE(v21) = 0;
          if ((v118 & 1) == 0)
          {
            uint64_t v63 = MEMORY[0x263EF8330];
            int v64 = -1073741824;
            int v65 = 0;
            uint64_t v66 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_841;
            int v67 = &__block_descriptor_40_e8_B16__0_8lu32l8;
            Class v68 = v120;
            id v62 = (id)objc_msgSend(v116, "_accessibilityFindAncestor:startWithSelf:");
            char v61 = 1;
            LOBYTE(v21) = 0;
            if (v62) {
              int v21 = [v116 _accessibilityIsNotFirstElement] ^ 1;
            }
          }
        }
        if (v61) {

        }
        if (v21)
        {
          char v118 = 1;
          objc_storeStrong(&v117, v116);
          os_log_t v60 = (os_log_t)(id)AXLogFirstElement();
          os_log_type_t v59 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            id v20 = v60;
            __os_log_helper_16_3_1_8_65((uint64_t)v137, (uint64_t)v117);
            _os_log_debug_impl(&dword_2402B7000, v20, v59, "Got dimming view element: %{private}@", v137, 0xCu);
          }
          objc_storeStrong((id *)&v60, 0);
        }
        int v106 = 0;
        goto LABEL_111;
      }
      id v81 = (id)AXLogFirstElement();
      os_log_type_t v80 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_DEBUG))
      {
        BOOL v25 = v81;
        os_log_type_t v26 = v80;
        __os_log_helper_16_0_0(v79);
        _os_log_debug_impl(&dword_2402B7000, v25, v26, "Ending now because element serves as first element", v79, 2u);
      }
      objc_storeStrong(&v81, 0);
      int v106 = 4;
LABEL_111:
      objc_storeStrong(&v114, 0);
      if (!v106) {
        int v106 = 0;
      }
      objc_storeStrong(&v116, 0);
      if (v106) {
        goto LABEL_117;
      }
      ++v47;
      if (v45 + 1 >= v48)
      {
        uint64_t v47 = 0;
        unint64_t v48 = [v49 countByEnumeratingWithState:v115 objects:v146 count:16];
        if (!v48) {
          goto LABEL_116;
        }
      }
    }
    id v104 = -[UIApplicationAccessibility _accessibilityFindContainerAccessibleElement:first:focus:allowScrolling:](v135, v116, v133, v131, v130);
    id v103 = (id)AXLogFirstElement();
    os_log_type_t v102 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v103, OS_LOG_TYPE_DEBUG))
    {
      id v40 = v103;
      os_log_type_t v41 = v102;
      __os_log_helper_16_3_1_8_65((uint64_t)v144, (uint64_t)v104);
      _os_log_debug_impl(&dword_2402B7000, v40, v41, "Container accessible element: %{private}@", v144, 0xCu);
    }
    objc_storeStrong(&v103, 0);
    if (v104)
    {
      CFTypeID v39 = CFGetTypeID(v104);
      if (v39 == AXUIElementGetTypeID()
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v104 _accessibilityIsNotFirstElement] & 1) == 0)
      {
        if (!v117)
        {
          objc_storeStrong(&v117, v104);
          id v101 = (id)AXLogFirstElement();
          os_log_type_t v100 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_DEBUG))
          {
            int v37 = v101;
            os_log_type_t v38 = v100;
            __os_log_helper_16_3_1_8_65((uint64_t)v143, (uint64_t)v117);
            _os_log_debug_impl(&dword_2402B7000, v37, v38, "Got remote element: %{private}@", v143, 0xCu);
          }
          objc_storeStrong(&v101, 0);
          int v106 = 4;
          goto LABEL_75;
        }
      }
      else if ((!v117 {
              || v133
      }
              && (([v104 _accessibilityServesAsFirstElement] & 1) != 0
               || ([v116 _accessibilityServesAsFirstElement] & 1) != 0))
             && (!v133 || ([v104 _accessibilityIsNotFirstElement] & 1) == 0))
      {
        if (([v104 isAccessibilityElement] & 1) == 0)
        {
          id v11 = (id)[v104 _accessibilityUnignoredDescendant];
          id v12 = v104;
          id v104 = v11;
        }
        objc_storeStrong(&v117, v104);
        id v99 = (id)AXLogFirstElement();
        os_log_type_t v98 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v99, OS_LOG_TYPE_DEBUG))
        {
          id v35 = v99;
          os_log_type_t v36 = v98;
          __os_log_helper_16_3_1_8_65((uint64_t)v142, (uint64_t)v117);
          _os_log_debug_impl(&dword_2402B7000, v35, v36, "Got element that serves as first element: %{private}@", v142, 0xCu);
        }
        objc_storeStrong(&v99, 0);
      }
    }
    if (v133 && ([v116 _accessibilityServesAsFirstElement] & 1) != 0
      || v131 && ([v116 _accessibilityIsFirstElementForFocus] & 1) != 0)
    {
      if (([v116 _accessibilityHasOrderedChildren] & 1) != 0
        || ([v116 isAccessibilityElement] & 1) == 0)
      {
        id v13 = (id)[v116 _accessibilityUnignoredDescendant];
        id v14 = v116;
        id v116 = v13;
      }
      if (v116)
      {
        objc_storeStrong(&v117, v116);
        id v97 = (id)AXLogFirstElement();
        os_log_type_t v96 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v97, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = v97;
          os_log_type_t v34 = v96;
          __os_log_helper_16_3_1_8_65((uint64_t)v141, (uint64_t)v117);
          _os_log_debug_impl(&dword_2402B7000, v33, v34, "Got element that serves as first element or is first element for focus: %{private}@", v141, 0xCu);
        }
        objc_storeStrong(&v97, 0);
        int v106 = 4;
LABEL_75:
        objc_storeStrong(&v104, 0);
        if (v106) {
          goto LABEL_111;
        }
        goto LABEL_100;
      }
    }
    else
    {
      char v88 = 0;
      BOOL v32 = 0;
      if (v133)
      {
        BOOL v32 = 0;
        if ((v118 & 1) == 0)
        {
          uint64_t v90 = MEMORY[0x263EF8330];
          int v91 = -1073741824;
          int v92 = 0;
          Class v93 = __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_839;
          Class v94 = &__block_descriptor_40_e8_B16__0_8lu32l8;
          Class v95 = v120;
          id v89 = (id)objc_msgSend(v116, "_accessibilityFindAncestor:startWithSelf:");
          char v88 = 1;
          BOOL v32 = v89 != 0;
        }
      }
      if (v88) {

      }
      if (v32)
      {
        objc_storeStrong(&v117, v116);
        id v87 = (id)AXLogFirstElement();
        os_log_type_t v86 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v87, OS_LOG_TYPE_DEBUG))
        {
          char v30 = v87;
          os_log_type_t v31 = v86;
          __os_log_helper_16_3_1_8_65((uint64_t)v140, (uint64_t)v117);
          _os_log_debug_impl(&dword_2402B7000, v30, v31, "Got dimming view element: %{private}@", v140, 0xCu);
        }
        objc_storeStrong(&v87, 0);
        if (([v117 isAccessibilityElement] & 1) == 0)
        {
          id v15 = (id)[v117 _accessibilityUnignoredDescendant];
          id v16 = v117;
          id v117 = v15;
        }
        char v118 = 1;
      }
    }
    int v106 = 0;
    goto LABEL_75;
  }
LABEL_116:
  int v106 = 0;
LABEL_117:

  os_log_t v58 = (os_log_t)(id)AXLogFirstElement();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_3_1_8_65((uint64_t)v136, (uint64_t)v117);
    _os_log_debug_impl(&dword_2402B7000, v58, OS_LOG_TYPE_DEBUG, "Returning %{private}@", v136, 0xCu);
  }
  objc_storeStrong((id *)&v58, 0);
  id v19 = v117;
  int v106 = 1;
  objc_storeStrong(&v117, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v126, 0);
  objc_storeStrong(&location, 0);

  return v19;
}

BOOL __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v5 = (id)[location[0] safeValueForKey:@"standardChromeView"], char v4 = 1, v3 = 1, !v5))
  {
    BOOL v3 = [location[0] accessibilityContainerType] == 10;
  }
  BOOL v7 = v3;
  if (v4) {

  }
  objc_storeStrong(location, 0);
  return v7;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_839(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_840(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __103__UIApplicationAccessibility__accessibilityElementFirst_last_forFocus_allowScrolling_traversalOptions___block_invoke_841(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilityLastElement
{
  return -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](self, "_accessibilityElementFirst:last:forFocus:parameters:", 0, 1, 0, 0, a2, self);
}

- (id)_accessibilityFirstElementForFocusWithOptions:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(UIApplicationAccessibility *)v6 _accessibilityElementFirst:1 last:0 forFocus:1 allowScrolling:0 traversalOptions:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilityFirstElement
{
  return -[UIApplicationAccessibility _accessibilityElementFirst:last:forFocus:parameters:](self, "_accessibilityElementFirst:last:forFocus:parameters:", 1, 0, 0, 0, a2, self);
}

- (id)_accessibilityTitleBarElement
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v23 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  [v23 setSorted:0];
  id v22 = (id)[(UIApplicationAccessibility *)v25 _accessibilityViewChildrenWithOptions:v23];
  memset(__b, 0, sizeof(__b));
  id obj = v22;
  uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(id *)(__b[1] + 8 * v6);
      if (([v21 _accessibilityIsTitleElement] & 1) != 0
        || ([v21 _accessibilityBoolValueForKey:kUIAccessibilityStorageKeyIsTitleElement] & 1) != 0)
      {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v7) {
          goto LABEL_10;
        }
      }
    }
    objc_storeStrong(location, v21);
    int v19 = 2;
  }
  else
  {
LABEL_10:
    int v19 = 0;
  }

  if (location[0])
  {
    id v18 = [(UIApplicationAccessibility *)v25 _accessibilityElementFirst:1 last:0 forFocus:1 allowScrolling:0 parameters:0];
    Class v17 = NSClassFromString(&cfstr_Uipopoverview.isa);
    v10[1] = (id)MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke;
    id v14 = &__block_descriptor_40_e8_B16__0_8lu32l8;
    Class v15 = v17;
    id v16 = (id)objc_msgSend(v18, "_accessibilityFindAncestor:startWithSelf:");
    if (v16)
    {
      v10[0] = (id)objc_msgSend(location[0], "_accessibilityFindAncestor:startWithSelf:");
      if (v16 != v10[0]) {
        objc_storeStrong(location, 0);
      }
      objc_storeStrong(v10, 0);
    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v18, 0);
  }
  id v3 = location[0];
  int v19 = 1;
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);

  return v3;
}

uint64_t __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __59__UIApplicationAccessibility__accessibilityTitleBarElement__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (id)_accessibilitySummaryElement
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v17 = a1;
  if (a1)
  {
    id v16 = (id)[v17 _accessibilityMainWindow];
    id v15 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
    [v15 setSorted:0];
    id v10 = (id)[v17 _accessibilityViewChildrenWithOptions:v15];
    id v14 = (id)[v10 mutableCopyWithZone:0];

    if (v16) {
      [v14 insertObject:v16 atIndex:0];
    }
    id location = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v14;
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(__b[1] + 8 * v6);
        uint64_t v1 = [v12 accessibilityTraits];
        if ((v1 & *MEMORY[0x263F1CF50]) == *MEMORY[0x263F1CF50]) {
          objc_storeStrong(&location, v12);
        }
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    id v18 = location;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    id v18 = 0;
  }
  id v2 = v18;

  return v2;
}

- (id)_accessibilityWindowSections
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = [(UIApplicationAccessibility *)v22 _accessibilityWindows];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(__b[1] + 8 * v9);
      id v4 = v21[0];
      id v6 = (id)[v20 _accessibilityWindowSections];
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __58__UIApplicationAccessibility__accessibilityWindowSections__block_invoke;
      id v17 = &unk_2650AE8E8;
      id v18 = v20;
      id v5 = (id)[v6 axFilterObjectsUsingBlock:&v13];
      objc_msgSend(v4, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v18, 0);
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v3 = v21[0];
  objc_storeStrong(v21, 0);

  return v3;
}

BOOL __58__UIApplicationAccessibility__accessibilityWindowSections__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)[location[0] _accessibilityWindow];
  BOOL v5 = v2 == a1[4];

  objc_storeStrong(location, 0);
  return v5;
}

- (id)_axAllSubviews
{
  id v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)[MEMORY[0x263F089D8] string];
  id v3 = (id)AXUIApplicationWindows();
  id v5 = v6[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");

  id v4 = v6[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);

  return v4;
}

void __44__UIApplicationAccessibility__axAllSubviews__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (void *)a1[4];
  id v4 = (id)[location[0] safeValueForKey:@"_axSubviews"];
  [v3 appendFormat:@"%@\n", v4];

  objc_storeStrong(location, 0);
}

- (id)_accessibilityTextReplacementCandidates
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v31[1] = a1;
  if (a1)
  {
    v31[0] = (id)[MEMORY[0x263F1C738] activeInstance];
    id v30 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v31[0] safeArrayForKey:@"replacementsFromSelectedText"];
    uint64_t v20 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
    if (v20)
    {
      uint64_t v16 = *(void *)__b[2];
      uint64_t v17 = 0;
      unint64_t v18 = v20;
      while (1)
      {
        uint64_t v15 = v17;
        if (*(void *)__b[2] != v16) {
          objc_enumerationMutation(obj);
        }
        id v29 = *(id *)(__b[1] + 8 * v17);
        id v13 = v30;
        id v14 = (id)[v29 safeStringForKey:@"replacementText"];
        objc_msgSend(v13, "axSafelyAddObject:");

        ++v17;
        if (v15 + 1 >= v18)
        {
          uint64_t v17 = 0;
          unint64_t v18 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
          if (!v18) {
            break;
          }
        }
      }
    }

    if (![v30 count])
    {
      id v27 = (id)[(id)*MEMORY[0x263F1D020] _accessibilityFirstResponderForKeyWindow];
      if (!v27)
      {
        id v27 = (id)_UIAccessibilityFocusedElementForAssistiveTech();
      }
      if (objc_opt_respondsToSelector())
      {
        id v26 = (id)[v27 safeStringForKey:@"selectedText"];
        if ([v26 length])
        {
          id v11 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          id v1 = (id)objc_msgSend(v26, "stringByTrimmingCharactersInSet:");
          id v2 = v26;
          id v26 = v1;

          id v12 = (id)[MEMORY[0x263F1C738] activeInstance];
          id v25 = (id)[v12 generateAutocorrectionReplacements:v26];

          if (v25)
          {
            id v24 = (id)[MEMORY[0x263EFFA08] setWithArray:v25];
            memset(v22, 0, sizeof(v22));
            id v9 = v24;
            uint64_t v10 = [v9 countByEnumeratingWithState:v22 objects:v33 count:16];
            if (v10)
            {
              uint64_t v6 = *(void *)v22[2];
              uint64_t v7 = 0;
              unint64_t v8 = v10;
              while (1)
              {
                uint64_t v5 = v7;
                if (*(void *)v22[2] != v6) {
                  objc_enumerationMutation(v9);
                }
                id v23 = *(id *)(v22[1] + 8 * v7);
                id location = (id)[v23 label];
                if (([location isEqualToString:v26] & 1) == 0) {
                  [v30 axSafelyAddObject:location];
                }
                objc_storeStrong(&location, 0);
                ++v7;
                if (v5 + 1 >= v8)
                {
                  uint64_t v7 = 0;
                  unint64_t v8 = [v9 countByEnumeratingWithState:v22 objects:v33 count:16];
                  if (!v8) {
                    break;
                  }
                }
              }
            }

            objc_storeStrong(&v24, 0);
          }
          objc_storeStrong(&v25, 0);
        }
        objc_storeStrong(&v26, 0);
      }
      objc_storeStrong(&v27, 0);
    }
    id v32 = v30;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(v31, 0);
  }
  else
  {
    id v32 = 0;
  }
  id v3 = v32;

  return v3;
}

- (id)_accessibilityTypingCandidates
{
  v18[1] = a1;
  if (a1)
  {
    v18[0] = (id)[MEMORY[0x263EFF980] array];
    id v17 = (id)[MEMORY[0x263F1C738] activeInstance];
    id location = (id)[v17 safeValueForKey:@"m_autocorrectPrompt"];
    if (location)
    {
      if ((UIKeyboardPredictionEnabledForCurrentInputMode() & 1) != 0
        && (NSClassFromString(&cfstr_Uiautocorrecti.isa), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_storeStrong(&location, 0);
      }
      else
      {
        [location setAccessibilityTraits:*MEMORY[0x263F813E0]];
        id v8 = accessibilityLocalizedString(@"typing.correction.view.hint");
        objc_msgSend(location, "setAccessibilityHint:");

        [v18[0] addObject:location];
      }
    }
    if (![v18[0] count])
    {
      id v15 = (id)[v17 safeValueForKey:@"candidateController"];
      id v14 = (id)[v15 safeArrayForKey:@"activeViews"];
      id v6 = (id)[v14 firstObject];
      id v13 = (id)[v6 safeValueForKey:@"primaryGrid"];

      char v11 = 0;
      objc_opt_class();
      id v7 = (id)[v13 safeValueForKey:@"collectionView"];
      id v10 = (id)__UIAccessibilityCastAsClass();

      id v9 = v10;
      objc_storeStrong(&v10, 0);
      id v12 = v9;
      id v3 = v18[0];
      id v5 = (id)[v9 visibleCells];
      id v4 = (id)[v5 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
      objc_msgSend(v3, "axSafelyAddObjectsFromArray:");

      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    id v19 = v18[0];
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(v18, 0);
  }
  else
  {
    id v19 = 0;
  }
  id v1 = v19;

  return v1;
}

- (id)_firstStatusBarElement
{
  return 0;
}

- (id)_lastStatusBarElement
{
  return 0;
}

- (id)_accessibilityStatusBarElements:(BOOL)a3 sorted:(BOOL)a4
{
  return 0;
}

- (BOOL)_accessibilitySoftwareKeyboardCoversElement:(id)a3
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v16 = 0;
  char v14 = 0;
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  BOOL v7 = 0;
  if ([(UIApplicationAccessibility *)v19 _accessibilitySoftwareKeyboardActive])
  {
    BOOL v7 = 0;
    if (![(UIApplicationAccessibility *)v19 _accessibilityElementBelongsToKeyboardWindow:location[0]])
    {
      id v17 = (id)[location[0] _accessibilityParentView];
      char v16 = 1;
      id v15 = (id)[v17 window];
      char v14 = 1;
      BOOL v7 = 0;
      if (v15)
      {
        id v13 = (id)[location[0] _accessibilityParentView];
        char v12 = 1;
        id v11 = (id)[v13 window];
        char v10 = 1;
        [v11 windowLevel];
        double v6 = v3;
        id v9 = (id)AXUIKeyboardWindow();
        char v8 = 1;
        [v9 windowLevel];
        BOOL v7 = v6 <= v4;
      }
    }
  }
  BOOL v20 = v7;
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v14) {
  if (v16)
  }

  objc_storeStrong(location, 0);
  return v20;
}

- (CGRect)_accessibilitySoftwareKeyboardAccessibilityFrame
{
  id v10[2] = self;
  v10[1] = (id)a2;
  v10[0] = (id)[MEMORY[0x263F1C710] activeKeyboard];
  [v10[0] accessibilityFrame];
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  objc_storeStrong(v10, 0);
  double v6 = v11;
  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (BOOL)_accessibilityElementBelongsToKeyboardWindow:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)AXUIAllKeyboardWindows();
  id v4 = (id)[location[0] _accessibilityParentView];
  id v6 = (id)[v4 window];

  char v5 = [v7 containsObject:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilitySoftwareKeyboardActive
{
  if ([NSClassFromString(&cfstr_Uidictationcon.isa) safeBoolForKey:@"isRunning"])return 1; {
  else
  }
    return UIAXKeyboardIsOnScreen() & 1;
}

- (BOOL)_accessibilityHardwareKeyboardActive
{
  id v3 = (id)[MEMORY[0x263F1C738] activeInstance];
  char v4 = [v3 isInHardwareKeyboardMode];

  return v4 & 1;
}

- (void)handleKeyHIDEvent:(__IOHIDEvent *)a3
{
  id v6 = self;
  SEL v5 = a2;
  char v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationAccessibility;
  [(UIApplicationAccessibility *)&v3 handleKeyHIDEvent:a3];
  _UIAXSetLastKeyboardUsed();
}

- (void)_accessibilityRegisterForDictationLifecycleNotifications
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = @"_axRegisteredForRemoteElement";
  if (([(UIApplicationAccessibility *)v5 _accessibilityBoolValueForKey:location[0]] & 1) == 0)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_accessibilityReceiveDictationLifecycleNotfication, (CFStringRef)*MEMORY[0x263F215E8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_super v3 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v3, v5, (CFNotificationCallback)_accessibilityReceiveDictationLifecycleNotfication, (CFStringRef)*MEMORY[0x263F215F0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(UIApplicationAccessibility *)v5 _accessibilitySetBoolValue:1 forKey:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (double)_accessibilityLastDictationMagicTapTime
{
  if (!a1) {
    return 0.0;
  }
  id v3 = (id)[a1 _accessibilityValueForKey:kAXLastDictationMagicTapTime];
  [v3 doubleValue];
  double v4 = v1;

  return v4;
}

- (uint64_t)_accessibilityDictationIsListening
{
  id v5 = a1;
  if (a1)
  {
    id location = (id)[v5 _accessibilityValueForKey:@"_accessibilityIsDictationListeningOverride"];
    if (location)
    {
      char v6 = [location BOOLValue] & 1;
    }
    else if ([(id)_lastActiveDictationController safeBoolForKey:@"_accessibilityIsDictating"])
    {
      char v6 = 1;
    }
    else
    {
      id v2 = (id)[NSClassFromString(&cfstr_Uidictationcon.isa) safeValueForKey:@"isRunning"];
      char v3 = [v2 BOOLValue];

      if (v3) {
        char v6 = [NSClassFromString(&cfstr_Uidictationcon.isa) safeBoolForKey:@"isListening"] & 1;
      }
      else {
        char v6 = 0;
      }
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (uint64_t)_accessibilityDictationIsAvailable
{
  id v4 = a1;
  if (a1)
  {
    if (([v4 _accessibilitySoftwareKeyboardActive] & 1) == 0
      || ((id location = NSClassFromString(&cfstr_Uidictationcon.isa),
           ([location safeBoolForKey:@"dictationIsFunctional"] & 1) == 0)
       || ([location safeBoolForKey:@"fetchCurrentInputModeSupportsDictation"] & 1) == 0
        ? (int v2 = 0)
        : (char v5 = 1, v2 = 1),
          objc_storeStrong(&location, 0),
          !v2))
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (id)_accessibilityCurrentSoftwareLanguage
{
  v4[1] = a1;
  if (a1)
  {
    v4[0] = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v3 = (id)[v4[0] currentInputMode];
    id v5 = (id)[v3 primaryLanguage];
    objc_storeStrong(&v3, 0);
    objc_storeStrong(v4, 0);
  }
  else
  {
    id v5 = 0;
  }
  double v1 = v5;

  return v1;
}

- (__CFString)_accessibilityCurrentSoftwareKeyboardLayout
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v25[1] = a1;
  if (a1)
  {
    v25[0] = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v24 = (id)[v25[0] activeInputModes];
    id v23 = (id)[v25[0] currentInputMode];
    id v1 = (id)[v23 softwareLayout];
    BOOL v14 = v1 == 0;

    if (v14)
    {
      memset(__b, 0, sizeof(__b));
      id obj = v24;
      uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
      if (v13)
      {
        uint64_t v9 = *(void *)__b[2];
        uint64_t v10 = 0;
        unint64_t v11 = v13;
        while (1)
        {
          uint64_t v8 = v10;
          if (*(void *)__b[2] != v9) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(id *)(__b[1] + 8 * v10);
          id location = (id)[v21 softwareLayout];
          id v5 = (id)[v21 primaryLanguage];
          id v6 = (id)[v23 primaryLanguage];
          BOOL v7 = 0;
          if (objc_msgSend(v5, "isEqualToString:")) {
            BOOL v7 = location != 0;
          }

          if (v7)
          {
            id v26 = (__CFString *)location;
            int v22 = 1;
          }
          else
          {
            int v22 = 0;
          }
          objc_storeStrong(&location, 0);
          if (v22) {
            break;
          }
          ++v10;
          if (v8 + 1 >= v11)
          {
            uint64_t v10 = 0;
            unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
            if (!v11) {
              goto LABEL_17;
            }
          }
        }
      }
      else
      {
LABEL_17:
        int v22 = 0;
      }

      if (!v22)
      {
        char v17 = 0;
        char v15 = 0;
        if ([v24 count])
        {
          id v18 = (id)[v24 objectAtIndex:0];
          char v17 = 1;
          id v16 = (id)[v18 softwareLayout];
          char v15 = 1;
          int v2 = (__CFString *)v16;
        }
        else
        {
          int v2 = @"US";
        }
        id v26 = v2;
        if (v15) {

        }
        if (v17) {
        int v22 = 1;
        }
      }
    }
    else
    {
      id v26 = (__CFString *)(id)[v23 softwareLayout];
      int v22 = 1;
    }
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(v25, 0);
  }
  else
  {
    id v26 = 0;
  }
  id v3 = v26;

  return v3;
}

- (__CFString)_accessibilityCurrentHardwareKeyboardLayout
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23[1] = a1;
  if (a1)
  {
    v23[0] = (id)[MEMORY[0x263F1C748] sharedInputModeController];
    id v22 = (id)[v23[0] activeInputModes];
    id v21 = (id)[v23[0] currentInputMode];
    memset(__b, 0, sizeof(__b));
    id obj = v22;
    uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(__b[1] + 8 * v9);
        id location = (id)[v20 hardwareLayout];
        id v4 = (id)[v20 primaryLanguage];
        id v5 = (id)[v21 primaryLanguage];
        BOOL v6 = 0;
        if (objc_msgSend(v4, "isEqualToString:")) {
          BOOL v6 = location != 0;
        }

        if (v6)
        {
          id v24 = (__CFString *)location;
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
        }
        objc_storeStrong(&location, 0);
        if (v17) {
          break;
        }
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v25 count:16];
          if (!v10) {
            goto LABEL_15;
          }
        }
      }
    }
    else
    {
LABEL_15:
      int v17 = 0;
    }

    if (!v17)
    {
      char v15 = 0;
      char v13 = 0;
      if ([v22 count])
      {
        id v16 = (id)[v22 objectAtIndex:0];
        char v15 = 1;
        id v14 = (id)[v16 hardwareLayout];
        char v13 = 1;
        id v1 = (__CFString *)v14;
      }
      else
      {
        id v1 = @"US";
      }
      id v24 = v1;
      if (v13) {

      }
      if (v15) {
    }
      }
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(v23, 0);
  }
  else
  {
    id v24 = 0;
  }
  int v2 = v24;

  return v2;
}

- (id)_axSubviews
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14[2] = self;
  v14[1] = (id)a2;
  v14[0] = (id)[MEMORY[0x263F089D8] string];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[(id)*MEMORY[0x263F1D020] _accessibilityAllWindowsOnlyVisibleWindows:1];
  uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0;
    unint64_t v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      id v4 = v14[0];
      id v5 = (id)[v13 _axSubviews];
      [v4 appendFormat:@"%@\n\n", v5];

      ++v8;
      if (v6 + 1 >= v9)
      {
        uint64_t v8 = 0;
        unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  id v3 = v14[0];
  objc_storeStrong(v14, 0);

  return v3;
}

- (BOOL)_accessibilityDispatchKeyboardAction:(id)a3
{
  uint64_t v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[(id)*MEMORY[0x263F1D020] accessibilityKeyboardKeyDispatchOverride];
  BOOL v7 = v3 == 0;

  if (v7)
  {
    id v5 = (id)[location[0] keyInfo];
    id v32 = (id)[v5 unmodifiedInput];

    uint64_t v24 = 0;
    id v25 = &v24;
    int v26 = 838860800;
    int v27 = 48;
    uint64_t v28 = __Block_byref_object_copy__5;
    id v29 = __Block_byref_object_dispose__5;
    id v30 = 0;
    uint64_t v18 = MEMORY[0x263EF8330];
    int v19 = -1073741824;
    int v20 = 0;
    id v21 = __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke;
    id v22 = &unk_2650AE390;
    v23[1] = &v24;
    v23[0] = v32;
    AXPerformSafeBlock();
    id v17 = (id)v25[5];
    objc_storeStrong(v23, 0);
    _Block_object_dispose(&v24, 8);
    objc_storeStrong(&v30, 0);
    id v31 = v17;
    v10[1] = (id)MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_2;
    id v14 = &unk_2650ADFB0;
    id v15 = location[0];
    id v16 = v31;
    AXPerformSafeBlock();
    id v8 = location[0];
    id v9 = v31;
    v10[0] = v35;
    AXPerformSafeBlock();
    char v36 = 1;
    int v33 = 1;
    objc_storeStrong(v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    uint64_t v6 = (uint64_t (**)(id, id))(id)[(id)*MEMORY[0x263F1D020] accessibilityKeyboardKeyDispatchOverride];
    char v36 = v6[2](v6, location[0]) & 1;

    int v33 = 1;
  }
  objc_storeStrong(location, 0);
  return v36 & 1;
}

void __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke(uint64_t a1)
{
  id v1 = (id)[NSClassFromString(&cfstr_Uiphysicalkeyb.isa) _eventWithInput:*(void *)(a1 + 32) inputFlags:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;
}

uint64_t __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_2(uint64_t a1)
{
  CFTypeRef cf = (CFTypeRef)[*(id *)(a1 + 32) newHIDEventRef];
  [*(id *)(a1 + 40) _setHIDEvent:cf];
  if (cf) {
    CFRelease(cf);
  }
  return [*(id *)(a1 + 40) _setTimestamp:(double)(unint64_t)GSCurrentEventTimestamp()];
}

void __67__UIApplicationAccessibility__accessibilityDispatchKeyboardAction___block_invoke_3(uint64_t a1)
{
  char v3 = 0;
  if ([*(id *)(a1 + 32) type] == 4500
    || [*(id *)(a1 + 32) type] == 4501)
  {
    id v1 = (id)[MEMORY[0x263F1C738] sharedInstance];
    char v3 = [v1 handleKeyCommand:*(void *)(a1 + 40) repeatOkay:0 beforePublicKeyCommands:1] & 1;
  }
  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 48) handleKeyUIEvent:*(void *)(a1 + 40)];
  }
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3 forParameter:(id)a4
{
  int v20 = self;
  SEL v19 = a2;
  int64_t v18 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v18 == 91506)
  {
    int v11 = NSNumber;
    unint64_t v10 = (void *)MEMORY[0x263F1CBC8];
    [location pointValue];
    double v15 = v4;
    double v16 = v5;
    id v12 = (id)objc_msgSend(v10, "_findWithDisplayPoint:", v4, v5);
    id v21 = (id)objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v12, "_accessibilityContextId"));

    int v14 = 1;
  }
  else if (v18 == 91509)
  {
    id v8 = NSNumber;
    [location unsignedIntValue];
    id v9 = (id)UIAccessibilityWindowForContextId();
    id v21 = (id)objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "_accessibilityDisplayId"));

    int v14 = 1;
  }
  else if (v18 == 95253)
  {
    id v21 = [(UIApplicationAccessibility *)v20 _accessibilityElementFirst:1 last:0 forFocus:0 parameters:location];
    int v14 = 1;
  }
  else if (v18 == 95254)
  {
    id v21 = [(UIApplicationAccessibility *)v20 _accessibilityElementFirst:0 last:1 forFocus:0 parameters:location];
    int v14 = 1;
  }
  else if (v18 == 95256)
  {
    id v21 = [(UIApplicationAccessibility *)v20 _accessibilityWindowSceneForSceneID:location];
    int v14 = 1;
  }
  else
  {
    if (v18 == 95257)
    {
      id v21 = [(UIApplicationAccessibility *)v20 _accessibilityFocusableScenesDictionary];
    }
    else
    {
      v13.receiver = v20;
      v13.super_class = (Class)UIApplicationAccessibility;
      id v21 = [(UIApplicationAccessibility *)&v13 _iosAccessibilityAttributeValue:v18 forParameter:location];
    }
    int v14 = 1;
  }
  objc_storeStrong(&location, 0);
  uint64_t v6 = v21;

  return v6;
}

- (id)_iosAccessibilityAttributeValue:(int64_t)a3
{
  int v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  switch(a3)
  {
    case 1514:
      id v12 = (__CFString *)(id)objc_msgSend(NSNumber, "numberWithBool:", -[UIApplicationAccessibility _accessibilityApplicationIsModal](v11, "_accessibilityApplicationIsModal"));
      break;
    case 3001:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilitySummaryElement](v11);
      break;
    case 3002:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityResponderElement];
      break;
    case 3003:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityBundleIdentifier];
      break;
    case 3004:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityTypingCandidates](v11);
      break;
    case 3005:
      id v12 = (__CFString *)(id)objc_msgSend(NSNumber, "numberWithBool:", -[UIApplicationAccessibility _accessibilitySoftwareKeyboardActive](v11, "_accessibilitySoftwareKeyboardActive"));
      break;
    case 3006:
      uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
      id v7 = [(UIApplicationAccessibility *)v11 _accessibilityTitleBarElement];
      id v12 = (__CFString *)(id)objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 1, v7);

      break;
    case 3007:
      id v12 = (__CFString *)(id)_UIAXLastKeyboardUsed();
      break;
    case 3010:
      id v12 = (__CFString *)(id)[NSNumber numberWithBool:-[UIApplicationAccessibility _accessibilityDictationIsListening](v11) & 1];
      break;
    case 3011:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _firstStatusBarElement];
      break;
    case 3012:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _lastStatusBarElement];
      break;
    case 3013:
      id v12 = -[UIApplicationAccessibility _accessibilityCurrentHardwareKeyboardLayout](v11);
      break;
    case 3016:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityLastElement];
      break;
    case 3018:
      id v12 = -[UIApplicationAccessibility _accessibilityCurrentSoftwareKeyboardLayout](v11);
      break;
    case 3019:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityCurrentSoftwareLanguage](v11);
      break;
    case 3023:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityResponderElementForFocus];
      break;
    case 3024:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityNativeFocusElement];
      break;
    case 3027:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityNativeFocusPreferredElement];
      break;
    case 3034:
      id v12 = (__CFString *)(id)[NSNumber numberWithBool:-[UIApplicationAccessibility _accessibilityDictationIsAvailable](v11) & 1];
      break;
    case 3035:
      id v12 = (__CFString *)(id)[NSNumber numberWithInt:-[UIApplicationAccessibility _accessibilityApplicationInterfaceOrientation](v11)];
      break;
    case 3036:
      id v12 = (__CFString *)(id)[NSNumber numberWithBool:-[UIApplicationAccessibility _accessibilityIsTappingMediaLegibilityEvents]((uint64_t)v11) & 1];
      break;
    case 3037:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityRealtimeElements](v11);
      break;
    case 3040:
      id v12 = (__CFString *)(id)[(UIApplicationAccessibility *)v11 _accessibilityApplicationWindowContextIDs];
      break;
    case 3043:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityTextReplacementCandidates](v11);
      break;
    case 3045:
      id v12 = (__CFString *)(id)[NSNumber numberWithBool:-[UIApplicationAccessibility _accessibilityIsInitialBundleLoadFinished]((uint64_t)v11) & 1];
      break;
    case 3046:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityFirstElementsForSpeakThis];
      break;
    case 3047:
      id v12 = (__CFString *)(id)[NSNumber numberWithBool:_UIApplicationIsExtension() & 1];
      break;
    case 3050:
      id v12 = (__CFString *)(id)[(UIApplicationAccessibility *)v11 _accessibilityFirstElementForReadFromTop];
      break;
    case 3051:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityMLProxiedElements](v11);
      break;
    case 3052:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityApplicationWindowFramesAndIds](v11);
      break;
    case 3054:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityStatusBarElements:1 sorted:1];
      break;
    case 3060:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityGetSpeakThisRootElementAccessibilityIdentifier];
      break;
    case 3061:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession];
      break;
    case 3062:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityFocusContainer];
      break;
    case 3069:
      id v5 = [(UIApplicationAccessibility *)v11 _accessibilityFocusedScene];
      id v12 = (__CFString *)(id)[v5 _sceneIdentifier];

      break;
    case 5044:
      id v12 = (__CFString *)-[UIApplicationAccessibility _accessibilityPreviewWindow](v11);
      break;
    case 13001:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilitySemanticContext];
      break;
    case 14000:
      id v12 = (__CFString *)[(UIApplicationAccessibility *)v11 _accessibilityIsolatedWindows];
      break;
    default:
      v8.receiver = v11;
      v8.super_class = (Class)UIApplicationAccessibility;
      id v12 = (__CFString *)[(UIApplicationAccessibility *)&v8 _iosAccessibilityAttributeValue:v9];
      break;
  }
  char v3 = v12;

  return v3;
}

- (uint64_t)_accessibilityApplicationInterfaceOrientation
{
  v3[1] = a1;
  if (a1)
  {
    v3[0] = (id)[MEMORY[0x263F1C920] mainScreen];
    id v2 = (id)[v3[0] safeValueForKey:@"_interfaceOrientation"];
    unsigned int v4 = [v2 integerValue];

    objc_storeStrong(v3, 0);
  }
  else
  {
    return 0;
  }
  return v4;
}

- (uint64_t)_accessibilityIsTappingMediaLegibilityEvents
{
  if (a1)
  {
    id v2 = (id)[NSClassFromString(&cfstr_Axavfoundation.isa) safeValueForKey:@"sharedManagerIfExists"];
    char v3 = [v2 safeBoolForKey:@"isTappingMediaDescriptions"] & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (id)_accessibilityPreviewWindow
{
  id v5 = a1;
  if (a1)
  {
    id v3 = (id)[v5 _accessibilityMainWindow];
    id v4 = (id)[v3 _accessibilityFindDescendant:&__block_literal_global_986];

    id v6 = v4;
    objc_storeStrong(&v4, 0);
  }
  else
  {
    id v6 = 0;
  }
  id v1 = v6;

  return v1;
}

- (id)_accessibilityApplicationWindowFramesAndIds
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v28 = a1;
  if (a1)
  {
    id v27 = (id)[v28 _accessibilityApplicationWindowContextIDs];
    id v26 = (id)[MEMORY[0x263EFF980] array];
    id v25 = (id)[v28 _accessibilityMainWindow];
    id v24 = (id)AXUIKeyboardWindow();
    memset(__b, 0, sizeof(__b));
    id obj = v27;
    uint64_t v16 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
    if (v16)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0;
      unint64_t v14 = v16;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(id *)(__b[1] + 8 * v13);
        id location = (id)objc_msgSend(MEMORY[0x263F1CBC8], "_windowWithContextId:", objc_msgSend(v23, "unsignedIntValue"));
        if (location)
        {
          long long v19 = 0u;
          long long v20 = 0u;
          [location accessibilityFrame];
          *(void *)&long long v19 = v1;
          *((void *)&v19 + 1) = v2;
          *(void *)&long long v20 = v3;
          *((void *)&v20 + 1) = v4;
          AXValueRef cf = AXValueCreate(kAXValueTypeCGRect, &v19);
          BOOL v17 = location == v24;
          id v7 = v26;
          v30[0] = @"contextId";
          v31[0] = v23;
          v30[1] = @"frame";
          v31[1] = cf;
          v30[2] = @"isMainWindow";
          id v10 = (id)[NSNumber numberWithInt:v25 == location];
          id v31[2] = v10;
          v30[3] = @"isKeyboardWindow";
          id v9 = (id)[NSNumber numberWithBool:v17];
          v31[3] = v9;
          id v8 = (id)[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
          objc_msgSend(v7, "addObject:");

          if (cf) {
            CFRelease(cf);
          }
        }
        objc_storeStrong(&location, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v32 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }

    id v29 = v26;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    id v29 = 0;
  }
  id v5 = v29;

  return v5;
}

- (id)_accessibilityRealtimeElements
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v14 = a1;
  if (a1)
  {
    id v13 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = (id)[v14 _accessibilityWindows];
    uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(__b[1] + 8 * v6);
        id v10 = (id)[v12 _accessibilityFindUnsortedDescendantsPassingTest:&__block_literal_global_992];
        [v13 addObjectsFromArray:v10];
        objc_storeStrong(&v10, 0);
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    id v3 = (id)[v13 reverseObjectEnumerator];
    id v15 = (id)[v3 allObjects];

    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v1 = v15;

  return v1;
}

- (uint64_t)_accessibilityIsInitialBundleLoadFinished
{
  if (a1)
  {
    id v2 = (id)[MEMORY[0x263F21390] defaultLoader];
    char v3 = [v2 isInitialLoadFinished] & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (id)_accessibilityMLProxiedElements
{
  id v9 = a1;
  if (a1)
  {
    id v8 = 0;
    uint64_t v5 = (void *)MEMORY[0x263EFF8C0];
    id v7 = (id)[v9 _accessibilityMainWindow];
    id v6 = -[UIWindowAccessibility _accessibilityMLRemoteElement](v7);
    id v1 = (id)objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 1, v6);
    id v2 = v8;
    id v8 = v1;

    id v10 = v8;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    id v10 = 0;
  }
  char v3 = v10;

  return v3;
}

- (void)_iosAccessibilitySetValue:(id)a3 forAttribute:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CFTypeID v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37[1] = (id)a4;
  switch(a4)
  {
    case 2603:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = location[0];
        [(id)*MEMORY[0x263F1D020] _accessibilitySetRetainedValue:v25 forKey:@"AXShowOnscreenKeyboardWithBraille"];
        if ([v25 BOOLValue])
        {
          id v8 = (id)[MEMORY[0x263F1C738] sharedInstance];
          char v9 = [v8 isMinimized];

          if (v9) {
            AXPerformSafeBlock();
          }
        }
        else
        {
          id v6 = (id)[MEMORY[0x263F1C738] sharedInstance];
          char v7 = [v6 isMinimized];

          if ((v7 & 1) == 0) {
            AXPerformSafeBlock();
          }
        }
        objc_storeStrong(&v25, 0);
      }
      else
      {
        id v24 = (id)AXLogBrailleHW();
        char v23 = 2;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v4 = v24;
          os_log_type_t v5 = v23;
          __os_log_helper_16_0_0(v22);
          _os_log_debug_impl(&dword_2402B7000, v4, v5, "AXShowOnscreenKeyboardWithBraille set to nil", v22, 2u);
        }
        objc_storeStrong(&v24, 0);
        [(id)*MEMORY[0x263F1D020] _accessibilitySetRetainedValue:0 forKey:@"AXShowOnscreenKeyboardWithBraille"];
        AXPerformSafeBlock();
      }
      break;
    case 3060:
      id v20 = (id)[location[0] stringValue];

      if (v20)
      {
        v37[0] = (id)[location[0] stringValue];
        id v36 = (id)AXLogSpeakScreen();
        os_log_type_t v35 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v37[0]);
          _os_log_debug_impl(&dword_2402B7000, (os_log_t)v36, v35, "kAXSpeakThisRootElementAccessibilityIdentifierParameterizedAttribute %@", v41, 0xCu);
        }
        objc_storeStrong(&v36, 0);
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisRootElementAccessibilityIdentifier:v37[0]];
        int64_t v18 = v39;
        id v19 = (id)[(UIApplicationAccessibility *)v39 _accessibilitySpeakThisElementWithIdentifier:v37[0]];
        -[UIApplicationAccessibility _accessibilitySetSpeakThisRootElement:](v18, "_accessibilitySetSpeakThisRootElement:");

        objc_storeStrong(v37, 0);
      }
      else
      {
        id v34 = (id)AXLogSpeakScreen();
        char v33 = 2;
        if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = v34;
          os_log_type_t v17 = v33;
          __os_log_helper_16_0_0(v32);
          _os_log_debug_impl(&dword_2402B7000, v16, v17, "kAXSpeakThisRootElementAccessibilityIdentifierParameterizedAttribute set to nil", v32, 2u);
        }
        objc_storeStrong(&v34, 0);
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisRootElementAccessibilityIdentifier:0];
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisRootElement:0];
      }
      break;
    case 3061:
      id v15 = (id)[location[0] stringValue];

      if (v15)
      {
        id v31 = (id)[location[0] stringValue];
        id v30 = (id)AXLogSpeakScreen();
        os_log_type_t v29 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v31);
          _os_log_debug_impl(&dword_2402B7000, (os_log_t)v30, v29, "kAXSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSessionAttribute %@", v40, 0xCu);
        }
        objc_storeStrong(&v30, 0);
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:v31];
        id v12 = v39;
        id v14 = (id)[MEMORY[0x263F1C408] sharedApplication];
        id v13 = (id)[v14 _accessibilitySpeakThisViewsFromSceneWithSceneIdentifier:v31];
        -[UIApplicationAccessibility _accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:](v12, "_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:");

        objc_storeStrong(&v31, 0);
      }
      else
      {
        id v28 = (id)AXLogSpeakScreen();
        char v27 = 2;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
        {
          id v10 = v28;
          os_log_type_t v11 = v27;
          __os_log_helper_16_0_0(v26);
          _os_log_debug_impl(&dword_2402B7000, v10, v11, "kAXSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSessionAttribute set to nil", v26, 2u);
        }
        objc_storeStrong(&v28, 0);
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:0];
        [(UIApplicationAccessibility *)v39 _accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:0];
      }
      break;
    case 3071:
      if (location[0])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(UIApplicationAccessibility *)v39 _accessibilitySetUIAppFocusedOnContinuityDisplay:location[0]];
        }
      }
      break;
  }
  objc_storeStrong(location, 0);
}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke()
{
  id v0 = (id)[MEMORY[0x263F1C738] sharedInstance];
  [v0 showKeyboardWithoutSuppressionPolicy];
}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke_2()
{
  id v0 = (id)[MEMORY[0x263F1C738] sharedInstance];
  [v0 hideKeyboard];
}

void __69__UIApplicationAccessibility__iosAccessibilitySetValue_forAttribute___block_invoke_949()
{
  id v0 = (id)[MEMORY[0x263F1C738] sharedInstance];
  [v0 showKeyboardIfNeeded];
}

- (BOOL)openURL:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UIApplicationAccessibility;
  char v6 = [(UIApplicationAccessibility *)&v5 openURL:location[0]];
  if (v6) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
  char v4 = v6;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityBundleIdentifier
{
  id v3 = (id)[MEMORY[0x263F086E0] mainBundle];
  id v4 = (id)[v3 bundleIdentifier];

  return v4;
}

- (id)_accessibilityElementCommunityIdentifier
{
  return [(UIApplicationAccessibility *)self _accessibilityBundleIdentifier];
}

- (id)_accessibilityIsolatedWindows
{
  return 0;
}

uint64_t __57__UIApplicationAccessibility__accessibilityPreviewWindow__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[location[0] accessibilityIdentifier];
  char v4 = [v3 isEqualToString:@"PreviewContainerElement"];

  objc_storeStrong(location, 0);
  return v4 & 1;
}

uint64_t __60__UIApplicationAccessibility__accessibilityRealtimeElements__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _accessibilityIsRealtimeElement];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)accessibilityLabel
{
  id v21 = self;
  v20[1] = (id)a2;
  v20[0] = (id)[(UIApplicationAccessibility *)self accessibilityUserDefinedLabel];
  if (v20[0])
  {
    id v22 = v20[0];
    int v19 = 1;
  }
  else
  {
    id v18 = (id)[MEMORY[0x263F086E0] mainBundle];
    id v16 = (id)[v18 localizedInfoDictionary];
    id v17 = (id)[v16 objectForKey:@"CFBundleSpokenName"];

    if (![v17 length])
    {
      id v15 = (id)[v18 infoDictionary];
      id v2 = (id)[v15 objectForKey:@"CFBundleSpokenName"];
      id v3 = v17;
      id v17 = v2;
    }
    if (![v17 length])
    {
      id v4 = (id)[v18 objectForInfoDictionaryKey:*MEMORY[0x263EFFA90]];
      id v5 = v17;
      id v17 = v4;
    }
    if (![v17 length])
    {
      id v6 = (id)[v18 objectForInfoDictionaryKey:*MEMORY[0x263EFFB68]];
      id v7 = v17;
      id v17 = v6;
    }
    if (![v17 length])
    {
      id v8 = (id)[v18 objectForInfoDictionaryKey:*MEMORY[0x263EFFB50]];
      id v9 = v17;
      id v17 = v8;
    }
    if (![v17 length])
    {
      id v10 = [(UIApplicationAccessibility *)v21 _accessibilityBundleIdentifier];
      id v11 = v17;
      id v17 = v10;
    }
    -[UIApplicationAccessibility setAccessibilityLabel:](v21, "setAccessibilityLabel:", v17, &v17);
    id v22 = v17;
    int v19 = 1;
    objc_storeStrong(location, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(v20, 0);
  id v12 = v22;

  return v12;
}

- (id)_accessibilityElementsWithSemanticContext:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v15 = 0;
  if (location[0])
  {
    objc_storeStrong(location, location[0]);
  }
  else
  {
    id v16 = (id)[MEMORY[0x263F1C408] sharedApplication];
    char v15 = 1;
    objc_storeStrong(location, v16);
  }
  if (v15) {

  }
  id v14 = (id)[MEMORY[0x263F81198] options];
  id v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, sel__accessibilitySemanticContextForElement_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  v6[1] = (id)MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __72__UIApplicationAccessibility__accessibilityElementsWithSemanticContext___block_invoke;
  id v10 = &__block_descriptor_40_e8_B16__0_8l;
  IMP v11 = Implementation;
  objc_msgSend(v14, "setLeafNodePredicate:");
  v6[0] = (id)[location[0] _accessibilityLeafDescendantsWithOptions:v14];
  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);

  return v5;
}

uint64_t __72__UIApplicationAccessibility__accessibilityElementsWithSemanticContext___block_invoke(IMP *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v6 = [location[0] _accessibilitySupportsSemanticContext] & 1;
  if (v6)
  {
    id v2 = (objc_class *)objc_opt_class();
    m = class_getInstanceMethod(v2, sel__accessibilitySemanticContextForElement_);
    char v6 = method_getImplementation(m) != a1[4];
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (uint64_t)_accessibilityActionIsPhysicalButton:(uint64_t *)a3 nativeUIKitTypeRef:
{
  if (a1)
  {
    char v7 = 1;
    uint64_t v6 = -1;
    if (a2 <= 0xFA0)
    {
      uint64_t v4 = a2 - 4000;
      char v3 = 0;
    }
    else
    {
      uint64_t v4 = a2 - 4000;
      char v3 = 1;
    }
    if (v3)
    {
      char v7 = 0;
    }
    else
    {
      switch(v4)
      {
        case 0:
          uint64_t v6 = 4;
          break;
        case 1:
          uint64_t v6 = 7;
          break;
        case 2:
          uint64_t v6 = 5;
          break;
        case 3:
          uint64_t v6 = 6;
          break;
        case 4:
          uint64_t v6 = 0;
          break;
        case 5:
          uint64_t v6 = 1;
          break;
        case 6:
          uint64_t v6 = 3;
          break;
        case 7:
          uint64_t v6 = 2;
          break;
        case 8:
          uint64_t v6 = 8;
          break;
        case 9:
          uint64_t v6 = 9;
          break;
        case 10:
          uint64_t v6 = 10;
          break;
        case 11:
          uint64_t v6 = 11;
          break;
        case 12:
          uint64_t v6 = 12;
          break;
        case 13:
          uint64_t v6 = 13;
          break;
        case 14:
          uint64_t v6 = 14;
          break;
        case 15:
          uint64_t v6 = 15;
          break;
        case 16:
          uint64_t v6 = 16;
          break;
        case 17:
          uint64_t v6 = 17;
          break;
        case 18:
          uint64_t v6 = 18;
          break;
        default:
          JUMPOUT(0);
      }
    }
    if (a3) {
      *a3 = v6;
    }
    char v8 = v7;
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (id)_accessibilityMakeUIPressInfoWithType:(uint64_t)a3 phase:(int)a4 timestamp:(double)a5 contextID:
{
  uint64_t v18 = a1;
  uint64_t v17 = a2;
  uint64_t v16 = a3;
  double v15 = a5;
  int v14 = a4;
  if (a1)
  {
    uint64_t v7 = 0;
    char v8 = &v7;
    int v9 = 838860800;
    int v10 = 48;
    IMP v11 = __Block_byref_object_copy__5;
    id v12 = __Block_byref_object_dispose__5;
    id v13 = 0;
    AXPerformSafeBlock();
    id v19 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    id v19 = 0;
  }
  id v5 = v19;

  return v5;
}

uint64_t __94__UIApplicationAccessibility__accessibilityMakeUIPressInfoWithType_phase_timestamp_contextID___block_invoke(uint64_t a1)
{
  double v6 = 1.0;
  if (*(void *)(a1 + 40) == 3 || *(void *)(a1 + 40) == 4) {
    double v6 = 0.0;
  }
  id v1 = objc_alloc_init(NSClassFromString(&cfstr_Uipressinfo.isa));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  char v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPhase:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setTimestamp:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setForce:v6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setContextID:*(unsigned int *)(a1 + 64)];
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setSource:3];
}

- (BOOL)_accessibilityDispatchScrollWithAmount:(int64_t)a3
{
  id v31 = self;
  SEL v30 = a2;
  int64_t v29 = a3;
  BOOL v28 = a3 >= 0;
  uint64_t v27 = 0;
  double v26 = 0.0;
  while (1)
  {
    uint64_t v25 = v27;
    uint64_t v10 = v27 >= 0 ? v25 : -v25;
    uint64_t v24 = v10;
    int64_t v23 = v29;
    int64_t v9 = v29 >= 0 ? v23 : -v23;
    int64_t v22 = v9;
    if (v10 >= v9) {
      break;
    }
    double v26 = v26 + 0.02;
    uint64_t v21 = 5;
    uint64_t v20 = 0;
    int64_t v19 = v29;
    if (v29 >= 0) {
      int64_t v8 = v19;
    }
    else {
      int64_t v8 = -v19;
    }
    int64_t v18 = v8;
    uint64_t v17 = v27;
    if (v27 >= 0) {
      uint64_t v7 = v17;
    }
    else {
      uint64_t v7 = -v17;
    }
    v16[2] = (id)v7;
    uint64_t v20 = v8 - v7;
    if (v8 - v7 < v21) {
      uint64_t v21 = v20;
    }
    if (v28) {
      uint64_t v6 = v21;
    }
    else {
      uint64_t v6 = -v21;
    }
    uint64_t v21 = v6;
    dispatch_time_t when = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
    queue = MEMORY[0x263EF83A0];
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    int v14 = __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke;
    double v15 = &unk_2650ADDF0;
    v16[1] = (id)v21;
    v16[0] = v31;
    dispatch_after(when, queue, &v11);

    v27 += v21;
    objc_storeStrong(v16, 0);
  }
  return 1;
}

void __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke(id *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  uint64_t v4 = 0;
  id v5 = &v4;
  int v6 = 838860800;
  int v7 = 48;
  int64_t v8 = __Block_byref_object_copy__5;
  int64_t v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  AXPerformSafeBlock();
  id v3 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  objc_storeStrong(&v10, 0);
  v11[0] = v3;
  mach_absolute_time();
  CFTypeRef cf = (CFTypeRef)IOHIDEventCreateScrollEvent();
  [v11[0] _setHIDEvent:cf];
  if (cf) {
    CFRelease(cf);
  }
  [a1[4] sendEvent:v11[0]];
  objc_storeStrong(v11, 0);
}

void __69__UIApplicationAccessibility__accessibilityDispatchScrollWithAmount___block_invoke_2(uint64_t a1)
{
  id v1 = objc_alloc_init(NSClassFromString(&cfstr_Uiwheelevent.isa));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;
}

- (BOOL)_iosAccessibilityPerformAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  double v26 = self;
  SEL v25 = a2;
  unsigned int v24 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unsigned int v22 = a5;
  uint64_t v21 = 0;
  if (-[UIApplicationAccessibility _accessibilityActionIsPhysicalButton:nativeUIKitTypeRef:]((uint64_t)v26, v24, (uint64_t *)&v21))
  {
    id v7 = (id)[MEMORY[0x263EFF910] date];
    [v7 timeIntervalSinceNow];
    int64_t v8 = v5;

    v20[1] = v8;
    v20[0] = -[UIApplicationAccessibility _accessibilityMakeUIPressInfoWithType:phase:timestamp:contextID:]((uint64_t)v26, (uint64_t)v21, 0, [(UIApplicationAccessibility *)v26 _accessibilityGetContextID], *(double *)&v8);
    id v9 = (id)[MEMORY[0x263F1C408] sharedApplication];
    [v9 _sendButtonEventWithPressInfo:v20[0]];

    uint64_t v14 = MEMORY[0x263EF8330];
    int v15 = -1073741824;
    int v16 = 0;
    uint64_t v17 = __81__UIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke;
    int64_t v18 = &unk_2650ADDF0;
    v19[0] = v26;
    v19[1] = v21;
    AXPerformBlockOnMainThreadAfterDelay();
    char v27 = 1;
    int v13 = 1;
    objc_storeStrong(v19, 0);
    objc_storeStrong(v20, 0);
  }
  else if (v24 == 5016)
  {
    -[UIApplicationAccessibility _accessibilityShowKeyboardHints]((uint64_t)v26);
    char v27 = 1;
    int v13 = 1;
  }
  else if (v24 == 2049)
  {
    -[UIApplicationAccessibility _accessibilityStartStopDictation](v26);
    char v27 = 1;
    int v13 = 1;
  }
  else if (v24 != 5021 {
         || ((id v12 = location, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
  }
           ? (int v13 = 0)
           : (v27 = -[UIApplicationAccessibility _accessibilityDispatchScrollWithAmount:](v26, "_accessibilityDispatchScrollWithAmount:", [v12 integerValue]), int v13 = 1), objc_storeStrong(&v12, 0), !v13))
  {
    if (-[UIApplicationAccessibility _accessibilityHandleFullKeyboardAccessAction:value:](v26, v24, location))
    {
      char v27 = 1;
      int v13 = 1;
    }
    else if (v24 - 4100 <= 3)
    {
      char v27 = [(UIApplicationAccessibility *)v26 _accessibilityApplicationHandleButtonAction:v24] & 1;
      int v13 = 1;
    }
    else if (v24 == 5200)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaPlay](v26) & 1;
      int v13 = 1;
    }
    else if (v24 == 5201)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaPause](v26) & 1;
      int v13 = 1;
    }
    else if (v24 == 5202)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaPlayPause](v26) & 1;
      int v13 = 1;
    }
    else if (v24 == 5203)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaNextTrack](v26) & 1;
      int v13 = 1;
    }
    else if (v24 == 5204)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaPreviousTrack](v26) & 1;
      int v13 = 1;
    }
    else if (v24 == 5205)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaSkipDuration:](v26, location) & 1;
      int v13 = 1;
    }
    else if (v24 == 5207)
    {
      char v27 = -[UIApplicationAccessibility _accessibilityMediaRewind](v26) & 1;
      int v13 = 1;
    }
    else
    {
      if (v24 == 5208)
      {
        char v27 = -[UIApplicationAccessibility _accessibilityMediaFastForward](v26) & 1;
      }
      else
      {
        v11.receiver = v26;
        v11.super_class = (Class)UIApplicationAccessibility;
        char v27 = [(UIApplicationAccessibility *)&v11 _iosAccessibilityPerformAction:v24 withValue:location fencePort:v22];
      }
      int v13 = 1;
    }
  }
  objc_storeStrong(&location, 0);
  return v27 & 1;
}

void __81__UIApplicationAccessibility__iosAccessibilityPerformAction_withValue_fencePort___block_invoke(uint64_t *a1)
{
  id v6[3] = a1;
  id v6[2] = a1;
  id v2 = (id)[MEMORY[0x263EFF910] date];
  [v2 timeIntervalSinceNow];
  id v3 = v1;

  v6[1] = v3;
  v6[0] = -[UIApplicationAccessibility _accessibilityMakeUIPressInfoWithType:phase:timestamp:contextID:](a1[4], a1[5], 3, [(id)a1[4] _accessibilityGetContextID], *(double *)&v3);
  id v5 = (id)[MEMORY[0x263F1C408] sharedApplication];
  [v5 _sendButtonEventWithPressInfo:v6[0]];

  objc_storeStrong(v6, 0);
}

- (uint64_t)_accessibilityShowKeyboardHints
{
  if (result) {
    return AXPerformSafeBlock();
  }
  return result;
}

- (uint64_t)_accessibilityHandleFullKeyboardAccessAction:(id)obj value:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v41 = a1;
  int v40 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v41)
  {
    char v37 = 0;
    switch(v40)
    {
      case 5310:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v36 = 0;
          memset(__b, 0, 0x40uLL);
          char v34 = 0;
          objc_opt_class();
          uint64_t v26 = 0;
          char v27 = &v26;
          int v28 = 838860800;
          int v29 = 48;
          SEL v30 = __Block_byref_object_copy__5;
          id v31 = __Block_byref_object_dispose__5;
          id v32 = 0;
          uint64_t v20 = MEMORY[0x263EF8330];
          int v21 = -1073741824;
          int v22 = 0;
          int64_t v23 = __81__UIApplicationAccessibility__accessibilityHandleFullKeyboardAccessAction_value___block_invoke;
          unsigned int v24 = &unk_2650AE158;
          SEL v25 = &v26;
          AXPerformSafeBlock();
          id v19 = (id)v27[5];
          _Block_object_dispose(&v26, 8);
          objc_storeStrong(&v32, 0);
          id v33 = (id)__UIAccessibilityCastAsClass();

          if (v34) {
            abort();
          }
          id v18 = v33;
          objc_storeStrong(&v33, 0);
          id obja = v18;
          uint64_t v13 = [v18 countByEnumeratingWithState:__b objects:v43 count:16];
          if (v13)
          {
            uint64_t v9 = *(void *)__b[2];
            uint64_t v10 = 0;
            unint64_t v11 = v13;
            while (1)
            {
              uint64_t v8 = v10;
              if (*(void *)__b[2] != v9) {
                objc_enumerationMutation(obja);
              }
              void __b[8] = *(void *)(__b[1] + 8 * v10);
              char v16 = 0;
              objc_opt_class();
              id v15 = (id)__UIAccessibilityCastAsClass();
              if (v16) {
                abort();
              }
              id v14 = v15;
              objc_storeStrong(&v15, 0);
              id v17 = v14;
              id v7 = (id)[v14 safeValueForKey:@"_FBSScene"];
              id v5 = (id)[v7 safeStringForKey:@"identifier"];
              char v6 = [v5 isEqualToString:location];

              if (v6)
              {
                objc_storeStrong(&v36, v17);
                int v38 = 3;
              }
              else
              {
                int v38 = 0;
              }
              objc_storeStrong(&v17, 0);
              if (v38) {
                break;
              }
              ++v10;
              if (v8 + 1 >= v11)
              {
                uint64_t v10 = 0;
                unint64_t v11 = [obja countByEnumeratingWithState:__b objects:v43 count:16];
                if (!v11) {
                  goto LABEL_22;
                }
              }
            }
          }
          else
          {
LABEL_22:
            int v38 = 0;
          }

          id v4 = (id)[v36 keyWindow];
          [v4 makeKeyWindow];

          char v37 = 1;
          objc_storeStrong(&v36, 0);
        }
        break;
      case 5311:
        char v37 = [v41 _accessibilityResetAndClearNativeFocusSystem] & 1;
        break;
      case 5313:
        char v37 = [v41 _accessibilityUpdateNativeFocusImmediately] & 1;
        break;
    }
    char v42 = v37 & 1;
    int v38 = 1;
  }
  else
  {
    char v42 = 0;
    int v38 = 1;
  }
  objc_storeStrong(&location, 0);
  return v42 & 1;
}

- (uint64_t)_accessibilityMediaPlay
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:");
    MRMediaRemoteSendCommand();
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPause
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    [a1 _accessibilitySetLastMediaRemoteCommand:1];
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPlayPause
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    objc_msgSend(a1, "_accessibilitySetLastMediaRemoteCommand:");
    MRMediaRemoteSendCommand();
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaNextTrack
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    [a1 _accessibilitySetLastMediaRemoteCommand:4];
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaPreviousTrack
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    [a1 _accessibilitySetLastMediaRemoteCommand:5];
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaSkipDuration:(void *)a1
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v8)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](v8);
    [location doubleValue];
    if (v2 <= 0.0) {
      int v3 = 18;
    }
    else {
      int v3 = 17;
    }
    unsigned int v6 = v3;
    double v10 = v2;
    uint64_t v11 = *MEMORY[0x263F54D90];
    id v5 = (id)[NSNumber numberWithDouble:fabs(v2)];
    v12[0] = v5;
    [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    MRMediaRemoteSendCommand();

    [v8 _accessibilitySetLastMediaRemoteCommand:v6];
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
  }
  objc_storeStrong(&location, 0);
  return v9 & 1;
}

- (uint64_t)_accessibilityMediaRewind
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    [a1 _accessibilitySetLastMediaRemoteCommand:10];
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (uint64_t)_accessibilityMediaFastForward
{
  if (a1)
  {
    -[UIApplicationAccessibility _accessibilityCancelRewindOrFastForward](a1);
    MRMediaRemoteSendCommand();
    [a1 _accessibilitySetLastMediaRemoteCommand:8];
    char v3 = 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

void __61__UIApplicationAccessibility__accessibilityShowKeyboardHints__block_invoke(void *a1)
{
  v1[2] = a1;
  v1[1] = a1;
  v1[0] = (id)[NSClassFromString(&cfstr_Uikeyshortcuth_15.isa) safeValueForKey:@"sharedHUDService"];
  [v1[0] scheduleHUDPresentation];
  objc_storeStrong(v1, 0);
}

void __81__UIApplicationAccessibility__accessibilityHandleFullKeyboardAccessAction_value___block_invoke(uint64_t a1)
{
  id v1 = (id)[MEMORY[0x263F1CBD0] _scenesIncludingInternal:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  char v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;
}

- (id)_accessibilityFocusableScenesDictionary
{
  uint64_t v8 = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = [(UIApplicationAccessibility *)v8 _accessibilityFocusableScenes];
  id v3 = v6;
  id v5 = v7[0];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:");
  id v4 = v7[0];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v4;
}

void __69__UIApplicationAccessibility__accessibilityFocusableScenesDictionary__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v18[3] = a3;
  id v18[2] = a4;
  v18[1] = a1;
  uint64_t v11 = NSNumber;
  char v17 = 0;
  objc_opt_class();
  id v16 = (id)__UIAccessibilityCastAsClass();
  id v15 = v16;
  objc_storeStrong(&v16, 0);
  id v7 = (id)[v15 screen];
  id v6 = (id)[v7 displayIdentity];
  v18[0] = (id)objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v6, "displayID"));

  if (v18[0])
  {
    id v5 = (id)[a1[4] objectForKeyedSubscript:v18[0]];
    char v12 = 0;
    if (v5)
    {
      id v4 = v5;
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      char v12 = 1;
      id v4 = v13;
    }
    id v14 = v4;
    if (v12) {

    }
    [v14 addObject:location[0]];
    [a1[4] setObject:v14 forKeyedSubscript:v18[0]];
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityFocusableScenes
{
  id v3 = [(UIApplicationAccessibility *)self _accessibilityActiveScenes];
  id v4 = (id)[v3 axFilterObjectsUsingBlock:&__block_literal_global_1010];

  return v4;
}

uint64_t __59__UIApplicationAccessibility__accessibilityFocusableScenes__block_invoke(void *a1, void *a2, uint64_t a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v12 = a3;
  uint64_t v11 = a1;
  char v10 = 0;
  objc_opt_class();
  id v9 = (id)__UIAccessibilityCastAsClass();
  id v8 = v9;
  objc_storeStrong(&v9, 0);
  id v4 = (id)[v8 _focusSystemSceneComponent];
  char v5 = [(id)objc_opt_class() safeBoolForKey:@"needsFocusSystem"];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (id)_accessibilityActiveScenes
{
  id v16 = self;
  SEL v15 = a2;
  char v14 = 0;
  objc_opt_class();
  uint64_t v6 = 0;
  id v7 = &v6;
  int v8 = 838860800;
  int v9 = 48;
  char v10 = __Block_byref_object_copy__5;
  uint64_t v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  AXPerformSafeBlock();
  id v5 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  id v13 = (id)__UIAccessibilityCastAsClass();

  if (v14) {
    abort();
  }
  id v4 = v13;
  objc_storeStrong(&v13, 0);
  id v3 = (id)[v4 axFilterObjectsUsingBlock:&__block_literal_global_1012];

  return v3;
}

void __56__UIApplicationAccessibility__accessibilityActiveScenes__block_invoke(uint64_t a1)
{
  id v1 = (id)[MEMORY[0x263F1CBD0] _scenesIncludingInternal:1];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F812B8], 0) = v1;
}

BOOL __56__UIApplicationAccessibility__accessibilityActiveScenes__block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10[2] = a3;
  v10[1] = a1;
  char v9 = 0;
  objc_opt_class();
  id v8 = (id)__UIAccessibilityCastAsClass();
  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  BOOL v4 = [v7 activationState] == 0;
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityWindowSceneForSceneID:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = [(UIApplicationAccessibility *)v9 _accessibilityActiveScenes];
  id v7 = location[0];
  id v4 = (id)objc_msgSend(v5, "ax_filteredArrayUsingBlock:");
  id v6 = (id)[v4 firstObject];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

uint64_t __66__UIApplicationAccessibility__accessibilityWindowSceneForSceneID___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v15 = a3;
  char v14 = a4;
  id v13 = a1;
  char v12 = 0;
  objc_opt_class();
  id v11 = (id)__UIAccessibilityCastAsClass();
  id v10 = v11;
  objc_storeStrong(&v11, 0);
  id v5 = (id)[v10 _sceneIdentifier];
  char v6 = [v5 isEqualToString:a1[4]];

  if (v6)
  {
    *char v14 = 1;
    char v17 = 1;
  }
  else
  {
    char v17 = 0;
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (id)_accessibilityFocusContainer
{
  id v3 = [(UIApplicationAccessibility *)self _accessibilityPreferredFocusedWindow];
  id v4 = (id)[v3 _accessibilityFocusContainer];

  return v4;
}

- (id)_accessibilityFocusedScene
{
  id v3 = [(UIApplicationAccessibility *)self _accessibilityPreferredFocusedWindow];
  id v4 = (id)[v3 windowScene];

  return v4;
}

- (id)_accessibilityPreferredFocusedWindow
{
  char v9 = self;
  SEL v8 = a2;
  char v7 = 0;
  objc_opt_class();
  id v4 = [(UIApplicationAccessibility *)v9 _accessibilityFocusedScreen];
  id v3 = (id)[v4 safeValueForKey:@"_preferredFocusedWindow"];
  id v6 = (id)__UIAccessibilityCastAsClass();

  id v5 = v6;
  objc_storeStrong(&v6, 0);

  return v5;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 byGroup:(BOOL)a4
{
  BOOL v7 = a4;
  id v5 = [(UIApplicationAccessibility *)self _accessibilityFocusContainer];
  char v6 = [v5 _accessibilityMoveFocusWithHeading:a3 byGroup:v7];

  return v6 & 1;
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v11 = self;
  SEL v10 = a2;
  unint64_t v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v6 = [(UIApplicationAccessibility *)v11 _accessibilityPreferredFocusedWindow];
  id v5 = (id)[v6 windowScene];
  char v7 = [v5 _accessibilityMoveFocusWithHeading:v9 toElementMatchingQuery:location];

  objc_storeStrong(&location, 0);
  return v7 & 1;
}

- (void)_accessibilityDidFocusOnApplication
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = [(UIApplicationAccessibility *)self _accessibilityNativeFocusElement];
  if ([location[0] _accessibilityHandlesRemoteFocusMovement]) {
    [location[0] _accessibilitySetFocusOnElement:1];
  }
  objc_storeStrong(location, 0);
}

- (id)_responderForKeyEvents
{
  id location[2] = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIApplicationAccessibility;
  location[0] = [(UIApplicationAccessibility *)&v6 _responderForKeyEvents];
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && !_AXSFullKeyboardAccessPassthroughModeEnabled())
  {
    id v4 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
    id v5 = (id)[v4 safeValueForKey:@"_focusResponder"];
    if (v5) {
      objc_storeStrong(location, v5);
    }
    else {
      objc_storeStrong(location, location[0]);
    }
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_targetInChainForAction:(SEL)a3 sender:(id)a4
{
  id v19 = self;
  SEL v18 = a2;
  SEL v17 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v14.receiver = v19;
  v14.super_class = (Class)UIApplicationAccessibility;
  id v15 = [(UIApplicationAccessibility *)&v14 _targetInChainForAction:v17 sender:location];
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    char v12 = 0;
    objc_opt_class();
    id v9 = (id)[(UIApplicationAccessibility *)v19 safeValueForKey:@"_responderForKeyEvents"];
    id v11 = (id)__UIAccessibilityCastAsClass();

    id v10 = v11;
    objc_storeStrong(&v11, 0);
    id v13 = v10;
    while (1)
    {
      LOBYTE(v8) = 0;
      if (v13) {
        int v8 = [v13 canPerformAction:v17 withSender:location] ^ 1;
      }
      if ((v8 & 1) == 0) {
        break;
      }
      id v4 = (id)[v13 nextResponder];
      id v5 = v13;
      id v13 = v4;
    }
    if (v13) {
      objc_storeStrong(&v15, v13);
    }
    else {
      objc_storeStrong(&v15, v15);
    }
    objc_storeStrong(&v13, 0);
  }
  id v7 = v15;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&location, 0);

  return v7;
}

- (id)_axAuditCheckDynamicTextSupport:(char)a3 andClippingIssues:(char)a4 spinRunloop:
{
  uint64_t v228 = *MEMORY[0x263EF8340];
  id v220 = a1;
  char v219 = a2 & 1;
  char v218 = a3 & 1;
  char v217 = a4 & 1;
  if (!a1)
  {
    id v221 = 0;
    goto LABEL_75;
  }
  id v216 = (id)[MEMORY[0x263EFF980] array];
  id v215 = (id)[MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  id v214 = (id)[MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  id v213 = 0;
  id v212 = (id)[MEMORY[0x263F088B0] weakObjectsHashTable];
  v129 = (void *)MEMORY[0x263F811D8];
  id v132 = (id)[MEMORY[0x263F1C408] sharedApplication];
  id v131 = (id)[v132 _accessibilityMainWindow];
  id v130 = (id)[v131 rootViewController];
  id v211 = (id)objc_msgSend(v129, "_axAuditFindFrontmostViewControllerForHierarchy:");

  BOOL v133 = (void *)MEMORY[0x263F811D8];
  id v134 = (id)[v211 view];
  objc_msgSend(v133, "_axAuditCaptureReferenceToCellsForViewHierarchy:");

  id v135 = (id)[MEMORY[0x263F1C568] system];
  id v210 = (id)[v135 preferredContentSizeCategory];

  char v209 = [MEMORY[0x263F811D8] _axAuditSwizzleAwayContentSize:1] & 1;
  if (v209)
  {
    id v208 = (id)[MEMORY[0x263F811D8] _axAuditGetAllFontSizes];
    uint64_t v125 = (void *)MEMORY[0x263F811D8];
    id v126 = (id)[v211 view];
    id v207 = (id)objc_msgSend(v125, "_accessibilityGetAllSwiftUISubviews:withFiltering:");

    memset(__b, 0, sizeof(__b));
    id obj = v208;
    uint64_t v128 = [obj countByEnumeratingWithState:__b objects:v227 count:16];
    if (v128)
    {
      uint64_t v122 = *(void *)__b[2];
      uint64_t v123 = 0;
      unint64_t v124 = v128;
      while (1)
      {
        uint64_t v121 = v123;
        if (*(void *)__b[2] != v122) {
          objc_enumerationMutation(obj);
        }
        uint64_t v206 = *(void *)(__b[1] + 8 * v123);
        [MEMORY[0x263F811D8] _axAuditUIKitShouldReportFontSize:v206];
        if (v217) {
          [MEMORY[0x263F811D8] _axAuditSpinRunloopForDuration:0.1];
        }
        id v112 = (id)[v211 view];
        [v112 setNeedsLayout];

        id v113 = (id)[v211 view];
        [v113 layoutIfNeeded];

        id v114 = (void *)MEMORY[0x263F811D8];
        id v115 = (id)[v211 view];
        id v204 = (id)objc_msgSend(v114, "_accessibilityGetAllSubviews:withFiltering:");

        id v116 = (void *)MEMORY[0x263F811D8];
        id v118 = (id)[v211 view];
        id v117 = (id)objc_msgSend(v116, "_accessibilityGetAllSubviews:withFiltering:");
        id v203 = (id)[v117 mutableCopy];

        id v202 = (id)[v203 mutableCopy];
        [MEMORY[0x263F811D8] _axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:v204];
        id v201 = (id)MEMORY[0x2455E7040](&__block_literal_global_1027);
        id v200 = (id)MEMORY[0x2455E7040](&__block_literal_global_1032);
        [MEMORY[0x263F811D8] _axAuditRemoveUIViewsFromArray:v203 usingFilter:v201];
        [MEMORY[0x263F811D8] _axAuditRemoveUIViewsFromArray:v202 usingFilter:v200];
        id location = (id)[v211 view];
        [MEMORY[0x263F811D8] _axAuditUpdateReferenceOfCellsForViewHierarchy:location forFontSize:v206];
        memset(v197, 0, sizeof(v197));
        id v119 = v203;
        uint64_t v120 = [v119 countByEnumeratingWithState:v197 objects:v226 count:16];
        if (v120)
        {
          uint64_t v109 = *(void *)v197[2];
          uint64_t v110 = 0;
          unint64_t v111 = v120;
          while (1)
          {
            uint64_t v108 = v110;
            if (*(void *)v197[2] != v109) {
              objc_enumerationMutation(v119);
            }
            uint64_t v198 = *(void *)(v197[1] + 8 * v110);
            [MEMORY[0x263F811D8] _axAuditStoreFontForElement:v198 intoDictionary:v215 forCurrentFont:v206];
            ++v110;
            if (v108 + 1 >= v111)
            {
              uint64_t v110 = 0;
              unint64_t v111 = [v119 countByEnumeratingWithState:v197 objects:v226 count:16];
              if (!v111) {
                break;
              }
            }
          }
        }

        memset(v195, 0, sizeof(v195));
        id v106 = v207;
        uint64_t v107 = [v106 countByEnumeratingWithState:v195 objects:v225 count:16];
        if (v107)
        {
          uint64_t v103 = *(void *)v195[2];
          uint64_t v104 = 0;
          unint64_t v105 = v107;
          while (1)
          {
            uint64_t v102 = v104;
            if (*(void *)v195[2] != v103) {
              objc_enumerationMutation(v106);
            }
            uint64_t v196 = *(void *)(v195[1] + 8 * v104);
            [MEMORY[0x263F811D8] _axAuditStoreFontForSwiftUIView:v196 intoDictionary:v214 forCurrentFont:v206];
            [MEMORY[0x263F811D8] _axAuditCheckSwiftUIViewForClipping:v196 storeIntoSet:v212];
            ++v104;
            if (v102 + 1 >= v105)
            {
              uint64_t v104 = 0;
              unint64_t v105 = [v106 countByEnumeratingWithState:v195 objects:v225 count:16];
              if (!v105) {
                break;
              }
            }
          }
        }

        memset(v193, 0, sizeof(v193));
        id v100 = v202;
        uint64_t v101 = [v100 countByEnumeratingWithState:v193 objects:v224 count:16];
        if (v101)
        {
          uint64_t v97 = *(void *)v193[2];
          uint64_t v98 = 0;
          unint64_t v99 = v101;
          while (1)
          {
            uint64_t v96 = v98;
            if (*(void *)v193[2] != v97) {
              objc_enumerationMutation(v100);
            }
            uint64_t v194 = *(void *)(v193[1] + 8 * v98);
            [MEMORY[0x263F811D8] _axAuditCheckElementForClipping:v194 storeIntoSet:v212];
            ++v98;
            if (v96 + 1 >= v99)
            {
              uint64_t v98 = 0;
              unint64_t v99 = [v100 countByEnumeratingWithState:v193 objects:v224 count:16];
              if (!v99) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&location, 0);
        objc_storeStrong(&v200, 0);
        objc_storeStrong(&v201, 0);
        objc_storeStrong(&v202, 0);
        objc_storeStrong(&v203, 0);
        objc_storeStrong(&v204, 0);
        ++v123;
        if (v121 + 1 >= v124)
        {
          uint64_t v123 = 0;
          unint64_t v124 = [obj countByEnumeratingWithState:__b objects:v227 count:16];
          if (!v124) {
            break;
          }
        }
      }
    }

    [MEMORY[0x263F811D8] _axAuditUIKitShouldReportFontSize:v210];
    [MEMORY[0x263F811D8] _axAuditSwizzleAwayContentSize:0];
    [MEMORY[0x263F811D8] _axAuditSpinRunloopForDuration:0.1];
    id v92 = (id)[v211 view];
    id v4 = (id)[v92 accessibilityElements];

    Class v93 = (void *)MEMORY[0x263F811D8];
    id v95 = (id)[v211 view];
    id v94 = (id)objc_msgSend(v93, "_accessibilityGetAllSubviews:withFiltering:");
    objc_msgSend(v93, "_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:");

    id v192 = (id)[v211 view];
    id v191 = (id)[MEMORY[0x263F811D8] _axAuditDereferenceCellsForViewHierarchy:v192];
    id v190 = (id)[v191 objectForKey:@"Font Info for Cells"];
    id v189 = (id)[v191 objectForKey:@"Clipping Info for Cells"];
    [v220 _addEntriesToMapTable:v215 fromMapTable:v190];
    [v212 unionHashTable:v189];
    [MEMORY[0x263F811D8] _axAuditRemoveUnsupportedCategories:v215];
    id v5 = (id)[MEMORY[0x263F811D8] _axAuditFindElementsNotSupportingDynamicText:v215];
    id v6 = v213;
    id v213 = v5;

    id v188 = (id)[MEMORY[0x263F811D8] _axAuditFindElementsNotSupportingDynamicText:v214];
    [v220 _addEntriesToMapTable:v213 fromMapTable:v188];
    if (v219)
    {
      memset(v186, 0, sizeof(v186));
      id v90 = v213;
      uint64_t v91 = [v90 countByEnumeratingWithState:v186 objects:v223 count:16];
      if (v91)
      {
        uint64_t v87 = *(void *)v186[2];
        uint64_t v88 = 0;
        unint64_t v89 = v91;
        while (1)
        {
          uint64_t v86 = v88;
          if (*(void *)v186[2] != v87) {
            objc_enumerationMutation(v90);
          }
          id v187 = *(id *)(v186[1] + 8 * v88);
          id v185 = (id)[v213 objectForKey:v187];
          id v184 = (id)[NSDictionary dictionaryWithObject:v185 forKey:@"AuditIssueUnsupportedFontSizes"];
          uint64_t v183 = 3002;
          id v84 = (id)[v185 sortedArrayUsingSelector:0x1F72DC37BuLL];
          id v83 = (id)[v208 sortedArrayUsingSelector:0x1F72DC37BuLL];
          char v85 = objc_msgSend(v84, "isEqualToArray:");

          if (v85)
          {
            uint64_t v183 = 3001;
            objc_storeStrong(&v184, 0);
          }
          id v182 = 0;
          id v181 = 0;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v180 = v187;
            if ([v180 _accessibilityViewIsVisible])
            {
              id v7 = (id)[v180 window];
              BOOL v82 = v7 == 0;

              if (!v82)
              {
                uint64_t v177 = 0;
                uint64_t v178 = 0;
                id v81 = (id)[v180 superview];
                [v180 frame];
                *(double *)&long long v173 = v8;
                *((double *)&v173 + 1) = v9;
                uint64_t v174 = v10;
                uint64_t v175 = v11;
                long long v176 = v173;
                objc_msgSend(v81, "convertPoint:toView:", 0, v8, v9);
                uint64_t v177 = v12;
                uint64_t v178 = v13;

                long long v171 = 0u;
                long long v172 = 0u;
                [v180 bounds];
                uint64_t v167 = v14;
                uint64_t v168 = v15;
                uint64_t v169 = v16;
                uint64_t v170 = v17;
                [v180 bounds];
                uint64_t v163 = v18;
                uint64_t v164 = v19;
                uint64_t v165 = v20;
                uint64_t v166 = v21;
                CGRectMake_0();
                *(double *)&long long v171 = v22;
                *((double *)&v171 + 1) = v23;
                *(double *)&long long v172 = v24;
                *((double *)&v172 + 1) = v25;
                id v26 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v22, v23, v24, v25);
                id v27 = v182;
                id v182 = v26;
              }
              id v28 = (id)[MEMORY[0x263F811D8] _axAuditGetTextFromObject:v180];
              id v29 = v181;
              id v181 = v28;

              int v179 = 0;
            }
            else
            {
              int v179 = 11;
            }
            objc_storeStrong(&v180, 0);
            if (v179) {
              goto LABEL_50;
            }
          }
          else if ([MEMORY[0x263F811D8] _axAuditViewIsSwiftUI:v187])
          {
            id v80 = (id)[MEMORY[0x263F811D8] _axAuditGetAttrLabelFromSwiftUIView:v187];
            id v30 = (id)[v80 string];
            id v31 = v181;
            id v181 = v30;

            if (objc_opt_respondsToSelector())
            {
              long long v161 = 0u;
              long long v162 = 0u;
              [v187 accessibilityFrame];
              *(double *)&long long v161 = v32;
              *((double *)&v161 + 1) = v33;
              *(double *)&long long v162 = v34;
              *((double *)&v162 + 1) = v35;
              id v36 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v32, v33, v34, v35);
              id v37 = v182;
              id v182 = v36;
            }
          }
          id v160 = (id)objc_msgSend(MEMORY[0x263F81180], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", v183, v187, v184, 0, 0, 0, v182, v181);
          [v216 addObject:v160];
          objc_storeStrong(&v160, 0);
          int v179 = 0;
LABEL_50:
          objc_storeStrong(&v181, 0);
          objc_storeStrong(&v182, 0);
          objc_storeStrong(&v184, 0);
          objc_storeStrong(&v185, 0);
          ++v88;
          if (v86 + 1 >= v89)
          {
            uint64_t v88 = 0;
            unint64_t v89 = [v90 countByEnumeratingWithState:v186 objects:v223 count:16];
            if (!v89) {
              break;
            }
          }
        }
      }
    }
    if (v218)
    {
      memset(v158, 0, sizeof(v158));
      id v78 = v212;
      uint64_t v79 = [v78 countByEnumeratingWithState:v158 objects:v222 count:16];
      if (v79)
      {
        uint64_t v75 = *(void *)v158[2];
        uint64_t v76 = 0;
        unint64_t v77 = v79;
        while (1)
        {
          uint64_t v74 = v76;
          if (*(void *)v158[2] != v75) {
            objc_enumerationMutation(v78);
          }
          id v159 = *(id *)(v158[1] + 8 * v76);
          id v157 = 0;
          id v156 = 0;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v155 = v159;
            if ([v155 _accessibilityViewIsVisible])
            {
              id v38 = (id)[v155 window];
              BOOL v73 = v38 == 0;

              if (!v73)
              {
                uint64_t v153 = 0;
                uint64_t v154 = 0;
                id v72 = (id)[v155 superview];
                [v155 frame];
                *(double *)&long long v149 = v39;
                *((double *)&v149 + 1) = v40;
                uint64_t v150 = v41;
                uint64_t v151 = v42;
                long long v152 = v149;
                objc_msgSend(v72, "convertPoint:toView:", 0, v39, v40);
                uint64_t v153 = v43;
                uint64_t v154 = v44;

                long long v147 = 0u;
                long long v148 = 0u;
                [v155 bounds];
                uint64_t v143 = v45;
                uint64_t v144 = v46;
                uint64_t v145 = v47;
                uint64_t v146 = v48;
                [v155 bounds];
                uint64_t v139 = v49;
                uint64_t v140 = v50;
                uint64_t v141 = v51;
                uint64_t v142 = v52;
                CGRectMake_0();
                *(double *)&long long v147 = v53;
                *((double *)&v147 + 1) = v54;
                *(double *)&long long v148 = v55;
                *((double *)&v148 + 1) = v56;
                id v57 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v53, v54, v55, v56);
                id v58 = v157;
                id v157 = v57;
              }
              id v59 = (id)[MEMORY[0x263F811D8] _axAuditGetTextFromObject:v155];
              id v60 = v156;
              id v156 = v59;

              int v179 = 0;
            }
            else
            {
              int v179 = 13;
            }
            objc_storeStrong(&v155, 0);
            if (v179) {
              goto LABEL_70;
            }
          }
          else if ([MEMORY[0x263F811D8] _axAuditViewIsSwiftUI:v159])
          {
            id v71 = (id)[MEMORY[0x263F811D8] _axAuditGetAttrLabelFromSwiftUIView:v159];
            id v61 = (id)[v71 string];
            id v62 = v156;
            id v156 = v61;

            if (objc_opt_respondsToSelector())
            {
              long long v137 = 0u;
              long long v138 = 0u;
              [v159 accessibilityFrame];
              *(double *)&long long v137 = v63;
              *((double *)&v137 + 1) = v64;
              *(double *)&long long v138 = v65;
              *((double *)&v138 + 1) = v66;
              id v67 = (id)objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v63, v64, v65, v66);
              id v68 = v157;
              id v157 = v67;
            }
          }
          id v136 = (id)objc_msgSend(MEMORY[0x263F81180], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 3003, v159, 0, 0, 0, 0, v157, v156);
          [v216 addObject:v136];
          objc_storeStrong(&v136, 0);
          int v179 = 0;
LABEL_70:
          objc_storeStrong(&v156, 0);
          objc_storeStrong(&v157, 0);
          ++v76;
          if (v74 + 1 >= v77)
          {
            uint64_t v76 = 0;
            unint64_t v77 = [v78 countByEnumeratingWithState:v158 objects:v222 count:16];
            if (!v77) {
              break;
            }
          }
        }
      }
    }
    objc_storeStrong(&v188, 0);
    objc_storeStrong(&v189, 0);
    objc_storeStrong(&v190, 0);
    objc_storeStrong(&v191, 0);
    objc_storeStrong(&v192, 0);
    objc_storeStrong(&v207, 0);
    objc_storeStrong(&v208, 0);
    goto LABEL_74;
  }
  [MEMORY[0x263F811D8] _axAuditSwizzleAwayContentSize:0];
LABEL_74:
  id v221 = v216;
  int v179 = 1;
  objc_storeStrong(&v210, 0);
  objc_storeStrong(&v211, 0);
  objc_storeStrong(&v212, 0);
  objc_storeStrong(&v213, 0);
  objc_storeStrong(&v214, 0);
  objc_storeStrong(&v215, 0);
  objc_storeStrong(&v216, 0);
LABEL_75:
  os_log_type_t v69 = v221;

  return v69;
}

uint64_t __92__UIApplicationAccessibility__axAuditCheckDynamicTextSupport_andClippingIssues_spinRunloop___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char isKindOfClass = 1;
        if (([location[0] isHidden] & 1) == 0)
        {
          objc_opt_class();
          char isKindOfClass = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __92__UIApplicationAccessibility__axAuditCheckDynamicTextSupport_andClippingIssues_spinRunloop___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char isKindOfClass = 1;
  if (([location[0] isHidden] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)_addEntriesToMapTable:(id)a3 fromMapTable:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  memset(__b, 0, sizeof(__b));
  id v9 = (id)[v14 keyEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(v9);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v6);
      id v11 = (id)[v14 objectForKey:v13];
      [location[0] setObject:v11 forKey:v13];
      objc_storeStrong(&v11, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v9 countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v57.receiver = v60;
  v57.super_class = (Class)UIApplicationAccessibility;
  id v58 = [(UIApplicationAccessibility *)&v57 _accessibilityAuditIssuesWithOptions:location[0]];
  if (!v58)
  {
    id v3 = (id)[MEMORY[0x263EFF980] array];
    id v4 = v58;
    id v58 = v3;
  }
  unsigned __int8 v56 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:@"AXAuditShouldHonorGroupsOption" inDictionary:location[0]] & 1;
  id v55 = (id)[(UIApplicationAccessibility *)v60 _accessibilityAuditVisibleElementsHonoringGroups:v56];
  memset(__b, 0, sizeof(__b));
  id obj = v55;
  uint64_t v31 = [obj countByEnumeratingWithState:__b objects:v62 count:16];
  if (v31)
  {
    uint64_t v27 = *(void *)__b[2];
    uint64_t v28 = 0;
    unint64_t v29 = v31;
    while (1)
    {
      uint64_t v26 = v28;
      if (*(void *)__b[2] != v27) {
        objc_enumerationMutation(obj);
      }
      id v54 = *(id *)(__b[1] + 8 * v28);
      id v52 = (id)[MEMORY[0x263F811D8] _axAuditUnlabeledIssueDictForElement:v54 honorsGroups:v56 & 1];
      if (v52) {
        [v58 addObject:v52];
      }
      if (objc_opt_respondsToSelector())
      {
        id v51 = (id)[v54 _accessibilityAuditIssuesWithOptions:location[0]];
        [v58 axSafelyAddObjectsFromArray:v51];
        objc_storeStrong(&v51, 0);
      }
      objc_storeStrong(&v52, 0);
      ++v28;
      if (v26 + 1 >= v29)
      {
        uint64_t v28 = 0;
        unint64_t v29 = [obj countByEnumeratingWithState:__b objects:v62 count:16];
        if (!v29) {
          break;
        }
      }
    }
  }

  id v50 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21580] inDictionary:location[0]];
  id v49 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21570] inDictionary:location[0]];
  id v48 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21590] inDictionary:location[0]];
  id v47 = (id)[MEMORY[0x263F81180] optionsDictionaryForAuditTest:*MEMORY[0x263F21578] inDictionary:location[0]];
  char v46 = 0;
  double v25 = (void *)MEMORY[0x263F215D0];
  char v46 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*MEMORY[0x263F215D0] inDictionary:v50] & 1;
  char v45 = 0;
  char v45 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*v25 inDictionary:v49] & 1;
  char v44 = 0;
  char v44 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*v25 inDictionary:v48] & 1;
  char v43 = 0;
  char v43 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*MEMORY[0x263F215D8] inDictionary:v50] & 1;
  char v42 = 0;
  char v42 = [MEMORY[0x263F81180] checkBoolValueForOptionsKey:*v25 inDictionary:v47] & 1;
  id v41 = 0;
  id v40 = 0;
  id v39 = (id)[MEMORY[0x263EFF980] array];
  if (v46 & 1) != 0 || (v45)
  {
    id v5 = -[UIApplicationAccessibility _axAuditCheckDynamicTextSupport:andClippingIssues:spinRunloop:](v60, v46 & 1, v45 & 1, v43 & 1);
    id v6 = v41;
    id v41 = v5;
  }
  if (v44)
  {
    double v22 = (void *)MEMORY[0x263F811D8];
    id v24 = [(UIApplicationAccessibility *)v60 _accessibilityMainWindow];
    id v23 = (id)[v24 rootViewController];
    id v38 = (id)objc_msgSend(v22, "_axAuditFindFrontmostViewControllerForHierarchy:");

    id v37 = (id)[v38 view];
    id v7 = (id)[MEMORY[0x263F811D8] _axAuditFindDescendantInaccessibleElements:v37 honorsGroups:v56 & 1];
    id v8 = v40;
    id v40 = v7;

    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  if (v42)
  {
    uint64_t v15 = (void *)MEMORY[0x263F811D8];
    id v19 = (id)[MEMORY[0x263F1C408] sharedApplication];
    id v18 = (id)[v19 _accessibilityMainWindow];
    id v17 = (id)[v18 rootViewController];
    id v16 = (id)objc_msgSend(v15, "_axAuditFindFrontmostViewControllerForHierarchy:");
    id v36 = (id)[v16 view];

    id v35 = (id)[MEMORY[0x263F811D8] _accessibilityGetAllSwiftUISubviews:v36 withFiltering:1];
    memset(v33, 0, sizeof(v33));
    id v20 = v35;
    uint64_t v21 = [v20 countByEnumeratingWithState:v33 objects:v61 count:16];
    if (v21)
    {
      uint64_t v12 = *(void *)v33[2];
      uint64_t v13 = 0;
      unint64_t v14 = v21;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)v33[2] != v12) {
          objc_enumerationMutation(v20);
        }
        uint64_t v34 = *(void *)(v33[1] + 8 * v13);
        id v32 = (id)[MEMORY[0x263F811D8] _axAuditContrastDetectionForSwiftUIView:v34];
        [v39 addObjectsFromArray:v32];
        objc_storeStrong(&v32, 0);
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [v20 countByEnumeratingWithState:v33 objects:v61 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  if (v41) {
    [v58 addObjectsFromArray:v41];
  }
  if (v40) {
    [v58 addObjectsFromArray:v40];
  }
  if (v39) {
    [v58 addObjectsFromArray:v39];
  }
  id v10 = v58;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (id)_accessibilitySemanticContext
{
  id v8 = self;
  v7[1] = (id)a2;
  id v6 = [(UIApplicationAccessibility *)self _accessibilityMainWindow];
  id location = (id)[v6 rootViewController];
  v7[0] = -[UIApplicationAccessibility _accessibilityApplicationSemanticContextWithViewController:]((uint64_t)v8, location);

  if (!v7[0])
  {
    v7[0] = (id)[(id)*MEMORY[0x263F1D020] _accessibilityApplicationSemanticContext];

    if (!v7[0])
    {
      id v4 = (id)[(id)*MEMORY[0x263F1D020] delegate];
      v7[0] = (id)[v4 _accessibilityApplicationSemanticContext];
    }
  }
  id v3 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return v3;
}

- (id)_accessibilityApplicationSemanticContextWithViewController:(uint64_t)a1
{
  uint64_t v21 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v21)
  {
    id v18 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = location;
      id v16 = (id)[v17 visibleViewController];
      id v2 = (id)[v16 _accessibilityApplicationSemanticContext];
      id v3 = v18;
      id v18 = v2;

      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
    }
    if (!v18)
    {
      id v4 = (id)[location _accessibilityApplicationSemanticContext];
      id v5 = v18;
      id v18 = v4;
    }
    if (!v18)
    {
      id v11 = (id)[location childViewControllers];
      uint64_t v12 = [v11 count];

      uint64_t v15 = v12;
      for (uint64_t i = v12 - 1; i >= 0; --i)
      {
        id v10 = (id)[location childViewControllers];
        id v13 = (id)[v10 objectAtIndex:i];

        id v6 = (id)-[UIApplicationAccessibility _accessibilityApplicationSemanticContextWithViewController:](v21, v13);
        id v7 = v18;
        id v18 = v6;

        int v19 = v18 ? 2 : 0;
        objc_storeStrong(&v13, 0);
        if (v19) {
          break;
        }
      }
    }
    id v22 = v18;
    int v19 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v22 = 0;
    int v19 = 1;
  }
  objc_storeStrong(&location, 0);
  id v8 = v22;

  return v8;
}

- (id)_accessibilitySpeakThisViewController
{
  id v4 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
  id v3 = (id)[v4 rootViewController];
  id v5 = (id)[v3 _accessibilitySpeakThisViewController];

  return v5;
}

- (id)_accessibilityFirstElementsForSpeakThis
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v14 = self;
  v13[1] = (id)a2;
  id v17 = (dispatch_once_t *)&_accessibilityFirstElementsForSpeakThis_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_1054);
  if (*v17 != -1) {
    dispatch_once(v17, location);
  }
  objc_storeStrong(&location, 0);
  v13[0] = [(UIApplicationAccessibility *)v14 _accessibilitySpeakThisViewController];
  id v12 = (id)AXLogSpeakScreen();
  os_log_type_t v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v18, (uint64_t)v13[0]);
    _os_log_impl(&dword_2402B7000, (os_log_t)v12, v11, "Speak This view controller was %{public}@", v18, 0xCu);
  }
  objc_storeStrong(&v12, 0);
  id v2 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings);
  if (InstanceMethod == (Method)_accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod)
  {
    id v5 = (id)[v13[0] _accessibilitySpeakThisViews];
    id v7 = (id)[v5 firstObject];

    id v15 = (id)[v7 _accessibilityFirstElementsForSpeakThis];
    int v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    id v6 = (id)[v13[0] _accessibilitySpeakThisElementsAndStrings];
    id v9 = (id)[v6 mutableCopy];

    [v9 addObject:@"SpeakThis-LegacyMethodWasUsed"];
    id v15 = v9;
    int v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v13, 0);
  id v3 = v15;

  return v3;
}

Method __69__UIApplicationAccessibility__accessibilityFirstElementsForSpeakThis__block_invoke()
{
  id v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetSpeakThisRootElement
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisRootElement);
}

- (void)_accessibilitySetSpeakThisRootElement:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisRootElementAccessibilityIdentifier
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisRootElementAccessibilityIdentifier);
}

- (void)_accessibilitySetSpeakThisRootElementAccessibilityIdentifier:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession);
}

- (void)_accessibilitySetSpeakThisSceneIdentifierRequestedForActiveSpeakScreenSession:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession);
}

- (void)_accessibilitySetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySpeakThisRootElement
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = [(UIApplicationAccessibility *)self _accessibilityGetSpeakThisRootElement];
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

- (id)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return [(UIApplicationAccessibility *)self _accessibilityGetSpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession];
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = [(UIApplicationAccessibility *)self _accessibilitySpeakThisViewController];
  os_log_t oslog = (os_log_t)(id)AXLogSpeakScreen();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v6, (uint64_t)v5[0]);
    _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "Speak This view controller was %{public}@", v6, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v3 = (id)[v5[0] _accessibilitySpeakThisElementsAndStrings];
  objc_storeStrong(v5, 0);

  return v3;
}

- (id)_accessibilityUIAppFocusedOnContinuityDisplay
{
  return objc_getAssociatedObject(self, &__UIApplicationAccessibility___accessibilityUIAppFocusedOnContinuityDisplay);
}

- (void)_accessibilitySetUIAppFocusedOnContinuityDisplay:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityBeginMonitoringIdleRunLoop
{
  if (!_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver)
  {
    _accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver = (uint64_t)CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, &__block_literal_global_1063);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  }
  return 1;
}

void __70__UIApplicationAccessibility__accessibilityBeginMonitoringIdleRunLoop__block_invoke()
{
  UIAccessibilityPostNotification(0xFA2u, &unk_26F48EC08);
  CFTypeRef cf = (CFTypeRef)_accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver;
  _accessibilityBeginMonitoringIdleRunLoop_idleRunLoopObserver = 0;
  CFRelease(cf);
}

- (void)_finishButtonEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10.receiver = v12;
  v10.super_class = (Class)UIApplicationAccessibility;
  [(UIApplicationAccessibility *)&v10 _finishButtonEvent:location[0]];
  id v9 = (id)AXLogUIA();
  os_log_type_t v8 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    id v6 = (id)[location[0] allPresses];
    __os_log_helper_16_0_1_4_0((uint64_t)v14, [v6 count]);
    _os_log_impl(&dword_2402B7000, (os_log_t)v9, v8, "Received button event (%d)", v14, 8u);
  }
  objc_storeStrong(&v9, 0);
  if (_AXSAutomationEnabled())
  {
    os_log_t oslog = (os_log_t)(id)AXLogUIA();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      id v5 = (id)[location[0] allPresses];
      __os_log_helper_16_0_1_4_0((uint64_t)v13, [v5 count]);
      _os_log_impl(&dword_2402B7000, oslog, OS_LOG_TYPE_INFO, "Processed button event (%d)", v13, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v3 = (id)[location[0] allPresses];
    BOOL v4 = [v3 count] != 0;

    if (!v4) {
      UIAccessibilityPostNotification(0xFA2u, &unk_26F48EC58);
    }
  }
  objc_storeStrong(location, 0);
}

- (unsigned)_accessibilityGetLastMediaRemoteCommand
{
  return __UIAccessibilityGetAssociatedInt();
}

- (void)_accessibilitySetLastMediaRemoteCommand:(unsigned int)a3
{
}

- (uint64_t)_accessibilityCancelRewindOrFastForward
{
  if (a1)
  {
    char v3 = 0;
    int v2 = [a1 _accessibilityGetLastMediaRemoteCommand];
    if (v2 == 10 || v2 == 8)
    {
      MRMediaRemoteSendCommand();
      char v3 = 1;
    }
    char v4 = v3;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityNativeFocusElement
{
  id v7[2] = self;
  v7[1] = (id)a2;
  id v6 = [(UIApplicationAccessibility *)self _accessibilityFocusedScreen];
  v7[0] = (id)[v6 _accessibilityNativeFocusElement];

  if (!v7[0])
  {
    id v5 = (id)[MEMORY[0x263F1CBC8] _applicationKeyWindow];
    id v4 = (id)[v5 windowScene];
    v7[0] = (id)[v4 _accessibilityNativeFocusElement];
  }
  id v3 = v7[0];
  objc_storeStrong(v7, 0);

  return v3;
}

- (id)_accessibilityFocusedScreen
{
  v14[2] = self;
  v14[1] = (id)a2;
  uint64_t v8 = 0;
  id v9 = &v8;
  int v10 = 838860800;
  int v11 = 48;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  v14[0] = 0;
  AXPerformSafeBlock();
  id v5 = (void *)v9[5];
  char v6 = 0;
  if (v5)
  {
    id v2 = v5;
  }
  else
  {
    id v7 = (id)[MEMORY[0x263F1C920] mainScreen];
    char v6 = 1;
    id v2 = v7;
  }
  id v15 = v2;
  if (v6) {

  }
  _Block_object_dispose(&v8, 8);
  objc_storeStrong(v14, 0);
  id v3 = v15;

  return v3;
}

uint64_t __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke(uint64_t a1)
{
  uint64_t v9 = a1;
  uint64_t v8 = a1;
  uint64_t v2 = MEMORY[0x263EF8330];
  int v3 = -1073741824;
  int v4 = 0;
  id v5 = __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke_2;
  char v6 = &unk_2650AEA08;
  uint64_t v7 = *(void *)(a1 + 32);
  return objc_msgSend(MEMORY[0x263F1C920], "_enumerateScreensWithBlock:");
}

void __57__UIApplicationAccessibility__accessibilityFocusedScreen__block_invoke_2(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  int v11 = a3;
  v10[1] = a1;
  char v9 = 0;
  objc_opt_class();
  id v5 = (id)[location[0] safeValueForKey:@"_preferredFocusedWindow"];
  id v8 = (id)__UIAccessibilityCastAsClass();

  id v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  if (v7)
  {
    id v6 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v10[0]];
    if ([v6 safeBoolForKey:@"_isEnabled"])
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), location[0]);
      *int v11 = 1;
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = [(UIApplicationAccessibility *)self _accessibilityNativeFocusElement];
  if (location[0] != v6)
  {
    id obj = (id)[location[0] _accessibilityNativeFocusPreferredElement];
    if (obj) {
      objc_storeStrong(location, obj);
    }
    objc_storeStrong(&obj, 0);
  }
  if (([location[0] _accessibilityNativeFocusPreferredElementIsValid] & 1) == 0) {
    objc_storeStrong(location, 0);
  }
  id v3 = location[0];
  objc_storeStrong(location, 0);

  return v3;
}

- (id)_accessibilityExplorerElements
{
  char v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  [v8[0] setLeafNodePredicate:&__block_literal_global_1100];
  id v7 = (id)[(UIApplicationAccessibility *)v9 _accessibilityLeafDescendantsWithOptions:v8[0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id)[MEMORY[0x263EFF9D8] orderedSetWithArray:v7];
    id v2 = (id)[v6 array];
    id v3 = v7;
    id v7 = v2;

    objc_storeStrong(&v6, 0);
  }
  id v5 = (id)[(UIApplicationAccessibility *)v9 _accessibilitySortExplorerElements:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);

  return v5;
}

uint64_t __60__UIApplicationAccessibility__accessibilityExplorerElements__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  char v3 = [location[0] _isAccessibilityExplorerElement];
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityNativeFocusableElements:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(UIApplicationAccessibility *)v6 _accessibilityNativeFocusableElements:location[0] matchingBlock:0];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 withQueryString:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = v12;
  id v6 = location[0];
  id v9 = v10;
  id v8 = -[UIApplicationAccessibility _accessibilityNativeFocusableElements:matchingBlock:](v7, "_accessibilityNativeFocusableElements:matchingBlock:", v6);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);

  return v8;
}

uint64_t __84__UIApplicationAccessibility__accessibilityNativeFocusableElements_withQueryString___block_invoke(id *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v16 = a1;
  if ([a1[4] length])
  {
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location[0] _accessibilityAXAttributedUserInputLabelsIncludingFallbacks];
    uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      unint64_t v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(__b[1] + 8 * v8);
        id v4 = (id)[v15 localizedLowercaseString];
        id v3 = (id)[a1[4] localizedLowercaseString];
        char v5 = objc_msgSend(v4, "containsString:");

        if (v5) {
          break;
        }
        ++v8;
        if (v6 + 1 >= v9)
        {
          uint64_t v8 = 0;
          unint64_t v9 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v9) {
            goto LABEL_10;
          }
        }
      }
      char v18 = 1;
      int v13 = 1;
    }
    else
    {
LABEL_10:
      int v13 = 0;
    }

    if (!v13) {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 1;
  }
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4
{
  unint64_t v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  id v6 = [(UIApplicationAccessibility *)v9 _accessibilityNativeFocusableElements:location[0] matchingBlock:v7 forExistenceCheckOnly:0];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)_accessibilityNativeFocusableElements:(id)a3 matchingBlock:(id)a4 forExistenceCheckOnly:(BOOL)a5
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  BOOL v22 = a5;
  char v20 = 0;
  if (location[0])
  {
    objc_storeStrong(location, location[0]);
  }
  else
  {
    id v21 = (id)[MEMORY[0x263F1C408] sharedApplication];
    char v20 = 1;
    objc_storeStrong(location, v21);
  }
  if (v20) {

  }
  id v19 = (id)[MEMORY[0x263F81198] defaultFullKeyboardAccessOptions];
  id v9 = v19;
  uint64_t v13 = MEMORY[0x263EF8330];
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = __104__UIApplicationAccessibility__accessibilityNativeFocusableElements_matchingBlock_forExistenceCheckOnly___block_invoke;
  id v17 = &unk_2650AE8C0;
  id v18 = v23;
  [v9 setLeafNodePredicate:&v13];
  id v12 = 0;
  if (v22) {
    id v5 = (id)[location[0] _accessibilityLeafDescendantsWithCount:1 options:v19];
  }
  else {
    id v5 = (id)[location[0] _accessibilityLeafDescendantsWithOptions:v19];
  }
  id v6 = v12;
  id v12 = v5;

  id v8 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);

  return v8;
}

uint64_t __104__UIApplicationAccessibility__accessibilityNativeFocusableElements_matchingBlock_forExistenceCheckOnly___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ([location[0] _accessibilityCanBecomeNativeFocused])
  {
    char v3 = 1;
    if (a1[4]) {
      char v3 = (*(uint64_t (**)(void))(a1[4] + 16))();
    }
    char v6 = v3 & 1;
  }
  else
  {
    char v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (void)_accessibilityShowEditingHUD
{
  id v8[2] = self;
  v8[1] = (id)a2;
  if (AXDeviceIsPad())
  {
    id v3 = (id)[MEMORY[0x263F1C408] sharedApplication];
    id v2 = (id)[v3 _accessibilityMainWindow];
    v8[0] = (id)[v2 windowScene];

    id v7 = (id)[MEMORY[0x263F1CA90] activeTextEffectsWindowForWindowScene:v8[0]];
    id v6 = (id)[v7 safeValueForKey:@"_editingOverlayViewController"];
    id v5 = (id)[v6 safeValueForKey:@"undoInteraction"];
    id v4 = v5;
    AXPerformSafeBlock();
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
    objc_storeStrong(v8, 0);
  }
}

uint64_t __58__UIApplicationAccessibility__accessibilityShowEditingHUD__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoInteractiveHUDVisibility:", 1, a1, a1);
}

- (BOOL)_accessibilityApplicationIsModal
{
  return 0;
}

- (id)accessibilityElements
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIApplicationAccessibility;
  return [(UIApplicationAccessibility *)&v3 accessibilityElements];
}

@end