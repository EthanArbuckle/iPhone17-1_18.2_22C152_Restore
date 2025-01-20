@interface BSBlockTransaction
- (BOOL)_canBeInterrupted;
- (BSBlockTransaction)initWithBlock:(id)a3;
- (NSString)debugName;
- (id)_descriptionProem;
- (id)_graphNodeDebugName;
- (void)_begin;
- (void)setDebugName:(id)a3;
@end

@implementation BSBlockTransaction

- (id)_descriptionProem
{
  v3 = [(BSBlockTransaction *)self debugName];
  if (v3)
  {
    v4 = NSString;
    v10.receiver = self;
    v10.super_class = (Class)BSBlockTransaction;
    v5 = [(BSTransaction *)&v10 _descriptionProem];
    v6 = [(BSBlockTransaction *)self debugName];
    v7 = [v4 stringWithFormat:@"%@: %@", v5, v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BSBlockTransaction;
    v7 = [(BSTransaction *)&v9 _descriptionProem];
  }

  return v7;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void)setDebugName:(id)a3
{
}

- (void)_begin
{
  v10.receiver = self;
  v10.super_class = (Class)BSBlockTransaction;
  [(BSTransaction *)&v10 _begin];
  [(BSTransaction *)self addMilestone:@"awaitingCompletion"];
  block = (void (**)(void))self->_block;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  v7 = __28__BSBlockTransaction__begin__block_invoke;
  v8 = &unk_1E54463D8;
  objc_super v9 = self;
  block[2]();
  id v4 = self->_block;
  self->_block = 0;
}

uint64_t __28__BSBlockTransaction__begin__block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 satisfyMilestone:@"awaitingCompletion"];
  }
  else {
    return [v2 failWithReason:@"Completion block indicated failure."];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong(&self->_block, 0);
}

- (BSBlockTransaction)initWithBlock:(id)a3
{
  if (!a3)
  {
    objc_super v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"BSBlockTransaction.m", 26, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)BSBlockTransaction;
  uint64_t v5 = [(BSTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [a3 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_graphNodeDebugName
{
  v3 = [(BSBlockTransaction *)self debugName];
  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v7 = [(BSBlockTransaction *)self debugName];
    v8 = [v4 stringWithFormat:@"%@(%@)", v6, v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BSBlockTransaction;
    v8 = [(BSTransaction *)&v10 _graphNodeDebugName];
  }

  return v8;
}

@end