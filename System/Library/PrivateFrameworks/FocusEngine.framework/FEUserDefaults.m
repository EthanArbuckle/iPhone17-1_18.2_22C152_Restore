@interface FEUserDefaults
@end

@implementation FEUserDefaults

uint64_t ___FEUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.FocusEngine"];
  v1 = (void *)_MergedGlobals_5;
  _MergedGlobals_5 = v0;

  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    v3 = (void *)_MergedGlobals_5;
    uint64_t v4 = *MEMORY[0x263F07F48];
    return [v3 addSuiteNamed:v4];
  }
  return result;
}

@end