@interface LPKPerformanceTestIntermediary
+ (BOOL)_startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 isPerformanceTest:(BOOL)a9;
+ (BOOL)endUserSwitchTest;
+ (BOOL)startPerformanceTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8;
+ (BOOL)startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8;
+ (id)_generateSharedipadTraceHelperCommand;
+ (id)endPerformanceTestAndDumpResults;
+ (int64_t)_disableKtrace;
+ (int64_t)_dumpKtraceResult;
+ (int64_t)_enableKtrace;
+ (void)_removeStoredValues;
+ (void)disableRestrictionlessLoginWithCompletionHandler:(id)a3;
+ (void)enableRestrictionlessLoginWithCompletionHandler:(id)a3;
@end

@implementation LPKPerformanceTestIntermediary

+ (BOOL)startPerformanceTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  id v13 = a5;
  id v14 = a6;
  if ([MEMORY[0x263F52778] isInternalBuild]
    && !+[LPKPerformanceTestIntermediary _enableKtrace])
  {
    LOBYTE(v17) = 1;
    BOOL v15 = +[LPKPerformanceTestIntermediary _startUserSwitchTestForType:a3 count:a4 username:v13 password:v14 loginDelay:a7 logoutDelay:a8 isPerformanceTest:v17];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (id)endPerformanceTestAndDumpResults
{
  if (![MEMORY[0x263F52778] isInternalBuild]
    || +[LPKPerformanceTestIntermediary _disableKtrace]
    || ([MEMORY[0x263F08850] defaultManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 fileExistsAtPath:@"/tmp/perf_test_result.json"],
        v4,
        (v5 & 1) == 0)
    && +[LPKPerformanceTestIntermediary _dumpKtraceResult])
  {
    v2 = 0;
  }
  else
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:@"/tmp/perf_test_result.json"];
    id v15 = 0;
    v7 = [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:&v15];
    id v8 = v15;
    if (v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      NSLog(&cfstr_FailedToDeseri.isa, v8);
      v2 = 0;
    }
    else
    {
      NSLog(&cfstr_DeserializePer.isa);
      v9 = [MEMORY[0x263F52780] sharedStorage];
      v10 = [v9 retrieveValueForKey:@"loginctlPerfTestType"];
      uint64_t v11 = [v10 integerValue];

      v12 = [MEMORY[0x263F52780] sharedStorage];
      id v13 = [v12 retrieveValueForKey:@"loginctlPerfTestCount"];
      uint64_t v14 = [v13 integerValue];

      v2 = +[LPKPerfResultAnalyzer analyzePerformanceTestResult:v7 type:v11 count:v14];
      if (!+[LPKPerformanceTestIntermediary endUserSwitchTest])NSLog(&cfstr_NoUserSwitchTe.isa); {
    }
      }
  }

  return v2;
}

+ (BOOL)startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  LOBYTE(v9) = 0;
  return +[LPKPerformanceTestIntermediary _startUserSwitchTestForType:a3 count:a4 username:a5 password:a6 loginDelay:a7 logoutDelay:a8 isPerformanceTest:v9];
}

