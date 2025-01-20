@interface QLCacheItem
- (QLItem)item;
- (void)_performHandlers;
- (void)addCompletionHandler:(id)a3;
- (void)invalidate;
- (void)setItem:(id)a3;
@end

@implementation QLCacheItem

- (void)setItem:(id)a3
{
  p_item = &self->_item;
  objc_storeStrong((id *)&self->_item, a3);
  if (self->_handlers && *p_item)
  {
    [(QLCacheItem *)self _performHandlers];
  }
}

- (void)addCompletionHandler:(id)a3
{
  aBlock = (void (**)(id, QLCacheItem *, void *))a3;
  v4 = [(QLCacheItem *)self item];

  if (v4)
  {
    v5 = [(QLCacheItem *)self item];
    v6 = [(QLCacheItem *)self item];
    v7 = [v6 fetcher];
    aBlock[2](aBlock, v5, v7);
  }
  else
  {
    v5 = self;
    objc_sync_enter(v5);
    handlers = v5->_handlers;
    if (!handlers)
    {
      uint64_t v9 = objc_opt_new();
      v10 = v5->_handlers;
      v5->_handlers = (NSMutableArray *)v9;

      handlers = v5->_handlers;
    }
    v11 = _Block_copy(aBlock);
    [(NSMutableArray *)handlers addObject:v11];

    objc_sync_exit(v5);
  }
}

- (void)invalidate
{
  [(QLCacheItem *)self setItem:0];

  [(QLCacheItem *)self _performHandlers];
}

- (void)_performHandlers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = v2->_handlers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        v8 = [(QLCacheItem *)v2 item];
        uint64_t v9 = [(QLCacheItem *)v2 item];
        v10 = [v9 fetcher];
        (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v10);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)v2->_handlers removeAllObjects];
  objc_sync_exit(v2);
}

- (QLItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_handlers, 0);
}

@end