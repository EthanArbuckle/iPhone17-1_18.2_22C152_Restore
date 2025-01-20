@interface MGGroupsQueryOperation
- (MGGroupsQueryAgent)agent;
- (MGGroupsQueryOperation)initWithAgent:(id)a3 query:(id)a4 groups:(id)a5 substitutionVariables:(id)a6;
- (MGOutstandingQuery)query;
- (NSDictionary)groups;
- (NSDictionary)variables;
- (void)main;
@end

@implementation MGGroupsQueryOperation

- (MGGroupsQueryOperation)initWithAgent:(id)a3 query:(id)a4 groups:(id)a5 substitutionVariables:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MGGroupsQueryOperation;
  v15 = [(MGGroupsQueryOperation *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_agent, a3);
    objc_storeStrong((id *)&v16->_query, a4);
    uint64_t v17 = [v13 copy];
    groups = v16->_groups;
    v16->_groups = (NSDictionary *)v17;

    uint64_t v19 = [v14 copy];
    variables = v16->_variables;
    v16->_variables = (NSDictionary *)v19;
  }
  return v16;
}

- (void)main
{
  v3 = [(MGGroupsQueryOperation *)self variables];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v7 = v6;

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v7 setObject:v8 forKey:@"RESULTS_LIST"];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v7 setObject:v9 forKey:@"RESULTS_MAP"];
  v10 = [(MGGroupsQueryOperation *)self query];
  id v11 = [v10 predicate];

  id v12 = [(MGGroupsQueryOperation *)self groups];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30__MGGroupsQueryOperation_main__block_invoke;
  v18[3] = &unk_26485E8C0;
  v18[4] = self;
  id v19 = v11;
  id v20 = v7;
  id v13 = v8;
  id v21 = v13;
  id v22 = v9;
  id v14 = v9;
  id v15 = v7;
  id v16 = v11;
  [v12 enumerateKeysAndObjectsUsingBlock:v18];

  if (([(MGGroupsQueryOperation *)self isCancelled] & 1) == 0)
  {
    uint64_t v17 = [(MGGroupsQueryOperation *)self agent];
    [v17 _queryOperation:self didFindGroups:v13];
  }
}

void __30__MGGroupsQueryOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  char v8 = [*(id *)(a1 + 32) isCancelled];
  *a4 = v8;
  if ((v8 & 1) == 0
    && [*(id *)(a1 + 40) evaluateWithObject:v7 substitutionVariables:*(void *)(a1 + 48)])
  {
    [*(id *)(a1 + 56) addObject:v7];
    [*(id *)(a1 + 64) setObject:v7 forKey:v9];
  }
}

- (MGGroupsQueryAgent)agent
{
  return self->_agent;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end