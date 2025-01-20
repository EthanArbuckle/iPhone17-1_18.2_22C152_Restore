@interface GEOThrottlerIsSafeReply
- (BOOL)isValid;
- (GEODataRequestThrottlerToken)throttlerToken;
- (GEOThrottlerIsSafeReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (double)nextSafeRequestTime;
- (int)availableRequestCount;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setAvailableRequestCount:(int)a3;
- (void)setNextSafeRequestTime:(double)a3;
- (void)setThrottlerToken:(id)a3;
@end

@implementation GEOThrottlerIsSafeReply

- (GEOThrottlerIsSafeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOThrottlerIsSafeReply;
  v7 = [(GEOXPCReply *)&v15 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_nextSafeRequestTime = xpc_dictionary_get_double(v6, "nextSafeRequestTime");
    v7->_availableRequestCount = xpc_dictionary_get_int64(v6, "availableRequestCount");
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
  v7.super_class = (Class)GEOThrottlerIsSafeReply;
  [(GEOXPCReply *)&v7 encodeToXPCDictionary:v4];
  xpc_dictionary_set_double(v4, "nextSafeRequestTime", self->_nextSafeRequestTime);
  xpc_dictionary_set_int64(v4, "availableRequestCount", self->_availableRequestCount);
  throttlerToken = self->_throttlerToken;
  if (throttlerToken)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:throttlerToken requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "throttlerToken", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
}

- (BOOL)isValid
{
  return 1;
}

- (double)nextSafeRequestTime
{
  return self->_nextSafeRequestTime;
}

- (void)setNextSafeRequestTime:(double)a3
{
  self->_nextSafeRequestTime = a3;
}

- (int)availableRequestCount
{
  return self->_availableRequestCount;
}

- (void)setAvailableRequestCount:(int)a3
{
  self->_availableRequestCount = a3;
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