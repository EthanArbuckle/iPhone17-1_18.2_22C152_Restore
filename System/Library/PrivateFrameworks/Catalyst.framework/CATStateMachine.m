@interface CATStateMachine
+ (CATStateMachine)new;
- (BOOL)canTransitionWithTriggeringEvent:(id)a3;
- (CATState)currentState;
- (CATState)initialState;
- (CATStateMachine)init;
- (CATStateMachine)initWithTarget:(id)a3;
- (NSString)name;
- (id)addStateWithName:(id)a3;
- (id)description;
- (id)eventForTriggeringEvent:(id)a3;
- (id)stateWithName:(id)a3;
- (id)target;
- (unint64_t)logLevel;
- (void)addState:(id)a3;
- (void)dealloc;
- (void)delegateDidEnterState:(id)a3 event:(id)a4;
- (void)delegateWillExitState:(id)a3 event:(id)a4;
- (void)invokeAction:(SEL)a3 event:(id)a4;
- (void)setCurrentState:(id)a3;
- (void)setInitialState:(id)a3;
- (void)setLogLevel:(unint64_t)a3;
- (void)start;
- (void)transitionWithTriggeringEvent:(id)a3;
@end

@implementation CATStateMachine

+ (CATStateMachine)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATStateMachine.m", 62, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATStateMachine)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATStateMachine.m", 69, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (CATStateMachine)initWithTarget:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATStateMachine.m", 77, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CATStateMachine;
  v6 = [(CATStateMachine *)&v13 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    mStateByName = v6->mStateByName;
    v6->mStateByName = (NSMutableDictionary *)v7;

    v6->_logLevel = 0;
    objc_storeWeak(&v6->_target, v5);
    uint64_t v9 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), v5];
    name = v6->_name;
    v6->_name = (NSString *)v9;
  }
  return v6;
}

- (void)dealloc
{
  if (self->mCalloutReason)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"CATStateMachine.m", 94, @"%@ cannot be deallocated because of '%@'", self, self->mCalloutReason object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)CATStateMachine;
  [(CATStateMachine *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(CATStateMachine *)self name];
  v6 = [(CATStateMachine *)self currentState];
  uint64_t v7 = [v6 name];
  v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = [v3 stringWithFormat:@"<%@: %p { name = %@, currentState = %@ }>", v4, self, v5, v7];
  }
  else
  {
    v10 = [(CATStateMachine *)self initialState];
    v11 = [v10 name];
    uint64_t v9 = [v3 stringWithFormat:@"<%@: %p { name = %@, currentState = %@ }>", v4, self, v5, v11];
  }

  return v9;
}

- (id)addStateWithName:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CATState alloc] initWithName:v4];

  [(CATStateMachine *)self addState:v5];

  return v5;
}

- (void)addState:(id)a3
{
  id v17 = a3;
  objc_super v5 = [(CATStateMachine *)self currentState];

  if (v5)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    objc_super v13 = NSStringFromSelector(a2);
    v14 = [(CATStateMachine *)self currentState];
    [v12 handleFailureInMethod:a2, self, @"CATStateMachine.m", 118, @"%@ cannot call %@ when currentState is %@", self, v13, v14 object file lineNumber description];
  }
  mStateByName = self->mStateByName;
  uint64_t v7 = [v17 name];
  v8 = [(NSMutableDictionary *)mStateByName objectForKeyedSubscript:v7];

  if (v8)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [v17 name];
    [v15 handleFailureInMethod:a2, self, @"CATStateMachine.m", 119, @"%@ cannot add a duplicate state name (%@) to state machine.", self, v16 object file lineNumber description];
  }
  uint64_t v9 = self->mStateByName;
  v10 = [v17 name];
  [(NSMutableDictionary *)v9 setObject:v17 forKeyedSubscript:v10];

  v11 = [(CATStateMachine *)self initialState];

  if (!v11) {
    [(CATStateMachine *)self setInitialState:v17];
  }
}

