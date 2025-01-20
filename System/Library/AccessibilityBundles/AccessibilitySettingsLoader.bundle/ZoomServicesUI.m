@interface ZoomServicesUI
+ (BOOL)_deviceIsPortrait;
+ (BOOL)_shouldUnmapPointsForFluidGestures;
+ (CGPoint)_unMappedZoomPoint:(CGPoint)a3;
+ (void)disableZoomServices;
+ (void)enableZoomServices;
- (BOOL)isRegisteredForAppNotifications;
- (CGRect)_keyboardFrameInScreenCoordinates;
- (Class)_accessibilityBundlePrincipalClass;
- (ZoomServicesUI)init;
- (void)_handleAlertWillAppearNotification:(id)a3;
- (void)_handleAppDidBecomeActiveNotification:(id)a3;
- (void)_handleAppDidEnterBackgroundNotification:(id)a3;
- (void)_handleAppSwitcherWillBeginRevealNotification:(id)a3;
- (void)_handleFirstResponderDidChangeNotification:(id)a3;
- (void)_handleKeyboardDidHideNotification:(id)a3;
- (void)_handleKeyboardWillHideNotification:(id)a3;
- (void)_handleKeyboardWillShowNotification:(id)a3;
- (void)_handleLockButtonWasPressedNotification:(id)a3;
- (void)_handleRegisterZoomConflictNotification:(id)a3;
- (void)_handleZoomFocusDidChangeNotification:(id)a3;
- (void)_installZoomUISafeCategoriesIfNeeded;
- (void)_registerForAppNotifications;
- (void)_unregisterForAppNotifications;
- (void)_updateForCurrentZoomStatus;
- (void)dealloc;
- (void)setRegisteredForAppNotifications:(BOOL)a3;
@end

@implementation ZoomServicesUI

+ (void)enableZoomServices
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsAXUIServer(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 82, @"%s", dlerror());

  __break(1u);
}

- (ZoomServicesUI)init
{
  v5.receiver = self;
  v5.super_class = (Class)ZoomServicesUI;
  v2 = [(ZoomServicesUI *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleZoomEnabledStatusDidChangeNotification_ name:*MEMORY[0x263F8B458] object:0];

    [(ZoomServicesUI *)v2 _updateForCurrentZoomStatus];
  }
  return v2;
}

- (void)setRegisteredForAppNotifications:(BOOL)a3
{
  self->_registeredForAppNotifications = a3;
}

- (void)_updateForCurrentZoomStatus
{
  if (_AXSZoomTouchEnabled())
  {
    [(ZoomServicesUI *)self _installZoomUISafeCategoriesIfNeeded];
    [(ZoomServicesUI *)self _registerForAppNotifications];
  }
  else
  {
    [(ZoomServicesUI *)self _unregisterForAppNotifications];
  }
}

- (void)_unregisterForAppNotifications
{
  if ([(ZoomServicesUI *)self isRegisteredForAppNotifications])
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x263F1CDA8] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F1CDA0] object:0];
    [v3 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F1D488] object:0];
    [v3 removeObserver:self name:*MEMORY[0x263F1D480] object:0];
    [v3 removeObserver:self name:@"ZoomUIAleartWillAppearNotification" object:0];
    if (soft_AXProcessIsSpringBoard())
    {
      [v3 removeObserver:self name:@"SBLockButtonPressedNotification" object:0];
      v4 = @"SBUIAppSwitcherRevealedNotification";
    }
    else
    {
      [v3 removeObserver:self name:*MEMORY[0x263F1D038] object:0];
      v4 = (__CFString *)*MEMORY[0x263F1D050];
    }
    [v3 removeObserver:self name:v4 object:0];
  }

  [(ZoomServicesUI *)self setRegisteredForAppNotifications:0];
}

- (BOOL)isRegisteredForAppNotifications
{
  return self->_registeredForAppNotifications;
}

+ (void)disableZoomServices
{
  v2 = (void *)_SharedZoomServicesUI;
  _SharedZoomServicesUI = 0;
}

