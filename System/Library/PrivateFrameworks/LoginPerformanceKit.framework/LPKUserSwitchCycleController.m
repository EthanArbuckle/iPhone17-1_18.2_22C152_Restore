@interface LPKUserSwitchCycleController
- (BOOL)_isLoginSession;
- (BOOL)_validateUserSwitchExpectation;
- (BOOL)startUserSwitchWithType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8;
- (BOOL)triggerTestUserSwitchIfNeeded;
- (LPKUserSwitchCycleController)initWithDelegate:(id)a3;
- (LPKUserSwitchCycleResponder)delegate;
- (unint64_t)_currentEnvironment;
- (void)_clearOutLocalPerfTestDefaults;
- (void)_fixTestStatesForRetry;
- (void)_isLoginSession;
- (void)_loginAccount:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 delay:(double)a6;
- (void)_scheduleRetryWithTimeout:(double)a3;
- (void)_setUserSwitchDestinationExpectation:(unint64_t)a3 retryIfFailed:(BOOL)a4 completionHandler:(id)a5;
- (void)_triggerFastLogoutWithDelay:(double)a3;
- (void)_triggerFullLogoutWithDelay:(double)a3;
- (void)_updateLocalPerfTestCycleCount:(int64_t)a3;
- (void)_validateUserSwitchExpectation;
- (void)setDelegate:(id)a3;
- (void)triggerTestUserSwitchIfNeeded;
@end

@implementation LPKUserSwitchCycleController

- (LPKUserSwitchCycleController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPKUserSwitchCycleController;
  v5 = [(LPKUserSwitchCycleController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (BOOL)startUserSwitchWithType:(unint64_t)a3 count:(int64_t)a4 username:(id)a5 password:(id)a6 loginDelay:(int64_t)a7 logoutDelay:(int64_t)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v14 = (__CFString *)a5;
  v15 = (__CFString *)a6;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  if ([MEMORY[0x263F52778] isInternalBuild])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = a3;
      __int16 v40 = 2048;
      int64_t v41 = a4;
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Starting user switch cycle with type: %lu for %ld times", buf, 0x16u);
    }
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    v17 = [MEMORY[0x263F52780] sharedStorage];
    v37[0] = MEMORY[0x263EFFA88];
    v36[0] = @"LPKIsLocalUserSwitchTestOngoing";
    v36[1] = @"LPKLocalUserSwitchTestType";
    v18 = [NSNumber numberWithUnsignedInteger:a3];
    v37[1] = v18;
    v36[2] = @"LPKLocalUserSwitchTestRemainCycleCount";
    uint64_t v19 = [NSNumber numberWithInteger:a4];
    v20 = (void *)v19;
    v21 = @"Local User";
    if (v14) {
      v21 = v14;
    }
    v37[2] = v19;
    v37[3] = v21;
    v36[3] = @"LPKLocalUserSwitchTestUsername";
    v36[4] = @"LPKLocalUserSwitchTestPassword";
    v22 = &stru_26E941B78;
    if (v15) {
      v22 = v15;
    }
    v37[4] = v22;
    v36[5] = @"LPKLocalUserSwitchTestLoginDelay";
    v23 = [NSNumber numberWithInteger:a7];
    v37[5] = v23;
    v36[6] = @"LPKLocalUserSwitchTestLogoutDelay";
    v24 = [NSNumber numberWithInteger:a8];
    v37[6] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:7];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __103__LPKUserSwitchCycleController_startUserSwitchWithType_count_username_password_loginDelay_logoutDelay___block_invoke;
    v29[3] = &unk_264C7E708;
    v31 = &v32;
    v29[4] = self;
    v26 = v16;
    v30 = v26;
    [v17 saveKeyValuePairs:v25 completionHandler:v29];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    int v27 = *((unsigned __int8 *)v33 + 24);
  }
  else
  {
    int v27 = *((unsigned __int8 *)v33 + 24);
  }
  _Block_object_dispose(&v32, 8);

  return v27 != 0;
}

intptr_t __103__LPKUserSwitchCycleController_startUserSwitchWithType_count_username_password_loginDelay_logoutDelay___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) triggerTestUserSwitchIfNeeded];
  }
  v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

