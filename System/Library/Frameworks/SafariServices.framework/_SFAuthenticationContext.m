@interface _SFAuthenticationContext
- (BOOL)_canInvalidateAuthentication;
- (BOOL)_contextRequiresSessionBasedAuthentication;
- (BOOL)_contextShouldAllowMultipleBiometricFailures;
- (BOOL)_contextShouldAllowPasscodeFallback;
- (BOOL)_hasAuthenticationCapability:(id *)a3;
- (BOOL)_monotonicTimeIsWithinAuthenticationGracePeriod:(double)a3;
- (BOOL)needsAuthentication;
- (LAContext)authenticatedContext;
- (NSData)externalizedContext;
- (_SFAuthenticationContext)init;
- (_SFAuthenticationContextDelegate)delegate;
- (id)_authenticationContext;
- (void)_cancelOngoingAndPendingAuthentications;
- (void)_cancelOngoingAuthentication;
- (void)_evaluatePolicyForClient:(id)a3 userInitiated:(BOOL)a4 reply:(id)a5;
- (void)_handleTouchIDEventWithParameters:(id)a3;
- (void)_invalidateAuthentication;
- (void)_processNextClientAwaitingAuthenticationUserInitiated:(BOOL)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)authenticateForClient:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)invalidateClient:(id)a3;
- (void)preemptOngoingAuthenticationWithPasccodeAuthentication;
- (void)setDelegate:(id)a3;
@end

@implementation _SFAuthenticationContext

- (void)setDelegate:(id)a3
{
}

