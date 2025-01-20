@interface AXMailVIPWidgetGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMailVIPWidgetGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXMailVIPWidgetGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __52__AXMailVIPWidgetGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXMailVIPWidgetGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"MailVIPWidget"];
  [v2 setValidationTargetName:@"MailVIPWidget AX Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

@end