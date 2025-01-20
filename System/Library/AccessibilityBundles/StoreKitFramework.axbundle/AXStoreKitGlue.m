@interface AXStoreKitGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXStoreKitGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    uint64_t v2 = [objc_allocWithZone((Class)AXStoreKitGlue) init];
    v3 = (void *)_Failover;
    _Failover = v2;

    id v4 = [MEMORY[0x263F229D0] sharedInstance];
    [v4 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_279 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_288];
  }
}

uint64_t __47__AXStoreKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKStarRatingControl", @"value", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"SKStarRatingControl", @"setValue:", "v", "f", 0);

  return 1;
}

uint64_t __47__AXStoreKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"StoreKit AX Bundle"];
  [v2 setOverrideProcessName:@"StoreKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __47__AXStoreKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SKStarRatingControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SKStoreReviewPresentationWindowAccessibility" canInteractWithTargetClass:1];
}

@end