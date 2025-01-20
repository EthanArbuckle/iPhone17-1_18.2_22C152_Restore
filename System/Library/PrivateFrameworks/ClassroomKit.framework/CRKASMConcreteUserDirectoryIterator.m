@interface CRKASMConcreteUserDirectoryIterator
+ (id)iteratorWithRosterRequirements:(id)a3 queryGenerator:(id)a4;
- (BOOL)isExecuting;
- (CRKASMConcreteUserDirectoryIterator)initWithRequirements:(id)a3 query:(id)a4;
- (CRKClassKitQuery)query;
- (CRKClassKitRosterRequirements)requirements;
- (NSMutableArray)queryCompletionQueue;
- (void)fetchNextUsersWithCompletion:(id)a3;
- (void)queryDidFinishExecutingWithResults:(id)a3 error:(id)a4;
- (void)serviceQueryQueue;
- (void)setExecuting:(BOOL)a3;
@end

@implementation CRKASMConcreteUserDirectoryIterator

- (CRKASMConcreteUserDirectoryIterator)initWithRequirements:(id)a3 query:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMConcreteUserDirectoryIterator;
  v9 = [(CRKASMConcreteUserDirectoryIterator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requirements, a3);
    objc_storeStrong((id *)&v10->_query, a4);
    uint64_t v11 = objc_opt_new();
    queryCompletionQueue = v10->_queryCompletionQueue;
    v10->_queryCompletionQueue = (NSMutableArray *)v11;
  }
  return v10;
}

+ (id)iteratorWithRosterRequirements:(id)a3 queryGenerator:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = v7[2]();
  v9 = (void *)[objc_alloc((Class)a1) initWithRequirements:v6 query:v8];
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke;
  v11[3] = &unk_2646F44D0;
  objc_copyWeak(&v12, &location);
  [v8 setCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

void __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke_2;
  block[3] = &unk_2646F44A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __85__CRKASMConcreteUserDirectoryIterator_iteratorWithRosterRequirements_queryGenerator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained queryDidFinishExecutingWithResults:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)fetchNextUsersWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CRKASMConcreteUserDirectoryIterator_fetchNextUsersWithCompletion___block_invoke;
  v6[3] = &unk_2646F3570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __68__CRKASMConcreteUserDirectoryIterator_fetchNextUsersWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queryCompletionQueue];
  v3 = (void *)MEMORY[0x22A620AF0](*(void *)(a1 + 40));
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 serviceQueryQueue];
}

- (void)serviceQueryQueue
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKASMConcreteUserDirectoryIterator.m", 72, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  if (![(CRKASMConcreteUserDirectoryIterator *)self isExecuting])
  {
    id v4 = [(CRKASMConcreteUserDirectoryIterator *)self queryCompletionQueue];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(CRKASMConcreteUserDirectoryIterator *)self setExecuting:1];
      id v9 = [(CRKASMConcreteUserDirectoryIterator *)self requirements];
      id v6 = [(CRKASMConcreteUserDirectoryIterator *)self query];
      [v9 executeQuery:v6];
    }
  }
}

- (void)queryDidFinishExecutingWithResults:(id)a3 error:(id)a4
{
  id v7 = (void *)MEMORY[0x263F08B88];
  id v8 = a4;
  id v9 = a3;
  if (([v7 isMainThread] & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = NSStringFromSelector(a2);
    [v15 handleFailureInMethod:a2, self, @"CRKASMConcreteUserDirectoryIterator.m", 83, @"%@ must be called from the main thread", v16 object file lineNumber description];
  }
  id v10 = [(CRKASMConcreteUserDirectoryIterator *)self queryCompletionQueue];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"CRKASMConcreteUserDirectoryIterator.m" lineNumber:84 description:@"Should have at least one pending completion"];
  }
  id v12 = [(CRKASMConcreteUserDirectoryIterator *)self queryCompletionQueue];
  v18 = [v12 objectAtIndex:0];

  v13 = [(CRKASMConcreteUserDirectoryIterator *)self queryCompletionQueue];
  [v13 removeObjectAtIndex:0];

  objc_super v14 = objc_msgSend(v9, "crk_mapUsingBlock:", &__block_literal_global_46);

  v18[2](v18, v14, v8);
  [(CRKASMConcreteUserDirectoryIterator *)self setExecuting:0];
  [(CRKASMConcreteUserDirectoryIterator *)self serviceQueryQueue];
}

CRKASMConcreteUser *__80__CRKASMConcreteUserDirectoryIterator_queryDidFinishExecutingWithResults_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[CRKASMConcreteUser alloc] initWithBackingPerson:v2];

  return v3;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (CRKClassKitQuery)query
{
  return self->_query;
}

- (NSMutableArray)queryCompletionQueue
{
  return self->_queryCompletionQueue;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->_executing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryCompletionQueue, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_requirements, 0);
}

@end