+ (BOOL)_startUserSwitchTestForType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8 isPerformanceTest:(BOOL)a9
{
  v44[4] = *MEMORY[0x263EF8340];
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = [MEMORY[0x263F52780] sharedStorage];
  v18 = [v17 retrieveValueForKey:@"LPKIsLocalUserSwitchTestOngoing"];

  if (v18)
  {
    NSLog(&cfstr_ThereSALocalTe.isa);
    BOOL v19 = 0;
  }
  else
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 1;
    [a1 _removeStoredValues];
    NSLog(&cfstr_StoringTestSta.isa);
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    v29 = [MEMORY[0x263F52780] sharedStorage];
    v43[0] = @"loginctlPerfTestType";
    v20 = [NSNumber numberWithUnsignedInteger:a3];
    v44[0] = v20;
    v43[1] = @"loginctlPerfTestCount";
    v21 = [NSNumber numberWithInteger:a4];
    v44[1] = v21;
    v43[2] = @"LPKLocalUserSwitchTestIsPerformanceTest";
    uint64_t v22 = [NSNumber numberWithBool:a9];
    v23 = (void *)v22;
    v43[3] = @"LPKLocalUserSwitchTestRetryCount";
    v24 = &unk_26E942790;
    if (a9) {
      v24 = &unk_26E942778;
    }
    v44[2] = v22;
    v44[3] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke;
    v30[3] = &unk_264C7E8A0;
    id v31 = v15;
    unint64_t v35 = a3;
    int64_t v36 = a4;
    int64_t v37 = a7;
    int64_t v38 = a8;
    id v32 = v16;
    v34 = &v39;
    v26 = v28;
    v33 = v26;
    [v29 saveKeyValuePairs:v25 completionHandler:v30];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v40 + 24))
    {
      BOOL v19 = 1;
    }
    else
    {
      +[LPKPerformanceTestIntermediary _removeStoredValues];
      BOOL v19 = *((unsigned char *)v40 + 24) != 0;
    }

    _Block_object_dispose(&v39, 8);
  }

  return v19;
}

void __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    NSLog(&cfstr_TestStatesStor.isa, *(void *)(a1 + 32));
    v4 = [MEMORY[0x263F52770] sharedController];
    uint64_t v5 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 72);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 88);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke_2;
    v14[3] = &unk_264C7E878;
    long long v13 = *(_OWORD *)(a1 + 48);
    id v11 = (id)v13;
    long long v15 = v13;
    [v4 triggerLocalUserSwitchTestForType:v5 count:v6 username:v7 password:v8 loginDelay:v9 logoutDelay:v10 completionHandler:v14];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    NSLog(&cfstr_FailedToStartT.isa, a3);
    v12 = *(NSObject **)(a1 + 48);
    dispatch_semaphore_signal(v12);
  }
}

intptr_t __127__LPKPerformanceTestIntermediary__startUserSwitchTestForType_count_username_password_loginDelay_logoutDelay_isPerformanceTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    NSLog(&cfstr_FailedToTrigge.isa, a2);
  }
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

+ (BOOL)endUserSwitchTest
{
  v3 = [MEMORY[0x263F52780] sharedStorage];
  v4 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestHasFinishedSuccessfully"];
  char v5 = [v4 BOOLValue];

  [a1 _removeStoredValues];
  uint64_t v6 = [MEMORY[0x263F52770] sharedController];
  [v6 interruptLocalUserSwitchTest];

  return v5;
}

+ (void)enableRestrictionlessLoginWithCompletionHandler:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F52780];
  id v4 = a3;
  char v5 = [v3 sharedStorage];
  uint64_t v7 = @"isRestrictionlessLoginEnabled";
  v8[0] = MEMORY[0x263EFFA88];
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 saveKeyValuePairs:v6 completionHandler:v4];
}

+ (void)disableRestrictionlessLoginWithCompletionHandler:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F52780];
  id v4 = a3;
  char v5 = [v3 sharedStorage];
  v7[0] = @"isRestrictionlessLoginEnabled";
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v5 clearKeys:v6 completionHandler:v4];
}

