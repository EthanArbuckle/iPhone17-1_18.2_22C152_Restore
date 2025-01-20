@interface LiveFSFPTrashObserver
+ (id)newWithCompletionHandler:(id)a3;
- (LiveFSFPTrashObserver)initWithCompletionHandler:(id)a3;
- (NSData)lastPage;
- (NSMutableArray)items;
- (id)completionHandler;
- (void)didEnumerateItems:(id)a3;
- (void)finishEnumeratingUpToPage:(id)a3;
- (void)finishEnumeratingWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation LiveFSFPTrashObserver

- (LiveFSFPTrashObserver)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LiveFSFPTrashObserver;
  v5 = [(LiveFSFPTrashObserver *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    items = v5->_items;
    v5->_items = (NSMutableArray *)v6;

    uint64_t v8 = MEMORY[0x230F765B0](v4);
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = (id)v8;
  }
  return v5;
}

+ (id)newWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = [[LiveFSFPTrashObserver alloc] initWithCompletionHandler:v3];

  return v4;
}

- (void)didEnumerateItems:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F08A30];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__LiveFSFPTrashObserver_didEnumerateItems___block_invoke;
  v8[3] = &unk_264934248;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v8];
}

void __43__LiveFSFPTrashObserver_didEnumerateItems___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 filename];
  id v4 = [*(id *)(a1 + 32) numberFromString:v3];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) items];
    id v6 = [v7 itemIdentifier];
    [v5 addObject:v6];
  }
}

- (void)finishEnumeratingUpToPage:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_lastPage, a3);
  id v5 = v6;
  if (!v6)
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    id v5 = 0;
  }
}

- (void)finishEnumeratingWithError:(id)a3
{
  lastPage = self->_lastPage;
  self->_lastPage = 0;
  id v5 = a3;

  (*((void (**)(void))self->_completionHandler + 2))();
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItems:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSData)lastPage
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end