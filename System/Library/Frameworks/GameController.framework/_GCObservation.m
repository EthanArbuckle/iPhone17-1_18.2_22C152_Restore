@interface _GCObservation
- (_GCObservation)initWithCleanupHandler:(id)a3;
- (void)dealloc;
@end

@implementation _GCObservation

- (_GCObservation)initWithCleanupHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCObservation;
  v5 = [(_GCObservation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223C6E420](v4);
    id handler = v5->_handler;
    v5->_id handler = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  id handler = (void (**)(id, SEL))self->_handler;
  if (handler) {
    handler[2](handler, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)_GCObservation;
  [(_GCObservation *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end