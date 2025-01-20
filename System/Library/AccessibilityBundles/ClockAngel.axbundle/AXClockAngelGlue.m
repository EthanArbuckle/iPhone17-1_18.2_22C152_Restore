@interface AXClockAngelGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXClockAngelGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = +[AXValidationManager sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = (uint64_t)[objc_allocWithZone((Class)AXClockAngelGlue) init];
    _objc_release_x1();
  }
}

BOOL __49__AXClockAngelGlue_accessibilityInitializeBundle__block_invoke(id a1, AXValidationManager *a2)
{
  return 1;
}

BOOL __49__AXClockAngelGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"ClockAngel AX"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"ClockAngel"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __49__AXClockAngelGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"TimerApertureElementControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TimerCompressedControllerAccessibility" canInteractWithTargetClass:1];
}

@end