- (BOOL)triggerTestUserSwitchIfNeeded
{
  v50[1] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F52778] isInternalBuild])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    v3 = [MEMORY[0x263F52780] sharedStorage];
    id v4 = [v3 retrieveValueForKey:@"LPKIsLocalUserSwitchTestOngoing"];
    int v5 = [v4 BOOLValue];

    if (!v5) {
      goto LABEL_31;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Local user switch test is ongoing", buf, 0xCu);
    }
    v6 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestRemainCycleCount"];
    uint64_t v7 = [v6 integerValue];

    if (![(LPKUserSwitchCycleController *)self _validateUserSwitchExpectation])
    {
      objc_super v8 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestIsPerformanceTest"];
      int v9 = [v8 BOOLValue];

      v10 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestRetryCount"];
      int v11 = [v10 unsignedIntValue];

      if (!v9 || !v11)
      {
        [(LPKUserSwitchCycleController *)self _clearOutLocalPerfTestDefaults];
        goto LABEL_31;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "We are doing performance test, try to recover", buf, 2u);
      }
      [(LPKUserSwitchCycleController *)self _fixTestStatesForRetry];
    }
    if (v7)
    {
      v12 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestType"];
      uint64_t v13 = [v12 unsignedIntegerValue];

      v14 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestUsername"];
      v15 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestPassword"];
      dispatch_semaphore_t v16 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestLoginDelay"];
      uint64_t v17 = [v16 integerValue];

      double v18 = 5.0;
      if ((double)v17 >= 5.0) {
        double v19 = (double)v17;
      }
      else {
        double v19 = 5.0;
      }
      v20 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestLogoutDelay"];
      uint64_t v21 = [v20 integerValue];

      if ((double)v21 >= 5.0) {
        double v18 = (double)v21;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
        __int16 v47 = 2048;
        uint64_t v48 = v13;
        _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Will perform switch type: %ld", buf, 0x16u);
      }
      v22 = objc_opt_new();
      if ([(__CFString *)v14 length])
      {
        v23 = v22;
        v24 = v14;
      }
      else
      {
        v24 = @"Local User";
        v23 = v22;
      }
      [v23 setUsername:v24];
      if (-[__CFString length](v14, "length") && [v15 length])
      {
        uint64_t v31 = 0;
      }
      else
      {

        v15 = 0;
        uint64_t v31 = 1;
      }
      uint64_t v32 = (uint64_t)v18;
      switch(v13)
      {
        case 0:
          if (![(LPKUserSwitchCycleController *)self _isLoginSession]) {
            goto LABEL_58;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
            _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Will trigger first time login", buf, 0xCu);
          }
          [(LPKUserSwitchCycleController *)self _updateLocalPerfTestCycleCount:v7 - 1];
          v33 = [MEMORY[0x263F841B0] sharedManager];
          int v34 = [v33 userExists:v22];

          if (!v34) {
            goto LABEL_54;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
            _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: User exist, we need to delete the user first", buf, 0xCu);
          }
          char v35 = [MEMORY[0x263F841B0] sharedManager];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke_46;
          v39[3] = &unk_264C7E758;
          v39[4] = self;
          __int16 v40 = v14;
          char v43 = v31;
          id v41 = v15;
          uint64_t v42 = (uint64_t)v19;
          [v35 deleteUser:v22 completionHandler:v39];

          break;
        case 1:
          if (![(LPKUserSwitchCycleController *)self _isLoginSession]) {
            goto LABEL_58;
          }
          v36 = [MEMORY[0x263F841B0] sharedManager];
          int v37 = [v36 userExists:v22];

          if (v37) {
            [(LPKUserSwitchCycleController *)self _updateLocalPerfTestCycleCount:v7 - 1];
          }
          goto LABEL_54;
        case 2:
          if ([(LPKUserSwitchCycleController *)self _isLoginSession]) {
            goto LABEL_54;
          }
          [(LPKUserSwitchCycleController *)self _updateLocalPerfTestCycleCount:v7 - 1];
          [(LPKUserSwitchCycleController *)self _triggerFastLogoutWithDelay:(double)v32];
          break;
        case 3:
          if ([(LPKUserSwitchCycleController *)self _isLoginSession])
          {
LABEL_54:
            [(LPKUserSwitchCycleController *)self _loginAccount:v14 password:v15 localLoginOnly:v31 delay:(double)(uint64_t)v19];
          }
          else
          {
            [(LPKUserSwitchCycleController *)self _updateLocalPerfTestCycleCount:v7 - 1];
LABEL_58:
            [(LPKUserSwitchCycleController *)self _triggerFullLogoutWithDelay:(double)v32];
          }
          break;
        default:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]();
          }
          break;
      }

