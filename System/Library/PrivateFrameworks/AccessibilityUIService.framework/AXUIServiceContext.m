@interface AXUIServiceContext
- (AXUIService)service;
- (AXUIServiceContext)initWithService:(id)a3 serviceIdentifier:(id)a4;
- (BOOL)hasClientWithIdentifier:(id)a3;
- (NSArray)clientMessengerList;
- (NSMutableArray)clientMessengers;
- (NSObject)serviceIdentifier;
- (id)clientMessengerWithIdentifier:(id)a3;
- (int)pidForClientWithIdentifier:(id)a3;
- (unint64_t)_indexOfClientWithIdentifier:(id)a3;
- (unint64_t)clientsCount;
- (void)addClientWithIdentifier:(id)a3 connection:(id)a4;
- (void)enumerateClientsUsingBlock:(id)a3;
- (void)removeClientWithIdentifier:(id)a3;
- (void)setClientMessengers:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation AXUIServiceContext

- (AXUIServiceContext)initWithService:(id)a3 serviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIServiceContext;
  v8 = [(AXUIServiceContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXUIServiceContext *)v8 setService:v6];
    [(AXUIServiceContext *)v9 setServiceIdentifier:v7];
  }

  return v9;
}

- (unint64_t)clientsCount
{
  v2 = [(AXUIServiceContext *)self clientMessengers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)clientMessengerList
{
  v2 = [(AXUIServiceContext *)self clientMessengers];
  unint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addClientWithIdentifier:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(AXUIServiceContext *)self clientMessengers];
  if (!v9)
  {
    id v9 = (id)objc_opt_new();
    -[AXUIServiceContext setClientMessengers:](self, "setClientMessengers:");
  }
  v8 = [[AXUIClientMessenger alloc] initWithClientIdentifier:v7 connection:v6];

  [v9 addObject:v8];
}

- (unint64_t)_indexOfClientWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(AXUIServiceContext *)self clientMessengers];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__AXUIServiceContext__indexOfClientWithIdentifier___block_invoke;
    v8[3] = &unk_2645C5AD8;
    id v9 = v4;
    unint64_t v6 = [v5 indexOfObjectPassingTest:v8];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

uint64_t __51__AXUIServiceContext__indexOfClientWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 clientIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeClientWithIdentifier:(id)a3
{
  unint64_t v4 = [(AXUIServiceContext *)self _indexOfClientWithIdentifier:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    id v7 = [(AXUIServiceContext *)self clientMessengers];
    unint64_t v6 = [v7 objectAtIndex:v5];
    [v6 setConnection:0];
    [v7 removeObjectAtIndex:v5];
    if (![v7 count]) {
      [(AXUIServiceContext *)self setClientMessengers:0];
    }
  }
}

- (BOOL)hasClientWithIdentifier:(id)a3
{
  return [(AXUIServiceContext *)self _indexOfClientWithIdentifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)clientMessengerWithIdentifier:(id)a3
{
  unint64_t v4 = [(AXUIServiceContext *)self _indexOfClientWithIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v6 = v4;
    id v7 = [(AXUIServiceContext *)self clientMessengers];
    unint64_t v5 = [v7 objectAtIndex:v6];
  }

  return v5;
}

- (void)enumerateClientsUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  [(AXUIServiceContext *)self clientMessengers];
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      objc_super v11 = objc_msgSend(v10, "clientIdentifier", (void)v13);
      v12 = [v10 connection];
      v4[2](v4, v11, v12, &v17);

      if (v17) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int)pidForClientWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__AXUIServiceContext_pidForClientWithIdentifier___block_invoke;
  v7[3] = &unk_2645C5E10;
  id v5 = v4;
  id v8 = v5;
  uint64_t v9 = &v10;
  [(AXUIServiceContext *)self enumerateClientsUsingBlock:v7];
  LODWORD(self) = *((_DWORD *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return (int)self;
}

void __49__AXUIServiceContext_pidForClientWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 pid];
    *a4 = 1;
  }
}

- (AXUIService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSObject)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSMutableArray)clientMessengers
{
  return self->_clientMessengers;
}

- (void)setClientMessengers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMessengers, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end