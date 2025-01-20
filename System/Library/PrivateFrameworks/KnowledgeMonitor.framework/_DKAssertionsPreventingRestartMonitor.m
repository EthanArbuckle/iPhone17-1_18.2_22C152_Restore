@interface _DKAssertionsPreventingRestartMonitor
+ (id)entitlements;
+ (id)eventStream;
- (BOOL)areAssertionsPreventingRestart;
- (BOOL)lastPreventingRestartAssertionsStatus;
- (id)loadState;
- (int)preventIdleSleepAssertionsToken;
- (int)restartPreventerAssertionsToken;
- (int)systemAssertionsToken;
- (int)userspaceAssertionsToken;
- (void)deactivate;
- (void)dealloc;
- (void)setLastPreventingRestartAssertionsStatus:(BOOL)a3;
- (void)setPreventIdleSleepAssertionsToken:(int)a3;
- (void)setRestartPreventerAssertionsToken:(int)a3;
- (void)setSystemAssertionsToken:(int)a3;
- (void)setUserspaceAssertionsToken:(int)a3;
- (void)start;
- (void)stop;
- (void)synchronouslyReflectCurrentValue;
@end

@implementation _DKAssertionsPreventingRestartMonitor

- (void)dealloc
{
  [(_DKAssertionsPreventingRestartMonitor *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  [(_DKMonitor *)&v3 dealloc];
}

+ (id)eventStream
{
  return @"AssertionsPreventingRestartMonitor";
}

+ (id)entitlements
{
  return 0;
}

- (id)loadState
{
  return 0;
}

- (void)start
{
  v13.receiver = self;
  v13.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  if ([(_DKMonitor *)&v13 instantMonitorNeedsActivation])
  {
    objc_super v3 = [(_DKMonitor *)self queue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke;
    handler[3] = &unk_264714B68;
    handler[4] = self;
    notify_register_dispatch("com.apple.powermanagement.idlesleeppreventers", &self->_preventIdleSleepAssertionsToken, v3, handler);

    v4 = [(_DKMonitor *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke_2;
    v11[3] = &unk_264714B68;
    v11[4] = self;
    notify_register_dispatch("com.apple.powermanagement.systemsleeppreventers", &self->_systemAssertionsToken, v4, v11);

    v5 = [(_DKMonitor *)self queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __46___DKAssertionsPreventingRestartMonitor_start__block_invoke_3;
    v10[3] = &unk_264714B68;
    v10[4] = self;
    notify_register_dispatch("com.apple.powermanagement.restartpreventers", &self->_restartPreventerAssertionsToken, v5, v10);

    BOOL v6 = [(_DKAssertionsPreventingRestartMonitor *)self areAssertionsPreventingRestart];
    v7 = [NSNumber numberWithBool:v6];
    v8 = [MEMORY[0x263F351B8] userContext];
    v9 = [MEMORY[0x263F351D0] keyPathForDeviceAssertionsHeldStatus];
    [v8 setObject:v7 forKeyedSubscript:v9];

    self->_lastPreventingRestartAssertionsStatus = v6;
  }
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)_DKAssertionsPreventingRestartMonitor;
  if ([(_DKMonitor *)&v3 instantMonitorNeedsDeactivation]) {
    [(_DKAssertionsPreventingRestartMonitor *)self deactivate];
  }
}

- (void)deactivate
{
  notify_cancel(self->_userspaceAssertionsToken);
  IOPMAssertionNotify();
  notify_cancel(self->_preventIdleSleepAssertionsToken);
  int systemAssertionsToken = self->_systemAssertionsToken;
  notify_cancel(systemAssertionsToken);
}

- (BOOL)areAssertionsPreventingRestart
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t state64 = 0;
  notify_get_state(self->_systemAssertionsToken, &state64);
  if (!state64)
  {
    CFTypeRef cf = 0;
    notify_get_state(self->_preventIdleSleepAssertionsToken, (uint64_t *)&cf);
    if (cf)
    {
      v4 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v25 = (uint64_t)cf;
        _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_DEFAULT, "Idle Sleep Preventers Count: %llu", buf, 0xCu);
      }

      IOPMCopySleepPreventersList();
    }
    CFTypeRef v20 = 0;
    int restarted = IOPMCopyDeviceRestartPreventers();
    if (restarted)
    {
      int v7 = restarted;
      v8 = [MEMORY[0x263F34FB8] contextChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v7;
        _os_log_impl(&dword_225002000, v8, OS_LOG_TYPE_DEFAULT, "Unable to determine restart preventers (Ret=%d)", buf, 8u);
      }
    }
    else
    {
      if (![(id)v20 count])
      {
        BOOL v5 = 0;
        goto LABEL_23;
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      v8 = 0;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_super v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:@"AssertName"];
            v14 = [MEMORY[0x263F34FB8] contextChannel];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v25 = (uint64_t)v13;
              _os_log_impl(&dword_225002000, v14, OS_LOG_TYPE_DEFAULT, "Restart preventer: %@", buf, 0xCu);
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
        }
        while (v10);
      }
    }

    BOOL v5 = 1;
LABEL_23:

    return v5;
  }
  objc_super v3 = [MEMORY[0x263F34FB8] contextChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = state64;
    _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_DEFAULT, "System Sleep Preventers Count: %llu", buf, 0xCu);
  }

  IOPMCopySleepPreventersList();
  return 1;
}

- (void)synchronouslyReflectCurrentValue
{
  BOOL v3 = [(_DKAssertionsPreventingRestartMonitor *)self areAssertionsPreventingRestart];
  if (self->_lastPreventingRestartAssertionsStatus != v3)
  {
    BOOL v4 = v3;
    BOOL v5 = [NSNumber numberWithBool:v3];
    BOOL v6 = [MEMORY[0x263F351B8] userContext];
    int v7 = [MEMORY[0x263F351D0] keyPathForDeviceAssertionsHeldStatus];
    [v6 setObject:v5 forKeyedSubscript:v7];

    self->_lastPreventingRestartAssertionsStatus = v4;
  }
}

- (int)userspaceAssertionsToken
{
  return self->_userspaceAssertionsToken;
}

- (void)setUserspaceAssertionsToken:(int)a3
{
  self->_userspaceAssertionsToken = a3;
}

- (int)preventIdleSleepAssertionsToken
{
  return self->_preventIdleSleepAssertionsToken;
}

- (void)setPreventIdleSleepAssertionsToken:(int)a3
{
  self->_preventIdleSleepAssertionsToken = a3;
}

- (int)systemAssertionsToken
{
  return self->_systemAssertionsToken;
}

- (void)setSystemAssertionsToken:(int)a3
{
  self->_int systemAssertionsToken = a3;
}

- (int)restartPreventerAssertionsToken
{
  return self->_restartPreventerAssertionsToken;
}

- (void)setRestartPreventerAssertionsToken:(int)a3
{
  self->_restartPreventerAssertionsToken = a3;
}

- (BOOL)lastPreventingRestartAssertionsStatus
{
  return self->_lastPreventingRestartAssertionsStatus;
}

- (void)setLastPreventingRestartAssertionsStatus:(BOOL)a3
{
  self->_lastPreventingRestartAssertionsStatus = a3;
}

@end