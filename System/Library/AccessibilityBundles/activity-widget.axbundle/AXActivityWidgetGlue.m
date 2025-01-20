@interface AXActivityWidgetGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXActivityWidgetGlue

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

void __53__AXActivityWidgetGlue_accessibilityInitializeBundle__block_invoke(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];
}

BOOL __53__AXActivityWidgetGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __53__AXActivityWidgetGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AX ActivityWidget"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AX ActivityWidget"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __53__AXActivityWidgetGlue_accessibilityInitializeBundle__block_invoke_4(id a1, AXValidationManager *a2)
{
}

@end