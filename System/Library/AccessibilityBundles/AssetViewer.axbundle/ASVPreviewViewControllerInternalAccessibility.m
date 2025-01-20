@interface ASVPreviewViewControllerInternalAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axActivateForEntityController:(id)a3 deltaYaw:(float)a4 deltaPitch:(float)a5;
- (BOOL)_axHasHandledLoadAX;
- (BOOL)_axIsAccessibilityElementForEntityController:(id)a3;
- (BOOL)_axIsFirstVisibilityAnnouncement;
- (BOOL)_axIsOffScreenForEntityController:(id)a3;
- (BOOL)_axIsOffScreenForEntityWrapper:(id)a3;
- (BOOL)_axShouldExposeControls;
- (BOOL)_axTranslateForLevitation:(BOOL)a3 delta:(id)a4 entityController:;
- (CGRect)_axBoundingRectForEntityController:(id)a3;
- (CGRect)_axBoundingRectForEntityWrapper:(id)a3;
- (CGRect)_axBoundsForControls;
- (CGRect)_axFrameForEntityController:(id)a3;
- (float)_axAssetScaleForEntityController:(id)a3;
- (float)_axLevitationHeightForEntityController:(id)a3;
- (id)_axARModeControls;
- (id)_axARModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4;
- (id)_axARView;
- (id)_axControlForRotationWithDeltaYaw:(float)a3 deltaPitch:(float)a4 nameFormat:(id)a5 hintFormat:(id)a6 shouldUseArrows:(BOOL)a7 entityController:(id)a8;
- (id)_axControlForScalingForEntityController:(id)a3;
- (id)_axControlForTranslationForLevitation:(BOOL)a3 delta:(id)a4 nameFormat:(id)a5 entityController:;
- (id)_axControlsViewStack;
- (id)_axCreateAssetElementForEntityController:(id)a3;
- (id)_axDescriptionForCurrentPitchForEntityController:(id)a3;
- (id)_axDescriptionForCurrentPositionForEntityController:(id)a3;
- (id)_axDescriptionForCurrentRotationForEntityController:(id)a3;
- (id)_axDescriptionForPitchInDegrees:(int64_t)a3;
- (id)_axDescriptionForRotationInDegrees:(int64_t)a3;
- (id)_axEntityControllers;
- (id)_axEntityElementsForEntityController:(id)a3;
- (id)_axEntityIdentifiersToOffScreenState;
- (id)_axEntityWrappersForEntityController:(id)a3;
- (id)_axIdentifierForEntityWrapper:(id)a3;
- (id)_axLabelForEntityController:(id)a3;
- (id)_axNameForEntityController:(id)a3;
- (id)_axNameForEntityWrapper:(id)a3;
- (id)_axObjectModeControls;
- (id)_axObjectModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4;
- (id)_axOverlayController;
- (id)_axRootEntityController;
- (id)_axRootEntityWrapperForEntityController:(id)a3;
- (id)_axTimerForVisibilityAnnouncements;
- (id)_axUnifiedGestureRecognizerForEntityController:(id)a3;
- (int64_t)_axEmitterMode;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAdjustScaleByMultiplier:(float)a3 entityController:(id)a4;
- (void)_axAnnotateAsControl:(id)a3;
- (void)_axCheckForAppearanceOfObjectsWithTimer:(id)a3;
- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forArrowTowardsEdge:(unint64_t)a5 isDoubleArrow:(BOOL)a6;
- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forRotationControlClockwise:(BOOL)a5;
- (void)_axResetToInitialScaleForEntityAction:(id)a3;
- (void)_axSetARModeControls:(id)a3;
- (void)_axSetEntityIdentifiersToOffScreenState:(id)a3;
- (void)_axSetHasHandledLoadAX:(BOOL)a3;
- (void)_axSetIsFirstVisibilityAnnouncement:(BOOL)a3;
- (void)_axSetObjectModeControls:(id)a3;
- (void)_axSetOffScreen:(BOOL)a3 forEntityController:(id)a4;
- (void)_axSetOffScreen:(BOOL)a3 forEntityWrapper:(id)a4;
- (void)_axSetTimerForVisibilityAnnouncements:(id)a3;
- (void)_axToggleVisibilityAnnouncementsIfNeeded;
- (void)_axUpdateARViewAccessibilityElements;
- (void)_axUpdateForAXSettings;
- (void)_axUpdateForOldEmitterMode:(int64_t)a3;
- (void)accessibilityDidSetUpEntityControllers;
- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4;
- (void)handleTapAtPointWithPoint:(CGPoint)a3;
- (void)updateInterfaceState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ASVPreviewViewControllerInternalAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASVPreviewViewControllerInternal";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ASVPreviewViewControllerInternal" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"AssetViewer.EntityController" conformsToProtocol:@"ASVUnifiedGestureRecognizerDelegate"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"currentlyDisallowsUnifiedGestureRecognizerAction", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"handleTapAtPointWithPoint:", "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"overlayController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityEntityControllers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityRootEntityController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityARView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"updateInterfaceState", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"entityController:doubleTappedAt:", "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityDidSetUpEntityControllers", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityShowControls", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASVPreviewViewControllerInternal", @"accessibilityDistanceInMetersFromEntityController:", "f", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQuickLookOverlayController", @"controlsViewStack", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"accessibilityAssetURL", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"assetYaw", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"assetPitch", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"assetScale", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"assetScreenPosition", "1", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"rotateByDeltaYaw:deltaPitch:", "v", "f", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"worldGestureRecognizer:translatedAssetToScreenPoint:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"worldGestureRecognizer:levitatedAssetToScreenPoint:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"scaleTo:updateARScale:", "v", "f", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"worldGestureRecognizer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"levitationHeight", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"calculateAssetScreenBoundingRectIn:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.EntityController", @"entityAccessibilityWrappers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidAppear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIViewController", @"viewDidDisappear:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AssetViewer.ARQLView", @"emitterMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"isEntityRoot", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"entityLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"rootEntityWrapper", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"isEntityActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.__EntityAccessibilityWrapper", @"calculateScreenBoundingRectIn:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RealityKit.ARView", @"accessibilityElementsForEntityWrappers:", "@", "@", 0);
}

- (BOOL)_axHasHandledLoadAX
{
  return MEMORY[0x270F0A438](self, &__ASVPreviewViewControllerInternalAccessibility___axHasHandledLoadAX);
}

- (void)_axSetHasHandledLoadAX:(BOOL)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v14.receiver = self;
  v14.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  [(ASVPreviewViewControllerInternalAccessibility *)&v14 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __91__ASVPreviewViewControllerInternalAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_265108640;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  [v3 _setAccessibilityFrameBlock:&v6];
  objc_msgSend(v3, "setAccessibilityNavigationStyle:", 2, v6, v7, v8, v9);
  [(ASVPreviewViewControllerInternalAccessibility *)self _axUpdateARViewAccessibilityElements];
  if (![(ASVPreviewViewControllerInternalAccessibility *)self _axHasHandledLoadAX])
  {
    [(ASVPreviewViewControllerInternalAccessibility *)self _axToggleVisibilityAnnouncementsIfNeeded];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__axDidToggleAXSetting_ name:*MEMORY[0x263F1CF90] object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel__axDidToggleAXSetting_ name:*MEMORY[0x263F1CEB8] object:0];

    [(ASVPreviewViewControllerInternalAccessibility *)self _axUpdateForAXSettings];
    [(ASVPreviewViewControllerInternalAccessibility *)self _axSetHasHandledLoadAX:1];
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

double __91__ASVPreviewViewControllerInternalAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  WeakRetained = (UIView *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 _axBoundsForControls];
  *(void *)&double v4 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v6, WeakRetained);

  return v4;
}

- (void)_axUpdateForAXSettings
{
  objc_opt_class();
  id v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axOverlayController];
  double v4 = __UIAccessibilityCastAsSafeCategory();

  if ([v4 axShouldDisableAutoHidingControls])
  {
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __71__ASVPreviewViewControllerInternalAccessibility__axUpdateForAXSettings__block_invoke;
    v8 = &unk_265108668;
    v9 = self;
    AXPerformSafeBlock();
  }
  objc_msgSend(v4, "axUpdateAutoHideControlsTimer", v5, v6, v7, v8, v9);
}

uint64_t __71__ASVPreviewViewControllerInternalAccessibility__axUpdateForAXSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityShowControls];
}

- (id)_axARView
{
  return (id)[(ASVPreviewViewControllerInternalAccessibility *)self safeUIViewForKey:@"accessibilityARView"];
}

- (id)_axControlsViewStack
{
  v2 = [(ASVPreviewViewControllerInternalAccessibility *)self _axOverlayController];
  id v3 = [v2 safeUIViewForKey:@"controlsViewStack"];

  return v3;
}

- (id)_axOverlayController
{
  return (id)[(ASVPreviewViewControllerInternalAccessibility *)self safeValueForKey:@"overlayController"];
}

- (id)_axEntityWrappersForEntityController:(id)a3
{
  return (id)[a3 safeArrayForKey:@"entityAccessibilityWrappers"];
}

- (id)_axRootEntityWrapperForEntityController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = -[ASVPreviewViewControllerInternalAccessibility _axEntityWrappersForEntityController:](self, "_axEntityWrappersForEntityController:", a3, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 safeBoolForKey:@"isEntityRoot"])
        {
          id v9 = v8;
LABEL_13:
          id v10 = v9;
          goto LABEL_14;
        }
        id v9 = [v8 safeValueForKey:@"rootEntityWrapper"];
        if (v9) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v10 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)_axNameForEntityWrapper:(id)a3
{
  return (id)[a3 safeStringForKey:@"entityLabel"];
}

