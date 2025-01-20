@interface GEOMapSubscriptionContainmentRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMapRegion)region;
- (GEOMapSubscriptionContainmentRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMapSubscriptionContainmentRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)dataTypes;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setDataTypes:(unint64_t)a3;
- (void)setRegion:(id)a3;
@end

@implementation GEOMapSubscriptionContainmentRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionContainmentRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"subscriptions.checkContainmentForRegion" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMapSubscriptionContainmentRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapSubscriptionContainmentRequest;
  v7 = [(GEOXPCRequest *)&v16 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "region", &length);
    if (data)
    {
      v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
      v10 = [[GEOMapRegion alloc] initWithData:v9];
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v6, "region");
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18C1213B0](v14) != MEMORY[0x1E4F14580]) {
        goto LABEL_5;
      }
      v10 = objc_alloc_init(GEOMapRegion);
    }
    region = v7->_region;
    v7->_region = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionContainmentRequest;
  [(GEOXPCRequest *)&v7 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  region = self->_region;
  if (region)
  {
    id v6 = [(GEOMapRegion *)region data];
    xpc_dictionary_set_data(v4, "region", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
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

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end