LABEL_60:
      BOOL v25 = 1;
      goto LABEL_61;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: No more user switch to do", buf, 0xCu);
    }
    v26 = [MEMORY[0x263F841B0] sharedManager];
    int v27 = [v26 currentUser];
    int v28 = [v27 isLoginUser];

    BOOL v29 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if (!v28)
    {
      if (v29)
      {
        *(_DWORD *)buf = 136315138;
        v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
        _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Not login user, trigger full logout", buf, 0xCu);
      }
      [(LPKUserSwitchCycleController *)self _triggerFullLogoutWithDelay:5.0];
      goto LABEL_60;
    }
    if (v29)
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[LPKUserSwitchCycleController triggerTestUserSwitchIfNeeded]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Is login user, dump result", buf, 0xCu);
    }
    [(LPKUserSwitchCycleController *)self _clearOutLocalPerfTestDefaults];
    v49 = @"LPKLocalUserSwitchTestHasFinishedSuccessfully";
    v50[0] = MEMORY[0x263EFFA88];
    v30 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke;
    v44[3] = &unk_264C7E730;
    v44[4] = self;
    [v3 saveKeyValuePairs:v30 completionHandler:v44];

LABEL_31:
    BOOL v25 = 0;
LABEL_61:

    return v25;
  }
  return 0;
}

void __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 performanceTestDidFinishSuccessfully];
}

uint64_t __61__LPKUserSwitchCycleController_triggerTestUserSwitchIfNeeded__block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loginAccount:*(void *)(a1 + 40) password:*(void *)(a1 + 48) localLoginOnly:*(unsigned __int8 *)(a1 + 64) delay:(double)*(uint64_t *)(a1 + 56)];
}

- (void)_clearOutLocalPerfTestDefaults
{
  v6[10] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F52780] sharedStorage];
  v6[0] = @"LPKIsLocalUserSwitchTestOngoing";
  v6[1] = @"LPKLocalUserSwitchTestType";
  v6[2] = @"LPKLocalUserSwitchTestRemainCycleCount";
  v6[3] = @"LPKLocalUserSwitchTestUsername";
  v6[4] = @"LPKLocalUserSwitchTestPassword";
  v6[5] = @"LPKUserSwitchDestination";
  v6[6] = @"LPKLocalUserSwitchTestHasFinishedSuccessfully";
  v6[7] = @"LPKLocalUserSwitchTestIsPerformanceTest";
  v6[8] = @"TestHasBeenPrewarmed";
  v6[9] = @"LPKLocalUserSwitchTestRetryCount";
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:10];
  [v3 clearKeys:v4 completionHandler:0];

  int v5 = [(LPKUserSwitchCycleController *)self delegate];
  [v5 performanceTestWillTerminate];
}

- (void)_updateLocalPerfTestCycleCount:(int64_t)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = [MEMORY[0x263F52780] sharedStorage];
  v7[0] = @"LPKLocalUserSwitchTestRemainCycleCount";
  int v5 = [NSNumber numberWithInteger:a3];
  v7[1] = @"TestHasBeenPrewarmed";
  v8[0] = v5;
  v8[1] = MEMORY[0x263EFFA88];
  v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v4 saveKeyValuePairs:v6 completionHandler:0];
}

- (void)_loginAccount:(id)a3 password:(id)a4 localLoginOnly:(BOOL)a5 delay:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke;
  v14[3] = &unk_264C7E7D0;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a6;
  id v12 = v10;
  id v15 = v12;
  id v13 = v11;
  id v16 = v13;
  BOOL v18 = a5;
  [(LPKUserSwitchCycleController *)self _setUserSwitchDestinationExpectation:2 retryIfFailed:1 completionHandler:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      void v7[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_2;
      v7[3] = &unk_264C7E7A8;
      v7[4] = v5;
      id v8 = *(id *)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      char v10 = *(unsigned char *)(a1 + 64);
      dispatch_after(v6, MEMORY[0x263EF83A0], v7);
    }
    else
    {
      [WeakRetained _clearOutLocalPerfTestDefaults];
    }
  }
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F52780] sharedStorage];
  v3 = [v2 retrieveValueForKey:@"LPKIsLocalUserSwitchTestOngoing"];
  char v4 = [v3 BOOLValue];

  int v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _scheduleRetryWithTimeout:65.0];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[LPKUserSwitchCycleController _loginAccount:password:localLoginOnly:delay:]_block_invoke_2";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s: Calling into LoginUI to login account: %@", buf, 0x16u);
    }
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49;
    v11[3] = &unk_264C7E780;
    v11[4] = *(void *)(a1 + 32);
    [v7 forceLoggingInAppleID:v8 password:v9 localLoginOnly:v10 completionHandler:v11];
  }
  else
  {
    [v5 _clearOutLocalPerfTestDefaults];
  }
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49_cold_2();
    }
    char v4 = [v3 domain];
    if ([v4 isEqualToString:*MEMORY[0x263F07F70]])
    {
      if ([v3 code] == 4099)
      {

        goto LABEL_12;
      }
      uint64_t v5 = [v3 code];

      if (v5 == 4097) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49_cold_1();
    }
    [*(id *)(a1 + 32) _clearOutLocalPerfTestDefaults];
  }
