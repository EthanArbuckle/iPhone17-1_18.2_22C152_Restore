@interface _BSServiceDispatchingQueueImpl
- (id)backingQueueIfExists;
- (id)initWithQueue:(id *)a1;
- (void)assertBarrierOnQueue;
- (void)performAsync:(id)a3;
- (void)performAsync:(id)a3 withHandoff:(id)a4;
@end

@implementation _BSServiceDispatchingQueueImpl

- (void)assertBarrierOnQueue
{
}

- (void)performAsync:(id)a3
{
}

- (id)backingQueueIfExists
{
  return self->_queue;
}

- (void)performAsync:(id)a3 withHandoff:(id)a4
{
}

- (void).cxx_destruct
{
}

- (id)initWithQueue:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_BSServiceDispatchingQueueImpl;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

@end