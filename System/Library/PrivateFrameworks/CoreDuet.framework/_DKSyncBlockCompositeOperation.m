@interface _DKSyncBlockCompositeOperation
+ blockCompositeOperationWithBlock:(uint64_t)a1;
- (BOOL)isAsynchronous;
- (NSMutableArray)blocks;
- initWithParent:(void *)a3 block:;
- (id)executionBlocks;
- (void)main;
@end

@implementation _DKSyncBlockCompositeOperation

- initWithParent:(void *)a3 block:
{
  id v5 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)_DKSyncBlockCompositeOperation;
    v6 = objc_msgSendSuper2(&v13, sel_initWithParent_, a2);
    v7 = v6;
    if (v6)
    {
      v6[74] = 0;
      uint64_t v8 = objc_opt_new();
      v9 = (void *)*((void *)v7 + 38);
      *((void *)v7 + 38) = v8;

      if (v5)
      {
        v10 = (void *)*((void *)v7 + 38);
        v11 = (void *)MEMORY[0x192FB31A0](v5);
        [v10 addObject:v11];
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ blockCompositeOperationWithBlock:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  if (!v2)
  {
    [NSString stringWithFormat:@"%@: block is nil", v3];
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v7);
  }
  v4 = [_DKSyncBlockCompositeOperation alloc];
  if (v4) {
    id v5 = -[_DKSyncBlockCompositeOperation initWithParent:block:](v4, 0, v2);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)executionBlocks
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSMutableArray *)self->_blocks copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)main
{
  uint64_t v3 = [(_DKSyncBlockCompositeOperation *)self executionBlocks];
  __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(v3);

  os_unfair_lock_lock(&self->_lock);
  blocks = self->_blocks;
  self->_blocks = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableArray)blocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 304, 1);
}

- (void).cxx_destruct
{
}

@end