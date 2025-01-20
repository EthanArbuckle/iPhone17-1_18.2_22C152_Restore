@interface IMDReplayStorageIterationContext
- (IDSKVDeleteContext)deleteContext;
- (void)dealloc;
- (void)setDeleteContext:(id)a3;
@end

@implementation IMDReplayStorageIterationContext

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMDReplayStorageIterationContext;
  [(IMDReplayStorageIterationContext *)&v3 dealloc];
}

- (IDSKVDeleteContext)deleteContext
{
  return self->_deleteContext;
}

- (void)setDeleteContext:(id)a3
{
}

@end