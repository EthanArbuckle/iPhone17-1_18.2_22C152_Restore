@interface VSProxyDetector
+ (BOOL)isProxyConfigured;
@end

@implementation VSProxyDetector

+ (BOOL)isProxyConfigured
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v2 = CFNetworkCopySystemProxySettings();
  v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F18FD0]];

  v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3 != 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Proxy Configured? %d", (uint8_t *)v6, 8u);
  }

  return v3 != 0;
}

@end