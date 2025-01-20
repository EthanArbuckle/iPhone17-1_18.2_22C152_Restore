@interface CDPDLocalDeviceSecretProxyImpl
- (BOOL)hasLocalSecret;
- (void)hasLocalSecret;
@end

@implementation CDPDLocalDeviceSecretProxyImpl

- (BOOL)hasLocalSecret
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeSet];
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(CDPDLocalDeviceSecretProxyImpl *)(uint64_t)v2 hasLocalSecret];
  }

  return v3;
}

- (void)hasLocalSecret
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_218640000, log, OS_LOG_TYPE_DEBUG, "Managed config (%@) reports isPasscodeSet=%i", (uint8_t *)&v3, 0x12u);
}

@end