@interface AXMediaPlayerFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMediaPlayerFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_315 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_324];

    _Failover = [objc_allocWithZone((Class)AXMediaPlayerFrameworkGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __59__AXMediaPlayerFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"MPDetailSlider"];
  [v2 validateClass:@"MPVolumeView"];
  [v2 validateClass:@"MPDetailSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPAVItem", @"album", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"_stringForCurrentTime:", "@", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"continueTrackingWithTouch: withEvent:", "B", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"_updateTimeDisplayForTime:", "v", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeSlider", @"_commitVolumeChange", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPVolumeView", @"_routeButton", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"value", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"MPDetailSlider", @"delegate", "@", 0);
  [v2 validateClass:@"MPDetailSlider" hasInstanceVariable:@"_allowsScrubbing" withType:"BOOL"];

  return 1;
}

uint64_t __59__AXMediaPlayerFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Media Player AX Bundle"];
  [v2 setOverrideProcessName:@"MediaPlayer"];

  return MEMORY[0x270F0A270]();
}

void __59__AXMediaPlayerFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UINavigationButtonAccessibility__MediaPlayer__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAVRoutingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAVRoutingSheetAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAVItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPDetailSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPVolumeSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPVolumeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewCellAccessibility__MediaPlayer__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAVRoutingTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPModalPresentationWindowAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAddKeepLocalControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPRouteLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPRouteButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MPAVRoutingControllerAccessibility" canInteractWithTargetClass:1];
}

@end