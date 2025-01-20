@interface AXReplayKitModuleGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXReplayKitModuleGlue

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

uint64_t __54__AXReplayKitModuleGlue_accessibilityInitializeBundle__block_invoke()
{
  v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_278 withPreValidationHandler:&__block_literal_global_300 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_306];

  uint64_t v1 = objc_opt_new();
  v2 = (void *)RPClientDelegate;
  RPClientDelegate = v1;

  return MEMORY[0x270F09460](&__block_literal_global_313);
}

uint64_t __54__AXReplayKitModuleGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"RPControlCenterClient", @"addDelegate:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"RPControlCenterClient", @"sharedInstance", "@", 0);
  [v2 validateProtocol:@"RPControlCenterClientDelegate" hasMethod:@"didStopRecordingOrBroadcast" isInstanceMethod:1 isRequired:1];
  [v2 validateProtocol:@"RPControlCenterClientDelegate" hasMethod:@"didStartRecordingOrBroadcast" isInstanceMethod:1 isRequired:1];

  return 1;
}

uint64_t __54__AXReplayKitModuleGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ReplayKit Module (ControlCenter)"];
  [v2 setOverrideProcessName:@"ReplayKit Module (ControlCenter)"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __54__AXReplayKitModuleGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"RPControlCenterMenuModuleViewControllerAccessibility" canInteractWithTargetClass:1];
  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

void __54__AXReplayKitModuleGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [NSClassFromString(&cfstr_Rpcontrolcente_0.isa) safeValueForKey:@"sharedInstance"];
  [v0 addDegate:RPClientDelegate];
}

@end