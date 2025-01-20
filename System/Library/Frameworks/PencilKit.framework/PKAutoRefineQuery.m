@interface PKAutoRefineQuery
- (CHAutoRefineQuery)query;
- (PKAutoRefineQuery)initWithRecognitionSessionManager:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)queryDidUpdateResult:(id)a3;
- (void)setQuery:(id)a3;
- (void)start;
- (void)teardown;
@end

@implementation PKAutoRefineQuery

- (PKAutoRefineQuery)initWithRecognitionSessionManager:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAutoRefineQuery;
  v5 = [(PKQuery *)&v12 initWithRecognitionSessionManager:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F5C028]);
    v7 = -[PKRecognitionSessionManager session](v4);
    uint64_t v8 = [v6 initWithRecognitionSession:v7];
    query = v5->_query;
    v5->_query = (CHAutoRefineQuery *)v8;
  }
  v10 = [(PKAutoRefineQuery *)v5 query];
  [v10 setDelegate:v5];

  return v5;
}

- (void)start
{
  id v2 = [(PKAutoRefineQuery *)self query];
  [v2 start];
}

- (void)pause
{
  id v2 = [(PKAutoRefineQuery *)self query];
  [v2 pause];
}

- (void)teardown
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__PKAutoRefineQuery_teardown__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __29__PKAutoRefineQuery_teardown__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setDelegate:0];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_autoRefineDelegate, 0);
  [(CHAutoRefineQuery *)self->_query setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKAutoRefineQuery;
  [(PKAutoRefineQuery *)&v3 dealloc];
}

- (void)queryDidUpdateResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_autoRefineDelegate);
    if (WeakRetained)
    {
      id v6 = [v4 autoRefinedItems];
      v7 = (void *)[v6 copy];

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v15;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
            v13 = [(CHAutoRefineQuery *)self->_query lastProcessedStrokeProviderVersion];
            [WeakRetained autoRefineQuery:self didUpdateWithQueryItem:v12 validProviderVersion:v13];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (CHAutoRefineQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);

  objc_destroyWeak((id *)&self->_autoRefineDelegate);
}

@end