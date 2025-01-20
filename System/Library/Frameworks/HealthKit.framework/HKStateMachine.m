@interface HKStateMachine
+ (id)nameForOwner:(id)a3 UUID:(id)a4 tag:(id)a5;
- (HKStateMachine)init;
- (HKStateMachine)initWithName:(id)a3;
- (HKStateMachineDelegate)delegate;
- (HKStateMachineState)currentState;
- (NSString)name;
- (id)addStateTransitionFrom:(id)a3 to:(id)a4 event:(int64_t)a5 label:(id)a6;
- (id)addStateWithIndex:(int64_t)a3 label:(id)a4;
- (id)graphDescription;
- (id)stateWithIndex:(int64_t)a3;
- (void)_dequeueEvent;
- (void)_handleEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6;
- (void)enqueueEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6;
- (void)enterAtState:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKStateMachine

+ (id)nameForOwner:(id)a3 UUID:(id)a4 tag:(id)a5
{
  id v6 = a5;
  v7 = NSString;
  id v8 = a4;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = objc_msgSend(v8, "hk_shortRepresentation");

  if (v6) {
    [v7 stringWithFormat:@"%@_%@_%@", v10, v6, v11];
  }
  else {
  v12 = [v7 stringWithFormat:@"%@_%@", v10, v11, v14];
  }

  return v12;
}

- (HKStateMachine)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKStateMachine)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKStateMachine;
  v5 = [(HKStateMachine *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statesByIndex = v5->_statesByIndex;
    v5->_statesByIndex = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    transitions = v5->_transitions;
    v5->_transitions = v10;
  }
  return v5;
}

- (id)addStateWithIndex:(int64_t)a3 label:(id)a4
{
  id v7 = a4;
  if (self->_currentState)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKStateMachine.m", 151, @"Invalid parameter not satisfying: %@", @"_currentState == nil" object file lineNumber description];
  }
  statesByIndex = self->_statesByIndex;
  v9 = [NSNumber numberWithInteger:a3];
  v10 = [(NSMutableDictionary *)statesByIndex objectForKeyedSubscript:v9];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = self->_statesByIndex;
    objc_super v13 = [NSNumber numberWithInteger:a3];
    uint64_t v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
    [v11 handleFailureInMethod:a2, self, @"HKStateMachine.m", 154, @"%@: Attempt to add a state (%@) with the same index as an existing state (%@).", self, v7, v14 object file lineNumber description];

    v15 = 0;
  }
  else
  {
    v15 = [[HKStateMachineState alloc] initWithIndex:a3 label:v7];
    v16 = self->_statesByIndex;
    v11 = [NSNumber numberWithInteger:a3];
    [(NSMutableDictionary *)v16 setObject:v15 forKeyedSubscript:v11];
  }

  return v15;
}

- (id)addStateTransitionFrom:(id)a3 to:(id)a4 event:(int64_t)a5 label:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (self->_currentState)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HKStateMachine.m", 166, @"Invalid parameter not satisfying: %@", @"_currentState == nil" object file lineNumber description];
  }
  statesByIndex = self->_statesByIndex;
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "index"));
  id v15 = [(NSMutableDictionary *)statesByIndex objectForKeyedSubscript:v14];

  if (v15 != v10)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKStateMachine.m", 167, @"Invalid state %@ does not appear to be part of this state machine.", v10 object file lineNumber description];
  }
  id v39 = v12;
  v16 = self->_statesByIndex;
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "index"));
  id v18 = [(NSMutableDictionary *)v16 objectForKeyedSubscript:v17];

  if (v18 != v11)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HKStateMachine.m", 168, @"Invalid state %@ does not appear to be part of this state machine.", v11 object file lineNumber description];
  }
  SEL v37 = a2;
  v38 = self;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v19 = self->_transitions;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v20) {
    goto LABEL_20;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v42 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v25 = [v24 fromState];
      uint64_t v26 = [v25 index];
      if (v26 != [v10 index]) {
        goto LABEL_17;
      }
      v27 = [v24 toState];
      uint64_t v28 = [v27 index];
      if (v28 != [v11 index])
      {

LABEL_17:
        continue;
      }
      uint64_t v29 = [v24 event];

      if (v29 == a5)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        v31 = v39;
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v37, v38, v39, v10, v11, v24);

        v32 = 0;
        goto LABEL_21;
      }
    }
    uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v21);
