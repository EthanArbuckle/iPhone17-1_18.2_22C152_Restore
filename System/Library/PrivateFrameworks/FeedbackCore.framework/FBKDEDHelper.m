@interface FBKDEDHelper
+ (id)_seedPortal;
+ (id)_seedingHost;
+ (id)adoptSessionIdWithExistingSessionId:(id)a3;
+ (id)bugSessionIDForAdoptingLocalFilesWithFilerForm:(id)a3;
+ (id)bugSessionIDForForm:(id)a3 device:(id)a4;
+ (void)_getBugSessionConfigWithSubmissionType:(int64_t)a3 formId:(int64_t)a4 device:(id)a5 completion:(id)a6;
+ (void)_getSessionForForm:(id)a3 device:(id)a4 isAdoptingSession:(BOOL)a5 shouldGetSessionStatus:(BOOL)a6 completion:(id)a7;
+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 dedDevice:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8;
+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 device:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8;
+ (void)_startSessionByFirstPairingWithConfig:(id)a3 device:(id)a4 grouped:(id)a5 identifier:(id)a6 shouldGetDetails:(BOOL)a7 shouldGetSessionStatus:(BOOL)a8 completion:(id)a9;
+ (void)cleanupBugSessionDirectoriesForForm:(id)a3;
+ (void)completeEnhancedLoggingWithFollowup:(id)a3 devicesController:(id)a4 completion:(id)a5;
+ (void)didFailToPinPairOnDemandWithDevice:(id)a3 error:(int64_t)a4 identifier:(id)a5 observer:(id)a6 completion:(id)a7;
+ (void)fetchTextDataOnMatcherPredicates:(id)a3 fromSession:(id)a4 completion:(id)a5;
+ (void)getSessionForForm:(id)a3 device:(id)a4 shouldGetSessionStatus:(BOOL)a5 completion:(id)a6;
+ (void)getStateOnSession:(id)a3 withCompletion:(id)a4;
+ (void)reconnectBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
+ (void)reconnectWithBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5;
+ (void)sendLocalFilesToDED:(id)a3 withForm:(id)a4 withCompletion:(id)a5;
@end

@implementation FBKDEDHelper

+ (id)bugSessionIDForAdoptingLocalFilesWithFilerForm:(id)a3
{
  id v4 = a3;
  v5 = +[FBKGroupedDevice currentGroupedDevice];
  v6 = [a1 bugSessionIDForForm:v4 device:v5];

  v7 = [a1 adoptSessionIdWithExistingSessionId:v6];

  return v7;
}

+ (id)adoptSessionIdWithExistingSessionId:(id)a3
{
  return (id)[NSString stringWithFormat:@"adopt-%@", a3];
}

+ (void)reconnectWithBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F3A150] sharedInstance];
  v12 = [v11 sessionForIdentifier:v8];

  v13 = +[FBKLog ded];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "Found existing session [%{public}@]. Will ping", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke;
    v23[3] = &unk_264875518;
    p_long long buf = &buf;
    id v15 = v10;
    id v25 = v15;
    id v24 = v12;
    [v24 pingWithCallback:v23];
    dispatch_time_t v16 = dispatch_time(0, 20000000000);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_3;
    v17[3] = &unk_264875540;
    v21 = &buf;
    id v18 = v8;
    id v22 = a1;
    id v19 = v9;
    id v20 = v15;
    dispatch_after(v16, MEMORY[0x263EF83A0], v17);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "Does not have existing bug session [%{public}@]. Will start lightweight session", (uint8_t *)&buf, 0xCu);
    }

    [a1 reconnectBugSessionWithIdentifier:v8 deviceIdentifier:v9 completion:v10];
  }
}

void __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_2;
  block[3] = &unk_2648754F0;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v6 = v3;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], 0, a1[4]);
}

uint64_t __82__FBKDEDHelper_reconnectWithBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_3(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    uint64_t v1 = result;
    id v2 = +[FBKLog ded];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 32);
      int v4 = 138543362;
      uint64_t v5 = v3;
      _os_log_impl(&dword_22A36D000, v2, OS_LOG_TYPE_DEFAULT, "Ping bug session [%{public}@] timed out. Will start lightweight session", (uint8_t *)&v4, 0xCu);
    }

    return [*(id *)(v1 + 64) reconnectBugSessionWithIdentifier:*(void *)(v1 + 32) deviceIdentifier:*(void *)(v1 + 40) completion:*(void *)(v1 + 48)];
  }
  return result;
}

+ (void)getStateOnSession:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke;
  v13[3] = &unk_264875590;
  id v15 = v16;
  id v7 = v6;
  id v14 = v7;
  [v5 getStateWithCompletion:v13];
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_3;
  v10[3] = &unk_2648755B8;
  id v11 = v7;
  v12 = v16;
  id v9 = v7;
  dispatch_after(v8, MEMORY[0x263EF83A0], v10);

  _Block_object_dispose(v16, 8);
}

void __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_2;
  block[3] = &unk_264875568;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v9 = (id)v12;
  long long v16 = v12;
  uint64_t v17 = a2;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[8], a1[4], a1[5]);
}