- (_SFAuthenticationContext)init
{
  v21.receiver = self;
  v21.super_class = (Class)_SFAuthenticationContext;
  v2 = [(_SFAuthenticationContext *)&v21 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
    clientsAwaitingAuthentication = v2->_clientsAwaitingAuthentication;
    v2->_clientsAwaitingAuthentication = (NSMutableOrderedSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    clientsAwaitingAuthenticationToCompletionBlocks = v2->_clientsAwaitingAuthenticationToCompletionBlocks;
    v2->_clientsAwaitingAuthenticationToCompletionBlocks = (NSMapTable *)v7;

    v2->_authenticationGracePeriod = 160.0;
    v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __32___SFAuthenticationContext_init__block_invoke;
    v18 = &unk_1E5C76BA0;
    objc_copyWeak(&v19, &location);
    notify_register_dispatch("com.apple.springboard.lockstate", &v2->_notificationToken, v9, &v15);

    v11 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v15, v16, v17, v18);
    [v11 addObserver:v2 selector:sel_applicationDidEnterBackground name:*MEMORY[0x1E4FB2640] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v2 selector:sel_applicationWillEnterForeground name:*MEMORY[0x1E4FB2730] object:0];

    v13 = v2;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  int notificationToken = self->_notificationToken;
  if (notificationToken) {
    notify_cancel(notificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFAuthenticationContext;
  [(_SFAuthenticationContext *)&v4 dealloc];
}

- (LAContext)authenticatedContext
{
  if (self->_successfullyAuthenticated) {
    v2 = self->_context;
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (id)_authenticationContext
{
  context = self->_context;
  if (!context)
  {
    objc_super v4 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    uint64_t v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  v6 = context;

  return v6;
}

- (BOOL)_monotonicTimeIsWithinAuthenticationGracePeriod:(double)a3
{
  v7.tv_sec = 0;
  v7.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v7);
  double v5 = (double)v7.tv_nsec / 1000000000.0 + (double)v7.tv_sec - a3;
  return v5 >= 0.0 && v5 < self->_authenticationGracePeriod;
}

- (BOOL)_hasAuthenticationCapability:(id *)a3
{
  objc_super v4 = [(_SFAuthenticationContext *)self _authenticationContext];
  LOBYTE(a3) = [v4 canEvaluatePolicy:2 error:a3];

  return (char)a3;
}

- (BOOL)needsAuthentication
{
  if (!self->_successfullyAuthenticated) {
    return 1;
  }
  if ([(NSHashTable *)self->_clients count]) {
    return 0;
  }
  return ![(_SFAuthenticationContext *)self _monotonicTimeIsWithinAuthenticationGracePeriod:self->_lastAuthenticatedSessionEndTime];
}

- (BOOL)_contextRequiresSessionBasedAuthentication
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained contextRequiresSessionBasedAuthentication:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_contextShouldAllowPasscodeFallback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained contextShouldAllowPasscodeFallback:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_contextShouldAllowMultipleBiometricFailures
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained contextShouldAllowMultipleBiometricFailures:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_processNextClientAwaitingAuthenticationUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication count])
  {
    id v6 = [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication firstObject];
    [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication removeObjectAtIndex:0];
    double v5 = [(NSMapTable *)self->_clientsAwaitingAuthenticationToCompletionBlocks objectForKey:v6];
    [(NSMapTable *)self->_clientsAwaitingAuthenticationToCompletionBlocks removeObjectForKey:v6];
    [(_SFAuthenticationContext *)self authenticateForClient:v6 userInitiated:v3 completion:v5];
  }
}

- (void)authenticateForClient:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void (**)(id, BOOL, void))a5;
  id v27 = 0;
  BOOL v10 = [(_SFAuthenticationContext *)self _hasAuthenticationCapability:&v27];
  id v11 = v27;
  v12 = v11;
  if (!v10)
  {
    uint64_t v15 = [v11 code];
    if (v15 == -5) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v12;
    }
    ((void (**)(id, BOOL, void *))v9)[2](v9, v15 == -5, v16);
LABEL_12:
    [(_SFAuthenticationContext *)self _processNextClientAwaitingAuthenticationUserInitiated:v6];
    goto LABEL_13;
  }
  if (![(_SFAuthenticationContext *)self needsAuthentication])
  {
    if ([(_SFAuthenticationContext *)self _contextRequiresSessionBasedAuthentication])
    {
      [(NSHashTable *)self->_clients addObject:v8];
    }
    v9[2](v9, 1, 0);
    goto LABEL_12;
  }
  if (self->_currentClientBeingAuthenticated)
  {
    [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication addObject:v8];
    clientsAwaitingAuthenticationToCompletionBlocks = self->_clientsAwaitingAuthenticationToCompletionBlocks;
    v14 = (void *)MEMORY[0x1AD0C36A0](v9);
    [(NSMapTable *)clientsAwaitingAuthenticationToCompletionBlocks setObject:v14 forKey:v8];
  }
  else
  {
    *(_WORD *)&self->_successfullyAuthenticated = 0;
    self->_ongoingAuthenticationCanceled = 0;
    self->_lastAuthenticatedSessionStartTime = 1.79769313e308;
    context = self->_context;
    self->_context = 0;

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke;
    v23[3] = &unk_1E5C76BC8;
    v23[4] = self;
    id v18 = v8;
    id v24 = v18;
    v25 = v9;
    BOOL v26 = v6;
    id v19 = (void *)MEMORY[0x1AD0C36A0](v23);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy__8;
    v21[4] = __Block_byref_object_dispose__8;
    id v22 = (id)MEMORY[0x1AD0C36A0]();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __75___SFAuthenticationContext_authenticateForClient_userInitiated_completion___block_invoke_24;
    v20[3] = &unk_1E5C76C18;
    v20[4] = v21;
    [(_SFAuthenticationContext *)self _evaluatePolicyForClient:v18 userInitiated:v6 reply:v20];
    _Block_object_dispose(v21, 8);
  }
LABEL_13:
}

