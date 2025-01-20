@interface LAAuthenticationBiometricMethod
- (BOOL)isAllowed;
- (BOOL)isDevicePresent;
- (BOOL)isEnrolled;
- (BOOL)start;
- (LAAuthenticationBiometricMethod)initWithConfiguration:(id)a3;
- (LAAuthenticationBiometricMethodState)currentState;
- (LAContext)context;
- (unint64_t)lockoutStateFromError:(id)a3;
- (void)distributeBiometricFeedback:(int64_t)a3;
- (void)distributeStateChange;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)runBiometricOperation;
- (void)setCurrentState:(id)a3;
- (void)terminate;
@end

@implementation LAAuthenticationBiometricMethod

- (unint64_t)lockoutStateFromError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if (![v4 isEqualToString:@"com.apple.LocalAuthentication"])
  {

    goto LABEL_6;
  }
  uint64_t v5 = [v3 code];

  if (v5 != -8)
  {
LABEL_6:
    unint64_t v9 = 0;
    goto LABEL_7;
  }
  v6 = [v3 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"Subcode"];
  uint64_t v8 = [v7 integerValue];

  if ((unint64_t)(v8 - 1) >= 5) {
    unint64_t v9 = 4;
  }
  else {
    unint64_t v9 = qword_1BED40C58[v8 - 1];
  }
LABEL_7:

  return v9;
}

- (LAAuthenticationBiometricMethod)initWithConfiguration:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)LAAuthenticationBiometricMethod;
  uint64_t v5 = [(LAAuthenticationMethod *)&v37 initWithConfiguration:v4];
  if (v5)
  {
    v6 = [v4 authenticationContext];
    v7 = v6;
    if (!v6) {
      v7 = objc_alloc_init(LAContext);
    }
    objc_storeStrong((id *)&v5->_context, v7);
    if (!v6) {

    }
    uint64_t v8 = [(LAAuthenticationMethodState *)[LAAuthenticationBiometricMethodState alloc] initWithAvailableUsers:0];
    [(LAAuthenticationBiometricMethod *)v5 setCurrentState:v8];

    v5->_isDevicePresent = 1;
    unint64_t v9 = [(LAAuthenticationBiometricMethod *)v5 context];
    v40 = &unk_1F19EC748;
    v41[0] = MEMORY[0x1E4F1CC38];
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v36 = 0;
    v11 = [v9 evaluatePolicy:1 options:v10 error:&v36];
    id v12 = v36;
    v13 = v12;
    if (v11)
    {

LABEL_8:
      v14 = LA_LOG_laabio();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[LAAuthenticationBiometricMethod initWithConfiguration:](v14);
      }

      v5->_isEnrolled = 1;
LABEL_11:
      v15 = [(LAAuthenticationBiometricMethod *)v5 context];
      BOOL v16 = [v15 biometryType] == 1;
      v17 = [(LAAuthenticationBiometricMethod *)v5 currentState];
      [v17 setIsTouchID:v16];

      v18 = [(LAAuthenticationBiometricMethod *)v5 context];
      BOOL v19 = [v18 biometryType] == 2;
      v20 = [(LAAuthenticationBiometricMethod *)v5 currentState];
      [v20 setIsFaceID:v19];

      v5->_isAllowed = v5->_isEnrolled;
      goto LABEL_12;
    }
    v22 = [v12 domain];
    if ([v22 isEqualToString:@"com.apple.LocalAuthentication"])
    {
      uint64_t v23 = [v13 code];

      if (v23 == -1004) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    v24 = LA_LOG_laabio();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[LAAuthenticationBiometricMethod initWithConfiguration:]((uint64_t)v13, v24, v25, v26, v27, v28, v29, v30);
    }

    v31 = [v13 domain];
    int v32 = [v31 isEqualToString:@"com.apple.LocalAuthentication"];

    if (v32)
    {
      switch([v13 code])
      {
        case -8:
          v5->_isEnrolled = 1;
          uint64_t v33 = [(LAAuthenticationBiometricMethod *)v5 lockoutStateFromError:v13];
          v34 = [(LAAuthenticationBiometricMethod *)v5 currentState];
          [v34 setLockoutState:v33];

          break;
        case -7:
        case -5:
          goto LABEL_11;
        case -6:
          goto LABEL_25;
        default:
          v35 = LA_LOG_laabio();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v13;
            _os_log_impl(&dword_1BED06000, v35, OS_LOG_TYPE_DEFAULT, "unhandled error for canEvaluate: %@", buf, 0xCu);
          }

LABEL_25:
          v5->_isDevicePresent = 0;
          break;
      }
    }
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (BOOL)start
{
  BOOL v3 = [(LAAuthenticationBiometricMethod *)self isDevicePresent];
  if (v3)
  {
    BOOL v3 = [(LAAuthenticationBiometricMethod *)self isEnrolled];
    if (v3)
    {
      BOOL v3 = [(LAAuthenticationBiometricMethod *)self isAllowed];
      if (v3)
      {
        v7.receiver = self;
        v7.super_class = (Class)LAAuthenticationBiometricMethod;
        BOOL v3 = [(LAAuthenticationMethod *)&v7 start];
        if (v3)
        {
          v6[0] = MEMORY[0x1E4F143A8];
          v6[1] = 3221225472;
          v6[2] = __40__LAAuthenticationBiometricMethod_start__block_invoke;
          v6[3] = &unk_1E63C4E40;
          v6[4] = self;
          [(LAAuthenticationMethod *)self forEachObserverWithProtocol:&unk_1F19F4090 selector:sel_authenticationMethod_didStartWithState_ invoke:v6];
          id v4 = [(LAAuthenticationBiometricMethod *)self context];
          [v4 setUiDelegate:self];

          [(LAAuthenticationBiometricMethod *)self runBiometricOperation];
          LOBYTE(v3) = 1;
        }
      }
    }
  }
  return v3;
}