void __49__FBKDEDHelper_getStateOnSession_withCompletion___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.fbk.ded" code:105 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)cleanupBugSessionDirectoriesForForm:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v27 = a3;
  int v4 = [MEMORY[0x263F3A150] sharedInstance];
  id v5 = +[FBKDeviceManager sharedInstance];
  id v6 = [v5 configuredDevices];
  id v7 = objc_msgSend(v6, "ded_selectItemsPassingTest:", &__block_literal_global_22);

  if ((unint64_t)[v7 count] >= 0xB)
  {
    uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 0, 10);

    id v7 = (void *)v8;
  }
  id v24 = v7;
  [MEMORY[0x263EFFA08] setWithArray:v7];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v39;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v9;
        id v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        id v11 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
        uint64_t v12 = [a1 bugSessionIDForForm:v27 device:v10];
        [v11 addObject:v12];
        if ([v10 isCurrentDevice])
        {
          v13 = [a1 adoptSessionIdWithExistingSessionId:v12];
          [v11 addObject:v13];
        }
        char v29 = (void *)v12;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v31 = v11;
        uint64_t v14 = [v31 countByEnumeratingWithState:&v34 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v31);
              }
              uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              id v19 = +[FBKLog ded];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                [v10 publicLogDescription];
                id v20 = v4;
                id v22 = v21 = a1;
                *(_DWORD *)long long buf = 138543618;
                uint64_t v43 = v18;
                __int16 v44 = 2114;
                v45 = v22;
                _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_INFO, "will cleanup session [%{public}@] on device [%{public}@]", buf, 0x16u);

                a1 = v21;
                int v4 = v20;
              }

              v23 = objc_opt_new();
              [v23 setFinishingMove:0];
              v32[0] = MEMORY[0x263EF8330];
              v32[1] = 3221225472;
              v32[2] = __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_62;
              v32[3] = &unk_2648755E0;
              v32[4] = v18;
              v32[5] = v10;
              id v33 = v4;
              [a1 _getSessionWithIdentifier:v18 configuration:v23 device:v10 getDetails:0 shouldGetSessionStatus:0 completion:v32];
            }
            uint64_t v15 = [v31 countByEnumeratingWithState:&v34 objects:v46 count:16];
          }
          while (v15);
        }

        uint64_t v9 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v28);
  }
}

uint64_t __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVisibleToDED];
}

void __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_62(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[FBKLog ded];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_62_cold_1(a1);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [*(id *)(a1 + 40) publicLogDescription];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_INFO, "will abort session [%{public}@] on device [%{public}@]", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 48) abortSession:v5];
  }
}

+ (id)bugSessionIDForForm:(id)a3 device:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = submissionTypeForForm(v6);
  uint64_t v8 = [v6 filerFormID];

  if (!v8)
  {
    uint64_t v9 = +[FBKLog appHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[FBKDEDHelper bugSessionIDForForm:device:]();
    }

    uint64_t v8 = &unk_26DE1E7F8;
  }
  if (+[FBKSSharedConstants environment])
  {
    +[FBKSSharedConstants environment];
    int v10 = FBKSStringFromEnvironment();
    uint64_t v11 = [v10 substringToIndex:1];
  }
  else
  {
    uint64_t v11 = &stru_26DDF6A30;
  }
  __int16 v12 = @"fr";
  if (v7 == 2) {
    __int16 v12 = @"ffu";
  }
  v13 = NSString;
  uint64_t v14 = v12;
  uint64_t v15 = [v5 identifier];
  uint64_t v16 = [v13 stringWithFormat:@"%@-%@-%@%@-%@", @"fba", v14, v11, v8, v15];

  return v16;
}

+ (void)getSessionForForm:(id)a3 device:(id)a4 shouldGetSessionStatus:(BOOL)a5 completion:(id)a6
{
}

+ (void)sendLocalFilesToDED:(id)a3 withForm:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = +[FBKGroupedDevice currentGroupedDevice];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke;
  v14[3] = &unk_264875608;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [a1 _getSessionForForm:v10 device:v11 isAdoptingSession:1 shouldGetSessionStatus:0 completion:v14];
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 || !v6)
  {
    id v9 = +[FBKLog ded];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_78;
    v10[3] = &unk_264874478;
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v11 = v7;
    [v11 adoptFiles:v8 withCompletion:v10];
  }
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = +[FBKLog ded];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_78_cold_1();
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) commit];
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v5();
}

+ (void)_getSessionForForm:(id)a3 device:(id)a4 isAdoptingSession:(BOOL)a5 shouldGetSessionStatus:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = +[FBKLog ded];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v12 filerFormID];
    *(_DWORD *)long long buf = 67109120;
    int v35 = [v16 intValue];
    _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "will get session for filer form [%i]", buf, 8u);
  }
  uint64_t v17 = [v12 filerFormID];
  uint64_t v18 = [v17 integerValue];

  id v19 = [a1 bugSessionIDForForm:v12 device:v13];
  if (v9)
  {
    uint64_t v20 = [a1 adoptSessionIdWithExistingSessionId:v19];

    id v19 = (void *)v20;
  }
  BOOL v21 = !v9;
  uint64_t v22 = submissionTypeForForm(v12);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __94__FBKDEDHelper__getSessionForForm_device_isAdoptingSession_shouldGetSessionStatus_completion___block_invoke;
  v26[3] = &unk_264875630;
  id v29 = v14;
  uint64_t v30 = v18;
  id v31 = a1;
  id v27 = v19;
  id v28 = v13;
  BOOL v32 = v21;
  BOOL v33 = a6;
  id v23 = v13;
  id v24 = v19;
  id v25 = v14;
  [a1 _getBugSessionConfigWithSubmissionType:v22 formId:v18 device:v23 completion:v26];
}

void __94__FBKDEDHelper__getSessionForForm_device_isAdoptingSession_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = +[FBKLog ded];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 134217984;
      uint64_t v9 = v7;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "did get configuration for filer form [%li]", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 64) _getSessionWithIdentifier:*(void *)(a1 + 32) configuration:v5 device:*(void *)(a1 + 40) getDetails:*(unsigned __int8 *)(a1 + 72) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 73) completion:*(void *)(a1 + 48)];
  }
}

