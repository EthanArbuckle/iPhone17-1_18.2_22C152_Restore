@interface GEOOfflineVersionMetadata
- (BOOL)isEqual:(id)a3;
- (GEOOfflineVersionMetadata)initWithDataConfiguration:(id)a3;
- (GEOOfflineVersionMetadata)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeToXPCDictionary:(id)a3;
- (void)enumerateLayerVersions:(id)a3;
@end

@implementation GEOOfflineVersionMetadata

- (GEOOfflineVersionMetadata)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOOfflineVersionMetadata;
  v6 = [(GEOOfflineVersionMetadata *)&v21 init];
  if (v6)
  {
    v7 = xpc_dictionary_get_array(v5, "active_versions");
    v8 = v7;
    if (v7)
    {
      id v20 = v5;
      size_t count = xpc_array_get_count(v7);
      v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:count];
      if (count)
      {
        for (size_t i = 0; i != count; ++i)
        {
          v12 = xpc_array_get_dictionary(v8, i);
          v13 = v12;
          if (v12)
          {
            uint64_t uint64 = xpc_dictionary_get_uint64(v12, "layer");
            v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v13, "version"));
            v16 = [NSNumber numberWithUnsignedLongLong:uint64];
            [(NSDictionary *)v10 setObject:v15 forKeyedSubscript:v16];
          }
        }
      }
      activeVersions = v6->_activeVersions;
      v6->_activeVersions = v10;

      v18 = v6;
      id v5 = v20;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_array_create(0, 0);
  activeVersions = self->_activeVersions;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__GEOOfflineVersionMetadata_encodeToXPCDictionary___block_invoke;
  v8[3] = &unk_1E53EA498;
  id v9 = v5;
  id v7 = v5;
  [(NSDictionary *)activeVersions enumerateKeysAndObjectsUsingBlock:v8];
  xpc_dictionary_set_value(v4, "active_versions", v7);
}

- (void).cxx_destruct
{
}

- (GEOOfflineVersionMetadata)initWithDataConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOOfflineVersionMetadata;
  xpc_object_t v5 = [(GEOOfflineVersionMetadata *)&v11 init];
  if (v5)
  {
    v6 = [v4 activeVersions];
    uint64_t v7 = [v6 copy];
    activeVersions = v5->_activeVersions;
    v5->_activeVersions = (NSDictionary *)v7;

    id v9 = v5;
  }

  return v5;
}

- (void)enumerateLayerVersions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  xpc_object_t v5 = [(NSDictionary *)self->_activeVersions allKeys];
  v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "unsignedIntValue", (void)v16);
        v14 = [(NSDictionary *)self->_activeVersions objectForKeyedSubscript:v12];
        uint64_t v15 = [v14 unsignedLongLongValue];

        v4[2](v4, v13, v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

void __51__GEOOfflineVersionMetadata_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  uint64_t v7 = [v6 unsignedLongLongValue];

  xpc_dictionary_set_uint64(xdict, "layer", v7);
  uint64_t v8 = [v5 unsignedLongLongValue];

  xpc_dictionary_set_uint64(xdict, "version", v8);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), xdict);
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_activeVersions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4[1] isEqualToDictionary:self->_activeVersions];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end