- (id)stateWithName:(id)a3
{
  id v5 = a3;
  v6 = [(NSMutableDictionary *)self->mStateByName objectForKeyedSubscript:v5];
  if (!v6)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CATStateMachine.m", 132, @"%@ couldn't get a state for %@", self, v5 object file lineNumber description];
  }

  return v6;
}

- (void)start
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_213B7F000, a2, OS_LOG_TYPE_DEBUG, "%@ starting...", (uint8_t *)&v2, 0xCu);
}

- (BOOL)canTransitionWithTriggeringEvent:(id)a3
{
  uint64_t v4 = [(CATStateMachine *)self eventForTriggeringEvent:a3];
  id v5 = [(CATStateMachine *)self currentState];
  v6 = [v4 trigger];
  uint64_t v7 = [v5 transitionWithTriggeringEvent:v6];

  return v7 != 0;
}

- (void)transitionWithTriggeringEvent:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [(CATStateMachine *)self currentState];

  if (!v6)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"CATStateMachine.m", 161, @"%@ has not been started. The state machine should not receive events before it has started", self object file lineNumber description];
  }
  uint64_t v7 = [(CATStateMachine *)self eventForTriggeringEvent:v5];
  v8 = [(CATStateMachine *)self currentState];
  uint64_t v9 = [v7 trigger];
  v10 = [v8 transitionWithTriggeringEvent:v9];

  if (!v10)
  {
    v34 = [MEMORY[0x263F08690] currentHandler];
    v35 = [(CATStateMachine *)self currentState];
    [v34 handleFailureInMethod:a2, self, @"CATStateMachine.m", 166, @"%@ cannot transition from %@ with %@", self, v35, v5 object file lineNumber description];
  }
  if (self->mCalloutReason)
  {
    v36 = [MEMORY[0x263F08690] currentHandler];
    v37 = NSStringFromSelector(a2);
    [v36 handleFailureInMethod:a2, self, @"CATStateMachine.m", 168, @"%@ cannot call %@ with event '%@' because the receiver is already '%@'", self, v37, v5, self->mCalloutReason object file lineNumber description];
  }
  if ([(CATStateMachine *)self logLevel])
  {
    v11 = _CATLogFSM();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v26 = [(CATStateMachine *)self currentState];
      v27 = [v26 name];
      v28 = [v10 state];
      v29 = [v28 name];
      v30 = [v7 trigger];
      *(_DWORD *)buf = 138413058;
      v39 = self;
      __int16 v40 = 2112;
      v41 = v27;
      __int16 v42 = 2112;
      v43 = v29;
      __int16 v44 = 2112;
      v45 = v30;
      _os_log_debug_impl(&dword_213B7F000, v11, OS_LOG_TYPE_DEBUG, "%@ transitioning from \"%@\" to \"%@\" because %@", buf, 0x2Au);
    }
  }
  v12 = [v10 state];

  if (v12)
  {
    mCalloutReason = self->mCalloutReason;
    self->mCalloutReason = (NSString *)@"Calling Exit Action";

    if ([(CATStateMachine *)self logLevel] >= 2)
    {
      v14 = _CATLogFSM();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v31 = [(CATStateMachine *)self currentState];
        v32 = [v31 name];
        *(_DWORD *)buf = 138412546;
        v39 = self;
        __int16 v40 = 2112;
        v41 = v32;
        _os_log_debug_impl(&dword_213B7F000, v14, OS_LOG_TYPE_DEBUG, "%@ leaving %@", buf, 0x16u);
      }
    }
    v15 = [(CATStateMachine *)self currentState];
    [(CATStateMachine *)self delegateWillExitState:v15 event:v7];

    v16 = self->mCalloutReason;
    self->mCalloutReason = 0;
  }
  if ([v10 action])
  {
    id v17 = self->mCalloutReason;
    self->mCalloutReason = (NSString *)@"Calling Transition Action";

    if ([(CATStateMachine *)self logLevel] >= 2)
    {
      v18 = _CATLogFSM();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        [(CATStateMachine *)(uint64_t)self transitionWithTriggeringEvent:v18];
      }
    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", [v10 action], v7);
    v19 = self->mCalloutReason;
    self->mCalloutReason = 0;
  }
  v20 = [v10 state];

  if (v20)
  {
    v21 = [v10 state];
    [(CATStateMachine *)self setCurrentState:v21];

    if ([(CATStateMachine *)self logLevel] >= 2)
    {
      v22 = _CATLogFSM();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [(CATStateMachine *)self currentState];
        -[CATStateMachine transitionWithTriggeringEvent:]((uint64_t)self, v23, buf, v22);
      }
    }
    v24 = [(CATStateMachine *)self currentState];
    [(CATStateMachine *)self delegateDidEnterState:v24 event:v7];
  }
  v25 = self->mCalloutReason;
  self->mCalloutReason = 0;
}