+ (void)_getBugSessionConfigWithSubmissionType:(int64_t)a3 formId:(int64_t)a4 device:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = +[FBKLog ded];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    int64_t v25 = a4;
    _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_INFO, "will get device token for filer form [%li]", buf, 0xCu);
  }

  id v13 = [a1 _seedPortal];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke;
  v18[3] = &unk_264875658;
  int64_t v22 = a3;
  id v23 = a1;
  int64_t v21 = a4;
  id v19 = v10;
  id v20 = v11;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_96;
  void v16[3] = &unk_2648743D8;
  id v17 = v20;
  id v14 = v20;
  id v15 = v10;
  [v13 getRemoteDeviceTokenWithSuccess:v18 error:v16];
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = objc_opt_new();
    [v4 setFinishingMove:1];
    [v4 setSeedingDeviceToken:v3];
    objc_msgSend(v4, "setSeedingEnvironment:", +[FBKSSharedConstants environment](FBKSharedConstants, "environment") + 1);
    [v4 setSeedingSubmissionID:*(void *)(a1 + 48)];
    [v4 setSeedingSubmissionType:*(void *)(a1 + 56)];
    id v5 = [*(id *)(a1 + 64) _seedingHost];
    [v4 setSeedingHost:v5];

    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    objc_msgSend(v4, "setAllowsCellularUpload:", objc_msgSend(v6, "BOOLForKey:", @"allowCellUploads"));

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:4];
    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = *MEMORY[0x263F3A0B8];
    id v10 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F3A0B8]];
    LODWORD(v8) = [v8 hasCapabilities:v10];

    if (v8) {
      [v7 addObject:v9];
    }
    if (+[FBKSharedConstants isEnhancedLoggingEnabled])
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = *MEMORY[0x263F3A0B0];
      id v13 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F3A0B0]];
      LODWORD(v11) = [v11 hasCapabilities:v13];

      if (v11)
      {
        [v7 addObject:v12];
        [v4 setNotifyingMove:1];
        id v14 = objc_alloc(MEMORY[0x263F3A158]);
        id v15 = [MEMORY[0x263F086E0] FeedbackCore];
        id v16 = [v15 localizedStringForKey:@"ENHANCED_LOGGING_COMPLETE_NOTIF_TITLE" value:@"Enhanced Logging Complete" table:0];
        id v17 = [MEMORY[0x263F086E0] FeedbackCore];
        uint64_t v18 = [v17 localizedStringForKey:@"ENHANCED_LOGGING_COMPLETE_NOTIF_BODY" value:@"Review the collected logs before sending them to Apple." table:0];
        id v19 = (void *)[v14 initWithHostAppIdentifier:@"com.apple.appleseed.FeedbackAssistant" localizedNotificationTitle:v16 localizedNotificationBody:v18];

        [v19 setUserNotificationShouldPlaySound:1];
        [v4 setNotifierConfiguration:v19];
      }
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *MEMORY[0x263F3A0A8];
      int64_t v22 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F3A0A8]];
      LODWORD(v20) = [v20 hasCapabilities:v22];

      if (v20) {
        [v7 addObject:v21];
      }
    }
    [v4 requestCapabilitiesSet:v7];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v23 = +[FBKLog ded];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_cold_1();
    }
  }
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_96(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_96_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)didFailToPinPairOnDemandWithDevice:(id)a3 error:(int64_t)a4 identifier:(id)a5 observer:(id)a6 completion:(id)a7
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x263F08A00];
  id v14 = a7;
  id v15 = a6;
  id v16 = [v13 defaultCenter];
  [v16 removeObserver:v15];

  id v17 = (void *)onDemandObserver;
  onDemandObserver = 0;

  uint64_t v18 = +[FBKLog ded];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_DEFAULT, "On demand pairing failed for device [%{public}@] for session [%{public}@]", (uint8_t *)&v20, 0x16u);
  }

  id v19 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.fbk.ded" code:a4 userInfo:0];
  (*((void (**)(id, void *, void, void, void, void))v14 + 2))(v14, v19, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0);
}

+ (void)_startSessionByFirstPairingWithConfig:(id)a3 device:(id)a4 grouped:(id)a5 identifier:(id)a6 shouldGetDetails:(BOOL)a7 shouldGetSessionStatus:(BOOL)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  id v19 = (void *)MEMORY[0x263F08A00];
  id v20 = a5;
  id v21 = [v19 defaultCenter];
  [v21 postNotificationName:@"FBKDEDHelperNeedsDevicePairing" object:v20];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke;
  aBlock[3] = &unk_264875680;
  id v45 = a1;
  id v22 = v16;
  id v41 = v22;
  id v23 = v17;
  id v42 = v23;
  id v24 = v18;
  id v43 = v15;
  id v44 = v24;
  BOOL v46 = a7;
  BOOL v47 = a8;
  id v25 = v15;
  uint64_t v26 = _Block_copy(aBlock);
  id v27 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_99;
  block[3] = &unk_2648741D0;
  id v39 = v26;
  id v28 = v26;
  dispatch_sync(v27, block);

  dispatch_time_t v29 = dispatch_time(0, 60000000000);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_2;
  v33[3] = &unk_2648756A8;
  id v34 = v22;
  id v35 = v23;
  id v36 = v24;
  id v37 = a1;
  id v30 = v24;
  id v31 = v23;
  id v32 = v22;
  dispatch_after(v29, MEMORY[0x263EF83A0], v33);
}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [a2 object];
  if (v3)
  {
    int v4 = +[FBKLog ded];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v3;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "did get paired device [%{public}@]", (uint8_t *)&v16, 0xCu);
    }

    id v5 = [v3 dedSharingDevice];
    id v6 = +[FBKLog ded];
    uint64_t v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "device is ready!", (uint8_t *)&v16, 2u);
      }

      [*(id *)(a1 + 64) _getSessionWithIdentifier:*(void *)(a1 + 40) configuration:*(void *)(a1 + 48) dedDevice:v5 getDetails:*(unsigned __int8 *)(a1 + 72) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 73) completion:*(void *)(a1 + 56)];
      int v8 = [MEMORY[0x263F08A00] defaultCenter];
      [v8 removeObserver:onDemandObserver];

      uint64_t v9 = (void *)onDemandObserver;
      onDemandObserver = 0;
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(a1, v7, v10, v11, v12, v13, v14, v15);
      }

      [*(id *)(a1 + 64) didFailToPinPairOnDemandWithDevice:*(void *)(a1 + 32) error:107 identifier:*(void *)(a1 + 40) observer:onDemandObserver completion:*(void *)(a1 + 56)];
    }
  }
  else
  {
    [*(id *)(a1 + 64) didFailToPinPairOnDemandWithDevice:*(void *)(a1 + 32) error:108 identifier:*(void *)(a1 + 40) observer:onDemandObserver completion:*(void *)(a1 + 56)];
  }
}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_99(uint64_t a1)
{
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  id v2 = [MEMORY[0x263F08A48] mainQueue];
  uint64_t v3 = [v5 addObserverForName:@"FBKDEDHelperHereIsYourPairedDevice" object:0 queue:v2 usingBlock:*(void *)(a1 + 32)];
  int v4 = (void *)onDemandObserver;
  onDemandObserver = v3;
}