void __40__LAAuthenticationBiometricMethod_start__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 currentState];
  [v3 authenticationMethod:v2 didStartWithState:v4];
}

- (void)distributeBiometricFeedback:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke;
  v3[3] = &unk_1E63C4E68;
  v3[4] = self;
  v3[5] = a3;
  [(LAAuthenticationMethod *)self forEachObserverWithProtocol:&unk_1F19F4160 selector:sel_authenticationBiometricsMethod_didReceiveFeedback_ invoke:v3];
}

uint64_t __63__LAAuthenticationBiometricMethod_distributeBiometricFeedback___block_invoke(uint64_t a1, void *a2)
{
  return [a2 authenticationBiometricsMethod:*(void *)(a1 + 32) didReceiveFeedback:*(void *)(a1 + 40)];
}

- (void)distributeStateChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke;
  v2[3] = &unk_1E63C4E40;
  v2[4] = self;
  [(LAAuthenticationMethod *)self forEachObserverWithProtocol:&unk_1F19F4160 selector:sel_authenticationMethod_didChangeState_ invoke:v2];
}

void __56__LAAuthenticationBiometricMethod_distributeStateChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 currentState];
  [v3 authenticationMethod:v2 didChangeState:v4];
}

- (void)runBiometricOperation
{
  id v3 = [(LAAuthenticationBiometricMethod *)self currentState];
  uint64_t v4 = [v3 lockoutState];

  if (!v4)
  {
    uint64_t v5 = [(LAAuthenticationBiometricMethod *)self context];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke;
    v6[3] = &unk_1E63C4EB8;
    v6[4] = self;
    [v5 evaluatePolicy:1 options:MEMORY[0x1E4F1CC08] reply:v6];
  }
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = LA_LOG_laabio();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);
    }

    v15 = [[LAAuthenticationMethodResult alloc] initWithAuthenticatedUser:&stru_1F19E1C60 authenticationMethod:*(void *)(a1 + 32)];
    BOOL v16 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_112;
    v24[3] = &unk_1E63C4E90;
    v24[4] = v16;
    uint64_t v25 = v15;
    v17 = v15;
    [v16 forEachObserverWithProtocol:&unk_1F19F4090 selector:sel_authenticationMethod_didAuthenticateWithResult_ invoke:v24];
  }
  else
  {
    if (v8) {
      __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1((uint64_t)v6, v7, v9, v10, v11, v12, v13, v14);
    }

    v18 = [v6 domain];
    int v19 = [v18 isEqualToString:@"com.apple.LocalAuthentication"];

    if (v19)
    {
      uint64_t v20 = [v6 code];
      if (v20 == -8)
      {
        uint64_t v22 = [*(id *)(a1 + 32) lockoutStateFromError:v6];
        uint64_t v23 = [*(id *)(a1 + 32) currentState];
        [v23 setLockoutState:v22];

        [*(id *)(a1 + 32) distributeStateChange];
      }
      else if (v20 == -1)
      {
        v21 = [*(id *)(a1 + 32) configuration];
        if ([v21 autoRetry]) {
          [*(id *)(a1 + 32) runBiometricOperation];
        }
      }
    }
  }
}

