@interface AMSUIWebFetchTreatmentsAction
+ (NSISO8601DateFormatter)dateFormatter;
+ (id)dictionaryRepresentationForTreatment:(id)a3;
- (AMSUIWebFetchTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)includeExperimentData;
- (BOOL)includePayload;
- (NSArray)areaIds;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)runAction;
- (void)setAreaIds:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setIncludeExperimentData:(BOOL)a3;
- (void)setIncludePayload:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation AMSUIWebFetchTreatmentsAction

+ (NSISO8601DateFormatter)dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x263F088C0]);
  return (NSISO8601DateFormatter *)v2;
}

+ (id)dictionaryRepresentationForTreatment:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 dateFormatter];
  v13[0] = @"endDate";
  v6 = [v4 endDate];
  v7 = [v5 stringFromDate:v6];
  v14[0] = v7;
  v13[1] = @"identifier";
  v8 = [v4 identifier];
  v14[1] = v8;
  v13[2] = @"startDate";
  v9 = [v4 startDate];

  v10 = [v5 stringFromDate:v9];
  v14[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

- (AMSUIWebFetchTreatmentsAction)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)AMSUIWebFetchTreatmentsAction;
  v7 = [(AMSUIWebAction *)&v38 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"areaIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    areaIds = v7->_areaIds;
    v7->_areaIds = v9;

    v11 = [v6 objectForKeyedSubscript:@"endDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    v13 = +[AMSUIWebFetchTreatmentsAction dateFormatter];
    v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 dateFromString:v12];
      endDate = v7->_endDate;
      v7->_endDate = (NSDate *)v15;

      if (!v7->_endDate)
      {
        v17 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v17)
        {
          v17 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v18 = [v17 OSLogObject];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = objc_opt_class();
          v20 = AMSLogKey();
          v21 = AMSHashIfNeeded();
          v22 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138544130;
          uint64_t v40 = v19;
          __int16 v41 = 2114;
          v42 = v20;
          __int16 v43 = 2114;
          v44 = v21;
          __int16 v45 = 2114;
          v46 = v22;
          _os_log_impl(&dword_21C134000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Wrong '%{public}@' format (\"%{public}@\")", buf, 0x2Au);
        }
      }
    }
    v23 = [v6 objectForKeyedSubscript:@"includeExperimentData"];
    if (objc_opt_respondsToSelector())
    {
      v24 = [v6 objectForKeyedSubscript:@"includeExperimentData"];
      v7->_includeExperimentData = [v24 BOOLValue];
    }
    else
    {
      v7->_includeExperimentData = 0;
    }

    v25 = [v6 objectForKeyedSubscript:@"includePayload"];
    if (objc_opt_respondsToSelector())
    {
      v26 = [v6 objectForKeyedSubscript:@"includePayload"];
      v7->_includePayload = [v26 BOOLValue];
    }
    else
    {
      v7->_includePayload = 0;
    }

    v27 = [v6 objectForKeyedSubscript:@"startDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    if (v28)
    {
      uint64_t v29 = [v14 dateFromString:v28];
      startDate = v7->_startDate;
      v7->_startDate = (NSDate *)v29;

      if (!v7->_startDate)
      {
        v31 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
        if (!v31)
        {
          v31 = [MEMORY[0x263F27CB8] sharedConfig];
        }
        v32 = [v31 OSLogObject];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = objc_opt_class();
          v33 = AMSLogKey();
          v34 = AMSHashIfNeeded();
          v35 = AMSHashIfNeeded();
          *(_DWORD *)buf = 138544130;
          uint64_t v40 = v37;
          __int16 v41 = 2114;
          v42 = v33;
          __int16 v43 = 2114;
          v44 = v34;
          __int16 v45 = 2114;
          v46 = v35;
          _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Wrong '%{public}@' format (\"%{public}@\")", buf, 0x2Au);
        }
      }
    }
  }
  return v7;
}

