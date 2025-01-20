@interface GEORequestCounterCacheResults
- (GEORequestCounterCacheResults)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDateInterval)timeRange;
- (NSString)appId;
- (int)requestKindRaw;
- (unsigned)cacheExpiredCount;
- (unsigned)cacheHitCount;
- (unsigned)cacheMissCount;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAppId:(id)a3;
- (void)setCacheExpiredCount:(unsigned int)a3;
- (void)setCacheHitCount:(unsigned int)a3;
- (void)setCacheMissCount:(unsigned int)a3;
- (void)setEndTime:(id)a3;
- (void)setRequestKindRaw:(int)a3;
- (void)setStartTime:(id)a3;
@end

@implementation GEORequestCounterCacheResults

- (NSDateInterval)timeRange
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [(GEORequestCounterCacheResults *)self startTime];
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  v6 = [(GEORequestCounterCacheResults *)self endTime];
  if (v6)
  {
    v7 = (void *)[v3 initWithStartDate:v5 endDate:v6];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v7 = (void *)[v3 initWithStartDate:v5 endDate:v8];
  }
  if (!v4) {

  }
  return (NSDateInterval *)v7;
}

- (GEORequestCounterCacheResults)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEORequestCounterCacheResults;
  v6 = [(GEORequestCounterCacheResults *)&v16 init];
  if (v6)
  {
    string = xpc_dictionary_get_string(v5, "appId");
    if (string)
    {
      uint64_t v8 = [NSString stringWithUTF8String:string];
      appId = v6->_appId;
      v6->_appId = (NSString *)v8;
    }
    if (xpc_dictionary_get_double(v5, "startTime") != 0.0)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      startTime = v6->_startTime;
      v6->_startTime = (NSDate *)v10;
    }
    if (xpc_dictionary_get_double(v5, "endTime") != 0.0)
    {
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      endTime = v6->_endTime;
      v6->_endTime = (NSDate *)v12;
    }
    v6->_requestKindRaw = xpc_dictionary_get_int64(v5, "requestKindRaw");
    v6->_cacheHitCount = xpc_dictionary_get_int64(v5, "cacheHitCount");
    v6->_cacheMissCount = xpc_dictionary_get_int64(v5, "cacheMissCount");
    v6->_cacheExpiredCount = xpc_dictionary_get_int64(v5, "cacheExpiredCount");
    v14 = v6;
  }

  return v6;
}

- (void)encodeToXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  appId = self->_appId;
  if (appId)
  {
    id v5 = [(NSString *)appId UTF8String];
    if (v5) {
      xpc_dictionary_set_string(xdict, "appId", v5);
    }
  }
  startTime = self->_startTime;
  if (startTime)
  {
    [(NSDate *)startTime timeIntervalSinceReferenceDate];
    if (v7 != 0.0) {
      xpc_dictionary_set_double(xdict, "startTime", v7);
    }
  }
  endTime = self->_endTime;
  if (endTime)
  {
    [(NSDate *)endTime timeIntervalSinceReferenceDate];
    if (v9 != 0.0) {
      xpc_dictionary_set_double(xdict, "endTime", v9);
    }
  }
  xpc_dictionary_set_int64(xdict, "requestKindRaw", self->_requestKindRaw);
  xpc_dictionary_set_int64(xdict, "cacheHitCount", self->_cacheHitCount);
  xpc_dictionary_set_int64(xdict, "cacheMissCount", self->_cacheMissCount);
  xpc_dictionary_set_int64(xdict, "cacheExpiredCount", self->_cacheExpiredCount);
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (int)requestKindRaw
{
  return self->_requestKindRaw;
}

- (void)setRequestKindRaw:(int)a3
{
  self->_requestKindRaw = a3;
}

- (unsigned)cacheHitCount
{
  return self->_cacheHitCount;
}

- (void)setCacheHitCount:(unsigned int)a3
{
  self->_cacheHitCount = a3;
}

- (unsigned)cacheMissCount
{
  return self->_cacheMissCount;
}

- (void)setCacheMissCount:(unsigned int)a3
{
  self->_cacheMissCount = a3;
}

- (unsigned)cacheExpiredCount
{
  return self->_cacheExpiredCount;
}

- (void)setCacheExpiredCount:(unsigned int)a3
{
  self->_cacheExpiredCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

@end