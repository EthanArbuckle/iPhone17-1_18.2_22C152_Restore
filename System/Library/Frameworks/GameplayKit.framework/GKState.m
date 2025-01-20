@interface GKState
+ (GKState)state;
- (BOOL)isValidNextState:(Class)stateClass;
- (GKState)init;
- (GKStateMachine)stateMachine;
- (void)_setStateMachine:(id)a3;
@end

@implementation GKState

+ (GKState)state
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return (GKState *)v2;
}

- (GKState)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKState;
  return [(GKState *)&v3 init];
}

- (BOOL)isValidNextState:(Class)stateClass
{
  uint64_t v4 = objc_opt_class();

  return [(objc_class *)stateClass isSubclassOfClass:v4];
}

- (GKStateMachine)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);

  return (GKStateMachine *)WeakRetained;
}

- (void)_setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end