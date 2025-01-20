@interface AXSSMotionTracker
+ (NSArray)supportedExpressionSensitivitiesAscending;
+ (NSSet)supportedExpressions;
- (AXSSMotionTracker)init;
- (AXSSMotionTrackerDelegate)delegate;
- (AXSSMotionTrackingDaemonProtocol)_motionTrackingDaemon;
- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration;
- (AXSSMotionTrackingInputConfiguration)inputConfiguration;
- (AXSSMotionTrackingState)state;
- (AXSSRateLimitingLogger)_loggingRateLimiter;
- (BOOL)_hasBeenStarted;
- (BOOL)_tracking;
- (BOOL)debugOverlayEnabled;
- (BOOL)isTracking;
- (NSValue)lookAtPoint;
- (NSXPCConnection)_motionTrackingDaemonConnection;
- (double)joystickModeMovementThreshold;
- (double)sensitivity;
- (unint64_t)motionTrackingMode;
- (void)_changeState:(id)a3;
- (void)_motionTrackingDaemonWasInterruptedFromXPC;
- (void)_updateState:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)motionTrackingDaemonUpdatedState:(id)a3;
- (void)recalibrateFace;
- (void)setDebugOverlayEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressionConfiguration:(id)a3;
- (void)setInputConfiguration:(id)a3;
- (void)setJoystickModeMovementThreshold:(double)a3;
- (void)setLookAtPoint:(id)a3;
- (void)setMotionTrackingMode:(unint64_t)a3;
- (void)setSensitivity:(double)a3;
- (void)setState:(id)a3;
- (void)set_hasBeenStarted:(BOOL)a3;
- (void)set_loggingRateLimiter:(id)a3;
- (void)set_motionTrackingDaemonConnection:(id)a3;
- (void)set_tracking:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation AXSSMotionTracker

- (AXSSMotionTracker)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXSSMotionTracker;
  v2 = [(AXSSMotionTracker *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_motionTrackingMode = AXSSMotionTrackingDefaultMode;
    uint64_t v4 = AXSSMotionTrackingDefaultJoystickModeMovementThreshold;
    *(void *)&v2->_sensitivity = AXSSMotionTrackingDefaultSensitivity;
    *(void *)&v2->_joystickModeMovementThreshold = v4;
    uint64_t v5 = +[AXSSMotionTrackingExpressionConfiguration defaultExpressionConfiguration];
    expressionConfiguration = v3->_expressionConfiguration;
    v3->_expressionConfiguration = (AXSSMotionTrackingExpressionConfiguration *)v5;

    v7 = [AXSSRateLimitingLogger alloc];
    v8 = AXSSLogForCategory(2);
    uint64_t v9 = [(AXSSRateLimitingLogger *)v7 initWithLogLevel:1 categoryLog:v8 timeInterval:1.0];
    loggingRateLimiter = v3->__loggingRateLimiter;
    v3->__loggingRateLimiter = (AXSSRateLimitingLogger *)v9;
  }
  return v3;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "AXSSMotionTracker: dealloc", v2, v3, v4, v5, v6);
}

- (BOOL)_hasBeenStarted
{
  uint64_t v2 = [(AXSSMotionTracker *)self _motionTrackingDaemonConnection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isTracking
{
  BOOL v3 = [(AXSSMotionTracker *)self _hasBeenStarted];
  if (v3)
  {
    LOBYTE(v3) = [(AXSSMotionTracker *)self _tracking];
  }
  return v3;
}

- (void)start
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "AXSSMotionTracker: start", v2, v3, v4, v5, v6);
}

void __26__AXSSMotionTracker_start__block_invoke()
{
  v0 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1B3B9D000, v0, OS_LOG_TYPE_INFO, "AXSSMotionTracker: connection invalidated", v1, 2u);
  }
}

void __26__AXSSMotionTracker_start__block_invoke_29(uint64_t a1)
{
  uint64_t v2 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1B3B9D000, v2, OS_LOG_TYPE_INFO, "AXSSMotionTracker: connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _motionTrackingDaemonWasInterruptedFromXPC];
  [WeakRetained invalidate];
  [WeakRetained stop];
}

- (void)stop
{
  uint64_t v3 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_INFO, "AXSSMotionTracker: stop", v5, 2u);
  }

  if ([(AXSSMotionTracker *)self _hasBeenStarted])
  {
    if ([(AXSSMotionTracker *)self _tracking])
    {
      uint64_t v4 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v4 stopTracking];

      [(AXSSMotionTracker *)self set_tracking:0];
      [(AXSSMotionTracker *)self _changeState:0];
    }
  }
}