- (id)_axNameForEntityController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityControllers];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [(ASVPreviewViewControllerInternalAccessibility *)self _axRootEntityWrapperForEntityController:v6];
  v8 = [(ASVPreviewViewControllerInternalAccessibility *)self _axNameForEntityWrapper:v7];

  if (![v8 length])
  {
    objc_opt_class();
    id v9 = [v4 safeValueForKey:@"accessibilityAssetURL"];
    id v10 = __UIAccessibilityCastAsClass();

    id v11 = [v10 URLByDeletingPathExtension];
    uint64_t v12 = [v11 lastPathComponent];

    v8 = (void *)v12;
  }
  if (![v8 length])
  {
    uint64_t v13 = accessibilityLocalizedString(@"DEFAULT_ASSET_NAME");

    v8 = (void *)v13;
  }

  return v8;
}

- (CGRect)_axBoundsForControls
{
  id v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlsViewStack];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 bounds];
    objc_msgSend(v3, "convertRect:fromView:", v13);
    CGFloat MaxY = CGRectGetMaxY(v19);
    double v11 = v11 - (MaxY - v7);
    double v7 = MaxY;
  }

  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forArrowTowardsEdge:(unint64_t)a5 isDoubleArrow:(BOOL)a6
{
  BOOL v6 = a6;
  [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundsForControls];
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  path = [MEMORY[0x263F1C478] bezierPath];
  if (a5 == 8 || a5 == 2)
  {
    v50.origin.x = v12;
    v50.origin.y = v14;
    v50.size.width = v16;
    v50.size.height = v18;
    double MinY = CGRectGetMinY(v50);
    v51.origin.x = v12;
    v51.origin.y = v14;
    v51.size.width = v16;
    v51.size.height = v18;
    double v20 = MinY + (CGRectGetHeight(v51) + -80.0) * 0.5;
    if (a5 == 2)
    {
      CGFloat v21 = 50.0;
      CGFloat v22 = 80.0;
      v52.origin.x = v12;
      v52.origin.y = v20;
      v52.size.width = 50.0;
      v52.size.height = 80.0;
      double MinX = CGRectGetMinX(v52);
      v53.origin.x = v12;
      v53.origin.y = v20;
      v53.size.width = 50.0;
      v53.size.height = 80.0;
      -[UIBezierPath moveToPoint:](path, "moveToPoint:", MinX, CGRectGetMidY(v53));
      v54.origin.x = v12;
      v54.origin.y = v20;
      v54.size.width = 50.0;
      v54.size.height = 80.0;
      double MaxX = CGRectGetMaxX(v54);
      v55.origin.x = v12;
      v55.origin.y = v20;
      v55.size.width = 50.0;
      v55.size.height = 80.0;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", MaxX, CGRectGetMinY(v55));
      v56.origin.x = v12;
      v56.origin.y = v20;
      v56.size.width = 50.0;
      v56.size.height = 80.0;
      double v25 = CGRectGetMaxX(v56);
      v57.origin.x = v12;
      v57.origin.y = v20;
      v57.size.width = 50.0;
      v57.size.height = 80.0;
      CGFloat MaxY = CGRectGetMaxY(v57);
      v27 = path;
      double v28 = MaxY;
      double v29 = v12;
    }
    else
    {
      v58.origin.x = v12;
      v58.origin.y = v14;
      v58.size.width = v16;
      v58.size.height = v18;
      double v29 = CGRectGetMaxX(v58) + -50.0;
      CGFloat v21 = 50.0;
      CGFloat v22 = 80.0;
      v59.origin.x = v29;
      v59.origin.y = v20;
      v59.size.width = 50.0;
      v59.size.height = 80.0;
      double v30 = CGRectGetMaxX(v59);
      v60.origin.x = v29;
      v60.origin.y = v20;
      v60.size.width = 50.0;
      v60.size.height = 80.0;
      -[UIBezierPath moveToPoint:](path, "moveToPoint:", v30, CGRectGetMidY(v60));
      v61.origin.x = v29;
      v61.origin.y = v20;
      v61.size.width = 50.0;
      v61.size.height = 80.0;
      double v31 = CGRectGetMinX(v61);
      v62.origin.x = v29;
      v62.origin.y = v20;
      v62.size.width = 50.0;
      v62.size.height = 80.0;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v31, CGRectGetMinY(v62));
      v63.origin.x = v29;
      v63.origin.y = v20;
      v63.size.width = 50.0;
      v63.size.height = 80.0;
      double v25 = CGRectGetMinX(v63);
      v64.origin.x = v29;
      v64.origin.y = v20;
      v64.size.width = 50.0;
      v64.size.height = 80.0;
      CGFloat v32 = CGRectGetMaxY(v64);
      v27 = path;
      double v28 = v32;
    }
    double v14 = v20;
    goto LABEL_22;
  }
  CGFloat v22 = 75.0;
  if (v6) {
    double v33 = 75.0;
  }
  else {
    double v33 = 50.0;
  }
  v65.origin.x = v12;
  v65.origin.y = v14;
  v65.size.width = v16;
  v65.size.height = v18;
  double v34 = CGRectGetMinX(v65);
  v66.origin.x = v12;
  v66.origin.y = v14;
  v66.size.width = v16;
  v66.size.height = v18;
  double v29 = v34 + (CGRectGetWidth(v66) + -80.0) * 0.5;
  if (a5 == 4) {
    goto LABEL_15;
  }
  if (a5 != 1)
  {
    unint64_t v47 = a5;
    _AXAssert();
LABEL_15:
    v76.origin.x = v12;
    v76.origin.y = v14;
    v76.size.width = v16;
    v76.size.height = v18;
    double v14 = CGRectGetMaxY(v76) - v33;
    CGFloat v21 = 80.0;
    v77.origin.x = v29;
    v77.origin.y = v14;
    v77.size.width = 80.0;
    v77.size.height = v33;
    double MidX = CGRectGetMidX(v77);
    v78.origin.x = v29;
    v78.origin.y = v14;
    v78.size.width = 80.0;
    v78.size.height = v33;
    -[UIBezierPath moveToPoint:](path, "moveToPoint:", MidX, CGRectGetMaxY(v78));
    v79.origin.x = v29;
    v79.origin.y = v14;
    v79.size.width = 80.0;
    v79.size.height = v33;
    double v41 = CGRectGetMinY(v79);
    if (v6)
    {
      double v28 = v41 + 25.0;
      v80.origin.x = v29;
      v80.origin.y = v14;
      v80.size.width = 80.0;
      v80.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v80), v28);
      v81.origin.x = v29;
      v81.origin.y = v14;
      v81.size.width = 80.0;
      v81.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v81) + 20.0, v28);
      v82.origin.x = v29;
      v82.origin.y = v14;
      v82.size.width = 80.0;
      v82.size.height = v33;
      double v42 = CGRectGetMinX(v82);
      v83.origin.x = v29;
      v83.origin.y = v14;
      v83.size.width = 80.0;
      v83.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v42, CGRectGetMinY(v83));
      v84.origin.x = v29;
      v84.origin.y = v14;
      v84.size.width = 80.0;
      v84.size.height = v33;
      double v38 = CGRectGetMaxX(v84);
      v85.origin.x = v29;
      v85.origin.y = v14;
      v85.size.width = 80.0;
      v85.size.height = v33;
      double v39 = CGRectGetMinY(v85);
      goto LABEL_17;
    }
    v88.origin.x = v29;
    v88.origin.y = v14;
    v88.size.width = 80.0;
    v88.size.height = v33;
    double v43 = CGRectGetMinX(v88);
    v89.origin.x = v29;
    v89.origin.y = v14;
    v89.size.width = 80.0;
    v89.size.height = v33;
    -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v43, CGRectGetMinY(v89));
    v90.origin.x = v29;
    v90.origin.y = v14;
    v90.size.width = 80.0;
    v90.size.height = v33;
    double v25 = CGRectGetMaxX(v90);
    v91.origin.x = v29;
    v91.origin.y = v14;
    v91.size.width = 80.0;
    v91.size.height = v33;
    double v44 = CGRectGetMinY(v91);
