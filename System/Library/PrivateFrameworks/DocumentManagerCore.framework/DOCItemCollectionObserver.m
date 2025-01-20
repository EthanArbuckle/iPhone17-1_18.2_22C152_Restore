@interface DOCItemCollectionObserver
- (DOCItemCollectionObserver)initWithItemCollection:(id)a3;
- (FPItemCollection)itemCollection;
- (FPItemCollectionIndexPathBasedDelegate)soleUpdatableDelegate;
- (NSMutableArray)delegates;
- (NSMutableArray)subscribers;
- (id)addSubscriber:(id)a3;
- (void)_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:(id)a3;
- (void)_purgeOrphanedContainers;
- (void)addItemCollectionDelegate:(id)a3;
- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4;
- (void)collection:(id)a3 didInsertItemsAtIndexPaths:(id)a4;
- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5;
- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4;
- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5;
- (void)dataForCollectionShouldBeReloaded:(id)a3;
- (void)dealloc;
- (void)notifySubscribers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeItemCollectionDelegate:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setItemCollection:(id)a3;
- (void)setSoleUpdatableDelegate:(id)a3;
- (void)setSubscribers:(id)a3;
@end

@implementation DOCItemCollectionObserver

- (DOCItemCollectionObserver)initWithItemCollection:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DOCItemCollectionObserver;
  v6 = [(DOCItemCollectionObserver *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF980] array];
    subscribers = v6->_subscribers;
    v6->_subscribers = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x263EFF980] array];
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_itemCollection, a3);
    [(FPItemCollection *)v6->_itemCollection setDelegate:v6];
    [(FPItemCollection *)v6->_itemCollection addObserver:v6 forKeyPath:@"gathering" options:1 context:&DOCItemCollectionObserverObservationContext];
    [(FPItemCollection *)v6->_itemCollection doc_startObserving];
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &DOCItemCollectionObserverObservationContext)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __76__DOCItemCollectionObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_2641B55D8;
    v7[4] = self;
    DOCRunInMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DOCItemCollectionObserver;
    -[DOCItemCollectionObserver observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)addSubscriber:(id)a3
{
  id v4 = a3;
  id v5 = [[DOCItemCollectionSubscriber alloc] initWithUpdateBlock:v4];

  objc_super v6 = [(DOCItemCollectionObserver *)self subscribers];
  [v6 addObject:v5];

  return v5;
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__DOCItemCollectionObserver_dataForCollectionShouldBeReloaded___block_invoke;
  v6[3] = &unk_2641B60B8;
  id v7 = v4;
  id v5 = v4;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:v6];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

- (void)notifySubscribers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (([(FPItemCollection *)self->_itemCollection isGathering] & 1) == 0)
  {
    v3 = [(FPItemCollection *)self->_itemCollection items];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [(DOCItemCollectionObserver *)self subscribers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v10 = [v9 updateBlock];

          if (v10)
          {
            v11 = [v9 updateBlock];
            ((void (**)(void, void *))v11)[2](v11, v3);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (FPItemCollection)itemCollection
{
  return (FPItemCollection *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)subscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void))v4;
  if (self->_soleUpdatableDelegate)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->_delegates;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "weakObjectValue", (void)v12);
          if ([v11 conformsToProtocol:&unk_26C40E328]) {
            ((void (**)(void, void *))v5)[2](v5, v11);
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

uint64_t __76__DOCItemCollectionObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifySubscribers];
}

- (void)dealloc
{
  v3 = [(DOCItemCollectionObserver *)self itemCollection];
  objc_msgSend(v3, "doc_stopObserving");

  id v4 = [(DOCItemCollectionObserver *)self itemCollection];
  [v4 removeObserver:self forKeyPath:@"gathering"];

  v5.receiver = self;
  v5.super_class = (Class)DOCItemCollectionObserver;
  [(DOCItemCollectionObserver *)&v5 dealloc];
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DOCItemCollectionObserver *)self subscribers];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__DOCItemCollectionObserver_removeSubscriber___block_invoke;
  v9[3] = &unk_2641B5FF8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [(DOCItemCollectionObserver *)self subscribers];
    [v8 removeObjectAtIndex:v7];
  }
}

uint64_t __46__DOCItemCollectionObserver_removeSubscriber___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 UUID];
  uint64_t v7 = [*(id *)(a1 + 32) UUID];
  uint64_t v8 = [v6 isEqual:v7];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

