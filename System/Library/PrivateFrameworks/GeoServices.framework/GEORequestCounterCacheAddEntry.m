@interface GEORequestCounterCacheAddEntry
+ (Class)replyClass;
- (BOOL)isValid;
- (GEORequestCounterCacheAddEntry)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEORequestCounterCacheAddEntry)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)timestamp;
- (NSString)appId;
- (int)requestKindRaw;
- (unint64_t)reply;
- (unsigned)result;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAppId:(id)a3;
- (void)setRequestKindRaw:(int)a3;
- (void)setResult:(unsigned __int8)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation GEORequestCounterCacheAddEntry

+ (Class)replyClass
{
  return 0;
}

- (GEORequestCounterCacheAddEntry)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"requestCounter.addCacheResult" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEORequestCounterCacheAddEntry)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEORequestCounterCacheAddEntry;
  v7 = [(GEOXPCRequest *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "appId");
    if (string)
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      appId = v7->_appId;
      v7->_appId = (NSString *)v9;
    }
    if (xpc_dictionary_get_double(v6, "timestamp") != 0.0)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      timestamp = v7->_timestamp;
      v7->_timestamp = (NSDate *)v11;
    }
    v7->_requestKindRaw = xpc_dictionary_get_int64(v6, "requestKindRaw");
    v7->_result = xpc_dictionary_get_int64(v6, "result");
    v13 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORequestCounterCacheAddEntry;
  [(GEOXPCRequest *)&v9 encodeToXPCDictionary:v4];
  appId = self->_appId;
  if (appId)
  {
    id v6 = [(NSString *)appId UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "appId", v6);
    }
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    [(NSDate *)timestamp timeIntervalSinceReferenceDate];
    if (v8 != 0.0) {
      xpc_dictionary_set_double(v4, "timestamp", v8);
    }
  }
  xpc_dictionary_set_int64(v4, "requestKindRaw", self->_requestKindRaw);
  xpc_dictionary_set_int64(v4, "result", self->_result);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
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

- (unsigned)result
{
  return self->_result;
}

- (void)setResult:(unsigned __int8)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

@end