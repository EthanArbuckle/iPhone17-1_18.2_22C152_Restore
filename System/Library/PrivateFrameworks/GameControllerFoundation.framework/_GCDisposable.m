@interface _GCDisposable
- (_GCDisposable)initWithCleanupHandler:(id)a3;
- (void)dealloc;
@end

@implementation _GCDisposable

- (_GCDisposable)initWithCleanupHandler:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_GCDisposable;
  id v3 = a3;
  v4 = [(_GCDisposable *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  id handler = v4->_handler;
  v4->_id handler = (id)v5;

  return v4;
}

- (void)dealloc
{
  id handler = (void (**)(id, SEL))self->_handler;
  if (handler)
  {
    handler[2](handler, a2);
    id v4 = self->_handler;
    self->_id handler = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCDisposable;
  [(_GCDisposable *)&v5 dealloc];
}

- (void).cxx_destruct
{
}

@end