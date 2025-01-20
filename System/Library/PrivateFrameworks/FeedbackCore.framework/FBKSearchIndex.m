@interface FBKSearchIndex
- (FBKSearchIndex)initWithManagedObjectContext:(id)a3;
- (NSManagedObjectContext)managedObjectContext;
- (void)asynchronouslySearchWithQuery:(id)a3 completionHandler:(id)a4;
- (void)setManagedObjectContext:(id)a3;
@end

@implementation FBKSearchIndex

- (FBKSearchIndex)initWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBKSearchIndex;
  v6 = [(FBKSearchIndex *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_managedObjectContext, a3);
    v7->_isSearching = 0;
  }

  return v7;
}

- (void)asynchronouslySearchWithQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = 0;
  atomic_compare_exchange_strong_explicit(&self->_isSearching, (unsigned int *)&v8, 1u, memory_order_relaxed, memory_order_relaxed);
  if (!v8)
  {
    objc_super v9 = [(FBKSearchIndex *)self managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke;
    v10[3] = &unk_264874588;
    v10[4] = self;
    id v12 = v7;
    id v11 = v6;
    [v9 performBlock:v10];
  }
}

void __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke(id *a1)
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_2;
  aBlock[3] = &unk_2648761E0;
  aBlock[4] = a1[4];
  id v17 = a1[6];
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ([a1[5] length])
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
    id v4 = a1[5];
    uint64_t v5 = [v4 length];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_3;
    v14[3] = &unk_264876208;
    id v6 = v3;
    id v15 = v6;
    objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 1027, v14);
    id v7 = +[FBKContentItem fetchRequest];
    [v7 setResultType:1];
    int v8 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v6];
    [v7 setPredicate:v8];

    objc_super v9 = [a1[4] managedObjectContext];
    id v13 = 0;
    v10 = [v9 executeFetchRequest:v7 error:&v13];
    id v11 = v13;

    if (v11) {
      [MEMORY[0x263EFFA08] set];
    }
    else {
    id v12 = [MEMORY[0x263EFFA08] setWithArray:v10];
    }
    v2[2](v2, v12);
  }
  else
  {
    id v11 = [MEMORY[0x263EFFA08] set];
    v2[2](v2, v11);
  }
}

uint64_t __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__FBKSearchIndex_asynchronouslySearchWithQuery_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"searchText CONTAINS[cd] %@", a2];
  [v2 addObject:v3];
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end