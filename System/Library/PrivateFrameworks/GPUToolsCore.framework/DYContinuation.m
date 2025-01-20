@interface DYContinuation
- (DYContinuation)init;
- (DYContinuation)initWithQueue:(id)a3 block:(id)a4;
- (void)dealloc;
- (void)dispatch;
@end

@implementation DYContinuation

- (DYContinuation)init
{
  return 0;
}

- (DYContinuation)initWithQueue:(id)a3 block:(id)a4
{
  if (!a3) {
    dy_abort("queue cannot be NULL", a2, 0, a4);
  }
  if (!a4) {
    dy_abort("block cannot be NULL", a2);
  }
  v8.receiver = self;
  v8.super_class = (Class)DYContinuation;
  v6 = [(DYContinuation *)&v8 init];
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->queue = (OS_dispatch_queue *)a3;
    v6->block = (id)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->queue);
  v3.receiver = self;
  v3.super_class = (Class)DYContinuation;
  [(DYContinuation *)&v3 dealloc];
}

- (void)dispatch
{
}

@end