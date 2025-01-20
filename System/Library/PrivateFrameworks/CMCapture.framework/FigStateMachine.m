@interface FigStateMachine
+ (int)indexForState:(unsigned int)a3;
+ (void)initialize;
- (BOOL)performsAtomicStateTransitions;
- (BOOL)transitionToState:(unsigned int)a3;
- (BOOL)transitionToState:(unsigned int)a3 errorStatus:(int)a4;
- (BOOL)transitionToState:(unsigned int)a3 fromState:(unsigned int)a4;
- (BOOL)transitionToState:(unsigned int)a3 fromStates:(unsigned int)a4;
- (FigStateMachine)initWithLabel:(id)a3 stateCount:(char)a4 initialState:(unsigned int)a5 owner:(id)a6;
- (NSString)currentStateLabel;
- (NSString)label;
- (id)description;
- (id)labelForState:(unsigned int)a3;
- (uint64_t)_transitionToState:(uint64_t)a1 fromStates:(unsigned int)a2 errorStatus:(int)a3;
- (unsigned)currentState;
- (void)dealloc;
- (void)markStateAsTerminal:(unsigned int)a3;
- (void)setLabel:(id)a3 forState:(unsigned int)a4;
- (void)setPerformsAtomicStateTransitions:(BOOL)a3;
- (void)whenTransitioningFromState:(unsigned int)a3 toState:(unsigned int)a4 callHandler:(id)a5;
- (void)whenTransitioningToState:(unsigned int)a3 callHandler:(id)a4;
- (void)whenTransitioningToStateFails:(unsigned int)a3 callHandler:(id)a4;
- (void)whenTransitioningToStates:(unsigned int)a3 callHandler:(id)a4;
- (void)whenTransitioningToStatesFail:(unsigned int)a3 callHandler:(id)a4;
@end

@implementation FigStateMachine

- (void)whenTransitioningFromState:(unsigned int)a3 toState:(unsigned int)a4 callHandler:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__FigStateMachine_whenTransitioningFromState_toState_callHandler___block_invoke;
  v5[3] = &unk_1E5C2C2C0;
  unsigned int v6 = a3;
  v5[4] = a5;
  [(FigStateMachine *)self whenTransitioningToState:*(void *)&a4 callHandler:v5];
}

- (void)whenTransitioningToState:(unsigned int)a3 callHandler:(id)a4
{
  stateConfigurations = self->_stateConfigurations;
  unsigned int v5 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && (int)v6 < self->_stateCount && stateConfigurations != 0)
  {
    uint64_t v9 = [a4 copy];
    if (v9)
    {
      id v10 = (id)v9;
      v11 = &stateConfigurations[v6];
      id var1 = v11->var1;
      p_id var1 = &v11->var1;
      v12 = var1;
      id v15 = v10;
      if (!var1)
      {
        v12 = objc_opt_new();
        id v10 = v15;
        id *p_var1 = v12;
      }
      [v12 addObject:v10];
    }
  }
}

- (void)setLabel:(id)a3 forState:(unsigned int)a4
{
  unsigned int v4 = __clz(__rbit32(a4));
  if (a4 != 0 && (a4 & (a4 - 1)) == 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  if (a4 != 0 && (a4 & (a4 - 1)) == 0 && (int)v5 < self->_stateCount) {
    uint64_t v6 = &self->_stateConfigurations[v5];
  }
  else {
    uint64_t v6 = 0;
  }
  id var3 = v6->var3;
  if (var3 != a3)
  {

    v6->id var3 = (id)[a3 copy];
  }
}

- (FigStateMachine)initWithLabel:(id)a3 stateCount:(char)a4 initialState:(unsigned int)a5 owner:(id)a6
{
  unsigned int v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FigStateMachine;
  id v10 = [(FigStateMachine *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_owner = a6;
    v10->_label = (NSString *)[a3 copy];
    v11->_currentState = a5;
    v11->_stateCount = v8;
    if (v8 < 0x21)
    {
      v11->_stateConfigurations = (FigStateMachineStateConfiguration *)malloc_type_calloc(v8, 0x20uLL, 0x10800400F6048E3uLL);
      v11->_lock._os_unfair_lock_opaque = 0;
      v11->_performsAtomicStateTransitions = 1;
    }
    else
    {

      return 0;
    }
  }
  return v11;
}

- (void)whenTransitioningToStates:(unsigned int)a3 callHandler:(id)a4
{
  id v9 = (id)[a4 copy];
  int stateCount = self->_stateCount;
  if (stateCount >= 1)
  {
    for (int i = 0; i != stateCount; ++i)
    {
      if (((1 << i) & a3) != 0) {
        [(FigStateMachine *)self whenTransitioningToState:(1 << i) & a3 callHandler:a4];
      }
    }
  }
}

- (void)markStateAsTerminal:(unsigned int)a3
{
  stateConfigurations = self->_stateConfigurations;
  unsigned int v4 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0) {
    int v5 = v4;
  }
  else {
    int v5 = -1;
  }
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && v5 < self->_stateCount && stateConfigurations != 0) {
    stateConfigurations[v5].var0 = 1;
  }
}

- (void)setPerformsAtomicStateTransitions:(BOOL)a3
{
  self->_performsAtomicStateTransitions = a3;
}

- (void)whenTransitioningToStatesFail:(unsigned int)a3 callHandler:(id)a4
{
  id v9 = (id)[a4 copy];
  int stateCount = self->_stateCount;
  if (stateCount >= 1)
  {
    for (int i = 0; i != stateCount; ++i)
    {
      if (((1 << i) & a3) != 0) {
        [(FigStateMachine *)self whenTransitioningToStateFails:(1 << i) & a3 callHandler:a4];
      }
    }
  }
}

