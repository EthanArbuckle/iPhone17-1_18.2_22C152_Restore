@interface GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSUUID)deviceIdentifier;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
@end

@implementation GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.fetchSubscriptionsForSyncToWatch" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "deviceIdentifier");
    if (uuid)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      deviceIdentifier = v7->_deviceIdentifier;
      v7->_deviceIdentifier = (NSUUID *)v9;
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
  v6.super_class = (Class)GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest;
  [(GEOXPCRequest *)&v6 encodeToXPCDictionary:v4];
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    *(void *)uuid = 0;
    uint64_t v8 = 0;
    [(NSUUID *)deviceIdentifier getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v4, "deviceIdentifier", uuid);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end