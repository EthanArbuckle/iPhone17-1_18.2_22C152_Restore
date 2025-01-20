@interface HAPBTLEReachabilityScanTuple
+ (id)reachabilityScanTupleWithCompletion:(id)a3 workQueue:(id)a4 identifier:(id)a5;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (id)completion;
@end

@implementation HAPBTLEReachabilityScanTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)completion
{
  return self->_completion;
}

+ (id)reachabilityScanTupleWithCompletion:(id)a3 workQueue:(id)a4 identifier:(id)a5
{
  v7 = (OS_dispatch_queue *)a4;
  v8 = (NSString *)a5;
  id v9 = a3;
  v10 = objc_alloc_init(HAPBTLEReachabilityScanTuple);
  uint64_t v11 = MEMORY[0x1D944E2D0](v9);

  id completion = v10->_completion;
  v10->_id completion = (id)v11;

  queue = v10->_queue;
  v10->_queue = v7;
  v14 = v7;

  identifier = v10->_identifier;
  v10->_identifier = v8;

  return v10;
}

@end