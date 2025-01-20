@interface KMIntentVocabularyAuthorization
- (BOOL)isAuthorizedApp:(id)a3;
@end

@implementation KMIntentVocabularyAuthorization

- (BOOL)isAuthorizedApp:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F10190] _siriAuthorizationStatusForAppID:v3];
  if (v4 != 3)
  {
    v5 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      v6 = NSNumber;
      v7 = v5;
      v8 = [v6 numberWithInteger:v4];
      int v10 = 136315650;
      v11 = "-[KMIntentVocabularyAuthorization isAuthorizedApp:]";
      __int16 v12 = 2112;
      id v13 = v3;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_22475B000, v7, OS_LOG_TYPE_INFO, "%s App is not authorized to share vocabulary with Siri. appId=%@ authStatus=%@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v4 == 3;
}

@end