@interface AXQuicktimePluginGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXQuicktimePluginGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_293 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_302];

  if (!_Failover)
  {
    _Failover = [objc_allocWithZone((Class)AXQuicktimePluginGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"FigPluginView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"FigPluginView", @"setAllowPlayback:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"FigPluginView", @"webPlugInStart", "@", 0);
  [v2 validateClass:@"FigPluginView" hasInstanceVariable:@"_playButton" withType:"UIButton"];

  return 1;
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"QuickTime Plugin AX Bundle"];
  [v2 setOverrideProcessName:@"QuickTimePlugin"];

  return MEMORY[0x270F0A270]();
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"FigPluginViewAccessibility" canInteractWithTargetClass:1];
}

@end