- (void)whenTransitioningToStateFails:(unsigned int)a3 callHandler:(id)a4
{
  stateConfigurations = self->_stateConfigurations;
  unsigned int v5 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  if (a3 != 0 && (a3 & (a3 - 1)) == 0 && (int)v6 < self->_stateCount && stateConfigurations != 0)
  {
    uint64_t v9 = [a4 copy];
    if (v9)
    {
      id v10 = (id)v9;
      v11 = &stateConfigurations[v6];
      id var2 = v11->var2;
      p_id var2 = &v11->var2;
      v12 = var2;
      id v15 = v10;
      if (!var2)
      {
        v12 = objc_opt_new();
        id v10 = v15;
        id *p_var2 = v12;
      }
      [v12 addObject:v10];
    }
  }
}

- (unsigned)currentState
{
  if (!self->_performsAtomicStateTransitions) {
    return self->_currentState;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned int currentState = self->_currentState;
  os_unfair_lock_unlock(p_lock);
  return currentState;
}

- (BOOL)transitionToState:(unsigned int)a3
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, 0);
}

+ (void)initialize
{
}

+ (int)indexForState:(unsigned int)a3
{
  BOOL v3 = (a3 & (a3 - 1)) != 0 || a3 == 0;
  int v4 = __clz(__rbit32(a3));
  if (v3) {
    return -1;
  }
  else {
    return v4;
  }
}

- (uint64_t)_transitionToState:(uint64_t)a1 fromStates:(unsigned int)a2 errorStatus:(int)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(a1 + 20);
  if (*(unsigned char *)(a1 + 20)) {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  }
  unsigned int v7 = *(_DWORD *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(char *)(a1 + 40);
  LODWORD(v10) = __clz(__rbit32(v7));
  BOOL v11 = a2 != 0;
  int8x8_t v12 = vbic_s8((int8x8_t)vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v7, a2), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v7, a2), (int32x2_t)-1))), (int8x8_t)vceqz_s32((int32x2_t)__PAIR64__(v7, a2)));
  if (((v7 != 0) & v12.i8[4]) != 0) {
    uint64_t v10 = v10;
  }
  else {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  BOOL v13 = (int)v10 < v9;
  v14 = (unsigned char *)(v8 + 32 * v10);
  if (((v7 != 0) & v12.i8[4] & v13) != 0) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }
  unsigned int v16 = __clz(__rbit32(a2));
  unsigned __int8 v17 = v11 & v12.i8[0];
  if ((v11 & v12.i32[0]) != 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = 0xFFFFFFFFLL;
  }
  uint64_t v19 = v8 + 32 * v18;
  if ((v17 & ((int)v18 < v9)) == 0) {
    uint64_t v19 = 0;
  }
  if (v15) {
    BOOL v20 = v19 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    if (v7 != a2 && (!a3 || (v7 & a3) != 0) && !*v15)
    {
      *(_DWORD *)(a1 + 24) = a2;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v28 = *(void **)(v19 + 8);
      uint64_t v29 = [v28 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v28);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v37 + 1) + 8 * i) + 16))();
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v30);
      }
      uint64_t v26 = 1;
      if (v6) {
        goto LABEL_31;
      }
      return v26;
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v21 = *(void **)(v19 + 16);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v33 + 1) + 8 * j) + 16))();
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v23);
    }
  }
  uint64_t v26 = 0;
  if (v6) {
LABEL_31:
  }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  return v26;
}

- (BOOL)transitionToState:(unsigned int)a3 fromState:(unsigned int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, a4);
}

uint64_t __66__FigStateMachine_whenTransitioningFromState_toState_callHandler___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(_DWORD *)(result + 40) == a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)labelForState:(unsigned int)a3
{
  stateConfigurations = self->_stateConfigurations;
  unsigned int v4 = __clz(__rbit32(a3));
  if (a3 != 0 && (a3 & (a3 - 1)) == 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  if (a3 == 0 || (a3 & (a3 - 1)) != 0 || (int)v5 >= self->_stateCount || stateConfigurations == 0) {
    return 0;
  }
  else {
    return stateConfigurations[v5].var3;
  }
}

- (NSString)currentStateLabel
{
  uint64_t v3 = [(FigStateMachine *)self currentState];
  return (NSString *)[(FigStateMachine *)self labelForState:v3];
}

- (void)dealloc
{
  stateConfigurations = self->_stateConfigurations;
  if (stateConfigurations)
  {
    if (self->_stateCount >= 1)
    {
      unint64_t v4 = 0;
      uint64_t v5 = 32 * self->_stateCount;
      do
      {

        v4 += 32;
      }
      while (v5 != v4);
      stateConfigurations = self->_stateConfigurations;
    }
    free(stateConfigurations);
  }

  v6.receiver = self;
  v6.super_class = (Class)FigStateMachine;
  [(FigStateMachine *)&v6 dealloc];
}

- (BOOL)transitionToState:(unsigned int)a3 errorStatus:(int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, 0);
}

- (BOOL)transitionToState:(unsigned int)a3 fromStates:(unsigned int)a4
{
  return -[FigStateMachine _transitionToState:fromStates:errorStatus:]((uint64_t)self, a3, a4);
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  uint64_t v3 = NSString;
  label = self->_label;
  if (!label)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    label = NSStringFromClass(v5);
  }
  return (id)[v3 stringWithFormat:@"<%@ %p>", label, self];
}

- (BOOL)performsAtomicStateTransitions
{
  return self->_performsAtomicStateTransitions;
}

@end