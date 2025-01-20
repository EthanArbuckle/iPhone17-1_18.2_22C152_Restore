@interface NSReduceObservationTransformer
+ (id)reduceValue:(id)a3 withReducer:(id)a4;
- (NSReduceObservationTransformer)initWithBlock:(id)a3 initialValue:(id)a4;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)finishObserving;
@end

@implementation NSReduceObservationTransformer

+ (id)reduceValue:(id)a3 withReducer:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithBlock:a4 initialValue:a3];

  return v4;
}

- (void)finishObserving
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id accumulator = self->_accumulator;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v11 = __49__NSReduceObservationTransformer_finishObserving__block_invoke;
  v12 = &unk_1E51F76A8;
  v13 = self;
  v14[0] = 0;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v14);
  MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
  v7 = objc_constructInstance(v6, (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7[6] = 1;
  *((void *)v7 + 1) = accumulator;
  *((void *)v7 + 2) = self;
  v11((uint64_t)v10, (uint64_t)v7);
  v9.receiver = self;
  v9.super_class = (Class)NSReduceObservationTransformer;
  [(NSReduceObservationTransformer *)&v9 finishObserving];
}

id __49__NSReduceObservationTransformer_finishObserving__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)NSReduceObservationTransformer;
  return objc_msgSendSuper2(&v3, sel__receiveBox_, a2);
}

- (void)_receiveBox:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = *((_DWORD *)a3 + 6);
  if (v3 == 1)
  {
    id accumulator = self->_accumulator;
    self->_id accumulator = (id)(*((uint64_t (**)(void))self->_reducer + 2))();
  }
  else if (v3 == 3)
  {
    [(NSReduceObservationTransformer *)self finishObserving];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)NSReduceObservationTransformer;
    -[NSReduceObservationTransformer _receiveBox:](&v5, sel__receiveBox_);
  }
}

- (NSReduceObservationTransformer)initWithBlock:(id)a3 initialValue:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSReduceObservationTransformer;
  uint64_t v6 = [(NSReduceObservationTransformer *)&v8 init];
  if (v6)
  {
    v6->_reducer = (id)[a3 copy];
    v6->_id accumulator = a4;
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSReduceObservationTransformer;
  [(NSObservationSource *)&v3 dealloc];
}

@end