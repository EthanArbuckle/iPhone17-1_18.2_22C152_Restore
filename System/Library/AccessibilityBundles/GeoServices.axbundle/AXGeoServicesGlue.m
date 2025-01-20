@interface AXGeoServicesGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXGeoServicesGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_298 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_307];
}

uint64_t __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"GEOVectorTile"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOVectorTile", @"buildingFootprints", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOVectorTile", @"buildingFootprintsCount", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOVectorTile", @"forEachRoad:", "v", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"GEOPlaceCollection", @"publisherAttribution", "@", 0);
  [v2 validateProtocol:@"GEOCollectionPublisherAttribution" hasRequiredInstanceMethod:@"displayName"];

  return 1;
}

uint64_t __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"GeoServices"];
  [v2 setValidationTargetName:@"GeoServices Accessibility Bundle"];

  return MEMORY[0x270F0A270]();
}

void __50__AXGeoServicesGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"GEOVectorTileAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"GEOComposedRouteAccessibility" canInteractWithTargetClass:1];
}

@end