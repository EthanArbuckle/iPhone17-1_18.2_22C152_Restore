@interface CDPContext(AsyncMode)
- (uint64_t)disableAsyncModeRequested;
@end

@implementation CDPContext(AsyncMode)

- (uint64_t)disableAsyncModeRequested
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ((objc_msgSend(MEMORY[0x263F34350], "isSubsetOfContextTypeRepair:", objc_msgSend(a1, "type")) & 1) != 0
    || [a1 type] == 3
    || [a1 type] == 4
    || [a1 type] == 5
    || [a1 type] == 6
    || [a1 type] == 7
    || [a1 type] == 8)
  {
    v2 = _CDPLogSystem();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
LABEL_11:

      return 1;
    }
    int v7 = 134217984;
    uint64_t v8 = [a1 type];
    v3 = "Disabling async secure backup enrollment for CDPContextType: %ld";
    v4 = v2;
    uint32_t v5 = 12;
LABEL_10:
    _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v7, v5);
    goto LABEL_11;
  }
  if (([a1 isLocalSecretCached] & 1) == 0)
  {
    v2 = _CDPLogSystem();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v7) = 0;
    v3 = "Disabling async secure backup enrollment since context has no cached local secret.";
    goto LABEL_22;
  }
  if ([a1 _disableAsyncSecureBackupEnrollment])
  {
    v2 = _CDPLogSystem();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v7) = 0;
    v3 = "Context has disabled async secure backup enrollment";
    goto LABEL_22;
  }
  uint64_t result = CFPreferencesGetAppBooleanValue(@"DisableAsyncEnable", @"com.apple.corecdp", 0);
  if (result)
  {
    v2 = _CDPLogSystem();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    LOWORD(v7) = 0;
    v3 = "Pref to disable async enable was set...";
LABEL_22:
    v4 = v2;
    uint32_t v5 = 2;
    goto LABEL_10;
  }
  return result;
}

@end