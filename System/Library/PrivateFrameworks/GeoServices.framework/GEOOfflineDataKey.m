@interface GEOOfflineDataKey
- (BOOL)isEqual:(id)a3;
- (GEOOfflineDataKey)initWithLayer:(unsigned int)a3 serviceKey:(id)a4;
- (GEOOfflineDataKey)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)serviceKey;
- (NSString)description;
- (unint64_t)hash;
- (unsigned)layer;
- (void)encodeToXPCDictionary:(id)a3;
@end

@implementation GEOOfflineDataKey

- (GEOOfflineDataKey)initWithLayer:(unsigned int)a3 serviceKey:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GEOOfflineDataKey;
  v7 = [(GEOOfflineDataKey *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_layer = a3;
    uint64_t v9 = [v6 copy];
    serviceKey = v8->_serviceKey;
    v8->_serviceKey = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

- (GEOOfflineDataKey)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = xpc_dictionary_get_value(v5, "layer");
  v7 = xpc_dictionary_get_value(v5, "service_key");

  if (v6
    && (MEMORY[0x18C1213B0](v6) == MEMORY[0x1E4F145F8] ? (BOOL v8 = v7 == 0) : (BOOL v8 = 1),
        !v8
     && MEMORY[0x18C1213B0](v7) == MEMORY[0x1E4F14580]
     && (v14.receiver = self,
         v14.super_class = (Class)GEOOfflineDataKey,
         (self = [(GEOOfflineDataKey *)&v14 init]) != 0)))
  {
    self->_layer = xpc_uint64_get_value(v6);
    bytes_ptr = xpc_data_get_bytes_ptr(v7);
    v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:bytes_ptr length:xpc_data_get_length(v7)];
    serviceKey = self->_serviceKey;
    self->_serviceKey = v10;

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t layer = self->_layer;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_uint64(xdict, "layer", layer);
  xpc_dictionary_set_data(xdict, "service_key", [(NSData *)self->_serviceKey bytes], [(NSData *)self->_serviceKey length]);
}

- (unint64_t)hash
{
  uint64_t layer = self->_layer;
  return [(NSData *)self->_serviceKey hash] ^ layer;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int layer = self->_layer;
    if (layer == [v5 layer])
    {
      serviceKey = self->_serviceKey;
      BOOL v8 = [v5 serviceKey];
      BOOL v9 = [(NSData *)serviceKey isEqualToData:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = [(NSData *)self->_serviceKey base64EncodedStringWithOptions:0];
  id v4 = [NSString stringWithFormat:@"{ layer: %llu, serviceKey: %@ }", self->_layer, v3];

  return (NSString *)v4;
}

- (unsigned)layer
{
  return self->_layer;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (void).cxx_destruct
{
}

@end