@interface HKStateMachineTransition
- (BOOL)isEqual:(id)a3;
- (HKStateMachineState)fromState;
- (HKStateMachineState)toState;
- (HKStateMachineTransition)init;
- (HKStateMachineTransition)initWithEvent:(int64_t)a3 label:(id)a4 from:(id)a5 to:(id)a6;
- (NSString)label;
- (id)description;
- (int64_t)event;
@end

@implementation HKStateMachineTransition

- (HKStateMachineTransition)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKStateMachineTransition)initWithEvent:(int64_t)a3 label:(id)a4 from:(id)a5 to:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HKStateMachineTransition;
  v13 = [(HKStateMachineTransition *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_event = a3;
    uint64_t v15 = [v10 copy];
    label = v14->_label;
    v14->_label = (NSString *)v15;

    objc_storeWeak((id *)&v14->_fromState, v11);
    objc_storeWeak((id *)&v14->_toState, v12);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  int64_t event = self->_event;
  label = self->_label;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromState);
  id v7 = objc_loadWeakRetained((id *)&self->_toState);
  v8 = [v3 stringWithFormat:@"<%@(%ld): %@ -> %@>", label, event, WeakRetained, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t event = self->_event;
    if (v4[1] && [(NSString *)self->_label isEqualToString:v4[2]])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_toState);
      id v7 = objc_loadWeakRetained(v4 + 4);
      if ([WeakRetained isEqual:v7])
      {
        id v8 = objc_loadWeakRetained((id *)&self->_fromState);
        id v9 = objc_loadWeakRetained(v4 + 3);
        uint64_t v10 = [v8 isEqual:v9];
      }
      else
      {
        uint64_t v10 = 0;
      }
      BOOL v11 = event == v10;
    }
    else
    {
      BOOL v11 = event == 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)event
{
  return self->_event;
}

- (NSString)label
{
  return self->_label;
}

- (HKStateMachineState)fromState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fromState);

  return (HKStateMachineState *)WeakRetained;
}

- (HKStateMachineState)toState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toState);

  return (HKStateMachineState *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toState);
  objc_destroyWeak((id *)&self->_fromState);

  objc_storeStrong((id *)&self->_label, 0);
}

@end