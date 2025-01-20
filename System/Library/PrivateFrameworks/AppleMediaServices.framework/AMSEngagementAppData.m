@interface AMSEngagementAppData
- (AMSEngagementAppData)initWithIdentifier:(id)a3 cacheObject:(id)a4;
- (NSArray)cachedResponses;
- (NSArray)eventFilters;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)exportObject;
- (void)setCachedResponses:(id)a3;
- (void)setEventFilters:(id)a3;
@end

@implementation AMSEngagementAppData

- (AMSEngagementAppData)initWithIdentifier:(id)a3 cacheObject:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)AMSEngagementAppData;
  v9 = [(AMSEngagementAppData *)&v43 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_26;
  }
  objc_storeStrong((id *)&v9->_identifier, a3);
  v11 = [v8 objectForKeyedSubscript:@"eventFilters"];
  objc_opt_class();
  v36 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  id v12 = v11;

  if (!v12)
  {
LABEL_6:
    v15 = objc_msgSend(v8, "objectForKeyedSubscript:", @"whitelist", v10);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v15;
    }
    else {
      id v14 = 0;
    }

    id v13 = 0;
    goto LABEL_10;
  }
  id v13 = v12;
  id v14 = v13;
LABEL_10:

  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v40 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v23 = [AMSEngagementAppEventFilterModel alloc];
        id v24 = v22;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v25 = v24;
        }
        else {
          id v25 = 0;
        }

        v26 = [(AMSEngagementAppEventFilterModel *)v23 initWithCacheObject:v25];
        if (v26) {
          [v16 addObject:v26];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v19);
  }

  uint64_t v27 = [v16 copy];
  v10 = v36;
  eventFilters = v36->_eventFilters;
  v36->_eventFilters = (NSArray *)v27;

  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v30 = [v8 objectForKeyedSubscript:@"cachedResponses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v31 = v30;
  }
  else {
    id v31 = 0;
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __55__AMSEngagementAppData_initWithIdentifier_cacheObject___block_invoke;
  v37[3] = &unk_1E559F9D8;
  id v38 = v29;
  id v32 = v29;
  [v31 enumerateKeysAndObjectsUsingBlock:v37];
  uint64_t v33 = [v32 copy];
  cachedResponses = v36->_cachedResponses;
  v36->_cachedResponses = (NSArray *)v33;

LABEL_26:
  return v10;
}

- (NSArray)eventFilters
{
  return self->_eventFilters;
}

- (NSArray)cachedResponses
{
  return self->_cachedResponses;
}

void __55__AMSEngagementAppData_initWithIdentifier_cacheObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v6;
  }
  else {
    id v4 = 0;
  }

  v5 = [[AMSEngagementAppResponseModel alloc] initWithCacheObject:v4];
  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)exportObject
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v25 = self;
  id v4 = [(AMSEngagementAppData *)self cachedResponses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v10 = [v9 exportObject];
        v11 = [v9 cacheKey];
        if (v11)
        {
          [v3 setObject:v10 forKeyedSubscript:v11];
        }
        else
        {
          id v12 = [MEMORY[0x1E4F29128] UUID];
          id v13 = [v12 UUIDString];
          [v3 setObject:v10 forKeyedSubscript:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v37 count:16];
    }
    while (v6);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v15 = [(AMSEngagementAppData *)v25 eventFilters];
  v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = [(AMSEngagementAppData *)v25 eventFilters];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) exportObject];
        [v16 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v19);
  }

  v34[0] = @"cachedResponses";
  v34[1] = @"eventFilters";
  v35[0] = v3;
  v35[1] = v16;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(AMSEngagementAppData *)self identifier];
  uint64_t v6 = [(AMSEngagementAppData *)self exportObject];
  uint64_t v7 = (void *)[v4 initWithIdentifier:v5 cacheObject:v6];

  return v7;
}

- (void)setCachedResponses:(id)a3
{
}

- (void)setEventFilters:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_eventFilters, 0);
  objc_storeStrong((id *)&self->_cachedResponses, 0);
}

@end