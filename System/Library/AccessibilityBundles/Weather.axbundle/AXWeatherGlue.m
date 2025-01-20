@interface AXWeatherGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWeatherGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_268 withPreValidationHandler:&__block_literal_global_276 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_285];
}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setOverrideProcessName:@"Weather App"];
  [v2 setValidationTargetName:@"Weather Accessibility Bundle"];

  return MEMORY[0x270F09468]();
}

uint64_t __46__AXWeatherGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"MKMapViewAccessibility__Weather__MapKit" canInteractWithTargetClass:1];
}

@end