- (id)runAction
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  v68.receiver = self;
  v68.super_class = (Class)AMSUIWebFetchTreatmentsAction;
  id v3 = [(AMSUIWebAction *)&v68 runAction];
  id v4 = [(AMSUIWebFetchTreatmentsAction *)self areaIds];
  if (v4)
  {
    v62 = [MEMORY[0x263F27EC0] defaultTreatmentStore];
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v4];
    id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v6)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      v10 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v70 = v8;
      __int16 v71 = 2114;
      v72 = v9;
      __int16 v73 = 2114;
      v74 = v10;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching treatments (areas: %{public}@)", buf, 0x20u);
    }
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([(AMSUIWebFetchTreatmentsAction *)self includeExperimentData])
    {
      id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v12)
      {
        id v12 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = AMSLogKey();
        v16 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v70 = v14;
        __int16 v71 = 2114;
        v72 = v15;
        __int16 v73 = 2114;
        v74 = v16;
        _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching experiment data (areas: %{public}@)", buf, 0x20u);
      }
      v17 = [MEMORY[0x263F27EC0] defaultTreatmentStore];
      v18 = [v17 experimentDataForAreas:v5];
      uint64_t v19 = [v18 thenWithBlock:&__block_literal_global_26];

      [v11 addObject:v19];
    }
    if ([(AMSUIWebFetchTreatmentsAction *)self includePayload])
    {
      v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v20)
      {
        v20 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v21 = [v20 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        v23 = AMSLogKey();
        v24 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v70 = v22;
        __int16 v71 = 2114;
        v72 = v23;
        __int16 v73 = 2114;
        v74 = v24;
        _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching payload (areas: %{public}@)", buf, 0x20u);
      }
      v25 = [MEMORY[0x263F27EC0] defaultTreatmentStore];
      v26 = [v25 treatmentsPayloadForAreas:v5];
      v27 = [v26 thenWithBlock:&__block_literal_global_51];

      [v11 addObject:v27];
    }
    uint64_t v28 = [(AMSUIWebFetchTreatmentsAction *)self startDate];
    uint64_t v29 = [(AMSUIWebFetchTreatmentsAction *)self endDate];
    v63 = v4;
    if (v28 | v29)
    {
      v59 = +[AMSUIWebFetchTreatmentsAction dateFormatter];
      __int16 v43 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v43)
      {
        __int16 v43 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v44 = [v43 OSLogObject];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        id v61 = v11;
        uint64_t v55 = objc_opt_class();
        v56 = AMSLogKey();
        __int16 v45 = AMSHashIfNeeded();
        v57 = [v59 stringFromDate:v28];
        uint64_t v58 = v5;
        uint64_t v46 = AMSHashIfNeeded();
        uint64_t v47 = [v59 stringFromDate:v29];
        v48 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138544386;
        uint64_t v70 = v55;
        __int16 v71 = 2114;
        v72 = v56;
        __int16 v73 = 2114;
        v74 = v45;
        __int16 v75 = 2114;
        uint64_t v76 = v46;
        v49 = (void *)v46;
        __int16 v77 = 2114;
        v78 = v48;
        _os_log_impl(&dword_21C134000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching treatments (areas: %{public}@, startDate: %{public}@, endDate: %{public}@)", buf, 0x34u);

        uint64_t v5 = v58;
        id v11 = v61;
      }

      v50 = [MEMORY[0x263F27EC0] defaultTreatmentStore];
      v51 = [v50 treatmentsForAreas:v5 startDate:v28 endDate:v29];
      v66[0] = MEMORY[0x263EF8330];
      uint64_t v40 = (void *)v28;
      v66[1] = 3221225472;
      v66[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_55;
      v66[3] = &unk_2643E4F38;
      v66[4] = self;
      v52 = [v51 thenWithBlock:v66];

      [v11 addObject:v52];
      v36 = v62;
      v39 = v11;
      v30 = (void *)v5;
    }
    else
    {
      v60 = v11;
      v30 = (void *)v5;
      v31 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
      if (!v31)
      {
        v31 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v32 = [v31 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = objc_opt_class();
        v34 = AMSLogKey();
        v35 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v70 = v33;
        __int16 v71 = 2114;
        v72 = v34;
        __int16 v73 = 2114;
        v74 = v35;
        _os_log_impl(&dword_21C134000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching active treatments (areas: %{public}@)", buf, 0x20u);
      }
      v36 = v62;
      uint64_t v37 = [v62 activeTreatmentsForAreas:v30];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_52;
      v67[3] = &unk_2643E4F38;
      v67[4] = self;
      objc_super v38 = [v37 thenWithBlock:v67];

      v39 = v60;
      [v60 addObject:v38];

      uint64_t v40 = (void *)v28;
    }
    v53 = objc_msgSend(MEMORY[0x263F27E10], "promiseWithAll:", v39, v55);
    v42 = [v53 thenWithBlock:&__block_literal_global_59];

    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_5;
    v65[3] = &unk_2643E3570;
    v65[4] = self;
    [v42 addErrorBlock:v65];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_64;
    v64[3] = &unk_2643E4E88;
    v64[4] = self;
    [v42 addSuccessBlock:v64];

    id v4 = v63;
  }
  else
  {
    __int16 v41 = (void *)MEMORY[0x263F27E10];
    v36 = AMSError();
    v42 = [v41 promiseWithError:v36];
  }

  return v42;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F27E10];
  uint64_t v8 = @"experimentData";
  v9[0] = a2;
  id v3 = NSDictionary;
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v2 promiseWithResult:v5];

  return v6;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_48(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F27E10];
  uint64_t v8 = @"payload";
  v9[0] = a2;
  id v3 = NSDictionary;
  id v4 = a2;
  uint64_t v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [v2 promiseWithResult:v5];

  return v6;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_52(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2;
  v7[3] = &unk_2643E4F10;
  v7[4] = *(void *)(a1 + 32);
  id v2 = objc_msgSend(a2, "ams_compactMapValues:", v7);
  id v3 = (void *)MEMORY[0x263F27E10];
  uint64_t v8 = @"treatments";
  v9[0] = v2;
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v3 promiseWithResult:v4];

  return v5;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() dictionaryRepresentationForTreatment:v2];

  return v3;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_55(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2_56;
  v7[3] = &unk_2643E4F60;
  v7[4] = *(void *)(a1 + 32);
  id v2 = objc_msgSend(a2, "ams_compactMapValues:", v7);
  id v3 = (void *)MEMORY[0x263F27E10];
  uint64_t v8 = @"treatmentSets";
  v9[0] = v2;
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v5 = [v3 promiseWithResult:v4];

  return v5;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_2_56(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend((id)objc_opt_class(), "dictionaryRepresentationForTreatment:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

id __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ams_reduceWithInitialResult:updateAccumulatingResult:", MEMORY[0x263EFFA78], &__block_literal_global_62);
  id v3 = [MEMORY[0x263F27E10] promiseWithResult:v2];

  return v3;
}

uint64_t __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ams_dictionaryByAddingEntriesFromDictionary:");
}

void __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_5(uint64_t a1, void *a2)
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
    uint64_t v6 = AMSLogKey();
    uint64_t v7 = AMSHashIfNeeded();
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    long long v11 = v6;
    __int16 v12 = 2114;
    long long v13 = v7;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failure (error: %{public}@)", (uint8_t *)&v8, 0x20u);
  }
}

void __42__AMSUIWebFetchTreatmentsAction_runAction__block_invoke_64(uint64_t a1, void *a2)
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
    uint64_t v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    __int16 v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Success (result: %{public}@)", (uint8_t *)&v7, 0x20u);
  }
}

- (NSArray)areaIds
{
  return self->_areaIds;
}

- (void)setAreaIds:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)includeExperimentData
{
  return self->_includeExperimentData;
}

- (void)setIncludeExperimentData:(BOOL)a3
{
  self->_includeExperimentData = a3;
}

- (BOOL)includePayload
{
  return self->_includePayload;
}

- (void)setIncludePayload:(BOOL)a3
{
  self->_includePayload = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_areaIds, 0);
}

@end