@interface AMSUIWebFetchTreatmentAreasAction
- (AMSUIWebFetchTreatmentAreasAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSArray)namespaceIds;
- (NSArray)topicIds;
- (id)runAction;
- (void)setNamespaceIds:(id)a3;
- (void)setTopicIds:(id)a3;
@end

@implementation AMSUIWebFetchTreatmentAreasAction

- (AMSUIWebFetchTreatmentAreasAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebFetchTreatmentAreasAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"namespaceIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    namespaceIds = v7->_namespaceIds;
    v7->_namespaceIds = v9;

    v11 = [v6 objectForKeyedSubscript:@"topicIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }

    topicIds = v7->_topicIds;
    v7->_topicIds = v12;
  }
  return v7;
}

- (id)runAction
{
  v2 = self;
  uint64_t v46 = *MEMORY[0x263EF8340];
  v39.receiver = self;
  v39.super_class = (Class)AMSUIWebFetchTreatmentAreasAction;
  id v3 = [(AMSUIWebAction *)&v39 runAction];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  v5 = [(AMSUIWebFetchTreatmentAreasAction *)v2 namespaceIds];
  unint64_t v6 = 0x263F27000;
  if (v5)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
    v8 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v8)
    {
      v8 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      v11 = AMSLogKey();
      v12 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v10;
      __int16 v42 = 2114;
      v43 = v11;
      __int16 v44 = 2114;
      v45 = v12;
      _os_log_impl(&dword_21C134000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching areas (namespaces: %{public}@)", buf, 0x20u);

      unint64_t v6 = 0x263F27000uLL;
    }

    v13 = [*(id *)(v6 + 3776) defaultTreatmentStore];
    v14 = [v13 areasForNamespaces:v7];
    objc_super v15 = [v14 thenWithBlock:&__block_literal_global_25];

    [v4 addObject:v15];
  }
  v16 = [(AMSUIWebFetchTreatmentAreasAction *)v2 topicIds];
  if (v16)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v16];
    v18 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v18)
    {
      v18 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v2;
      v20 = v16;
      v21 = v4;
      v22 = v5;
      unint64_t v23 = v6;
      uint64_t v24 = objc_opt_class();
      v25 = AMSLogKey();
      v26 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v41 = v24;
      unint64_t v6 = v23;
      v5 = v22;
      v4 = v21;
      v16 = v20;
      v2 = v36;
      __int16 v42 = 2114;
      v43 = v25;
      __int16 v44 = 2114;
      v45 = v26;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching areas (topics: %{public}@)", buf, 0x20u);
    }
    v27 = [*(id *)(v6 + 3776) defaultTreatmentStore];
    v28 = [v27 areasForTopics:v17];
    v29 = [v28 thenWithBlock:&__block_literal_global_21];

    [v4 addObject:v29];
  }
  uint64_t v30 = [v4 count];
  v31 = (void *)MEMORY[0x263F27E10];
  if (v30)
  {
    v32 = [MEMORY[0x263F27E10] promiseWithAll:v4];
    v33 = [v32 thenWithBlock:&__block_literal_global_27];

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_4;
    v38[3] = &unk_2643E3570;
    v38[4] = v2;
    [v33 addErrorBlock:v38];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_32;
    v37[3] = &unk_2643E4E88;
    v37[4] = v2;
    [v33 addSuccessBlock:v37];
  }
  else
  {
    v34 = AMSError();
    v33 = [v31 promiseWithError:v34];
  }
  return v33;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F27E10];
  v8 = @"namespaceAreas";
  v9[0] = a2;
  id v3 = NSDictionary;
  id v4 = a2;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unint64_t v6 = [v2 promiseWithResult:v5];

  return v6;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_19(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F27E10];
  v8 = @"topicAreas";
  v9[0] = a2;
  id v3 = NSDictionary;
  id v4 = a2;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unint64_t v6 = [v2 promiseWithResult:v5];

  return v6;
}

id __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "ams_reduceWithInitialResult:updateAccumulatingResult:", MEMORY[0x263EFFA78], &__block_literal_global_30);
  id v3 = [MEMORY[0x263F27E10] promiseWithResult:v2];

  return v3;
}

uint64_t __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_dictionaryByAddingEntriesFromDictionary:");
}

void __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    unint64_t v6 = AMSLogKey();
    v7 = AMSHashIfNeeded();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failure (error: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
}

void __46__AMSUIWebFetchTreatmentAreasAction_runAction__block_invoke_32(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    id v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    unint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success (result: %{public}@)", (uint8_t *)&v7, 0x20u);
  }
}

- (NSArray)namespaceIds
{
  return self->_namespaceIds;
}

- (void)setNamespaceIds:(id)a3
{
}

- (NSArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_namespaceIds, 0);
}

@end