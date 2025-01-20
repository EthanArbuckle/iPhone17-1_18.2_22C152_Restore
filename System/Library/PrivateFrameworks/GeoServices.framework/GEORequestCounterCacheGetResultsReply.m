@interface GEORequestCounterCacheGetResultsReply
- (BOOL)isValid;
- (GEORequestCounterCacheGetResultsReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSArray)results;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation GEORequestCounterCacheGetResultsReply

- (GEORequestCounterCacheGetResultsReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORequestCounterCacheGetResultsReply;
  v7 = [(GEOXPCReply *)&v18 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v8 = xpc_dictionary_get_array(v6, "results");
    size_t count = xpc_array_get_count(v8);
    v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:count];
    if (count)
    {
      for (size_t i = 0; i != count; ++i)
      {
        v12 = xpc_array_get_dictionary(v8, i);
        if (v12)
        {
          v13 = [[GEORequestCounterCacheResults alloc] initWithXPCDictionary:v12 error:a4];
          if (v13) {
            [v10 addObject:v13];
          }
        }
      }
    }
    uint64_t v14 = [v10 count];
    if (v14) {
      v15 = (void *)[v10 copy];
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v7->_results, v15);
    if (v14) {

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEORequestCounterCacheGetResultsReply;
  [(GEOXPCReply *)&v17 encodeToXPCDictionary:v4];
  if ([(NSArray *)self->_results count])
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = self->_results;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          xpc_object_t empty = xpc_dictionary_create_empty();
          objc_msgSend(v11, "encodeToXPCDictionary:", empty, (void)v13);
          xpc_array_set_value(v5, 0xFFFFFFFFFFFFFFFFLL, empty);

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }

    if (xpc_array_get_count(v5)) {
      xpc_dictionary_set_value(v4, "results", v5);
    }
  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end