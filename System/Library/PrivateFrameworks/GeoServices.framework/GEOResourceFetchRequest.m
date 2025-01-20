@interface GEOResourceFetchRequest
+ (Class)replyClass;
- (BOOL)force;
- (BOOL)isValid;
- (BOOL)unpack;
- (GEOResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (GEOResourceManifestConfiguration)manifestConfiguration;
- (NSArray)resources;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setForce:(BOOL)a3;
- (void)setManifestConfiguration:(id)a3;
- (void)setResources:(id)a3;
- (void)setUnpack:(BOOL)a3;
@end

@implementation GEOResourceFetchRequest

- (BOOL)isValid
{
  return 1;
}

- (GEOResourceFetchRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEOResourceFetchRequest;
  v7 = [(GEOXPCRequest *)&v28 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v25 = a4;
    v8 = xpc_dictionary_get_array(v6, "resources");
    size_t count = xpc_array_get_count(v8);
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; count != i; ++i)
      {
        size_t length = 0;
        data = xpc_array_get_data(v8, i, &length);
        if (data)
        {
          v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
          v14 = [[GEOResource alloc] initWithData:v13];
        }
        else
        {
          uint64_t v16 = xpc_array_get_value(v8, i);
          v13 = (void *)v16;
          if (!v16 || MEMORY[0x18C1213B0](v16) != MEMORY[0x1E4F14580]) {
            goto LABEL_7;
          }
          v14 = objc_alloc_init(GEOResource);
        }
        v15 = v14;
        objc_msgSend(v10, "addObject:", v14, v25);

LABEL_7:
      }
    }
    uint64_t v17 = objc_msgSend(v10, "count", v25);
    if (v17) {
      v18 = (void *)[v10 copy];
    }
    else {
      v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_resources, v18);
    if (v17) {

    }
    size_t length = 0;
    v19 = xpc_dictionary_get_data(v6, "manifestConfiguration", &length);
    if (v19)
    {
      v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v19 length:length freeWhenDone:0];
      uint64_t v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v20 error:v26];
      manifestConfiguration = v7->_manifestConfiguration;
      v7->_manifestConfiguration = (GEOResourceManifestConfiguration *)v21;
    }
    v7->_force = xpc_dictionary_get_BOOL(v6, "force");
    v7->_unpack = xpc_dictionary_get_BOOL(v6, "unpack");
    v23 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOResourceFetchRequest;
  [(GEOXPCRequest *)&v18 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_resources count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_resources;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "data", (void)v14);
          id v11 = objc_claimAutoreleasedReturnValue();
          xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, (const void *)[v11 bytes], objc_msgSend(v11, "length"));

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "resources", v5);
    }
  }
  manifestConfiguration = self->_manifestConfiguration;
  if (manifestConfiguration)
  {
    id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:manifestConfiguration requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "manifestConfiguration", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  }
  xpc_dictionary_set_BOOL(v4, "force", self->_force);
  xpc_dictionary_set_BOOL(v4, "unpack", self->_unpack);
}

- (unint64_t)reply
{
  return 1;
}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (NSArray)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_storeStrong((id *)&self->_resources, 0);
}

- (BOOL)unpack
{
  return self->_unpack;
}

- (GEOResourceManifestConfiguration)manifestConfiguration
{
  return self->_manifestConfiguration;
}

- (BOOL)force
{
  return self->_force;
}

- (void)setUnpack:(BOOL)a3
{
  self->_unpack = a3;
}

- (void)setResources:(id)a3
{
}

- (void)setManifestConfiguration:(id)a3
{
}

- (void)setForce:(BOOL)a3
{
  self->_force = a3;
}

- (GEOResourceFetchRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"resources.fetch" traits:a3 auditToken:a4 throttleToken:a5];
}

@end