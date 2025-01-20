@interface EMSearchableIndexUserQuery
- (EMSearchableIndexUserQuery)initWithExpression:(id)a3 builder:(id)a4;
@end

@implementation EMSearchableIndexUserQuery

- (EMSearchableIndexUserQuery)initWithExpression:(id)a3 builder:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__EMSearchableIndexUserQuery_initWithExpression_builder___block_invoke;
  v20[3] = &unk_1E63E60E8;
  id v8 = v6;
  id v21 = v8;
  v9 = (void *)MEMORY[0x1C18A2160](v20);
  v10 = [v8 updatedSuggestion];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F23870] emptySuggestion];
  }
  v13 = v12;

  v14 = [MEMORY[0x1E4F23898] userQueryContextWithCurrentSuggestion:v13];
  v15 = +[EMSearchableIndexQuery log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v8, "ef_publicDescription");
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "Setting user query with expression: %@ context: %@", buf, 0x16u);
  }
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexUserQuery;
  v17 = [(EMSearchableIndexQuery *)&v19 initWithExpression:v8 builder:v7 queryContext:v14 querySetup:v9];

  return v17;
}

id __57__EMSearchableIndexUserQuery_initWithExpression_builder___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) searchString];
  v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F1A3DFB0;
  }
  [v3 setUserQuery:v6];

  [v3 setLowPriority:0];
  id v7 = [*(id *)(a1 + 32) queryString];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v3 setFilterQueries:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F23890]);
  v10 = [*(id *)(a1 + 32) searchString];
  v11 = (void *)[v9 initWithUserQueryString:v10 queryContext:v3];

  return v11;
}

@end