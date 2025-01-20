@interface CATState
+ (id)new;
- (CATState)init;
- (CATState)initWithName:(id)a3;
- (NSString)name;
- (SEL)enterAction;
- (SEL)exitAction;
- (id)description;
- (id)transitionWithTriggeringEvent:(id)a3;
- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4;
- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4 action:(SEL)a5;
- (void)setEnterAction:(SEL)a3;
- (void)setExitAction:(SEL)a3;
@end

@implementation CATState

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATState.m", 23, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATState)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATState.m", 30, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (CATState)initWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATState.m", 38, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CATState;
  v6 = [(CATState *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    name = v6->_name;
    v6->_name = (NSString *)v7;

    uint64_t v9 = objc_opt_new();
    mTransitionByTriggeringEvent = v6->mTransitionByTriggeringEvent;
    v6->mTransitionByTriggeringEvent = (NSMutableDictionary *)v9;
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CATState *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p { name = %@ }>", v4, self, v5];

  return v6;
}

- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4
{
}

- (void)addTransitionToState:(id)a3 triggeringEvent:(id)a4 action:(SEL)a5
{
  id v14 = a3;
  id v9 = a4;
  if (!v9)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CATState.m", 68, @"Invalid parameter not satisfying: %@", @"triggeringEvent" object file lineNumber description];
  }
  v10 = [(NSMutableDictionary *)self->mTransitionByTriggeringEvent objectForKeyedSubscript:v9];

  if (v10)
  {
    objc_super v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CATState.m", 69, @"%@ cannot add duplicate transition for %@", self, v9 object file lineNumber description];
  }
  v11 = [[CATTransition alloc] initWithState:v14 action:a5];
  [(NSMutableDictionary *)self->mTransitionByTriggeringEvent setObject:v11 forKeyedSubscript:v9];
}

- (id)transitionWithTriggeringEvent:(id)a3
{
  return (id)[(NSMutableDictionary *)self->mTransitionByTriggeringEvent objectForKeyedSubscript:a3];
}

- (NSString)name
{
  return self->_name;
}

- (SEL)enterAction
{
  if (self->_enterAction) {
    return self->_enterAction;
  }
  else {
    return 0;
  }
}

- (void)setEnterAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_enterAction = v3;
}

- (SEL)exitAction
{
  if (self->_exitAction) {
    return self->_exitAction;
  }
  else {
    return 0;
  }
}

- (void)setExitAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_exitAction = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->mTransitionByTriggeringEvent, 0);
}

@end