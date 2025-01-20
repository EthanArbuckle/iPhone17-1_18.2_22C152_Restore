@interface AXInvertColors_SpringBoard
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_SpringBoard

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFWakeAnimationSettings", @"sleepColorBrightness", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"isMainSwitcherVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SpringBoard", @"windowSceneManager", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowSceneManager", @"embeddedDisplayWindowScene", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"switcherController", "@", 0);
  [v3 validateClass:@"SBDashBoardCameraPageViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBDashBoardCameraPageViewController" hasInstanceVariable:@"_tintView" withType:"UIView"];
  [v3 validateClass:@"SBDashBoardCameraPageViewController" hasInstanceVariable:@"_maskView" withType:"UIView"];
  [v3 validateClass:@"SBDockView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBDockView" hasInstanceVariable:@"_backgroundView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTMaterialView", @"_materialLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainSwitcherControllerCoordinator", @"_activateNeighboringAppLayoutRequiringActiveAppLayout:appLayoutEnvironment:inForwardDirection:windowScene:eventLabel:", "v", "B", "q", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBFolderControllerBackgroundView", @"_tintColorForEffect:", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderControllerBackgroundView", @"_updateCurrentEffect", "v", 0);
  [v3 validateClass:@"SBDeviceApplicationSceneView" isKindOfClass:@"SBSceneView"];
  [v3 validateClass:@"SBSceneView" hasInstanceVariable:@"_backgroundView" withType:"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneView", @"setBackgroundView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneView", @"_refresh", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherAppSuggestionBannerView", @"_createIconViewForSuggestion:", "v", "@", 0);
  [v3 validateClass:@"SBSwitcherAppSuggestionBannerView" hasInstanceVariable:@"_iconView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconBadgeView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBWallpaperPreviewSnapshotCache", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWallpaperPreviewSnapshotCache", @"invalidateSnapshotsForLocations:", "v", "q", 0);
  [v3 validateClass:@"SBSearchBackdropView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayViewController", @"viewWillAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHomeScreenOverlayViewController", @"backgroundView", "@", 0);
  [v3 validateClass:@"SBHRootSidebarController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBAppSwitcherPageView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBAppSwitcherPageView" hasInstanceVariable:@"_shadowView" withType:"SBAppSwitcherPageShadowView"];
  [v3 validateClass:@"SBAppSwitcherPageShadowView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBFullscreenZoomView" hasInstanceVariable:@"_contentView" withType:"UIView"];
  [v3 validateClass:@"SBAppSwitcherPageView" hasInstanceVariable:@"_dimmingView" withType:"UIView"];
  [v3 validateClass:@"SBTransientOverlayWindow" isKindOfClass:@"UIWindow"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"delegate", "@", 0);
  [v3 validateClass:@"SBRemoteTransientOverlayViewController" hasInstanceVariable:@"_hostContentAdapter" withType:"SBRemoteTransientOverlayHostContentAdapter"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIRemoteViewController", @"serviceBundleIdentifier", "@", 0);
  [v3 validateClass:@"SBRemoteTransientOverlayHostViewController" isKindOfClass:@"_UIRemoteViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindow", @"_setDelegateViewController:", "v", "@", 0);
  [v3 validateClass:@"SBMainDisplaySceneLayoutStatusBarView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplaySceneLayoutStatusBarView", @"_layoutStatusBarForOrientation:", "v", "q", 0);
  [v3 validateClass:@"SBMainDisplaySceneLayoutStatusBarView" hasInstanceVariable:@"_statusBar" withType:"UIStatusBar"];
  [v3 validateClass:@"SBDeviceApplicationSceneViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSceneViewController", @"_sceneView", "@", 0);
  [v3 validateClass:@"SBDeviceApplicationSceneViewController" isKindOfClass:@"SBSceneViewController"];
  [v3 validateClass:@"SBDeviceApplicationSceneView"];
  [v3 validateClass:@"SBDeviceApplicationSceneView" isKindOfClass:@"SBApplicationSceneView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplicationSceneView", @"application", "@", 0);
  [v3 validateClass:@"SBMainWorkspaceApplicationSceneLayoutElementViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainWorkspaceApplicationSceneLayoutElementViewController", @"_applicationSceneViewController", "@", 0);
  [v3 validateClass:@"SBMedusaDecoratedDeviceApplicationSceneViewController"];
  [v3 validateClass:@"SBApplication"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBApplication", @"bundleIdentifier", "@", 0);
  [v3 validateClass:@"SBMainSwitcherControllerCoordinator" hasInstanceVariable:@"_switcherControllersByWindowScene" withType:"NSMapTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBSwitcherController", @"switcherWindow", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"SBRootSceneWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFluidSwitcherItemContainerHeaderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBAppSwitcherReusableSnapshotViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBIconBadgeViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBUIPasscodeLockViewBaseInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFloatyFolderViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBPowerDownViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBDashBoardWallpaperEffectViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBIconListPageControlInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBSwitcherAppSuggestionBannerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBWallpaperEffectViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHomeScreenPreviewViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBLockScreenPreviewViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBSearchBackdropViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBStatusBarLegibilityGradientViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFullscreenZoomViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHomeScreenBackdropDarkTintViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"_SBWallpaperSecureWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBMainDisplaySceneLayoutStatusBarViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBDockViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SpringBoardInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBDashBoardCameraPageViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBApplicationSceneBackgroundViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBMainSwitcherControllerCoordinatorInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBAppSwitcherPageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBTransientOverlayWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBFolderControllerBackgroundViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBHomeScreenOverlayViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"SBMainSwitcherWindowInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 2;
}

@end