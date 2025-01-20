@interface LAUIAuthenticationCore
+ (void)performBlockOnMainThread:(id)a3;
- (BOOL)_mechanism:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5;
- (BOOL)_simpleStatusInParams:(id)a3 touchId:(int64_t)a4 faceId:(int64_t)a5;
- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4;
- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4;
- (BOOL)isApplicationActive;
- (BOOL)isKeyWindow;
- (BOOL)isMechanismActive:(unint64_t)a3;
- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4;
- (BOOL)isMechanismEnabled:(unint64_t)a3;
- (BOOL)isUiActive;
- (LAContext)context;
- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3;
- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3 context:(id)a4;
- (LAUIAuthenticationCoreDelegate)delegate;
- (NSDictionary)faceIdResult;
- (UIView)view;
- (id)_optionsForBackgroundMechanism;
- (id)notificationNames;
- (int64_t)_policyForBackgroundMechanisms;
- (int64_t)biometryType;
- (unint64_t)activeMechanisms;
- (unint64_t)enabledMechanisms;
- (void)_biometricNoMatchWithBiolockoutError:(id)a3;
- (void)_biometryState:(int64_t)a3;
- (void)_enableAvailableMechanisms:(unint64_t)a3;
- (void)_handleBackgroundMechanismsResult:(id)a3 error:(id)a4 context:(id)a5;
- (void)_notification:(id)a3;
- (void)_processActivityChangeForNotification:(id)a3 block:(id)a4;
- (void)_setupMechanisms:(unint64_t)a3;
- (void)_setupNotifications:(BOOL)a3;
- (void)_startBackgroundMechanisms;
- (void)_stopBackgroundMechanisms;
- (void)checkView;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)setActiveMechanisms:(unint64_t)a3;
- (void)setApplicationActive:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabledMechanisms:(unint64_t)a3;
- (void)setKeyWindow:(BOOL)a3;
- (void)setUiActive:(BOOL)a3;
- (void)setView:(id)a3;
- (void)startOrStopBackgroundMechanisms;
@end

@implementation LAUIAuthenticationCore

- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3
{
  return [(LAUIAuthenticationCore *)self initWithMechanisms:a3 context:0];
}

- (LAUIAuthenticationCore)initWithMechanisms:(unint64_t)a3 context:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LAUIAuthenticationCore;
  v8 = [(LAUIAuthenticationCore *)&v13 init];
  v9 = v8;
  if (v8)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v8->_context, a4);
    }
    else
    {
      uint64_t v10 = objc_opt_new();
      context = v9->_context;
      v9->_context = (LAContext *)v10;

      v9->_usesInternalContext = 1;
    }
    [(LAUIAuthenticationCore *)v9 _setupMechanisms:a3];
    [(LAUIAuthenticationCore *)v9 _setupNotifications:1];
    v9->_applicationActive = 1;
  }

  return v9;
}

- (void)_setupMechanisms:(unint64_t)a3
{
  [(LAUIAuthenticationCore *)self setActiveMechanisms:0];
  [(LAUIAuthenticationCore *)self _enableAvailableMechanisms:a3];
}

- (void)_enableAvailableMechanisms:(unint64_t)a3
{
  [(LAUIAuthenticationCore *)self setEnabledMechanisms:0];
  if (a3)
  {
    unint64_t v5 = 1;
    do
    {
      if ((v5 & a3) != 0)
      {
        if ([(LAUIAuthenticationCore *)self isMechanismAvailable:v5 error:0]) {
          [(LAUIAuthenticationCore *)self setEnabledMechanisms:[(LAUIAuthenticationCore *)self enabledMechanisms] | v5];
        }
      }
      v5 *= 2;
    }
    while (v5 <= a3);
  }
}

