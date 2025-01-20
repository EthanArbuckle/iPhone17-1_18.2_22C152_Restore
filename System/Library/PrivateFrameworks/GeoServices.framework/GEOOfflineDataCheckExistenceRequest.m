@interface GEOOfflineDataCheckExistenceRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (BOOL)sync;
- (GEOOfflineDataCheckExistenceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOOfflineDataCheckExistenceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOOfflineDataKey)key;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setKey:(id)a3;
- (void)setSync:(BOOL)a3;
@end

@implementation GEOOfflineDataCheckExistenceRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineDataCheckExistenceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"offlinedata.checkExistence" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOOfflineDataCheckExistenceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOOfflineDataCheckExistenceRequest;
  v7 = [(GEOXPCRequest *)&v12 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "key");
    if (v8)
    {
      v9 = [[GEOOfflineDataKey alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_key, v9);
      }
    }
    v7->_sync = xpc_dictionary_get_BOOL(v6, "sync");
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOOfflineDataCheckExistenceRequest;
  [(GEOXPCRequest *)&v6 encodeToXPCDictionary:v4];
  if (self->_key)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOOfflineDataKey *)self->_key encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(v4, "key", empty);
  }
  xpc_dictionary_set_BOOL(v4, "sync", self->_sync);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (GEOOfflineDataKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (void).cxx_destruct
{
}

@end