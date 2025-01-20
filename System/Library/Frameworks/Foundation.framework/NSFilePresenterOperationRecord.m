@interface NSFilePresenterOperationRecord
+ (id)operationRecordWithDescription:(id)a3 reactor:(id)a4;
- (NSString)operationDescription;
- (id)_reactorQueue;
- (id)description;
- (id)reactor;
- (int64_t)state;
- (void)dealloc;
- (void)didBegin;
- (void)didEnd;
- (void)willEnd;
@end

@implementation NSFilePresenterOperationRecord

+ (id)operationRecordWithDescription:(id)a3 reactor:(id)a4
{
  id v6 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v6 + 1) = [a3 copy];
  objc_storeWeak((id *)v6 + 3, a4);
  *((void *)v6 + 4) = objc_msgSend(+[NSFileAccessArbiterProxy _idForReactor:](NSFileAccessArbiterProxy, "_idForReactor:", a4), "copy");

  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePresenterOperationRecord;
  [(NSFilePresenterOperationRecord *)&v3 dealloc];
}

- (void)didBegin
{
  self->state = 1;
}

- (void)willEnd
{
  self->state = 2;
}

- (void)didEnd
{
  v2[5] = *MEMORY[0x1E4F143B8];
  self->state = 3;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__NSFilePresenterOperationRecord_didEnd__block_invoke;
  v2[3] = &unk_1E51FD608;
  v2[4] = self;
  +[NSFileAccessArbiterProxy _accessPresenterOperationRecordsUsingBlock:v2];
}

uint64_t __40__NSFilePresenterOperationRecord_didEnd__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (id)_reactorQueue
{
  [(NSFilePresenterOperationRecord *)self reactor];
  char v3 = objc_opt_respondsToSelector();
  id v4 = [(NSFilePresenterOperationRecord *)self reactor];
  if (v3)
  {
    return (id)[v4 presentedItemOperationQueue];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v6 = [(NSFilePresenterOperationRecord *)self reactor];
    return (id)[v6 _providedItemsOperationQueue];
  }
  else
  {
    return 0;
  }
}

- (id)description
{
  unint64_t v3 = [(NSFilePresenterOperationRecord *)self state];
  if (v3 > 3) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E51FDA88[v3];
  }
  id v5 = [(NSFilePresenterOperationRecord *)self reactor];
  reactorID = self->reactorID;
  v7 = [(NSFilePresenterOperationRecord *)self operationDescription];
  if (!v5) {
    return +[NSString stringWithFormat:@"Reactor with ID %@ deallocated in state: %@ %@", reactorID, v4, v7];
  }
  v8 = +[NSString stringWithFormat:@"Reactor %@ with ID %@ %@ %@", v5, reactorID, v4, v7];
  id v9 = [(NSFilePresenterOperationRecord *)self _reactorQueue];
  if ([v9 isSuspended]) {
    return [(NSString *)v8 stringByAppendingFormat:@" -- Queue is suspended: %@", v9];
  }
  else {
    return v8;
  }
}

- (NSString)operationDescription
{
  return self->operationDescription;
}

- (int64_t)state
{
  return self->state;
}

- (id)reactor
{
  return objc_loadWeak(&self->reactor);
}

- (void).cxx_destruct
{
}

@end