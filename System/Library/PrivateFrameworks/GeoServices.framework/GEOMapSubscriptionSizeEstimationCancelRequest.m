@interface GEOMapSubscriptionSizeEstimationCancelRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionSizeEstimationCancelRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionSizeEstimationCancelRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)requestUUID;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation GEOMapSubscriptionSizeEstimationCancelRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOMapSubscriptionSizeEstimationCancelRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.cancelEstimatedSizeRequest" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionSizeEstimationCancelRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionSizeEstimationCancelRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
    if (uuid)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      requestUUID = v7->_requestUUID;
      v7->_requestUUID = (NSUUID *)v9;
    }
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOMapSubscriptionSizeEstimationCancelRequest;
  [(GEOXPCRequest *)&v6 encodeToXPCDictionary:v4];
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(void *)uuid = 0;
    uint64_t v8 = 0;
    [(NSUUID *)requestUUID getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end