- (void)_evaluatePolicyForClient:(id)a3 userInitiated:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  objc_storeStrong((id *)&self->_currentClientBeingAuthenticated, a3);
  id v11 = [(_SFAuthenticationContext *)self _authenticationContext];
  v12 = [v9 authenticationMessageForContext:self];
  int v13 = [MEMORY[0x1E4F98AF8] isDTOMitigationEnabled];
  uint64_t v14 = [(_SFAuthenticationContext *)self _contextShouldAllowPasscodeFallback] | v6;
  uint64_t v15 = 4;
  if (v14) {
    uint64_t v15 = 2;
  }
  if (v13) {
    objc_msgSend(v9, "authenticationCustomUIProgressObserverForContext:", self, WBSAuthenticationPolicyForPasswordManager());
  }
  else {
  uint64_t v16 = objc_msgSend(v9, "authenticationCustomUIProgressObserverForContext:", self, v15);
  }

  if (v16)
  {
    [v11 setUiDelegate:self];
    *(_WORD *)&self->_matchFound = 0;
    self->_numberOfBiometricAuthenticationFailures = 0;
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v18 = MEMORY[0x1E4F1CC08];
    [v17 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:&unk_1EFBDEEC0];
    [v17 setObject:v18 forKeyedSubscript:&unk_1EFBDEED8];
    id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    [v19 setObject:v17 forKeyedSubscript:&unk_1EFBDEEF0];
    [v19 setObject:&unk_1EFBDEF08 forKeyedSubscript:&unk_1EFBDEE90];
    [v19 setObject:&unk_1EFBDFBC8 forKeyedSubscript:&unk_1EFBDEF20];
    if (v12) {
      v20 = v12;
    }
    else {
      v20 = &stru_1EFB97EB8;
    }
    [v19 setObject:v20 forKeyedSubscript:&unk_1EFBDEE60];
    if (v13)
    {
      objc_super v21 = [NSNumber numberWithBool:v14];
      [v19 setObject:v21 forKeyedSubscript:&unk_1EFBDEE18];
    }
    id v22 = [MEMORY[0x1E4F28B50] mainBundle];
    v23 = [v22 localizedInfoDictionary];
    id v24 = [v23 objectForKeyedSubscript:@"CFBundleDisplayName"];

    if (v24)
    {
      [v19 setObject:v24 forKeyedSubscript:&unk_1EFBDEF38];
    }
    else
    {
      id v27 = _WBSLocalizedString();
      [v19 setObject:v27 forKeyedSubscript:&unk_1EFBDEF38];
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_66;
    v31[3] = &unk_1E5C76CB8;
    v31[4] = self;
    id v32 = v10;
    v28 = (void *)MEMORY[0x1AD0C36A0](v31);
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8;
    v38 = __Block_byref_object_dispose__8;
    id v39 = (id)MEMORY[0x1AD0C36A0]();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke_3;
    v30[3] = &unk_1E5C76C68;
    v30[4] = &v34;
    [v11 evaluatePolicy:v29 options:v19 reply:v30];
    _Block_object_dispose(&v34, 8);
  }
  else
  {
    [v11 setUiDelegate:0];
    v17 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    if ((v13 & 1) == 0)
    {
      v25 = [NSNumber numberWithBool:v14];
      [v17 setObject:v25 forKeyedSubscript:&unk_1EFBDEE18];
    }
    if ([v9 displayMessageAsTitleForContext:self])
    {
      [v17 setObject:v12 forKeyedSubscript:&unk_1EFBDEE30];
      BOOL v26 = [v9 passcodePromptForContext:self];
      if (v26) {
        [v17 setObject:v26 forKeyedSubscript:&unk_1EFBDEE48];
      }
    }
    else
    {
      [v17 setObject:v12 forKeyedSubscript:&unk_1EFBDEE60];
    }
    if (![(_SFAuthenticationContext *)self _contextShouldAllowMultipleBiometricFailures]&& !v6)
    {
      [v17 setObject:&unk_1EFBDEE78 forKeyedSubscript:&unk_1EFBDEE90];
    }
    if (!v6) {
      [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:&unk_1EFBDEEA8];
    }
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__8;
    v38 = __Block_byref_object_dispose__8;
    id v39 = (id)MEMORY[0x1AD0C36A0](v10);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __73___SFAuthenticationContext__evaluatePolicyForClient_userInitiated_reply___block_invoke;
    v33[3] = &unk_1E5C76C68;
    v33[4] = &v34;
    [v11 evaluatePolicy:v29 options:v17 reply:v33];
    _Block_object_dispose(&v34, 8);
  }
}

