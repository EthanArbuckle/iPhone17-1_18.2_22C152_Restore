@interface GEOMapSubscriptionForceUpdateRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionForceUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionForceUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)dataTypes;
- (unint64_t)downloadMode;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDataTypes:(unint64_t)a3;
- (void)setDownloadMode:(unint64_t)a3;
@end

@implementation GEOMapSubscriptionForceUpdateRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOMapSubscriptionForceUpdateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.forceUpdateUserInitiatedSubscriptions" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionForceUpdateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionForceUpdateRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
    v7->_downloadMode = xpc_dictionary_get_int64(v6, "downloadMode");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionForceUpdateRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  xpc_dictionary_set_int64(v4, "downloadMode", self->_downloadMode);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (unint64_t)downloadMode
{
  return self->_downloadMode;
}

- (void)setDownloadMode:(unint64_t)a3
{
  self->_downloadMode = a3;
}

@end