uint64_t __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_112(uint64_t a1, void *a2)
{
  return [a2 authenticationMethod:*(void *)(a1 + 32) didAuthenticateWithResult:*(void *)(a1 + 40)];
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7 = a4;
  BOOL v8 = LA_LOG_laabio();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LAAuthenticationBiometricMethod event:params:reply:].cold.5();
  }

  uint64_t v9 = [(LAAuthenticationBiometricMethod *)self currentState];
  uint64_t v10 = [v9 isUserPresent];

  if (a3 > 6)
  {
    if (a3 == 7)
    {
      BOOL v16 = [v7 objectForKeyedSubscript:&unk_1F19EC778];
      uint64_t v12 = v16;
      if (v16)
      {
        switch([v16 integerValue])
        {
          case 0:
LABEL_16:
            uint64_t v10 = 1;
            break;
          case 1:
LABEL_19:
            uint64_t v10 = 0;
            break;
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
            goto LABEL_40;
          case 8:
            uint64_t v14 = self;
            uint64_t v15 = 13;
LABEL_39:
            [(LAAuthenticationBiometricMethod *)v14 distributeBiometricFeedback:v15];
            break;
          default:
            v17 = LA_LOG_laabio();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[LAAuthenticationBiometricMethod event:params:reply:]();
            }
LABEL_37:

            break;
        }
      }
      goto LABEL_40;
    }
    if (a3 == 12)
    {
      uint64_t v13 = [v7 objectForKeyedSubscript:&unk_1F19EC790];
      uint64_t v12 = v13;
      if (v13)
      {
        switch([v13 integerValue])
        {
          case 1:
            uint64_t v14 = self;
            uint64_t v15 = 12;
            goto LABEL_39;
          case 2:
            uint64_t v14 = self;
            uint64_t v15 = 0;
            goto LABEL_39;
          case 3:
            uint64_t v14 = self;
            uint64_t v15 = 1;
            goto LABEL_39;
          case 4:
            uint64_t v14 = self;
            uint64_t v15 = 2;
            goto LABEL_39;
          case 5:
            uint64_t v14 = self;
            uint64_t v15 = 3;
            goto LABEL_39;
          case 6:
            uint64_t v14 = self;
            uint64_t v15 = 4;
            goto LABEL_39;
          case 7:
          case 11:
            uint64_t v14 = self;
            uint64_t v15 = 5;
            goto LABEL_39;
          case 8:
            uint64_t v14 = self;
            uint64_t v15 = 6;
            goto LABEL_39;
          case 9:
            uint64_t v14 = self;
            uint64_t v15 = 7;
            goto LABEL_39;
          case 10:
            uint64_t v14 = self;
            uint64_t v15 = 8;
            goto LABEL_39;
          case 12:
            uint64_t v14 = self;
            uint64_t v15 = 10;
            goto LABEL_39;
          case 13:
            uint64_t v14 = self;
            uint64_t v15 = 11;
            goto LABEL_39;
          default:
            v17 = LA_LOG_laabio();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              -[LAAuthenticationBiometricMethod event:params:reply:].cold.4();
            }
            goto LABEL_37;
        }
      }
      goto LABEL_40;
    }
    goto LABEL_17;
  }
  if (!a3) {
    goto LABEL_41;
  }
  if (a3 != 1)
  {
LABEL_17:
    uint64_t v12 = LA_LOG_laabio();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[LAAuthenticationBiometricMethod event:params:reply:]();
    }
    goto LABEL_40;
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:&unk_1F19EC760];
  uint64_t v12 = v11;
  if (v11)
  {
    switch([v11 integerValue])
    {
      case 0:
        goto LABEL_16;
      case 1:
        goto LABEL_19;
      case 2:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
        break;
      case 3:
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke;
        v21[3] = &unk_1E63C4E40;
        v21[4] = self;
        [(LAAuthenticationMethod *)self forEachObserverWithProtocol:&unk_1F19F4160 selector:sel_authenticationBiometricsMethodDidReceiveNoMatch_ invoke:v21];
        break;
      default:
        v17 = LA_LOG_laabio();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[LAAuthenticationBiometricMethod event:params:reply:]();
        }
        goto LABEL_37;
    }
  }
LABEL_40:

LABEL_41:
  v18 = [(LAAuthenticationBiometricMethod *)self currentState];
  int v19 = [v18 isUserPresent];

  if (v10 != v19)
  {
    uint64_t v20 = [(LAAuthenticationBiometricMethod *)self currentState];
    [v20 setIsUserPresent:v10];

    [(LAAuthenticationBiometricMethod *)self distributeStateChange];
  }
}

uint64_t __54__LAAuthenticationBiometricMethod_event_params_reply___block_invoke(uint64_t a1, void *a2)
{
  return [a2 authenticationBiometricsMethodDidReceiveNoMatch:*(void *)(a1 + 32)];
}

- (void)terminate
{
  id v3 = [(LAAuthenticationBiometricMethod *)self context];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)LAAuthenticationBiometricMethod;
  [(LAAuthenticationMethod *)&v4 terminate];
}

- (BOOL)isDevicePresent
{
  return self->_isDevicePresent;
}

- (BOOL)isEnrolled
{
  return self->_isEnrolled;
}

- (BOOL)isAllowed
{
  return self->_isAllowed;
}

- (LAContext)context
{
  return self->_context;
}

- (LAAuthenticationBiometricMethodState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED06000, log, OS_LOG_TYPE_DEBUG, "initial evaluatePolicy succeeded", v1, 2u);
}

- (void)initWithConfiguration:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__LAAuthenticationBiometricMethod_runBiometricOperation__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)event:params:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BED06000, v0, v1, "unhandled bioevent: %d", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BED06000, v0, v1, "unknown LATouchIDSimpleStatus %d received, ignoring", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BED06000, v0, v1, "unknown LAEventParamPearlSimpleStatus %d received, ignoring", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1BED06000, v0, v1, "unknown LAEventParamCoachingFeedback %d received, ignoring", v2, v3, v4, v5, v6);
}

- (void)event:params:reply:.cold.5()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1BED06000, v1, OS_LOG_TYPE_DEBUG, "got bio event: %d (%@)", v2, 0x12u);
}

@end