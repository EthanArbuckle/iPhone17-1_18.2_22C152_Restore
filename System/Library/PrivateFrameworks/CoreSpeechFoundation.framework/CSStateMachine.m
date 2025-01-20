@interface CSStateMachine
- (CSStateMachine)initWithInitialState:(int64_t)a3;
- (CSStateMachineDelegate)delegate;
- (NSMutableDictionary)eventToStateTransitions;
- (NSMutableDictionary)transitions;
- (int64_t)currentState;
- (int64_t)initialState;
- (void)addTransitionFrom:(int64_t)a3 to:(int64_t)a4 for:(int64_t)a5;
- (void)addTransitionFromAnyStateTo:(int64_t)a3 for:(int64_t)a4;
- (void)performTransitionForEvent:(int64_t)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setEventToStateTransitions:(id)a3;
- (void)setInitialState:(int64_t)a3;
- (void)setTransitions:(id)a3;
@end

@implementation CSStateMachine

- (int64_t)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventToStateTransitions, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setEventToStateTransitions:(id)a3
{
}

- (NSMutableDictionary)eventToStateTransitions
{
  return self->_eventToStateTransitions;
}

- (void)setTransitions:(id)a3
{
}

- (NSMutableDictionary)transitions
{
  return self->_transitions;
}

- (void)setInitialState:(int64_t)a3
{
  self->_initialState = a3;
}

- (int64_t)initialState
{
  return self->_initialState;
}

- (void)setDelegate:(id)a3
{
}

- (CSStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSStateMachineDelegate *)WeakRetained;
}

- (void)performTransitionForEvent:(int64_t)a3
{
  transitions = self->_transitions;
  v6 = [NSNumber numberWithInteger:self->_currentState];
  v21 = [(NSMutableDictionary *)transitions objectForKeyedSubscript:v6];

  if (v21)
  {
    v7 = [NSNumber numberWithInteger:a3];
    v8 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = [NSNumber numberWithInteger:a3];
      v10 = v21;
LABEL_6:
      v15 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v9];
      int64_t v16 = [v15 integerValue];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!WeakRetained) {
        goto LABEL_11;
      }
      int64_t currentState = self->_currentState;
      self->_int64_t currentState = v16;
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      [v19 didTransitFrom:currentState to:self->_currentState by:a3];
      goto LABEL_10;
    }
  }
  eventToStateTransitions = self->_eventToStateTransitions;
  v12 = [NSNumber numberWithInteger:a3];
  v13 = [(NSMutableDictionary *)eventToStateTransitions objectForKeyedSubscript:v12];

  if (v13)
  {
    v14 = self->_eventToStateTransitions;
    v9 = [NSNumber numberWithInteger:a3];
    v10 = v14;
    goto LABEL_6;
  }
  id v20 = objc_loadWeakRetained((id *)&self->_delegate);

  if (!v20) {
    goto LABEL_11;
  }
  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  [v19 didIgnoreEvent:a3 from:self->_currentState];
LABEL_10:

LABEL_11:
}

- (void)addTransitionFromAnyStateTo:(int64_t)a3 for:(int64_t)a4
{
  eventToStateTransitions = self->_eventToStateTransitions;
  id v7 = [NSNumber numberWithInteger:a3];
  v6 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)eventToStateTransitions setObject:v7 forKey:v6];
}

- (void)addTransitionFrom:(int64_t)a3 to:(int64_t)a4 for:(int64_t)a5
{
  transitions = self->_transitions;
  v10 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v18 = [(NSMutableDictionary *)transitions objectForKeyedSubscript:v10];

  if (!v18)
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = self->_transitions;
    v13 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    v14 = self->_transitions;
    v15 = [NSNumber numberWithInteger:a3];
    id v18 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  }
  int64_t v16 = [NSNumber numberWithInteger:a4];
  v17 = [NSNumber numberWithInteger:a5];
  [v18 setObject:v16 forKey:v17];
}

- (void)reset
{
  self->_int64_t currentState = self->_initialState;
}

- (CSStateMachine)initWithInitialState:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CSStateMachine;
  v4 = [(CSStateMachine *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_int64_t currentState = a3;
    v4->_initialState = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    transitions = v5->_transitions;
    v5->_transitions = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    eventToStateTransitions = v5->_eventToStateTransitions;
    v5->_eventToStateTransitions = (NSMutableDictionary *)v8;
  }
  return v5;
}

@end