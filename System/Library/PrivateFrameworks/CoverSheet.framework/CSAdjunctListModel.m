@interface CSAdjunctListModel
- (CSAdjunctListModel)init;
- (CSAdjunctListModelDelegate)delegate;
- (void)_reallyAddOrUpdateItem:(id)a3;
- (void)_replayPendingChanges;
- (void)addOrUpdateItem:(id)a3;
- (void)removeItemForIdentifier:(id)a3;
- (void)resumeItemHandling;
- (void)setDelegate:(id)a3;
- (void)suspendItemHandling;
@end

@implementation CSAdjunctListModel

- (CSAdjunctListModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSAdjunctListModel;
  v2 = [(CSAdjunctListModel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_suspended = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    identifiersToItems = v3->_identifiersToItems;
    v3->_identifiersToItems = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    pendingItems = v3->_pendingItems;
    v3->_pendingItems = (NSMutableSet *)v6;
  }
  return v3;
}

- (void)suspendItemHandling
{
  self->_suspended = 1;
}

- (void)resumeItemHandling
{
  self->_suspended = 0;
  [(CSAdjunctListModel *)self _replayPendingChanges];
}

- (void)addOrUpdateItem:(id)a3
{
  if (self->_suspended) {
    [(NSMutableSet *)self->_pendingItems addObject:a3];
  }
  else {
    [(CSAdjunctListModel *)self _reallyAddOrUpdateItem:a3];
  }
}

- (void)removeItemForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    pendingItems = self->_pendingItems;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__CSAdjunctListModel_removeItemForIdentifier___block_invoke;
    v12[3] = &unk_1E6ADA8B0;
    id v7 = v4;
    id v13 = v7;
    v8 = [(NSMutableSet *)pendingItems objectsPassingTest:v12];
    objc_super v9 = [v8 anyObject];

    if (v9) {
      [(NSMutableSet *)self->_pendingItems removeObject:v9];
    }
    v10 = [(NSMutableDictionary *)self->_identifiersToItems objectForKey:v7];
    if (v10)
    {
      [(NSMutableDictionary *)self->_identifiersToItems removeObjectForKey:v7];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained adjunctListModel:self didRemoveItem:v10];
    }
  }
}

uint64_t __46__CSAdjunctListModel_removeItemForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_reallyAddOrUpdateItem:(id)a3
{
  id v4 = a3;
  id v7 = [v4 identifier];
  v5 = [(NSMutableDictionary *)self->_identifiersToItems objectForKeyedSubscript:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NSMutableDictionary *)self->_identifiersToItems setObject:v4 forKey:v7];
  if (v5) {
    [WeakRetained adjunctListModel:self didUpdateItem:v5 withItem:v4];
  }
  else {
    [WeakRetained adjunctListModel:self didAddItem:v4];
  }
}

- (void)_replayPendingChanges
{
  pendingItems = self->_pendingItems;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CSAdjunctListModel__replayPendingChanges__block_invoke;
  v4[3] = &unk_1E6ADA8D8;
  v4[4] = self;
  [(NSMutableSet *)pendingItems enumerateObjectsUsingBlock:v4];
  [(NSMutableSet *)self->_pendingItems removeAllObjects];
}

uint64_t __43__CSAdjunctListModel__replayPendingChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reallyAddOrUpdateItem:a2];
}

- (CSAdjunctListModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSAdjunctListModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingItems, 0);

  objc_storeStrong((id *)&self->_identifiersToItems, 0);
}

@end