@interface GEOOfflineVersionMetadataFetchReply
- (BOOL)isValid;
- (GEOOfflineVersionMetadata)metadata;
- (GEOOfflineVersionMetadataFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation GEOOfflineVersionMetadataFetchReply

- (BOOL)isValid
{
  return 1;
}

- (GEOOfflineVersionMetadataFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOOfflineVersionMetadataFetchReply;
  v7 = [(GEOXPCReply *)&v12 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_dictionary(v6, "metadata");
    if (v8)
    {
      v9 = [[GEOOfflineVersionMetadata alloc] initWithXPCDictionary:v8 error:a4];
      if (v9) {
        objc_storeStrong((id *)&v7->_metadata, v9);
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
  v6.super_class = (Class)GEOOfflineVersionMetadataFetchReply;
  [(GEOXPCReply *)&v6 encodeToXPCDictionary:v4];
  if (self->_metadata)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [(GEOOfflineVersionMetadata *)self->_metadata encodeToXPCDictionary:empty];
    xpc_dictionary_set_value(v4, "metadata", empty);
  }
}

- (void).cxx_destruct
{
}

- (GEOOfflineVersionMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

@end