+ (CGPoint)_unMappedZoomPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (CGRectIsEmpty(*(CGRect *)zoomFrame))
  {
    objc_super v5 = [getZoomServicesClass() sharedInstance];
    v6 = [MEMORY[0x263F1C920] mainScreen];
    v7 = [v6 displayIdentity];
    objc_msgSend(v5, "zoomFrameOnDisplay:", objc_msgSend(v7, "displayID"));
    *(void *)zoomFrame = v8;
    *(void *)&zoomFrame[8] = v9;
    *(void *)&zoomFrame[16] = v10;
    *(void *)&zoomFrame[24] = v11;
  }
  v22.double x = x;
  v22.double y = y;
  if (CGRectContainsPoint(*(CGRect *)zoomFrame, v22))
  {
    double v12 = (x - *(double *)zoomFrame) / *(double *)&zoomFrame[16];
    double v13 = (y - *(double *)&zoomFrame[8]) / *(double *)&zoomFrame[24];
    v14 = [MEMORY[0x263F1C920] mainScreen];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    double x = v12 * v16;
    double y = v13 * v18;
  }
  double v19 = x;
  double v20 = y;
  result.double y = v20;
  result.double x = v19;
  return result;
}

+ (BOOL)_deviceIsPortrait
{
  return (unint64_t)([(id)*MEMORY[0x263F1D020] activeInterfaceOrientation] - 1) < 2;
}

