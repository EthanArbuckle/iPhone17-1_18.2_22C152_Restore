@interface ATXRootOfAppDataWithDictionary
- (ATXRootOfAppDataWithDictionary)init;
- (id)description;
- (unint64_t)sessionCountForBundleId:(id)a3;
- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4;
- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4;
@end

@implementation ATXRootOfAppDataWithDictionary

- (ATXRootOfAppDataWithDictionary)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXRootOfAppDataWithDictionary;
  v2 = [(ATXRootOfAppData *)&v8 initInternal];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessionCounts = v2->_sessionCounts;
    v2->_sessionCounts = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    firstUA = v2->_firstUA;
    v2->_firstUA = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_sessionCounts objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  uint64_t v5 = [MEMORY[0x1E4F93BB8] tupleWithFirst:a3 second:a4];
  v6 = [(NSMutableDictionary *)self->_firstUA objectForKeyedSubscript:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F93BB8];
  id v7 = a3;
  id v14 = [v6 tupleWithFirst:v7 second:a4];
  objc_super v8 = NSNumber;
  v9 = [(NSMutableDictionary *)self->_firstUA objectForKeyedSubscript:v14];
  v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  [(NSMutableDictionary *)self->_firstUA setObject:v10 forKeyedSubscript:v14];

  v11 = NSNumber;
  v12 = [(NSMutableDictionary *)self->_sessionCounts objectForKeyedSubscript:v7];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
  [(NSMutableDictionary *)self->_sessionCounts setObject:v13 forKeyedSubscript:v7];
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ session counts: %@ first UA: %@", v5, self->_sessionCounts, self->_firstUA];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUA, 0);
  objc_storeStrong((id *)&self->_sessionCounts, 0);
}

@end