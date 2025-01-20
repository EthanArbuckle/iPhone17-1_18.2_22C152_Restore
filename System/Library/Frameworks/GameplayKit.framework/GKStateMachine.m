@interface GKStateMachine
+ (GKStateMachine)stateMachineWithStates:(NSArray *)states;
- (BOOL)canEnterState:(Class)stateClass;
- (BOOL)enterState:(Class)stateClass;
- (GKState)currentState;
- (GKState)stateForClass:(Class)stateClass;
- (GKStateMachine)init;
- (GKStateMachine)initWithStates:(NSArray *)states;
- (id)_dotStringInstanceData;
- (id)_instanceData;
- (void)forceEnterState:(Class)a3;
- (void)updateWithDeltaTime:(NSTimeInterval)sec;
@end

@implementation GKStateMachine

- (GKStateMachine)init
{
  [MEMORY[0x263EFF940] raise:@"GKInitNotAllowedException" format:@"initWithStates is the destignated initialize for GKStateMachine.  Use that instead"];
  uint64_t v3 = MEMORY[0x263EFFA68];

  return [(GKStateMachine *)self initWithStates:v3];
}

+ (GKStateMachine)stateMachineWithStates:(NSArray *)states
{
  v4 = states;
  v5 = (void *)[objc_alloc((Class)a1) initWithStates:v4];

  return (GKStateMachine *)v5;
}

- (GKStateMachine)initWithStates:(NSArray *)states
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = states;
  v21.receiver = self;
  v21.super_class = (Class)GKStateMachine;
  v5 = [(GKStateMachine *)&v21 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = v4;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          objc_msgSend(v6, "setObject:forKey:", v12, objc_opt_class(), (void)v17);
          [v12 _setStateMachine:v5];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v13 = [NSDictionary dictionaryWithDictionary:v6];
    v14 = v5->_states;
    v5->_states = (NSDictionary *)v13;

    currentState = v5->_currentState;
    v5->_currentState = 0;
  }
  return v5;
}

- (void)updateWithDeltaTime:(NSTimeInterval)sec
{
  id v4 = [(GKStateMachine *)self currentState];
  [v4 updateWithDeltaTime:sec];
}

- (void)forceEnterState:(Class)a3
{
  id v4 = [(GKStateMachine *)self stateForClass:a3];
  v5 = [(GKStateMachine *)self currentState];
  [v5 willExitWithNextState:v4];

  id v8 = [(GKStateMachine *)self currentState];
  currentState = self->_currentState;
  self->_currentState = v4;
  v7 = v4;

  [(GKState *)self->_currentState didEnterWithPreviousState:v8];
}

- (BOOL)enterState:(Class)stateClass
{
  BOOL v5 = -[GKStateMachine canEnterState:](self, "canEnterState:");
  if (v5) {
    [(GKStateMachine *)self forceEnterState:stateClass];
  }
  return v5;
}

- (BOOL)canEnterState:(Class)stateClass
{
  BOOL v5 = [(GKStateMachine *)self currentState];

  if (!v5) {
    return 1;
  }
  v6 = [(GKStateMachine *)self currentState];
  char v7 = [v6 isValidNextState:stateClass];

  return v7;
}

- (GKState)stateForClass:(Class)stateClass
{
  return (GKState *)[(NSDictionary *)self->_states objectForKeyedSubscript:stateClass];
}

- (id)_instanceData
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v3 setObject:&unk_26E94BA50 forKeyedSubscript:@"__version"];
  id v4 = [(GKStateMachine *)self currentState];

  if (v4)
  {
    BOOL v5 = [(GKStateMachine *)self currentState];
    v6 = (objc_class *)objc_opt_class();
    char v7 = NSStringFromClass(v6);
    [v3 setObject:v7 forKeyedSubscript:@"__currentstate"];
  }
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  states = self->_states;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __31__GKStateMachine__instanceData__block_invoke;
  v15[3] = &unk_264C930A8;
  id v16 = v9;
  long long v17 = self;
  id v18 = v8;
  id v11 = v8;
  id v12 = v9;
  [(NSDictionary *)states enumerateKeysAndObjectsUsingBlock:v15];
  [v3 setObject:v12 forKeyedSubscript:@"__allstates"];
  [v3 setObject:v11 forKeyedSubscript:@"__transitions"];
  uint64_t v13 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];

  return v13;
}

void __31__GKStateMachine__instanceData__block_invoke(uint64_t a1, objc_class *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = NSStringFromClass(a2);
  [*(id *)(a1 + 32) addObject:v6];
  char v7 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 == v11)
        {
          uint64_t v13 = *(objc_class **)(*((void *)&v15 + 1) + 8 * i);
          if (![v5 isValidNextState:v13]) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v8);
          uint64_t v13 = *(objc_class **)(*((void *)&v15 + 1) + 8 * i);
          if (![v5 isValidNextState:v13]) {
            continue;
          }
        }
        v14 = NSStringFromClass(v13);
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [*(id *)(a1 + 48) setObject:v7 forKey:v6];
  }
}

- (id)_dotStringInstanceData
{
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithString:@"digraph GK_state_machine {\n"];
  states = self->_states;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __40__GKStateMachine__dotStringInstanceData__block_invoke;
  uint64_t v13 = &unk_264C930D0;
  v14 = self;
  id v15 = v3;
  id v5 = v3;
  [(NSDictionary *)states enumerateKeysAndObjectsUsingBlock:&v10];
  objc_msgSend(v5, "appendString:", @"}", v10, v11, v12, v13, v14);
  v6 = (void *)MEMORY[0x263F08910];
  char v7 = (void *)[v5 copy];
  id v8 = [v6 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];

  return v8;
}

void __40__GKStateMachine__dotStringInstanceData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v7 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 == v10)
        {
          id v12 = *(objc_class **)(*((void *)&v16 + 1) + 8 * i);
          if (![v6 isValidNextState:v12]) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v7);
          id v12 = *(objc_class **)(*((void *)&v16 + 1) + 8 * i);
          if (![v6 isValidNextState:v12]) {
            continue;
          }
        }
        uint64_t v13 = *(void **)(a1 + 40);
        v14 = NSStringFromClass(v5);
        id v15 = NSStringFromClass(v12);
        [v13 appendFormat:@"%@ -> %@\n", v14, v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (GKState)currentState
{
  return self->_currentState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);

  objc_storeStrong((id *)&self->_states, 0);
}

@end