+ (BOOL)_shouldUnmapPointsForFluidGestures
{
  if (_AXSZoomTouchEnabled())
  {
    v2 = [getZoomServicesClass() sharedInstance];
    v3 = [MEMORY[0x263F1C920] mainScreen];
    v4 = [v3 displayIdentity];
    objc_super v5 = objc_msgSend(v2, "activeZoomModeOnDisplay:", objc_msgSend(v4, "displayID"));
    if ([v5 isEqualToString:*MEMORY[0x263F22788]]
      && (!soft_AXDeviceHasHomeButton() || soft_AXDeviceIsPad()))
    {
      BOOL v6 = !UIAccessibilityIsReduceMotionEnabled();
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  [(ZoomServicesUI *)self _unregisterForAppNotifications];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ZoomServicesUI;
  [(ZoomServicesUI *)&v4 dealloc];
}

- (Class)_accessibilityBundlePrincipalClass
{
  v2 = AXSystemRootDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/System/Library/AccessibilityBundles"];
  objc_super v4 = [v3 stringByAppendingPathComponent:@"UIKit"];
  objc_super v5 = [v4 stringByAppendingPathExtension:@"axbundle"];

  BOOL v6 = [MEMORY[0x263F086E0] bundleWithPath:v5];
  v7 = [v6 principalClass];

  return (Class)v7;
}

- (void)_registerForAppNotifications
{
  if (![(ZoomServicesUI *)self isRegisteredForAppNotifications])
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel__handleRegisterZoomConflictNotification_ name:*MEMORY[0x263F1CDA8] object:0];
    [v3 addObserver:self selector:sel__handleZoomFocusDidChangeNotification_ name:*MEMORY[0x263F1CDA0] object:0];
    [v3 addObserver:self selector:sel__handleFirstResponderDidChangeNotification_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
    [v3 addObserver:self selector:sel__handleKeyboardWillShowNotification_ name:*MEMORY[0x263F1D488] object:0];
    [v3 addObserver:self selector:sel__handleKeyboardWillHideNotification_ name:*MEMORY[0x263F1D480] object:0];
    [v3 addObserver:self selector:sel__handleKeyboardDidHideNotification_ name:*MEMORY[0x263F1D410] object:0];
    [v3 addObserver:self selector:sel__handleAlertWillAppearNotification_ name:@"ZoomUIAleartWillAppearNotification" object:0];
    if (soft_AXProcessIsSpringBoard())
    {
      [v3 addObserver:self selector:sel__handleLockButtonWasPressedNotification_ name:@"SBLockButtonPressedNotification" object:0];
      objc_super v4 = sel__handleAppSwitcherWillBeginRevealNotification_;
      objc_super v5 = @"SBUIAppSwitcherRevealedNotification";
    }
    else
    {
      [v3 addObserver:self selector:sel__handleAppDidBecomeActiveNotification_ name:*MEMORY[0x263F1D038] object:0];
      objc_super v4 = sel__handleAppDidEnterBackgroundNotification_;
      objc_super v5 = (__CFString *)*MEMORY[0x263F1D050];
    }
    [v3 addObserver:self selector:v4 name:v5 object:0];
  }

  [(ZoomServicesUI *)self setRegisteredForAppNotifications:1];
}

- (void)_installZoomUISafeCategoriesIfNeeded
{
  if (_installZoomUISafeCategoriesIfNeeded_onceToken != -1) {
    dispatch_once(&_installZoomUISafeCategoriesIfNeeded_onceToken, &__block_literal_global);
  }
}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke()
{
  uint64_t v4 = 0;
  objc_super v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getAXValidationManagerClass_softClass;
  uint64_t v7 = getAXValidationManagerClass_softClass;
  if (!getAXValidationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getAXValidationManagerClass_block_invoke;
    v3[3] = &unk_26509DAA8;
    v3[4] = &v4;
    __getAXValidationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  v2 = [v1 sharedInstance];
  [v2 performValidations:&__block_literal_global_323 withPreValidationHandler:&__block_literal_global_509 postValidationHandler:&__block_literal_global_515 safeCategoryInstallationHandler:&__block_literal_global_518];
}

uint64_t __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"UIAlertController"];
  [v2 validateClass:@"_UIAlertControllerPhoneTVMacView" hasInstanceVariable:@"_contentView" withType:"UIView"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIKeyShortcutHUDService", @"sharedHUDService", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyShortcutHUDService", @"dismissOrCancelHUDPresentationIfNeeded", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIKeyShortcutHUDService", @"_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDragInteraction", @"_sessionHandedOffDragImage:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDragInteraction", @"_sessionWillEnd:withOperation:", "v", "@", "Q", 0);
  if (soft_AXProcessIsSpringBoard())
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDashBoardLockScreenEnvironment", @"finishUIUnlockFromSource:", "v", "i", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityActivationAnimationStartDelay", "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityActivationAnimationWillBegin", "v", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityDeactivationAnimationStartDelay", "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"_accessibilityDeactivationAnimationWillBegin", "v", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilitySettings", @"yOffsetFactor", "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBReachabilitySettings", @"homeGestureSwipeDownHeight", "d", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBBacklightController", @"_undimFromSource:", "v", "q", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPanGestureRecognizer", @"translationInView:", "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPanGestureRecognizer", @"locationInView:", "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIPanGestureRecognizer", @"setTranslation:inView:", "v", "{CGPoint=dd}", "@", 0);
    uint64_t v3 = objc_opt_class();
    [v2 validateClass:@"UIPanGestureRecognizer" hasInstanceVariable:@"_lastSceneReferenceLocation" withType:soft___ax_verbose_encode_with_type_encoding_group_class(v3)];
    uint64_t v4 = objc_opt_class();
    [v2 validateClass:@"UIPanGestureRecognizer" hasInstanceVariable:@"_firstSceneReferenceLocation" withType:soft___ax_verbose_encode_with_type_encoding_group_class(v4)];
    [v2 validateClass:@"SBFluidSwitcherScreenEdgePanGestureRecognizer" isKindOfClass:@"UIPanGestureRecognizer"];
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherGestureManager", @"gestureRecognizer:shouldReceiveTouch:", "B", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherGestureManager", @"activateReachabilityGestureRecognizer", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherGestureManager", @"reachabilitySettings", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherGestureManager", @"switcherContentController", "@", 0);
    [v2 validateClass:@"UIScreenEdgePanGestureRecognizer" isKindOfClass:@"UIPanGestureRecognizer"];
    [v2 validateClass:@"SBHomeGesturePanGestureRecognizer" isKindOfClass:@"UIScreenEdgePanGestureRecognizer"];
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"handleFluidSwitcherGestureManager:didBeginGesture:", "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"handleFluidSwitcherGestureManager:didEndGesture:", "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"rootModifier", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBChainableModifier", @"enumerateChildModifiersWithBlock:", "v", "@?", 0);
    [v2 validateClass:@"SBHomeGestureSwitcherModifier" isKindOfClass:@"SBChainableModifier"];
    [v2 validateClass:@"SBHomeGestureRootSwitcherModifier" isKindOfClass:@"SBChainableModifier"];
    [v2 validateClass:@"SBFluidSwitcherRootSwitcherModifier" isKindOfClass:@"SBChainableModifier"];
    [v2 validateClass:@"SBSwitcherModifier" isKindOfClass:@"SBChainableModifier"];
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeGestureSwitcherModifier", @"currentFinalDestination", "q", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeGestureDockSwitcherModifier", @"_shouldPresentDockForFinalDestination:", "B", "q", 0);
    [v2 validateClass:@"SBHomeGestureSwitcherModifier" hasInstanceVariable:@"_dockModifier" withType:"SBHomeGestureDockSwitcherModifier"];
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITouch", @"locationInView:", "{CGPoint=dd}", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIGestureRecognizer", @"touchesBegan:withEvent:", "v", "@", "@", 0);
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIGestureRecognizer", @"touchesEnded:withEvent:", "v", "@", "@", 0);
    [v2 validateClass:@"SBReachabilityGestureRecognizer" isKindOfClass:@"UIGestureRecognizer"];
  }
  else if (soft_AXProcessIsInCallService())
  {
    objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PHSOSViewController", @"presentMedicalID", "v", 0);
  }

  return 1;
}

