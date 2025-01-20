@interface AXWidgetRendererGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWidgetRendererGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = +[AXValidationManager sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = (uint64_t)[objc_allocWithZone((Class)AXWidgetRendererGlue) init];
    _objc_release_x1();
  }
}

BOOL __53__AXWidgetRendererGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __53__AXWidgetRendererGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"WidgetRenderer AX"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"WidgetRenderer"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __53__AXWidgetRendererGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"WidgetSceneContentViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TouchPassThroughViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"AccessibilityNodeAccessibility__WidgetRenderer__SwiftUI" canInteractWithTargetClass:1];
}

@end