- (void)_setupNotifications:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = [(LAUIAuthenticationCore *)self notificationNames];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObserver:self selector:sel__notification_ name:*(void *)(*((void *)&v10 + 1) + 8 * i) object:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)isMechanismAvailable:(unint64_t)a3 error:(id *)a4
{
  BOOL v5 = a3 == 4;
  if (a3 != 4)
  {
    if (!a4) {
      return 0;
    }
    id LAErrorHelperClass = getLAErrorHelperClass();
    long long v11 = objc_msgSend(NSString, "stringWithFormat:", @"Unsupported mechanism: %d", a3);
    [LAErrorHelperClass internalErrorWithMessage:v11];
    char v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  uint64_t v7 = [(LAUIAuthenticationCore *)self context];

  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    [(LAUIAuthenticationCore *)self setContext:v8];
  }
  v9 = [(LAUIAuthenticationCore *)self context];
  char v10 = [v9 canEvaluatePolicy:v5 error:a4];

  if (![(LAUIAuthenticationCore *)self biometryType])
  {
    long long v11 = [(LAUIAuthenticationCore *)self context];
    self->_biometryType = [v11 biometryType];
LABEL_8:
  }
  return v10;
}

- (BOOL)isMechanismEnabled:(unint64_t)a3
{
  return ([(LAUIAuthenticationCore *)self enabledMechanisms] & a3) != 0;
}

- (BOOL)isMechanismActive:(unint64_t)a3
{
  return ([(LAUIAuthenticationCore *)self activeMechanisms] & a3) != 0;
}

- (BOOL)enableMechanism:(unint64_t)a3 error:(id *)a4
{
  return [(LAUIAuthenticationCore *)self _mechanism:a3 enable:1 error:a4];
}

- (BOOL)disableMechanism:(unint64_t)a3 error:(id *)a4
{
  return [(LAUIAuthenticationCore *)self _mechanism:a3 enable:0 error:a4];
}

- (BOOL)_mechanism:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  v9 = LA_LOG_LAUIAuthenticationCore();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    char v10 = [(LAUIAuthenticationCore *)self delegate];
    long long v11 = "disabling";
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    if (v6) {
      long long v11 = "enabling";
    }
    __int16 v25 = 2082;
    v26 = v11;
    __int16 v27 = 1024;
    int v28 = a3;
    _os_log_impl(&dword_214463000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ is %{public}s mechanism: %d", buf, 0x1Cu);
  }
  if (v6)
  {
    id v22 = 0;
    BOOL v12 = [(LAUIAuthenticationCore *)self isMechanismAvailable:a3 error:&v22];
    id v13 = v22;
    if (v12)
    {
      [(LAUIAuthenticationCore *)self setEnabledMechanisms:[(LAUIAuthenticationCore *)self enabledMechanisms] | a3];
      if (a3 == 4
        && [(LAUIAuthenticationCore *)self biometryType] == 2
        && ([(LAUIAuthenticationCore *)self activeMechanisms] & 4) != 0)
      {
        objc_initWeak((id *)buf, self);
        v14 = [(LAUIAuthenticationCore *)self context];
        uint64_t v17 = MEMORY[0x263EF8330];
        uint64_t v18 = 3221225472;
        v19 = __50__LAUIAuthenticationCore__mechanism_enable_error___block_invoke;
        v20 = &unk_26420C9E8;
        objc_copyWeak(&v21, (id *)buf);
        [v14 retryProcessedEvent:7 reply:&v17];

        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }
    if (v13)
    {
      BOOL v15 = 0;
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else
  {
    [(LAUIAuthenticationCore *)self setEnabledMechanisms:[(LAUIAuthenticationCore *)self enabledMechanisms] & ~a3];
  }
  [(LAUIAuthenticationCore *)self startOrStopBackgroundMechanisms];
  id v13 = 0;
  BOOL v15 = 1;
  if (a5) {
LABEL_16:
  }
    *a5 = v13;
LABEL_17:

  return v15;
}

void __50__LAUIAuthenticationCore__mechanism_enable_error___block_invoke(uint64_t a1, int a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2) {
    WeakRetained[8] = 0;
  }
}

- (void)setEnabledMechanisms:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t enabledMechanisms = self->_enabledMechanisms;
  if (enabledMechanisms != a3)
  {
    int v4 = a3;
    self->_unint64_t enabledMechanisms = a3;
    BOOL v6 = LA_LOG_LAUIAuthenticationCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [(LAUIAuthenticationCore *)self delegate];
      int v8 = 138543874;
      v9 = v7;
      __int16 v10 = 1024;
      int v11 = enabledMechanisms;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_debug_impl(&dword_214463000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has changed enabled mechanisms from %d to %d", (uint8_t *)&v8, 0x18u);
    }
  }
}