uint64_t __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Zoom UI"];
  [v2 setOverrideProcessName:@"Zoom UI"];
  [v2 setDebugBuild:0];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v3 = (uint64_t (*)(void))getAXPerformValidationChecksSymbolLoc_ptr;
  uint64_t v10 = getAXPerformValidationChecksSymbolLoc_ptr;
  if (!getAXPerformValidationChecksSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)AccessibilityUtilitiesLibrary();
    v8[3] = (uint64_t)dlsym(v4, "AXPerformValidationChecks");
    getAXPerformValidationChecksSymbolLoc_ptr = (_UNKNOWN *)v8[3];
    uint64_t v3 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1();
  }
  uint64_t v5 = v3();

  return v5;
}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 installSafeCategory:@"ZoomUI_UIAlertControllerOverride" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"ZoomUI_UIKeyShortcutHUDServiceOverride" canInteractWithTargetClass:1];
  [v4 installSafeCategory:@"ZoomUI_UIDragInteraction" canInteractWithTargetClass:1];
  if (soft_AXProcessIsSpringBoard())
  {
    id v2 = [getZoomServicesClass() sharedInstance];
    [v2 registerInterestInZoomAttributes];

    [v4 installSafeCategory:@"ZoomUI_SpringBoardOverride" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBDashBoardLockScreenEnvironmentOverride" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBReachabilitySettingsOverride" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBBacklightController" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBFluidSwitcherScreenEdgePanGestureRecognizer" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBFluidSwitcherViewController" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBFluidSwitcherGestureManager" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBHomeGesturePanGestureRecognizer" canInteractWithTargetClass:1];
    [v4 installSafeCategory:@"ZoomUI_SBReachabilityGestureRecognizer" canInteractWithTargetClass:1];
    uint64_t v3 = @"ZoomUI_UITouchReachabilityOverride";
  }
  else
  {
    if (!soft_AXProcessIsInCallService()) {
      goto LABEL_6;
    }
    uint64_t v3 = @"ZoomUI_PHSOSViewController";
  }
  [v4 installSafeCategory:v3 canInteractWithTargetClass:1];
LABEL_6:
}

