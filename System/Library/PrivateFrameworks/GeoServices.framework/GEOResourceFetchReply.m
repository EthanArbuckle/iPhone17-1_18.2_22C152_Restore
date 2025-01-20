@interface GEOResourceFetchReply
- (BOOL)isValid;
- (GEOResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)names;
- (NSArray)paths;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setNames:(id)a3;
- (void)setPaths:(id)a3;
@end

@implementation GEOResourceFetchReply

- (BOOL)isValid
{
  return 1;
}

- (GEOResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)GEOResourceFetchReply;
  v7 = [(GEOXPCReply *)&v27 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_array(v6, "names");
    size_t count = xpc_array_get_count(v8);
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        string = xpc_array_get_string(v8, i);
        if (string)
        {
          v13 = [NSString stringWithUTF8String:string];
          [v10 addObject:v13];
        }
      }
    }
    uint64_t v14 = [v10 count];
    if (v14) {
      v15 = (void *)[v10 copy];
    }
    else {
      v15 = 0;
    }
    objc_storeStrong((id *)&v7->_names, v15);
    if (v14) {

    }
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "paths", &length);
    if (data)
    {
      v17 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      v18 = (void *)MEMORY[0x1E4F28DC0];
      v19 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
      uint64_t v22 = [v18 unarchivedObjectOfClasses:v21 fromData:v17 error:a4];
      paths = v7->_paths;
      v7->_paths = (NSArray *)v22;
    }
    v24 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOResourceFetchReply;
  [(GEOXPCReply *)&v18 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_names count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_names;
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
          id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
          v12 = (const char *)objc_msgSend(v11, "UTF8String", (void)v14);
          if (v12) {
            xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "names", v5);
    }
  }
  if ([(NSArray *)self->_paths count])
  {
    id v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self->_paths requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "paths", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  }
}

- (NSArray)names
{
  return self->_names;
}

- (NSArray)paths
{
  return self->_paths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

- (void)setPaths:(id)a3
{
}

- (void)setNames:(id)a3
{
}

@end