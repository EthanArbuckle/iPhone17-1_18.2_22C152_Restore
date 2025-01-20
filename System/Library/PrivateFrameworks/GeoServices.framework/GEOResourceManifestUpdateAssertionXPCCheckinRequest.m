@interface GEOResourceManifestUpdateAssertionXPCCheckinRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)reason;
- (double)timestamp;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation GEOResourceManifestUpdateAssertionXPCCheckinRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"resourcemanifestupdateassertion.checkinForUpdateAssertion" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOResourceManifestUpdateAssertionXPCCheckinRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "reason");
    if (string)
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      reason = v7->_reason;
      v7->_reason = (NSString *)v9;
    }
    v7->_timestamp = xpc_dictionary_get_double(v6, "timestamp");
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestUpdateAssertionXPCCheckinRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  reason = self->_reason;
  if (reason)
  {
    id v6 = [(NSString *)reason UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "reason", v6);
    }
  }
  xpc_dictionary_set_double(v4, "timestamp", self->_timestamp);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end