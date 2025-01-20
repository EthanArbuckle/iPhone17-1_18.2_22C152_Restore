@interface AFUINetworkAvailabilityStateMachine
- (AFUINetworkAvailabilityStateMachine)initWithDelegate:(id)a3;
- (AFUINetworkAvailabilityStateMachineDelegate)delegate;
- (RadiosPreferences)radioPreferences;
- (SRUIFStateMachine)stateMachine;
- (id)_stateMachine;
- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4;
- (int64_t)_state;
- (void)_intializeDelegateStateWithoutBlocking;
- (void)_performTransitionForEvent:(int64_t)a3;
- (void)_siriNetworkAvailabilityDidChange:(unint64_t)a3;
- (void)_stateMachine;
- (void)setDelegate:(id)a3;
- (void)setRadioPreferences:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)siriNetworkAvailabilityDidChange;
- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5;
@end

@implementation AFUINetworkAvailabilityStateMachine

- (AFUINetworkAvailabilityStateMachine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFUINetworkAvailabilityStateMachine;
  v5 = [(AFUINetworkAvailabilityStateMachine *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(AFUINetworkAvailabilityStateMachine *)v5 setDelegate:v4];
    [(AFUINetworkAvailabilityStateMachine *)v6 _intializeDelegateStateWithoutBlocking];
    v7 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x263F255D8]);
    radioPreferences = v6->_radioPreferences;
    v6->_radioPreferences = v7;

    [(RadiosPreferences *)v6->_radioPreferences setDelegate:v6];
  }

  return v6;
}

- (void)_intializeDelegateStateWithoutBlocking
{
  objc_initWeak(&location, self);
  v2 = dispatch_get_global_queue(21, 0);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__AFUINetworkAvailabilityStateMachine__intializeDelegateStateWithoutBlocking__block_invoke;
  v3[3] = &unk_2646919D8;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __77__AFUINetworkAvailabilityStateMachine__intializeDelegateStateWithoutBlocking__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _stateMachine];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __77__AFUINetworkAvailabilityStateMachine__intializeDelegateStateWithoutBlocking__block_invoke_2;
    v6[3] = &unk_264691C90;
    objc_copyWeak(&v8, v1);
    id v7 = v4;
    id v5 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v8);
  }
}

void __77__AFUINetworkAvailabilityStateMachine__intializeDelegateStateWithoutBlocking__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    unint64_t v3 = [*(id *)(a1 + 32) state];
    if (v3 > 3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = qword_2230F5E18[v3];
    }
    id v5 = [v6 delegate];
    [v5 _updateSiriAvailability:v4];

    id WeakRetained = v6;
  }
}

- (void)siriNetworkAvailabilityDidChange
{
  unint64_t v3 = +[AFUISiriSession availabilityState];

  [(AFUINetworkAvailabilityStateMachine *)self _siriNetworkAvailabilityDidChange:v3];
}

- (void)_siriNetworkAvailabilityDidChange:(unint64_t)a3
{
  if (a3 <= 3) {
    -[AFUINetworkAvailabilityStateMachine _performTransitionForEvent:](self, "_performTransitionForEvent:");
  }
}

- (id)_stateMachine
{
  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
    {
      uint64_t v4 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_FAULT)) {
        -[AFUINetworkAvailabilityStateMachine _stateMachine](v4);
      }
    }
    os_unfair_lock_lock(&self->_stateMachineInitilizationLock);
    unint64_t v5 = +[AFUISiriSession availabilityState];
    id v6 = objc_alloc(MEMORY[0x263F754F8]);
    if (v5 - 1 > 2) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = qword_2230F5E00[v5 - 1];
    }
    id v8 = (SRUIFStateMachine *)[v6 initWithInitialState:v7];
    v9 = self->_stateMachine;
    self->_stateMachine = v8;

    [(SRUIFStateMachine *)self->_stateMachine setDelegate:self];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:1 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:2 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:1 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:2 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:1 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:3 forEvent:1];
    os_unfair_lock_unlock(&self->_stateMachineInitilizationLock);
    stateMachine = self->_stateMachine;
  }

  return stateMachine;
}

- (int64_t)_state
{
  v2 = [(AFUINetworkAvailabilityStateMachine *)self _stateMachine];
  int64_t v3 = [v2 state];

  return v3;
}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5
{
  uint64_t v7 = [a3 state];
  if (v7 != a4)
  {
    unint64_t v8 = v7;
    v9 = [(AFUINetworkAvailabilityStateMachine *)self delegate];
    if (v8 > 3) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_2230F5E18[v8];
    }
    id v11 = v9;
    [v9 _updateSiriAvailability:v10];
  }
}

- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return @"SRSiriAvailabilityEventConnectionAvailable";
  }
  else {
    return off_264692E40[a4 - 1];
  }
}

- (void)_performTransitionForEvent:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int64_t v7 = [(AFUINetworkAvailabilityStateMachine *)self _state];
    if ((unint64_t)(a3 - 1) > 2) {
      unint64_t v8 = @"SRSiriAvailabilityEventConnectionAvailable";
    }
    else {
      unint64_t v8 = off_264692E40[a3 - 1];
    }
    int v10 = 136315650;
    id v11 = "-[AFUINetworkAvailabilityStateMachine _performTransitionForEvent:]";
    __int16 v12 = 2048;
    int64_t v13 = v7;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s from state %ld; event %@", (uint8_t *)&v10, 0x20u);
  }
  v9 = [(AFUINetworkAvailabilityStateMachine *)self _stateMachine];
  [v9 performTransitionForEvent:a3];
}

- (AFUINetworkAvailabilityStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUINetworkAvailabilityStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
}

- (SRUIFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_radioPreferences, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_stateMachine
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v1 = NSString;
  v2 = a1;
  int64_t v3 = [v1 stringWithUTF8String:"-[AFUINetworkAvailabilityStateMachine _stateMachine]"];
  int v4 = 136315394;
  unint64_t v5 = "-[AFUINetworkAvailabilityStateMachine _stateMachine]";
  __int16 v6 = 2112;
  int64_t v7 = v3;
  _os_log_fault_impl(&dword_223099000, v2, OS_LOG_TYPE_FAULT, "%s %@ should not be used initially on the main thread because it can block on an XPC call", (uint8_t *)&v4, 0x16u);
}

@end