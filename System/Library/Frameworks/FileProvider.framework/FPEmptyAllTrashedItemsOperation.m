@interface FPEmptyAllTrashedItemsOperation
- (FPEmptyAllTrashedItemsOperation)init;
- (void)actionMain;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
@end

@implementation FPEmptyAllTrashedItemsOperation

- (FPEmptyAllTrashedItemsOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)FPEmptyAllTrashedItemsOperation;
  return [(FPActionOperation *)&v3 initWithProvider:0 action:0];
}

- (void)actionMain
{
  objc_super v3 = +[FPItemManager defaultManager];
  v4 = (void *)[v3 newTrashCollection];

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("trash enumeration", v5);
  [v4 setWorkingQueue:v6];

  [v4 setDelegate:self];
  v7 = [v4 workingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__FPEmptyAllTrashedItemsOperation_actionMain__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);
}

uint64_t __45__FPEmptyAllTrashedItemsOperation_actionMain__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startObserving];
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v5 = a3;
  if (self->_gatheredItems)
  {
    dispatch_queue_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"FPEmptyAllTrashedItems.m" lineNumber:68 description:@"received this callback twice"];
  }
  self->_gatheredItems = 1;
  v7 = [v5 items];
  [v5 stopObserving];
  if ([v7 count])
  {
    id v8 = [[FPDeleteOperation alloc] initWithItems:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__FPEmptyAllTrashedItemsOperation_dataForCollectionShouldBeReloaded___block_invoke;
    v10[3] = &unk_1E5AF1240;
    v10[4] = self;
    [(FPActionOperation *)v8 setActionCompletionBlock:v10];
    v9 = +[FPItemManager defaultManager];
    [v9 scheduleAction:v8];
  }
  else
  {
    [(FPOperation *)self completedWithResult:0 error:0];
  }
}

uint64_t __69__FPEmptyAllTrashedItemsOperation_dataForCollectionShouldBeReloaded___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

@end