- (CGRect)_keyboardFrameInScreenCoordinates
{
  if (soft_AXUIKeyboardIsOnScreen())
  {
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    uint64_t v10 = soft_AXUIKeyboardWindow();
    objc_msgSend(v10, "_convertRectToSceneReferenceSpace:", v3, v5, v7, v9);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    double v12 = *MEMORY[0x263F001A0];
    double v14 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v16 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (void)_handleFirstResponderDidChangeNotification:(id)a3
{
  double v3 = [a3 userInfo];
  double v4 = [v3 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 conformsToProtocol:&unk_26F4052A0];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke;
    v12[3] = &unk_26509D968;
    char v14 = v5;
    id v13 = v4;
    double v6 = (void *)MEMORY[0x2455E1020](v12);
    if (v5) {
      int64_t v7 = 200000000;
    }
    else {
      int64_t v7 = 0;
    }
    dispatch_time_t v8 = dispatch_time(0, v7);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke_2;
    block[3] = &unk_26509D990;
    id v11 = v6;
    id v9 = v6;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
}

void __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke(uint64_t a1)
{
  if (soft_AXUIKeyboardIsOnScreen())
  {
    double v2 = *MEMORY[0x263F001A8];
    double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
    if (*(unsigned char *)(a1 + 40))
    {
      id v6 = *(id *)(a1 + 32);
      int64_t v7 = [v6 endOfDocument];
      if (v7)
      {
        [v6 caretRectForPosition:v7];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        double v16 = [*(id *)(a1 + 32) window];
        objc_msgSend(v16, "convertRect:fromView:", *(void *)(a1 + 32), v9, v11, v13, v15);
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;

        v25 = [*(id *)(a1 + 32) window];
        objc_msgSend(v25, "convertRect:toWindow:", 0, v18, v20, v22, v24);
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        v34 = [*(id *)(a1 + 32) window];
        double v2 = soft_AXUIConvertRectFromScreenToContextSpace(v34, v27, v29, v31, v33);
        double v3 = v35;
        double v4 = v36;
        double v5 = v37;
      }
    }
    v75.origin.double x = v2;
    v75.origin.double y = v3;
    v75.size.width = v4;
    v75.size.height = v5;
    if (CGRectIsEmpty(v75))
    {
      [*(id *)(a1 + 32) bounds];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      v46 = [*(id *)(a1 + 32) window];
      objc_msgSend(v46, "convertRect:fromView:", *(void *)(a1 + 32), v39, v41, v43, v45);
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;

      v55 = [*(id *)(a1 + 32) window];
      objc_msgSend(v55, "convertRect:toWindow:", 0, v48, v50, v52, v54);
      double v57 = v56;
      double v59 = v58;
      double v61 = v60;
      double v63 = v62;

      v64 = [*(id *)(a1 + 32) window];
      double v2 = soft_AXUIConvertRectFromScreenToContextSpace(v64, v57, v59, v61, v63);
      double v3 = v65;
      double v4 = v66;
      double v5 = v67;
    }
    id v73 = [getZoomServicesClass() sharedInstance];
    v68 = [*(id *)(a1 + 32) window];
    uint64_t v69 = [v68 _contextId];
    v70 = [*(id *)(a1 + 32) window];
    v71 = [v70 screen];
    v72 = [v71 displayIdentity];
    objc_msgSend(v73, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 6, v69, objc_msgSend(v72, "displayID"), v2, v3, v4, v5);
  }
}

uint64_t __61__ZoomServicesUI__handleFirstResponderDidChangeNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleZoomFocusDidChangeNotification:(id)a3
{
  id v4 = a3;
  double v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"type"];
  uint64_t v7 = [v6 integerValue];

  if ((unint64_t)(v7 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v8 = [v4 userInfo];
    double v9 = [v8 objectForKey:@"frame"];
    NSRectFromString(v9);

    double v10 = [v4 userInfo];
    double v11 = [v10 objectForKey:@"window"];

    if (v7)
    {
      double v12 = *MEMORY[0x263F001A0];
      double v13 = *(double *)(MEMORY[0x263F001A0] + 8);
      double v14 = *(double *)(MEMORY[0x263F001A0] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A0] + 24);
    }
    else
    {
      [(ZoomServicesUI *)self _keyboardFrameInScreenCoordinates];
      double v12 = v16;
      double v13 = v17;
      double v14 = v18;
      double v15 = v19;
    }
    id v20 = v4;
    uint64_t v34 = 0;
    double v35 = &v34;
    uint64_t v36 = 0x2020000000;
    double v21 = (double (*)(id))getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr;
    double v37 = getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr;
    if (!getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr)
    {
      double v22 = (void *)AccessibilityUIUtilitiesLibrary();
      v35[3] = (uint64_t)dlsym(v22, "AXUIRectForZoomFocusChangeNotification");
      getAXUIRectForZoomFocusChangeNotificationSymbolLoc_ptr = (_UNKNOWN *)v35[3];
      double v21 = (double (*)(id))v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (!v21) {
      -[ZoomServicesUI _handleZoomFocusDidChangeNotification:]();
    }
    double v23 = v21(v20);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    double v30 = [getZoomServicesClass() sharedInstance];
    uint64_t v31 = [v11 _contextId];
    double v32 = [v11 screen];
    double v33 = [v32 displayIdentity];
    objc_msgSend(v30, "notifyZoomFocusDidChangeWithType:rect:contextId:keyboardFrame:displayId:", v7, v31, objc_msgSend(v33, "displayID"), v23, v25, v27, v29, v12, v13, v14, v15);
  }
}

- (void)_handleRegisterZoomConflictNotification:(id)a3
{
  id v5 = [a3 userInfo];
  double v3 = [getAXBackBoardServerClass() server];
  [v3 registerGestureConflictWithZoom:v5];

  id v4 = [getAXBackBoardServerClass() server];
  [v4 registerGestureConflictWithZoom:v5];
}

- (void)_handleKeyboardWillShowNotification:(id)a3
{
}

void __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke()
{
  if (soft_AXUIKeyboardIsOnScreen())
  {
    v0 = soft_AXUIKeyboardWindow();
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    objc_msgSend(v0, "_convertRectToSceneReferenceSpace:");
    double v2 = v1;
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;

    id v15 = [getZoomServicesClass() sharedInstance];
    double v9 = [MEMORY[0x263F086E0] mainBundle];
    double v10 = [v9 bundleIdentifier];
    double v11 = soft_AXUIKeyboardWindow();
    double v12 = [v11 screen];
    double v13 = [v12 displayIdentity];
    objc_msgSend(v15, "notifyZoomKeyboardWillBecomeVisibleWithFrame:inAppWithBundleID:displayID:", v10, objc_msgSend(v13, "displayID"), v2, v4, v6, v8);
  }
  else
  {
    double v14 = ZOOMLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke_cold_1(v14);
    }
  }
}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F1C710], "activeKeyboard", a3);

  if (v3)
  {
    id v11 = [getZoomServicesClass() sharedInstance];
    double v4 = [MEMORY[0x263F086E0] mainBundle];
    double v5 = [v4 bundleIdentifier];
    double v6 = [MEMORY[0x263F1C710] activeKeyboard];
    double v7 = [v6 window];
    double v8 = [v7 screen];
    double v9 = [v8 displayIdentity];
    objc_msgSend(v11, "notifyZoomKeyboardWillHideInAppWithBundleID:displayID:", v5, objc_msgSend(v9, "displayID"));
  }
  else
  {
    double v10 = ZOOMLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ZoomServicesUI _handleKeyboardWillHideNotification:](v10);
    }
  }
}

