@interface UIKitUserDefaults
@end

@implementation UIKitUserDefaults

uint64_t ___UIKitUserDefaults_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.UIKit"];
  v1 = (void *)qword_269A11C98;
  qword_269A11C98 = v0;

  uint64_t result = os_variant_has_internal_diagnostics();
  if (result)
  {
    v3 = (void *)qword_269A11C98;
    uint64_t v4 = *MEMORY[0x263F07F48];
    return [v3 addSuiteNamed:v4];
  }
  return result;
}

@end