@interface GEOMapSubscriptionAddRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapRegion)region;
- (GEOMapSubscriptionAddRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionAddRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSDate)expirationDate;
- (NSString)displayName;
- (NSString)identifier;
- (unint64_t)dataTypes;
- (unint64_t)policy;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDataTypes:(unint64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPolicy:(unint64_t)a3;
- (void)setRegion:(id)a3;
@end

@implementation GEOMapSubscriptionAddRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionAddRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.addSubscription" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionAddRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOMapSubscriptionAddRequest;
  v7 = [(GEOXPCRequest *)&v24 initWithXPCDictionary:v6 error:a4];
  if (!v7) {
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v6, "identifier");
  if (string)
  {
    uint64_t v9 = [NSString stringWithUTF8String:string];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;
  }
  v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
  v7->_policy = xpc_dictionary_get_int64(v6, "policy");
  size_t length = 0;
  data = xpc_dictionary_get_data(v6, "region", &length);
  if (data)
  {
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
    v13 = [[GEOMapRegion alloc] initWithData:v12];
  }
  else
  {
    uint64_t v22 = xpc_dictionary_get_value(v6, "region");
    v12 = (void *)v22;
    if (!v22 || MEMORY[0x18C1213B0](v22) != MEMORY[0x1E4F14580]) {
      goto LABEL_7;
    }
    v13 = objc_alloc_init(GEOMapRegion);
  }
  region = v7->_region;
  v7->_region = v13;

LABEL_7:
  v15 = xpc_dictionary_get_string(v6, "displayName");
  if (v15)
  {
    uint64_t v16 = [NSString stringWithUTF8String:v15];
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v16;
  }
  if (xpc_dictionary_get_double(v6, "expirationDate") != 0.0)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v18;
  }
  v20 = v7;
LABEL_12:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionAddRequest;
  [(GEOXPCRequest *)&v13 encodeToXPCDictionary:v4];
  identifier = self->_identifier;
  if (identifier)
  {
    id v6 = [(NSString *)identifier UTF8String];
    if (v6) {
      xpc_dictionary_set_string(v4, "identifier", v6);
    }
  }
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  xpc_dictionary_set_int64(v4, "policy", self->_policy);
  region = self->_region;
  if (region)
  {
    id v8 = [(GEOMapRegion *)region data];
    xpc_dictionary_set_data(v4, "region", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
  displayName = self->_displayName;
  if (displayName)
  {
    v10 = [(NSString *)displayName UTF8String];
    if (v10) {
      xpc_dictionary_set_string(v4, "displayName", v10);
    }
  }
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    [(NSDate *)expirationDate timeIntervalSinceReferenceDate];
    if (v12 != 0.0) {
      xpc_dictionary_set_double(v4, "expirationDate", v12);
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

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_region, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end