- (void)setActiveMechanisms:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t activeMechanisms = self->_activeMechanisms;
  if (activeMechanisms != a3)
  {
    int v4 = a3;
    self->_unint64_t activeMechanisms = a3;
    BOOL v6 = LA_LOG_LAUIAuthenticationCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [(LAUIAuthenticationCore *)self delegate];
      int v8 = 138543874;
      v9 = v7;
      __int16 v10 = 1024;
      int v11 = activeMechanisms;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_debug_impl(&dword_214463000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has changed active mechanisms from %d to %d", (uint8_t *)&v8, 0x18u);
    }
  }
}

- (void)startOrStopBackgroundMechanisms
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[LAUIAuthenticationCore startOrStopBackgroundMechanisms]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_214463000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (int64_t)_policyForBackgroundMechanisms
{
  return [(LAUIAuthenticationCore *)self isMechanismEnabled:4];
}

- (void)_startBackgroundMechanisms
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (self->_usesInternalContext)
  {
    v3 = [(LAUIAuthenticationCore *)self context];
    [v3 invalidate];

    __int16 v4 = objc_opt_new();
    [(LAUIAuthenticationCore *)self setContext:v4];
  }
  uint64_t v5 = LA_LOG_LAUIAuthenticationCore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(LAUIAuthenticationCore *)self delegate];
    context = self->_context;
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2114;
    id v22 = context;
    _os_log_impl(&dword_214463000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will use %{public}@", buf, 0x16u);
  }
  int v8 = [(LAUIAuthenticationCore *)self context];
  v9 = [(LAUIAuthenticationCore *)self context];
  [v9 setUiDelegate:self];

  int64_t v10 = [(LAUIAuthenticationCore *)self _policyForBackgroundMechanisms];
  if (v10)
  {
    unint64_t v11 = [(LAUIAuthenticationCore *)self enabledMechanisms] & 4;
    [(LAUIAuthenticationCore *)self setActiveMechanisms:[(LAUIAuthenticationCore *)self activeMechanisms] | v11];
    id v18 = 0;
    int v12 = [v8 canEvaluatePolicy:v10 error:&v18];
    id v13 = v18;
    if (v12)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v14 = [(LAUIAuthenticationCore *)self _optionsForBackgroundMechanism];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __52__LAUIAuthenticationCore__startBackgroundMechanisms__block_invoke;
      v15[3] = &unk_26420CA10;
      objc_copyWeak(v17, (id *)buf);
      v17[1] = (id)v11;
      id v16 = v8;
      [v16 evaluatePolicy:v10 options:v14 reply:v15];

      objc_destroyWeak(v17);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(LAUIAuthenticationCore *)self _handleBackgroundMechanismsResult:0 error:v13 context:v8];
    }
  }
}

void __52__LAUIAuthenticationCore__startBackgroundMechanisms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setActiveMechanisms:", objc_msgSend(WeakRetained, "activeMechanisms") & ~*(void *)(a1 + 48));
    [v7 _handleBackgroundMechanismsResult:v8 error:v5 context:*(void *)(a1 + 32)];
  }
}

