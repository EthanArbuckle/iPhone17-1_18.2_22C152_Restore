@interface ASDTPMAction
- (ASDTPMAction)initWithConfig:(id)a3 forSequencer:(id)a4;
- (BOOL)asdtHandlesPowerTransition:(int)a3;
- (BOOL)once;
- (NSCondition)condition;
- (int)action;
- (int)actionResult;
- (int)actionState;
- (int)asdtPowerStateChange:(int)a3;
- (int)backgroundTransition;
- (int)executeAction:(unsigned int)a3;
- (int)executeTransition;
- (int)waitForCompletion:(unsigned int)a3;
- (unsigned)actionIteration;
- (void)action;
- (void)executeInBackground;
- (void)setActionIteration:(unsigned int)a3;
- (void)setActionResult:(int)a3;
- (void)setActionState:(int)a3;
- (void)setBackgroundTransition:(int)a3;
- (void)setCondition:(id)a3;
- (void)setExecuteTransition:(int)a3;
- (void)setName:(id)a3;
- (void)setOnce:(BOOL)a3;
@end

@implementation ASDTPMAction

- (ASDTPMAction)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDTPMAction;
  v7 = [(ASDTPMDevice *)&v14 initWithConfig:v6 forSequencer:a4];
  v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  [(ASDTPMAction *)v7 setActionState:1768189029];
  id v9 = objc_alloc_init(MEMORY[0x263F08740]);
  [(ASDTPMAction *)v8 setCondition:v9];

  v10 = [(ASDTPMAction *)v8 condition];

  if (!v10)
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMAction initWithConfig:forSequencer:](v8);
    }
    goto LABEL_10;
  }
  [(ASDTPMDevice *)v8 setPmNoStateChangeOnFailure:1];
  -[ASDTPMAction setExecuteTransition:](v8, "setExecuteTransition:", [v6 asdtPMActionExecuteTransition]);
  if (![(ASDTPMAction *)v8 executeTransition])
  {
    v12 = ASDTBaseLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASDTPMAction initWithConfig:forSequencer:](v8, v12);
    }
LABEL_10:

    v11 = 0;
    goto LABEL_11;
  }
  -[ASDTPMAction setBackgroundTransition:](v8, "setBackgroundTransition:", [v6 asdtPMActionBackgroundTransition]);
  -[ASDTPMAction setOnce:](v8, "setOnce:", [v6 asdtPMActionOnce]);
LABEL_5:
  v11 = v8;
LABEL_11:

  return v11;
}

- (void)setName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDTPMAction;
  id v4 = a3;
  [(ASDTPMDevice *)&v7 setName:v4];
  v5 = [NSString stringWithFormat:@"%s.%@.cond", "com.apple.AudioServerDriverTransports", v4, v7.receiver, v7.super_class];

  id v6 = [(ASDTPMAction *)self condition];
  [v6 setName:v5];
}

- (int)executeAction:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  LODWORD(v5) = 2003329396;
  if ([(ASDTPMAction *)self actionState] == 1920298606
    && [(ASDTPMAction *)self actionIteration] == a3)
  {
    id v6 = [(ASDTPMAction *)self condition];
    [v6 unlock];

    objc_super v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(ASDTPMAction *)self executeAction:v7];
    }

    uint64_t v5 = [(ASDTPMAction *)self action];
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = [(ASDTPMDevice *)self name];
      int v13 = 138412802;
      objc_super v14 = v12;
      __int16 v15 = 1024;
      unsigned int v16 = a3;
      __int16 v17 = 1024;
      int v18 = v5;
      _os_log_debug_impl(&dword_2489BC000, v8, OS_LOG_TYPE_DEBUG, "%@: Action iteration %u completed with result: %x", (uint8_t *)&v13, 0x18u);
    }
    id v9 = [(ASDTPMAction *)self condition];
    [v9 lock];

    if ([(ASDTPMAction *)self actionState] == 1920298606
      && [(ASDTPMAction *)self actionIteration] == a3)
    {
      [(ASDTPMAction *)self setActionResult:v5];
      [(ASDTPMAction *)self setActionState:1685024357];
      v10 = [(ASDTPMAction *)self condition];
      [v10 broadcast];
    }
  }
  return v5;
}

