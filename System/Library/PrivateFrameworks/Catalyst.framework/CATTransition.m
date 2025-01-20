@interface CATTransition
+ (id)new;
- (CATState)state;
- (CATTransition)init;
- (CATTransition)initWithState:(id)a3 action:(SEL)a4;
- (SEL)action;
- (id)description;
@end

@implementation CATTransition

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, @"CATTransition.m", 21, @"%@ cannot call %@", a1, v5 object file lineNumber description];

  return 0;
}

- (CATTransition)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"CATTransition.m", 28, @"%@ cannot call %@", v5, v6 object file lineNumber description];

  return 0;
}

- (CATTransition)initWithState:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CATTransition;
  v7 = [(CATTransition *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_state, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_action) {
    action = self->_action;
  }
  else {
    action = 0;
  }
  id v6 = NSStringFromSelector(action);
  v7 = [(CATTransition *)self state];
  v8 = [v7 name];
  SEL v9 = [v3 stringWithFormat:@"<%@: %p { action = %@, state = %@ }>", v4, self, v6, v8];

  return v9;
}

- (CATState)state
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_state);

  return (CATState *)WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end