- (void)_handleKeyboardDidHideNotification:(id)a3
{
  double v3 = objc_msgSend(MEMORY[0x263F1C710], "activeKeyboard", a3);

  if (v3)
  {
    id v11 = [getZoomServicesClass() sharedInstance];
    double v4 = [MEMORY[0x263F086E0] mainBundle];
    double v5 = [v4 bundleIdentifier];
    double v6 = [MEMORY[0x263F1C710] activeKeyboard];
    double v7 = [v6 window];
    double v8 = [v7 screen];
    double v9 = [v8 displayIdentity];
    objc_msgSend(v11, "notifyZoomKeyboardDidHideInAppWithBundleID:displayID:", v5, objc_msgSend(v9, "displayID"));
  }
  else
  {
    double v10 = ZOOMLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ZoomServicesUI _handleKeyboardDidHideNotification:](v10);
    }
  }
}

- (void)_handleAlertWillAppearNotification:(id)a3
{
  id v3 = a3;
  double v4 = [v3 userInfo];
  double v5 = [v4 objectForKey:@"frame"];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v3 userInfo];

  id v15 = [v14 objectForKey:@"contextId"];
  uint64_t v16 = [v15 unsignedIntValue];

  id v17 = [getZoomServicesClass() sharedInstance];
  objc_msgSend(v17, "notifyZoomFocusDidChangeWithType:rect:contextId:displayId:", 7, v16, 0, v7, v9, v11, v13);
}

