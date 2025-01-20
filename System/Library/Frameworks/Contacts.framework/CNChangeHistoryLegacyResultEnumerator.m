@interface CNChangeHistoryLegacyResultEnumerator
+ (id)contactEnumeratorWithChanges:(id)a3 keysToFetch:(id)a4 unifyResults:(BOOL)a5 contactStore:(id)a6;
+ (id)groupEnumeratorWithChanges:(id)a3 contactStore:(id)a4;
- (CNChangeHistoryLegacyResultEnumerator)initWithChanges:(id)a3 refillStrategy:(id)a4;
- (CNEnumeratorRefillStrategy)refillStrategy;
- (CNQueue)batchFetchQueue;
- (CNQueue)changes;
- (id)nextObject;
- (void)_fetchNextBatch;
@end

@implementation CNChangeHistoryLegacyResultEnumerator

+ (id)contactEnumeratorWithChanges:(id)a3 keysToFetch:(id)a4 unifyResults:(BOOL)a5 contactStore:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = -[_CNChangeHistoryContactRefillStrategy initWithKeysToFetch:unifyResults:contactStore:]((id *)[_CNChangeHistoryContactRefillStrategy alloc], v10, a5, v9);

  v13 = [[CNChangeHistoryLegacyResultEnumerator alloc] initWithChanges:v11 refillStrategy:v12];

  return v13;
}

+ (id)groupEnumeratorWithChanges:(id)a3 contactStore:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_CNChangeHistoryGroupRefillStrategy alloc] initWithContactStore:v5];

  v8 = [[CNChangeHistoryLegacyResultEnumerator alloc] initWithChanges:v6 refillStrategy:v7];

  return v8;
}

- (CNChangeHistoryLegacyResultEnumerator)initWithChanges:(id)a3 refillStrategy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNChangeHistoryLegacyResultEnumerator;
  v8 = [(CNChangeHistoryLegacyResultEnumerator *)&v16 init];
  if (v8)
  {
    id v9 = (CNQueue *)objc_alloc_init(MEMORY[0x1E4F5A4D0]);
    changes = v8->_changes;
    v8->_changes = v9;

    id v11 = (CNQueue *)objc_alloc_init(MEMORY[0x1E4F5A4D0]);
    batchFetchQueue = v8->_batchFetchQueue;
    v8->_batchFetchQueue = v11;

    v13 = [v7 batchesToRepresentObjects:v6 suggestedBatchSize:100];
    [(CNQueue *)v8->_batchFetchQueue enqueueObjectsFromArray:v13];
    objc_storeStrong((id *)&v8->_refillStrategy, a4);
    v14 = v8;
  }
  return v8;
}

- (id)nextObject
{
  v3 = [(CNChangeHistoryLegacyResultEnumerator *)self changes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(CNChangeHistoryLegacyResultEnumerator *)self _fetchNextBatch];
  }
  id v5 = [(CNChangeHistoryLegacyResultEnumerator *)self changes];
  id v6 = [v5 dequeue];

  return v6;
}

- (void)_fetchNextBatch
{
  v3 = [(CNChangeHistoryLegacyResultEnumerator *)self batchFetchQueue];
  id v7 = [v3 dequeue];

  if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
  {
    uint64_t v4 = [(CNChangeHistoryLegacyResultEnumerator *)self refillStrategy];
    id v5 = [v4 objectsRepresentedByBatch:v7];

    id v6 = [(CNChangeHistoryLegacyResultEnumerator *)self changes];
    [v6 enqueueObjectsFromArray:v5];
  }
}

- (CNQueue)changes
{
  return self->_changes;
}

- (CNQueue)batchFetchQueue
{
  return self->_batchFetchQueue;
}

- (CNEnumeratorRefillStrategy)refillStrategy
{
  return self->_refillStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refillStrategy, 0);
  objc_storeStrong((id *)&self->_batchFetchQueue, 0);

  objc_storeStrong((id *)&self->_changes, 0);
}

@end