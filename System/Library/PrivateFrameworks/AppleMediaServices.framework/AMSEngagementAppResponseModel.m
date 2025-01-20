@interface AMSEngagementAppResponseModel
+ (BOOL)_shouldEvictDefinition:(id)a3 created:(id)a4;
- (AMSEngagementAppResponseModel)initWithCacheObject:(id)a3;
- (AMSEngagementAppResponseModel)initWithData:(id)a3 cacheInfo:(id)a4;
- (BOOL)matchesEvent:(id)a3;
- (NSDate)created;
- (NSDictionary)definition;
- (NSDictionary)responseData;
- (NSMutableDictionary)regexCache;
- (NSString)cacheKey;
- (id)exportObject;
@end

@implementation AMSEngagementAppResponseModel

- (AMSEngagementAppResponseModel)initWithCacheObject:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_9;
  }
  v18.receiver = self;
  v18.super_class = (Class)AMSEngagementAppResponseModel;
  self = [(AMSEngagementAppResponseModel *)&v18 init];
  if (!self) {
    goto LABEL_10;
  }
  v5 = [v4 objectForKeyedSubscript:@"created"];
  char v6 = objc_opt_respondsToSelector();
  double v7 = 0.0;
  if (v6) {
    objc_msgSend(v5, "doubleValue", 0.0);
  }
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  created = self->_created;
  self->_created = v8;

  v10 = [v4 objectForKeyedSubscript:@"definition"];
  objc_opt_class();
  v11 = (objc_opt_isKindOfClass() & 1) != 0 ? (NSDictionary *)v10 : 0;

  definition = self->_definition;
  self->_definition = v11;

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  regexCache = self->_regexCache;
  self->_regexCache = v13;

  char v15 = [(id)objc_opt_class() _shouldEvictDefinition:self->_definition created:self->_created];
  if (v15)
  {
LABEL_9:
    v16 = 0;
  }
  else
  {
LABEL_10:
    self = self;
    v16 = self;
  }

  return v16;
}

- (AMSEngagementAppResponseModel)initWithData:(id)a3 cacheInfo:(id)a4
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)AMSEngagementAppResponseModel;
  v8 = [(AMSEngagementAppResponseModel *)&v17 init];
  if (v8)
  {
    if (![v6 count] || !objc_msgSend(v7, "count"))
    {
      char v15 = 0;
      goto LABEL_13;
    }
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    created = v8->_created;
    v8->_created = (NSDate *)v9;

    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = (id)MEMORY[0x1E4F1CC08];
    }
    v18[0] = @"data";
    v18[1] = @"cacheInfo";
    if (v7) {
      id v12 = v7;
    }
    else {
      id v12 = (id)MEMORY[0x1E4F1CC08];
    }
    v19[0] = v11;
    v19[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    definition = v8->_definition;
    v8->_definition = (NSDictionary *)v13;
  }
  char v15 = v8;
LABEL_13:

  return v15;
}

- (NSString)cacheKey
{
  v2 = [(AMSEngagementAppResponseModel *)self definition];
  v3 = [v2 objectForKeyedSubscript:@"cacheInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  v5 = [v4 objectForKeyedSubscript:@"key"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;

    if (v6)
    {
      id v7 = v6;
      v8 = v7;
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
  v8 = [v9 UUIDString];

  id v7 = 0;
LABEL_9:

  return (NSString *)v8;
}

- (id)exportObject
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"created";
  v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = [(AMSEngagementAppResponseModel *)self created];
  [v4 timeIntervalSince1970];
  v5 = objc_msgSend(v3, "numberWithDouble:");
  v11[1] = @"definition";
  v12[0] = v5;
  uint64_t v6 = [(AMSEngagementAppResponseModel *)self definition];
  id v7 = (void *)v6;
  uint64_t v8 = MEMORY[0x1E4F1CC08];
  if (v6) {
    uint64_t v8 = v6;
  }
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (NSDictionary)responseData
{
  v2 = [(AMSEngagementAppResponseModel *)self definition];
  v3 = [v2 objectForKeyedSubscript:@"data"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)matchesEvent:(id)a3
{
  id v4 = a3;
  v5 = [(AMSEngagementAppResponseModel *)self definition];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"cacheInfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = [v7 objectForKeyedSubscript:@"filter"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [(AMSEngagementAppResponseModel *)self regexCache];
  BOOL v11 = +[AMSEngagementAppEventFilterModel matchEvent:v4 toFilter:v9 withCache:v10];

  return v11;
}

+ (BOOL)_shouldEvictDefinition:(id)a3 created:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 objectForKeyedSubscript:@"cacheInfo"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  uint64_t v8 = [v7 objectForKeyedSubscript:@"duration"];
  char v9 = objc_opt_respondsToSelector();
  double v10 = 0.0;
  if (v9) {
    objc_msgSend(v8, "doubleValue", 0.0);
  }
  BOOL v13 = 1;
  if (v5)
  {
    double v11 = fmin(v10, 2592000.0);
    [v5 timeIntervalSinceNow];
    if (v11 >= -v12) {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (NSDate)created
{
  return self->_created;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (NSMutableDictionary)regexCache
{
  return self->_regexCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regexCache, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_created, 0);
}

@end