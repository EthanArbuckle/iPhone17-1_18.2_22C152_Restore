@interface _SYIncomingBatch
- (SYBatchSyncChunk)batch;
- (id)completion;
- (void)setBatch:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation _SYIncomingBatch

- (SYBatchSyncChunk)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_batch, 0);
}

@end