- (void)executeInBackground
{
  objc_initWeak(&location, self);
  [(ASDTPMAction *)self setActionState:1920298606];
  [(ASDTPMAction *)self setActionIteration:[(ASDTPMAction *)self actionIteration] + 1];
  unsigned int v3 = [(ASDTPMAction *)self actionIteration];
  id v4 = [(ASDTPMDevice *)self parentSequencer];
  uint64_t v5 = [v4 pmConcurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDTPMAction_executeInBackground__block_invoke;
  block[3] = &unk_265243DB8;
  objc_copyWeak(&v7, &location);
  unsigned int v8 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__ASDTPMAction_executeInBackground__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained condition];
  [v2 lock];

  [WeakRetained executeAction:*(unsigned int *)(a1 + 40)];
  unsigned int v3 = [WeakRetained condition];
  [v3 unlock];
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  if ([(ASDTPMAction *)self executeTransition] == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [(ASDTPMAction *)self backgroundTransition];
    if (v5) {
      LOBYTE(v5) = [(ASDTPMAction *)self backgroundTransition] == a3;
    }
  }
  return v5;
}

- (int)asdtPowerStateChange:(int)a3
{
  if ([(ASDTPMAction *)self backgroundTransition])
  {
    int v5 = [(ASDTPMAction *)self condition];
    [v5 lock];

    int v6 = [(ASDTPMAction *)self actionState];
    if (v6 != 1685024357)
    {
      if (v6 != 1920298606)
      {
        if (v6 != 1768189029 || [(ASDTPMAction *)self backgroundTransition] != a3) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      if ([(ASDTPMAction *)self executeTransition] != a3)
      {
        if ((asdtPowerTransitionsInOrder(a3, [(ASDTPMAction *)self executeTransition]) & 1) == 0) {
          [(ASDTPMAction *)self setActionState:1768189029];
        }
        goto LABEL_28;
      }
      while ([(ASDTPMAction *)self actionState] == 1920298606)
      {
        v10 = [(ASDTPMAction *)self condition];
        [v10 wait];
      }
      if ([(ASDTPMAction *)self actionState] != 1685024357)
      {
        int v9 = 1852990585;
        goto LABEL_29;
      }
    }
    if ([(ASDTPMAction *)self executeTransition] != a3)
    {
      if ([(ASDTPMAction *)self backgroundTransition] != a3
        || [(ASDTPMAction *)self once] && ![(ASDTPMAction *)self actionResult])
      {
        goto LABEL_28;
      }
LABEL_27:
      [(ASDTPMAction *)self executeInBackground];
LABEL_28:
      int v9 = 0;
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  if ([(ASDTPMAction *)self executeTransition] == a3)
  {
    id v7 = [(ASDTPMAction *)self condition];
    [v7 lock];

    if ([(ASDTPMAction *)self actionState] == 1768189029
      || [(ASDTPMAction *)self actionState] == 1685024357
      && (![(ASDTPMAction *)self once] || [(ASDTPMAction *)self actionResult]))
    {
      [(ASDTPMAction *)self setActionState:1920298606];
      [(ASDTPMAction *)self setActionIteration:[(ASDTPMAction *)self actionIteration] + 1];
      int v8 = [(ASDTPMAction *)self executeAction:[(ASDTPMAction *)self actionIteration]];
LABEL_23:
      int v9 = v8;
LABEL_29:
      v11 = [(ASDTPMAction *)self condition];
      [v11 unlock];

      return v9;
    }
LABEL_22:
    int v8 = [(ASDTPMAction *)self actionResult];
    goto LABEL_23;
  }
  return 0;
}

- (int)waitForCompletion:(unsigned int)a3
{
  *(void *)&v15[5] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)a3 / 1000000.0];
  }
  else
  {
    id v4 = 0;
  }
  int v5 = [(ASDTPMAction *)self condition];
  [v5 lock];

  if ([(ASDTPMAction *)self actionState] == 1685024357)
  {
LABEL_5:
    int v6 = [(ASDTPMAction *)self actionResult];
    goto LABEL_6;
  }
  while (1)
  {
    v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ASDTPMAction waitForCompletion:](v14, self, v15, v10);
    }

    v11 = [(ASDTPMAction *)self condition];
    v12 = v11;
    if (!v4)
    {
      [v11 wait];

      goto LABEL_15;
    }
    char v13 = [v11 waitUntilDate:v4];

    if ((v13 & 1) == 0) {
      break;
    }
