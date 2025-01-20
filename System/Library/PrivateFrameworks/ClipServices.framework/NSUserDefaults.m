@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __62__NSUserDefaults_ClipServicesExtras__cps_clipServicesDefaults__block_invoke()
{
  cps_clipServicesDefaults_clipServicesDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.ClipServices"];

  return MEMORY[0x270F9A758]();
}

@end