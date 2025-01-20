@interface GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.fetchPairedDeviceSubscriptionsSummary" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest;
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
  v3.super_class = (Class)GEOMapSubscriptionFetchPairedDeviceSubscriptionsSummaryRequest;
  [(GEOXPCRequest *)&v3 encodeToXPCDictionary:a3];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

@end