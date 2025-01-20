@interface FocusUserDefaults
@end

@implementation FocusUserDefaults

uint64_t ___FocusUserDefaults_block_invoke()
{
  _FocusUserDefaults___userDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Focus"];

  return MEMORY[0x270F9A758]();
}

@end