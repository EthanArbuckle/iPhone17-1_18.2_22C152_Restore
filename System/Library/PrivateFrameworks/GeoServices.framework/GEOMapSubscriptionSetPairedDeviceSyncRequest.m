@interface GEOMapSubscriptionSetPairedDeviceSyncRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (BOOL)shouldSync;
- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShouldSync:(BOOL)a3;
@end

@implementation GEOMapSubscriptionSetPairedDeviceSyncRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.setPairedDeviceSyncBehavior" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionSetPairedDeviceSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSyncRequest;
  v7 = [(GEOXPCRequest *)&v13 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "identifier");
    if (string)
    {
      uint64_t v9 = [NSString stringWithUTF8String:string];
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v9;
    }
    v7->_shouldSync = xpc_dictionary_get_BOOL(v6, "shouldSync");
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionSetPairedDeviceSyncRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  identifier = self->_identifier;
  if (identifier)
  {
    id v6 = [(NSString *)identifier UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "identifier", v6);
    }
  }
  xpc_dictionary_set_BOOL(v4, "shouldSync", self->_shouldSync);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)shouldSync
{
  return self->_shouldSync;
}

- (void)setShouldSync:(BOOL)a3
{
  self->_shouldSync = a3;
}

- (void).cxx_destruct
{
}

@end