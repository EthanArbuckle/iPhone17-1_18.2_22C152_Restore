@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __51__NSUserDefaults_NSUserDefaults__registerDefaults___block_invoke(uint64_t a1, uint64_t a2, NSData *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 40) mutableCopy];
      v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    v8 = encodeURLForDefaults(a3);
    return [v7 setObject:v8 forKey:a2];
  }
  return result;
}

uint64_t __41__NSUserDefaults_NSUserDefaults__release__block_invoke()
{
  uint64_t result = _CFAppVersionCheckLessThan();
  _MergedGlobals_126 = result;
  return result;
}

uint64_t __76__NSUserDefaults_NSUserDefaults_NSURLExtras___web_addDefaultsChangeObserver__block_invoke()
{
  v0 = +[NSNotificationCenter defaultCenter];
  uint64_t v1 = self;
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];

  return [(NSNotificationCenter *)v0 addObserver:v1 selector:sel__web_defaultsDidChange name:@"NSUserDefaultsDidChangeNotification" object:v2];
}

void ___NSUserDefaults_Log_Nonsensical_Suites_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"NSGlobalDomain"]) {
    NSLog((NSString *)@"Using NSGlobalDomain as an NSUserDefaults suite name does not make sense and will not work. Break on _NSUserDefaults_Log_Nonsensical_Suites to find this");
  }
  else {
    NSLog((NSString *)@"Using your own bundle identifier as an NSUserDefaults suite name does not make sense and will not work. Break on _NSUserDefaults_Log_Nonsensical_Suites to find this");
  }
}

@end