- (void)preemptOngoingAuthenticationWithPasccodeAuthentication
{
  if (self->_currentClientBeingAuthenticated)
  {
    BOOL v3 = [(_SFAuthenticationContext *)self _authenticationContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __82___SFAuthenticationContext_preemptOngoingAuthenticationWithPasccodeAuthentication__block_invoke;
    v4[3] = &unk_1E5C75288;
    v4[4] = self;
    [v3 failProcessedEvent:1 failureError:0 reply:v4];
  }
}

- (void)invalidateClient:(id)a3
{
  char v4 = (_SFAuthenticationClient *)a3;
  if ([(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication containsObject:v4])
  {
    double v5 = [(NSMapTable *)self->_clientsAwaitingAuthenticationToCompletionBlocks objectForKey:v4];
    [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication removeObject:v4];
    [(NSMapTable *)self->_clientsAwaitingAuthenticationToCompletionBlocks removeObjectForKey:v4];
    if (v5) {
      v5[2](v5, 0, 0);
    }
  }
  else if (self->_currentClientBeingAuthenticated == v4)
  {
    [(_SFAuthenticationContext *)self _cancelOngoingAuthentication];
  }
  else if ([(NSHashTable *)self->_clients containsObject:v4])
  {
    [(NSHashTable *)self->_clients removeObject:v4];
    if (![(NSHashTable *)self->_clients count])
    {
      v6.tv_sec = 0;
      v6.tv_nsec = 0;
      clock_gettime(_CLOCK_MONOTONIC, &v6);
      self->_lastAuthenticatedSessionEndTime = (double)v6.tv_nsec / 1000000000.0 + (double)v6.tv_sec;
    }
  }
}

- (void)applicationDidEnterBackground
{
  v3.tv_sec = 0;
  v3.tv_nsec = 0;
  clock_gettime(_CLOCK_MONOTONIC, &v3);
  self->_lastApplicationBackgroundTime = (double)v3.tv_nsec / 1000000000.0 + (double)v3.tv_sec;
}

- (void)applicationWillEnterForeground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained invalidationTimeoutIfApplicationEntersBackgroundDuringAuthenticationForContext:self];
  }
  else {
    double v3 = 2.22507386e-308;
  }
  if (self->_currentClientBeingAuthenticated
    || (double lastApplicationBackgroundTime = self->_lastApplicationBackgroundTime, lastApplicationBackgroundTime != 0.0)
    && v3 >= 0.0
    && (double v3 = v3 + self->_lastAuthenticatedSessionStartTime, v3 > lastApplicationBackgroundTime)
    || lastApplicationBackgroundTime != 0.0
    && ![(_SFAuthenticationContext *)self _monotonicTimeIsWithinAuthenticationGracePeriod:self->_lastApplicationBackgroundTime])
  {
    [(_SFAuthenticationContext *)self _invalidateAuthentication];
  }
}

- (BOOL)_canInvalidateAuthentication
{
  if (self->_currentClientBeingAuthenticated
    || self->_successfullyAuthenticated
    || [(NSHashTable *)self->_clients count]
    || [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication count])
  {
    return 1;
  }
  else
  {
    return ![(_SFAuthenticationContext *)self _contextRequiresSessionBasedAuthentication];
  }
}

