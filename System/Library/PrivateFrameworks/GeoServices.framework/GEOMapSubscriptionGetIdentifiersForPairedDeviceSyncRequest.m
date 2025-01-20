@interface GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest

- (BOOL)isValid
{
  return 1;
}

- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest;
  v4 = [(GEOXPCRequest *)&v8 initWithXPCDictionary:a3 error:a4];
  v5 = v4;
  if (v4) {
    v6 = v4;
  }

  return v5;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest;
  [(GEOXPCRequest *)&v3 encodeToXPCDictionary:a3];
}

- (GEOMapSubscriptionGetIdentifiersForPairedDeviceSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.fetchIdentifiersForSyncToPairedDevice" traits:a3 auditToken:a4 throttleToken:a5];
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

@end