@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __56__NSUserDefaults_ARAppleGlobalDomain__appleGlobalDomain__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"Apple Global Domain"];
  v1 = (void *)appleGlobalDomain_defaults;
  appleGlobalDomain_defaults = v0;
}

uint64_t __65__NSUserDefaults_ARAppleGlobalDomain__appleGlobalDomainARKitKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"com.apple.arkit."]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 hasPrefix:@"com_apple_arkit_"];
  }

  return v3;
}

@end