uint64_t __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_2(uint64_t result)
{
  if (onDemandObserver) {
    return [*(id *)(result + 56) didFailToPinPairOnDemandWithDevice:*(void *)(result + 32) error:109 identifier:*(void *)(result + 40) observer:onDemandObserver completion:*(void *)(result + 48)];
  }
  return result;
}

+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 device:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  objc_initWeak(location, a1);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke;
  aBlock[3] = &unk_2648756D0;
  objc_copyWeak(v40, location);
  id v18 = v14;
  id v36 = v18;
  id v19 = v15;
  id v37 = v19;
  BOOL v41 = v10;
  BOOL v42 = v9;
  id v20 = v17;
  id v39 = v20;
  v40[1] = a1;
  id v21 = v16;
  id v38 = v21;
  id v22 = _Block_copy(aBlock);
  if ([v21 isCurrentDevice])
  {
    id v23 = +[FBKLog ded];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22A36D000, v23, OS_LOG_TYPE_DEFAULT, "starting bug session on current device", buf, 2u);
    }

    id v24 = [v21 anyDEDDevice];
    [a1 _getSessionWithIdentifier:v18 configuration:v19 dedDevice:v24 getDetails:v10 shouldGetSessionStatus:v9 completion:v20];
  }
  else
  {
    id v25 = +[FBKLog ded];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22A36D000, v25, OS_LOG_TYPE_DEFAULT, "starting bug session on remote device", buf, 2u);
    }

    uint64_t v26 = [v21 dedIDSDevice];
    id v24 = v26;
    if (v26 && [v26 status] == 1)
    {
      id v27 = +[FBKLog ded];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22A36D000, v27, OS_LOG_TYPE_DEFAULT, "will use IDS", buf, 2u);
      }

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_102;
      v29[3] = &unk_2648756F8;
      id v32 = v20;
      id v30 = v19;
      id v33 = v22;
      id v31 = v21;
      [a1 _getSessionWithIdentifier:v18 configuration:v30 dedDevice:v24 getDetails:v10 shouldGetSessionStatus:v9 completion:v29];

      id v28 = v32;
    }
    else
    {
      id v28 = [v21 dedSharingDevice];
      (*((void (**)(void *, void *))v22 + 2))(v22, v28);
    }
  }
  objc_destroyWeak(v40);
  objc_destroyWeak(location);
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v23 = v3;
    _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "no IDS device found for grouped device. Will try Sharing [%{public}@]", buf, 0xCu);
  }

  if (!v3)
  {
    int v8 = +[FBKLog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(a1, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 110;
    goto LABEL_18;
  }
  uint64_t v5 = [v3 status];
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      id v6 = +[FBKLog ded];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "will use Sharing", buf, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      [WeakRetained _getSessionWithIdentifier:*(void *)(a1 + 32) configuration:*(void *)(a1 + 40) dedDevice:v3 getDetails:*(unsigned __int8 *)(a1 + 80) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 81) completion:*(void *)(a1 + 56)];

      goto LABEL_19;
    }
    id v19 = +[FBKLog ded];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "Sharing device is not ready", buf, 2u);
    }

    uint64_t v15 = *(void *)(a1 + 56);
    id v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = 106;
LABEL_18:
    id v20 = [v16 errorWithDomain:@"com.apple.fbk.ded" code:v17 userInfo:0];
    id v21 = [*(id *)(a1 + 40) requestedCapabilities];
    (*(void (**)(uint64_t, void *, void, void, void, void *))(v15 + 16))(v15, v20, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v21);

    goto LABEL_19;
  }
  id v18 = +[FBKLog ded];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v23 = v3;
    _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_DEFAULT, "Sharing device needs pairing [%{public}@]", buf, 0xCu);
  }

  [*(id *)(a1 + 72) _startSessionByFirstPairingWithConfig:*(void *)(a1 + 40) device:v3 grouped:*(void *)(a1 + 48) identifier:*(void *)(a1 + 32) shouldGetDetails:*(unsigned __int8 *)(a1 + 80) shouldGetSessionStatus:*(unsigned __int8 *)(a1 + 81) completion:*(void *)(a1 + 56)];
LABEL_19:
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_102(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2)
  {
    uint64_t v12 = +[FBKLog ded];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_102_cold_1();
    }

    uint64_t v13 = *(void *)(a1 + 56);
    uint64_t v14 = [*(id *)(a1 + 40) dedSharingDevice];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v14 = [*(id *)(a1 + 32) requestedCapabilities];
    (*(void (**)(uint64_t, void, id, id, id, void *))(v15 + 16))(v15, 0, v9, v10, v11, v14);
  }
}

