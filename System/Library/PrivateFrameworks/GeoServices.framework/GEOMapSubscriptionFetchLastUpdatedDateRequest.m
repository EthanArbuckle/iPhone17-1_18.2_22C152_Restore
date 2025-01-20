@interface GEOMapSubscriptionFetchLastUpdatedDateRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (BOOL)onPairedDevice;
- (GEOMapSubscriptionFetchLastUpdatedDateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionFetchLastUpdatedDateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setOnPairedDevice:(BOOL)a3;
@end

@implementation GEOMapSubscriptionFetchLastUpdatedDateRequest

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionFetchLastUpdatedDateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_onPairedDevice = xpc_dictionary_get_BOOL(v6, "onPairedDevice");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionFetchLastUpdatedDateRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "onPairedDevice", self->_onPairedDevice);
}

- (void)setOnPairedDevice:(BOOL)a3
{
  self->_onPairedDevice = a3;
}

- (GEOMapSubscriptionFetchLastUpdatedDateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.fetchLastUpdatedDateForOfflineSubscriptions" traits:a3 auditToken:a4 throttleToken:a5];
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (BOOL)onPairedDevice
{
  return self->_onPairedDevice;
}

@end