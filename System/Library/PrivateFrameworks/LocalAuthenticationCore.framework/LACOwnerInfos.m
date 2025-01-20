@interface LACOwnerInfos
- (LACOwnerInfos)initWithInfo:(id)a3 context:(id)a4;
- (NSArray)allInfos;
- (id)context;
- (id)description;
- (unint64_t)numberOfOwnersOtherThanPid:(int)a3;
- (void)addInfo:(id)a3;
@end

@implementation LACOwnerInfos

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_context);
  objc_storeStrong((id *)&self->_allInfos, 0);
}

- (LACOwnerInfos)initWithInfo:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACOwnerInfos;
  v8 = [(LACOwnerInfos *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v6, 0);
    allInfos = v8->_allInfos;
    v8->_allInfos = (NSMutableArray *)v9;

    objc_storeWeak(&v8->_context, v7);
  }

  return v8;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(LACOwnerInfos *)self allInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 proxy];

        if (v10)
        {
          v11 = [v9 proxy];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  objc_super v12 = NSString;
  v13 = [(LACOwnerInfos *)self context];
  v14 = [v12 stringWithFormat:@"<%@ : %@>", v13, v3];

  return v14;
}

- (void)addInfo:(id)a3
{
}

- (unint64_t)numberOfOwnersOtherThanPid:(int)a3
{
  v4 = [(LACOwnerInfos *)self allInfos];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__LACOwnerInfos_numberOfOwnersOtherThanPid___block_invoke;
  v9[3] = &__block_descriptor_36_e39_B24__0__LACOwnerInfo_8__NSDictionary_16l;
  int v10 = a3;
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:v9];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];
  unint64_t v7 = [v6 count];

  return v7;
}

BOOL __44__LACOwnerInfos_numberOfOwnersOtherThanPid___block_invoke(uint64_t a1, void *a2)
{
  return [a2 pid] != *(_DWORD *)(a1 + 32);
}

- (NSArray)allInfos
{
  allInfos = self->_allInfos;
  v4 = [(NSMutableArray *)allInfos indexesOfObjectsPassingTest:&__block_literal_global_2];
  [(NSMutableArray *)allInfos removeObjectsAtIndexes:v4];

  uint64_t v5 = self->_allInfos;
  return (NSArray *)v5;
}

BOOL __25__LACOwnerInfos_allInfos__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 proxy];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);
  return WeakRetained;
}

@end