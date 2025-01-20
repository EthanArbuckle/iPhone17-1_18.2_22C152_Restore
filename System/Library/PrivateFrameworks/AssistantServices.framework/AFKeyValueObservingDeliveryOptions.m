@interface AFKeyValueObservingDeliveryOptions
- (AFKeyValueObservingDeliveryOptions)initWithQueue:(id)a3 qosClass:(unsigned int)a4 asynchronous:(BOOL)a5;
- (BOOL)asynchronous;
- (OS_dispatch_queue)queue;
- (unsigned)qosClass;
@end

@implementation AFKeyValueObservingDeliveryOptions

- (void).cxx_destruct
{
}

- (BOOL)asynchronous
{
  return self->_asynchronous;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AFKeyValueObservingDeliveryOptions)initWithQueue:(id)a3 qosClass:(unsigned int)a4 asynchronous:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AFKeyValueObservingDeliveryOptions;
  v10 = [(AFKeyValueObservingDeliveryOptions *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_qosClass = a4;
    v11->_asynchronous = a5;
  }

  return v11;
}

@end