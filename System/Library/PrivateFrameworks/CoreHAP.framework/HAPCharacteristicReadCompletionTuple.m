@interface HAPCharacteristicReadCompletionTuple
+ (id)readCompletionTupleWithHandler:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)completionQueue;
- (id)handler;
- (void)setCompletionQueue:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation HAPCharacteristicReadCompletionTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

+ (id)readCompletionTupleWithHandler:(id)a3 queue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HAPCharacteristicReadCompletionTuple);
  [(HAPCharacteristicReadCompletionTuple *)v7 setHandler:v6];

  [(HAPCharacteristicReadCompletionTuple *)v7 setCompletionQueue:v5];

  return v7;
}

@end