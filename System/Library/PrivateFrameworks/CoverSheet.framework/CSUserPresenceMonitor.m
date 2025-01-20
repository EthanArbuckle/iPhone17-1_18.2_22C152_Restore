@interface CSUserPresenceMonitor
+ (void)synthesizeUserPresenceForReason:(id)a3;
- (BOOL)_handleBiometricEvent:(unint64_t)a3;
- (BOOL)_isFaceDetectPermitted;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isDetectionEnabled;
- (BOOL)isUserPresenceDetectionSupported;
- (BOOL)userPresenceDetectedSinceWake;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3;
- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3 attentionAwarenessClient:(id)a4;
- (void)_cancelPollForAttention;
- (void)_configureAttentionAwarenessClient;
- (void)_handleAttentionAwarenessEvent:(id)a3;
- (void)_monitorForInjectedUserPresence;
- (void)_pollForAttention;
- (void)_resumeAttentionAwarenessClient;
- (void)_setUserPresenceDetectedSinceWake:(BOOL)a3;
- (void)_suspendAttentionAwarenessClient;
- (void)_updateFaceDetectionState;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)disableDetectionForReason:(id)a3;
- (void)enableDetectionForReason:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CSUserPresenceMonitor

- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4E700];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(CSUserPresenceMonitor *)self initWithBiometricResource:v5 attentionAwarenessClient:v6];

  return v7;
}

- (CSUserPresenceMonitor)initWithBiometricResource:(id)a3 attentionAwarenessClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSUserPresenceMonitor;
  v9 = [(CSUserPresenceMonitor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometricResource, a3);
    objc_storeStrong((id *)&v10->_attentionAwarenessClient, a4);
    [(CSUserPresenceMonitor *)v10 _monitorForInjectedUserPresence];
    [(CSUserPresenceMonitor *)v10 _configureAttentionAwarenessClient];
  }

  return v10;
}

- (void)_monitorForInjectedUserPresence
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = [MEMORY[0x1E4F28F08] mainQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CSUserPresenceMonitor__monitorForInjectedUserPresence__block_invoke;
  v6[3] = &unk_1E6ADAA80;
  v6[4] = self;
  id v5 = (id)[v3 addObserverForName:@"cs-inject-user-presence" object:0 queue:v4 usingBlock:v6];
}

void __56__CSUserPresenceMonitor__monitorForInjectedUserPresence__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 userInfo];
    id v6 = [v5 valueForKey:@"reason"];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Injecting fake user presence with reason %@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) _setUserPresenceDetectedSinceWake:1];
}

- (void)dealloc
{
  [(AWAttentionAwarenessClient *)self->_attentionAwarenessClient invalidateWithError:0];
  attentionAwarenessClient = self->_attentionAwarenessClient;
  self->_attentionAwarenessClient = 0;

  v4.receiver = self;
  v4.super_class = (Class)CSUserPresenceMonitor;
  [(CSUserPresenceMonitor *)&v4 dealloc];
}

- (void)enableDetectionForReason:(id)a3
{
  id v4 = a3;
  activationReasons = self->_activationReasons;
  id v8 = v4;
  if (!activationReasons)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    int v7 = self->_activationReasons;
    self->_activationReasons = v6;

    id v4 = v8;
    activationReasons = self->_activationReasons;
  }
  [(NSMutableSet *)activationReasons addObject:v4];
  [(CSUserPresenceMonitor *)self _updateFaceDetectionState];
}

- (void)disableDetectionForReason:(id)a3
{
  [(NSMutableSet *)self->_activationReasons removeObject:a3];

  [(CSUserPresenceMonitor *)self _updateFaceDetectionState];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)isUserPresenceDetectionSupported
{
  return [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
}

- (BOOL)isDetectionEnabled
{
  return [(NSMutableSet *)self->_activationReasons count] != 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 <= 10)
  {
    if (v5 == 5)
    {
      [(CSUserPresenceMonitor *)self _setUserPresenceDetectedSinceWake:1];
    }
    else
    {
      if (v5 != 10) {
        goto LABEL_14;
      }
      self->_coverSheetResignedActive = 1;
    }
LABEL_13:
    [(CSUserPresenceMonitor *)self _updateFaceDetectionState];
    goto LABEL_14;
  }
  switch(v5)
  {
    case 11:
      self->_coverSheetResignedActive = 0;
      goto LABEL_13;
    case 25:
      [(CSUserPresenceMonitor *)self _setUserPresenceDetectedSinceWake:0];
      [(CSUserPresenceMonitor *)self _cancelPollForAttention];
      goto LABEL_13;
    case 15:
      id v6 = [v4 value];
      BOOL v7 = -[CSUserPresenceMonitor _handleBiometricEvent:](self, "_handleBiometricEvent:", [v6 unsignedIntegerValue]);

      if (v7) {
        goto LABEL_13;
      }
      break;
  }
LABEL_14:

  return 0;
}