LABEL_20:

  v31 = v39;
  v32 = [[HKStateMachineTransition alloc] initWithEvent:a5 label:v39 from:v10 to:v11];
  [(NSMutableArray *)v38->_transitions addObject:v32];
LABEL_21:

  return v32;
}

- (id)stateWithIndex:(int64_t)a3
{
  statesByIndex = self->_statesByIndex;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)statesByIndex objectForKeyedSubscript:v4];

  return v5;
}

- (void)enterAtState:(int64_t)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  p_currentState = &self->_currentState;
  if (self->_currentState)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKStateMachine.m", 190, @"Invalid parameter not satisfying: %@", @"_currentState == nil" object file lineNumber description];
  }
  long long v43 = self;
  statesByIndex = self->_statesByIndex;
  id v7 = [NSNumber numberWithInteger:a3];
  v38 = [(NSMutableDictionary *)statesByIndex objectForKeyedSubscript:v7];

  if (!v38)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HKStateMachine.m", 193, @"Invalid parameter not satisfying: %@", @"initialState != nil" object file lineNumber description];
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  obj = self->_statesByIndex;
  uint64_t v41 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v50;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v50 != v40)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v42 = v8;
        id v10 = [(NSMutableDictionary *)v43->_statesByIndex objectForKeyedSubscript:*(void *)(*((void *)&v49 + 1) + 8 * v8)];
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        objc_super v13 = v43->_transitions;
        uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v46 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              id v18 = [v17 fromState];
              BOOL v19 = v18 == v10;

              if (v19)
              {
                uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "event"));
                [v12 setObject:v17 forKeyedSubscript:v20];
              }
              uint64_t v21 = [v17 toState];
              BOOL v22 = v21 == v10;

              if (v22)
              {
                v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "event"));
                [v11 setObject:v17 forKeyedSubscript:v23];
              }
            }
            uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v14);
        }

        v24 = (void *)[v11 copy];
        [v10 setIncomingTransitions:v24];

        v25 = (void *)[v12 copy];
        [v10 setOutgoingTransitions:v25];

        uint64_t v8 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v41);
  }

  objc_copyWeak(&to, (id *)&v43->_delegate);
  id v26 = objc_loadWeakRetained(&to);
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    id v28 = objc_loadWeakRetained(&to);
    [v28 stateMachine:v43 willEnterState:v38 date:0 error:0];
  }
  objc_storeStrong((id *)p_currentState, v38);
  id v29 = objc_loadWeakRetained(&to);
  char v30 = objc_opt_respondsToSelector();

  if (v30)
  {
    id v31 = objc_loadWeakRetained(&to);
    [v31 stateMachine:v43 didEnterState:v38 date:0 error:0];
  }
  id v32 = objc_loadWeakRetained(&to);
  char v33 = objc_opt_respondsToSelector();

  if (v33)
  {
    id v34 = objc_loadWeakRetained(&to);
    [v34 stateMachine:v43 didTransition:0 fromState:0 toState:v38 date:0 error:0];
  }
  objc_destroyWeak(&to);
}

- (void)enqueueEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6
{
  if (self->_isProcessingEvent)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v18 = objc_alloc_init(HKStateMachinePendingEvent);
    [(HKStateMachinePendingEvent *)v18 setEvent:a3];
    [(HKStateMachinePendingEvent *)v18 setDate:v12];

    [(HKStateMachinePendingEvent *)v18 setError:v11];
    [(HKStateMachinePendingEvent *)v18 setCompletion:v10];

    pendingEvents = self->_pendingEvents;
    if (!pendingEvents)
    {
      uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v15 = self->_pendingEvents;
      self->_pendingEvents = v14;

      pendingEvents = self->_pendingEvents;
    }
    [(NSMutableArray *)pendingEvents addObject:v18];
  }
  else
  {
    id v16 = a6;
    id v17 = a5;
    id v18 = (HKStateMachinePendingEvent *)a4;
    [(HKStateMachine *)self _handleEvent:a3 date:v18 error:v17 completion:v16];
  }
}