LABEL_20:
    double v28 = v44;
    CGFloat v22 = 50.0;
    goto LABEL_21;
  }
  CGFloat v21 = 80.0;
  v67.origin.x = v29;
  v67.origin.y = v14;
  v67.size.width = 80.0;
  v67.size.height = v33;
  double v35 = CGRectGetMidX(v67);
  v68.origin.x = v29;
  v68.origin.y = v14;
  v68.size.width = 80.0;
  v68.size.height = v33;
  -[UIBezierPath moveToPoint:](path, "moveToPoint:", v35, CGRectGetMinY(v68));
  v69.origin.x = v29;
  v69.origin.y = v14;
  v69.size.width = 80.0;
  v69.size.height = v33;
  double v36 = CGRectGetMaxY(v69);
  if (!v6)
  {
    v92.origin.x = v29;
    v92.origin.y = v14;
    v92.size.width = 80.0;
    v92.size.height = v33;
    double v45 = CGRectGetMinX(v92);
    v93.origin.x = v29;
    v93.origin.y = v14;
    v93.size.width = 80.0;
    v93.size.height = v33;
    -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v45, CGRectGetMaxY(v93));
    v94.origin.x = v29;
    v94.origin.y = v14;
    v94.size.width = 80.0;
    v94.size.height = v33;
    double v25 = CGRectGetMaxX(v94);
    v95.origin.x = v29;
    v95.origin.y = v14;
    v95.size.width = 80.0;
    v95.size.height = v33;
    double v44 = CGRectGetMaxY(v95);
    goto LABEL_20;
  }
  double v28 = v36 + -25.0;
  v70.origin.x = v29;
  v70.origin.y = v14;
  v70.size.width = 80.0;
  v70.size.height = v33;
  -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v70), v28);
  v71.origin.x = v29;
  v71.origin.y = v14;
  v71.size.width = 80.0;
  v71.size.height = v33;
  -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v71) + 20.0, v28);
  v72.origin.x = v29;
  v72.origin.y = v14;
  v72.size.width = 80.0;
  v72.size.height = v33;
  double v37 = CGRectGetMinX(v72);
  v73.origin.x = v29;
  v73.origin.y = v14;
  v73.size.width = 80.0;
  v73.size.height = v33;
  -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v37, CGRectGetMaxY(v73));
  v74.origin.x = v29;
  v74.origin.y = v14;
  v74.size.width = 80.0;
  v74.size.height = v33;
  double v38 = CGRectGetMaxX(v74);
  v75.origin.x = v29;
  v75.origin.y = v14;
  v75.size.width = 80.0;
  v75.size.height = v33;
  double v39 = CGRectGetMaxY(v75);
LABEL_17:
  -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v38, v39, v47);
  v86.origin.x = v29;
  v86.origin.y = v14;
  v86.size.width = 80.0;
  v86.size.height = v33;
  -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMaxX(v86) + -20.0, v28);
  v87.origin.x = v29;
  v87.origin.y = v14;
  v87.size.width = 80.0;
  v87.size.height = v33;
  double v25 = CGRectGetMaxX(v87);
LABEL_21:
  v27 = path;
LABEL_22:
  -[UIBezierPath addLineToPoint:](v27, "addLineToPoint:", v25, v28, v47);
  [(UIBezierPath *)path closePath];
  v46 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  v96.origin.x = v29;
  v96.origin.y = v14;
  v96.size.width = v21;
  v96.size.height = v22;
  *a3 = UIAccessibilityConvertFrameToScreenCoordinates(v96, v46);
  UIAccessibilityConvertPathToScreenCoordinates(path, v46);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
}

- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forRotationControlClockwise:(BOOL)a5
{
  BOOL v5 = a5;
  [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundsForControls];
  AX_CGRectGetCenter();
  double v11 = v9;
  double v12 = v10;
  if (v5) {
    double v13 = 2.35619449;
  }
  else {
    double v13 = 0.785398163;
  }
  if (v5) {
    double v14 = 3.92699082;
  }
  else {
    double v14 = -0.785398163;
  }
  if (v5) {
    double v15 = 4.3196899;
  }
  else {
    double v15 = -1.17809725;
  }
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v5, v9, v10, 125.0, v13, v14);
  CGFloat v16 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  __double2 v17 = __sincos_stret(v15);
  -[UIBezierPath addLineToPoint:](v16, "addLineToPoint:", v11 + v17.__cosval * 100.0, v12 + v17.__sinval * 100.0);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v5 ^ 1, v11, v12, 75.0, v14, v13);
  [(UIBezierPath *)v16 closePath];
  CGFloat v18 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  CGRect v19 = UIAccessibilityConvertPathToScreenCoordinates(v16, v18);

  id v20 = v19;
  *a4 = v20;
  id v21 = v20;
  *a3 = CGPathGetPathBoundingBox((CGPathRef)[v21 CGPath]);
}

- (BOOL)_axShouldExposeControls
{
  return [(ASVPreviewViewControllerInternalAccessibility *)self safeBoolForKey:@"currentlyDisallowsUnifiedGestureRecognizerAction"] ^ 1;
}

- (void)_axAnnotateAsControl:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__ASVPreviewViewControllerInternalAccessibility__axAnnotateAsControl___block_invoke;
  v5[3] = &unk_265108690;
  objc_copyWeak(&v6, &location);
  [v4 _setIsAccessibilityElementBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __70__ASVPreviewViewControllerInternalAccessibility__axAnnotateAsControl___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _axShouldExposeControls];

  return v2;
}

- (id)_axDescriptionForRotationInDegrees:(int64_t)a3
{
  double v3 = round((double)a3 / 5.0) * 5.0;
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = 180;
  if ((uint64_t)v3 < 180) {
    uint64_t v5 = (uint64_t)v3;
  }
  unint64_t v6 = 360 * ((v4 - v5 + 359) / 0x168uLL);
  unint64_t v7 = v4 - v6;
  uint64_t v8 = -180;
  if ((uint64_t)(v4 - v6) > -180) {
    uint64_t v8 = v4 - v6;
  }
  unint64_t v9 = v8 + v6;
  BOOL v10 = v9 == v4;
  unint64_t v11 = (v9 - v4 - (v9 != v4)) / 0x168;
  if (!v10) {
    ++v11;
  }
  unint64_t v12 = v7 + 360 * v11;
  if (v12 == -180 || v12 == 180)
  {
    double v13 = @"ROTATE_TO_180_ANNOUNCEMENT";
  }
  else
  {
    if (v12)
    {
      double v15 = NSString;
      if ((v12 & 0x8000000000000000) != 0)
      {
        CGFloat v16 = accessibilityLocalizedString(@"ROTATE_TO_CLOCKWISE_ANNOUNCEMENT");
        objc_msgSend(v15, "localizedStringWithFormat:", v16, -(uint64_t)v12);
      }
      else
      {
        CGFloat v16 = accessibilityLocalizedString(@"ROTATE_TO_COUNTERCLOCKWISE_ANNOUNCEMENT");
        objc_msgSend(v15, "localizedStringWithFormat:", v16, v12);
      double v14 = };

      goto LABEL_17;
    }
    double v13 = @"ROTATE_TO_ZERO_ANNOUNCEMENT";
  }
  double v14 = accessibilityLocalizedString(v13);
LABEL_17:

  return v14;
}

- (id)_axDescriptionForPitchInDegrees:(int64_t)a3
{
  double v3 = round((double)a3 / 5.0) * 5.0;
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = 180;
  if ((uint64_t)v3 < 180) {
    uint64_t v5 = (uint64_t)v3;
  }
  unint64_t v6 = 360 * ((v4 - v5 + 359) / 0x168uLL);
  unint64_t v7 = v4 - v6;
  uint64_t v8 = -180;
  if ((uint64_t)(v4 - v6) > -180) {
    uint64_t v8 = v4 - v6;
  }
  unint64_t v9 = v8 + v6;
  BOOL v10 = v9 == v4;
  unint64_t v11 = (v9 - v4 - (v9 != v4)) / 0x168;
  if (!v10) {
    ++v11;
  }
  unint64_t v12 = v7 + 360 * v11;
  if (v12 == -180 || v12 == 180)
  {
    double v13 = @"UPSIDE_DOWN_ANNOUNCEMENT";
  }
  else
  {
    if (v12)
    {
      double v15 = NSString;
      if ((v12 & 0x8000000000000000) != 0)
      {
        CGFloat v16 = accessibilityLocalizedString(@"TILTED_AWAY_ANNOUNCEMENT");
        objc_msgSend(v15, "localizedStringWithFormat:", v16, -(uint64_t)v12);
      }
      else
      {
        CGFloat v16 = accessibilityLocalizedString(@"TILTED_TOWARD_ANNOUNCEMENT");
        objc_msgSend(v15, "localizedStringWithFormat:", v16, v12);
      double v14 = };

      goto LABEL_17;
    }
    double v13 = @"NOT_TILTED_ANNOUNCEMENT";
  }
  double v14 = accessibilityLocalizedString(v13);
LABEL_17:

  return v14;
}

- (id)_axDescriptionForCurrentRotationForEntityController:(id)a3
{
  [a3 safeFloatForKey:@"assetYaw"];

  return [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForRotationInDegrees:(uint64_t)(v4 / 0.0174532925)];
}

- (id)_axDescriptionForCurrentPitchForEntityController:(id)a3
{
  [a3 safeFloatForKey:@"assetPitch"];

  return [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForPitchInDegrees:(uint64_t)(v4 / 0.0174532925)];
}

- (id)_axLabelForEntityController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axNameForEntityController:v4];
  int64_t v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode];
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      unint64_t v7 = @"ASSET_IS_NOT_PLACED";
    }
    else
    {
      if (![(ASVPreviewViewControllerInternalAccessibility *)self _axIsOffScreenForEntityController:v4])goto LABEL_10; {
      unint64_t v7 = @"ASSET_IS_OFF_SCREEN";
      }
    }
    uint64_t v8 = accessibilityLocalizedString(v7);
    uint64_t v9 = __UIAXStringForVariables();
  }
  else
  {
    if (![(ASVPreviewViewControllerInternalAccessibility *)self _axShouldExposeControls]) {
      goto LABEL_10;
    }
    uint64_t v8 = [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForCurrentRotationForEntityController:v4];
    uint64_t v11 = [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForCurrentPitchForEntityController:v4];
    uint64_t v9 = __UIAXStringForVariables();

    uint64_t v5 = (void *)v11;
  }

  uint64_t v5 = (void *)v9;
