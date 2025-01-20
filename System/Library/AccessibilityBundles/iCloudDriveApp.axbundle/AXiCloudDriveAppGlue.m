@interface AXiCloudDriveAppGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXiCloudDriveAppGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

    _Failover = objc_alloc_init(AXiCloudDriveAppGlue);
    MEMORY[0x270F9A758]();
  }
}

uint64_t __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"iCloudDriveApp AX Bundle"];
  [v2 setOverrideProcessName:@"iCloudDriveApp"];

  return MEMORY[0x270F0A270]();
}

void __53__AXiCloudDriveAppGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"NavControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FileInfoCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ThumbnailImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PreviewDetailsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"FileInfoStackViewAccessibility" canInteractWithTargetClass:1];
}

@end