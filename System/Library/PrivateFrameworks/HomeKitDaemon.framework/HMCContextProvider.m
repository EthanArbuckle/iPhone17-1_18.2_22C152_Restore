@interface HMCContextProvider
- (HMCContext)context;
- (HMCContextProvider)initWithContext:(id)a3;
- (NSMutableArray)redirections;
- (id)futureInContext:(id)a3;
- (void)performBlock:(id)a3;
- (void)registerForChangesOfDatabaseModels:(id)a3 orWithModelIDs:(id)a4 changeMask:(unint64_t)a5 selector:(SEL)a6;
- (void)removeAllRegistrations;
- (void)unsafeSynchronousBlock:(id)a3;
@end

@implementation HMCContextProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirections, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (NSMutableArray)redirections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)removeAllRegistrations
{
  v3 = [(HMCContextProvider *)self redirections];
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &__block_literal_global_227363);

  id v4 = [(HMCContextProvider *)self redirections];
  [v4 removeAllObjects];
}

uint64_t __44__HMCContextProvider_removeAllRegistrations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)registerForChangesOfDatabaseModels:(id)a3 orWithModelIDs:(id)a4 changeMask:(unint64_t)a5 selector:(SEL)a6
{
  id v11 = (id)MEMORY[0x263EFFA68];
  if (a3) {
    id v12 = a3;
  }
  else {
    id v12 = (id)MEMORY[0x263EFFA68];
  }
  if (a4) {
    id v11 = a4;
  }
  id v13 = v11;
  id v14 = v12;
  id v15 = a4;
  id v21 = a3;
  v16 = [(HMCContextProvider *)self redirections];
  v17 = [(HMCContextProvider *)self context];
  v18 = [v17 partition];
  v19 = [v18 redirections];
  v20 = [v19 addTarget:self selector:a6 changeMask:a5 forChangesOfObjectsWithModelType:v14 forChangesOfObjectsWithModelID:v13];

  [v16 addObject:v20];
}

- (id)futureInContext:(id)a3
{
  id v4 = a3;
  v5 = [(HMCContextProvider *)self context];
  v6 = (void *)MEMORY[0x263F42538];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __38__HMCContextProvider_futureInContext___block_invoke;
  v11[3] = &unk_264A292B8;
  id v12 = v5;
  id v13 = v4;
  id v7 = v5;
  id v8 = v4;
  v9 = [v6 inContext:v7 perform:v11];

  return v9;
}

uint64_t __38__HMCContextProvider_futureInContext___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)unsafeSynchronousBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HMCContextProvider *)self context];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HMCContextProvider_unsafeSynchronousBlock___block_invoke;
  v8[3] = &unk_264A2F870;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 unsafeSynchronousBlock:v8];
}

uint64_t __45__HMCContextProvider_unsafeSynchronousBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset];
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  v5 = [(HMCContextProvider *)self context];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__HMCContextProvider_performBlock___block_invoke;
  v8[3] = &unk_264A2F870;
  id v9 = v5;
  id v10 = v4;
  id v6 = v5;
  id v7 = v4;
  [v6 performBlock:v8];
}

void __35__HMCContextProvider_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  [v2 reset];
}

- (HMCContext)context
{
  return self->_context;
}

- (HMCContextProvider)initWithContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMCContextProvider;
  id v6 = [(HMCContextProvider *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    redirections = v7->_redirections;
    v7->_redirections = (NSMutableArray *)v8;
  }
  return v7;
}

@end