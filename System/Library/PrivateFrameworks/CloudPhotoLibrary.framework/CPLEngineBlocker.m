@interface CPLEngineBlocker
- (CPLEngineBlocker)initWithWriteTransactionBlocker:(id)a3 schedulerBlocker:(id)a4;
- (CPLEngineSchedulerBlocker)schedulerBlocker;
- (CPLEngineWriteTransactionBlocker)writeTransactionBlocker;
- (void)dealloc;
- (void)unblock;
@end

@implementation CPLEngineBlocker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerBlocker, 0);
  objc_storeStrong((id *)&self->_writeTransactionBlocker, 0);
}

- (CPLEngineSchedulerBlocker)schedulerBlocker
{
  return self->_schedulerBlocker;
}

- (CPLEngineWriteTransactionBlocker)writeTransactionBlocker
{
  return self->_writeTransactionBlocker;
}

- (void)unblock
{
  self->_blocking = 0;
}

- (void)dealloc
{
  if (self->_blocking)
  {
    [(CPLEngineWriteTransactionBlocker *)self->_writeTransactionBlocker unblock];
    [(CPLEngineSchedulerBlocker *)self->_schedulerBlocker unblock];
  }
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineBlocker;
  [(CPLEngineBlocker *)&v3 dealloc];
}

- (CPLEngineBlocker)initWithWriteTransactionBlocker:(id)a3 schedulerBlocker:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLEngineBlocker;
  v9 = [(CPLEngineBlocker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_writeTransactionBlocker, a3);
    objc_storeStrong((id *)&v10->_schedulerBlocker, a4);
    v10->_blocking = 1;
  }

  return v10;
}

@end