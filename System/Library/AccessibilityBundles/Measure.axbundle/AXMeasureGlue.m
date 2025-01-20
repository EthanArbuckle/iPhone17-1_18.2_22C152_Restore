@interface AXMeasureGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMeasureGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_295 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_304];

    _Failover = [objc_allocWithZone((Class)AXMeasureGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXMeasureGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ViewController", @"labelView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.ViewController", @"reticleView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"OrientationLockedViewController", @"viewControllers", "@", 0);
  [v2 validateClass:@"Measure.AccessibilityStateObserver"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"Measure.AccessibilityStateObserver", @"shared", "@", 0);
  [v2 validateClass:@"Measure.CardTitleView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.CardTitleView", @"title", "@", 0);

  return 1;
}

uint64_t __46__AXMeasureGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Measure AX"];
  [v2 setOverrideProcessName:@"Measure"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __46__AXMeasureGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UndoButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EditButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"EditViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CalloutViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ReticleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DeleteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MeasureUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabelViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LevelPageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabelDetailsPlatterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RectangleFillAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RectangleLabelDetailsPlatterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MeasureUIApplicationAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"NonRotatingARSCNViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AccessibilityStateObserverAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HistoryButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CardTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CardContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CalloutViewSpatialAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CalloutViewRegularAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ModeControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LabelRenderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SurfaceSideMeasurementStackAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SketchSurfaceAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SpatialGenericPlatterAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ShareButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"RoundCloseButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PersonHeightViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HistoryViewAccessibility" canInteractWithTargetClass:1];
}

@end