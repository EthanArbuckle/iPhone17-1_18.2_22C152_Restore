@interface FPSpotlightDataSource
- (BOOL)hasMoreIncoming;
- (FPSpotlightDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4;
- (FPSpotlightDataSourceDelegate)delegate;
- (FPSpotlightQueryDescriptor)queryDescriptor;
- (NSString)description;
- (id)itemPredicateForCollector:(id)a3;
- (unint64_t)maximumNumberOfItems;
- (void)_invalidate;
- (void)_invalidateWithError:(id)a3;
- (void)collector:(id)a3 didEncounterError:(id)a4;
- (void)collector:(id)a3 didGatherItems:(id)a4;
- (void)collector:(id)a3 didRemoveItemIDs:(id)a4;
- (void)collector:(id)a3 didUpdateItems:(id)a4;
- (void)collector:(id)a3 didUpdateItemsOrigin:(unint64_t)a4;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation FPSpotlightDataSource

- (unint64_t)maximumNumberOfItems
{
  v2 = [(FPSpotlightQueryDescriptor *)self->_queryDescriptor settings];
  v3 = [v2 desiredNumberOfItems];

  if (v3) {
    unint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

uint64_t __30__FPSpotlightDataSource_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "registerDataSource:");
}

uint64_t __35__FPSpotlightDataSource_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (FPSpotlightQueryDescriptor)queryDescriptor
{
  return self->_queryDescriptor;
}

- (void)setDelegate:(id)a3
{
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPSpotlightDataSource_start__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (FPSpotlightDataSource)initWithQueryDescriptor:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FPSpotlightDataSource;
  v9 = [(FPSpotlightDataSource *)&v19 init];
  if (v9)
  {
    uint64_t v10 = +[FPSpotlightCollectorManager sharedInstance];
    collectorManager = v9->_collectorManager;
    v9->_collectorManager = (FPSpotlightCollectorManager *)v10;

    objc_storeStrong((id *)&v9->_predicate, a4);
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.FileProvider.SpotlightDataSource.queue (%p)", v9);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = FPDataSourceBaseQueue();
    dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(v13, v14, v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v9->_queryDescriptor, a3);
  }

  return v9;
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__FPSpotlightDataSource_invalidate__block_invoke;
  block[3] = &unk_1E5AF0FF0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didGatherItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "dataSource:didChangeItemsOrigin:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "itemsOrigin"));

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [v3 dataSource:*(void *)(a1 + 32) replaceContentsWithItems:*(void *)(a1 + 48) hasMoreChanges:0];
}

- (void)_invalidate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] invalidating spotlight data source: %@", (uint8_t *)&v2, 0xCu);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_enumerationSettings, 0);
  objc_storeStrong((id *)&self->_collectorManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)collector:(id)a3 didGatherItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didGatherItems___block_invoke;
  block[3] = &unk_1E5AF17D0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (id)itemPredicateForCollector:(id)a3
{
  return self->_predicate;
}

- (void)_invalidateWithError:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(FPSpotlightDataSource *)self _invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataSource:self wasInvalidatedWithError:v5];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [v3 stringWithFormat:@"<%@:%p d:'<%@:%p>'>", v5, self, v8, v9];

  return (NSString *)v10;
}

- (BOOL)hasMoreIncoming
{
  return self->_hasMoreIncoming;
}

- (FPSpotlightDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPSpotlightDataSourceDelegate *)WeakRetained;
}

- (void)collector:(id)a3 didUpdateItems:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItems___block_invoke;
  v8[3] = &unk_1E5AF0748;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __81__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItems___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained dataSource:*(void *)(a1 + 32) receivedUpdatedItems:*(void *)(a1 + 40) deletedItems:MEMORY[0x1E4F1CBF0] hasMoreChanges:0];
}

- (void)collector:(id)a3 didRemoveItemIDs:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didRemoveItemIDs___block_invoke;
  v8[3] = &unk_1E5AF0748;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __83__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didRemoveItemIDs___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained dataSource:*(void *)(a1 + 32) receivedUpdatedItems:MEMORY[0x1E4F1CBF0] deletedItems:*(void *)(a1 + 40) hasMoreChanges:0];
}

- (void)collector:(id)a3 didUpdateItemsOrigin:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItemsOrigin___block_invoke;
  v5[3] = &unk_1E5AF06F0;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

void __87__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didUpdateItemsOrigin___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained dataSource:*(void *)(a1 + 32) didChangeItemsOrigin:*(void *)(a1 + 40)];
}

- (void)collector:(id)a3 didEncounterError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = fp_current_or_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FPSpotlightDataSource(FPSpotlightCollectorObserving) collector:didEncounterError:]((uint64_t)v6, (uint64_t)v7, v8);
  }

  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didEncounterError___block_invoke;
  v11[3] = &unk_1E5AF0748;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, v11);
}

uint64_t __84__FPSpotlightDataSource_FPSpotlightCollectorObserving__collector_didEncounterError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:*(void *)(a1 + 40)];
}

@end