- (id)_optionsForBackgroundMechanism
{
  v19[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithObject:MEMORY[0x263EFFA88] forKey:&unk_26C5342F8];
  if ([(LAUIAuthenticationCore *)self isMechanismEnabled:4])
  {
    __int16 v4 = [(LAUIAuthenticationCore *)self delegate];
    id v5 = [v4 callerIconPath];

    uint64_t v6 = [(LAUIAuthenticationCore *)self delegate];
    uint64_t v7 = [v6 callerIconBundlePath];

    uint64_t v8 = [v5 length];
    v9 = v5;
    if (v8 || (uint64_t v10 = objc_msgSend(v7, "length", v5), v9 = v7, v10)) {
      [v3 setObject:v9 forKey:&unk_26C534310];
    }
    unint64_t v11 = [(LAUIAuthenticationCore *)self delegate];
    int v12 = [v11 localizedCallerName];

    if (v12) {
      [v3 setObject:v12 forKey:&unk_26C534328];
    }
    if ([(LAUIAuthenticationCore *)self biometryType] == 2)
    {
      id v16 = &unk_26C534358;
      uint64_t v17 = &unk_26C534358;
      id v18 = &unk_26C534340;
      id v13 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      v19[0] = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v3 setObject:v14 forKey:&unk_26C534370];
    }
  }
  return v3;
}

- (void)_handleBackgroundMechanismsResult:(id)a3 error:(id)a4 context:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(LAUIAuthenticationCore *)self context];

  if (v11 != v10)
  {
    [v10 invalidate];
    goto LABEL_12;
  }
  if (v17)
  {
    int v12 = [v17 objectForKeyedSubscript:&unk_26C534388];
    if ([v12 BOOLValue])
    {
      int64_t v13 = [(LAUIAuthenticationCore *)self biometryType];

      if (v13 == 2)
      {
        objc_storeStrong((id *)&self->_faceIdResult, a3);
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v14 = [(LAUIAuthenticationCore *)self delegate];
    BOOL v15 = v14;
    id v16 = v17;
  }
  else
  {
    if ([getLAErrorHelperClass() error:v9 hasCode:-9]) {
      goto LABEL_12;
    }
    uint64_t v14 = [(LAUIAuthenticationCore *)self delegate];
    BOOL v15 = v14;
    id v16 = 0;
  }
  [v14 authenticationResult:v16 error:v9 context:v10];

LABEL_12:
}

- (void)_stopBackgroundMechanisms
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_context && self->_usesInternalContext)
  {
    v3 = LA_LOG_LAUIAuthenticationCore();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v4 = [(LAUIAuthenticationCore *)self delegate];
      context = self->_context;
      int v7 = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      id v10 = context;
      _os_log_impl(&dword_214463000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will discard %{public}@", (uint8_t *)&v7, 0x16u);
    }
    [(LAContext *)self->_context invalidate];
    uint64_t v6 = self->_context;
    self->_context = 0;
  }
  [(LAUIAuthenticationCore *)self setActiveMechanisms:[(LAUIAuthenticationCore *)self activeMechanisms] & (~[(LAUIAuthenticationCore *)self enabledMechanisms] | 0xFFFFFFFFFFFFFFFBLL)];
  if ([(LAUIAuthenticationCore *)self isMechanismEnabled:4]) {
    [(LAUIAuthenticationCore *)self _biometryState:0];
  }
}

- (id)notificationNames
{
  if (notificationNames_onceToken != -1) {
    dispatch_once(&notificationNames_onceToken, &__block_literal_global_5);
  }
  int v2 = (void *)notificationNames_notificationNames;
  return v2;
}

void __43__LAUIAuthenticationCore_notificationNames__block_invoke()
{
  v0 = (void *)notificationNames_notificationNames;
  notificationNames_notificationNames = MEMORY[0x263EFFA68];
}

- (void)_notification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__LAUIAuthenticationCore__notification___block_invoke;
  v5[3] = &unk_26420C780;
  objc_copyWeak(&v6, &location);
  [(LAUIAuthenticationCore *)self _processActivityChangeForNotification:v4 block:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__LAUIAuthenticationCore__notification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
}

- (void)checkView
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__LAUIAuthenticationCore_checkView__block_invoke;
  v3[3] = &unk_26420C780;
  objc_copyWeak(&v4, &location);
  [(LAUIAuthenticationCore *)self _processActivityChangeForNotification:0 block:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __35__LAUIAuthenticationCore_checkView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    int v2 = [WeakRetained view];
    v3 = [v2 window];
    objc_msgSend(v4, "setKeyWindow:", objc_msgSend(v3, "isKeyWindow"));

    id WeakRetained = v4;
  }
}