LABEL_10:

  return v5;
}

- (CGRect)_axFrameForEntityController:(id)a3
{
  id v4 = a3;
  [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundsForControls];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (([(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundingRectForEntityController:v4];
    v31.origin.double x = v6;
    v31.origin.double y = v8;
    v31.size.double width = v10;
    v31.size.double height = v12;
    CGRect v27 = CGRectIntersection(v26, v31);
    double x = v27.origin.x;
    double y = v27.origin.y;
    double width = v27.size.width;
    double height = v27.size.height;
    if (!CGRectIsNull(v27))
    {
      CGFloat v12 = height;
      CGFloat v10 = width;
      CGFloat v8 = y;
      CGFloat v6 = x;
    }
  }
  __double2 v17 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  CGRect v29 = UIAccessibilityConvertFrameToScreenCoordinates(v28, v17);
  CGFloat v18 = v29.origin.x;
  CGFloat v19 = v29.origin.y;
  CGFloat v20 = v29.size.width;
  CGFloat v21 = v29.size.height;

  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)_axIsAccessibilityElementForEntityController:(id)a3
{
  double v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityElementsForEntityController:a3];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)_axCreateAssetElementForEntityController:(id)a3
{
  id v4 = a3;
  double v5 = [AXEntityControllerElement alloc];
  CGFloat v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  double v7 = [(AXEntityControllerElement *)v5 initWithAccessibilityContainer:v6 entityController:v4 previewViewController:self];

  objc_initWeak(location, self);
  objc_initWeak(&from, v4);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke;
  v18[3] = &unk_2651086B8;
  objc_copyWeak(&v19, location);
  objc_copyWeak(&v20, &from);
  [(AXEntityControllerElement *)v7 _setAccessibilityLabelBlock:v18];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_2;
  v15[3] = &unk_265108640;
  objc_copyWeak(&v16, location);
  objc_copyWeak(&v17, &from);
  [(AXEntityControllerElement *)v7 _setAccessibilityFrameBlock:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_3;
  v12[3] = &unk_2651086E0;
  objc_copyWeak(&v13, location);
  objc_copyWeak(&v14, &from);
  [(AXEntityControllerElement *)v7 _setIsAccessibilityElementBlock:v12];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_4;
  v9[3] = &unk_265108708;
  objc_copyWeak(&v10, location);
  objc_copyWeak(&v11, &from);
  [(AXEntityControllerElement *)v7 _setAccessibilityElementsBlock:v9];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v7;
}

id __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _axLabelForEntityController:v3];

  return v4;
}

double __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _axFrameForEntityController:v3];
  double v5 = v4;

  return v5;
}

uint64_t __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained _axIsAccessibilityElementForEntityController:v3];

  return v4;
}

id __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained _axEntityElementsForEntityController:v3];

  return v4;
}

- (BOOL)_axActivateForEntityController:(id)a3 deltaYaw:(float)a4 deltaPitch:(float)a5
{
  id v8 = a3;
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  CGFloat v18 = __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke;
  id v19 = &unk_265108730;
  id v9 = v8;
  id v20 = v9;
  float v21 = a4;
  float v22 = a5;
  AXPerformSafeBlock();
  if (a4 == 0.0) {
    [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForCurrentPitchForEntityController:v9];
  }
  else {
  id v10 = [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForCurrentRotationForEntityController:v9];
  }
  dispatch_time_t v11 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke_2;
  block[3] = &unk_265108668;
  id v15 = v10;
  id v12 = v10;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);

  return 1;
}

uint64_t __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  LODWORD(a3) = *(_DWORD *)(a1 + 44);
  return [*(id *)(a1 + 32) rotateByDeltaYaw:a2 deltaPitch:a3];
}

void __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke_2(uint64_t a1)
{
}

- (id)_axControlForRotationWithDeltaYaw:(float)a3 deltaPitch:(float)a4 nameFormat:(id)a5 hintFormat:(id)a6 shouldUseArrows:(BOOL)a7 entityController:(id)a8
{
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = objc_alloc(MEMORY[0x263F1C3A8]);
  CGFloat v18 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  id v19 = (void *)[v17 initWithAccessibilityContainer:v18];

  [(ASVPreviewViewControllerInternalAccessibility *)self _axAnnotateAsControl:v19];
  long long v20 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v46 = *MEMORY[0x263F001A8];
  long long v47 = v20;
  if (a3 == 0.0)
  {
    uint64_t v43 = 0;
    if (a4 < 0.0) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = 4;
    }
    float v22 = (id *)&v43;
    double v23 = &v43;
    goto LABEL_11;
  }
  if (v9)
  {
    uint64_t v45 = 0;
    if (a3 >= 0.0) {
      uint64_t v21 = 8;
    }
    else {
      uint64_t v21 = 2;
    }
    float v22 = (id *)&v45;
    double v23 = &v45;
LABEL_11:
    [(ASVPreviewViewControllerInternalAccessibility *)self _axGetAccessibilityFrame:&v46 path:v23 forArrowTowardsEdge:v21 isDoubleArrow:0];
    goto LABEL_13;
  }
  uint64_t v44 = 0;
  float v22 = (id *)&v44;
  [(ASVPreviewViewControllerInternalAccessibility *)self _axGetAccessibilityFrame:&v46 path:&v44 forRotationControlClockwise:a3 < 0.0];
LABEL_13:
  id v24 = *v22;
  objc_msgSend(v19, "setAccessibilityFrame:", v46, v47);
  [v19 setAccessibilityPath:v24];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v16);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke;
  v37[3] = &unk_265108758;
  id v25 = v14;
  id v38 = v25;
  objc_copyWeak(&v39, &location);
  objc_copyWeak(&v40, &from);
  [v19 _setAccessibilityLabelBlock:v37];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_2;
  v33[3] = &unk_265108758;
  id v26 = v15;
  id v34 = v26;
  objc_copyWeak(&v35, &location);
  objc_copyWeak(&v36, &from);
  [v19 _setAccessibilityHintBlock:v33];
  [v19 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_3;
  v28[3] = &unk_265108780;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  float v31 = a3;
  float v32 = a4;
  [v19 _setAccessibilityActivateBlock:v28];
  [v19 _accessibilitySetScannerActivateBehavior:1];
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v19;
}

id __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  CGFloat v6 = [WeakRetained _axNameForEntityController:v5];
  double v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

id __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  CGFloat v6 = [WeakRetained _axNameForEntityController:v5];
  double v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

uint64_t __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  uint64_t v6 = [WeakRetained _axActivateForEntityController:v3 deltaYaw:v4 deltaPitch:v5];

  return v6;
}

- (float)_axAssetScaleForEntityController:(id)a3
{
  [a3 safeFloatForKey:@"assetScale"];
  return result;
}

- (id)_axUnifiedGestureRecognizerForEntityController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  double v4 = [v3 safeValueForKey:@"worldGestureRecognizer"];
  double v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (void)_axAdjustScaleByMultiplier:(float)a3 entityController:(id)a4
{
  id v5 = a4;
  [(ASVPreviewViewControllerInternalAccessibility *)self _axAssetScaleForEntityController:v5];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axUnifiedGestureRecognizerForEntityController:v5];
  BOOL v9 = v8 = v5;
  id v6 = v9;
  id v7 = v5;
  AXPerformSafeBlock();
}

uint64_t __93__ASVPreviewViewControllerInternalAccessibility__axAdjustScaleByMultiplier_entityController___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) unifiedGestureRecognizerBeganScaling:*(void *)(a1 + 40)];
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  [*(id *)(a1 + 32) unifiedGestureRecognizer:*(void *)(a1 + 40) scaledAssetToScale:v2];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 unifiedGestureRecognizerEndedScaling:v4];
}

- (void)_axResetToInitialScaleForEntityAction:(id)a3
{
  id v4 = [a3 entityController];
  id v3 = v4;
  AXPerformSafeBlock();
}

void __87__ASVPreviewViewControllerInternalAccessibility__axResetToInitialScaleForEntityAction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) assetScreenPosition];
  double v3 = v2;
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) _axUnifiedGestureRecognizerForEntityController:*(void *)(a1 + 32)];
  [v4 unifiedGestureRecognizer:v5 doubleTappedAtScreenPoint:1 onAsset:v3];
}