- (void)invalidate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "AXSSMotionTracker: invalidate:", v2, v3, v4, v5, v6);
}

- (void)recalibrateFace
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1B3B9D000, v0, v1, "AXSSMotionTracker: recalibrateFace:", v2, v3, v4, v5, v6);
}

- (void)setDebugOverlayEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_debugOverlayEnabled != a3)
  {
    BOOL v3 = a3;
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1B3B9D000, v5, OS_LOG_TYPE_INFO, "AXSSMotionTracker:setDebugOverlayEnabled: %d", (uint8_t *)v8, 8u);
    }

    self->_debugOverlayEnabled = v3;
    if ([(AXSSMotionTracker *)self _tracking])
    {
      uint8_t v6 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      v7 = v6;
      if (v3) {
        [v6 showDebugOverlay];
      }
      else {
        [v6 hideDebugOverlay];
      }
    }
  }
}

+ (NSSet)supportedExpressions
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0C670B0];
}

+ (NSArray)supportedExpressionSensitivitiesAscending
{
  return (NSArray *)&unk_1F0C670C8;
}

- (void)setMotionTrackingMode:(unint64_t)a3
{
  if (self->_motionTrackingMode != a3)
  {
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTracker setMotionTrackingMode:](a3, v5, v6, v7, v8, v9, v10, v11);
    }

    self->_motionTrackingMode = a3;
    if ([(AXSSMotionTracker *)self _tracking])
    {
      objc_super v12 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v12 setMotionTrackingMode:a3];
    }
  }
}

- (unint64_t)motionTrackingMode
{
  return self->_motionTrackingMode;
}

- (void)setSensitivity:(double)a3
{
  if (vabdd_f64(self->_sensitivity, a3) > 2.22044605e-16)
  {
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTracker setSensitivity:](v5, v6, v7, v8, v9, v10, v11, v12);
    }

    self->_sensitivity = a3;
    if ([(AXSSMotionTracker *)self _tracking])
    {
      v13 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v13 setSensitivity:a3];
    }
  }
}

- (AXSSMotionTrackingInputConfiguration)inputConfiguration
{
  uint64_t v2 = (void *)[(AXSSMotionTrackingInputConfiguration *)self->_inputConfiguration copy];

  return (AXSSMotionTrackingInputConfiguration *)v2;
}

- (void)setInputConfiguration:(id)a3
{
  id v4 = a3;
  if (![(AXSSMotionTrackingInputConfiguration *)self->_inputConfiguration isEqual:v4])
  {
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTracker setInputConfiguration:]((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    uint64_t v12 = (AXSSMotionTrackingInputConfiguration *)[v4 copy];
    inputConfiguration = self->_inputConfiguration;
    self->_inputConfiguration = v12;

    if ([(AXSSMotionTracker *)self _tracking])
    {
      v14 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v14 setInputConfiguration:v4];
    }
  }
}

- (AXSSMotionTrackingExpressionConfiguration)expressionConfiguration
{
  uint64_t v2 = (void *)[(AXSSMotionTrackingExpressionConfiguration *)self->_expressionConfiguration copy];

  return (AXSSMotionTrackingExpressionConfiguration *)v2;
}

- (void)setExpressionConfiguration:(id)a3
{
  id v4 = a3;
  if (![(AXSSMotionTrackingExpressionConfiguration *)self->_expressionConfiguration isEqual:v4])
  {
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTracker setExpressionConfiguration:]((uint64_t)v4, v5);
    }

    uint64_t v6 = (AXSSMotionTrackingExpressionConfiguration *)[v4 copy];
    expressionConfiguration = self->_expressionConfiguration;
    self->_expressionConfiguration = v6;

    if ([(AXSSMotionTracker *)self _tracking])
    {
      uint64_t v8 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v8 setExpressionConfiguration:v4];
    }
  }
}

- (void)setJoystickModeMovementThreshold:(double)a3
{
  if (vabdd_f64(self->_joystickModeMovementThreshold, a3) > 2.22044605e-16)
  {
    uint64_t v5 = AXSSLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[AXSSMotionTracker setJoystickModeMovementThreshold:](v5, v6, v7, v8, v9, v10, v11, v12);
    }

    self->_joystickModeMovementThreshold = a3;
    if ([(AXSSMotionTracker *)self _tracking])
    {
      v13 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
      [v13 setJoystickModeMovementThreshold:a3];
    }
  }
}

