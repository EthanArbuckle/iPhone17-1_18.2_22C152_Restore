@interface IDSQueryRateLimitedMetric
- (IDSQueryRateLimitedMetric)initWithTopLevelService:(id)a3 count:(id)a4 timeSinceStart:(id)a5;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)queryCount;
- (NSNumber)timeSinceStart;
- (NSString)name;
- (NSString)topLevelService;
@end

@implementation IDSQueryRateLimitedMetric

- (NSString)name
{
  return (NSString *)@"IDSQueryRateLimited";
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = objc_msgSend_topLevelService(self, v4, v5, v6);
  if (v7) {
    CFDictionarySetValue(v3, @"topLevelService", v7);
  }

  v11 = objc_msgSend_queryCount(self, v8, v9, v10);
  if (v11) {
    CFDictionarySetValue(v3, @"count", v11);
  }

  v15 = objc_msgSend_timeSinceStart(self, v12, v13, v14);
  if (v15) {
    CFDictionarySetValue(v3, @"timeSinceStart", v15);
  }

  return (NSDictionary *)v3;
}

- (IDSQueryRateLimitedMetric)initWithTopLevelService:(id)a3 count:(id)a4 timeSinceStart:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSQueryRateLimitedMetric;
  v12 = [(IDSQueryRateLimitedMetric *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topLevelService, a3);
    objc_storeStrong((id *)&v13->_queryCount, a4);
    objc_storeStrong((id *)&v13->_timeSinceStart, a5);
  }

  return v13;
}

- (NSString)topLevelService
{
  return self->_topLevelService;
}

- (NSNumber)queryCount
{
  return self->_queryCount;
}

- (NSNumber)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSinceStart, 0);
  objc_storeStrong((id *)&self->_queryCount, 0);
  objc_storeStrong((id *)&self->_topLevelService, 0);
}

@end