@interface CKRaiseGesture
+ (BOOL)isRaiseGestureEnabled;
+ (BOOL)isRaiseGestureSupported;
- (BOOL)isEnabled;
- (BOOL)isRecognized;
- (BOOL)proximityState;
- (CKRaiseGesture)initWithTarget:(id)a3 action:(SEL)a4;
- (CMGestureManager)gestureManager;
- (SEL)action;
- (id)target;
- (int64_t)gestureState;
- (void)dealloc;
- (void)proximityStateDidChange:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGestureManager:(id)a3;
- (void)setGestureState:(int64_t)a3;
- (void)setProximityMonitoringEnabled:(BOOL)a3;
- (void)setProximityState:(BOOL)a3;
- (void)setTarget:(id)a3;
@end

@implementation CKRaiseGesture

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(CMGestureManager *)self->_gestureManager setGestureHandler:0];
  id v4 = (id)[(CMGestureManager *)self->_gestureManager gestureHandler];
  int proximityToken = self->proximityToken;
  if (proximityToken) {
    notify_cancel(proximityToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)CKRaiseGesture;
  [(CKRaiseGesture *)&v6 dealloc];
}

+ (BOOL)isRaiseGestureEnabled
{
  int v2 = [a1 isRaiseGestureSupported];
  if (v2) {
    LOBYTE(v2) = CKRaiseToListenEnabled() != 0;
  }
  return v2;
}

+ (BOOL)isRaiseGestureSupported
{
  if (isRaiseGestureSupported_once != -1) {
    dispatch_once(&isRaiseGestureSupported_once, &__block_literal_global_160);
  }
  return isRaiseGestureSupported_isRaiseGestureSupported;
}

void __41__CKRaiseGesture_isRaiseGestureSupported__block_invoke()
{
  if ([MEMORY[0x1E4F22210] isGestureServiceAvailable])
  {
    id v0 = +[CKUIBehavior sharedBehaviors];
    isRaiseGestureSupported_isRaiseGestureSupported = [v0 isProximityMonitoringSupported];
  }
  else
  {
    isRaiseGestureSupported_isRaiseGestureSupported = 0;
  }
}

- (CKRaiseGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKRaiseGesture;
  v7 = [(CKRaiseGesture *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(CKRaiseGesture *)v7 setTarget:v6];
    [(CKRaiseGesture *)v8 setAction:a4];
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel_proximityStateDidChange_ name:*MEMORY[0x1E4F437E0] object:0];
  }
  return v8;
}

- (void)setProximityMonitoringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (setProximityMonitoringEnabled__once != -1) {
    dispatch_once(&setProximityMonitoringEnabled__once, &__block_literal_global_36_0);
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"YES";
      *(void *)&buf[4] = "-[CKRaiseGesture setProximityMonitoringEnabled:]";
      if (setProximityMonitoringEnabled__isExtension) {
        v7 = @"YES";
      }
      else {
        v7 = @"NO";
      }
      *(_DWORD *)buf = 136315650;
      v21 = v7;
      __int16 v20 = 2112;
      if (!v3) {
        id v6 = @"NO";
      }
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s isExtension %@ enabled %@", buf, 0x20u);
    }
  }
  if (setProximityMonitoringEnabled__isExtension)
  {
    if (setProximityMonitoringEnabled___pred_BKSHIDServicesRequestProximityDetectionModeBackBoardServices != -1) {
      dispatch_once(&setProximityMonitoringEnabled___pred_BKSHIDServicesRequestProximityDetectionModeBackBoardServices, &__block_literal_global_50);
    }
    if (!self->proximityToken)
    {
      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      id v8 = MEMORY[0x1E4F14428];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_2;
      v16 = &unk_1E56295C8;
      objc_copyWeak(&v18, (id *)buf);
      v17 = self;
      notify_register_dispatch("com.apple.backboard.proximity.changed", &self->proximityToken, MEMORY[0x1E4F14428], &v13);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    if (v3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode(v9);
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_super v11 = @"NO";
        if (v3) {
          objc_super v11 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Setting backboard ProximityDetectionMode. enabled %@", buf, 0xCu);
      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", v13, v14, v15, v16);
  [v12 setProximityMonitoringEnabled:v3];
}

void __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  id v0 = [v1 bundlePath];
  setProximityMonitoringEnabled__isExtension = [v0 hasSuffix:@".appex"];
}

void *__48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_48()
{
  result = (void *)MEMORY[0x192FBA870]("BKSHIDServicesRequestProximityDetectionMode", @"BackBoardServices");
  setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode = result;
  return result;
}

void __48__CKRaiseGesture_setProximityMonitoringEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), &state64);
    uint64_t v3 = state64;
    [WeakRetained setProximityState:state64 != 0];
    if (!v3)
    {
      if (IMOSLoggingEnabled())
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v6 = 0;
          _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Proximity monitoring disabled because isProxActive was NO.", v6, 2u);
        }
      }
      setProximityMonitoringEnabled___BKSHIDServicesRequestProximityDetectionMode(0);
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
      if (v5)
      {
        notify_cancel(v5);
        *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
      }
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = @"NO";
        if (v3) {
          id v6 = @"YES";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Gesture enabled: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (v3)
    {
      v7 = (objc_class *)MEMORY[0x192FBA860](@"CMGestureManager", @"CoreMotion");
      IMCMGestureManager = (uint64_t)v7;
      if (v7)
      {
        id v8 = (void *)[[v7 alloc] initWithPriority:2];
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v13 = 0x3032000000;
        uint64_t v14 = __Block_byref_object_copy__46;
        v15 = __Block_byref_object_dispose__46;
        v16 = 0;
        uint64_t v9 = self;
        v16 = v9;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __29__CKRaiseGesture_setEnabled___block_invoke;
        v11[3] = &unk_1E56295F0;
        v11[4] = v9;
        v11[5] = &buf;
        [v8 setGestureHandler:v11];
        [(CKRaiseGesture *)v9 setGestureManager:v8];
        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Tearing down proximity monitoring and gesture manager", (uint8_t *)&buf, 2u);
        }
      }
      [(CKRaiseGesture *)self setProximityMonitoringEnabled:0];
      [(CKRaiseGesture *)self setGestureManager:0];
    }
  }
}