LABEL_12:
}

- (void)_triggerFastLogoutWithDelay:(double)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (![(LPKUserSwitchCycleController *)self _isLoginSession])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[LPKUserSwitchCycleController _triggerFastLogoutWithDelay:]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke;
    v5[3] = &unk_264C7E820;
    objc_copyWeak(v6, (id *)buf);
    v6[1] = *(id *)&a3;
    [(LPKUserSwitchCycleController *)self _setUserSwitchDestinationExpectation:0 retryIfFailed:1 completionHandler:v5];
    objc_destroyWeak(v6);
    objc_destroyWeak((id *)buf);
  }
}

void __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke_2;
      block[3] = &unk_264C7E7F8;
      block[4] = v5;
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [WeakRetained _clearOutLocalPerfTestDefaults];
    }
  }
}

void __60__LPKUserSwitchCycleController__triggerFastLogoutWithDelay___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F52780] sharedStorage];
  id v3 = [v2 retrieveValueForKey:@"LPKIsLocalUserSwitchTestOngoing"];
  char v4 = [v3 BOOLValue];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _scheduleRetryWithTimeout:370.0];
    id v6 = [MEMORY[0x263F52770] sharedController];
    [v6 logoutWithLogoutType:1 completionHandler:0];
  }
  else
  {
    [v5 _clearOutLocalPerfTestDefaults];
  }
}

- (void)_triggerFullLogoutWithDelay:(double)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263F841B0] sharedManager];
  id v6 = [v5 currentUser];
  char v7 = [v6 isLoginUser];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[LPKUserSwitchCycleController _triggerFullLogoutWithDelay:]";
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke;
    void v8[3] = &unk_264C7E820;
    objc_copyWeak(v9, (id *)buf);
    v9[1] = *(id *)&a3;
    [(LPKUserSwitchCycleController *)self _setUserSwitchDestinationExpectation:0 retryIfFailed:1 completionHandler:v8];
    objc_destroyWeak(v9);
    objc_destroyWeak((id *)buf);
  }
}

void __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke_2;
      block[3] = &unk_264C7E7F8;
      block[4] = v5;
      dispatch_after(v6, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [WeakRetained _clearOutLocalPerfTestDefaults];
    }
  }
}

void __60__LPKUserSwitchCycleController__triggerFullLogoutWithDelay___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F52780] sharedStorage];
  id v3 = [v2 retrieveValueForKey:@"LPKIsLocalUserSwitchTestOngoing"];
  char v4 = [v3 BOOLValue];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _scheduleRetryWithTimeout:370.0];
    id v6 = [MEMORY[0x263F52770] sharedController];
    [v6 logoutWithLogoutType:0 completionHandler:0];
  }
  else
  {
    [v5 _clearOutLocalPerfTestDefaults];
  }
}

- (void)_setUserSwitchDestinationExpectation:(unint64_t)a3 retryIfFailed:(BOOL)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x263F52780] sharedStorage];
  uint64_t v17 = @"LPKUserSwitchDestination";
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  v18[0] = v10;
  id v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke;
  v13[3] = &unk_264C7E848;
  BOOL v16 = a4;
  id v14 = v8;
  unint64_t v15 = a3;
  v13[4] = self;
  id v12 = v8;
  [v9 saveKeyValuePairs:v11 completionHandler:v13];
}