- (void)setLookAtPoint:(id)a3
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v4 = [(AXSSMotionTracker *)self state];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [(AXSSMotionTracker *)self state];
      uint64_t v7 = [v6 error];

      if (!v7)
      {
        uint64_t v8 = [(AXSSMotionTracker *)self state];
        uint64_t v9 = (void *)[v8 copy];

        [v11 pointValue];
        objc_msgSend(v9, "setLookAtPoint:");
        [(AXSSMotionTracker *)self _updateState:v9];
        if ([(AXSSMotionTracker *)self _tracking])
        {
          uint64_t v10 = [(AXSSMotionTracker *)self _motionTrackingDaemon];
          [v11 pointValue];
          objc_msgSend(v10, "setLookAtPoint:");
        }
      }
    }
  }
}

- (NSValue)lookAtPoint
{
  BOOL v3 = [(AXSSMotionTracker *)self state];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F29238];
    uint64_t v5 = [(AXSSMotionTracker *)self state];
    [v5 lookAtPoint];
    v10[0] = v6;
    v10[1] = v7;
    uint64_t v8 = [v4 valueWithBytes:v10 objCType:"{CGPoint=dd}"];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSValue *)v8;
}

- (void)_updateState:(id)a3
{
  [(AXSSMotionTracker *)self setState:a3];
  id v5 = [(AXSSMotionTracker *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(AXSSMotionTracker *)self state];
    [v5 motionTracker:self updatedState:v4];
  }
}

- (void)_changeState:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__AXSSMotionTracker__changeState___block_invoke;
    v6[3] = &unk_1E606C9A0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __34__AXSSMotionTracker__changeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState:*(void *)(a1 + 40)];
}

- (AXSSMotionTrackingDaemonProtocol)_motionTrackingDaemon
{
  uint64_t v2 = [(AXSSMotionTracker *)self _motionTrackingDaemonConnection];
  BOOL v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_58];

  return (AXSSMotionTrackingDaemonProtocol *)v3;
}

void __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)_motionTrackingDaemonWasInterruptedFromXPC
{
  BOOL v3 = AXSSLogForCategory(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_INFO, "AXSSMotionTracker: _motionTrackingDaemonWasInterruptedFromXPC", v6, 2u);
  }

  id v4 = objc_alloc_init(AXSSMotionTrackingState);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"AXSSMotionTrackingErrorDomain" code:9 userInfo:0];
  [(AXSSMotionTrackingState *)v4 setError:v5];

  [(AXSSMotionTracker *)self _changeState:v4];
}

- (void)motionTrackingDaemonUpdatedState:(id)a3
{
  id v6 = a3;
  id v4 = [NSString stringWithFormat:@"%s: motionTrackingDaemonUpdatedState %@", "-[AXSSMotionTracker motionTrackingDaemonUpdatedState:]", v6];
  id v5 = [(AXSSMotionTracker *)self _loggingRateLimiter];
  [v5 logString:v4];

  if (v6) {
    [(AXSSMotionTracker *)self _changeState:v6];
  }
}

- (double)sensitivity
{
  return self->_sensitivity;
}

- (double)joystickModeMovementThreshold
{
  return self->_joystickModeMovementThreshold;
}

- (BOOL)debugOverlayEnabled
{
  return self->_debugOverlayEnabled;
}

- (AXSSMotionTrackingState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (AXSSMotionTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSSMotionTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)_motionTrackingDaemonConnection
{
  return self->__motionTrackingDaemonConnection;
}

- (void)set_motionTrackingDaemonConnection:(id)a3
{
}

- (BOOL)_tracking
{
  return self->__tracking;
}

- (void)set_tracking:(BOOL)a3
{
  self->__tracking = a3;
}

- (void)set_hasBeenStarted:(BOOL)a3
{
  self->__hasBeenStarted = a3;
}

- (AXSSRateLimitingLogger)_loggingRateLimiter
{
  return self->__loggingRateLimiter;
}

- (void)set_loggingRateLimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__loggingRateLimiter, 0);
  objc_storeStrong((id *)&self->__motionTrackingDaemonConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_expressionConfiguration, 0);

  objc_storeStrong((id *)&self->_inputConfiguration, 0);
}

- (void)setMotionTrackingMode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSensitivity:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setInputConfiguration:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setExpressionConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  BOOL v3 = "-[AXSSMotionTracker setExpressionConfiguration:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
}

- (void)setJoystickModeMovementThreshold:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __42__AXSSMotionTracker__motionTrackingDaemon__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_ERROR, "ERROR: XPC connection returned error for remote object proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end