- (void)_invalidateAuthentication
{
  if ([(_SFAuthenticationContext *)self _hasAuthenticationCapability:0]
    && [(_SFAuthenticationContext *)self _canInvalidateAuthentication])
  {
    self->_authenticationInvalidated = 1;
    [(_SFAuthenticationContext *)self _cancelOngoingAndPendingAuthentications];
    self->_successfullyAuthenticated = 0;
    self->_double lastApplicationBackgroundTime = 0.0;
    [(NSHashTable *)self->_clients removeAllObjects];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"AuthenticationContextDidInvalidateNotification" object:self];
  }
}

- (void)_cancelOngoingAndPendingAuthentications
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_clientsAwaitingAuthentication;
  uint64_t v4 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = -[NSMapTable objectForKey:](self->_clientsAwaitingAuthenticationToCompletionBlocks, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        id v9 = (void *)v8;
        if (v8) {
          (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableOrderedSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableOrderedSet *)self->_clientsAwaitingAuthentication removeAllObjects];
  [(NSMapTable *)self->_clientsAwaitingAuthenticationToCompletionBlocks removeAllObjects];
  [(_SFAuthenticationContext *)self _cancelOngoingAuthentication];
}

- (void)_cancelOngoingAuthentication
{
  self->_ongoingAuthenticationCanceled = 1;
  id v5 = [(_SFAuthenticationClient *)self->_currentClientBeingAuthenticated authenticationCustomUIProgressObserverForContext:self];
  if (objc_opt_respondsToSelector()) {
    [v5 authenticationDidCancel:self completion:0];
  }
  id v3 = [(_SFAuthenticationContext *)self _authenticationContext];
  [v3 invalidate];

  context = self->_context;
  self->_context = 0;
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  if (a3 == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47___SFAuthenticationContext_event_params_reply___block_invoke;
    v9[3] = &unk_1E5C72238;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

- (void)_handleTouchIDEventWithParameters:(id)a3
{
  id v4 = a3;
  if (!self->_matchFound)
  {
    id v11 = v4;
    id v5 = [(_SFAuthenticationClient *)self->_currentClientBeingAuthenticated authenticationCustomUIProgressObserverForContext:self];
    uint64_t v6 = [v11 objectForKeyedSubscript:&unk_1EFBDEEC0];
    id v7 = v6;
    if (v6 && ([v6 BOOLValue] & 1) == 0 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v5 authenticationDidFallbackToPasscode:self];
    }
    uint64_t v8 = [v11 objectForKeyedSubscript:&unk_1EFBDEF50];
    id v9 = v8;
    if (v8)
    {
      switch([v8 integerValue])
      {
        case 0:
          if (self->_fingerDetectRequired && (objc_opt_respondsToSelector() & 1) != 0) {
            [v5 authenticationDidEncounterFingerOn:self];
          }
          break;
        case 1:
          if (objc_opt_respondsToSelector()) {
            [v5 authenticationDidEncounterFingerOff:self];
          }
          break;
        case 2:
          self->_matchFound = 1;
          self->_numberOfBiometricAuthenticationFailures = 0;
          break;
        case 3:
          self->_matchFound = 0;
          unint64_t v10 = self->_numberOfBiometricAuthenticationFailures + 1;
          self->_numberOfBiometricAuthenticationFailures = v10;
          if (v10 == 2 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v5 authenticationShowOptionForPasscodeFallback:self];
          }
          break;
        case 4:
          if (objc_opt_respondsToSelector()) {
            [v5 authenticationDidEncounterMatchMiss:self completion:0];
          }
          break;
        case 5:
          self->_fingerDetectRequired = 1;
          if (objc_opt_respondsToSelector()) {
            [v5 authenticationDidBeginFingerDetection:self];
          }
          break;
        default:
          break;
      }
    }

    id v4 = v11;
  }
}

- (NSData)externalizedContext
{
  return (NSData *)[(LAContext *)self->_context externalizedContext];
}

- (_SFAuthenticationContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFAuthenticationContextDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientsAwaitingAuthenticationToCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_clientsAwaitingAuthentication, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_currentClientBeingAuthenticated, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end