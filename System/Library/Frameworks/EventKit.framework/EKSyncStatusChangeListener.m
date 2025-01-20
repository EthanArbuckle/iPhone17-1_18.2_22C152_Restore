@interface EKSyncStatusChangeListener
- (EKSyncStatusChangeListener)initWithEventStore:(id)a3;
- (EKSyncStatusChangeListenerDelegate)delegate;
- (void)_eventStoreChanged:(id)a3;
- (void)_setupSources;
- (void)setDelegate:(id)a3;
@end

@implementation EKSyncStatusChangeListener

- (EKSyncStatusChangeListener)initWithEventStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKSyncStatusChangeListener;
  v6 = [(EKSyncStatusChangeListener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventStore, a3);
    [(EKSyncStatusChangeListener *)v7 _setupSources];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__eventStoreChanged_ name:@"EKEventStoreChangedNotification" object:v5];
  }
  return v7;
}

- (void)_setupSources
{
  v3 = [(EKEventStore *)self->_eventStore eventSources];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_29];
  [v4 filterUsingPredicate:v5];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  sourceLastSyncingEndDates = self->_sourceLastSyncingEndDates;
  self->_sourceLastSyncingEndDates = v6;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__EKSyncStatusChangeListener__setupSources__block_invoke_2;
  v8[3] = &unk_1E5B97AC8;
  v8[4] = self;
  [v4 enumerateObjectsUsingBlock:v8];
}

BOOL __43__EKSyncStatusChangeListener__setupSources__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 sourceType];
  return (v2 & 0xFFFFFFFFFFFFFFFBLL) != 0 && v2 != 5;
}

void __43__EKSyncStatusChangeListener__setupSources__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectID];
  v4 = [v3 lastSyncEndDate];

  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v4 forKeyedSubscript:v5];
}

- (void)_eventStoreChanged:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(EKEventStore *)self->_eventStore eventSources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_super v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 objectID];
        v12 = [(NSMutableDictionary *)self->_sourceLastSyncingEndDates objectForKey:v11];
        v13 = [v10 lastSyncEndDate];
        v14 = v13;
        if (v13 && (!v12 || [v13 CalIsAfterDate:v12]))
        {
          [(NSMutableDictionary *)self->_sourceLastSyncingEndDates setObject:v14 forKeyedSubscript:v11];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained accountsSyncFinished:v4];
}

- (EKSyncStatusChangeListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKSyncStatusChangeListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceLastSyncingEndDates, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end