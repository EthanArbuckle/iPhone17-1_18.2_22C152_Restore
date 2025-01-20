@interface GEORequestCounterCacheGetResults
+ (Class)replyClass;
- (BOOL)isValid;
- (GEORequestCounterCacheGetResults)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEORequestCounterCacheGetResults)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)appId;
- (int)requestKindRaw;
- (unint64_t)mode;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAppId:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setRequestKindRaw:(int)a3;
- (void)setStartTime:(id)a3;
@end

@implementation GEORequestCounterCacheGetResults

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEORequestCounterCacheGetResults)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"requestCounter.getCacheResults" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEORequestCounterCacheGetResults)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEORequestCounterCacheGetResults;
  v7 = [(GEOXPCRequest *)&v17 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_mode = xpc_dictionary_get_int64(v6, "mode");
    string = xpc_dictionary_get_string(v6, "appId");
    if (string)
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      appId = v7->_appId;
      v7->_appId = (NSString *)v9;
    }
    if (xpc_dictionary_get_double(v6, "startTime") != 0.0)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      startTime = v7->_startTime;
      v7->_startTime = (NSDate *)v11;
    }
    if (xpc_dictionary_get_double(v6, "endTime") != 0.0)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      endTime = v7->_endTime;
      v7->_endTime = (NSDate *)v13;
    }
    v7->_requestKindRaw = xpc_dictionary_get_int64(v6, "requestKindRaw");
    v15 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEORequestCounterCacheGetResults;
  [(GEOXPCRequest *)&v11 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "mode", self->_mode);
  appId = self->_appId;
  if (appId)
  {
    id v6 = [(NSString *)appId UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "appId", v6);
    }
  }
  startTime = self->_startTime;
  if (startTime)
  {
    [(NSDate *)startTime timeIntervalSinceReferenceDate];
    if (v8 != 0.0) {
      xpc_dictionary_set_double(v4, "startTime", v8);
    }
  }
  endTime = self->_endTime;
  if (endTime)
  {
    [(NSDate *)endTime timeIntervalSinceReferenceDate];
    if (v10 != 0.0) {
      xpc_dictionary_set_double(v4, "endTime", v10);
    }
  }
  xpc_dictionary_set_int64(v4, "requestKindRaw", self->_requestKindRaw);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

@end