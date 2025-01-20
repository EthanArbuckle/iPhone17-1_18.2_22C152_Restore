@interface _GKStateMachine
- (BOOL)_setCurrentState:(id)a3;
- (BOOL)shouldLogStateTransitions;
- (NSDictionary)validTransitions;
- (NSString)currentState;
- (_GKStateMachine)init;
- (_GKStateMachineDelegate)delegate;
- (id)_validateTransitionFromState:(id)a3 toState:(id)a4;
- (id)missingTransitionFromState:(id)a3 toState:(id)a4;
- (void)_performTransitionFromState:(id)a3 toState:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldLogStateTransitions:(BOOL)a3;
- (void)setValidTransitions:(id)a3;
@end

@implementation _GKStateMachine

- (void)_performTransitionFromState:(id)a3 toState:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v6 = (__CFString *)a3;
  id v7 = a4;
  if ([(_GKStateMachine *)self shouldLogStateTransitions])
  {
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "  ➤➤➤ %@ state change from %@ to %@", buf, 0x20u);
    }
  }
  uint64_t v10 = [(_GKStateMachine *)self delegate];
  v11 = (void *)v10;
  if (v10) {
    v12 = (_GKStateMachine *)v10;
  }
  else {
    v12 = self;
  }
  v13 = v12;

  if (v6)
  {
    v14 = [@"didExit" stringByAppendingString:v6];
    v15 = NSSelectorFromString(v14);

    if (objc_opt_respondsToSelector()) {
      [v13 v15];
    }
  }
  v16 = [@"didEnter" stringByAppendingString:v7];
  v17 = NSSelectorFromString(v16);

  if (objc_opt_respondsToSelector()) {
    [v13 v17];
  }
  v18 = @"Nil";
  if (v6) {
    v18 = v6;
  }
  v19 = v18;
  v20 = [NSString stringWithFormat:@"stateDidChangeFrom%@To%@", v19, v7];
  v21 = NSSelectorFromString(v20);

  if (objc_opt_respondsToSelector()) {
    [v13 v21];
  }
  if (objc_opt_respondsToSelector()) {
    [(_GKStateMachine *)v13 stateDidChange];
  }
}

- (BOOL)_setCurrentState:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_GKStateMachine *)self currentState];
  if ([(_GKStateMachine *)self shouldLogStateTransitions])
  {
    v6 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v7 = GKOSLoggers();
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      v16 = v5;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_INFO, " ➤➤➤ request state change from %@ to %@", (uint8_t *)&v15, 0x16u);
    }
  }
  v8 = [(_GKStateMachine *)self _validateTransitionFromState:v5 toState:v4];
  if (v8)
  {
    uint64_t v9 = [(_GKStateMachine *)self delegate];
    uint64_t v10 = (void *)v9;
    if (v9) {
      v11 = (_GKStateMachine *)v9;
    }
    else {
      v11 = self;
    }
    v12 = v11;

    if (objc_opt_respondsToSelector()) {
      [(_GKStateMachine *)v12 stateWillChange];
    }
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_currentState, v8);
    os_unfair_lock_unlock(&self->_lock);
    [(_GKStateMachine *)self _performTransitionFromState:v5 toState:v8];
  }
  char v13 = [v4 isEqual:v8];

  return v13;
}

- (NSString)currentState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_currentState;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (_GKStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GKStateMachineDelegate *)WeakRetained;
}

- (BOOL)shouldLogStateTransitions
{
  return self->_shouldLogStateTransitions;
}

- (id)_validateTransitionFromState:(id)a3 toState:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___GKStateMachine__validateTransitionFromState_toState___block_invoke;
  aBlock[3] = &unk_1E6472510;
  aBlock[4] = self;
  id v8 = v6;
  id v34 = v8;
  id v9 = v7;
  id v35 = v9;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  if (!v9)
  {
    if (!os_log_GKGeneral) {
      id v11 = GKOSLoggers();
    }
    v12 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      -[_GKStateMachine _validateTransitionFromState:toState:]((uint64_t)self, v12);
    }
    v10[2](v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      id v18 = 0;
      goto LABEL_37;
    }
  }
  if (!v8) {
    goto LABEL_24;
  }
  char v13 = [(_GKStateMachine *)self validTransitions];
  v14 = [v13 objectForKey:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(_GKStateMachine *)v14 containsObject:v9]) {
      goto LABEL_23;
    }
  }
  else if ([(_GKStateMachine *)v14 isEqual:v9])
  {
LABEL_23:

LABEL_24:
    uint64_t v22 = [(_GKStateMachine *)self delegate];
    v23 = (void *)v22;
    if (v22) {
      __int16 v24 = (_GKStateMachine *)v22;
    }
    else {
      __int16 v24 = self;
    }
    v14 = v24;

    v25 = [@"shouldEnter" stringByAppendingString:v9];
    __int16 v26 = NSSelectorFromString(v25);

    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v14 v26] & 1) == 0)
    {
      if (!os_log_GKGeneral) {
        id v27 = GKOSLoggers();
      }
      uint64_t v28 = (void *)os_log_GKError;
      if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      {
        v31 = v28;
        v32 = NSStringFromSelector(v26);
        *(_DWORD *)buf = 138413058;
        v37 = self;
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v8;
        __int16 v42 = 2112;
        v43 = v32;
        _os_log_error_impl(&dword_1C2D22000, v31, OS_LOG_TYPE_ERROR, "  ➤➤➤ %@ transition disallowed to %@ from %@ (via %@)", buf, 0x2Au);
      }
      uint64_t v29 = v10[2](v10);

      id v9 = (id)v29;
    }
    id v9 = v9;
    id v18 = v9;
    goto LABEL_36;
  }
  int v15 = [v8 isEqualToString:v9];
  v16 = os_log_GKGeneral;
  if (v15)
  {
    if (!os_log_GKGeneral)
    {
      id v17 = GKOSLoggers();
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_GKStateMachine _validateTransitionFromState:toState:]((uint64_t)self, (uint64_t)v9, v16);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v19 = GKOSLoggers();
    }
    v20 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v37 = self;
      __int16 v38 = 2112;
      id v39 = v9;
      __int16 v40 = 2112;
      id v41 = v8;
      _os_log_error_impl(&dword_1C2D22000, v20, OS_LOG_TYPE_ERROR, "  ➤➤➤ %@ cannot transition to %@ from %@", buf, 0x20u);
    }
    uint64_t v21 = v10[2](v10);

    id v9 = (id)v21;
    if (v21) {
      goto LABEL_23;
    }
  }
  id v18 = 0;
LABEL_36:

LABEL_37:

  return v18;
}

- (void)setValidTransitions:(id)a3
{
}

- (void)setShouldLogStateTransitions:(BOOL)a3
{
  self->_shouldLogStateTransitions = a3;
}

- (void)setDelegate:(id)a3
{
}

- (_GKStateMachine)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GKStateMachine;
  result = [(_GKStateMachine *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)missingTransitionFromState:(id)a3 toState:(id)a4
{
  return 0;
}

- (NSDictionary)validTransitions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_validTransitions, 0);
}

- (void)_validateTransitionFromState:(os_log_t)log toState:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C2D22000, log, OS_LOG_TYPE_DEBUG, "  ➤➤➤ %@ ignoring reentry to %@", (uint8_t *)&v3, 0x16u);
}

- (void)_validateTransitionFromState:(uint64_t)a1 toState:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "validation for a state change failed:  ➤➤➤ %@ cannot transition to <nil> state", (uint8_t *)&v2, 0xCu);
}

@end