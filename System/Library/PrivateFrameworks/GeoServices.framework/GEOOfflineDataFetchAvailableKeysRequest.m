@interface GEOOfflineDataFetchAvailableKeysRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOOfflineDataFetchAvailableKeysRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOOfflineDataFetchAvailableKeysRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)reply;
- (unsigned)layer;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setLayer:(unsigned int)a3;
@end

@implementation GEOOfflineDataFetchAvailableKeysRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineDataFetchAvailableKeysRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"offlinedata.fetchAvailableKeys" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOOfflineDataFetchAvailableKeysRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineDataFetchAvailableKeysRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_layer = xpc_dictionary_get_int64(v6, "layer");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineDataFetchAvailableKeysRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "layer", self->_layer);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unsigned)layer
{
  return self->_layer;
}

- (void)setLayer:(unsigned int)a3
{
  self->_layer = a3;
}

@end