@interface CFNGetHTTP3Override
@end

@implementation CFNGetHTTP3Override

void ____CFNGetHTTP3Override_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = getenv("CFN_USE_HTTP3");
  if (!v0) {
    goto LABEL_9;
  }
  v1 = v0;
  if (__CFNIsInDevelopmentEnvironment::onceToken != -1) {
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_30);
  }
  if (__CFNIsInDevelopmentEnvironment::ok)
  {
    __CFNGetHTTP3Override::value = strtol(v1, 0, 10);
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    v2 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = __CFNGetHTTP3Override::value;
      v3 = "HTTP/3 override %d via env";
LABEL_14:
      _os_log_impl(&dword_184085000, v2, OS_LOG_TYPE_INFO, v3, buf, 8u);
    }
  }
  else
  {
LABEL_9:
    Boolean keyExistsAndHasValidFormat = 0;
    char AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CFNetworkHTTP3Override", @"Apple Global Domain", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      __CFNGetHTTP3Override::value = AppIntegerValue;
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v2 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v7 = __CFNGetHTTP3Override::value;
        v3 = "HTTP/3 override %d via preference";
        goto LABEL_14;
      }
    }
  }
}

@end