- (id)eventForTriggeringEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[CATStateMachineEvent eventWithTrigger:v3 context:0];
  }
  id v5 = v4;

  return v5;
}

- (void)delegateWillExitState:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 exitAction])
  {
    if ([(CATStateMachine *)self logLevel] >= 2)
    {
      v8 = _CATLogFSM();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CATStateMachine delegateWillExitState:event:]((uint64_t)self, v6);
      }
    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", [v6 exitAction], v7);
  }
}

- (void)delegateDidEnterState:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 enterAction])
  {
    if ([(CATStateMachine *)self logLevel] >= 2)
    {
      v8 = _CATLogFSM();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[CATStateMachine delegateDidEnterState:event:]((uint64_t)self, v6);
      }
    }
    -[CATStateMachine invokeAction:event:](self, "invokeAction:event:", [v6 enterAction], v7);
  }
}

- (void)invokeAction:(SEL)a3 event:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = (void *)MEMORY[0x2166930C0]();
    v8 = [(CATStateMachine *)self target];
    uint64_t v9 = [v8 methodSignatureForSelector:a3];

    v10 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v9];
    v11 = [(CATStateMachine *)self target];
    [v10 setTarget:v11];

    [v10 setSelector:a3];
    if ((unint64_t)[v9 numberOfArguments] >= 3)
    {
      id v12 = [v6 context];
      [v10 setArgument:&v12 atIndex:2];
    }
    [v10 invoke];
  }
}

- (NSString)name
{
  return self->_name;
}

- (CATState)initialState
{
  return self->_initialState;
}

- (void)setInitialState:(id)a3
{
}

- (CATState)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (unint64_t)logLevel
{
  return self->_logLevel;
}

- (void)setLogLevel:(unint64_t)a3
{
  self->_logLevel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->mCalloutReason, 0);

  objc_storeStrong((id *)&self->mStateByName, 0);
}

- (void)transitionWithTriggeringEvent:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_213B7F000, log, OS_LOG_TYPE_DEBUG, "%@ entering %@", buf, 0x16u);
}

- (void)transitionWithTriggeringEvent:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_213B7F000, log, OS_LOG_TYPE_DEBUG, "%@ invoking action for %@", (uint8_t *)&v3, 0x16u);
}

- (void)delegateWillExitState:(uint64_t)a1 event:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v3 = NSStringFromSelector((SEL)[a2 exitAction]);
  uint64_t v4 = [a2 name];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213B7F000, v5, v6, "%@ invoking exit action (%@) for %@", v7, v8, v9, v10, v11);
}

- (void)delegateDidEnterState:(uint64_t)a1 event:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  int v3 = NSStringFromSelector((SEL)[a2 enterAction]);
  uint64_t v4 = [a2 name];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_213B7F000, v5, v6, "%@ invoking enter action (%@) for %@", v7, v8, v9, v10, v11);
}

@end