- (id)_axControlForScalingForEntityController:(id)a3
{
  v56[1] = *MEMORY[0x263EF8340];
  id val = a3;
  id v4 = objc_alloc(MEMORY[0x263F1C3A8]);
  id v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  id v6 = (void *)[v4 initWithAccessibilityContainer:v5];

  [(ASVPreviewViewControllerInternalAccessibility *)self _axAnnotateAsControl:v6];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundsForControls];
  CGFloat x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  double MaxX = CGRectGetMaxX(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.CGFloat width = width;
  v59.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v59);
  view = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  double v13 = MaxY + -100.0;
  if ([(UIView *)view effectiveUserInterfaceLayoutDirection] == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v60);
  }
  else
  {
    double MinX = MaxX + -100.0;
  }
  id v16 = (void *)MEMORY[0x263F1C478];
  v61.origin.CGFloat x = MinX + 25.0;
  CGFloat v15 = v61.origin.x;
  v61.origin.CGFloat y = v13;
  v61.size.CGFloat width = 50.0;
  v61.size.CGFloat height = 100.0;
  double v17 = CGRectGetMinX(v61);
  v62.origin.CGFloat x = v15;
  v62.origin.CGFloat y = v13;
  v62.size.CGFloat width = 50.0;
  v62.size.CGFloat height = 100.0;
  objc_msgSend(v16, "bezierPathWithOvalInRect:", v17, CGRectGetMinY(v62), 50.0, 50.0);
  CGFloat v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v63.origin.CGFloat x = v15;
  v63.origin.CGFloat y = v13;
  v63.size.CGFloat width = 50.0;
  v63.size.CGFloat height = 100.0;
  double v19 = CGRectGetMinX(v63);
  v64.origin.CGFloat x = v15;
  v64.origin.CGFloat y = v13;
  v64.size.CGFloat width = 50.0;
  v64.size.CGFloat height = 100.0;
  double v20 = v19 + (CGRectGetWidth(v64) + -10.0) * 0.5;
  v65.origin.CGFloat x = v15;
  v65.origin.CGFloat y = v13;
  v65.size.CGFloat width = 50.0;
  v65.size.CGFloat height = 100.0;
  double v21 = CGRectGetMinX(v65);
  v66.origin.CGFloat x = v15;
  v66.origin.CGFloat y = v13;
  v66.size.CGFloat width = 50.0;
  v66.size.CGFloat height = 100.0;
  double v22 = v21 + (CGRectGetWidth(v66) + 10.0) * 0.5;
  v67.origin.CGFloat x = v15;
  v67.origin.CGFloat y = v13;
  v67.size.CGFloat width = 50.0;
  v67.size.CGFloat height = 100.0;
  CGFloat v23 = CGRectGetMinY(v67) + 50.0;
  v68.origin.CGFloat x = v15;
  v68.origin.CGFloat y = v13;
  v68.size.CGFloat width = 50.0;
  v68.size.CGFloat height = 100.0;
  double v24 = CGRectGetMaxY(v68);
  -[UIBezierPath moveToPoint:](v18, "moveToPoint:", v20, v23);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v22, v23);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v22, v24);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v20, v24);
  [(UIBezierPath *)v18 closePath];
  memset(&v55, 0, sizeof(v55));
  v69.origin.CGFloat x = v15;
  v69.origin.CGFloat y = v13;
  v69.size.CGFloat width = 50.0;
  v69.size.CGFloat height = 100.0;
  CGFloat MidX = CGRectGetMidX(v69);
  v70.origin.CGFloat x = v15;
  v70.origin.CGFloat y = v13;
  v70.size.CGFloat width = 50.0;
  v70.size.CGFloat height = 100.0;
  CGFloat MidY = CGRectGetMidY(v70);
  CGAffineTransformMakeTranslation(&v55, MidX, MidY);
  CGAffineTransform v53 = v55;
  CGAffineTransformRotate(&v54, &v53, -0.785398163);
  CGAffineTransform v55 = v54;
  v71.origin.CGFloat x = v15;
  v71.origin.CGFloat y = v13;
  v71.size.CGFloat width = 50.0;
  v71.size.CGFloat height = 100.0;
  double v27 = CGRectGetMidX(v71);
  v72.origin.CGFloat x = v15;
  v72.origin.CGFloat y = v13;
  v72.size.CGFloat width = 50.0;
  v72.size.CGFloat height = 100.0;
  CGFloat v28 = CGRectGetMidY(v72);
  CGAffineTransform v53 = v55;
  CGAffineTransformTranslate(&v54, &v53, -v27, -v28);
  CGAffineTransform v55 = v54;
  [(UIBezierPath *)v18 applyTransform:&v54];
  id v29 = UIAccessibilityConvertPathToScreenCoordinates(v18, view);
  [v6 setAccessibilityPath:v29];

  id v30 = [v6 accessibilityPath];
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox((CGPathRef)[v30 CGPath]);
  objc_msgSend(v6, "setAccessibilityFrame:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);

  objc_initWeak((id *)&v54, self);
  objc_initWeak((id *)&v53, val);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke;
  v50[3] = &unk_2651086B8;
  objc_copyWeak(&v51, (id *)&v54);
  objc_copyWeak(&v52, (id *)&v53);
  [v6 _setAccessibilityLabelBlock:v50];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_2;
  v47[3] = &unk_2651086B8;
  objc_copyWeak(&v48, (id *)&v54);
  objc_copyWeak(&v49, (id *)&v53);
  [v6 _setAccessibilityHintBlock:v47];
  [v6 setAccessibilityTraits:*MEMORY[0x263F1CED8]];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_3;
  v44[3] = &unk_2651087F8;
  objc_copyWeak(&v45, (id *)&v54);
  objc_copyWeak(&v46, (id *)&v53);
  [v6 _setAccessibilityIncrementBlock:v44];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_4;
  v41[3] = &unk_2651087F8;
  objc_copyWeak(&v42, (id *)&v54);
  objc_copyWeak(&v43, (id *)&v53);
  [v6 _setAccessibilityDecrementBlock:v41];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_5;
  v38[3] = &unk_2651086B8;
  objc_copyWeak(&v39, (id *)&v54);
  objc_copyWeak(&v40, (id *)&v53);
  [v6 _setAccessibilityValueBlock:v38];
  float v31 = [AXEntityControllerAction alloc];
  float v32 = accessibilityLocalizedString(@"SCALING_CONTROL_RESET");
  double v33 = [(AXEntityControllerAction *)v31 initWithName:v32 target:self selector:sel__axResetToInitialScaleForEntityAction_];

  [(AXEntityControllerAction *)v33 setEntityController:val];
  v56[0] = v33;
  id v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];
  [v6 setAccessibilityCustomActions:v34];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v51);
  objc_destroyWeak((id *)&v53);
  objc_destroyWeak((id *)&v54);

  return v6;
}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke(uint64_t a1)
{
  double v2 = NSString;
  double v3 = accessibilityLocalizedString(@"SCALING_CONTROL");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained _axNameForEntityController:v5];
  id v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_2(uint64_t a1)
{
  double v2 = NSString;
  double v3 = accessibilityLocalizedString(@"SCALING_CONTROL_HINT");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained _axNameForEntityController:v5];
  id v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

void __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v3) = 1068149419;
  [WeakRetained _axAdjustScaleByMultiplier:v2 entityController:v3];
}

void __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v3) = 0.75;
  [WeakRetained _axAdjustScaleByMultiplier:v2 entityController:v3];
}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _axAssetScaleForAnnouncementsForEntityController:v3];
  id v4 = AXFormatFloatWithPercentage();

  return v4;
}

- (float)_axLevitationHeightForEntityController:(id)a3
{
  [a3 safeFloatForKey:@"levitationHeight"];
  return result;
}

- (BOOL)_axTranslateForLevitation:(BOOL)a3 delta:(id)a4 entityController:
{
  float32x2_t v5 = v4;
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  v42[7] = MEMORY[0x263EF8330];
  v42[8] = 3221225472;
  v42[9] = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke;
  v42[10] = &unk_265108820;
  v42[12] = &v43;
  id v9 = v8;
  v42[11] = v9;
  AXPerformSafeBlock();
  float32x2_t v10 = (float32x2_t)v44[3];

  _Block_object_dispose(&v43, 8);
  [(ASVPreviewViewControllerInternalAccessibility *)self _axLevitationHeightForEntityController:v9];
  float v12 = v11;
  LOBYTE(v43) = 0;
  objc_opt_class();
  double v13 = [v9 safeValueForKey:@"worldGestureRecognizer"];
  id v14 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v43) {
    abort();
  }
  float32x2_t v15 = vadd_f32(v10, v5);
  if (v6)
  {
    id v16 = v42;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    double v17 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_2;
  }
  else
  {
    id v16 = v41;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    double v17 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_3;
  }
  v16[2] = v17;
  v16[3] = &unk_265108848;
  id v18 = v9;
  v16[4] = v18;
  id v19 = v14;
  v16[5] = v19;
  v16[6] = v15;
  AXPerformSafeBlock();

  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000;
  uint64_t v46 = 0;
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  double v37 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_4;
  id v38 = &unk_265108820;
  id v40 = &v43;
  id v20 = v18;
  id v39 = v20;
  AXPerformSafeBlock();
  float32x2_t v21 = (float32x2_t)v44[3];

  _Block_object_dispose(&v43, 8);
  int8x8_t v22 = vmvn_s8((int8x8_t)vceq_f32(v10, v21));
  if ((v22.i32[0] | v22.i32[1]))
  {
    if (!v6)
    {
      uint64_t v32 = [(ASVPreviewViewControllerInternalAccessibility *)self _axDescriptionForCurrentPositionForEntityController:v20];
      goto LABEL_16;
    }
    [(ASVPreviewViewControllerInternalAccessibility *)self _axLevitationHeightForEntityController:v20];
    if (v12 <= 0.0 == v23 > 0.0)
    {
      if (v23 <= 0.0) {
        double v24 = @"NOT_FLOATING";
      }
      else {
        double v24 = @"FLOATING";
      }
      uint64_t v32 = accessibilityLocalizedString(v24);
LABEL_16:
      CGFloat v28 = (void *)v32;
      if (!v32) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    id v25 = NSString;
    id v26 = accessibilityLocalizedString(@"UNABLE_TO_MOVE");
    double v27 = [(ASVPreviewViewControllerInternalAccessibility *)self _axNameForEntityController:v20];
    CGFloat v28 = objc_msgSend(v25, "localizedStringWithFormat:", v26, v27);

    if (v28)
    {
LABEL_11:
      dispatch_time_t v29 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_5;
      block[3] = &unk_265108668;
      id v34 = v28;
      id v30 = v28;
      dispatch_after(v29, MEMORY[0x263EF83A0], block);
    }
  }
LABEL_12:

  return 1;
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetScreenPosition];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) worldGestureRecognizer:*(void *)(a1 + 40) levitatedAssetToScreenPoint:*(double *)(a1 + 48)];
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) worldGestureRecognizer:*(void *)(a1 + 40) translatedAssetToScreenPoint:*(double *)(a1 + 48)];
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) assetScreenPosition];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_5(uint64_t a1)
{
}