- (void)_setUserPresenceDetectedSinceWake:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_userPresenceDetectedSinceWake != a3)
  {
    self->_userPresenceDetectedSinceWake = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_observers;
    uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "userPresenceDetectedSinceWakeDidChange:", self, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_handleBiometricEvent:(unint64_t)a3
{
  if (a3 == 13)
  {
    uint64_t v5 = SBLogDashBoard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Face in view", v7, 2u);
    }

    [(CSUserPresenceMonitor *)self _setUserPresenceDetectedSinceWake:1];
  }
  return a3 == 13;
}

- (BOOL)_isFaceDetectPermitted
{
  return ([(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled] & 1) != 0|| _AXSAttentionAwarenessFeaturesEnabled() != 0;
}

- (void)_configureAttentionAwarenessClient
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4E708]);
  [v3 setIdentifier:@"com.apple.SpringBoard.CoverSheetUserPresenceMonitor"];
  [v3 setEventMask:128];
  [(AWAttentionAwarenessClient *)self->_attentionAwarenessClient setConfiguration:v3];
}

- (void)_pollForAttention
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1D839D000, v0, v1, "[User Presence Monitor] Failed polling for attention with error: %@", v2, v3, v4, v5, v6);
}

void __42__CSUserPresenceMonitor__pollForAttention__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleAttentionAwarenessEvent:v6];
  }
}

- (void)_cancelPollForAttention
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1D839D000, v0, v1, "[User Presence Monitor] Failed to cancel poll for attention with error: %@", v2, v3, v4, v5, v6);
}

- (void)_resumeAttentionAwarenessClient
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1D839D000, v0, v1, "[User Presence Monitor] Cannot resume attention awareness client with error: %@", v2, v3, v4, v5, v6);
}

- (void)_suspendAttentionAwarenessClient
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_7(&dword_1D839D000, v0, v1, "[User Presence Monitor] Cannot suspend attention awareness client with error: %@", v2, v3, v4, v5, v6);
}

- (void)_handleAttentionAwarenessEvent:(id)a3
{
  id v4 = a3;
  if (([v4 eventMask] & 0x80) != 0)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v5 = (uint64_t)v6;
      }
      else {
        uint64_t v5 = 0;
      }
    }

    if (v5)
    {
      uint64_t v7 = SBLogDashBoard();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Did receive face detect event", v8, 2u);
      }

      [(CSUserPresenceMonitor *)self _setUserPresenceDetectedSinceWake:1];
    }
  }
}

- (void)_updateFaceDetectionState
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSUserPresenceMonitor *)self isUserPresenceDetectionSupported];
  BOOL v4 = [(CSUserPresenceMonitor *)self _isFaceDetectPermitted];
  BOOL v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4) {
    BOOL v6 = !self->_userPresenceDetectedSinceWake
  }
      && !self->_coverSheetResignedActive
      && [(NSMutableSet *)self->_activationReasons count] != 0;
  uint64_t v7 = SBLogDashBoard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL userPresenceDetectedSinceWake = self->_userPresenceDetectedSinceWake;
    BOOL coverSheetResignedActive = self->_coverSheetResignedActive;
    activationReasons = self->_activationReasons;
    v13[0] = 67110402;
    v13[1] = v3;
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    BOOL v17 = userPresenceDetectedSinceWake;
    __int16 v18 = 1024;
    BOOL v19 = coverSheetResignedActive;
    __int16 v20 = 2112;
    v21 = activationReasons;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Evaluate face detection enablement [ available: %{BOOL}d allowed: %{BOOL}d detected: %{BOOL}d resignedActive: %{BOOL}d reasons: %@ ] result: %{BOOL}d", (uint8_t *)v13, 0x2Au);
  }

  if (v6)
  {
    long long v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Polling for attention", (uint8_t *)v13, 2u);
    }

    [(CSUserPresenceMonitor *)self _pollForAttention];
    [(CSUserPresenceMonitor *)self _resumeAttentionAwarenessClient];
  }
  else if (self->_attentionAwarenessClient)
  {
    long long v12 = SBLogDashBoard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[User Presence Monitor] Cancelling poll for attention", (uint8_t *)v13, 2u);
    }

    [(CSUserPresenceMonitor *)self _cancelPollForAttention];
    [(CSUserPresenceMonitor *)self _suspendAttentionAwarenessClient];
  }
}

- (BOOL)userPresenceDetectedSinceWake
{
  return self->_userPresenceDetectedSinceWake;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attentionAwarenessClient, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activationReasons, 0);

  objc_storeStrong((id *)&self->_biometricResource, 0);
}

+ (void)synthesizeUserPresenceForReason:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v6 = objc_alloc_init(v3);
  [v6 setValue:v4 forKey:@"reason"];

  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"cs-inject-user-presence" object:0 userInfo:v6];
}

@end