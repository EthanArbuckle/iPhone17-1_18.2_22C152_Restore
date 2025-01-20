@interface CATStateMachineEvent
+ (id)eventWithTrigger:(id)a3 context:(id)a4;
- (CATStateMachineEvent)initWithEventTrigger:(id)a3 context:(id)a4;
- (id)context;
- (id)description;
- (id)trigger;
@end

@implementation CATStateMachineEvent

- (id)description
{
  v2 = [(CATStateMachineEvent *)self trigger];
  v3 = [v2 description];

  return v3;
}

+ (id)eventWithTrigger:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithEventTrigger:v7 context:v6];

  return v8;
}

- (CATStateMachineEvent)initWithEventTrigger:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CATStateMachine.m", 293, @"Invalid parameter not satisfying: %@", @"trigger" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)CATStateMachineEvent;
  v9 = [(CATStateMachineEvent *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    id trigger = v9->_trigger;
    v9->_id trigger = (id)v10;

    objc_storeStrong(&v9->_context, a4);
  }

  return v9;
}

- (id)trigger
{
  return self->_trigger;
}

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);

  objc_storeStrong(&self->_trigger, 0);
}

@end