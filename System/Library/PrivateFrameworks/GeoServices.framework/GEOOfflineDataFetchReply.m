@interface GEOOfflineDataFetchReply
- (BOOL)isValid;
- (GEOOfflineDataFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOTileData)data;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setData:(id)a3;
@end

@implementation GEOOfflineDataFetchReply

- (GEOOfflineDataFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOOfflineDataFetchReply;
  v7 = [(GEOXPCReply *)&v12 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "data");
    if (v8)
    {
      v9 = [[GEOTileData alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_data, v9);
      }
    }
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOOfflineDataFetchReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if (self->_data)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOTileData *)self->_data encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(v4, "data", empty);
  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOTileData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end