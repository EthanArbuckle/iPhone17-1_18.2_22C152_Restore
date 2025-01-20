@interface CNCDAccountFetcher
+ (id)accountsForPredicate:(id)a3 inPersistenceStack:(id)a4 error:(id *)a5;
- (CNCDAccountFetcher)init;
- (CNCDAccountFetcher)initWithPredicate:(id)a3 persistenceContext:(id)a4;
- (CNCDPersistenceContext)persistenceContext;
- (NSPredicate)predicate;
- (id)fetchAccounts:(id *)a3;
@end

@implementation CNCDAccountFetcher

+ (id)accountsForPredicate:(id)a3 inPersistenceStack:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F5A3B8];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __68__CNCDAccountFetcher_accountsForPredicate_inPersistenceStack_error___block_invoke;
  v22 = &unk_1E56B5580;
  id v10 = v8;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  v12 = [v9 eitherWithBlock:&v19];
  if ((*(unsigned int (**)(void, void *, uint64_t, uint64_t))(*MEMORY[0x1E4F5A1C0] + 16))(*MEMORY[0x1E4F5A1C0], v12, v13, v14))
  {
    v15 = objc_msgSend(v12, "left", v19, v20, v21, v22, v23);
  }
  else
  {
    v16 = objc_msgSend(v12, "right", v19, v20, v21, v22, v23);
    v17 = v16;
    if (a5) {
      *a5 = v16;
    }

    v15 = 0;
  }

  return v15;
}

id __68__CNCDAccountFetcher_accountsForPredicate_inPersistenceStack_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) makePersistenceContext];
  v5 = [[CNCDAccountFetcher alloc] initWithPredicate:*(void *)(a1 + 40) persistenceContext:v4];
  v6 = [(CNCDAccountFetcher *)v5 fetchAccounts:a2];

  return v6;
}

- (CNCDAccountFetcher)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNCDAccountFetcher)initWithPredicate:(id)a3 persistenceContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNCDAccountFetcher;
  v9 = [(CNCDAccountFetcher *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_persistenceContext, a4);
    id v11 = v10;
  }

  return v10;
}

- (id)fetchAccounts:(id *)a3
{
  v4 = [(CNCDAccountFetcher *)self predicate];

  v5 = [(CNCDAccountFetcher *)self persistenceContext];
  v6 = [v5 allContainers];
  id v7 = v6;
  if (v4)
  {
    id v8 = [(CNCDAccountFetcher *)self predicate];
    v9 = [v7 filteredArrayUsingPredicate:v8];
    id v10 = objc_msgSend(v9, "_cn_map:", sABCDContainerToCNAccount);
  }
  else
  {
    id v10 = objc_msgSend(v6, "_cn_map:", sABCDContainerToCNAccount);
  }

  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (CNCDPersistenceContext)persistenceContext
{
  return self->_persistenceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceContext, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end