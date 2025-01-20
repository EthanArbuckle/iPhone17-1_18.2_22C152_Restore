@interface CADMockSpotlightIndexProvider
- (BOOL)failDeleteAllSearchableItemsForBundleID;
- (BOOL)failDeleteSearchableItemsWithDomainIdentifiers;
- (BOOL)failIndexSearchableItems;
- (CADMockSpotlightIndexProvider)init;
- (CADMockSpotlightIndexProvider)initWithMinArtificialDelay:(double)a3 maxArtificialDelay:(double)a4 failureMode:(unint64_t)a5;
- (double)maxArtificialDelay;
- (double)minArtificialDelay;
- (id)itemsInIndex;
- (id)newSpotlightIndexForBundleID:(id)a3;
- (int64_t)numCalls;
- (unint64_t)failureMode;
- (void)deleteAllSearchableItemsForBundleID:(id)a3;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3;
- (void)indexSearchableItems:(id)a3;
- (void)setFailDeleteAllSearchableItemsForBundleID:(BOOL)a3;
- (void)setFailDeleteSearchableItemsWithDomainIdentifiers:(BOOL)a3;
- (void)setFailIndexSearchableItems:(BOOL)a3;
- (void)setFailureMode:(unint64_t)a3;
- (void)setMaxArtificialDelay:(double)a3;
- (void)setMinArtificialDelay:(double)a3;
- (void)setNumCalls:(int64_t)a3;
@end

@implementation CADMockSpotlightIndexProvider

- (CADMockSpotlightIndexProvider)init
{
  return [(CADMockSpotlightIndexProvider *)self initWithMinArtificialDelay:0 maxArtificialDelay:0.0 failureMode:0.0];
}

- (CADMockSpotlightIndexProvider)initWithMinArtificialDelay:(double)a3 maxArtificialDelay:(double)a4 failureMode:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)CADMockSpotlightIndexProvider;
  v8 = [(CADMockSpotlightIndexProvider *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_minArtificialDelay = a3;
    v8->_maxArtificialDelay = a4;
    v8->_failureMode = a5;
    v8->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    store = v9->_store;
    v9->_store = (NSMutableArray *)v10;
  }
  return v9;
}

- (void)setFailureMode:(unint64_t)a3
{
  self->_failureMode = a3;
  [(CADMockSpotlightIndexProvider *)self setNumCalls:0];
}

- (id)newSpotlightIndexForBundleID:(id)a3
{
  v4 = [CADMockSpotlightIndex alloc];
  return [(CADMockSpotlightIndex *)v4 initWithProvider:self];
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  store = self->_store;
  v7 = (void *)MEMORY[0x1E4F28F60];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__CADMockSpotlightIndexProvider_deleteSearchableItemsWithDomainIdentifiers___block_invoke;
  v10[3] = &unk_1E624E7D8;
  id v11 = v4;
  id v8 = v4;
  v9 = [v7 predicateWithBlock:v10];
  [(NSMutableArray *)store filterUsingPredicate:v9];

  os_unfair_lock_unlock(p_lock);
}

uint64_t __76__CADMockSpotlightIndexProvider_deleteSearchableItemsWithDomainIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v3, "domainIdentifier", (void)v13);
        LOBYTE(v9) = [v10 hasPrefix:v9];

        if (v9)
        {
          uint64_t v11 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 1;
LABEL_11:

  return v11;
}

- (void)indexSearchableItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        os_unfair_lock_lock(&self->_lock);
        store = self->_store;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __54__CADMockSpotlightIndexProvider_indexSearchableItems___block_invoke;
        v12[3] = &unk_1E624E800;
        v12[4] = v8;
        uint64_t v10 = [(NSMutableArray *)store indexOfObjectPassingTest:v12];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableArray *)self->_store removeObjectAtIndex:v10];
        }
        [(NSMutableArray *)self->_store addObject:v8];
        os_unfair_lock_unlock(&self->_lock);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

uint64_t __54__CADMockSpotlightIndexProvider_indexSearchableItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)deleteAllSearchableItemsForBundleID:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[CADMockSpotlightIndexProvider deleteSearchableItemsWithDomainIdentifiers:](self, "deleteSearchableItemsWithDomainIdentifiers:", v6, v7, v8);
}

- (id)itemsInIndex
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableArray *)self->_store copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)minArtificialDelay
{
  return self->_minArtificialDelay;
}

- (void)setMinArtificialDelay:(double)a3
{
  self->_minArtificialDelay = a3;
}

- (double)maxArtificialDelay
{
  return self->_maxArtificialDelay;
}

- (void)setMaxArtificialDelay:(double)a3
{
  self->_maxArtificialDelay = a3;
}

- (unint64_t)failureMode
{
  return self->_failureMode;
}

- (BOOL)failDeleteSearchableItemsWithDomainIdentifiers
{
  return self->_failDeleteSearchableItemsWithDomainIdentifiers;
}

- (void)setFailDeleteSearchableItemsWithDomainIdentifiers:(BOOL)a3
{
  self->_failDeleteSearchableItemsWithDomainIdentifiers = a3;
}

- (BOOL)failIndexSearchableItems
{
  return self->_failIndexSearchableItems;
}

- (void)setFailIndexSearchableItems:(BOOL)a3
{
  self->_failIndexSearchableItems = a3;
}

- (BOOL)failDeleteAllSearchableItemsForBundleID
{
  return self->_failDeleteAllSearchableItemsForBundleID;
}

- (void)setFailDeleteAllSearchableItemsForBundleID:(BOOL)a3
{
  self->_failDeleteAllSearchableItemsForBundleID = a3;
}

- (int64_t)numCalls
{
  return self->_numCalls;
}

- (void)setNumCalls:(int64_t)a3
{
  self->_numCalls = a3;
}

- (void).cxx_destruct
{
}

@end