- (void)_handleLockButtonWasPressedNotification:(id)a3
{
  id v3 = [getZoomServicesClass() sharedInstance];
  [v3 notifyZoomLockButtonWasPressed];
}

- (void)_handleAppSwitcherWillBeginRevealNotification:(id)a3
{
  id v3 = [getZoomServicesClass() sharedInstance];
  [v3 notifyZoomAppSwitcherRevealAnimationWillBegin];
}

- (void)_handleAppDidBecomeActiveNotification:(id)a3
{
}

void __56__ZoomServicesUI__handleAppDidBecomeActiveNotification___block_invoke()
{
  if (soft_AXUIKeyboardIsOnScreen())
  {
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside();
    double v1 = v0;
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v8 = soft_AXUIKeyboardWindow();
    objc_msgSend(v8, "_convertRectToSceneReferenceSpace:", v1, v3, v5, v7);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v10 = *MEMORY[0x263F001A0];
    double v12 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v16 = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  id v19 = [getZoomServicesClass() sharedInstance];
  id v17 = [MEMORY[0x263F086E0] mainBundle];
  double v18 = [v17 bundleIdentifier];
  objc_msgSend(v19, "notifyZoomAppDidBecomeActive:keyboardFrameIfVisible:", v18, v10, v12, v14, v16);
}

- (void)_handleAppDidEnterBackgroundNotification:(id)a3
{
  id v5 = [getZoomServicesClass() sharedInstance];
  double v3 = [MEMORY[0x263F086E0] mainBundle];
  double v4 = [v3 bundleIdentifier];
  [v5 notifyZoomAppDidEnterBackground:v4];
}

void __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1()
{
  double v0 = [MEMORY[0x263F08690] currentHandler];
  double v1 = [NSString stringWithUTF8String:"BOOL soft_AXPerformValidationChecks(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 71, @"%s", dlerror());

  __break(1u);
}

- (void)_handleZoomFocusDidChangeNotification:.cold.1()
{
  double v0 = [MEMORY[0x263F08690] currentHandler];
  double v1 = [NSString stringWithUTF8String:"CGRect soft_AXUIRectForZoomFocusChangeNotification(NSNotification *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 44, @"%s", dlerror());

  __break(1u);
}

void __54__ZoomServicesUI__handleKeyboardWillShowNotification___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_debug_impl(&dword_24016D000, log, OS_LOG_TYPE_DEBUG, "Got a keyboard will show notification, but keyboard was not on screen.", v1, 2u);
}

- (void)_handleKeyboardWillHideNotification:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_24016D000, log, OS_LOG_TYPE_ERROR, "Got a keyboard will hide notification, but keyboard was not even present.", v1, 2u);
}

- (void)_handleKeyboardDidHideNotification:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_24016D000, log, OS_LOG_TYPE_ERROR, "Got a keyboard did hide notification, but keyboard was not even present.", v1, 2u);
}

@end