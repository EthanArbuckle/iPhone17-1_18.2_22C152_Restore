@interface CDPContext(Daemon)
- (uint64_t)hasSRPPasswordMetadata;
- (void)populateWalrusStatus;
- (void)reauthenticateUserWithCompletion:()Daemon;
- (void)refreshWithSilentAuthWithCompletion:()Daemon;
@end

@implementation CDPContext(Daemon)

- (void)reauthenticateUserWithCompletion:()Daemon
{
  id v4 = a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "Attempting silent re-authentication...", (uint8_t *)buf, 2u);
  }

  if ([a1 idmsRecovery])
  {
    v6 = [a1 _authProvider];

    if (v6)
    {
      objc_initWeak(buf, a1);
      v7 = [a1 _authProvider];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke;
      v10[3] = &unk_26432F1B8;
      objc_copyWeak(&v12, buf);
      v10[4] = a1;
      id v11 = v4;
      [v7 cdpContext:a1 performSilentRecoveryTokenRenewal:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
    else if (v4)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_19;
    v8[3] = &unk_26432EE88;
    v8[4] = a1;
    id v9 = v4;
    +[CDPAuthenticationHelper silentAuthenticationForContext:a1 withCompletion:v8];
  }
}

- (void)populateWalrusStatus
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_218640000, v0, OS_LOG_TYPE_ERROR, "Error populating walrus status on context - %@", v1, 0xCu);
}

- (void)refreshWithSilentAuthWithCompletion:()Daemon
{
  id v4 = a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_218640000, v5, OS_LOG_TYPE_DEFAULT, "EDP: Starting silent authentication to get password metadata", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, a1);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CDPContext_Daemon__refreshWithSilentAuthWithCompletion___block_invoke;
  v7[3] = &unk_26432F7E8;
  objc_copyWeak(&v9, buf);
  id v6 = v4;
  id v8 = v6;
  +[CDPAuthenticationHelper silentAuthenticationForContext:a1 withCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (uint64_t)hasSRPPasswordMetadata
{
  uint64_t v2 = [a1 passwordVersion];
  if (v2)
  {
    v3 = [a1 srpProtocol];
    if (v3)
    {
      id v4 = [a1 srpSalt];
      v5 = [a1 srpIteration];
      if (v4) {
        BOOL v6 = v5 == 0;
      }
      else {
        BOOL v6 = 1;
      }
      uint64_t v7 = !v6;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end