- (id)_axControlForTranslationForLevitation:(BOOL)a3 delta:(id)a4 nameFormat:(id)a5 entityController:
{
  int8x8_t v22 = v5;
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x263F1C3A8]);
  float v12 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  double v13 = (void *)[v11 initWithAccessibilityContainer:v12];

  [(ASVPreviewViewControllerInternalAccessibility *)self _axAnnotateAsControl:v13];
  long long v14 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v34 = *MEMORY[0x263F001A8];
  long long v35 = v14;
  double v15 = *(double *)&v22;
  if (*(float *)&v22 >= 0.0)
  {
    if (*(float *)&v22 <= 0.0)
    {
      HIDWORD(v15) = HIDWORD(v22);
      LODWORD(v15) = HIDWORD(v22);
      if (*((float *)&v22 + 1) >= 0.0)
      {
        if (*((float *)&v22 + 1) <= 0.0)
        {
          double v20 = *(float *)&v22;
          double v21 = *((float *)&v22 + 1);
          _AXAssert();
        }
        uint64_t v16 = 4;
      }
      else
      {
        uint64_t v16 = 1;
      }
    }
    else
    {
      uint64_t v16 = 8;
    }
  }
  else
  {
    uint64_t v16 = 2;
  }
  id v33 = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:](self, "_axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:", &v34, &v33, v16, v7, v15, *(void *)&v20, *(void *)&v21);
  id v17 = v33;
  objc_msgSend(v13, "setAccessibilityFrame:", v34, v35);
  [v13 setAccessibilityPath:v17];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke;
  v27[3] = &unk_265108758;
  id v18 = v9;
  id v28 = v18;
  objc_copyWeak(&v29, &location);
  objc_copyWeak(&v30, &from);
  [v13 _setAccessibilityLabelBlock:v27];
  [v13 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke_2;
  v23[3] = &unk_265108870;
  objc_copyWeak(&v24, &location);
  BOOL v26 = v7;
  v25[1] = v22;
  objc_copyWeak(v25, &from);
  [v13 _setAccessibilityActivateBlock:v23];
  [v13 _accessibilitySetScannerActivateBehavior:1];
  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

id __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v6 = [WeakRetained _axNameForEntityController:v5];
  BOOL v7 = objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);

  return v7;
}

uint64_t __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  double v4 = *(double *)(a1 + 48);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = [WeakRetained _axTranslateForLevitation:v3 delta:v5 entityController:v4];

  return v6;
}

- (id)_axDescriptionForCurrentPositionForEntityController:(id)a3
{
  id v4 = a3;
  id v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundingRectForEntityController:v4];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v41.origin.CGFloat x = v15;
  v41.origin.CGFloat y = v17;
  v41.size.CGFloat width = v19;
  v41.size.CGFloat height = v21;
  v49.origin.CGFloat x = v7;
  v49.origin.CGFloat y = v9;
  v49.size.CGFloat width = v11;
  v49.size.CGFloat height = v13;
  CGRect v42 = CGRectIntersection(v41, v49);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  CGFloat width = v42.size.width;
  CGFloat height = v42.size.height;
  if (CGRectIsNull(v42))
  {
    BOOL v26 = 0;
    goto LABEL_18;
  }
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v44);
  v45.origin.CGFloat x = v7;
  v45.origin.CGFloat y = v9;
  v45.size.CGFloat width = v11;
  v45.size.CGFloat height = v13;
  CGFloat v28 = CGRectGetWidth(v45) * 0.333333333;
  v46.origin.CGFloat x = v7;
  v46.origin.CGFloat y = v9;
  v46.size.CGFloat width = v11;
  v46.size.CGFloat height = v13;
  double v29 = CGRectGetWidth(v46);
  v47.origin.CGFloat x = v7;
  v47.origin.CGFloat y = v9;
  v47.size.CGFloat width = v11;
  v47.size.CGFloat height = v13;
  double v30 = CGRectGetHeight(v47) * 0.333333333;
  v48.origin.CGFloat x = v7;
  v48.origin.CGFloat y = v9;
  v48.size.CGFloat width = v11;
  v48.size.CGFloat height = v13;
  double v31 = CGRectGetHeight(v48) * 0.666666667;
  if (MidX >= v28)
  {
    if (MidX >= v29 * 0.666666667)
    {
      if (MidY < v30)
      {
        uint64_t v32 = @"TOP_RIGHT";
        goto LABEL_17;
      }
      id v33 = @"BOTTOM_RIGHT";
      long long v34 = @"MIDDLE_RIGHT";
    }
    else
    {
      if (MidY < v30)
      {
        uint64_t v32 = @"TOP_CENTER";
        goto LABEL_17;
      }
      id v33 = @"BOTTOM_CENTER";
      long long v34 = @"MIDDLE_CENTER";
    }
LABEL_14:
    if (MidY >= v31) {
      uint64_t v32 = v33;
    }
    else {
      uint64_t v32 = v34;
    }
    goto LABEL_17;
  }
  if (MidY >= v30)
  {
    id v33 = @"BOTTOM_LEFT";
    long long v34 = @"MIDDLE_LEFT";
    goto LABEL_14;
  }
  uint64_t v32 = @"TOP_LEFT";
LABEL_17:
  long long v35 = accessibilityLocalizedString(v32);
  uint64_t v36 = NSString;
  double v37 = accessibilityLocalizedString(@"POSITIONED_AT_ANNOUNCEMENT");
  BOOL v26 = objc_msgSend(v36, "localizedStringWithFormat:", v37, v35);

LABEL_18:

  return v26;
}

- (CGRect)_axBoundingRectForEntityController:(id)a3
{
  id v4 = a3;
  id v5 = (long long *)MEMORY[0x263F001A0];
  double v6 = *MEMORY[0x263F001A0];
  double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  double v10 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  if (v10)
  {
    uint64_t v22 = 0;
    float v23 = (CGRect *)&v22;
    uint64_t v24 = 0x4010000000;
    id v25 = "";
    long long v11 = v5[1];
    long long v26 = *v5;
    long long v27 = v11;
    id v20 = v4;
    id v21 = v10;
    AXPerformSafeBlock();
    if (!CGRectIsNull(v23[1]))
    {
      UIAccessibilityFrameForBounds();
      double v6 = v12;
      double v7 = v13;
      double v8 = v14;
      double v9 = v15;
    }

    _Block_object_dispose(&v22, 8);
  }

  double v16 = v6;
  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

uint64_t __84__ASVPreviewViewControllerInternalAccessibility__axBoundingRectForEntityController___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) calculateAssetScreenBoundingRectIn:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGRect)_axBoundingRectForEntityWrapper:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (long long *)MEMORY[0x263F001A0];
  double v6 = *MEMORY[0x263F001A0];
  double v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  double v10 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  if (v10)
  {
    uint64_t v22 = 0;
    float v23 = (CGRect *)&v22;
    uint64_t v24 = 0x4010000000;
    id v25 = "";
    long long v11 = v5[1];
    long long v26 = *v5;
    long long v27 = v11;
    id v20 = v4;
    id v21 = v10;
    AXPerformSafeBlock();
    if (!CGRectIsNull(v23[1]))
    {
      UIAccessibilityFrameForBounds();
      double v6 = v12;
      double v7 = v13;
      double v8 = v14;
      double v9 = v15;
    }

    _Block_object_dispose(&v22, 8);
  }

  double v16 = v6;
  double v17 = v7;
  double v18 = v8;
  double v19 = v9;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

uint64_t __81__ASVPreviewViewControllerInternalAccessibility__axBoundingRectForEntityWrapper___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) calculateScreenBoundingRectIn:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)_axEmitterMode
{
  id v2 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  int64_t v3 = [v2 safeIntegerForKey:@"emitterMode"];

  return v3;
}

- (id)_axRootEntityController
{
  return (id)[(ASVPreviewViewControllerInternalAccessibility *)self safeValueForKey:@"accessibilityRootEntityController"];
}

- (id)_axEntityControllers
{
  return (id)[(ASVPreviewViewControllerInternalAccessibility *)self safeArrayForKey:@"accessibilityEntityControllers"];
}