LABEL_15:
    if ([(ASDTPMAction *)self actionState] == 1685024357) {
      goto LABEL_5;
    }
  }
  int v6 = 1852990585;
LABEL_6:
  id v7 = [(ASDTPMAction *)self condition];
  [v7 unlock];

  int v8 = ASDTBaseLogType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ASDTPMAction *)self waitForCompletion:v8];
  }

  return v6;
}

- (int)action
{
  unsigned int v3 = ASDTBaseLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[ASDTPMAction action](self);
  }

  return 2003329396;
}

- (int)executeTransition
{
  return self->_executeTransition;
}

- (void)setExecuteTransition:(int)a3
{
  self->_executeTransition = a3;
}

- (int)backgroundTransition
{
  return self->_backgroundTransition;
}

- (void)setBackgroundTransition:(int)a3
{
  self->_backgroundTransition = a3;
}

- (BOOL)once
{
  return self->_once;
}

- (void)setOnce:(BOOL)a3
{
  self->_once = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (int)actionState
{
  return self->_actionState;
}

- (void)setActionState:(int)a3
{
  self->_actionState = a3;
}

- (int)actionResult
{
  return self->_actionResult;
}

- (void)setActionResult:(int)a3
{
  self->_actionResult = a3;
}

- (unsigned)actionIteration
{
  return self->_actionIteration;
}

- (void)setActionIteration:(unsigned int)a3
{
  self->_actionIteration = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithConfig:(void *)a1 forSequencer:.cold.1(void *a1)
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Memory allocation error.", v4, v5, v6, v7, v8);
}

- (void)initWithConfig:(void *)a1 forSequencer:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  __int16 v6 = 2112;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%@: Bad or missing %@ key.", v5, 0x16u);
}

- (void)executeAction:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_debug_impl(&dword_2489BC000, a3, OS_LOG_TYPE_DEBUG, "%@: Running action, iteration: %u", v6, 0x12u);
}

- (void)waitForCompletion:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  int v9 = BYTE1(a2);
  if (BYTE1(a2) - 32 >= 0x5F) {
    int v9 = v6;
  }
  __int16 v11 = 1024;
  int v12 = a2;
  __int16 v13 = 1024;
  int v14 = v7;
  __int16 v15 = 1024;
  int v16 = v8;
  __int16 v17 = 1024;
  int v18 = v9;
  if (a2 - 32 < 0x5F) {
    int v6 = a2;
  }
  __int16 v19 = 1024;
  int v20 = v6;
  _os_log_debug_impl(&dword_2489BC000, a3, OS_LOG_TYPE_DEBUG, "%@: Wait done; result %x '%c%c%c%c'.", v10, 0x2Au);
}

- (void)waitForCompletion:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_2489BC000, a4, OS_LOG_TYPE_DEBUG, "%@: Waiting for completion.", a1, 0xCu);
}

- (void)action
{
  v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Subclass must override the action method.", v4, v5, v6, v7, v8);
}

@end