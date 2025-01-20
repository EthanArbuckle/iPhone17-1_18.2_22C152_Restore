@interface AMSEngagementAppEventFilterModel
+ (BOOL)matchEvent:(id)a3 toFilter:(id)a4 withCache:(id)a5;
+ (id)regexForPattern:(id)a3 fromCache:(id)a4;
+ (id)stringFromValue:(id)a3;
- (AMSEngagementAppEventFilterModel)init;
- (AMSEngagementAppEventFilterModel)initWithCacheObject:(id)a3;
- (AMSEngagementAppEventFilterModel)initWithDefinition:(id)a3;
- (BOOL)allowsResponse;
- (BOOL)matchesEvent:(id)a3;
- (NSDictionary)definition;
- (NSMutableDictionary)regexCache;
- (id)exportObject;
- (unint64_t)components;
@end

@implementation AMSEngagementAppEventFilterModel

void __66__AMSEngagementAppEventFilterModel_matchEvent_toFilter_withCache___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = (void *)MEMORY[0x192FA47D0]();
  v10 = [*(id *)(a1 + 56) stringFromValue:v8];
  v11 = *(void **)(a1 + 56);
  v12 = [*(id *)(a1 + 32) valueForKeyPath:v7];
  v13 = [v11 stringFromValue:v12];

  v14 = [*(id *)(a1 + 56) regexForPattern:v10 fromCache:*(void *)(a1 + 40)];
  uint64_t v15 = objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
  if (!v14 || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (id)stringFromValue:(id)a3
{
  if (a3)
  {
    v4 = [a3 description];
  }
  else
  {
    v4 = @"(null)";
  }
  return v4;
}

+ (id)regexForPattern:(id)a3 fromCache:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:v5];
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v17 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v5 options:0 error:&v17];
    id v10 = v17;
    if (v10)
    {
      v11 = +[AMSLogConfig sharedEngagementConfig];
      if (!v11)
      {
        v11 = +[AMSLogConfig sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = objc_opt_class();
        v14 = AMSLogKey();
        uint64_t v15 = AMSLogableError(v10);
        *(_DWORD *)buf = 138544130;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        v21 = v14;
        __int16 v22 = 2114;
        id v23 = v5;
        __int16 v24 = 2114;
        v25 = v15;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@ [%{public}@]: Regex failure. keyPath = %{public}@, error = %{public}@", buf, 0x2Au);
      }
    }
    [v6 setObject:v9 forKeyedSubscript:v5];
    id v8 = v9;
  }
  return v8;
}

- (AMSEngagementAppEventFilterModel)initWithCacheObject:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"definition"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [(AMSEngagementAppEventFilterModel *)self initWithDefinition:v5];
  return v6;
}

- (AMSEngagementAppEventFilterModel)initWithDefinition:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSEngagementAppEventFilterModel;
  id v6 = [(AMSEngagementAppEventFilterModel *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_definition, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    regexCache = v7->_regexCache;
    v7->_regexCache = v8;
  }
  return v7;
}

- (BOOL)matchesEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementAppEventFilterModel *)self definition];
  id v6 = [v5 objectForKeyedSubscript:@"filter"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  id v8 = [(AMSEngagementAppEventFilterModel *)self regexCache];
  BOOL v9 = +[AMSEngagementAppEventFilterModel matchEvent:v4 toFilter:v7 withCache:v8];

  return v9;
}

- (NSDictionary)definition
{
  return self->_definition;
}

+ (BOOL)matchEvent:(id)a3 toFilter:(id)a4 withCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__AMSEngagementAppEventFilterModel_matchEvent_toFilter_withCache___block_invoke;
    v13[3] = &unk_1E55A2498;
    id v17 = a1;
    id v14 = v8;
    id v15 = v10;
    v16 = &v18;
    [v9 enumerateKeysAndObjectsUsingBlock:v13];
    BOOL v11 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (NSMutableDictionary)regexCache
{
  return self->_regexCache;
}

- (unint64_t)components
{
  uint64_t v3 = [(AMSEngagementAppEventFilterModel *)self definition];
  id v4 = [v3 objectForKeyedSubscript:@"components"];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(AMSEngagementAppEventFilterModel *)self definition];
    id v6 = [v5 objectForKeyedSubscript:@"components"];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = -1;
  }

  return v7;
}

- (BOOL)allowsResponse
{
  v2 = [(AMSEngagementAppEventFilterModel *)self definition];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"allowsResponse"];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (AMSEngagementAppEventFilterModel)init
{
  return [(AMSEngagementAppEventFilterModel *)self initWithDefinition:0];
}

- (id)exportObject
{
  v8[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = @"definition";
  uint64_t v2 = [(AMSEngagementAppEventFilterModel *)self definition];
  uint64_t v3 = (void *)v2;
  uint64_t v4 = MEMORY[0x1E4F1CC08];
  if (v2) {
    uint64_t v4 = v2;
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexCache, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end