- (void)addItemCollectionDelegate:(id)a3
{
  id v4 = a3;
  delegates = self->_delegates;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__DOCItemCollectionObserver_addItemCollectionDelegate___block_invoke;
  v9[3] = &unk_2641B6020;
  id v6 = v4;
  id v10 = v6;
  if ([(NSMutableArray *)delegates indexOfObjectPassingTest:v9] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = self->_delegates;
    uint64_t v8 = [MEMORY[0x263F08D40] valueWithWeakObject:v6];
    [(NSMutableArray *)v7 addObject:v8];
  }
  if ([(NSMutableArray *)self->_delegates count]) {
    [(DOCItemCollectionObserver *)self _purgeOrphanedContainers];
  }
}

uint64_t __55__DOCItemCollectionObserver_addItemCollectionDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 weakObjectValue];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)removeItemCollectionDelegate:(id)a3
{
  id v4 = (FPItemCollectionIndexPathBasedDelegate *)a3;
  objc_super v5 = v4;
  if (self->_soleUpdatableDelegate == v4)
  {
    self->_soleUpdatableDelegate = 0;
  }
  delegates = self->_delegates;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__DOCItemCollectionObserver_removeItemCollectionDelegate___block_invoke;
  v9[3] = &unk_2641B6020;
  uint64_t v7 = v5;
  id v10 = v7;
  uint64_t v8 = [(NSMutableArray *)delegates indexOfObjectPassingTest:v9];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_delegates removeObjectAtIndex:v8];
  }
  if ([(NSMutableArray *)self->_delegates count]) {
    [(DOCItemCollectionObserver *)self _purgeOrphanedContainers];
  }
}

uint64_t __58__DOCItemCollectionObserver_removeItemCollectionDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 weakObjectValue];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)_purgeOrphanedContainers
{
  id v3 = [(NSMutableArray *)self->_delegates indexesOfObjectsPassingTest:&__block_literal_global_11];
  if ([v3 count]) {
    [(NSMutableArray *)self->_delegates removeObjectsAtIndexes:v3];
  }
}

BOOL __53__DOCItemCollectionObserver__purgeOrphanedContainers__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 weakObjectValue];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)collection:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  long long v12 = __67__DOCItemCollectionObserver_collection_didInsertItemsAtIndexPaths___block_invoke;
  long long v13 = &unk_2641B6068;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:&v10];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

uint64_t __67__DOCItemCollectionObserver_collection_didInsertItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) didInsertItemsAtIndexPaths:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __80__DOCItemCollectionObserver_collection_didMoveItemsFromIndexPaths_toIndexPaths___block_invoke;
  v14[3] = &unk_2641B6090;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:v14];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

uint64_t __80__DOCItemCollectionObserver_collection_didMoveItemsFromIndexPaths_toIndexPaths___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] didMoveItemsFromIndexPaths:a1[5] toIndexPaths:a1[6]];
}

- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __67__DOCItemCollectionObserver_collection_didDeleteItemsAtIndexPaths___block_invoke;
  id v13 = &unk_2641B6068;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:&v10];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

uint64_t __67__DOCItemCollectionObserver_collection_didDeleteItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collection:*(void *)(a1 + 32) didDeleteItemsAtIndexPaths:*(void *)(a1 + 40)];
}

- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__DOCItemCollectionObserver_collection_didUpdateItemsAtIndexPaths_changes___block_invoke;
  v14[3] = &unk_2641B6090;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:v14];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

uint64_t __75__DOCItemCollectionObserver_collection_didUpdateItemsAtIndexPaths_changes___block_invoke(void *a1, void *a2)
{
  return [a2 collection:a1[4] didUpdateItemsAtIndexPaths:a1[5] changes:a1[6]];
}

uint64_t __63__DOCItemCollectionObserver_dataForCollectionShouldBeReloaded___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dataForCollectionShouldBeReloaded:*(void *)(a1 + 32)];
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke;
  v10[3] = &unk_2641B6108;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(DOCItemCollectionObserver *)self _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:v10];
  [(DOCItemCollectionObserver *)self notifySubscribers];
}

void __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke_2;
  v7[3] = &unk_2641B60E0;
  uint64_t v4 = a1[4];
  objc_super v5 = (void *)a1[6];
  v7[4] = a1[5];
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v6 collection:v4 didPerformBatchUpdateWithReplayBlock:v7];
}

uint64_t __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSoleUpdatableDelegate:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 setSoleUpdatableDelegate:0];
}

- (void)setItemCollection:(id)a3
{
}

- (void)setSubscribers:(id)a3
{
}

- (NSMutableArray)delegates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegates:(id)a3
{
}

- (FPItemCollectionIndexPathBasedDelegate)soleUpdatableDelegate
{
  return (FPItemCollectionIndexPathBasedDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSoleUpdatableDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soleUpdatableDelegate, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

@end