+ (void)_getSessionWithIdentifier:(id)a3 configuration:(id)a4 dedDevice:(id)a5 getDetails:(BOOL)a6 shouldGetSessionStatus:(BOOL)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  char v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  BOOL v58 = !a6;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  BOOL v56 = !a6;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  char v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  uint64_t v17 = +[FBKTimeIntervals sharedInstance];
  [v17 willStartEvent:3 context:v13];
  [v17 willStartEvent:6 context:v13];
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__1;
  v49[4] = __Block_byref_object_dispose__1;
  id v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__1;
  v47[4] = __Block_byref_object_dispose__1;
  id v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = __Block_byref_object_copy__1;
  v45[4] = __Block_byref_object_dispose__1;
  id v46 = 0;
  double v18 = FBKBugSessionTimeoutForDevice(v15);
  double v19 = FBKBugSessionTimeoutForDevice(v15);
  id v20 = +[FBKLog ded];
  double v21 = v19 + 10.0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[FBKDEDHelper _getSessionWithIdentifier:configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:](v20, v18, v21);
  }

  [v14 setBugSessionStartTimeout:v18];
  id v22 = _os_activity_create(&dword_22A36D000, "BugSession Start", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke;
  block[3] = &unk_2648757C0;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v17;
  id v35 = v51;
  id v36 = v59;
  id v33 = v16;
  id v34 = v49;
  id v37 = v53;
  id v38 = v47;
  BOOL v43 = a6;
  id v39 = v45;
  long long v40 = v57;
  BOOL v44 = a7;
  BOOL v41 = v55;
  double v42 = v21;
  id v23 = v16;
  id v24 = v17;
  id v25 = v15;
  id v26 = v14;
  id v27 = v13;
  os_activity_apply(v22, block);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F3A150] sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2;
  v21[3] = &unk_264875770;
  uint64_t v27 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  id v22 = *(id *)(a1 + 56);
  id v23 = *(id *)(a1 + 32);
  long long v28 = *(_OWORD *)(a1 + 80);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 96);
  id v24 = v6;
  uint64_t v29 = v7;
  id v26 = *(id *)(a1 + 64);
  id v25 = *(id *)(a1 + 48);
  long long v30 = *(_OWORD *)(a1 + 104);
  __int16 v32 = *(_WORD *)(a1 + 144);
  long long v31 = *(_OWORD *)(a1 + 120);
  [v2 startBugSessionWithIdentifier:v3 configuration:v4 target:v5 completion:v21];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 136) * 1000000000.0));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_113;
  v11[3] = &unk_264875798;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 88), *(int8x16_t *)(a1 + 88), 8uLL);
  __int16 v20 = *(_WORD *)(a1 + 144);
  long long v16 = *(_OWORD *)(a1 + 120);
  uint64_t v17 = *(void *)(a1 + 80);
  id v14 = *(id *)(a1 + 64);
  id v12 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 72);
  id v13 = v9;
  uint64_t v18 = v10;
  long long v19 = *(_OWORD *)(a1 + 104);
  dispatch_after(v8, MEMORY[0x263EF83A0], v11);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) didEndEvent:3 context:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    uint64_t v10 = +[FBKLog ded];
    id v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2_cold_1(a1);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      id v12 = (id)[*(id *)(a1 + 32) didEndEvent:6 context:*(void *)(a1 + 40)];
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = [*(id *)(a1 + 48) requestedCapabilities];
      (*(void (**)(uint64_t, id, void, void, void, void *))(v13 + 16))(v13, v6, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v14);

      int8x16_t v15 = (void *)MEMORY[0x263F3A148];
      long long v16 = [*(id *)(a1 + 56) productType];
      uint64_t v17 = [*(id *)(a1 + 56) isRemote];
      uint64_t v18 = [v6 code];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) startTimeInterval];
      double v20 = v19;
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) endTimeInterval];
      double v22 = v21;
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) endTimeInterval];
      double v24 = v23;
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endTimeInterval];
      double v26 = v25;
      uint64_t v27 = v15;
      long long v28 = v16;
      uint64_t v29 = v17;
      uint64_t v30 = 0;
      uint64_t v31 = v18;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v32 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        v68 = v32;
        _os_log_impl(&dword_22A36D000, v11, OS_LOG_TYPE_INFO, "did start bug session with identifier [%{public}@]", buf, 0xCu);
      }

      id v33 = *(void **)(a1 + 32);
      uint64_t v34 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 136))
      {
        [v33 willStartEvent:4 context:v34];
        id v35 = +[FBKLog ded];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v5 identifier];
          *(_DWORD *)long long buf = 138543362;
          v68 = v36;
          _os_log_impl(&dword_22A36D000, v35, OS_LOG_TYPE_DEFAULT, "will get details on bug session %{public}@", buf, 0xCu);
        }
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_105;
        void v53[3] = &unk_264875748;
        uint64_t v60 = *(void *)(a1 + 104);
        id v54 = *(id *)(a1 + 32);
        id v37 = *(id *)(a1 + 40);
        uint64_t v38 = *(void *)(a1 + 120);
        id v55 = v37;
        uint64_t v39 = *(void *)(a1 + 80);
        uint64_t v61 = v38;
        uint64_t v62 = v39;
        char v66 = *(unsigned char *)(a1 + 137);
        id v59 = *(id *)(a1 + 64);
        id v56 = v5;
        id v57 = *(id *)(a1 + 48);
        id v40 = *(id *)(a1 + 56);
        uint64_t v41 = *(void *)(a1 + 72);
        id v58 = v40;
        uint64_t v42 = *(void *)(a1 + 112);
        uint64_t v43 = *(void *)(a1 + 128);
        uint64_t v63 = v41;
        uint64_t v64 = v42;
        uint64_t v65 = v43;
        [v56 listDiagnosticExtensionsWithCompletion:v53];

        long long v16 = v54;
        goto LABEL_13;
      }
      id v44 = (id)[v33 didEndEvent:6 context:v34];
      uint64_t v45 = *(void *)(a1 + 64);
      id v46 = [*(id *)(a1 + 48) requestedCapabilities];
      (*(void (**)(uint64_t, void, id, void, void, void *))(v45 + 16))(v45, 0, v5, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v46);

      BOOL v47 = (void *)MEMORY[0x263F3A148];
      long long v16 = [*(id *)(a1 + 56) productType];
      uint64_t v48 = [*(id *)(a1 + 56) isRemote];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) startTimeInterval];
      double v20 = v49;
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) endTimeInterval];
      double v22 = v50;
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) endTimeInterval];
      double v24 = v51;
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endTimeInterval];
      double v26 = v52;
      uint64_t v27 = v47;
      long long v28 = v16;
      uint64_t v29 = v48;
      uint64_t v30 = 1;
      uint64_t v31 = 0;
    }
    [v27 logFBKBugSessionStartWithDeviceType:v28 isRemote:v29 success:v30 errorCode:v31 startedAt:v20 getSessionEndedAt:v22 showExtensionsEndedAt:v24 getStatusEndedAt:v26];
