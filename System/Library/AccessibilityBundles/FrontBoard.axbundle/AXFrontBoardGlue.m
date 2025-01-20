@interface AXFrontBoardGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXFrontBoardGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_273];

    _Failover = [objc_allocWithZone((Class)AXFrontBoardGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"FrontBoard AX"];
  [v2 setOverrideProcessName:@"FrontBoard AX"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __49__AXFrontBoardGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"FBApplicationProcessAccessibility" canInteractWithTargetClass:1];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F21468] object:0];
}

@end