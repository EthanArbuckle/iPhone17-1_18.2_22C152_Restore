@interface WFStorageServiceCancellableOperation
- (BOOL)isCancelled;
- (WFStorageServiceCancellableOperation)initWithCancelBlock:(id)a3;
- (id)cancelBlock;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
@end

@implementation WFStorageServiceCancellableOperation

- (void).cxx_destruct
{
}

- (void)setCancelBlock:(id)a3
{
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)cancel
{
  v3 = [(WFStorageServiceCancellableOperation *)self cancelBlock];
  if (v3) {
    v3[2]();
  }
  [(WFStorageServiceCancellableOperation *)self setCancelBlock:0];
}

- (BOOL)isCancelled
{
  v2 = [(WFStorageServiceCancellableOperation *)self cancelBlock];
  BOOL v3 = v2 == 0;

  return v3;
}

- (WFStorageServiceCancellableOperation)initWithCancelBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFStorageServiceCancellableOperation.m", 22, @"Invalid parameter not satisfying: %@", @"cancelBlock" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFStorageServiceCancellableOperation;
  v6 = [(WFStorageServiceCancellableOperation *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    id cancelBlock = v6->_cancelBlock;
    v6->_id cancelBlock = (id)v7;

    v9 = v6;
  }

  return v6;
}

@end