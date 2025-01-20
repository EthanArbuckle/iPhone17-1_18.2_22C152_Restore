@interface CNContactFetchExecutor
+ (id)os_log;
- (CNContactFetchExecutor)initWithRequest:(id)a3 store:(id)a4;
- (CNContactFetchRequest)request;
- (CNContactStore)store;
- (id)description;
- (id)run:(id *)a3;
@end

@implementation CNContactFetchExecutor

void __30__CNContactFetchExecutor_run___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:v8];
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = [v8 identifier];
    [v6 setObject:v5 forKey:v7];
  }
}

- (id)run:(id *)a3
{
  id v5 = [(CNContactFetchExecutor *)self request];
  int v6 = [v5 shouldFailIfAccountNotYetSynced];

  if (v6
    && ([(CNContactFetchExecutor *)self store],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 hasAccountFirstSyncCompleted],
        v7,
        (v8 & 1) == 0))
  {
    v34 = +[CNErrorFactory errorWithCode:1007];
    v35 = v34;
    if (a3) {
      *a3 = v34;
    }

    v33 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = [(CNContactFetchExecutor *)self store];
    v12 = [(CNContactFetchExecutor *)self request];
    id v44 = 0;
    uint64_t v38 = MEMORY[0x1E4F143A8];
    uint64_t v39 = 3221225472;
    v40 = __30__CNContactFetchExecutor_run___block_invoke;
    v41 = &unk_1E56B4738;
    id v13 = v9;
    id v42 = v13;
    id v14 = v10;
    id v43 = v14;
    char v15 = [v11 enumerateContactsAndMatchInfoWithFetchRequest:v12 error:&v44 usingBlock:&v38];
    id v16 = v44;

    if (v15)
    {
      id v17 = v13;
      v18 = [(CNContactFetchExecutor *)self request];
      id v19 = [v18 predicate];
      v20 = v19;
      if (v19) {
        id v21 = v19;
      }

      uint64_t v22 = objc_msgSend(v20, "cn_resultTransformWithMatchInfos:", v14);
      v23 = (void *)v22;
      if (v22)
      {
        uint64_t v24 = (*(void (**)(uint64_t, id))(v22 + 16))(v22, v17);

        id v17 = (id)v24;
      }
      v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "data", v16, v38, v39, v40, v41, v42);
      v26 = [(CNContactFetchExecutor *)self store];
      v27 = [v26 currentHistoryAnchor];

      v28 = +[CNContactsLoggerProvider defaultProvider];
      v29 = [v28 apiTriageLogger];
      v30 = [(CNContactFetchExecutor *)self request];
      [v29 request:v30 willReturnAnchor:v27];

      if ([v27 isSuccess])
      {
        v31 = [v27 value];
        uint64_t v32 = [v31 historyToken];

        v25 = (void *)v32;
      }
      id v16 = v37;
      v33 = [[CNFetchResult alloc] initWithValue:v17 currentHistoryToken:v25];
    }
    else
    {
      v33 = 0;
      if (a3) {
        *a3 = v16;
      }
    }
  }

  return v33;
}

- (CNContactFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)store
{
  return self->_store;
}

- (CNContactFetchExecutor)initWithRequest:(id)a3 store:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactFetchExecutor;
  v9 = [(CNContactFetchExecutor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_store, a4);
    v11 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_2 != -1) {
    dispatch_once(&os_log_cn_once_token_0_2, &__block_literal_global_18);
  }
  v2 = (void *)os_log_cn_once_object_0_2;

  return v2;
}

uint64_t __32__CNContactFetchExecutor_os_log__block_invoke()
{
  os_log_cn_once_object_0_2 = (uint64_t)os_log_create("com.apple.contacts", "fetching");

  return MEMORY[0x1F41817F8]();
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNContactFetchExecutor *)self request];
  id v5 = (id)[v3 appendName:@"request" object:v4];

  int v6 = [(CNContactFetchExecutor *)self store];
  id v7 = (id)[v3 appendName:@"store" object:v6];

  id v8 = [v3 build];

  return v8;
}

@end