@interface GEOThrottlerIsSafeRequest
+ (Class)replyClass;
- (BOOL)availableRequestCount;
- (BOOL)includeToken;
- (BOOL)isValid;
- (BOOL)nextSafeRequestTime;
- (GEODataRequestThrottlerToken)throttlerToken;
- (GEOThrottlerIsSafeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOThrottlerIsSafeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (int)requestKindSubtype;
- (int)requestKindType;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAvailableRequestCount:(BOOL)a3;
- (void)setIncludeToken:(BOOL)a3;
- (void)setNextSafeRequestTime:(BOOL)a3;
- (void)setRequestKindSubtype:(int)a3;
- (void)setRequestKindType:(int)a3;
- (void)setThrottlerToken:(id)a3;
@end

@implementation GEOThrottlerIsSafeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOThrottlerIsSafeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"throttler.isSafe" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOThrottlerIsSafeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOThrottlerIsSafeRequest;
  v7 = [(GEOXPCRequest *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_requestKindType = xpc_dictionary_get_int64(v6, "requestKindType");
    v7->_requestKindSubtype = xpc_dictionary_get_int64(v6, "requestKindSubtype");
    v7->_nextSafeRequestTime = xpc_dictionary_get_BOOL(v6, "nextSafeRequestTime");
    v7->_availableRequestCount = xpc_dictionary_get_BOOL(v6, "availableRequestCount");
    v7->_includeToken = xpc_dictionary_get_BOOL(v6, "includeToken");
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "throttlerToken", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      throttlerToken = v7->_throttlerToken;
      v7->_throttlerToken = (GEODataRequestThrottlerToken *)v10;
    }
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOThrottlerIsSafeRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "requestKindType", self->_requestKindType);
  xpc_dictionary_set_int64(v4, "requestKindSubtype", self->_requestKindSubtype);
  xpc_dictionary_set_BOOL(v4, "nextSafeRequestTime", self->_nextSafeRequestTime);
  xpc_dictionary_set_BOOL(v4, "availableRequestCount", self->_availableRequestCount);
  xpc_dictionary_set_BOOL(v4, "includeToken", self->_includeToken);
  throttlerToken = self->_throttlerToken;
  if (throttlerToken)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:throttlerToken requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "throttlerToken", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  if (!self->_requestKindType) {
    return 0;
  }
  if (self->_includeToken || self->_nextSafeRequestTime) {
    return 1;
  }
  return self->_availableRequestCount;
}

- (unint64_t)reply
{
  return 1;
}

- (int)requestKindType
{
  return self->_requestKindType;
}

- (void)setRequestKindType:(int)a3
{
  self->_requestKindType = a3;
}

- (int)requestKindSubtype
{
  return self->_requestKindSubtype;
}

- (void)setRequestKindSubtype:(int)a3
{
  self->_requestKindSubtype = a3;
}

- (BOOL)nextSafeRequestTime
{
  return self->_nextSafeRequestTime;
}

- (void)setNextSafeRequestTime:(BOOL)a3
{
  self->_nextSafeRequestTime = a3;
}

- (BOOL)availableRequestCount
{
  return self->_availableRequestCount;
}

- (void)setAvailableRequestCount:(BOOL)a3
{
  self->_availableRequestCount = a3;
}

- (BOOL)includeToken
{
  return self->_includeToken;
}

- (void)setIncludeToken:(BOOL)a3
{
  self->_includeToken = a3;
}

- (GEODataRequestThrottlerToken)throttlerToken
{
  return self->_throttlerToken;
}

- (void)setThrottlerToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end