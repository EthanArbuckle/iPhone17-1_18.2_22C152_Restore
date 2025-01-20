@interface FIUIState
+ (id)stateWithLabel:(id)a3;
+ (id)transitionalStateFromState:(id)a3 toState:(id)a4 entryEvent:(int64_t)a5 exitEvent:(int64_t)a6;
- (BOOL)isTransitional;
- (FIUIState)entryState;
- (FIUIState)initWithLabel:(id)a3;
- (FIUIState)parentState;
- (NSMutableSet)childStates;
- (NSString)label;
- (id)allTransitions;
- (id)description;
- (id)entry;
- (id)exit;
- (id)transitionForEvent:(int64_t)a3;
- (void)addChildStates:(id)a3 withEntryState:(id)a4;
- (void)enumerateEvents:(id)a3;
- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5;
- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5 handler:(id)a6 gate:(id)a7;
- (void)setEntry:(id)a3;
- (void)setEntryState:(id)a3;
- (void)setExit:(id)a3;
- (void)setParentState:(id)a3;
- (void)setTransitional:(BOOL)a3;
@end

@implementation FIUIState

- (FIUIState)initWithLabel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FIUIState;
  v6 = [(FIUIState *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_label, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    transitions = v7->_transitions;
    v7->_transitions = (NSMutableDictionary *)v8;

    objc_storeWeak((id *)&v7->_parentState, 0);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    childStates = v7->_childStates;
    v7->_childStates = v10;

    objc_storeWeak((id *)&v7->_entryState, 0);
  }

  return v7;
}

- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5
{
}

- (void)registerTransition:(int64_t)a3 label:(id)a4 toState:(id)a5 handler:(id)a6 gate:(id)a7
{
  id v20 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = self->_transitions;
  objc_sync_enter(v15);
  if (v12)
  {
    v16 = objc_opt_new();
    [v16 setToState:v12];
    [v16 setHandler:v13];
    [v16 setGate:v14];
    [v16 setEvent:a3];
    [v16 setLabel:v20];
    transitions = self->_transitions;
    v18 = [NSNumber numberWithLong:a3];
    [(NSMutableDictionary *)transitions setObject:v16 forKey:v18];
  }
  else
  {
    v19 = self->_transitions;
    v16 = [NSNumber numberWithLong:a3];
    [(NSMutableDictionary *)v19 removeObjectForKey:v16];
  }

  objc_sync_exit(v15);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)allTransitions
{
  return (id)[(NSMutableDictionary *)self->_transitions allValues];
}

- (void)setEntry:(id)a3
{
}

- (void)setExit:(id)a3
{
}

+ (id)transitionalStateFromState:(id)a3 toState:(id)a4 entryEvent:(int64_t)a5 exitEvent:(int64_t)a6
{
  v9 = NSString;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v11 label];
  id v13 = [v9 stringWithFormat:@"Entry.%@", v12];

  id v14 = NSString;
  v15 = [v11 label];
  v16 = [v14 stringWithFormat:@"Exit.%@", v15];

  v17 = [FIUIState alloc];
  v18 = NSString;
  v19 = [v11 label];
  id v20 = [v10 label];
  v21 = [v18 stringWithFormat:@"Transitional.%@.%@", v19, v20];
  v22 = [(FIUIState *)v17 initWithLabel:v21];

  [v11 registerTransition:a5 label:v13 toState:v22 handler:0 gate:0];
  [(FIUIState *)v22 registerTransition:a6 label:v16 toState:v10 handler:0 gate:0];

  [(FIUIState *)v22 setTransitional:1];
  return v22;
}

- (void)setTransitional:(BOOL)a3
{
  self->_transitional = a3;
}

- (id)transitionForEvent:(int64_t)a3
{
  id v5 = self->_transitions;
  objc_sync_enter(v5);
  transitions = self->_transitions;
  v7 = [NSNumber numberWithLong:a3];
  uint64_t v8 = [(NSMutableDictionary *)transitions objectForKeyedSubscript:v7];

  objc_sync_exit(v5);
  return v8;
}

- (id)exit
{
  return objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isTransitional
{
  return self->_transitional;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)FIUIState;
  v3 = [(FIUIState *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@"(%@)", self->_label];

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entryState);
  objc_storeStrong((id *)&self->_childStates, 0);
  objc_destroyWeak((id *)&self->_parentState);
  objc_storeStrong(&self->_exit, 0);
  objc_storeStrong(&self->_entry, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_transitions, 0);
}

+ (id)stateWithLabel:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLabel:v3];

  return v4;
}

- (void)enumerateEvents:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, uint64_t, uint64_t, void *, unsigned char *))a3;
  id v5 = self->_transitions;
  objc_sync_enter(v5);
  objc_super v6 = (void *)[(NSMutableDictionary *)self->_transitions copy];
  objc_sync_exit(v5);

  char v21 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = v6;
  v7 = [v6 allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      uint64_t v12 = [v11 event];
      id v13 = [v11 label];
      uint64_t v14 = [v13 UTF8String];
      v15 = [v11 toState];
      v4[2](v4, v12, v14, v15, &v21);

      if (v21) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addChildStates:(id)a3 withEntryState:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 setParentState:self];
        id v13 = [(FIUIState *)self childStates];
        [v13 addObject:v12];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(FIUIState *)self setEntryState:v7];
}

- (id)entry
{
  return objc_getProperty(self, a2, 32, 1);
}

- (FIUIState)parentState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentState);
  return (FIUIState *)WeakRetained;
}

- (void)setParentState:(id)a3
{
}

- (NSMutableSet)childStates
{
  return self->_childStates;
}

- (FIUIState)entryState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entryState);
  return (FIUIState *)WeakRetained;
}

- (void)setEntryState:(id)a3
{
}

@end