- (void)_handleEvent:(int64_t)a3 date:(id)a4 error:(id)a5 completion:(id)a6
{
  id v46 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, void))a6;
  p_currentState = &self->_currentState;
  if (!self->_currentState)
  {
    long long v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"HKStateMachine.m", 257, @"Invalid parameter not satisfying: %@", @"_currentState != nil" object file lineNumber description];
  }
  objc_copyWeak(&to, (id *)&self->_delegate);
  uint64_t v14 = [(HKStateMachineState *)self->_currentState outgoingTransitions];
  uint64_t v15 = [NSNumber numberWithInteger:a3];
  id v16 = [v14 objectForKeyedSubscript:v15];

  if (v16)
  {
    self->_isProcessingEvent = 1;
    id v17 = [v16 toState];
    id v18 = *p_currentState;
    id v19 = objc_loadWeakRetained(&to);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained(&to);
      [v21 stateMachine:self willLeaveState:v18 date:v46 error:v11];
    }
    id v22 = objc_loadWeakRetained(&to);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v24 = objc_loadWeakRetained(&to);
      [v24 stateMachine:self willEnterState:v17 date:v46 error:v11];
    }
    id v25 = objc_loadWeakRetained(&to);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v27 = objc_loadWeakRetained(&to);
      [v27 stateMachine:self persistTransition:v16];
    }
    objc_storeStrong((id *)&self->_currentState, v17);
    id v28 = objc_loadWeakRetained(&to);
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      id v30 = objc_loadWeakRetained(&to);
      [v30 stateMachine:self didEnterState:v17 date:v46 error:v11];
    }
    id v31 = objc_loadWeakRetained(&to);
    char v32 = objc_opt_respondsToSelector();

    if (v32)
    {
      id v33 = objc_loadWeakRetained(&to);
      [v33 stateMachine:self didLeaveState:v18 date:v46 error:v11];
    }
    id v34 = objc_loadWeakRetained(&to);
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      id v36 = objc_loadWeakRetained(&to);
      [v36 stateMachine:self didTransition:v16 fromState:v18 toState:v17 date:v46 error:v11];
    }
    v12[2](v12, 1, 0);
    self->_isProcessingEvent = 0;
    [(HKStateMachine *)self _dequeueEvent];
  }
  else
  {
    id v37 = objc_loadWeakRetained(&to);
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      id v39 = objc_loadWeakRetained(&to);
      [v39 stateMachine:self didIgnoreEvent:a3 state:self->_currentState];
    }
    uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = *p_currentState;
    long long v43 = [(HKStateMachineState *)*p_currentState outgoingTransitions];
    long long v44 = objc_msgSend(v40, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v41, a2, @"Unable to transition to the desired state from the %@ state (event %ld). Allowed transitions from the current state are: %@"", v42, a3, v43);
    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v44);

    [(HKStateMachine *)self _dequeueEvent];
  }

  objc_destroyWeak(&to);
}

- (void)_dequeueEvent
{
  id v7 = [(NSMutableArray *)self->_pendingEvents firstObject];
  if (v7)
  {
    [(NSMutableArray *)self->_pendingEvents removeObjectAtIndex:0];
    uint64_t v3 = [v7 event];
    id v4 = [v7 date];
    v5 = [v7 error];
    uint64_t v6 = [v7 completion];
    [(HKStateMachine *)self _handleEvent:v3 date:v4 error:v5 completion:v6];
  }
}

- (id)graphDescription
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [(NSMutableDictionary *)self->_statesByIndex allValues];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_51];

  uint64_t v6 = [(NSString *)self->_name stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = @"state_machine";
  }
  uint64_t v9 = [(HKStateMachineState *)self->_currentState label];
  id v30 = v3;
  objc_msgSend(v3, "appendFormat:", @"digraph %@ {\n   rankdir=LR;\n   node [shape=doublecircle width=1]; \"%@\"\n   node [shape=circle width=1];\n",
    v8,
    v9);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v10;
        id v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
        id v12 = [v11 outgoingTransitions];
        objc_super v13 = [v12 allValues];
        uint64_t v14 = [v13 sortedArrayUsingComparator:&__block_literal_global_170];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v32 != v18) {
                objc_enumerationMutation(v15);
              }
              char v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              id v21 = [v11 label];
              id v22 = [v20 toState];
              char v23 = [v22 label];
              id v24 = [v20 label];
              objc_msgSend(v30, "appendFormat:", @"   \"%@\" -> \"%@\" [ label = \"%@ (%ld)\" ];\n",
                v21,
                v23,
                v24,
                [v20 event]);
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v17);
        }

        uint64_t v10 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }

  [v30 appendString:@"}"];

  return v30;
}

uint64_t __34__HKStateMachine_graphDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 label];
  uint64_t v6 = [v4 label];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __34__HKStateMachine_graphDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 label];
  uint64_t v6 = [v4 label];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (HKStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKStateMachineState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_transitions, 0);

  objc_storeStrong((id *)&self->_statesByIndex, 0);
}

@end