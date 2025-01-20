@interface AXControlCenterUIGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXControlCenterUIGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_331 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_337];
}

uint64_t __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"isExpanded", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"expandModule", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIContentModuleContainerViewController", @"dismissExpandedModuleAnimated:", "v", "B", 0);
  [v2 validateClass:@"ControlCenterUIServices.ControlsGalleryManager"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIPagingViewController", @"setEditing:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIPagingViewController", @"changeGridSizeClassOfIcon:toGridSizeClass:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIPagingViewController", @"resetEndEditingTimerIfNecessary", "v", 0);
  [v2 validateClass:@"CCUIPagingViewController" hasSwiftField:@"addButton" withSwiftType:"Optional<UIButton>"];
  [v2 validateClass:@"CCUIPagingViewController" hasSwiftField:@"__rootFolderController" withSwiftType:"Optional<IconListRootFolderController>"];
  [v2 validateClass:@"CCUIPagingViewController" hasSwiftField:@"iconDragManager" withSwiftType:"Optional<SBIconDragManager>"];
  [v2 validateClass:@"ControlCenterUI.IconListRootFolderView"];
  [v2 validateClass:@"ControlCenterUI.IconListRootFolderView" isKindOfClass:@"SBFolderView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"ControlCenterUI.IconListRootFolderView", @"indicatorDescriptionForPageIndex:", "@", "q", 0);
  [v2 validateClass:@"CCUIWiFiModuleViewController"];
  [v2 validateClass:@"CCUIAirDropModuleViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIWiFiModuleViewController", @"buttonViewForCollapsedConnectivityModule", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIAirDropModuleViewController", @"buttonViewForCollapsedConnectivityModule", "@", 0);

  return 1;
}

uint64_t __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ControlCenterUI (ControlCenter)"];
  [v2 setOverrideProcessName:@"ControlCenterUI (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __54__AXControlCenterUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CCUIContentModuleContainerViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIContentModuleContainerTransitionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUISensorAttributionExpandedViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUISensorAttributionCompactControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUISensorAttributionSensorButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIHeaderPocketViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIPagingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIMainViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CCUIIconScrollViewAccessibility" canInteractWithTargetClass:1];
}

@end