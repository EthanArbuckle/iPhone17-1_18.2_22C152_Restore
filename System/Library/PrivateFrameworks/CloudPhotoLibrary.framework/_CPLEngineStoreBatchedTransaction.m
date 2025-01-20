@interface _CPLEngineStoreBatchedTransaction
- (_CPLEngineStoreBatchedTransaction)init;
- (id)block;
- (id)completionHandler;
- (void)_releaseDirty;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation _CPLEngineStoreBatchedTransaction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_dirty, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)_releaseDirty
{
  [(CPLTransaction *)self->_dirty endTransaction];
  dirty = self->_dirty;
  self->_dirty = 0;
}

- (void)dealloc
{
  [(CPLTransaction *)self->_dirty endTransaction];
  v3.receiver = self;
  v3.super_class = (Class)_CPLEngineStoreBatchedTransaction;
  [(_CPLEngineStoreBatchedTransaction *)&v3 dealloc];
}

- (_CPLEngineStoreBatchedTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)_CPLEngineStoreBatchedTransaction;
  v2 = [(_CPLEngineStoreBatchedTransaction *)&v6 init];
  if (v2)
  {
    objc_super v3 = +[CPLTransaction newTransactionWithIdentifier:@"cpl.store.batchwrite" description:@"batch write" keepPower:1];
    dirty = v2->_dirty;
    v2->_dirty = v3;
  }
  return v2;
}

@end