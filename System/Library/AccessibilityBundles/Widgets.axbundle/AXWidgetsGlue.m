@interface AXWidgetsGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWidgetsGlue

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

void __46__AXWidgetsGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_271 withPreValidationHandler:&__block_literal_global_273 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];
}

uint64_t __46__AXWidgetsGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __46__AXWidgetsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"AX Widgets"];
  [v2 setOverrideProcessName:@"AX Widgets"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __46__AXWidgetsGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WGShortLookStyleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGWidgetHostingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGWidgetListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGNewWidgetsButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGWidgetListEditViewTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGWidgetAttributionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGWidgetPlatterViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGMajorListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_WGWidgetRemoteViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGPlatterHeaderContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_WGWidgetListScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WGCarouselListViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end