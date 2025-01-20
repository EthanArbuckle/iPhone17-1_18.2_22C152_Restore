@interface CDPLocalDeviceSecretProxyImpl
- (BOOL)hasLocalSecret;
@end

@implementation CDPLocalDeviceSecretProxyImpl

- (BOOL)hasLocalSecret
{
  v2 = objc_alloc_init(CDPDaemonConnection);
  v3 = [(CDPDaemonConnection *)v2 synchronousDaemonWithErrorHandler:&__block_literal_global_13];
  v4 = _CDPLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2182AE000, v4, OS_LOG_TYPE_DEFAULT, "Checking if the local device has a secret", buf, 2u);
  }

  *(void *)buf = 0;
  v9 = buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_17;
  v7[3] = &unk_264317818;
  v7[4] = buf;
  [v3 hasLocalSecretWithCompletion:v7];
  v5 = [(CDPDaemonConnection *)v2 connection];
  [v5 invalidate];

  LOBYTE(v5) = v9[24];
  _Block_object_dispose(buf, 8);

  return (char)v5;
}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _CDPLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_cold_1();
  }
}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_17(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  int v2 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v3 = _CDPLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      v5 = "Local device DOES have a secret";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_2182AE000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    v5 = "Local device DOES NOT have a secret";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

void __47__CDPLocalDeviceSecretProxyImpl_hasLocalSecret__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2182AE000, v0, OS_LOG_TYPE_ERROR, "XPC Error while checking if the local device has a secret: %@", v1, 0xCu);
}

@end