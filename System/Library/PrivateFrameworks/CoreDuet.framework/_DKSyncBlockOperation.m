@interface _DKSyncBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (BOOL)isAsynchronous;
- (NSMutableArray)blocks;
- (_DKSyncBlockOperation)init;
- (_DKSyncBlockOperation)initWithBlock:(id)a3;
- (id)executionBlocks;
- (void)addExecutionBlock:(id)a3;
- (void)main;
- (void)setAsynchronous:(BOOL)a3;
@end

@implementation _DKSyncBlockOperation

- (_DKSyncBlockOperation)init
{
  return [(_DKSyncBlockOperation *)self initWithBlock:0];
}

- (_DKSyncBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncBlockOperation;
  v5 = [(_DKSyncOperation *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)&v5->super._state + 1) = 0;
    uint64_t v7 = objc_opt_new();
    blocks = v6->_blocks;
    v6->_blocks = (NSMutableArray *)v7;

    if (v4)
    {
      v9 = v6->_blocks;
      v10 = (void *)MEMORY[0x192FB31A0](v4);
      [(NSMutableArray *)v9 addObject:v10];
    }
  }

  return v6;
}

+ (id)blockOperationWithBlock:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    [NSString stringWithFormat:@"%@: block is nil", a1];
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v8);
  }
  v5 = v4;
  v6 = [[_DKSyncBlockOperation alloc] initWithBlock:v4];

  return v6;
}

- (id)executionBlocks
{
  v3 = (os_unfair_lock_s *)(&self->super._state + 4);
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  id v4 = (void *)[(NSMutableArray *)self->_blocks copy];
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)addExecutionBlock:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    [NSString stringWithFormat:@"%@: block is nil", self];
LABEL_10:
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
    objc_exception_throw(v6);
  }
  if ([(_DKSyncOperation *)self isExecuting]
    || [(_DKSyncOperation *)self isFinished]
    || [(_DKSyncBlockOperation *)self isCancelled])
  {
    [NSString stringWithFormat:@"%@: blocks cannot be added after the operation has started executing or finished or cancelled", self];
    goto LABEL_10;
  }
  [(_DKSyncBlockOperation *)self willChangeValueForKey:@"executionBlocks"];
  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  blocks = self->_blocks;
  v5 = (void *)MEMORY[0x192FB31A0](v7);
  [(NSMutableArray *)blocks addObject:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&self->super._state + 1);
  [(_DKSyncBlockOperation *)self didChangeValueForKey:@"executionBlocks"];
}

- (void)main
{
  v3 = [(_DKSyncBlockOperation *)self executionBlocks];
  __DKSYNCBLOCKOPERATION_IS_CALLING_EXECUTION_BLOCKS__(v3);

  os_unfair_lock_lock((os_unfair_lock_t)&self->super._state + 1);
  blocks = self->_blocks;
  self->_blocks = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&self->super._state + 1);
}

- (BOOL)isAsynchronous
{
  return self->_lock._os_unfair_lock_opaque & 1;
}

- (void)setAsynchronous:(BOOL)a3
{
  LOBYTE(self->_lock._os_unfair_lock_opaque) = a3;
}

- (NSMutableArray)blocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
}

@end