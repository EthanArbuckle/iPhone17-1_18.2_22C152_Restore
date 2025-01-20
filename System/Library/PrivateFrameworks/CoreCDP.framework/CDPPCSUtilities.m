@interface CDPPCSUtilities
+ (id)_pcsConfigForPrimaryAccount;
+ (id)setupDictionaryWithContext:(id)a3;
+ (void)_pcsConfigForPrimaryAccount;
@end

@implementation CDPPCSUtilities

+ (id)setupDictionaryWithContext:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [v3 appleID];

  if (v5)
  {
    v6 = [v3 appleID];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F62210]];
  }
  v7 = [v3 dsid];

  if (v7)
  {
    v8 = [v3 dsid];
    v9 = [v8 stringValue];
    [v4 setObject:v9 forKeyedSubscript:*MEMORY[0x263F621D8]];
  }
  v10 = [v3 passwordEquivToken];

  if (v10)
  {
    v11 = [v3 passwordEquivToken];
    [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x263F621F0]];
  }
  v12 = [v3 telemetryFlowID];

  if (v12)
  {
    v13 = [v3 telemetryFlowID];
    [v4 setObject:v13 forKeyedSubscript:@"kPCSFlowID"];
  }
  v14 = [v3 telemetryDeviceSessionID];

  if (v14)
  {
    v15 = [v3 telemetryDeviceSessionID];
    [v4 setObject:v15 forKeyedSubscript:@"kPCSDeviceSessionID"];
  }
  v16 = [v3 altDSID];

  v17 = _CDPLogSystem();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[CDPPCSUtilities setupDictionaryWithContext:]();
    }

    v18 = [v3 altDSID];
    [v4 setObject:v18 forKeyedSubscript:@"kPCSAltDSID"];
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    +[CDPPCSUtilities setupDictionaryWithContext:]();
  }

  v19 = [(id)objc_opt_class() _pcsConfigForPrimaryAccount];
  [v4 addEntriesFromDictionary:v19];

  if ([v3 edpState] == 2)
  {
    v20 = [v3 password];

    if (v20)
    {
      v21 = [v3 password];
      [v4 setObject:v21 forKeyedSubscript:*MEMORY[0x263F621F8]];
    }
    v22 = [v3 passwordVersion];

    if (v22)
    {
      v23 = [v3 passwordVersion];
      [v4 setObject:v23 forKeyedSubscript:@"kPCSSetupPasswordGeneration"];
    }
    v24 = [v3 srpProtocol];

    if (v24)
    {
      v25 = [v3 srpProtocol];
      [v4 setObject:v25 forKeyedSubscript:@"kPCSSetupVerifierProtocol"];
    }
    v26 = [v3 srpIteration];

    if (v26)
    {
      v27 = [v3 srpIteration];
      [v4 setObject:v27 forKeyedSubscript:@"kPCSSetupVerifierIterationCount"];
    }
    v28 = [v3 srpSalt];

    if (v28)
    {
      v29 = [v3 srpSalt];
      [v4 setObject:v29 forKeyedSubscript:@"kPCSSetupVerifierSalt"];
    }
    v30 = [v3 appleID];

    if (v30)
    {
      v31 = [v3 appleID];
      [v4 setObject:v31 forKeyedSubscript:@"kPCSAuthenticateAppleID"];
    }
    v32 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "edpState") == 2);
    [v4 setObject:v32 forKeyedSubscript:@"kPCSSetupGuitarfish"];

    v33 = [v3 edpRecoveryToken];

    if (v33)
    {
      v34 = [v3 edpRecoveryToken];
      v35 = [v34 componentsSeparatedByString:@"-"];
      [v4 setObject:v35 forKeyedSubscript:@"kPCSSetupRecoveryToken"];
    }
  }
  v36 = (void *)[v4 copy];

  return v36;
}

+ (id)_pcsConfigForPrimaryAccount
{
  v2 = (void *)[MEMORY[0x263EFFA78] mutableCopy];
  id v3 = +[CDPAccount sharedInstance];
  v4 = [v3 iCloudEnv];

  if (v4)
  {
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F62218]];
  }
  else
  {
    v5 = _CDPLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount]();
    }
  }
  v6 = +[CDPAccount sharedInstance];
  v7 = [v6 authToken];

  if (v7)
  {
    [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x263F621D0]];
  }
  else
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount]();
    }
  }
  v9 = +[CDPAccount sharedInstance];
  v10 = [v9 escrowURL];

  if (v10)
  {
    [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x263F621E0]];
  }
  else
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CDPPCSUtilities _pcsConfigForPrimaryAccount]();
    }
  }
  return v2;
}

+ (void)setupDictionaryWithContext:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_2182AE000, v0, OS_LOG_TYPE_FAULT, "_context.altDSID is nil.", v1, 2u);
}

+ (void)setupDictionaryWithContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2182AE000, v0, OS_LOG_TYPE_DEBUG, "_context.altDSID exists. Passing to PCS...", v1, 2u);
}

+ (void)_pcsConfigForPrimaryAccount
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_2182AE000, v0, v1, "iCloud Env missing, bad things to come...", v2, v3, v4, v5, v6);
}

@end