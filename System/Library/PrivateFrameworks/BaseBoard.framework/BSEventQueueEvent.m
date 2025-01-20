@interface BSEventQueueEvent
+ (BSEventQueueEvent)eventWithName:(id)a3 handler:(id)a4;
- (NSString)name;
- (id)description;
- (void)execute;
@end

@implementation BSEventQueueEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_handler, 0);
}

+ (BSEventQueueEvent)eventWithName:(id)a3 handler:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"BSEventQueueEvent.m", 20, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"BSEventQueueEvent.m", 21, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

LABEL_3:
  v8 = objc_alloc_init((Class)a1);
  if (v8)
  {
    uint64_t v9 = [a3 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;

    uint64_t v11 = [a4 copy];
    v12 = (void *)v8[1];
    v8[1] = v11;
  }
  return (BSEventQueueEvent *)v8;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:0];
  v5 = [v3 build];

  return v5;
}

- (void)execute
{
  if (self)
  {
    handler = (void (**)(void))self->_handler;
    if (handler) {
      handler[2]();
    }
  }
}

@end