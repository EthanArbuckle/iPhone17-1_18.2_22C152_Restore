@interface ACDPreferences
+ (ACDPreferences)sharedPreferences;
- (double)serverTimeoutInterval;
- (id)objectForKey:(id)a3;
- (void)reset;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation ACDPreferences

+ (ACDPreferences)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedPreferences_sSharedPreferences;

  return (ACDPreferences *)v2;
}

uint64_t __35__ACDPreferences_sharedPreferences__block_invoke()
{
  sharedPreferences_sSharedPreferences = objc_alloc_init(ACDPreferences);

  return MEMORY[0x270F9A758]();
}

- (id)objectForKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.accounts");

  return v3;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (double)serverTimeoutInterval
{
  v2 = [(ACDPreferences *)self objectForKey:@"IdleTimeout"];
  v3 = v2;
  if (v2) {
    double v4 = (double)(int)[v2 intValue];
  }
  else {
    double v4 = 15.0;
  }

  return v4;
}

- (void)synchronize
{
}

- (void)reset
{
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE68];
  CFArrayRef v5 = CFPreferencesCopyKeyList(@"com.apple.accounts", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  CFPreferencesSetMultiple(0, v5, @"com.apple.accounts", v3, v4);
  if (v5) {
    CFRelease(v5);
  }

  [(ACDPreferences *)self synchronize];
}

@end