+ (void)_removeStoredValues
{
  v8[11] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [MEMORY[0x263F52780] sharedStorage];
  v8[0] = @"LPKIsLocalUserSwitchTestOngoing";
  v8[1] = @"LPKLocalUserSwitchTestType";
  void v8[2] = @"LPKLocalUserSwitchTestRemainCycleCount";
  v8[3] = @"LPKLocalUserSwitchTestUsername";
  v8[4] = @"LPKLocalUserSwitchTestPassword";
  v8[5] = @"LPKLocalUserSwitchTestHasFinishedSuccessfully";
  v8[6] = @"LPKLocalUserSwitchTestRetryCount";
  v8[7] = @"LPKLocalUserSwitchTestIsPerformanceTest";
  v8[8] = @"TestHasBeenPrewarmed";
  v8[9] = @"LPKLocalUserSwitchTestLoginDelay";
  v8[10] = @"LPKLocalUserSwitchTestLogoutDelay";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:11];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__LPKPerformanceTestIntermediary__removeStoredValues__block_invoke;
  v6[3] = &unk_264C7E8C8;
  dispatch_semaphore_t v7 = v2;
  char v5 = v2;
  [v3 clearKeys:v4 completionHandler:v6];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __53__LPKPerformanceTestIntermediary__removeStoredValues__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (int64_t)_enableKtrace
{
  uint64_t v2 = system("rm /tmp/perf_test_result.trace");
  NSLog(&cfstr_RemoveOldResul.isa, v2);
  uint64_t v3 = system("rm /tmp/perf_test_result.json");
  NSLog(&cfstr_RemoveOldResul_0.isa, v3);
  uint64_t v4 = system("/usr/bin/ktrace remove");
  NSLog(&cfstr_RemoveOldKtrac.isa, v4);
  int v5 = v4;
  if (!v4)
  {
    uint64_t v6 = system("/usr/bin/ktrace init -b 200");
    NSLog(&cfstr_InitializeKtra.isa, v6);
    int v5 = v6;
    if (!v6)
    {
      uint64_t v7 = system("/usr/bin/ktrace setopt -w -f S0x2B84,S0x2BAB,S0x2BAD,S0x2BB1,S0x2B85,S0x2B8A,S0x2B52,S0x2B71,S0x2B6D,S0x2B6E,S0x3410");
      NSLog(&cfstr_SetupKtraceOut.isa, v7);
      int v5 = v7;
      if (!v7)
      {
        uint64_t v8 = system("/usr/bin/ktrace enable");
        NSLog(&cfstr_EnableKtraceD.isa, v8);
        return (int)v8;
      }
    }
  }
  return v5;
}

+ (int64_t)_disableKtrace
{
  uint64_t v2 = system("/usr/bin/ktrace disable");
  int v3 = v2;
  NSLog(&cfstr_DisableKtraceD.isa, v2);
  return v3;
}

+ (int64_t)_dumpKtraceResult
{
  uint64_t v3 = system("/usr/bin/ktrace dump -E /tmp/perf_test_result.trace");
  NSLog(&cfstr_DumpPerfResult.isa, v3);
  LODWORD(v4) = v3;
  if (!v3)
  {
    id v5 = [a1 _generateSharedipadTraceHelperCommand];
    uint64_t v4 = system((const char *)[v5 UTF8String]);

    NSLog(&cfstr_GenerateSignpo.isa, v4);
    if (!v4)
    {
      uint64_t v6 = system("ktrace trace -R /tmp/perf_test_result.trace -C /tmp/signposts.codes -fS0x2B84,S0x2BAB,S0x2BAD,S0x2BB1,S0x2B85,S0x2B8A,S0x2B71,S0x2B6D,S0x2B6E --json > /tmp/perf_test_result.json");
      LODWORD(v4) = v6;
      NSLog(&cfstr_GeneratePerfRe.isa, v6);
    }
  }
  return (int)v4;
}

+ (id)_generateSharedipadTraceHelperCommand
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F089D8] stringWithFormat:@"/usr/local/bin/sharedipadtracehelper make -codes %@ -plists ", @"/tmp/signposts.codes"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [&unk_26E9427A8 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(&unk_26E9427A8);
        }
        id v7 = *(id *)(*((void *)&v10 + 1) + 8 * i);
        if (!access((const char *)[v7 UTF8String], 4))
        {
          uint64_t v8 = [NSString stringWithFormat:@" %@ ", v7];
          [v2 appendString:v8];
        }
      }
      uint64_t v4 = [&unk_26E9427A8 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

@end