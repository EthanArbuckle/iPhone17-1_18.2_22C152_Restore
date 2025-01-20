@interface AXPosterBoardFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPosterBoardFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_326 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_335];

    _Failover = [objc_allocWithZone((Class)AXPosterBoardFrameworkGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PBFGenericPosterPreview" conformsToProtocol:@"PBFPosterPreview"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFGenericPosterPreview", @"posterDescriptorLookupInfo", "@", 0);
  [v2 validateClass:@"PBFGenericPosterDescriptorLookupInfo" conformsToProtocol:@"PBFPosterDescriptorLookupInfo"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PBFGenericPosterDescriptorLookupInfo", @"posterDescriptorPath", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PFServerPosterPath", @"identity", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PFServerPosterIdentity", @"descriptorIdentifier", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PFServerPosterIdentity", @"provider", "@", 0);
  [v2 validateClass:@"PBFPosterGalleryPreviewView" hasInstanceVariable:@"_posterPreviewContentView" withType:"PBFPosterGalleryPreviewContentView"];
  [v2 validateClass:@"CHSWidgetDescriptor" hasProperty:@"extensionIdentity" withType:"@"];
  [v2 validateClass:@"CHSExtensionIdentity" hasProperty:@"containerBundleIdentifier" withType:"@"];

  return 1;
}

uint64_t __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"PosterBoardFramework AX"];
  [v2 setOverrideProcessName:@"PosterBoardFramework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __59__AXPosterBoardFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"PBFPosterGalleryPreviewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBFFocusPosterCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LockScreenPosterCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterSectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterRackCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterGalleryAffordanceCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeScreenConfigurationControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBFPosterGallerySectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterEditingConfirmationViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeScreenPosterCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterCoupledTitlesViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeScreenConfigurationPosterControlContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HomeScreenConfigurationBlurControlContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterRackCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterBoardFrameworkUIButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterSectionRemovalViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AmbientCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PosterSectionFooterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PBFAmbientEditingCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end