LABEL_13:
  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) didEndEvent:4 context:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 80) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    uint64_t v7 = +[FBKLog ded];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v44 = [v3 count];
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_INFO, "found %lu DEs", buf, 0xCu);
    }

    uint64_t v8 = +[FBKLog ded];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_105_cold_1(v3, v8);
    }

    if (*(unsigned char *)(a1 + 128))
    {
      [*(id *)(a1 + 32) willStartEvent:5 context:*(void *)(a1 + 40)];
      id v9 = *(void **)(a1 + 48);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109;
      v31[3] = &unk_264875720;
      uint64_t v38 = *(void *)(a1 + 112);
      id v32 = *(id *)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 120);
      id v33 = v10;
      uint64_t v12 = *(void *)(a1 + 96);
      uint64_t v39 = v11;
      uint64_t v40 = v12;
      id v37 = *(id *)(a1 + 72);
      id v34 = *(id *)(a1 + 48);
      id v35 = *(id *)(a1 + 56);
      id v13 = *(id *)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 104);
      id v36 = v13;
      uint64_t v15 = *(void *)(a1 + 80);
      uint64_t v41 = v14;
      uint64_t v42 = v15;
      [v9 getSessionStatusWithCompletion:v31];

      long long v16 = v32;
    }
    else
    {
      uint64_t v17 = +[FBKLog ded];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v44 = v18;
        _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "Not getting bug session status for session [%{public}@]", buf, 0xCu);
      }

      uint64_t v19 = *(void *)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 48);
      double v21 = [*(id *)(a1 + 56) requestedCapabilities];
      (*(void (**)(uint64_t, void, uint64_t, void, void, void *))(v19 + 16))(v19, 0, v20, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v21);

      double v22 = (void *)MEMORY[0x263F3A148];
      long long v16 = [*(id *)(a1 + 64) productType];
      uint64_t v23 = [*(id *)(a1 + 64) isRemote];
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) startTimeInterval];
      double v25 = v24;
      [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) endTimeInterval];
      double v27 = v26;
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endTimeInterval];
      double v29 = v28;
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endTimeInterval];
      [v22 logFBKBugSessionStartWithDeviceType:v16 isRemote:v23 success:1 errorCode:0 startedAt:v25 getSessionEndedAt:v27 showExtensionsEndedAt:v29 getStatusEndedAt:v30];
    }
  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) didEndEvent:5 context:*(void *)(a1 + 40)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 80) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
  {
    id v10 = +[FBKLog ded];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109_cold_2();
    }

    uint64_t v11 = +[FBKLog ded];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109_cold_1();
    }

    uint64_t v12 = +[FBKLog ded];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134218240;
      uint64_t v28 = [v6 count];
      __int16 v29 = 2048;
      uint64_t v30 = [v5 count];
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "bug session start: found %lu operations, %lu collected files", (uint8_t *)&v27, 0x16u);
    }

    id v13 = (id)[*(id *)(a1 + 32) didEndEvent:6 context:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 48);
    long long v16 = [*(id *)(a1 + 56) requestedCapabilities];
    (*(void (**)(uint64_t, void, uint64_t, id, id, void *))(v14 + 16))(v14, 0, v15, v5, v6, v16);

    uint64_t v17 = (void *)MEMORY[0x263F3A148];
    uint64_t v18 = [*(id *)(a1 + 64) productType];
    uint64_t v19 = [*(id *)(a1 + 64) isRemote];
    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) startTimeInterval];
    double v21 = v20;
    [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) endTimeInterval];
    double v23 = v22;
    [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endTimeInterval];
    double v25 = v24;
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) endTimeInterval];
    [v17 logFBKBugSessionStartWithDeviceType:v18 isRemote:v19 success:1 errorCode:0 startedAt:v21 getSessionEndedAt:v23 showExtensionsEndedAt:v25 getStatusEndedAt:v26];
  }
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_113(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    return;
  }
  char v2 = *(unsigned char *)(a1 + 120);
  if (v2)
  {
    char v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
    int v3 = *(unsigned __int8 *)(a1 + 121);
    if (*(unsigned char *)(a1 + 121)) {
      int v3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) == 0;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      goto LABEL_10;
    }
LABEL_8:
    if ((v2 & 1) == 0 && !v3) {
      return;
    }
    goto LABEL_10;
  }
  int v3 = 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_8;
  }
LABEL_10:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  uint64_t v4 = +[FBKLog ded];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_113_cold_1();
  }

  id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.fbk.ded" code:105 userInfo:0];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 32) requestedCapabilities];
  (*(void (**)(uint64_t, void *, void, void, void, void *))(v6 + 16))(v6, v5, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], v7);

  uint64_t v8 = (void *)MEMORY[0x263F3A148];
  id v9 = [*(id *)(a1 + 40) productType];
  uint64_t v10 = [*(id *)(a1 + 40) isRemote];
  uint64_t v11 = [v5 code];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) startTimeInterval];
  double v13 = v12;
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) endTimeInterval];
  double v15 = v14;
  [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) endTimeInterval];
  double v17 = v16;
  [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) endTimeInterval];
  [v8 logFBKBugSessionStartWithDeviceType:v9 isRemote:v10 success:0 errorCode:v11 startedAt:v13 getSessionEndedAt:v15 showExtensionsEndedAt:v17 getStatusEndedAt:v18];
}