void __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke_cold_1();
  }
  if (!*(unsigned char *)(a1 + 56))
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Retry setting user switch destination expectation", v6, 2u);
    }
    [*(id *)(a1 + 32) _setUserSwitchDestinationExpectation:*(void *)(a1 + 48) retryIfFailed:0 completionHandler:*(void *)(a1 + 40)];
  }
}

- (unint64_t)_currentEnvironment
{
  id v3 = [MEMORY[0x263F841B0] sharedManager];
  char v4 = [v3 currentUser];
  char v5 = [v4 isLoginUser];

  if (v5) {
    return 0;
  }
  if ([(LPKUserSwitchCycleController *)self _isLoginSession]) {
    return 1;
  }
  return 2;
}

- (BOOL)_validateUserSwitchExpectation
{
  id v3 = [MEMORY[0x263F52780] sharedStorage];
  char v4 = [v3 retrieveValueForKey:@"LPKUserSwitchDestination"];

  if (v4
    && (uint64_t v5 = [v4 integerValue],
        v5 != [(LPKUserSwitchCycleController *)self _currentEnvironment]))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[LPKUserSwitchCycleController _validateUserSwitchExpectation]();
    }
    char v7 = objc_opt_new();
    id v8 = @"Logout";
    if (v5 == 2) {
      id v8 = @"Login";
    }
    uint64_t v9 = [NSString stringWithFormat:@"%@ failed", v8];
    [v7 logErrorEventForTopic:@"Shared iPad User Switch Test" reason:v9 error:0 details:0];

    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)_isLoginSession
{
  char IsLoginSession = MKBUserSessionIsLoginSession();

  return IsLoginSession;
}

- (void)_fixTestStatesForRetry
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v18 = "-[LPKUserSwitchCycleController _fixTestStatesForRetry]";
    _os_log_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  id v3 = [MEMORY[0x263F52780] sharedStorage];
  char v4 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestRemainCycleCount"];
  uint64_t v5 = [v4 integerValue];

  BOOL v6 = [v3 retrieveValueForKey:@"LPKLocalUserSwitchTestRetryCount"];
  unsigned int v7 = [v6 unsignedIntValue];

  id v8 = [v3 retrieveValueForKey:@"TestHasBeenPrewarmed"];
  unsigned int v9 = [v8 BOOLValue];

  unint64_t v10 = [(LPKUserSwitchCycleController *)self _currentEnvironment];
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10, @"LPKUserSwitchDestination");
  v16[0] = v11;
  v15[1] = @"LPKLocalUserSwitchTestRemainCycleCount";
  id v12 = [NSNumber numberWithInteger:v5 + v9];
  v16[1] = v12;
  v15[2] = @"LPKLocalUserSwitchTestRetryCount";
  id v13 = [NSNumber numberWithUnsignedInteger:v7 - 1];
  v16[2] = v13;
  id v14 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v3 saveKeyValuePairs:v14 error:0];
}

- (void)_scheduleRetryWithTimeout:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke;
  block[3] = &unk_264C7E7F8;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) _fixTestStatesForRetry];
  return [*(id *)(a1 + 32) triggerTestUserSwitchIfNeeded];
}

- (LPKUserSwitchCycleResponder)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPKUserSwitchCycleResponder *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)triggerTestUserSwitchIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235E7E000, &_os_log_internal, v0, "Unrecognized user switch type: %lu", v1, v2, v3, v4, v5);
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235E7E000, &_os_log_internal, v0, "Stopping the user switch test due to error: %@", v1, v2, v3, v4, v5);
}

void __76__LPKUserSwitchCycleController__loginAccount_password_localLoginOnly_delay___block_invoke_49_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235E7E000, &_os_log_internal, v0, "Failed to trigger user switch with error :%@.", v1, v2, v3, v4, v5);
}

void __101__LPKUserSwitchCycleController__setUserSwitchDestinationExpectation_retryIfFailed_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235E7E000, &_os_log_internal, v0, "Failed to set user switch destination expectation, error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_validateUserSwitchExpectation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2048;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Current environment: %lu doesn't match with expected destination: %lu", v1, 0x16u);
}

- (void)_isLoginSession
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  __int16 v2 = "-[LPKUserSwitchCycleController _isLoginSession]";
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to retrive isLoginUI information due to error: %@", (uint8_t *)&v1, 0x16u);
}

void __58__LPKUserSwitchCycleController__scheduleRetryWithTimeout___block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_235E7E000, &_os_log_internal, OS_LOG_TYPE_ERROR, "User switch might have failed! Try again now...", v0, 2u);
}

@end