@interface __HMOperationQueueDelegateCaller
- (__HMOperationQueueDelegateCaller)init;
- (__HMOperationQueueDelegateCaller)initWithOperationQueue:(id)a3;
- (__HMOperationQueueDelegateCaller)initWithQueue:(id)a3;
- (void)invokeBlock:(id)a3;
@end

@implementation __HMOperationQueueDelegateCaller

- (void)invokeBlock:(id)a3
{
  if (a3) {
    -[NSOperationQueue addOperationWithBlock:](self->_queue, "addOperationWithBlock:");
  }
}

- (__HMOperationQueueDelegateCaller)initWithOperationQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMOperationQueueDelegateCaller;
  v6 = [(HMDelegateCaller *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (__HMOperationQueueDelegateCaller)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__HMOperationQueueDelegateCaller;
  id v5 = [(HMDelegateCaller *)&v9 initWithQueue:v4];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v5->_queue;
    v5->_queue = v6;

    [(NSOperationQueue *)v5->_queue setName:@"HomeKit Delegate Caller"];
    [(NSOperationQueue *)v5->_queue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_queue setUnderlyingQueue:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (__HMOperationQueueDelegateCaller)init
{
  v6.receiver = self;
  v6.super_class = (Class)__HMOperationQueueDelegateCaller;
  v2 = [(HMDelegateCaller *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F08] mainQueue];
    queue = v2->_queue;
    v2->_queue = (NSOperationQueue *)v3;
  }
  return v2;
}

@end