- (void)setView:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__LAUIAuthenticationCore_setView___block_invoke;
  v6[3] = &unk_26420CA38;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(LAUIAuthenticationCore *)self _processActivityChangeForNotification:0 block:v6];
  [(LAUIAuthenticationCore *)self startOrStopBackgroundMechanisms];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__LAUIAuthenticationCore_setView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v2 = [*(id *)(a1 + 32) window];
    objc_msgSend(WeakRetained, "setKeyWindow:", objc_msgSend(v2, "isKeyWindow"));
  }
}

- (void)_processActivityChangeForNotification:(id)a3 block:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(void))a4;
  BOOL v7 = [(LAUIAuthenticationCore *)self isUiActive];
  if (v6) {
    v6[2](v6);
  }
  if ([(LAUIAuthenticationCore *)self isApplicationActive]) {
    BOOL v8 = [(LAUIAuthenticationCore *)self isKeyWindow];
  }
  else {
    BOOL v8 = 0;
  }
  [(LAUIAuthenticationCore *)self setUiActive:v8];
  if (v7 != [(LAUIAuthenticationCore *)self isUiActive])
  {
    [(LAUIAuthenticationCore *)self startOrStopBackgroundMechanisms];
    __int16 v9 = [(LAUIAuthenticationCore *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(LAUIAuthenticationCore *)self delegate];
      objc_msgSend(v11, "notification:original:mechanism:", -[LAUIAuthenticationCore isUiActive](self, "isUiActive"), v12, 0);
    }
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v10 = [v8 objectForKeyedSubscript:&unk_26C5343A0];
  unsigned int v11 = [v10 BOOLValue];
  if (a3 == 7 || a3 == 1)
  {
    id v12 = [v8 objectForKeyedSubscript:&unk_26C5343B8];
    int64_t v13 = v12;
    if (v12)
    {
      self->_mirroringToDefaultUI = [v12 BOOLValue];
      [(LAUIAuthenticationCore *)self _biometryState:self->_lastState];
    }
    if (v10)
    {
      self->_doneMatching = v11 ^ 1;
      uint64_t v14 = v11;
      BOOL v15 = self;
    }
    else if ([(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:0 faceId:0])
    {
      BOOL v15 = self;
      uint64_t v14 = 2;
    }
    else
    {
      if ([(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:1 faceId:1])
      {
        goto LABEL_13;
      }
      if ([(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:2 faceId:2])
      {
        BOOL v15 = self;
        uint64_t v14 = 4;
        goto LABEL_14;
      }
      if ([(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:-1 faceId:10])
      {
LABEL_13:
        BOOL v15 = self;
        uint64_t v14 = 1;
        goto LABEL_14;
      }
      if (![(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:-1 faceId:11])
      {
        if ([(LAUIAuthenticationCore *)self _simpleStatusInParams:v8 touchId:3 faceId:3])
        {
          id v16 = [v8 objectForKeyedSubscript:&unk_26C5343D0];
          if (v16
            || ([v8 objectForKeyedSubscript:&unk_26C5343E8],
                (id v16 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [(LAUIAuthenticationCore *)self setEnabledMechanisms:[(LAUIAuthenticationCore *)self enabledMechanisms] & 0xFFFFFFFFFFFFFFFBLL];
          }
          [(LAUIAuthenticationCore *)self _biometryState:5];
          [(LAUIAuthenticationCore *)self _biometricNoMatchWithBiolockoutError:v16];
        }
        else
        {
          uint64_t v17 = [v8 objectForKeyedSubscript:&unk_26C534400];
          if (v17)
          {
            id v18 = (void *)v17;
            v19 = [v8 objectForKeyedSubscript:&unk_26C534400];
            uint64_t v20 = [v19 integerValue];

            if (v20 == 11)
            {
              __int16 v21 = LA_LOG_LAUIAuthenticationCore();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)id v22 = 0;
                _os_log_impl(&dword_214463000, v21, OS_LOG_TYPE_DEFAULT, "Face mask detected. Will shortcircuit bio-auth.", v22, 2u);
              }

              [(LAContext *)self->_context failProcessedEvent:a3 failureError:0 reply:&__block_literal_global_41];
            }
          }
        }
        goto LABEL_15;
      }
      BOOL v15 = self;
      uint64_t v14 = 0;
    }
LABEL_14:
    [(LAUIAuthenticationCore *)v15 _biometryState:v14];
LABEL_15:
  }
  (*((void (**)(id, void, void))v9 + 2))(v9, MEMORY[0x263EFFA78], 0);
}

- (BOOL)_simpleStatusInParams:(id)a3 touchId:(int64_t)a4 faceId:(int64_t)a5
{
  id v8 = a3;
  int64_t v9 = [(LAUIAuthenticationCore *)self biometryType];
  if (v9 == 1)
  {
    char v10 = &unk_26C534418;
  }
  else
  {
    if (v9 != 2)
    {
LABEL_7:
      BOOL v13 = 0;
      goto LABEL_8;
    }
    char v10 = &unk_26C534430;
    a4 = a5;
  }
  unsigned int v11 = [v8 objectForKeyedSubscript:v10];
  if (!v11) {
    goto LABEL_7;
  }
  id v12 = v11;
  BOOL v13 = [v11 integerValue] == a4;

LABEL_8:
  return v13;
}

- (void)_biometryState:(int64_t)a3
{
  self->_lastState = a3;
  BOOL doneMatching = self->_doneMatching;
  if (a3 == 4) {
    self->_BOOL doneMatching = 1;
  }
  if (!doneMatching)
  {
    BOOL mirroringToDefaultUI = self->_mirroringToDefaultUI;
    objc_initWeak(&location, self);
    BOOL v7 = [(LAUIAuthenticationCore *)self delegate];
    if (mirroringToDefaultUI && a3 < 3) {
      int64_t v9 = 3;
    }
    else {
      int64_t v9 = a3;
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__LAUIAuthenticationCore__biometryState___block_invoke;
    v10[3] = &unk_26420C810;
    objc_copyWeak(v11, &location);
    v11[1] = (id)a3;
    [v7 biometryState:v9 completionHandler:v10];

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
}

void __41__LAUIAuthenticationCore__biometryState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 40) == 4)
    {
      id v7 = WeakRetained;
      BOOL v3 = [WeakRetained biometryType] == 2;
      id WeakRetained = v7;
      if (v3)
      {
        id v4 = [v7 delegate];
        id v5 = [v7 faceIdResult];
        id v6 = [v7 context];
        [v4 authenticationResult:v5 error:0 context:v6];

        id WeakRetained = v7;
      }
    }
  }
}

- (void)_biometricNoMatchWithBiolockoutError:(id)a3
{
  id v7 = a3;
  id v4 = [(LAUIAuthenticationCore *)self delegate];
  [v4 biometricNoMatch];

  if (v7)
  {
    id v5 = [(LAUIAuthenticationCore *)self delegate];
    id v6 = [(LAUIAuthenticationCore *)self context];
    [v5 authenticationResult:0 error:v7 context:v6];
  }
}

+ (void)performBlockOnMainThread:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08B88];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], block);
  }
}

- (LAUIAuthenticationCoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LAUIAuthenticationCoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (int64_t)biometryType
{
  return self->_biometryType;
}

- (unint64_t)enabledMechanisms
{
  return self->_enabledMechanisms;
}

- (unint64_t)activeMechanisms
{
  return self->_activeMechanisms;
}

- (BOOL)isApplicationActive
{
  return self->_applicationActive;
}

- (void)setApplicationActive:(BOOL)a3
{
  self->_applicationActive = a3;
}

- (BOOL)isKeyWindow
{
  return self->_keyWindow;
}

- (void)setKeyWindow:(BOOL)a3
{
  self->_keyWindow = a3;
}

- (BOOL)isUiActive
{
  return self->_uiActive;
}

- (void)setUiActive:(BOOL)a3
{
  self->_uiActive = a3;
}

- (LAContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)faceIdResult
{
  return self->_faceIdResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIdResult, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end