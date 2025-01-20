@interface NSBlockOperation
+ (NSBlockOperation)blockOperationWithBlock:(void *)block;
- (NSArray)executionBlocks;
- (NSBlockOperation)init;
- (NSBlockOperation)initWithBlock:(id)a3;
- (void)addExecutionBlock:(void *)block;
- (void)dealloc;
- (void)main;
@end

@implementation NSBlockOperation

- (void)main
{
  v8[7] = *MEMORY[0x1E4F143B8];
  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  id block = self->_block;
  if (!block)
  {
    v5 = (void *)[(NSMutableArray *)self->_executionBlocks count];
    v6 = NSAllocateObjectArray((unint64_t)v5);
    -[NSMutableArray getObjects:range:](self->_executionBlocks, "getObjects:range:", v6, 0, v5);
    os_unfair_lock_unlock(p_lock);
LABEL_8:
    v7 = +[NSOperationQueue currentQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __24__NSBlockOperation_main__block_invoke;
    v8[3] = &unk_1E51F9658;
    v8[4] = v7;
    v8[5] = self;
    v8[6] = v6;
    dispatch_apply((size_t)v5, 0, v8);
    free(v6);
    return;
  }
  v5 = _Block_copy(block);
  os_unfair_lock_unlock(p_lock);
  if (!v5)
  {
    v6 = 0;
    goto LABEL_8;
  }
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)v5);

  _Block_release(v5);
}

+ (NSBlockOperation)blockOperationWithBlock:(void *)block
{
  v3 = (void *)[objc_alloc((Class)a1) initWithBlock:block];

  return (NSBlockOperation *)v3;
}

- (NSBlockOperation)initWithBlock:(id)a3
{
  v5 = [(NSBlockOperation *)self init];
  v6 = v5;
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:@"%@: block is nil", _NSMethodExceptionProem((objc_class *)v5, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }
  v5->_id block = _Block_copy(a3);
  return v6;
}

- (NSBlockOperation)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSBlockOperation;
  return [(NSOperation *)&v3 init];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSBlockOperation;
  [(NSOperation *)&v4 dealloc];
}

- (void)addExecutionBlock:(void *)block
{
  if (!block)
  {
    v9 = +[NSString stringWithFormat:@"%@: block is nil", _NSMethodExceptionProem((objc_class *)self, a2)];
LABEL_15:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v9 userInfo:0]);
  }
  if ([(NSOperation *)self isExecuting] || [(NSOperation *)self isFinished])
  {
    v9 = +[NSString stringWithFormat:@"%@: blocks cannot be added after the operation has started executing or finished", _NSMethodExceptionProem((objc_class *)self, a2)];
    goto LABEL_15;
  }
  os_unfair_lock_lock(&self->super._iop.__lock);
  executionBlocks = self->_executionBlocks;
  if (self->_block)
  {
    if (!executionBlocks)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      self->_executionBlocks = v7;
      [(NSMutableArray *)v7 addObject:self->_block];
      _Block_release(self->_block);
      self->_id block = 0;
    }
    goto LABEL_8;
  }
  if (executionBlocks)
  {
LABEL_8:
    v8 = _Block_copy(block);
    [(NSMutableArray *)self->_executionBlocks addObject:v8];
    _Block_release(v8);
    goto LABEL_9;
  }
  self->_id block = _Block_copy(block);
LABEL_9:

  os_unfair_lock_unlock(&self->super._iop.__lock);
}

uint64_t __24__NSBlockOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  _CFSetTSD();
  _CFSetTSD();
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__(*(void *)(*(void *)(a1 + 48) + 8 * a2));
  _CFSetTSD();

  return _CFSetTSD();
}

- (NSArray)executionBlocks
{
  objc_super v3 = (NSArray *)(id)objc_opt_new();
  os_unfair_lock_lock(&self->super._iop.__lock);
  if (self->_block)
  {
    -[NSArray addObject:](v3, "addObject:");
  }
  else if (self->_executionBlocks)
  {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  os_unfair_lock_unlock(&self->super._iop.__lock);
  return v3;
}

@end