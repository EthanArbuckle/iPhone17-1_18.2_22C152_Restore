@interface AFUIStateMachine
- (AFUIStateMachine)initWithInitialState:(int64_t)a3;
- (AFUIStateMachineDelegate)delegate;
- (NSMutableDictionary)_endStatesByEventByStartState;
- (id)_descriptionForEvent:(int64_t)a3;
- (id)_endStateNumberFromDictionary:(id)a3 forEvent:(int64_t)a4;
- (int64_t)state;
- (void)_setState:(int64_t)a3;
- (void)_setState:(int64_t)a3 forEvent:(int64_t)a4;
- (void)addTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5;
- (void)performTransitionForEvent:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEndStatesByEventByStartState:(id)a3;
@end

@implementation AFUIStateMachine

- (AFUIStateMachine)initWithInitialState:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"AFUIStateMachine.m", 24, @"Invalid parameter not satisfying: %@", @"initialState != NSNotFound" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)AFUIStateMachine;
  v5 = [(AFUIStateMachine *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_state = a3;
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    endStatesByEventByStartState = v6->_endStatesByEventByStartState;
    v6->_endStatesByEventByStartState = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (void)_setState:(int64_t)a3 forEvent:(int64_t)a4
{
  int64_t v7 = [(AFUIStateMachine *)self state];
  [(AFUIStateMachine *)self _setState:a3];
  id v8 = [(AFUIStateMachine *)self delegate];
  [v8 stateMachine:self didTransitionFromState:v7 forEvent:a4];
}

- (id)_descriptionForEvent:(int64_t)a3
{
  v5 = [(AFUIStateMachine *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int64_t v7 = [(AFUIStateMachine *)self delegate];
    id v8 = [v7 stateMachine:self descriptionForEvent:a3];
  }
  else
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  }

  return v8;
}

- (void)addTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5
{
  v9 = [(AFUIStateMachine *)self _endStatesByEventByStartState];
  v10 = [NSNumber numberWithInteger:a3];
  id v15 = [v9 objectForKey:v10];

  if (!v15)
  {
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    v11 = [(AFUIStateMachine *)self _endStatesByEventByStartState];
    objc_super v12 = [NSNumber numberWithInteger:a3];
    [v11 setObject:v15 forKey:v12];
  }
  v13 = [NSNumber numberWithInteger:a4];
  v14 = [NSNumber numberWithInteger:a5];
  [v15 setObject:v13 forKey:v14];
}

- (id)_endStateNumberFromDictionary:(id)a3 forEvent:(int64_t)a4
{
  char v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    v10 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUIStateMachine _endStateNumberFromDictionary:forEvent:](v10, self, a4);
    }
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[AFUIStateMachine state](self, "state"));
  }

  return v9;
}

- (void)performTransitionForEvent:(int64_t)a3
{
  v5 = [(AFUIStateMachine *)self _endStatesByEventByStartState];
  char v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[AFUIStateMachine state](self, "state"));
  id v8 = [v5 objectForKey:v6];

  id v7 = [(AFUIStateMachine *)self _endStateNumberFromDictionary:v8 forEvent:a3];
  -[AFUIStateMachine _setState:forEvent:](self, "_setState:forEvent:", [v7 integerValue], a3);
}

- (AFUIStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUIStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableDictionary)_endStatesByEventByStartState
{
  return self->_endStatesByEventByStartState;
}

- (void)setEndStatesByEventByStartState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStatesByEventByStartState, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_endStateNumberFromDictionary:(uint64_t)a3 forEvent:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = a1;
  uint64_t v6 = [a2 state];
  id v7 = [a2 _descriptionForEvent:a3];
  int v8 = 136315650;
  v9 = "-[AFUIStateMachine _endStateNumberFromDictionary:forEvent:]";
  __int16 v10 = 2050;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_223099000, v5, OS_LOG_TYPE_ERROR, "%s No transition is defined from state %{public}ld for event %{public}@. Let's not change state, then.", (uint8_t *)&v8, 0x20u);
}

@end