+ (void)reconnectBugSessionWithIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[FBKDeviceManager sharedInstance];
  double v12 = [v11 availableDevices];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke;
  v25[3] = &unk_264873F20;
  id v13 = v9;
  id v26 = v13;
  double v14 = objc_msgSend(v12, "ded_findWithBlock:", v25);

  double v15 = +[FBKLog ded];
  double v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      double v17 = [v14 publicLogDescription];
      *(_DWORD *)long long buf = 138543618;
      id v28 = v8;
      __int16 v29 = 2114;
      uint64_t v30 = v17;
      _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_INFO, "will reconnect to session [%{public}@] on device [%{public}@]", buf, 0x16u);
    }
    double v18 = objc_opt_new();
    [v18 setFinishingMove:0];
    uint64_t v19 = *MEMORY[0x263F3A0B8];
    double v20 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F3A0B8]];
    int v21 = [v14 hasCapabilities:v20];

    if (v21) {
      objc_msgSend(v18, "requestCapabilities:", v19, 0);
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_115;
    v22[3] = &unk_2648757E8;
    id v23 = v8;
    id v24 = v10;
    [a1 _getSessionWithIdentifier:v23 configuration:v18 device:v14 getDetails:0 shouldGetSessionStatus:0 completion:v22];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v28 = v8;
      _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "Could not find device for session [%{public}@]. Will not reconnect", buf, 0xCu);
    }

    double v18 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.fbk.ded" code:101 userInfo:0];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v18, 0);
  }
}

uint64_t __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __78__FBKDEDHelper_reconnectBugSessionWithIdentifier_deviceIdentifier_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[FBKLog ded];
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "Could not reconnect to session [%{public}@]", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_INFO, "Reconnected [%{public}@]", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)fetchTextDataOnMatcherPredicates:(id)a3 fromSession:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = [v8 knownExtensions];
  int v11 = v10;
  if (v10)
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    char v30 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke;
    v27[3] = &unk_264875810;
    id v28 = v10;
    uint64_t v12 = objc_msgSend(v7, "ded_flatMapWithBlock:", v27);
    uint64_t v13 = [MEMORY[0x263EFF960] preferredLanguages];
    double v14 = [v13 firstObject];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_2;
    v22[3] = &unk_264875860;
    double v25 = v29;
    id v26 = v31;
    id v23 = v7;
    double v15 = v9;
    id v24 = v15;
    [v8 loadTextDataForExtensions:v12 localization:v14 completion:v22];
    dispatch_time_t v16 = dispatch_time(0, 15000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4;
    block[3] = &unk_264875888;
    double v20 = v31;
    int v21 = v29;
    uint64_t v19 = v15;
    dispatch_after(v16, MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
  }
  else
  {
    double v17 = +[FBKLog ded];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[FBKDEDHelper fetchTextDataOnMatcherPredicates:fromSession:completion:]();
    }

    v9[2](v9);
  }
}

id __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  int v3 = [a2 deBundleIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

void __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_3;
          v15[3] = &unk_264875838;
          v15[4] = v8;
          uint64_t v9 = objc_msgSend(v3, "ded_findWithBlock:", v15);
          uint64_t v10 = [v9 localizedDataCollectedSummary];
          int v11 = [v8 fileMatcher];
          [v11 setLocalizedDataCollectedSummary:v10];

          uint64_t v12 = [v9 localizedDataCollectedExplanation];
          uint64_t v13 = [v8 fileMatcher];
          [v13 setLocalizedDataCollectedExplanation:v12];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) deBundleIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 1;
    char v2 = +[FBKLog ded];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

+ (void)completeEnhancedLoggingWithFollowup:(id)a3 devicesController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  int v11 = [v8 deferredAttachmentCollections];
  uint64_t v12 = objc_msgSend(v11, "ded_flatMapWithBlock:", &__block_literal_global_122);

  if ((unint64_t)[v12 count] >= 2)
  {
    uint64_t v13 = +[FBKLog ded];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[FBKDEDHelper completeEnhancedLoggingWithFollowup:devicesController:completion:]();
    }
  }
  double v14 = [v12 anyObject];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_123;
  v18[3] = &unk_264875918;
  id v20 = v14;
  id v21 = v9;
  id v19 = v8;
  id v15 = v14;
  id v16 = v8;
  id v17 = v9;
  [a1 getSessionForForm:v10 device:v15 shouldGetSessionStatus:0 completion:v18];
}

uint64_t __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 device];
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_123(id *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2;
  v15[3] = &unk_2648758F0;
  id v16 = v9;
  id v21 = a1[6];
  id v17 = v11;
  id v18 = a1[4];
  id v19 = v10;
  id v20 = a1[5];
  id v12 = v10;
  id v13 = v11;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 72);
    if (v2)
    {
      id v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
    return;
  }
  if ([*(id *)(a1 + 40) containsObject:*MEMORY[0x263F3A0A8]])
  {
    id v36 = (id)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:4];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = [*(id *)(a1 + 48) deferredAttachmentCollections];
    uint64_t v4 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v45;
      uint64_t v31 = *(void *)v45;
      do
      {
        uint64_t v7 = 0;
        uint64_t v32 = v5;
        do
        {
          if (*(void *)v45 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = [*(id *)(*((void *)&v44 + 1) + 8 * v7) allMatchers];
          if ([v8 count])
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            id v9 = v8;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v56 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              id v34 = v8;
              uint64_t v35 = v7;
              uint64_t v12 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v11; ++i)
                {
                  if (*(void *)v39 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  id v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  id v15 = [*(id *)(a1 + 56) knownExtensions];
                  id v16 = [v14 fileMatcher];
                  id v17 = [v16 deBundleIdentifier];
                  id v18 = [v15 objectForKeyedSubscript:v17];

                  if (v18)
                  {
                    id v19 = +[FBKDECollector parametersForGatheringExtension:v18 answers:0 session:*(void *)(a1 + 56) givenParameters:0];
                    id v20 = (void *)MEMORY[0x263EFF910];
                    id v21 = [v14 filePredicate];
                    double v22 = objc_msgSend(v20, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v21, "enhancedLoggingDuration"));

                    id v23 = +[FBKLog ded];
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138543874;
                      double v49 = v14;
                      __int16 v50 = 2114;
                      double v51 = v19;
                      __int16 v52 = 2114;
                      v53 = v22;
                      _os_log_impl(&dword_22A36D000, v23, OS_LOG_TYPE_DEFAULT, "Will collect deferred diagnostics for [%{public}@] parameters [%{public}@] on [%{public}@]", buf, 0x20u);
                    }

                    [v36 addObject:v14];
                    id v24 = *(void **)(a1 + 56);
                    double v25 = [v18 identifier];
                    id v26 = (id)[v24 startDiagnosticExtensionWithIdentifier:v25 parameters:v19 deferRunUntil:v22 completion:&__block_literal_global_129];
                  }
                  else
                  {
                    id v19 = +[FBKLog ded];
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
                      __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_2(v54, v14, &v55, v19);
                    }
                  }
                }
                uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v56 count:16];
              }
              while (v11);
              uint64_t v6 = v31;
              uint64_t v5 = v32;
              id v8 = v34;
              uint64_t v7 = v35;
            }
          }
          else
          {
            id v9 = +[FBKLog ded];
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
              __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_1(&v42, v43, v9);
            }
          }

          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v5);
    }

    if ([v36 count])
    {
      [*(id *)(a1 + 56) scheduleNotification];
      uint64_t v27 = *(void *)(a1 + 72);
      if (v27)
      {
        id v28 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(a1 + 64)];
        (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v28, 0);
LABEL_40:
      }
    }
    else
    {
      uint64_t v30 = *(void *)(a1 + 72);
      if (v30)
      {
        id v28 = FBKErrorOfType(-1023);
        (*(void (**)(uint64_t, void, void *))(v30 + 16))(v30, 0, v28);
        goto LABEL_40;
      }
    }

    return;
  }
  uint64_t v29 = *(void *)(a1 + 72);
  if (v29)
  {
    FBKErrorOfType(-1022);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v29 + 16))(v29, 0);
  }
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = +[FBKLog ded];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_22A36D000, v3, OS_LOG_TYPE_DEFAULT, "Finished deferred attachment collection with [%{public}@]", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)_seedingHost
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__FBKDEDHelper__seedingHost__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_seedingHost_onceToken != -1) {
    dispatch_once(&_seedingHost_onceToken, block);
  }
  id v2 = (void *)_seedingHost__host;

  return v2;
}

