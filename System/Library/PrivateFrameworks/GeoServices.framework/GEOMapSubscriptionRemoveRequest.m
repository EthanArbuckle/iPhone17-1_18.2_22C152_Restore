@interface GEOMapSubscriptionRemoveRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapSubscriptionRemoveRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionRemoveRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation GEOMapSubscriptionRemoveRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionRemoveRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.removeSubscription" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionRemoveRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionRemoveRequest;
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
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionRemoveRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  identifier = self->_identifier;
  if (identifier)
  {
    id v6 = [(NSString *)identifier UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "identifier", v6);
    }
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end