void __29__CKRaiseGesture_setEnabled___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Gesture handler triggered, gestureType is %u", (uint8_t *)v8, 8u);
    }
  }
  int v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v5 && [v5 isEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Proximity monitoring is enabled, updating gesture state", (uint8_t *)v8, 2u);
      }
    }
    if (a2 == 1)
    {
      uint64_t v7 = 2;
    }
    else
    {
      if (a2) {
        return;
      }
      [*(id *)(a1 + 32) setProximityMonitoringEnabled:1];
      uint64_t v7 = 1;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGestureState:v7];
  }
}

- (BOOL)isRecognized
{
  if ([(CKRaiseGesture *)self gestureState] != 1) {
    return 0;
  }

  return [(CKRaiseGesture *)self proximityState];
}

- (void)setGestureState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_gestureState != a3)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v13 = 134217984;
        int64_t v14 = a3;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Gesture state changed to %ld", (uint8_t *)&v13, 0xCu);
      }
    }
    BOOL v6 = [(CKRaiseGesture *)self isRecognized];
    self->_gestureState = a3;
    if (v6 != [(CKRaiseGesture *)self isRecognized])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          BOOL v8 = [(CKRaiseGesture *)self isRecognized];
          uint64_t v9 = @"NO";
          if (v8) {
            uint64_t v9 = @"YES";
          }
          int v13 = 138412290;
          int64_t v14 = (int64_t)v9;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Gesture state changed, recognized changed to %@", (uint8_t *)&v13, 0xCu);
        }
      }
      v10 = [MEMORY[0x1E4F42738] sharedApplication];
      objc_super v11 = [(CKRaiseGesture *)self action];
      v12 = [(CKRaiseGesture *)self target];
      [v10 sendAction:v11 to:v12 from:self forEvent:0];
    }
  }
}

- (void)setProximityState:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_proximityState != a3)
  {
    BOOL v3 = a3;
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        BOOL v6 = @"NO";
        if (v3) {
          BOOL v6 = @"YES";
        }
        int v14 = 138412290;
        uint64_t v15 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Proximity state changed to %@", (uint8_t *)&v14, 0xCu);
      }
    }
    BOOL v7 = [(CKRaiseGesture *)self isRecognized];
    self->_proximityState = v3;
    if (v7 != [(CKRaiseGesture *)self isRecognized])
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          BOOL v9 = [(CKRaiseGesture *)self isRecognized];
          v10 = @"NO";
          if (v9) {
            v10 = @"YES";
          }
          int v14 = 138412290;
          uint64_t v15 = v10;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Proximity state changed, recognized changed to %@", (uint8_t *)&v14, 0xCu);
        }
      }
      objc_super v11 = [MEMORY[0x1E4F42738] sharedApplication];
      v12 = [(CKRaiseGesture *)self action];
      int v13 = [(CKRaiseGesture *)self target];
      [v11 sendAction:v12 to:v13 from:self forEvent:0];
    }
  }
}

- (void)proximityStateDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 proximityState];

  [(CKRaiseGesture *)self setProximityState:v6];
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = @"NO";
      if (v6) {
        BOOL v8 = @"YES";
      }
      int v9 = 136315394;
      v10 = "-[CKRaiseGesture proximityStateDidChange:]";
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "%s Proximity state did change to %@", (uint8_t *)&v9, 0x16u);
    }
  }
  if ((v6 & 1) == 0)
  {
    [(CKRaiseGesture *)self setGestureState:0];
    [(CKRaiseGesture *)self setProximityMonitoringEnabled:0];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)gestureState
{
  return self->_gestureState;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_action = v3;
}

- (CMGestureManager)gestureManager
{
  return self->_gestureManager;
}

- (void)setGestureManager:(id)a3
{
}

- (BOOL)proximityState
{
  return self->_proximityState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureManager, 0);

  objc_destroyWeak(&self->_target);
}

@end