void __28__FBKDEDHelper__seedingHost__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _seedPortal];
  uint64_t v1 = [v5 hostUrl];
  id v2 = [v1 absoluteString];
  uint64_t v3 = [v2 stringByReplacingOccurrencesOfString:@"sp" withString:&stru_26DDF6A30];
  int v4 = (void *)_seedingHost__host;
  _seedingHost__host = v3;
}

+ (id)_seedPortal
{
  id v2 = +[FBKData sharedInstance];
  uint64_t v3 = [v2 api];

  return v3;
}

void __52__FBKDEDHelper_cleanupBugSessionDirectoriesForForm___block_invoke_62_cold_1(uint64_t a1)
{
  uint64_t v7 = [*(id *)(a1 + 40) publicLogDescription];
  OUTLINED_FUNCTION_4_0(&dword_22A36D000, v1, v2, "could not create (to abort) session [%{public}@] on [%{public}@]", v3, v4, v5, v6, 2u);
}

+ (void)bugSessionIDForForm:device:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "could not get form response id for form response", v2, v3, v4, v5, v6);
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "failed to get adopt session", v2, v3, v4, v5, v6);
}

void __60__FBKDEDHelper_sendLocalFilesToDED_withForm_withCompletion___block_invoke_78_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "failed to adopt files", v2, v3, v4, v5, v6);
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "bug session device token is nil", v2, v3, v4, v5, v6);
}

void __80__FBKDEDHelper__getBugSessionConfigWithSubmissionType_formId_device_completion___block_invoke_96_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error getting device token for bug session: [%{public}@]", v4, 0xCu);
}

void __131__FBKDEDHelper__startSessionByFirstPairingWithConfig_device_grouped_identifier_shouldGetDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__FBKDEDHelper__getSessionWithIdentifier_configuration_device_getDetails_shouldGetSessionStatus_completion___block_invoke_102_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "failed to start session with IDS, will try Sharing", v2, v3, v4, v5, v6);
}

+ (void)_getSessionWithIdentifier:(double)a3 configuration:dedDevice:getDetails:shouldGetSessionStatus:completion:.cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "BugSession start timeout [%.2lf], FBK session start timeout [%.2lf]", (uint8_t *)&v3, 0x16u);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_2_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 48) seedingSubmissionID];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_22A36D000, v1, v2, "Error starting bug session for form [%li] error: %{public}@", v3, v4, v5, v6, v7);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_105_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 valueForKeyPath:@"identifier"];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "DEs: %@", v4, 0xCu);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "BugSession status: collected %@", v1, 0xCu);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_109_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, v0, OS_LOG_TYPE_DEBUG, "BugSession status: ongoing %@", v1, 0xCu);
}

void __111__FBKDEDHelper__getSessionWithIdentifier_configuration_dedDevice_getDetails_shouldGetSessionStatus_completion___block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "start bug session sequence timed out", v2, v3, v4, v5, v6);
}

+ (void)fetchTextDataOnMatcherPredicates:fromSession:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22A36D000, v0, v1, "[%{public}@] cannot fetch text data. Extensions are nil", v2, v3, v4, v5, v6);
}

void __72__FBKDEDHelper_fetchTextDataOnMatcherPredicates_fromSession_completion___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "loadTextDataForExtensions timed out", v2, v3, v4, v5, v6);
}

+ (void)completeEnhancedLoggingWithFollowup:devicesController:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22A36D000, v0, v1, "More than one target device found for EL. This is not supported yet", v2, v3, v4, v5, v6);
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "No Matcher Predicate found in Deferred Attachment Collection", buf, 2u);
}

void __81__FBKDEDHelper_completeEnhancedLoggingWithFollowup_devicesController_completion___block_invoke_2_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint8_t v7 = [a2 fileMatcher];
  id v8 = [v7 deBundleIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v8;
  _os_log_error_impl(&dword_22A36D000, a4, OS_LOG_TYPE_ERROR, "No DEDExtension found for DE bundle identifier [%{public}@]", a1, 0xCu);
}

@end