- (id)_axEntityElementsForEntityController:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  id v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axRootEntityController];

  if (v6 == v4)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v8 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          double v13 = [(ASVPreviewViewControllerInternalAccessibility *)self _axRootEntityController];
          BOOL v14 = v12 == v13;

          if (v14)
          {
            double v16 = AXLogAppAccessibility();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              -[ASVPreviewViewControllerInternalAccessibility _axEntityElementsForEntityController:](v16);
            }

            goto LABEL_15;
          }
          double v15 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityWrappersForEntityController:v12];
          [v7 addObjectsFromArray:v15];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v39 objects:v43 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    uint64_t v7 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityWrappersForEntityController:v4];
  }
  char v38 = 0;
  objc_opt_class();
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy_;
  uint64_t v36 = __Block_byref_object_dispose_;
  id v37 = 0;
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  long long v27 = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke;
  CGFloat v28 = &unk_265108618;
  double v31 = &v32;
  id v17 = v5;
  id v29 = v17;
  id v18 = v7;
  id v30 = v18;
  AXPerformSafeBlock();
  id v19 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  id v20 = __UIAccessibilityCastAsClass();

  if (v38) {
    abort();
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_2;
  v23[3] = &unk_2651088C0;
  void v23[4] = self;
  id v24 = v18;
  id v21 = v18;
  [v20 enumerateObjectsUsingBlock:v23];

  return v20;
}

uint64_t __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) accessibilityElementsForEntityWrappers:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

void __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_3;
  v8[3] = &unk_265108898;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v5 _setAccessibilityLabelBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = [WeakRetained _axNameForEntityWrapper:*(void *)(a1 + 32)];
  if (([WeakRetained _axEmitterMode] & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    id v4 = @"ASSET_IS_NOT_PLACED";
  }
  else
  {
    if (![WeakRetained _axIsOffScreenForEntityWrapper:*(void *)(a1 + 32)]) {
      goto LABEL_6;
    }
    id v4 = @"ASSET_IS_OFF_SCREEN";
  }
  id v7 = accessibilityLocalizedString(v4);
  uint64_t v5 = __UIAXStringForVariables();

  int64_t v3 = (void *)v5;
LABEL_6:

  return v3;
}

- (id)_axObjectModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  double v8 = [(ASVPreviewViewControllerInternalAccessibility *)self _axCreateAssetElementForEntityController:v6];
  [v7 addObject:v8];

  id v9 = accessibilityLocalizedString(@"ROTATION_CONTROL_YAW_HINT");
  id v10 = accessibilityLocalizedString(@"ROTATION_CONTROL_PITCH_HINT");
  long long v11 = accessibilityLocalizedString(@"ROTATION_CONTROL_CLOCKWISE");
  LODWORD(v12) = -1090123118;
  double v13 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v11 deltaPitch:v9 nameFormat:1 hintFormat:v6 shouldUseArrows:v12 entityController:0.0];

  BOOL v14 = accessibilityLocalizedString(@"ROTATION_CONTROL_COUNTERCLOCKWISE");
  LODWORD(v15) = 1057360530;
  double v16 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v14 deltaPitch:v9 nameFormat:1 hintFormat:v6 shouldUseArrows:v15 entityController:0.0];

  if (v4) {
    id v17 = v16;
  }
  else {
    id v17 = v13;
  }
  if (v4) {
    id v18 = v13;
  }
  else {
    id v18 = v16;
  }
  [v7 addObject:v17];
  [v7 addObject:v18];
  id v19 = accessibilityLocalizedString(@"ROTATION_CONTROL_AWAY");
  LODWORD(v20) = -1098511726;
  id v21 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v19 deltaPitch:v10 nameFormat:1 hintFormat:v6 shouldUseArrows:0.0 entityController:v20];
  [v7 addObject:v21];

  uint64_t v22 = accessibilityLocalizedString(@"ROTATION_CONTROL_TOWARD");
  LODWORD(v23) = 1048971922;
  id v24 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v22 deltaPitch:v10 nameFormat:1 hintFormat:v6 shouldUseArrows:0.0 entityController:v23];
  [v7 addObject:v24];

  uint64_t v25 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForScalingForEntityController:v6];
  [v7 addObject:v25];

  return v7;
}

- (id)_axARModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4
{
  BOOL v40 = a4;
  void v41[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [(ASVPreviewViewControllerInternalAccessibility *)self _axCreateAssetElementForEntityController:v5];
  [v6 addObject:v7];

  double v8 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_LEFT");
  uint64_t v9 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:0 delta:v8 nameFormat:v5 entityController:COERCE_DOUBLE(3259498496)];

  id v10 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_RIGHT");
  uint64_t v11 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:0 delta:v10 nameFormat:v5 entityController:COERCE_DOUBLE(1112014848)];

  double v12 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_BACKWARD");
  uint64_t v13 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:0 delta:v12 nameFormat:v5 entityController:-2.0615843e11];
  id v37 = (void *)v13;

  BOOL v14 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_FORWARD");
  uint64_t v15 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:0 delta:v14 nameFormat:v5 entityController:2.0615843e11];
  uint64_t v36 = (void *)v15;

  double v16 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_UP");
  uint64_t v17 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:1 delta:v16 nameFormat:v5 entityController:-2.0615843e11];
  long long v35 = (void *)v17;

  id v18 = accessibilityLocalizedString(@"TRANSLATION_CONTROL_DOWN");
  id v19 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForTranslationForLevitation:1 delta:v18 nameFormat:v5 entityController:2.0615843e11];

  char v38 = (void *)v11;
  long long v39 = (void *)v9;
  if (v40) {
    uint64_t v20 = v11;
  }
  else {
    uint64_t v20 = v9;
  }
  if (v40) {
    uint64_t v21 = v9;
  }
  else {
    uint64_t v21 = v11;
  }
  [v6 addObject:v20];
  [v6 addObject:v21];
  v41[0] = v13;
  v41[1] = v15;
  v41[2] = v17;
  v41[3] = v19;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
  [v6 addObjectsFromArray:v22];

  double v23 = accessibilityLocalizedString(@"ROTATION_CONTROL_YAW_HINT");
  id v24 = accessibilityLocalizedString(@"ROTATION_CONTROL_CLOCKWISE");
  LODWORD(v25) = -1090123118;
  uint64_t v26 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v24 deltaPitch:v23 nameFormat:0 hintFormat:v5 shouldUseArrows:v25 entityController:0.0];

  long long v27 = accessibilityLocalizedString(@"ROTATION_CONTROL_COUNTERCLOCKWISE");
  LODWORD(v28) = 1057360530;
  uint64_t v29 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForRotationWithDeltaYaw:v27 deltaPitch:v23 nameFormat:0 hintFormat:v5 shouldUseArrows:v28 entityController:0.0];
  id v30 = (void *)v29;
  if (v40) {
    double v31 = (void *)v29;
  }
  else {
    double v31 = v26;
  }
  if (v40) {
    uint64_t v32 = v26;
  }
  else {
    uint64_t v32 = (void *)v29;
  }

  [v6 addObject:v31];
  [v6 addObject:v32];
  id v33 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlForScalingForEntityController:v5];
  [v6 addObject:v33];

  return v6;
}

- (id)_axObjectModeControls
{
}

- (void)_axSetObjectModeControls:(id)a3
{
}

- (id)_axARModeControls
{
}

- (void)_axSetARModeControls:(id)a3
{
}

- (void)_axUpdateARViewAccessibilityElements
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int64_t v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARView];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 effectiveUserInterfaceLayoutDirection];
    if (([(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode] & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axARModeControls];
      if (v6)
      {
LABEL_15:
        objc_msgSend(v4, "setAccessibilityElements:", v6, (void)v14);

        goto LABEL_16;
      }
      id v7 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityControllers];
      id v6 = [MEMORY[0x263EFF980] array];
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = -[ASVPreviewViewControllerInternalAccessibility _axARModeControlsForEntityController:isRTL:](self, "_axARModeControlsForEntityController:isRTL:", *(void *)(*((void *)&v14 + 1) + 8 * i), v5 == 1, (void)v14);
            [v6 addObjectsFromArray:v13];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }

      [(ASVPreviewViewControllerInternalAccessibility *)self _axSetARModeControls:v6];
    }
    else
    {
      id v8 = [(ASVPreviewViewControllerInternalAccessibility *)self _axRootEntityController];
      id v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axObjectModeControls];
      if (!v6)
      {
        id v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axObjectModeControlsForEntityController:v8 isRTL:v5 == 1];
        [(ASVPreviewViewControllerInternalAccessibility *)self _axSetObjectModeControls:v6];
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  [(ASVPreviewViewControllerInternalAccessibility *)&v4 viewDidAppear:a3];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axToggleVisibilityAnnouncementsIfNeeded];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  [(ASVPreviewViewControllerInternalAccessibility *)&v4 viewDidDisappear:a3];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axToggleVisibilityAnnouncementsIfNeeded];
}

- (void)handleTapAtPointWithPoint:(CGPoint)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility handleTapAtPointWithPoint:](&v10, sel_handleTapAtPointWithPoint_, a3.x, a3.y);
  objc_super v4 = [(ASVPreviewViewControllerInternalAccessibility *)self _axControlsViewStack];
  [v4 alpha];
  double v6 = v5;

  UIAccessibilityNotifications v7 = *MEMORY[0x263F1CDC8];
  if (v6 == 1.0) {
    id v8 = @"CONTROLS_SHOWN";
  }
  else {
    id v8 = @"CONTROLS_HIDDEN";
  }
  uint64_t v9 = accessibilityLocalizedString(v8);
  UIAccessibilityPostNotification(v7, v9);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_axSetOffScreen:(BOOL)a3 forEntityController:(id)a4
{
}

- (BOOL)_axIsOffScreenForEntityController:(id)a3
{
  return [a3 _accessibilityBoolValueForKey:@"IsOffScreen"];
}

- (id)_axEntityIdentifiersToOffScreenState
{
}

- (void)_axSetEntityIdentifiersToOffScreenState:(id)a3
{
}

