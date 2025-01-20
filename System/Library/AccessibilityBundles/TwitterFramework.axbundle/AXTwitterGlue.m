@interface AXTwitterGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXTwitterGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXTwitterGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 setOverrideProcessName:@"Twitter"];
  uint64_t v2 = AXPerformValidationChecks();
  if (v2) {
    NSLog(&cfstr_ValidatingSymb.isa);
  }
  return v2;
}

void __46__AXTwitterGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    NSLog(&cfstr_ErrorsValidati.isa, a3);
  }
  else {
    NSLog(&cfstr_ValidatedAxtwi.isa);
  }
}

@end