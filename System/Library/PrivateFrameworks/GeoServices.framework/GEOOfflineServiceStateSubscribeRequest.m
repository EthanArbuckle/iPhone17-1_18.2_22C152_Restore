@interface GEOOfflineServiceStateSubscribeRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (BOOL)subscribe;
- (GEOOfflineServiceStateSubscribeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOOfflineServiceStateSubscribeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSubscribe:(BOOL)a3;
@end

@implementation GEOOfflineServiceStateSubscribeRequest

- (BOOL)isValid
{
  return 1;
}

- (GEOOfflineServiceStateSubscribeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceStateSubscribeRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_subscribe = xpc_dictionary_get_BOOL(v6, "subscribe");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceStateSubscribeRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "subscribe", self->_subscribe);
}

- (void)setSubscribe:(BOOL)a3
{
  self->_subscribe = a3;
}

- (GEOOfflineServiceStateSubscribeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"offlinestate.subscribe" traits:a3 auditToken:a4 throttleToken:a5];
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (BOOL)subscribe
{
  return self->_subscribe;
}

@end