- (id)_axIdentifierForEntityWrapper:(id)a3
{
  return (id)[a3 safeValueForKey:@"identifier"];
}

- (void)_axSetOffScreen:(BOOL)a3 forEntityWrapper:(id)a4
{
  BOOL v4 = a3;
  double v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axIdentifierForEntityWrapper:a4];
  if (v6)
  {
    id v9 = v6;
    UIAccessibilityNotifications v7 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityIdentifiersToOffScreenState];
    if (!v7)
    {
      UIAccessibilityNotifications v7 = [MEMORY[0x263EFF9A0] dictionary];
      [(ASVPreviewViewControllerInternalAccessibility *)self _axSetEntityIdentifiersToOffScreenState:v7];
    }
    id v8 = [NSNumber numberWithBool:v4];
    [v7 setObject:v8 forKeyedSubscript:v9];

    double v6 = v9;
  }
}

- (BOOL)_axIsOffScreenForEntityWrapper:(id)a3
{
  BOOL v4 = [(ASVPreviewViewControllerInternalAccessibility *)self _axIdentifierForEntityWrapper:a3];
  if (v4)
  {
    double v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityIdentifiersToOffScreenState];
    double v6 = [v5 objectForKeyedSubscript:v4];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_axCheckForAppearanceOfObjectsWithTimer:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  double v31 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  uint64_t v32 = [MEMORY[0x263EFF980] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityControllers];
  uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        double v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEntityWrappersForEntityController:v5];
        if ([v6 count])
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v36 = v6;
          id v7 = v6;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (!v8) {
            goto LABEL_20;
          }
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v38;
          while (1)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v38 != v10) {
                objc_enumerationMutation(v7);
              }
              double v12 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              BOOL v13 = [(ASVPreviewViewControllerInternalAccessibility *)self _axIsOffScreenForEntityWrapper:v12];
              if (([v12 safeBoolForKey:@"isEntityActive"] & 1) == 0)
              {
                if (v13) {
                  continue;
                }
                BOOL IsNull = 1;
LABEL_17:
                [(ASVPreviewViewControllerInternalAccessibility *)self _axSetOffScreen:IsNull forEntityWrapper:v12];
                continue;
              }
              [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundingRectForEntityWrapper:v12];
              BOOL IsNull = CGRectIsNull(v48);
              if (v13 != IsNull) {
                goto LABEL_17;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (!v9)
            {
LABEL_20:

              double v6 = v36;
              break;
            }
          }
        }
        BOOL v15 = [(ASVPreviewViewControllerInternalAccessibility *)self _axIsOffScreenForEntityController:v5];
        [(ASVPreviewViewControllerInternalAccessibility *)self _axBoundingRectForEntityController:v5];
        BOOL v16 = CGRectIsNull(v49);
        if (v15 != v16)
        {
          BOOL v17 = v16;
          [(ASVPreviewViewControllerInternalAccessibility *)self _axSetOffScreen:v16 forEntityController:v5];
          id v18 = [(ASVPreviewViewControllerInternalAccessibility *)self _axNameForEntityController:v5];
          if (v17) {
            uint64_t v19 = v32;
          }
          else {
            uint64_t v19 = v31;
          }
          [v19 addObject:v18];
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v35);
  }

  uint64_t v20 = v32;
  if (!-[ASVPreviewViewControllerInternalAccessibility _axIsFirstVisibilityAnnouncement](self, "_axIsFirstVisibilityAnnouncement")&& ([v31 count] || objc_msgSend(v32, "count")))
  {
    if ([v32 count])
    {
      uint64_t v21 = NSString;
      uint64_t v22 = accessibilityLocalizedString(@"ASSETS_MOVED_OFF_SCREEN");
      double v23 = MEMORY[0x245641E40](v32);
      uint64_t v29 = objc_msgSend(v21, "localizedStringWithFormat:", v22, v23);
      id v30 = @"__AXStringForVariablesSentinel";
      id v24 = __UIAXStringForVariables();
    }
    else
    {
      id v24 = 0;
    }
    if (objc_msgSend(v31, "count", v29, v30))
    {
      double v25 = NSString;
      uint64_t v26 = accessibilityLocalizedString(@"ASSETS_MOVED_ON_SCREEN");
      long long v27 = MEMORY[0x245641E40](v31);
      uint64_t v29 = objc_msgSend(v25, "localizedStringWithFormat:", v26, v27);
      id v30 = @"__AXStringForVariablesSentinel";
      uint64_t v28 = __UIAXStringForVariables();

      id v24 = (void *)v28;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v24);

    uint64_t v20 = v32;
  }
  -[ASVPreviewViewControllerInternalAccessibility _axSetIsFirstVisibilityAnnouncement:](self, "_axSetIsFirstVisibilityAnnouncement:", 0, v29, v30);
}

- (id)_axTimerForVisibilityAnnouncements
{
}

- (void)_axSetTimerForVisibilityAnnouncements:(id)a3
{
}

- (BOOL)_axIsFirstVisibilityAnnouncement
{
  return MEMORY[0x270F0A438](self, &__ASVPreviewViewControllerInternalAccessibility___axIsFirstVisibilityAnnouncement);
}

- (void)_axSetIsFirstVisibilityAnnouncement:(BOOL)a3
{
}

- (void)_axToggleVisibilityAnnouncementsIfNeeded
{
  if ([(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode] != 2) {
    goto LABEL_5;
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  int64_t v3 = __UIAccessibilityCastAsClass();
  BOOL v4 = [v3 view];
  uint64_t v5 = [v4 window];

  if (v5)
  {
    double v6 = [(ASVPreviewViewControllerInternalAccessibility *)self _axTimerForVisibilityAnnouncements];

    if (!v6)
    {
      [(ASVPreviewViewControllerInternalAccessibility *)self _axSetIsFirstVisibilityAnnouncement:1];
      objc_initWeak(&location, self);
      id v7 = (void *)MEMORY[0x263EFFA20];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      double v12 = __89__ASVPreviewViewControllerInternalAccessibility__axToggleVisibilityAnnouncementsIfNeeded__block_invoke;
      BOOL v13 = &unk_2651088E8;
      objc_copyWeak(&v14, &location);
      uint64_t v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:&v10 block:1.0];
      -[ASVPreviewViewControllerInternalAccessibility _axSetTimerForVisibilityAnnouncements:](self, "_axSetTimerForVisibilityAnnouncements:", v8, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
LABEL_5:
    uint64_t v9 = [(ASVPreviewViewControllerInternalAccessibility *)self _axTimerForVisibilityAnnouncements];
    [v9 invalidate];

    [(ASVPreviewViewControllerInternalAccessibility *)self _axSetTimerForVisibilityAnnouncements:0];
  }
}

void __89__ASVPreviewViewControllerInternalAccessibility__axToggleVisibilityAnnouncementsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _axCheckForAppearanceOfObjectsWithTimer:v3];
}

- (void)_axUpdateForOldEmitterMode:(int64_t)a3
{
  int64_t v5 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode];
  if (v5 != a3)
  {
    if (a3 == 3 && v5 == 2)
    {
      UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
      id v7 = NSString;
      uint64_t v8 = accessibilityLocalizedString(@"ASSET_PLACED_IN_WORLD");
      uint64_t v9 = [(ASVPreviewViewControllerInternalAccessibility *)self _axRootEntityController];
      uint64_t v10 = [(ASVPreviewViewControllerInternalAccessibility *)self _axNameForEntityController:v9];
      uint64_t v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);
      UIAccessibilityPostNotification(v6, v11);
    }
    else if (((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) != ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2))
    {
      [(ASVPreviewViewControllerInternalAccessibility *)self _axUpdateARViewAccessibilityElements];
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
    [(ASVPreviewViewControllerInternalAccessibility *)self _axToggleVisibilityAnnouncementsIfNeeded];
  }
}

- (void)updateInterfaceState
{
  int64_t v3 = [(ASVPreviewViewControllerInternalAccessibility *)self _axEmitterMode];
  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  [(ASVPreviewViewControllerInternalAccessibility *)&v4 updateInterfaceState];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axUpdateForOldEmitterMode:v3];
}

- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility entityController:doubleTappedAt:](&v12, sel_entityController_doubleTappedAt_, v7, x, y);
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__ASVPreviewViewControllerInternalAccessibility_entityController_doubleTappedAt___block_invoke;
  v10[3] = &unk_265108910;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x263EF83A0], v10);
}

void __81__ASVPreviewViewControllerInternalAccessibility_entityController_doubleTappedAt___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  int64_t v3 = NSString;
  accessibilityLocalizedString(@"RESET_SCALE_ANNOUNCEMENT");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _axAssetScaleForAnnouncementsForEntityController:*(void *)(a1 + 40)];
  objc_super v4 = AXFormatFloatWithPercentage();
  int64_t v5 = objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);
  UIAccessibilityPostNotification(v2, v5);
}

- (void)accessibilityDidSetUpEntityControllers
{
  v3.receiver = self;
  v3.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  [(ASVPreviewViewControllerInternalAccessibility *)&v3 accessibilityDidSetUpEntityControllers];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axSetARModeControls:0];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axSetObjectModeControls:0];
  [(ASVPreviewViewControllerInternalAccessibility *)self _axUpdateARViewAccessibilityElements];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_axEntityElementsForEntityController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_241F27000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found root entity controller in list of entity controllers.", v1, 2u);
}

@end