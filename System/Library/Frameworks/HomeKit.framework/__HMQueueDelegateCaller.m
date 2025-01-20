@interface __HMQueueDelegateCaller
- (__HMQueueDelegateCaller)initWithQueue:(id)a3;
- (void)invokeBlock:(id)a3;
@end

@implementation __HMQueueDelegateCaller

- (void).cxx_destruct
{
}

- (void)invokeBlock:(id)a3
{
  if (a3) {
    dispatch_async((dispatch_queue_t)self->_queue, a3);
  }
}

- (__HMQueueDelegateCaller)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMQueueDelegateCaller;
  v6 = [(HMDelegateCaller *)&v9 initWithQueue:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end