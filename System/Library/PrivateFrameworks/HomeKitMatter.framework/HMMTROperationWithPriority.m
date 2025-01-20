@interface HMMTROperationWithPriority
- (HMMTROperationWithPriority)initWithQueuePriority:(int64_t)a3 block:(id)a4;
- (id)operationBlock;
- (void)main;
@end

@implementation HMMTROperationWithPriority

- (void).cxx_destruct
{
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (void)main
{
  v2 = [(HMMTROperationWithPriority *)self operationBlock];
  v2[2]();
}

- (HMMTROperationWithPriority)initWithQueuePriority:(int64_t)a3 block:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMMTROperationWithPriority;
  v7 = [(HMMTROperationWithPriority *)&v11 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x2533B66E0](v6);
    id operationBlock = v7->_operationBlock;
    v7->_id operationBlock = (id)v8;

    [(HMMTROperationWithPriority *)v7 setQueuePriority:a3];
  }

  return v7;
}

@end